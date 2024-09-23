@implementation SBUIActionPlatterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIActionPlatterViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIActionPlatterViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIActionPlatterViewController"), CFSTR("_keylinesContainerView"), "UIView");

}

- (void)_axHideKeylinesContainerView
{
  id v2;

  -[SBUIActionPlatterViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_keylinesContainerView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityElementsHidden:", 1);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIActionPlatterViewControllerAccessibility;
  -[SBUIActionPlatterViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBUIActionPlatterViewControllerAccessibility _axHideKeylinesContainerView](self, "_axHideKeylinesContainerView");
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIActionPlatterViewControllerAccessibility;
  -[SBUIActionPlatterViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SBUIActionPlatterViewControllerAccessibility _axHideKeylinesContainerView](self, "_axHideKeylinesContainerView");
}

@end
