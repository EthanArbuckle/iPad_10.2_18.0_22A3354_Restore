@implementation CircleItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.CircleItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)-[CircleItemCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CircleItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CircleItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
