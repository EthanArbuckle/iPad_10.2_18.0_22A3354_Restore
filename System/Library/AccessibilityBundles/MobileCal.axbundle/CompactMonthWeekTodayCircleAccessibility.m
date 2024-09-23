@implementation CompactMonthWeekTodayCircleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactMonthWeekTodayCircle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
