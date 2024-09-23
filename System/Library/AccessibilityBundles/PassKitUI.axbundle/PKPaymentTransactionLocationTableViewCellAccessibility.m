@implementation PKPaymentTransactionLocationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionLocationTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionLocationTableViewCell"), CFSTR("_titleLabel"), "UILabel");
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("maps.location.hint"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentTransactionLocationTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("maps.location.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
