@implementation TwoLineCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TwoLineCollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoLineCollectionViewListCell"), CFSTR("_twoLinesContentView"), "TwoLinesContentView");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TwoLineCollectionViewListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_twoLinesContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
