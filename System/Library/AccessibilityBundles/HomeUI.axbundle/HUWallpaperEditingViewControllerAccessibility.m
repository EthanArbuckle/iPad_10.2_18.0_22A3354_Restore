@implementation HUWallpaperEditingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUWallpaperEditingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUWallpaperEditingViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUWallpaperEditingViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperEditingViewControllerAccessibility;
  -[HUWallpaperEditingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HUWallpaperEditingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", AXWallpaperScrollViewIdentifier);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperEditingViewControllerAccessibility;
  -[HUWallpaperEditingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUWallpaperEditingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
