@implementation CycleHistoryFilterSectionHeaderReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CycleHistoryFilterSectionHeaderReusableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CycleHistoryFilterSectionHeaderReusableViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[CycleHistoryFilterSectionHeaderReusableViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
