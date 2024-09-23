@implementation AMSUIDynamicViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMSUIDynamicViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMSUIDynamicViewController"), CFSTR("navigationItem"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIDynamicViewControllerAccessibility;
  -[AMSUIDynamicViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AMSUIDynamicViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("rightBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_0);

}

id __85__AMSUIDynamicViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityLocalizedString(CFSTR("close.button"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIDynamicViewControllerAccessibility;
  -[AMSUIDynamicViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AMSUIDynamicViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
