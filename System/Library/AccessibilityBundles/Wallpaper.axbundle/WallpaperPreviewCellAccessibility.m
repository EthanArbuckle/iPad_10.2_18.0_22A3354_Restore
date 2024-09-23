@implementation WallpaperPreviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WallpaperPreviewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WallpaperPreviewCell"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WallpaperPreviewCell"), CFSTR("__homeScreenThumbnailButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WallpaperPreviewCell"), CFSTR("__lockScreenThumbnailButton"), "UIButton");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WallpaperPreviewCellAccessibility;
  -[WallpaperPreviewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[WallpaperPreviewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WallpaperPreviewCellAccessibility;
  -[WallpaperPreviewCellAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[WallpaperPreviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__homeScreenThumbnailButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WallpaperPreviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__lockScreenThumbnailButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("home.screen.wallpaper.thumbnail.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  accessibilityLocalizedString(CFSTR("lock.screen.wallpaper.thumbnail.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  accessibilityLocalizedString(CFSTR("wallpaper.thumbnail.button.hint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v7);

  accessibilityLocalizedString(CFSTR("wallpaper.thumbnail.button.hint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v8);

}

@end
