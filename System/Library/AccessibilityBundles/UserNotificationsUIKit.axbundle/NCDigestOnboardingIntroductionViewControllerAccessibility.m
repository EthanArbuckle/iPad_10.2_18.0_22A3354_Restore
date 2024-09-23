@implementation NCDigestOnboardingIntroductionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCDigestOnboardingIntroductionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer1Container"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer1Title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer1Label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer2Container"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer2Title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestOnboardingIntroductionViewController"), CFSTR("_explainer2Label"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCDigestOnboardingIntroductionViewControllerAccessibility;
  -[NCDigestOnboardingIntroductionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[NCDigestOnboardingIntroductionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_explainer1Container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  -[NCDigestOnboardingIntroductionViewControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_explainer1Title, _explainer1Label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[NCDigestOnboardingIntroductionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_explainer2Container"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  -[NCDigestOnboardingIntroductionViewControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_explainer2Title, _explainer2Label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCDigestOnboardingIntroductionViewControllerAccessibility;
  -[NCDigestOnboardingIntroductionViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[NCDigestOnboardingIntroductionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
