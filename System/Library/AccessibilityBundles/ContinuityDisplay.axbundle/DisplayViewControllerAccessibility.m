@implementation DisplayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContinuityDisplay.DisplayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("\"ContinuityDisplay.DisplayViewController\"), CFSTR("displayView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DisplayViewControllerAccessibility;
  -[DisplayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[DisplayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("display.view.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A8]);

}

@end
