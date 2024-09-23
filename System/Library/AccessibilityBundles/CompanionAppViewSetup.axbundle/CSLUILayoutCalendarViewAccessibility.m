@implementation CSLUILayoutCalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLUILayoutCalendarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.calendar"));
}

@end
