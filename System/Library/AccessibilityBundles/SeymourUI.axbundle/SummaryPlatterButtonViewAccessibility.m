@implementation SummaryPlatterButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SummaryPlatterButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)-[SummaryPlatterButtonViewAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SummaryPlatterButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SummaryPlatterButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
