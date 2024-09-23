@implementation SUUIBrowseItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIBrowseItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIBrowseItemCell"), CFSTR("_titleLabel"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SUUIBrowseItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  char v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if ((-[SUUIBrowseItemCellAccessibility isSelected](self, "isSelected") & 1) != 0)
    v3 = 1;
  else
    v3 = -[SUUIBrowseItemCellAccessibility isHighlighted](self, "isHighlighted");
  -[SUUIBrowseItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("decorationImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AppStoreBrowseCategoryDownChevron"));

  v7 = 0;
  if ((v3 & 1) == 0 && v6)
  {
    accessibilityLocalizedString(CFSTR("explore.category.expand"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIBrowseItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SUUIBrowseItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
