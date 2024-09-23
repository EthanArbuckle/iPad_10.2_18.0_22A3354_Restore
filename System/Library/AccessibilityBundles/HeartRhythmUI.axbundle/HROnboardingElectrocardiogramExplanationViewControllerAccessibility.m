@implementation HROnboardingElectrocardiogramExplanationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HROnboardingElectrocardiogramExplanationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramExplanationViewController"), CFSTR("titleLabel"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramExplanationViewControllerAccessibility;
  -[HROnboardingElectrocardiogramExplanationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HROnboardingElectrocardiogramExplanationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);

}

@end
