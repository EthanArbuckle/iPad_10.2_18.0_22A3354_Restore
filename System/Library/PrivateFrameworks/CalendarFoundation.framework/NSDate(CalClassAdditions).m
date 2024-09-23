@implementation NSDate(CalClassAdditions)

- (BOOL)CalIsBeforeOrSameAsDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)CalIsAfterOrSameAsDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)CalIsBeforeDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)CalIsAfterDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

+ (id)CalDateForBeginningOfToday
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_todayComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_todayComponents
{
  void *v1;

  objc_msgSend(a1, "_nowComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHour:", 0);
  objc_msgSend(v1, "setMinute:", 0);
  objc_msgSend(v1, "setSecond:", 0);
  return v1;
}

+ (id)_nowComponents
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CalDateForNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 33022, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)CalDateForNow
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)timeStringAlwaysIncludeMinutes:()CalClassAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3578], "CalSharedDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 1);
  if ((a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 96, a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "minute"))
    {
      objc_msgSend(v5, "stringFromDate:", a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "AMSymbol");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfString:", v9);

      objc_msgSend(v5, "PMSymbol");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "rangeOfString:", v11);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL || v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (void *)MEMORY[0x1E0CB3578];
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateFormatFromTemplate:options:locale:", CFSTR("h a"), 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDateFormat:", v15);

      }
    }

  }
  objc_msgSend(v5, "stringFromDate:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)CalIsBetweenStartDate:()CalClassAdditions endDate:
{
  id v6;
  id v7;
  _BOOL8 v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "compare:", a1) == -1 || !objc_msgSend(a1, "compare:", v6))
    v8 = objc_msgSend(a1, "compare:", v7) == -1 || objc_msgSend(a1, "compare:", v7) == 0;
  else
    v8 = 0;

  return v8;
}

+ (id)calGMT
{
  if (calGMT_onceToken != -1)
    dispatch_once(&calGMT_onceToken, &__block_literal_global_9);
  return (id)calGMT_gmt;
}

- (id)dateInTimeZone:()CalClassAdditions fromTimeZone:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x194009F94]();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "calGMT");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D68], "calGMT");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v7);
  objc_msgSend(v9, "components:fromDate:", 33022, a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v6);
  objc_msgSend(v10, "setCalendar:", v9);
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v11;
}

- (id)components:()CalClassAdditions forDayInTimeZone:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "calGMT");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend(v7, "components:fromDate:", a3, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCalendar:", v7);

  return v8;
}

- (id)dateForDayInTimeZone:()CalClassAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "components:forDayInTimeZone:", 30, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ek_ios_dateForEndOfDayInTimeZone:()CalClassAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "components:forDayInTimeZone:", 30, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)CalSimulatedDateForNow
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[CalFoundationPreferences shared](CalFoundationPreferences, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "stopTimeDemoModeActive");

  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalFoundationPreferences shared](CalFoundationPreferences, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopTimeDemoModeComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "dateByAddingCalSimulatedOffset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dateByAddingCalSimulatedOffset
{
  void *v2;
  void *v3;

  +[CalFoundationPreferences shared](CalFoundationPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulatedDateForNowOffset");
  objc_msgSend(a1, "dateByAddingTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dateBySubtractingCalSimulatedOffset
{
  void *v2;
  double v3;
  void *v4;

  +[CalFoundationPreferences shared](CalFoundationPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulatedDateForNowOffset");
  objc_msgSend(a1, "dateByAddingTimeInterval:", -v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)CalDateForEndOfToday
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_todayComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_tomorrowComponents
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setDay:", 1);
  objc_msgSend(a1, "CalDateForBeginningOfToday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "components:fromDate:", 30, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)CalDateForBeginningOfTomorrow
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tomorrowComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)CalDateForEndOfTomorrow
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tomorrowComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dateFromISO8601String:()CalClassAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E80];
  v4 = a3;
  objc_msgSend(v3, "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateFromISO8601String:inTimeZone:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateFromISO8601String:()CalClassAdditions inTimeZone:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0CB3578];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(v8, "setTimeZone:", v6);
  objc_msgSend(v8, "dateFromString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)toISO8601String
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(v2, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allComponentsInCalendar:()CalClassAdditions
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "components:fromDate:", -1, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", -1, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)dateOnlyComponentsInCalendar:()CalClassAdditions
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "components:fromDate:", 542, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 542, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)timeOnlyComponentsInCalendar:()CalClassAdditions
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "components:fromDate:", 32992, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 32992, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)dateOnlyByTranslatingFrom:()CalClassAdditions toCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(a1, "dateOnlyComponentsInCalendar:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "dateRemovingTimeComponentsInCalendar:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (uint64_t)yearInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");

  if (!v4)
  return v7;
}

- (uint64_t)monthInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 8, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "month");

  if (!v4)
  return v7;
}

- (uint64_t)weekInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 0x2000, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "weekOfYear");

  if (!v4)
  return v7;
}

- (uint64_t)dayInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 16, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "day");

  if (!v4)
  return v7;
}

