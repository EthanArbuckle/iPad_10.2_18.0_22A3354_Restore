@implementation PKBillPaymentRingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKBillPaymentRingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBillPaymentRingView"), CFSTR("_enterCurrencyAmountView"), "PKEnterCurrencyAmountView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBillPaymentRingView"), CFSTR("_topCurvedTextLabel"), "PKCurvedTextLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBillPaymentRingView"), CFSTR("_bottomCurvedTextLabel"), "PKCurvedTextLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBillPaymentRingView"), CFSTR("_maximumPaymentAmount"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBillPaymentRingView"), CFSTR("_minimumPaymentAmount"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKBillPaymentRingView"), CFSTR("amount"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKBillPaymentRingView"), CFSTR("setAmount:animated:"), "v", "@", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("payment.amount.label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PKBillPaymentRingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_enterCurrencyAmountView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PKBillPaymentRingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_topCurvedTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentRingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bottomCurvedTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)_accessibilityAdjust:(BOOL)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  -[PKBillPaymentRingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("amount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  -[PKBillPaymentRingViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("_minimumPaymentAmount"));
  -[PKBillPaymentRingViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("_maximumPaymentAmount"));
  AXPerformSafeBlock();
}

void __59__PKBillPaymentRingViewAccessibility__accessibilityAdjust___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1518];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decimalNumberWithString:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAmount:animated:", v3, 0);

}

- (void)accessibilityIncrement
{
  -[PKBillPaymentRingViewAccessibility _accessibilityAdjust:](self, "_accessibilityAdjust:", 1);
}

- (void)accessibilityDecrement
{
  -[PKBillPaymentRingViewAccessibility _accessibilityAdjust:](self, "_accessibilityAdjust:", 0);
}

@end
