@implementation ChartOrCategoryBrickCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ChartOrCategoryBrickCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Arcade.ChartOrCategoryBrickCollectionViewCell"), CFSTR("titleText"), "Optional<String>");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ChartOrCategoryBrickCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ChartOrCategoryBrickCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ChartOrCategoryBrickCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end