- (uint64_t)weekdayInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 512, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "weekday");

  if (!v4)
  return v7;
}

- (uint64_t)hourInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 32, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hour");

  if (!v4)
  return v7;
}

- (uint64_t)minuteInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 64, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minute");

  if (!v4)
  return v7;
}

- (uint64_t)secondInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "components:fromDate:", 128, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "second");

  if (!v4)
  return v7;
}

- (id)dateRemovingTimeComponentsInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "dateOnlyComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateByAddingMinutes:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 64, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 64, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)dateByAddingHours:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 32, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 32, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)dateByAddingDays:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)dateByAddingWeeks:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 0x2000, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 0x2000, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)dateByAddingMonths:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 8, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 8, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)dateByAddingYears:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 4, a3, a1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 4, a3, a1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)CalDateByComponentwiseAddingSeconds:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSecond:", a3);
  if (v6)
  {
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)CalDateByComponentwiseAddingMinutes:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D78], "CalComponentForMinutes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)CalDateByComponentwiseAddingHours:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D78], "CalComponentForHours:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "CalDateByComponentwiseAddingComponents:inCalendar:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)CalDateByComponentwiseAddingComponents:()CalClassAdditions inCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "components:fromDate:", 33022, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "era") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setEra:", objc_msgSend(v8, "era") + objc_msgSend(v6, "era"));
  if (objc_msgSend(v6, "year") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setYear:", objc_msgSend(v8, "year") + objc_msgSend(v6, "year"));
  if (objc_msgSend(v6, "month") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setMonth:", objc_msgSend(v8, "month") + objc_msgSend(v6, "month"));
  if (objc_msgSend(v6, "day") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setDay:", objc_msgSend(v8, "day") + objc_msgSend(v6, "day"));
  if (objc_msgSend(v6, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setHour:", objc_msgSend(v8, "hour") + objc_msgSend(v6, "hour"));
  if (objc_msgSend(v6, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") + objc_msgSend(v6, "minute"));
  if (objc_msgSend(v6, "second") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setSecond:", objc_msgSend(v8, "second") + objc_msgSend(v6, "second"));
  if (objc_msgSend(v6, "nanosecond") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setNanosecond:", objc_msgSend(v8, "nanosecond") + objc_msgSend(v6, "nanosecond"));
  if (v7)
  {
    objc_msgSend(v7, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, a1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "CalIsBeforeDate:", a1))
  {
    objc_msgSend(v7, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextDaylightSavingTimeTransitionAfterDate:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "CalIsBeforeOrSameAsDate:", a1)
      && objc_msgSend(v13, "CalIsAfterDate:", v11))
    {
      objc_msgSend(v7, "components:fromDate:", 33022, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hour");
      v16 = v15 - objc_msgSend(v8, "hour");
      v17 = objc_msgSend(v14, "minute");
      v18 = v17 - objc_msgSend(v8, "minute");
      v19 = objc_msgSend(v14, "second");
      v20 = (uint64_t)((float)((float)v16 * 3600.0) + (double)v18 * 60.0 + (double)(v19 - objc_msgSend(v8, "second")));
      if (v20 >= 1)
      {
        objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v21;
      }

    }
  }

  return v9;
}

- (id)roundSecondsDownInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "allComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", 0);
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)roundSecondsAndMinutesDownInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "allComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", 0);
  objc_msgSend(v5, "setMinute:", 0);
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)roundSecondsAndMinutesUpInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "allComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "minute") >= 1)
    objc_msgSend(v5, "setHour:", objc_msgSend(v5, "hour") + 1);
  objc_msgSend(v5, "setSecond:", 0);
  objc_msgSend(v5, "setMinute:", 0);
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)roundUpOneSecondIfAt59InCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "timeOnlyComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hour") == 23 && objc_msgSend(v5, "minute") == 59 && objc_msgSend(v5, "second") == 59)
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 128, 1, a1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  v7 = v6;

  return v7;
}

