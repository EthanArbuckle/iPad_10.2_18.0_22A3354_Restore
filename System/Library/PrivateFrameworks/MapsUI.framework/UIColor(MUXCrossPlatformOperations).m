@implementation UIColor(MUXCrossPlatformOperations)

+ (id)_mapsui_colorNamed:()MUXCrossPlatformOperations
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "_mapsuiBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)_mapsui_accentColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_tintColor");
}

@end
