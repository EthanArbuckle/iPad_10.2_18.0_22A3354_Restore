@implementation HKOnboardingBaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKOnboardingBaseViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKOnboardingBaseViewController"), CFSTR("setUpConstraints"), "v", 0);
}

- (void)setUpConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKOnboardingBaseViewControllerAccessibility;
  -[HKOnboardingBaseViewControllerAccessibility setUpConstraints](&v3, sel_setUpConstraints);
  -[HKOnboardingBaseViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
