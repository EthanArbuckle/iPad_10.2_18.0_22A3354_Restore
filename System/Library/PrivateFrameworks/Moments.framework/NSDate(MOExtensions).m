@implementation NSDate(MOExtensions)

- (id)stringFromDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%f (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)betweenDate:()MOExtensions andDate:
{
  _BOOL8 result;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  BOOL v15;

  result = 0;
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v13 = v12;

    if (v9 <= v13)
    {
      v14 = v9 <= v11;
      v15 = v11 > v13;
    }
    else
    {
      v14 = v13 <= v11;
      v15 = v11 > v9;
    }
    return !v15 && v14;
  }
  return result;
}

- (BOOL)isBeforeDate:()MOExtensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isOnOrBefore:()MOExtensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isAfterDate:()MOExtensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isOnOrAfter:()MOExtensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (id)snapToTheDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 60, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hour") > 2)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(v3, "setHour:", 0);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dateByAddingTimeInterval:", -1.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (uint64_t)isSameDayWithDate:()MOExtensions timeZone:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99D48]);
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setTimeZone:", v7);
  v11 = objc_msgSend(v10, "isDate:inSameDayAsDate:", a1, v6);

  return v11;
}

- (uint64_t)isSameDayWithDate:()MOExtensions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:inSameDayAsDate:", a1, v5);

  return v7;
}

- (uint64_t)isFollowingDayAfterDate:()MOExtensions
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "dateByAddingTimeInterval:", 86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDate:inSameDayAsDate:", a1, v4);

  return v6;
}

- (uint64_t)isSameWeekWithDate:()MOExtensions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", a1, v5, 0x2000);

  return v7;
}

- (uint64_t)isFollowingWeekAfterDate:()MOExtensions
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "dateByAddingTimeInterval:", 604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", a1, v4, 0x2000);

  return v6;
}

- (uint64_t)isSameMonthWithDate:()MOExtensions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", a1, v5, 8);

  return v7;
}

- (BOOL)isFollowingMonthAfterDate:()MOExtensions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 12, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 12, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "month");
  v11 = objc_msgSend(v7, "year");
  if (v10 != 1)
  {
    if (v11 == objc_msgSend(v9, "year"))
    {
      v12 = objc_msgSend(v7, "month") - 1;
      v13 = objc_msgSend(v9, "month");
      goto LABEL_6;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  if (v11 - 1 != objc_msgSend(v9, "year"))
    goto LABEL_7;
  v12 = objc_msgSend(v9, "month");
  v13 = 1;
LABEL_6:
  v14 = v12 == v13;
LABEL_8:

  return v14;
}

- (uint64_t)isSameYearWithDate:()MOExtensions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", a1, v5, 4);

  return v7;
}

- (uint64_t)isFollowingYearAfterDate:()MOExtensions
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "dateByAddingTimeInterval:", 31536000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", a1, v4, 4);

  return v6;
}

- (id)startOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)startOfDayWithBoundaryOfADay:()MOExtensions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "dateByAddingTimeInterval:", -a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hours
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 32, a1);

  return v3;
}

- (uint64_t)minutes
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 64, a1);

  return v3;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_2);
  return (id)dateFormatter_dateFormatter;
}

+ (id)firstSaturdayBeforeReferenceDate:()MOExtensions
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToDate:", v4);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "isEqualToDate:", v8);

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "components:fromDate:", 512, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "weekday");
        v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v13, "setDay:", 7 * (v12 / 7) - v12);
        objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v13, v3, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "components:fromDate:", 28, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHour:", 0);
        objc_msgSend(v15, "setMinute:", 0);
        objc_msgSend(v15, "setSecond:", 0);
        objc_msgSend(v10, "dateFromComponents:", v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)dayNameFormatterInEnglish
{
  if (dayNameFormatterInEnglish_onceToken != -1)
    dispatch_once(&dayNameFormatterInEnglish_onceToken, &__block_literal_global_7);
  return (id)dayNameFormatterInEnglish_dateFormatter;
}

+ (id)relativeBundleDateFormatter
{
  if (relativeBundleDateFormatter_onceToken != -1)
    dispatch_once(&relativeBundleDateFormatter_onceToken, &__block_literal_global_12);
  return (id)relativeBundleDateFormatter_dateFormatter;
}

+ (id)monthDayFormatter
{
  if (monthDayFormatter_onceToken != -1)
    dispatch_once(&monthDayFormatter_onceToken, &__block_literal_global_13);
  return (id)monthDayFormatter_dateFormatter;
}

- (id)getBundleRelativeDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double v8;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dayNameFormatterInEnglish");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dayNameFormatterInEnglish");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _mo_log_facility_get_os_log(MOLogFacilityNotificationManager);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_INFO, "bundleDay: %@, nowDay: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(a1, "timeIntervalSinceNow");
  if (v8 < 0.0)
    v8 = -v8;
  if (v8 > 604800.0 || v3 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monthDayFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", a1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v3;
  }

  return v11;
}

@end
