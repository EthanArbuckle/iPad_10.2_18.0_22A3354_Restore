@implementation WelcomeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ActionButtonConfigurationUI.WelcomeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ActionButtonConfigurationUI.WelcomeView"), CFSTR("stackView"), "Optional<UIStackView>");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  objc_opt_class();
  -[WelcomeViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("stackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "_accessibilityFindDescendant:", &__block_literal_global_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "accessibilityTraits");
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)WelcomeViewAccessibility;
  -[WelcomeViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);

}

uint64_t __70__WelcomeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
