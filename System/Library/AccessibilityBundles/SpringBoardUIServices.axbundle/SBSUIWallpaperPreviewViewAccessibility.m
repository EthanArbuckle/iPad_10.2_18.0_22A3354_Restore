@implementation SBSUIWallpaperPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSUIWallpaperPreviewView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSUIWallpaperPreviewView"), CFSTR("_parallaxButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSUIWallpaperPreviewView"), CFSTR("initWithFrame:wallpaperView:disableParallax:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSUIWallpaperPreviewView"), CFSTR("irisButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSUIWallpaperPreviewViewAccessibility;
  -[SBSUIWallpaperPreviewViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilitySBLocalizedString(CFSTR("parallax.effect.button.for.wallpaper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperPreviewViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_parallaxButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  accessibilitySBLocalizedString(CFSTR("live.photo.button.for.wallpaper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperPreviewViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("irisButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (SBSUIWallpaperPreviewViewAccessibility)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5
{
  SBSUIWallpaperPreviewViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSUIWallpaperPreviewViewAccessibility;
  v5 = -[SBSUIWallpaperPreviewViewAccessibility initWithFrame:wallpaperView:disableParallax:](&v7, sel_initWithFrame_wallpaperView_disableParallax_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBSUIWallpaperPreviewViewAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

@end
