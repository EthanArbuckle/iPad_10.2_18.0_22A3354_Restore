@implementation LPCaptionBarButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LPCaptionBarButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCaptionBarButtonView"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarButtonView"), CFSTR("configurePillButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarButtonView"), CFSTR("configureMenuButton:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  -[LPCaptionBarButtonViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[LPCaptionBarButtonViewAccessibility _accessibilityConfigure](self, "_accessibilityConfigure");
}

- (void)configurePillButton:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  -[LPCaptionBarButtonViewAccessibility configurePillButton:](&v4, sel_configurePillButton_, a3);
  -[LPCaptionBarButtonViewAccessibility _accessibilityConfigure](self, "_accessibilityConfigure");
}

- (void)configureMenuButton:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  -[LPCaptionBarButtonViewAccessibility configureMenuButton:](&v4, sel_configureMenuButton_, a3);
  -[LPCaptionBarButtonViewAccessibility _accessibilityConfigure](self, "_accessibilityConfigure");
}

- (void)_accessibilityConfigure
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_opt_class();
  -[LPCaptionBarButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("person.2.fill"));

    if (v6)
    {
      accessibilityLocalizedString(CFSTR("caption.bar.collaborate.button"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessibilityLabel:", v7);

    }
  }

}

@end
