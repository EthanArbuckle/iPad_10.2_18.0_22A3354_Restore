@implementation ProductPageLinkCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.ProductPageLinkCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductPageLinkCollectionViewCell"), CFSTR("acccessibilityTextLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ProductPageLinkCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("acccessibilityTextLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProductPageLinkCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ProductPageLinkCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
