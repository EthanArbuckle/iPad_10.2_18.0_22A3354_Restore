@implementation SearchLandingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.SearchLandingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.SearchLandingCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SearchLandingCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel"));
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchLandingCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchLandingCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
