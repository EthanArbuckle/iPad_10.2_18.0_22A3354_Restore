@implementation SelectedFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SelectedFilterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.SelectedFilterCell"), CFSTR("UICollectionViewCell"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  accessibilityLocalizedString(CFSTR("workout.filter.remove"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SelectedFilterCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SelectedFilterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SelectedFilterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
