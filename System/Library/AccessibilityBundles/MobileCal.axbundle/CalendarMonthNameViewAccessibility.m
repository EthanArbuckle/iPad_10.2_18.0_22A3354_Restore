@implementation CalendarMonthNameViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalendarMonthNameView");
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
  return (id)-[CalendarMonthNameViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
}

@end
