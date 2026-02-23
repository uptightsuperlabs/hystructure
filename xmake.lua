local _packages, packages = {}, {};

do
    for package, config in pairs(packages) do
        add_requires(package, {
            configs = config or {};
            plat = "windows";
            arch = "x64";
        })

        table.insert(_packages, package);
    end
end

function load_packages()
    add_packages(table.unpack(_packages));
end

add_rules("mode.debug", "mode.release");
set_languages("c++20");

target("hystructure") do 
    set_kind("binary");
    add_files("src/*.cpp");
    load_packages();
end 