@implementation PKPeerPaymentNumberPadActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentNumberPadActionButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentNumberPadActionButton"), CFSTR("action"), "Q", 0);
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentNumberPadActionButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PKPeerPaymentNumberPadActionButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73F0];
}

- (id)accessibilityLabel
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  v3 = -[PKPeerPaymentNumberPadActionButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("action"));
  if (v3 == 10)
  {
    v4 = CFSTR("decimal.button");
  }
  else
  {
    if (v3 != 12)
    {
      v7.receiver = self;
      v7.super_class = (Class)PKPeerPaymentNumberPadActionButtonAccessibility;
      -[PKPeerPaymentNumberPadActionButtonAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v4 = CFSTR("delete.button");
  }
  accessibilityPeerPaymentLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
