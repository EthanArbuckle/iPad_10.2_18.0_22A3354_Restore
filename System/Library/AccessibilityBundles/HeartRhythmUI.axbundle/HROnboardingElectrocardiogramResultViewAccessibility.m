@implementation HROnboardingElectrocardiogramResultViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HROnboardingElectrocardiogramResultView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramResultView"), CFSTR("numberedTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramResultView"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramResultView"), CFSTR("expandedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingElectrocardiogramResultView"), CFSTR("_updateExpandedViewState"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramResultViewAccessibility;
  -[HROnboardingElectrocardiogramResultViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HROnboardingElectrocardiogramResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberedTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);

}

- (void)_updateExpandedViewState
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramResultViewAccessibility;
  -[HROnboardingElectrocardiogramResultViewAccessibility _updateExpandedViewState](&v5, sel__updateExpandedViewState);
  if (-[HROnboardingElectrocardiogramResultViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    v3 = *MEMORY[0x24BDF72C8];
    -[HROnboardingElectrocardiogramResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("expandedView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v4);

  }
}

@end
