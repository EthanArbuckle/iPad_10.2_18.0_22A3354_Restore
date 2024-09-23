@implementation SleepScheduleDayPickerDayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.SleepScheduleDayPickerDay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleDayPickerDay"), CFSTR("accessibilityWeekday"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SleepScheduleDayPickerDayAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityWeekday"));
}

@end
