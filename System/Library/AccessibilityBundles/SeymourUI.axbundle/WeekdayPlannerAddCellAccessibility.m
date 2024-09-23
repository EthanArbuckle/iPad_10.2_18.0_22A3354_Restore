@implementation WeekdayPlannerAddCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WeekdayPlannerAddCell");
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
  return *MEMORY[0x24BDF73B0];
}

@end