- (id)subtractOneSecondIfAt0InCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "timeOnlyComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hour") || objc_msgSend(v5, "minute") || objc_msgSend(v5, "second"))
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 128, -1, a1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)roundToCurrentWeekInCalendar:()CalClassAdditions withFirstWeekdayIndex:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(a1, "weekdayInCalendar:", v6);
  if (a4 <= v7)
    v8 = a4 - v7;
  else
    v8 = a4 - v7 - 7;
  objc_msgSend(a1, "dateByAddingDays:inCalendar:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)roundToCurrentMondayInCalendar:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "ordinalityOfUnit:inUnit:forDate:", 512, 0x2000, a1);
  v6 = 2;
  if (v5 < 2)
    v6 = -5;
  objc_msgSend(a1, "dateByAddingDays:inCalendar:", v6 - v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)roundToCurrentMonthInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dateOnlyComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)roundToCurrentYearInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dateOnlyComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(v5, "setMonth:", 1);
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateWithDatePartFromDate:()CalClassAdditions timePartFromDate:inCalendar:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a5;
  if (v7)
  {
    v8 = v7;
    v9 = a4;
    v10 = a3;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99D48];
    v12 = a4;
    v13 = a3;
    objc_msgSend(v11, "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a3, "dateOnlyComponentsInCalendar:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a4, "timeOnlyComponentsInCalendar:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHour:", objc_msgSend(v15, "hour"));
  objc_msgSend(v14, "setMinute:", objc_msgSend(v15, "minute"));
  objc_msgSend(v14, "setSecond:", objc_msgSend(v15, "second"));
  objc_msgSend(v8, "dateFromComponents:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isAfterDate:()CalClassAdditions
{
  return a3 && objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isBeforeDate:()CalClassAdditions
{
  return a3 && objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)compareDateIgnoringTimeComponents:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = a3;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D48];
    v10 = a3;
    objc_msgSend(v9, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "dateRemovingTimeComponentsInCalendar:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "dateRemovingTimeComponentsInCalendar:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "compare:", v12);
  return v13;
}

- (uint64_t)isSameMonthAsDate:()CalClassAdditions inCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "components:fromDate:", 14, a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 14, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "CalIsSameMonthAsComponents:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)isSameWeekAsDate:()CalClassAdditions inCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v6, objc_msgSend(v6, "firstWeekday"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v6, objc_msgSend(v6, "firstWeekday"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqualToDate:", v9);
  return v10;
}

- (uint64_t)isSameYearAsDate:()CalClassAdditions inCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "components:fromDate:", 6, a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 6, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "CalIsSameYearAsComponents:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)isEqualToDateIgnoringTimeComponents:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = a3;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D48];
    v10 = a3;
    objc_msgSend(v9, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "dateOnlyComponentsInCalendar:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "dateOnlyComponentsInCalendar:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "CalIsSameDayAsComponents:", v12);
  return v13;
}

