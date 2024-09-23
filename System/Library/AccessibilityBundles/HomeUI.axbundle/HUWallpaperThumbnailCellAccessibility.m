@implementation HUWallpaperThumbnailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUWallpaperThumbnailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(CFSTR("wallpaper.cell.name"));
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(CFSTR("wallpaper.cell.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
