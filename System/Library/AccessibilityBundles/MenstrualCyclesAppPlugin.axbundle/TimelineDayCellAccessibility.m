@implementation TimelineDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.TimelineDayCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.TimelineDayCell"), CFSTR("axCycleDayViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.TimelineDayCell"), CFSTR("axCycleDay"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMCDayViewModel"), CFSTR("_menstruationLevel"), "NSUInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMCDayViewModel"), CFSTR("_fertileWindowLevel"), "NSUInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMCDayViewModel"), CFSTR("_pregnancyState"), "NSUInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMCDayViewModel"), CFSTR("_daySummary"), "HKMCDaySummary");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMCDaySummary"), CFSTR("isSupplementaryDataLogged"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[TimelineDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axCycleDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCE48]);
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v7, "components:fromDate:", 4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v9) == 1)
    _AXGetStringForDay(v4);
  else
    _AXGetStringForDayAndYear();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[TimelineDayCellAccessibility _axCycleDayViewModel](self, "_axCycleDayViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TimelineDayCellAccessibility _axMensturationLevel:](self, "_axMensturationLevel:", objc_msgSend(v3, "safeIntegerForKey:", CFSTR("_menstruationLevel")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TimelineDayCellAccessibility _axFertileLevel:](self, "_axFertileLevel:", objc_msgSend(v3, "safeIntegerForKey:", CFSTR("_fertileWindowLevel")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TimelineDayCellAccessibility _axPregnancyState:](self, "_axPregnancyState:", objc_msgSend(v3, "safeIntegerForKey:", CFSTR("_pregnancyState")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_daySummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TimelineDayCellAccessibility _axInformationLogged:](self, "_axInformationLogged:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TimelineDayCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TimelineDayCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axCycleDayViewModel
{
  return (id)-[TimelineDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axCycleDayViewModel"));
}

- (id)_axInformationLogged:(id)a3
{
  __CFString *v3;

  if (objc_msgSend(a3, "safeBoolForKey:", CFSTR("isSupplementaryDataLogged")))
  {
    accessibilityLocalizedString(CFSTR("data.logged"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_25027A2A8;
  }
  return v3;
}

- (id)_axMensturationLevel:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  accessibilityLocalizedString(*(&off_250279F50 + a3 - 1));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axFertileLevel:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  accessibilityLocalizedString(*(&off_250279F70 + a3 - 1));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axPregnancyState:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return 0;
  accessibilityLocalizedString(*(&off_250279F88 + a3 - 2));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
