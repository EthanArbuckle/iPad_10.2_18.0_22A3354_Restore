@implementation SleepScheduleClockCaptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.SleepScheduleClockCaption");
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
