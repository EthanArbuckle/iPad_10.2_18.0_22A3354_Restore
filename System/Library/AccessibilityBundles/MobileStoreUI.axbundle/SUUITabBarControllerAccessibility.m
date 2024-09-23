@implementation SUUITabBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUITabBarController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUITabBarController"), CFSTR("_floatingOverlayView"), "SUUIFloatingOverlayView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUITabBarController"), CFSTR("setFloatingOverlayViewController: animated:"), "v", "@", "B", 0);

}

- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUITabBarControllerAccessibility;
  -[SUUITabBarControllerAccessibility setFloatingOverlayViewController:animated:](&v6, sel_setFloatingOverlayViewController_animated_, a3, a4);
  -[SUUITabBarControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_floatingOverlayView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("FloatingPreview"));

}

@end
