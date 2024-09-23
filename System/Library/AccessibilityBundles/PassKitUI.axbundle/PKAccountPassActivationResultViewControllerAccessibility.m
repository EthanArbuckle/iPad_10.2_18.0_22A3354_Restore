@implementation PKAccountPassActivationResultViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKAccountPassActivationResultViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKAccountPassActivationResultViewController"), CFSTR("_updateForSetupLater"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationViewController"), CFSTR("explanationView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKAccountPassActivationResultViewController"), CFSTR("PKExplanationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKAccountPassActivationResultViewController"), CFSTR("_setupLaterBodyString"), "@", 0);

}

- (id)_setupLaterBodyString
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassActivationResultViewControllerAccessibility;
  -[PKAccountPassActivationResultViewControllerAccessibility _setupLaterBodyString](&v6, sel__setupLaterBodyString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v3, "length"), 0, &__block_literal_global_2);
    v2 = v3;
  }
  v4 = v2;

  return v4;
}

void __81__PKAccountPassActivationResultViewControllerAccessibility__setupLaterBodyString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v2 = *MEMORY[0x24BDF65C0];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF65C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v3)
  {
    objc_msgSend(v7, "objectForKey:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      accessibilityLocalizedString(CFSTR("more.button"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityLabel:", v6);

    }
    v4 = v7;
  }

}

- (void)_updateForSetupLater
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassActivationResultViewControllerAccessibility;
  -[PKAccountPassActivationResultViewControllerAccessibility _updateForSetupLater](&v6, sel__updateForSetupLater);
  v3 = *MEMORY[0x24BDF72C8];
  -[PKAccountPassActivationResultViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("explanationView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindDescendant:", &__block_literal_global_199);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

uint64_t __80__PKAccountPassActivationResultViewControllerAccessibility__updateForSetupLater__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
