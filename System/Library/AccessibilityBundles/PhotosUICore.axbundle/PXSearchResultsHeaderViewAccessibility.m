@implementation PXSearchResultsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXSearchResultsHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchResultsHeaderView"), CFSTR("seeAllButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchResultsHeaderView"), CFSTR("titleLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PXSearchResultsHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchResultsHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[PXSearchResultsHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PXSearchResultsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("seeAllButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_accessibilityViewIsVisible")
    && (objc_msgSend(v2, "accessibilityLabel"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
