@implementation PKPaymentTransactionDetailLineItemTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionDetailLineItemTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionDetailLineItemTableViewCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionDetailLineItemTableViewCell"), CFSTR("_valueLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PKPaymentTransactionDetailLineItemTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
}

- (id)accessibilityValue
{
  return (id)-[PKPaymentTransactionDetailLineItemTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_valueLabel"));
}

@end
