@implementation NSUserDefaults(HKMenstrualCycles)

+ (id)hkmc_menstrualCyclesDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.private.health.menstrual-cycles"));
}

- (uint64_t)hkmc_analyticsDebugModeEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("AnalyticsDebugModeEnabled"));
}

- (uint64_t)hkmc_calendarLogAdjacentDaysDisabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("CalendarLogAdjacentDaysDisabled"));
}

- (uint64_t)hkmc_timelineLogAdjacentDaysEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("TimelineLogAdjacentDaysEnabled"));
}

- (uint64_t)hkmc_timelineTapToLogDisabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("TimelineTapToLogDisabled"));
}

- (uint64_t)hkmc_integerForKey:()HKMenstrualCycles defaultValue:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(a1, "integerForKey:", v6);

  return a4;
}

@end
