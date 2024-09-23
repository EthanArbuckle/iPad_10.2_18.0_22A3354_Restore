@implementation PKAccountAutomaticPaymentsDateFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKAccountAutomaticPaymentsDateFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKAccountAutomaticPaymentsDateFooterView"), CFSTR("UITableViewHeaderFooterView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKAccountAutomaticPaymentsDateFooterView"), CFSTR("_collectionViewController"), "PKMonthDayCollectionViewController");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKMonthDayCollectionViewController"), CFSTR("UICollectionViewController"));

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[PKAccountAutomaticPaymentsDateFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsDateFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
