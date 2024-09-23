@implementation COSGetStartedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSGetStartedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSGetStartedViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSGetStartedViewController"), CFSTR("_automationButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSGetStartedViewController"), CFSTR("_marketingBannerImage"), "UIImageView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("COSGetStartedViewController"), CFSTR("BPSWelcomeOptinViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSWelcomeOptinViewController"), CFSTR("suggestedChoiceButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSWelcomeOptinViewController"), CFSTR("alternateChoiceButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)COSGetStartedViewControllerAccessibility;
  -[COSGetStartedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[COSGetStartedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("suggestedChoiceButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("StartPairingButton"));

  -[COSGetStartedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alternateChoiceButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("StartMigrationButton"));

  -[COSGetStartedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_automationButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AutomationButton"));

  -[COSGetStartedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_marketingBannerImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("apple.watch.photos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COSGetStartedViewControllerAccessibility;
  -[COSGetStartedViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[COSGetStartedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
