@implementation HUQuickControlContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlContainerViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewControllerAccessibility;
  -[HUQuickControlContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HUQuickControlContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetOverridesInvalidFrames:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerViewControllerAccessibility;
  -[HUQuickControlContainerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUQuickControlContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
