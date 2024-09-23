@implementation AMUIOnboardingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMUIOnboardingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AMUIOnboardingView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AMUIOnboardingView"), CFSTR("_continueButton"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIOnboardingViewAccessibility;
  -[AMUIOnboardingViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AMUIOnboardingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_continueButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("continue.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingViewAccessibility;
  -[AMUIOnboardingViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[AMUIOnboardingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
