@implementation SectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.SectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SectionHeaderView"), CFSTR("accessibilitySectionHeaderLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SectionHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilitySectionHeaderLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SectionHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[SectionHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
