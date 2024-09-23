@implementation NSDate(RTExtensions)

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

+ (id)dateFormatter
{
  if (qword_1ECF931F8 != -1)
    dispatch_once(&qword_1ECF931F8, &__block_literal_global_6);
  return (id)_MergedGlobals_10;
}

- (BOOL)isAfterDate:()RTExtensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isBeforeDate:()RTExtensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isOnOrBefore:()RTExtensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isOnOrAfter:()RTExtensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (__CFString)getFormattedDateString
{
  id v2;
  void *v3;
  __CFString *v4;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy/MM/dd HH:mm:ss.SSS"));
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTimeZone:", v3);

    objc_msgSend(v2, "stringFromDate:", a1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("-");
  }
  return v4;
}

- (BOOL)betweenDate:()RTExtensions andDate:
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

+ (id)startOfDay
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startOfDay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
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

+ (id)endOfDay
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endOfDay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)endOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hour
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 32, a1);

  return v3;
}

- (uint64_t)minute
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 64, a1);

  return v3;
}

- (uint64_t)weekday
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v2, "component:fromDate:", 512, a1);

  return 1 << (a1 - 1);
}

- (id)weekdayStringFromDate
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("EEEE"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)stringFromTimestamp:()RTExtensions
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringFromDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)dateWithResolution:()RTExtensions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateReducedToResolution:calendar:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateWithResolution:()RTExtensions calendar:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateReducedToResolution:calendar:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dateReducedToResolution:()RTExtensions
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateReducedToResolution:calendar:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateReducedToResolution:()RTExtensions calendar:
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 >= 7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218498;
      v13 = a3;
      v14 = 2080;
      v15 = "-[NSDate(RTExtensions) dateReducedToResolution:calendar:]";
      v16 = 1024;
      v17 = 180;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "Unhandled resolution, %lu (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

    v7 = 0;
  }
  else
  {
    v7 = qword_1A5E6A1E8[a3];
  }
  objc_msgSend(v6, "components:fromDate:", v7, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dateByAddingUnit:()RTExtensions value:
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", a3, a4, a1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dateByRoundingWithTimeQuantization:()RTExtensions
{
  id v3;
  void *v5;
  void *v6;

  v3 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 96, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(objc_msgSend(v6, "minute") % a3) * -60.0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)dateWithHour:()RTExtensions minute:second:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setHour:", a3);
  objc_msgSend(v10, "setMinute:", a4);
  objc_msgSend(v10, "setSecond:", a5);
  objc_msgSend(v8, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)dateBisectingDate1:()RTExtensions date2:
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", (v8 + v10) * 0.5);
}

+ (id)roundingUpDate:()RTExtensions bucketDurationMinute:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 <= 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109634;
      v15[1] = a4;
      v16 = 2080;
      v17 = "+[NSDate(RTExtensions) roundingUpDate:bucketDurationMinute:]";
      v18 = 1024;
      v19 = 226;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "bucketDurationMinute should be greater than 0, %d (in %s:%d)", (uint8_t *)v15, 0x18u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 2097404, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 2097276, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = ceil(((float)objc_msgSend(v8, "second") / 60.0 + (float)objc_msgSend(v8, "minute")) / (double)a4);
  objc_msgSend(v10, "setMinute:", (uint64_t)(float)((float)a4 * v11));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
