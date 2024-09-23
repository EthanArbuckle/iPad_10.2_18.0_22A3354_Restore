@implementation SBHWallpaperDimControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHWallpaperDimControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWallpaperDimControl"), CFSTR("isDimmed"), "B", 0);
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[SBHWallpaperDimControlAccessibility _axIsDimmed](self, "_axIsDimmed"))
    v2 = CFSTR("home.screen.brighten.wallpaper");
  else
    v2 = CFSTR("home.screen.dim.wallpaper");
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_axIsDimmed
{
  return -[SBHWallpaperDimControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDimmed"));
}

@end