- (BOOL)isBeforeDayForDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") == -1;
}

- (BOOL)isBeforeOrSameDayAsDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") != 1;
}

- (BOOL)isAfterDayForDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") == 1;
}

- (BOOL)isAfterOrSameDayAsDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") != -1;
}

- (uint64_t)isTodayInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateRemovingTimeComponentsInCalendar:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateRemovingTimeComponentsInCalendar:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDate:", v6);

  return v8;
}

- (id)CalDateRoundedDownToNearestMinuteIncrement:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3 <= 0)
  {
    v10 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "allComponentsInCalendar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3 != 1)
      objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a3 * a3);
    objc_msgSend(v9, "setSecond:", 0);
    objc_msgSend(v9, "setNanosecond:", 0);
    objc_msgSend(v7, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)dateRoundedToNearestFifteenMinutesInCalendar:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(a1, "minuteInCalendar:", v4) % 15;
  v6 = 15;
  if (v5 < 8)
    v6 = 0;
  objc_msgSend(a1, "dateByAddingMinutes:inCalendar:", v6 - v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)dateRoundedDownToNearestFiveMinutesInCalendar:()CalClassAdditions
{
  return objc_msgSend(a1, "CalDateRoundedDownToNearestMinuteIncrement:inCalendar:", 5, a3);
}

- (id)dateRoundedToHourOnSameDayInCalendar:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(a1, "hourInCalendar:", v4);
  if (v5 != objc_msgSend(v4, "hoursInDay") - 1 && objc_msgSend(a1, "minuteInCalendar:", v4) > 29)
    ++v5;
  objc_msgSend(a1, "allComponentsInCalendar:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHour:", v5);
  objc_msgSend(v6, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateRoundedToStartOfNextDayInCalendar:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dateRemovingTimeComponentsInCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingDays:inCalendar:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nextRoundedHour
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateByAddingMinutes:inCalendar:", 30, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateRoundedToHourOnSameDayInCalendar:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)nextRoundedChunkForDuration:()CalClassAdditions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D48], "sharedAutoupdatingCurrentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 124, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1 > 1800.0)
    goto LABEL_12;
  v5 = objc_msgSend(v4, "minute");
  if (a1 > 900.0)
  {
    if (v5 > 30)
      goto LABEL_12;
    goto LABEL_8;
  }
  if (v5 > 15)
  {
    if ((unint64_t)v5 <= 0x1E)
    {
LABEL_8:
      v6 = v4;
      v7 = 30;
      goto LABEL_9;
    }
    if ((unint64_t)v5 > 0x2D)
    {
LABEL_12:
      objc_msgSend(v4, "setMinute:", 0);
      objc_msgSend(v2, "dateFromComponents:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingHours:inCalendar:", 1, v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    v6 = v4;
    v7 = 45;
  }
  else
  {
    v6 = v4;
    v7 = 15;
  }
LABEL_9:
  objc_msgSend(v6, "setMinute:", v7);
  objc_msgSend(v2, "dateFromComponents:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v8;
}

- (void)printComparisonToDate:()CalClassAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allComponentsInCalendar:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allComponentsInCalendar:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.15();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.14();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.13();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.12();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.11();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.10();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.9();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.8();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.7();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.6();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.5();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.4();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.3();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.2();

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.1();

}

- (uint64_t)localizedMonthShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("MMM");
  else
    v3 = CFSTR("MMMM");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedMonthAndYearStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("yMMM");
  else
    v3 = CFSTR("yMMMM");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedMonthAndDayStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("MMMd");
  else
    v3 = CFSTR("MMMMd");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedYearMonthAndDayStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("yMMMd");
  else
    v3 = CFSTR("yMMMMd");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedWeekdayMonthDayYearStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("yMMMEd");
  else
    v3 = CFSTR("yMMMMEEEEd");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedWeekdayMonthYearStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("EMMMy");
  else
    v3 = CFSTR("EEEEmMMMy");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (uint64_t)localizedWeekdayMonthDayStringShortened:()CalClassAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("MMMEd");
  else
    v3 = CFSTR("MMMMEEEEd");
  return objc_msgSend(a1, "localizedDateStringWithTemplate:", v3);
}

