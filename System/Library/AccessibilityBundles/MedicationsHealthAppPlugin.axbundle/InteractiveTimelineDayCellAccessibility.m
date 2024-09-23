@implementation InteractiveTimelineDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MedicationsHealthAppPlugin.InteractiveTimelineDayCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MedicationsHealthAppPlugin.InteractiveTimelineDayCell"), CFSTR("startDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MedicationsHealthAppPlugin.InteractiveTimelineDayCell"), CFSTR("timelineDay"), "TimelineDay");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MedicationsHealthAppPlugin.TimelineDay"), CFSTR("logIndicatorAppearance"), "TimelineLogIndicatorAppearance");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1500];
  -[InteractiveTimelineDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromDate:dateStyle:timeStyle:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[InteractiveTimelineDayCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("timelineDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("logIndicatorAppearance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftEnumCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
