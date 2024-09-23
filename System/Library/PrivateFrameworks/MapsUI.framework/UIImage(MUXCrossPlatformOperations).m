@implementation UIImage(MUXCrossPlatformOperations)

+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
}

+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:");
}

+ (id)_mapsui_customSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "_mapsuiBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:withConfiguration:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_mapsui_resolvedSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_customSymbolImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:withConfiguration:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
