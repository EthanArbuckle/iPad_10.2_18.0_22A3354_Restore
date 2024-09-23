@implementation UIButton(MUXCrossPlatformOperations)

+ (id)_mapsui_sectionButton
{
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", MapKitIdiomIsMacCatalyst() ^ 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_mapsui_sectionHeaderButton
{
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", MapKitIdiomIsMacCatalyst() ^ 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mapsui_title
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "titleLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)set_mapsui_title:()MUXCrossPlatformOperations
{
  return objc_msgSend(a1, "setTitle:forState:", a3, 0);
}

- (uint64_t)_mapsui_setImage:()MUXCrossPlatformOperations
{
  return objc_msgSend(a1, "setImage:forState:", a3, 0);
}

- (uint64_t)_mapsui_setTarget:()MUXCrossPlatformOperations action:
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:", a3, a4, 0x2000);
}

@end
