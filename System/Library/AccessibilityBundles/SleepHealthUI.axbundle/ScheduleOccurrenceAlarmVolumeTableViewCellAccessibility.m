@implementation ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.ScheduleOccurrenceAlarmVolumeTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility;
  -[ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("alarm.volume"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

uint64_t __101__ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
