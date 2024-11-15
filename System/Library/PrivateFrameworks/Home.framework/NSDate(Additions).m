@implementation NSDate(Additions)

+ (id)hf_sharedCalendar
{
  if (_MergedGlobals_280 != -1)
    dispatch_once(&_MergedGlobals_280, &__block_literal_global_145);
  return (id)qword_1ED379590;
}

+ (id)hf_sharedTimeZone
{
  if (qword_1ED379598 != -1)
    dispatch_once(&qword_1ED379598, &__block_literal_global_1_0);
  return (id)qword_1ED3795A0;
}

+ (id)hf_dateByAddingComponents:()Additions toDate:times:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = v8;
  if (a5 >= 1)
  {
    v11 = v8;
    do
    {
      objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v7, v11, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v10;
      --a5;
    }
    while (a5);
  }

  return v10;
}

+ (id)hf_dateBySubtractingComponents:()Additions fromDate:times:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99D78];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  if (objc_msgSend(v7, "year") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setYear:", -objc_msgSend(v7, "year"));
  if (objc_msgSend(v7, "month") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setMonth:", -objc_msgSend(v7, "month"));
  if (objc_msgSend(v7, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setHour:", -objc_msgSend(v7, "hour"));
  if (objc_msgSend(v7, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setWeekOfYear:", -objc_msgSend(v7, "weekOfYear"));
  if (objc_msgSend(v7, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setWeekOfMonth:", -objc_msgSend(v7, "weekOfMonth"));
  if (objc_msgSend(v7, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setMinute:", -objc_msgSend(v7, "minute"));
  if (objc_msgSend(v7, "second") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "setSecond:", -objc_msgSend(v7, "second"));
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingComponents:toDate:times:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)hf_dateByAddingYears:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", a3, 0, 0, 0, 0, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingMonths:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, a3, 0, 0, 0, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingWeeks:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, a3, 0, 0, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingDays:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, a3, 0, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingHours:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, a3, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingMinutes:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, a3, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingSeconds:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, 0, a3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_dateByAddingNanoseconds:()Additions toDate:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, 0, 0, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_startOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsInTimeZone:fromDate:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHour:", 0);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v4, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_startOfNextDay
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", a1, 0, 0, 0, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_startOfHour
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsInTimeZone:fromDate:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v4, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_startOfMinute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsInTimeZone:fromDate:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v4, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_startOfSecond
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsInTimeZone:fromDate:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_startOfWeek
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 512, v1);
  v4 = objc_msgSend(v2, "firstWeekday");
  if (v3 - v4 >= 1)
  {
    objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, v4 - v3, v1, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v5;
  }
  objc_msgSend(v2, "startOfDayForDate:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_endOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsInTimeZone:fromDate:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHour:", 23);
  objc_msgSend(v4, "setMinute:", 59);
  objc_msgSend(v4, "setSecond:", 59);
  objc_msgSend(v4, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_endOfWeek
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 512, v1);
  if (v3 <= 6)
  {
    objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 7 - v3, v1, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  objc_msgSend(v2, "startOfDayForDate:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hf_isWithinInterval:()Additions ofDate:
{
  double v3;

  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) < a2;
}

- (uint64_t)hf_isWithinOneHourOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 3600.0);
}

- (uint64_t)hf_isWithinOneMinuteOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 60.0);
}

- (uint64_t)hf_isWithinOneSecondOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 1.0);
}

- (BOOL)hf_isFirstHourOfDay
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 32, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "hour") == 0;
  return v4;
}

- (BOOL)hf_isMidnight
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 224, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !objc_msgSend(v3, "hour") && !objc_msgSend(v3, "minute") && objc_msgSend(v3, "second") == 0;
  return v4;
}

- (uint64_t)hf_isSingularHour
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 32, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hour") == 1)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "hour") == 13)
  {
    v4 = objc_msgSend(a1, "_uses24HourTimeForLocale") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_isBetweenStartDate:()Additions endDate:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "earlierDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToDate:", v7);

  if (v9)
  {
    objc_msgSend(a1, "laterDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToDate:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)hf_minutesBetweenDates:()Additions endDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startOfDayForDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startOfDayForDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "ordinalityOfUnit:inUnit:forDate:", 64, 2, v8);
  v11 = objc_msgSend(v7, "ordinalityOfUnit:inUnit:forDate:", 64, 2, v9) - v10;

  return v11;
}

+ (uint64_t)hf_daysBetweenDates:()Additions endDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startOfDayForDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startOfDayForDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "ordinalityOfUnit:inUnit:forDate:", 16, 2, v8);
  v11 = objc_msgSend(v7, "ordinalityOfUnit:inUnit:forDate:", 16, 2, v9) - v10;

  return v11;
}

+ (id)hf_dateByAddingYears:()Additions months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:
{
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v17 = (objc_class *)MEMORY[0x1E0C99D78];
  v18 = a11;
  v19 = objc_alloc_init(v17);
  objc_msgSend(v19, "setYear:", a3);
  objc_msgSend(v19, "setMonth:", a4);
  objc_msgSend(v19, "setWeekOfMonth:", a5);
  objc_msgSend(v19, "setDay:", a6);
  objc_msgSend(v19, "setHour:", a7);
  objc_msgSend(v19, "setMinute:", a8);
  objc_msgSend(v19, "setSecond:", a9);
  objc_msgSend(v19, "setNanosecond:", a10);
  objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dateByAddingComponents:toDate:options:", v19, v18, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_uses24HourTimeForLocale
{
  id v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v0, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  objc_msgSend(v0, "dateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v2, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end
