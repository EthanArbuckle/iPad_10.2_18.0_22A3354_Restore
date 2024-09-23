@implementation BPSSetupOptinViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BPSSetupOptinViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BPSSetupOptinViewController"), CFSTR("_suggestedChoiceButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BPSSetupOptinViewController"), CFSTR("_alternateChoiceButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupOptinViewController"), CFSTR("watchView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupOptinViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupOptinViewController"), CFSTR("wantsAlternateChoicePillButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSSetupOptinViewController"), CFSTR("wantsAlternateChoiceSystemButton"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSSetupOptinViewControllerAccessibility;
  -[BPSSetupOptinViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[BPSSetupOptinViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_suggestedChoiceButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("SuggestedChoiceButton"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BPSSetupOptinViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("watchView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    -[BPSSetupOptinViewControllerAccessibility _accessibilityLabelForWatchView](self, "_accessibilityLabelForWatchView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  }
  if ((-[BPSSetupOptinViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("wantsAlternateChoicePillButton")) & 1) == 0&& (-[BPSSetupOptinViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("wantsAlternateChoiceSystemButton")) & 1) == 0)
  {
    -[BPSSetupOptinViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alternateChoiceButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsAccessibilityElement:", 0);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BPSSetupOptinViewControllerAccessibility;
  -[BPSSetupOptinViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BPSSetupOptinViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
