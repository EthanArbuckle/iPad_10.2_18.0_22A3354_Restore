@implementation HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HROnboardingElectrocardiogramAvailabilityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramAvailabilityViewController"), CFSTR("heroView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramAvailabilityViewController"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility;
  -[HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("heroView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityHealthCinnamonLocalizedString(CFSTR("simulated.watch.ecg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8] | v5);
  -[HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityTraits");
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v7);

}

@end
