@implementation OnboardingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.OnboardingHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.OnboardingHeaderView"), CFSTR("header"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.OnboardingHeaderView"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.ENUIPublicHealthHeader"), CFSTR("style"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.ENUIPublicHealthHeader"), CFSTR("title"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OnboardingHeaderViewAccessibility;
  -[OnboardingHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[OnboardingHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("header"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OnboardingHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeIntegerForKey:", CFSTR("style")))
  {
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    objc_msgSend(v3, "safeStringForKey:", CFSTR("title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  }
}

@end
