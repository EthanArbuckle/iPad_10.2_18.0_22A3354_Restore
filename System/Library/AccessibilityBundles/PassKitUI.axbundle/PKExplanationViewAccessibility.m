@implementation PKExplanationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKExplanationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKExplanationView"), CFSTR("_bodyTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKExplanationView"), CFSTR("_titleLabel"), "PKTrailingAccessoryLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKExplanationView"), CFSTR("_logoImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationView"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKExplanationViewAccessibility;
  -[PKExplanationViewAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  v4 = *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0];
  -[PKExplanationViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", v4);

  -[PKExplanationViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bodyTextView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

  -[PKExplanationViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_logoImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __76__PKExplanationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12 = &unk_2502E3AE8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "_setIsAccessibilityElementBlock:", &v9);
  accessibilityLocalizedString(CFSTR("apple.pay.label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8, v9, v10, v11, v12);

  objc_msgSend(v7, "setAccessibilityTraits:", v3);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __76__PKExplanationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_accessibilityViewIsVisible"))
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Payment_SetupLogo"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKExplanationViewAccessibility;
  -[PKExplanationViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PKExplanationViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
