@implementation PKPaymentTransactionDetailHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionDetailHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionDetailHeaderView"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionDetailHeaderView"), CFSTR("setSubtitleText:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentTransactionDetailHeaderViewAccessibility;
  -[PKPaymentTransactionDetailHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentTransactionDetailHeaderViewAccessibility gestureRecognizers](self, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PKPaymentTransactionDetailHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

    -[PKPaymentTransactionDetailHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("merchant.raw.name.hint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v7);

  }
}

- (void)setSubtitleText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailHeaderViewAccessibility;
  -[PKPaymentTransactionDetailHeaderViewAccessibility setSubtitleText:](&v4, sel_setSubtitleText_, a3);
  -[PKPaymentTransactionDetailHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
