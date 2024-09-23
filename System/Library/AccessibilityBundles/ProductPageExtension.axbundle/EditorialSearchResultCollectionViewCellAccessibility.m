@implementation EditorialSearchResultCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.EditorialSearchResultCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProductPageExtension.EditorialSearchResultCollectionViewCell"), CFSTR("accessibilityEditorialTypeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProductPageExtension.EditorialSearchResultCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProductPageExtension.EditorialSearchResultCollectionViewCell"), CFSTR("accessibilitySummaryLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EditorialSearchResultCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[EditorialSearchResultCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[EditorialSearchResultCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityEditorialTypeLabel, accessibilityTitleLabel, accessibilitySummaryLabel"));
}

@end
