@implementation SectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthArticlesUI.SectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SectionHeaderViewAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 0, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SectionHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[SectionHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
