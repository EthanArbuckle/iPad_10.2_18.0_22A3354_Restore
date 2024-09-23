@implementation SearchLandingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SearchLandingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SearchLandingCell"), CFSTR("accessibilityTitle"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SearchLandingCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitle"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchLandingCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchLandingCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
