@implementation HUWallpaperPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUWallpaperPhotoCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUWallpaperPhotoCell"), CFSTR("assetIdentifier"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUWallpaperPhotoCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("assetIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelForCustomWallpaper(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    accessibilityLabelForNamedWallpaper(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      accessibilityHomeUILocalizedString(CFSTR("wallpaper.photo"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

@end
