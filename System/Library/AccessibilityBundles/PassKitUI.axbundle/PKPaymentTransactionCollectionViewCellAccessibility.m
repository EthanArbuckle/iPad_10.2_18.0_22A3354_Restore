@implementation PKPaymentTransactionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionCollectionViewCell"), CFSTR("_transactionView"), "PKPaymentTransactionView");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PKPaymentTransactionCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_transactionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PKPaymentTransactionCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_transactionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
