@implementation PXSearchZeroKeywordCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXSearchZeroKeywordCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSearchZeroKeywordCollectionViewCell"), CFSTR("textLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PXSearchZeroKeywordCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("textLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchZeroKeywordCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXSearchZeroKeywordCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
