@implementation ScheduleOccurrenceDayPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.ScheduleOccurrenceDayPickerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.ScheduleOccurrenceDayPickerTableViewCell"), CFSTR("accessibilityDayPicker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleDayPicker"), CFSTR("accessibilityPickerDays"), "@", 0);

}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[ScheduleOccurrenceDayPickerTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDayPicker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("accessibilityPickerDays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