- (id)localizedDateStringWithTemplate:()CalClassAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3578];
  v5 = a3;
  objc_msgSend(v4, "CalSharedDateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateFormat:", v9);
  objc_msgSend(v6, "stringFromDate:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedWeekNumber
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "weekInCalendar:", 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringFromNumber:numberStyle:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedRelativeDateStringShortened:()CalClassAdditions
{
  return objc_msgSend(a1, "_stringWithUseAbbreviatedFormats:lowerCase:", a3, 0);
}

- (id)_stringWithUseAbbreviatedFormats:()CalClassAdditions lowerCase:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v29;
  void *v30;

  if (_stringWithUseAbbreviatedFormats_lowerCase__onceToken != -1)
    dispatch_once(&_stringWithUseAbbreviatedFormats_lowerCase__onceToken, &__block_literal_global_45_0);
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_stringWithUseAbbreviatedFormats_lowerCase__calendar, "setTimeZone:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateRemovingTimeComponentsInCalendar:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateRemovingTimeComponentsInCalendar:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_stringWithUseAbbreviatedFormats_lowerCase__calendar, "components:fromDate:toDate:options:", 240, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "day"))
  {
    +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      v13 = CFSTR("today");
    else
      v13 = CFSTR("Today");
    goto LABEL_26;
  }
  if (objc_msgSend(v11, "day") == -1)
  {
    +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      v13 = CFSTR("yesterday");
    else
      v13 = CFSTR("Yesterday");
    goto LABEL_26;
  }
  if (objc_msgSend(v11, "day") != 1)
  {
    v14 = objc_msgSend(v11, "day");
    if (v14 >= 0)
      v15 = v14;
    else
      v15 = -v14;
    if (v15 > 6)
    {
      objc_msgSend(a1, "localizedWeekdayMonthDayStringShortened:", a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3578], "CalSharedDateFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if ((_DWORD)a3)
      v17 = CFSTR("EEE");
    else
      v17 = CFSTR("EEEE");
    objc_msgSend(v16, "setDateFormat:", v17);
    objc_msgSend(v12, "stringFromDate:", a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_stringWithUseAbbreviatedFormats_lowerCase__calendar, "components:fromDate:", 0x2000, a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "weekOfYear");

    objc_msgSend((id)_stringWithUseAbbreviatedFormats_lowerCase__calendar, "components:fromDate:", 0x2000, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "weekOfYear");

    v23 = objc_msgSend(v11, "day");
    +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v23 & 0x8000000000000000) == 0)
    {
      if (v20 <= v22)
      {
        if (a4)
        {
          v26 = CFSTR("this %@ (in this week)");
          goto LABEL_35;
        }
        v26 = CFSTR("This %@ (in this week)");
      }
      else
      {
        if (a4)
        {
          v26 = CFSTR("this %@ (in next week)");
LABEL_35:
          v29 = CFSTR("this %@");
LABEL_45:
          objc_msgSend(v24, "localizedStringForKey:value:table:", v26, v29, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
        v26 = CFSTR("This %@ (in next week)");
      }
      v29 = CFSTR("This %@");
      goto LABEL_45;
    }
    if (v20 >= v22)
    {
      if (a4)
      {
        v26 = CFSTR("last %@ (in this week)");
        goto LABEL_38;
      }
      v26 = CFSTR("Last %@ (in this week)");
    }
    else
    {
      if (a4)
      {
        v26 = CFSTR("last %@ (in previous week)");
LABEL_38:
        v29 = CFSTR("last %@");
        goto LABEL_45;
      }
      v26 = CFSTR("Last %@ (in previous week)");
    }
    v29 = CFSTR("Last %@");
    goto LABEL_45;
  }
  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v13 = CFSTR("tomorrow");
  else
    v13 = CFSTR("Tomorrow");
LABEL_26:
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E2A86598, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
  return v27;
}

- (uint64_t)midnightOffsetMinutes:()CalClassAdditions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a3, "components:fromDate:", 96, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hour");
  v5 = objc_msgSend(v3, "minute") + 60 * v4;

  return v5;
}

