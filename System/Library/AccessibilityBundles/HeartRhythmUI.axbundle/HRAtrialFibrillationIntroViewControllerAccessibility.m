@implementation HRAtrialFibrillationIntroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HRAtrialFibrillationIntroViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HRAtrialFibrillationIntroViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HRAtrialFibrillationIntroViewController"), CFSTR("setUpUI"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRAtrialFibrillationIntroViewControllerAccessibility;
  -[HRAtrialFibrillationIntroViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[HRAtrialFibrillationIntroViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);

}

- (void)setUpUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HRAtrialFibrillationIntroViewControllerAccessibility;
  -[HRAtrialFibrillationIntroViewControllerAccessibility setUpUI](&v3, sel_setUpUI);
  -[HRAtrialFibrillationIntroViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
