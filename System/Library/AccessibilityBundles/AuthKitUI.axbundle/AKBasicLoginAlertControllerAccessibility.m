@implementation AKBasicLoginAlertControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKBasicLoginAlertController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKBasicLoginAlertController"), CFSTR("UIAlertController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKBasicLoginAlertController"), CFSTR("jiggleAView"), "v", 0);

}

- (void)_accessibilitySetAlertIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = MEMORY[0x2349071BC](CFSTR("_UIAlertControllerView"), a2);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityViewAncestorIsKindOf:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AuthKit Login"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  -[AKBasicLoginAlertControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[AKBasicLoginAlertControllerAccessibility _accessibilitySetAlertIdentifier](self, "_accessibilitySetAlertIdentifier");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  -[AKBasicLoginAlertControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AKBasicLoginAlertControllerAccessibility _accessibilitySetAlertIdentifier](self, "_accessibilitySetAlertIdentifier");
}

- (void)jiggleAView
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  -[AKBasicLoginAlertControllerAccessibility jiggleAView](&v4, sel_jiggleAView);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("incorrect.password"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

@end