- (id)dateRemovingComponents:()CalClassAdditions inCalendar:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "components:fromDate:", ~a3, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)localizedYear
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullYearFormat"));
}

- (uint64_t)localizedFullMonth
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullMonthFormat"));
}

- (uint64_t)localizedDayOfMonth
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALDayOfMonthFormat"));
}

- (uint64_t)localizedFullDateAndTime
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullDateAndTimeFormat"));
}

- (uint64_t)localizedShortDateAndTime
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALShortDateAndTimeFormat"));
}

- (uint64_t)localizedFullDate
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullDateFormat"));
}

- (uint64_t)localizedLongDate
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALLongDateFormat"));
}

- (id)localizedAbbrevDate
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedAbbrevDateInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedAbbrevDateInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALAbbrevDateFormat"), a3);
}

- (uint64_t)localizedDayOfWeekWithAbbrevDateInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALLongDayOfWeekAbbrevDateWithoutYearFormat"), a3);
}

- (uint64_t)localizedShortDate
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALShortDateFormat"));
}

- (uint64_t)localizedFullYearMonth
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullYearMonth"));
}

- (uint64_t)localizedFullMonthWeekdayDay
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullDateWithoutYearFormat"));
}

- (uint64_t)localizedAbbrevMonthWeekdayDay
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALAbbrevDateWithoutYearFormat"));
}

- (uint64_t)localizedFullMonthWithDay
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullMonthWithDay"));
}

- (id)localizedAbbrevMonthWithDay
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedAbbrevMonthWithDayInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedAbbrevMonthWithDayInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALAbbrevMonthWithDay"), a3);
}

- (uint64_t)localizedShortMonthWithDay
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALShortMonthWithDay"));
}

- (id)localizedMonthWithDayWithPreferredShortening
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "CalPrefersFullMonthDisplayNames");

  if (v3)
    objc_msgSend(a1, "localizedFullMonthWithDay");
  else
    objc_msgSend(a1, "localizedAbbrevMonthWithDay");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)localizedFullStandaloneWeekday
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullDayOfWeekFormat"));
}

- (uint64_t)localizedShortStandaloneWeekday
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALAbbrevDayOfWeekFormat"));
}

- (uint64_t)localizedFullWeekdayWithDayOfMonth
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALLongDayOfWeekWithDayOfMonthFormat"));
}

- (uint64_t)localizedAbbrevWeekdayWithDayOfMonth
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALAbbrevDayOfWeekWithDayOfMonthFormat"));
}

