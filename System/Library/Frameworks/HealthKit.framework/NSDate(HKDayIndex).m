@implementation NSDate(HKDayIndex)

+ (id)hk_dateOnDayIndex:()HKDayIndex atHour:calendar:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0C99D78];
  v8 = a5;
  objc_msgSend(v7, "hk_componentsWithDayIndex:calendar:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHour:", a4);
  objc_msgSend(v8, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)hk_noonWithDayIndex:()HKDayIndex calendar:
{
  return objc_msgSend(a1, "hk_dateOnDayIndex:atHour:calendar:", a3, 12, a4);
}

+ (id)hk_earliestPossibleDateWithDayIndex:()HKDayIndex
{
  void *v4;
  void *v5;
  void *v6;

  +[HKCalendarCache latestTimeZoneCalendar](HKCalendarCache, "latestTimeZoneCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDayIndex:calendar:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hk_latestPossibleDateWithDayIndex:()HKDayIndex
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HKCalendarCache earliestTimeZoneCalendar](HKCalendarCache, "earliestTimeZoneCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDayIndex:calendar:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)hk_dayIndexWithCalendar:()HKDayIndex
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKDayIndex.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[calendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  objc_msgSend(v5, "components:fromDate:", 28, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hk_dayIndex");

  return v9;
}

- (uint64_t)hk_earliestPossibleDayIndex
{
  void *v2;
  uint64_t v3;

  +[HKCalendarCache earliestTimeZoneCalendar](HKCalendarCache, "earliestTimeZoneCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hk_dayIndexWithCalendar:", v2);

  return v3;
}

- (uint64_t)hk_latestPossibleDayIndex
{
  void *v2;
  uint64_t v3;

  +[HKCalendarCache latestTimeZoneCalendar](HKCalendarCache, "latestTimeZoneCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hk_dayIndexWithCalendar:", v2);

  return v3;
}

@end
