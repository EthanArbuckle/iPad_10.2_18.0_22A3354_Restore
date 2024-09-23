@implementation PKSpendingSummaryAccountUserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSpendingSummaryAccountUserCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryAccountUserCell"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryAccountUserCell"), CFSTR("_amountLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[PKSpendingSummaryAccountUserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryAccountUserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_amountLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
