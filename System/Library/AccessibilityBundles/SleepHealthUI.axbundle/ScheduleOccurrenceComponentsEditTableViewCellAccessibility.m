@implementation ScheduleOccurrenceComponentsEditTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell"), CFSTR("accessibilityComponentsEditView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityComponentsHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityClock"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityBedtimeHand"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityWakeUpHand"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityTimeInBedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityClockCaption"), "@", 0);

}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ScheduleOccurrenceComponentsEditTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityClock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityComponentsHeader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityBedtimeHand"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityWakeUpHand"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityTimeInBedLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v9);

  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityClockCaption"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v10);

  return v3;
}

@end
