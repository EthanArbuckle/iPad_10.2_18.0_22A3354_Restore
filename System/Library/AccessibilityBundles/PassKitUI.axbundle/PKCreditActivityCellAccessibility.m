@implementation PKCreditActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCreditActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditActivityCell"), CFSTR("_labelTitle"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditActivityCell"), CFSTR("_chartView"), "PKSpendingSummaryChartView");

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PKCreditActivityCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_labelTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditActivityCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chartView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
