@implementation PKAccountBillPaymentAmountContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKAccountBillPaymentAmountContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKAccountBillPaymentAmountContainerView"), CFSTR("_enterCurrencyAmountView"), "PKEnterCurrencyAmountView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKAccountBillPaymentAmountContainerView"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentAmountContainerViewAccessibility;
  -[PKAccountBillPaymentAmountContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("payment.amount.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentAmountContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_enterCurrencyAmountView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentAmountContainerViewAccessibility;
  -[PKAccountBillPaymentAmountContainerViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAccountBillPaymentAmountContainerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
