@implementation PUFeedTextCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedTextCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedTextCell"), CFSTR("_button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedTextCell"), CFSTR("_detailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedTextCell"), CFSTR("_label"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PUFeedTextCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_label, _detailLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedTextCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PUFeedTextCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[PUFeedTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v8.receiver = self;
  v8.super_class = (Class)PUFeedTextCellAccessibility;
  -[PUFeedTextCellAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axArrayWithPossiblyNilArrays:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v3);

  return v6;
}

@end
