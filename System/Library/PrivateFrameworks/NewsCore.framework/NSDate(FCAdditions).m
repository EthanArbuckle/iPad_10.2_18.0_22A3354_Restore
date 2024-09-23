@implementation NSDate(FCAdditions)

- (BOOL)fc_isLaterThan:()FCAdditions withPrecision:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v8 <= v10)
    return 0;
  v11 = 0.001;
  if (a4 != 1)
    v11 = 0.0;
  if (a4 == 2)
    v11 = 1.0;
  return vabdd_f64(v8, v10) >= v11;
}

- (double)fc_timeIntervalUntilNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return -v1;
}

+ (double)fc_timeIntervalOneDay
{
  return 86400.0;
}

- (BOOL)fc_isLaterThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (uint64_t)fc_dateBySubtractingTimeInterval:()FCAdditions
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:", -a3);
}

- (unint64_t)fc_millisecondTimeIntervalSince1970
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (unint64_t)(fmax(v1, 0.0) * 1000.0);
}

- (unint64_t)fc_millisecondTimeIntervalUntilNow
{
  void *v2;
  double v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", a1);
  v4 = (unint64_t)(fmax(v3, 0.0) * 1000.0);

  return v4;
}

+ (double)fc_timeIntervalOneHour
{
  return 3600.0;
}

+ (double)fc_timeIntervalOneWeek
{
  return 604800.0;
}

+ (id)fc_dateFromString:()FCAdditions possibleFormats:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "string != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "+[NSDate(FCAdditions) fc_dateFromString:possibleFormats:]";
    v26 = 2080;
    v27 = "NSDate+FCAdditions.m";
    v28 = 1024;
    v29 = 56;
    v30 = 2114;
    v31 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "formats != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "+[NSDate(FCAdditions) fc_dateFromString:possibleFormats:]";
    v26 = 2080;
    v27 = "NSDate+FCAdditions.m";
    v28 = 1024;
    v29 = 57;
    v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1A8580B64]();
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatterWithFormat:forReuse:", v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateFromString:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v13);
      if (v15)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v15 = 0;
  }

  return v15;
}

+ (id)fc_dateFromStringWithISO8601Format:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_dateFromString:possibleFormats:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fc_dateFromStringWithHTTPHeaderFormat:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("EEE, dd MMM yyyy HH:mm:ss z");
  v9[1] = CFSTR("EEEE, dd-MMM-yy HH:mm:ss z");
  v9[2] = CFSTR("EEE MMM d HH:mm:ss yyyy");
  v9[3] = CFSTR("EEE MMM dd HH:mm:ss z yyyy");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_dateFromString:possibleFormats:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_dateWithTimeIntervalBeforeNow:()FCAdditions
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:", -a3);
}

- (BOOL)fc_isEarlierThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)fc_isEarlierThanOrEqualTo:()FCAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)fc_isEarlierThan:()FCAdditions withPrecision:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v8 >= v10)
    return 0;
  v11 = 0.001;
  if (a4 != 1)
    v11 = 0.0;
  if (a4 == 2)
    v11 = 1.0;
  return vabdd_f64(v8, v10) >= v11;
}

- (BOOL)fc_isLaterThanOrEqualTo:()FCAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)fc_isWithinTimeInterval:()FCAdditions ofDate:
{
  double v3;

  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) <= a2;
}

+ (uint64_t)fc_dateWithMillisecondTimeIntervalSince1970:()FCAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0);
}

- (unint64_t)fc_millisecondTimeIntervalSinceDate:()FCAdditions
{
  id v4;
  double v5;
  double v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "date");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSDate(FCAdditions) fc_millisecondTimeIntervalSinceDate:]";
    v11 = 2080;
    v12 = "NSDate+FCAdditions.m";
    v13 = 1024;
    v14 = 176;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return (unint64_t)(fmax(v6, 0.0) * 1000.0);
}

- (id)fc_dateOfEarliestGregorianCalendarDay
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  v7 = 0;
  objc_msgSend(v3, "rangeOfUnit:startDate:interval:forDate:", 16, &v7, 0, a1);
  v5 = v7;

  return v5;
}

- (uint64_t)fc_GregorianCalendarDaysSinceDate:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "date");
    *(_DWORD *)buf = 136315906;
    v15 = "-[NSDate(FCAdditions) fc_GregorianCalendarDaysSinceDate:]";
    v16 = 2080;
    v17 = "NSDate+FCAdditions.m";
    v18 = 1024;
    v19 = 201;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v4, "fc_dateOfEarliestGregorianCalendarDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_dateOfEarliestGregorianCalendarDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  return v11;
}

- (uint64_t)isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateInToday:", a1);

  return v3;
}

- (uint64_t)isInFuture
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "fc_isLaterThan:", v2);

  return v3;
}

- (BOOL)fc_isWeekend
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 524, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "weekday") == 1 || objc_msgSend(v4, "weekday") == 7;
  return v5;
}

- (uint64_t)fc_isSameDayAs:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "isEqual:", v9);
  return v10;
}

+ (id)fc_earlierDateAllowingNilWithDate:()FCAdditions andDate:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "earlierDate:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

+ (id)fc_laterDateAllowingNilWithDate:()FCAdditions andDate:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "laterDate:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

+ (id)fc_dateRoundedToNearestMinuteForDate:()FCAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 124, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fc_dateRoundedToNearestDayForDate:()FCAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fc_dateByRoundingDownToNearestQuarterHour
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 124, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setMinute:", (uint64_t)(floor((double)objc_msgSend(v3, "minute") / 15.0) * 15.0));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fc_stringWithISO8601Format
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatterWithFormat:forReuse:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fc_stringWithYearAndMonthFormat
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_fr_sharedYearAndMonthDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fc_adjustToRecentDate
{
  id v1;
  double v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "fc_timeIntervalUntilNow");
  if (v2 > 86400.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(double)((int)v2 % 86400));
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  return v1;
}

+ (id)_fr_sharedYearAndMonthDateFormatter
{
  if (_MergedGlobals_201 != -1)
    dispatch_once(&_MergedGlobals_201, &__block_literal_global_152);
  return (id)qword_1ED0F8720;
}

@end