- (uint64_t)rangeOfDayInLocalizedDateString:()CalClassAdditions
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
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "CalSharedDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("d"), 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateFormat:", v8);

  objc_msgSend(v7, "stringFromDate:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "rangeOfString:", v9);
  v12 = v11;
  objc_msgSend(v7, "setDateFormat:", CFSTR("d"));
  objc_msgSend(v7, "stringFromDate:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0)
    v15 = objc_msgSend(v5, "rangeOfString:options:", v13, 4);
  else
    v15 = objc_msgSend(v5, "rangeOfString:options:range:locale:", v13, 0, v10, v12, v6);
  v16 = v15;

  return v16;
}

- (id)localizedAbbrevWeekdayWithDayOfMonthPreferWeekdayFirstForEnglish
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("en"));

  if (!v4)
    goto LABEL_5;
  +[CalChronometry activeCalendar](CalChronometry, "activeCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "weekdayInCalendar:", v5);

  objc_msgSend(a1, "localizedDayOfMonth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  +[CalDateLocalization sharedDateFormatter](CalDateLocalization, "sharedDateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortStandaloneWeekdaySymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6 - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v8);
  if (!v12)
  {
LABEL_5:
    objc_msgSend(a1, "localizedAbbrevWeekdayWithDayOfMonth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)localizedAbbrevMonthWithDayRangeToDate:()CalClassAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  const __CFString *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3590];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setDateStyle:", 0);
  objc_msgSend(v6, "setTimeStyle:", 0);
  objc_msgSend(v6, "setBoundaryStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "CalUnableToAbbreviateMonthNames") & 1) != 0
    || (objc_msgSend(v7, "languageCode"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("vi")),
        v8,
        (v9 & 1) != 0))
  {
    v10 = CFSTR("MMd");
  }
  else if (objc_msgSend(v7, "CalPrefersFullMonthDisplayNames"))
  {
    v10 = CFSTR("MMMMd");
  }
  else
  {
    v10 = CFSTR("MMMd");
  }
  objc_msgSend(v6, "setDateTemplate:", v10);
  objc_msgSend(v6, "stringFromDate:toDate:", a1, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedAbbrevStandaloneMonth
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("LLL"));
  objc_msgSend(v2, "setFormattingContext:", 2);
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedTime
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALFullTimeFormat"));
}

- (id)localizedShortTime
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedShortTimeInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedShortTimeInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALShortTimeFormat"), a3);
}

- (id)localizedHour
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedHourInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedHourInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALHourFormat"), a3);
}

- (id)localizedHourMinutesWithoutAMPM
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedHourMinutesWithoutAMPMInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)localizedHourMinutesWithoutAMPMInTimeZone:()CalClassAdditions
{
  return objc_msgSend(a1, "localizedStringWithFormat:timeZone:", CFSTR("CALHourMinutesWithoutAMPMFormat"), a3);
}

- (uint64_t)localizedHourWithoutAMPM
{
  return objc_msgSend(a1, "localizedStringWithFormat:", CFSTR("CALHourWithoutAMPMFormat"));
}

- (id)localizedStringForEventTime
{
  void *v2;
  void *v3;

  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringForEventTimeInTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedStringForEventTimeInTimeZone:()CalClassAdditions
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = +[CalDateLocalization hasAMPM](CalDateLocalization, "hasAMPM");
  v6 = +[CalDateLocalization uses24HourTime](CalDateLocalization, "uses24HourTime");
  if (v5 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    objc_msgSend(v9, "setTimeZone:", v4);
    if (objc_msgSend(a1, "minuteInCalendar:", v9))
      objc_msgSend(a1, "localizedShortTimeInTimeZone:", v4);
    else
      objc_msgSend(a1, "localizedHourInTimeZone:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "localizedHourMinutesWithoutAMPMInTimeZone:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)CalDateRangeStringWithStart:()CalClassAdditions end:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Date range %@ to %@"), CFSTR("%@ to %@"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)printComparisonToDate:()CalClassAdditions .cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "nanosecond");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "nanosecond");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "nanosecond: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "second");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "second");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "second: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "minute");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "minute");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "minute %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "hour");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "hour");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "hour: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.5()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "weekdayOrdinal");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "weekdayOrdinal");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "weekdayOrdinal: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.6()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "weekday");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "weekday");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "weekday: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.7()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "weekOfYear");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "weekOfYear");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "weekOfYear: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.8()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "weekOfMonth");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "weekOfMonth");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "weekOfMonth: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.9()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "day");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "day");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "day: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.10()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "month");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "month");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "month: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.11()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "quarter");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "quarter");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "quarter: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.12()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "year");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "year");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "Year: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.13()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "era");
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "era");
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "Era: %@ vs %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.14()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_0();
  objc_msgSend(v1, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v4, v5, "TimeZone: %@ vs %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)printComparisonToDate:()CalClassAdditions .cold.15()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  OUTLINED_FUNCTION_5_0();
  objc_msgSend(v1, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v5, v6, "Calendar: %@ vs %@", v7, v8, v9, v10, 2u);

}

@end
