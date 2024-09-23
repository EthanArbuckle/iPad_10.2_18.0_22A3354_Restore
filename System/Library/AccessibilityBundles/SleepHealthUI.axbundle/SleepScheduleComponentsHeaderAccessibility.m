@implementation SleepScheduleComponentsHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.SleepScheduleComponentsHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
