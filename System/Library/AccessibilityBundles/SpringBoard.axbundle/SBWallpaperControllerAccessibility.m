@implementation SBWallpaperControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBWallpaperController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBWallpaperController"), CFSTR("_wallpaperWindow"), "UIWindow");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWallpaperController"), CFSTR("initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:"), "@", "q", "q", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBWallpaperControllerAccessibility;
  -[SBWallpaperControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBWallpaperControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_wallpaperWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

}

- (SBWallpaperControllerAccessibility)initWithWindowScene:(id)a3 orientation:(int64_t)a4 variant:(int64_t)a5 wallpaperConfigurationManager:(id)a6 cachingIdentifier:(id)a7
{
  SBWallpaperControllerAccessibility *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBWallpaperControllerAccessibility;
  v7 = -[SBWallpaperControllerAccessibility initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](&v9, sel_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier_, a3, a4, a5, a6, a7);
  -[SBWallpaperControllerAccessibility _accessibilityLoadAccessibilityInformation](v7, "_accessibilityLoadAccessibilityInformation");

  return v7;
}

@end
