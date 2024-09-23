@implementation PKCreditBalanceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCreditBalanceCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditBalanceCell"), CFSTR("_labelBalance"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditBalanceCell"), CFSTR("_labelAmount"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditBalanceCell"), CFSTR("_labelCreditAvailable"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[PKCreditBalanceCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_labelBalance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditBalanceCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_labelAmount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditBalanceCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_labelCreditAvailable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
