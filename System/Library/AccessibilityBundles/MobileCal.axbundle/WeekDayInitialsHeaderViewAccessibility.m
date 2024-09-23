@implementation WeekDayInitialsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeekDayInitialsHeaderView");
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
