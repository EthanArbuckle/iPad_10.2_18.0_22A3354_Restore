@implementation IOSFloatingControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IOSFloatingControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FloatingControlsViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("IOSFloatingControlsViewController"), CFSTR("_mode2DButton"), "UIButton");

}

- (void)_axAnnotateButtons
{
  void *v2;
  id v3;

  -[IOSFloatingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mode2DButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("2D_BUTTON"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSFloatingControlsViewControllerAccessibility;
  -[IOSFloatingControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[IOSFloatingControlsViewControllerAccessibility _axAnnotateButtons](self, "_axAnnotateButtons");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSFloatingControlsViewControllerAccessibility;
  -[IOSFloatingControlsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[IOSFloatingControlsViewControllerAccessibility _axAnnotateButtons](self, "_axAnnotateButtons");
}

@end
