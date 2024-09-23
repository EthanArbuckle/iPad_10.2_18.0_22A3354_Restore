@implementation ScheduleHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.ScheduleHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
