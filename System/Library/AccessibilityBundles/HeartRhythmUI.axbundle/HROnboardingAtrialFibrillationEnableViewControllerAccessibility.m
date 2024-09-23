@implementation HROnboardingAtrialFibrillationEnableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HROnboardingAtrialFibrillationEnableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingAtrialFibrillationEnableViewController"), CFSTR("titleLabel"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HROnboardingAtrialFibrillationEnableViewControllerAccessibility;
  -[HROnboardingAtrialFibrillationEnableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[HROnboardingAtrialFibrillationEnableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);

}

@end
