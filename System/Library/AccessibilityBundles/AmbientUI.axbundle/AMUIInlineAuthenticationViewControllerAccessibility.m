@implementation AMUIInlineAuthenticationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMUIInlineAuthenticationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AMUIInlineAuthenticationViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIInlineAuthenticationViewControllerAccessibility;
  -[AMUIInlineAuthenticationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[AMUIInlineAuthenticationViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIInlineAuthenticationViewControllerAccessibility;
  -[AMUIInlineAuthenticationViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AMUIInlineAuthenticationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
