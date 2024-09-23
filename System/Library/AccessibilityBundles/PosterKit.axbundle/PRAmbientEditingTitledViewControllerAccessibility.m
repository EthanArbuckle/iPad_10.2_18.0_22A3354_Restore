@implementation PRAmbientEditingTitledViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRAmbientEditingTitledViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRAmbientEditingTitledViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRAmbientEditingTitledViewController"), CFSTR("accessibilityTitleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRAmbientEditingTitledViewControllerAccessibility;
  -[PRAmbientEditingTitledViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PRAmbientEditingTitledViewControllerAccessibility accessibilityTitleLabel](self, "accessibilityTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRAmbientEditingTitledViewControllerAccessibility;
  -[PRAmbientEditingTitledViewControllerAccessibility loadView](&v3, sel_loadView);
  -[PRAmbientEditingTitledViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
