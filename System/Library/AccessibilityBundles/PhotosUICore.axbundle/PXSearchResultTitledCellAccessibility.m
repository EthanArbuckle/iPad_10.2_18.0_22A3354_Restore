@implementation PXSearchResultTitledCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXSearchResultTitledCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchResultTitledCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchResultTitledCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchResultTitledCell"), CFSTR("countLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchResultTitledCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXSearchResultTitledCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[PXSearchResultTitledCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel, countLabel"));
}

@end
