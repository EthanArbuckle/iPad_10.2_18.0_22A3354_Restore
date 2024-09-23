@implementation OnboardingInfoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.OnboardingInfoViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HealthExposureNotificationUI.OnboardingInfoViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OnboardingInfoViewControllerAccessibility;
  -[OnboardingInfoViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[OnboardingInfoViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDescendantOfType:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", &__block_literal_global_1);
}

uint64_t __87__OnboardingInfoViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OnboardingInfoViewControllerAccessibility;
  -[OnboardingInfoViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[OnboardingInfoViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
