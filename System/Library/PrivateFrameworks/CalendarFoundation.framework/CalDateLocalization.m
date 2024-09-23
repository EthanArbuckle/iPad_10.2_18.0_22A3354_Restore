@implementation CalDateLocalization

+ (void)initializeFormatters
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if ((__FormattersInitialized & 1) == 0)
  {
    __FormattersInitialized = 1;
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)__ICUFormats;
    __ICUFormats = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)__DateFormatters;
    __DateFormatters = (uint64_t)v5;

    objc_msgSend(a1, "generateLocalizedDateTimeFormats");
  }
  objc_sync_exit(obj);

}

+ (void)rebuildFormatters
{
  void *v3;
  void *v4;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = (void *)__SharedFormatter;
  __SharedFormatter = 0;

  v4 = (void *)__CalendarDayFormatter;
  __CalendarDayFormatter = 0;

  objc_msgSend(a1, "generateLocalizedDateTimeFormats");
  objc_sync_exit(obj);

}

+ (void)rebuildWeekendDays
{
  void *v2;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)__WeekendDays;
  __WeekendDays = 0;

  objc_sync_exit(obj);
}

+ (id)locale
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
}

+ (__CFLocale)createCFLocale
{
  void *v2;
  __CFString *v3;
  __CFLocale *v4;

  objc_msgSend(a1, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v4 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3);
  return v4;
}

+ (id)sharedDateFormatter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)__SharedFormatter;
  if (!__SharedFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)__SharedFormatter;
    __SharedFormatter = (uint64_t)v5;

    objc_msgSend((id)__SharedFormatter, "setDateFormat:", 0);
    objc_msgSend((id)__SharedFormatter, "setDateStyle:", 0);
    objc_msgSend((id)__SharedFormatter, "setTimeStyle:", 0);
    v7 = (void *)__SharedFormatter;
    objc_msgSend(a1, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    v9 = (void *)__SharedFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    v4 = (void *)__SharedFormatter;
  }
  v11 = v4;
  objc_sync_exit(v3);

  return v11;
}

+ (id)timelineHourDateFormatter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)__TimelineHourFormatter;
  if (!__TimelineHourFormatter)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCalendar:", v6);

    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v7);

    objc_msgSend(a1, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v8);

    objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
    v9 = (void *)__TimelineHourFormatter;
    __TimelineHourFormatter = (uint64_t)v5;

    v4 = (void *)__TimelineHourFormatter;
  }
  v10 = v4;
  objc_sync_exit(v3);

  return v10;
}

+ (id)calendarDayFormatter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)__CalendarDayFormatter;
  if (!__CalendarDayFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v6 = (void *)__CalendarDayFormatter;
    __CalendarDayFormatter = (uint64_t)v5;

    objc_msgSend((id)__CalendarDayFormatter, "setNumberStyle:", 1);
    v7 = (void *)__CalendarDayFormatter;
    objc_msgSend(a1, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    v4 = (void *)__CalendarDayFormatter;
  }
  v9 = v4;
  objc_sync_exit(v3);

  return v9;
}

+ (id)weekendDays
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)__WeekendDays;
  if (!__WeekendDays)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)__WeekendDays;
    __WeekendDays = (uint64_t)v5;

    objc_msgSend(a1, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "UTF8String");
    ucal_open();

    v9 = 1;
    v10 = MEMORY[0x1E0C9AAA0];
    v11 = MEMORY[0x1E0C9AAB0];
    do
    {
      if (ucal_getDayOfWeekType() == 1)
        v12 = v11;
      else
        v12 = v10;
      objc_msgSend((id)__WeekendDays, "addObject:", v12);
      ++v9;
    }
    while (v9 != 8);
    ucal_close();
    v4 = (void *)__WeekendDays;
  }
  v13 = v4;
  objc_sync_exit(v3);

  return v13;
}

+ (BOOL)dateIsWeekend:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  +[CalChronometry activeCalendar](CalChronometry, "activeCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "weekdayInCalendar:", v5);

  LOBYTE(a1) = objc_msgSend(a1, "weekdayIsWeekend:", v6);
  return (char)a1;
}

+ (BOOL)weekdayIsWeekend:(int64_t)a3
{
  unint64_t v3;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  char v10;

  v3 = a3 - 1;
  if (a3 < 1)
    return 0;
  objc_msgSend(a1, "weekendDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v3 > v6)
    return 0;
  objc_msgSend(a1, "weekendDays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

+ (BOOL)hasAMPM
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(a1, "sharedDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AMSymbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "PMSymbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v7 = 0;
  }

  objc_sync_exit(v3);
  return v7;
}

+ (BOOL)uses24HourTime
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(a1, "ICUFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CALShortTimeFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v5, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  objc_sync_exit(v3);
  return v6;
}

+ (BOOL)shouldUseHourMinutesWithoutAMPMForHours
{
  if (objc_msgSend(a1, "hasAMPM"))
    return objc_msgSend(a1, "uses24HourTime");
  else
    return 1;
}

+ (id)formatKeyForHourString
{
  int v2;
  __CFString **v3;

  v2 = objc_msgSend(a1, "shouldUseHourMinutesWithoutAMPMForHours");
  v3 = CALHourMinutesWithoutAMPMFormat;
  if (!v2)
    v3 = CALHourFormat;
  return *v3;
}

+ (BOOL)requiresSingularLocalizationForDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setCalendar:", v4);
  objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invertedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", &stru_1E2A86598);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v11, "numberFromString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  if (v13)
    v14 = v13;
  else
    v14 = objc_msgSend(v4, "component:fromDate:", 32, v3);

  return v14 == 1;
}

+ (void)setupFormatter:(__CFDateFormatter *)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  CFDateFormatterGetFormat(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__DateFormatters, "setObject:forKey:", a3, v5);
  objc_msgSend((id)__ICUFormats, "setObject:forKey:", v6, v5);

}

+ (void)setupFormat:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v10;
  __CFDateFormatter *v11;
  id v12;

  v6 = a6;
  v12 = a4;
  v10 = (__CFString *)a3;
  v11 = CFDateFormatterCreate(0, (CFLocaleRef)a5, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetFormat(v11, v10);

  if (v6)
    CFDateFormatterSetProperty(v11, CFSTR("kCFDateFormatterFormattingContextKey"), &unk_1E2A9B638);
  objc_msgSend(a1, "setupFormatter:forKey:", v11, v12);
  CFRelease(v11);

}

+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5
{
  objc_msgSend(a1, "setupFormatTemplate:forKey:locale:standalone:", a3, a4, a5, 0);
}

+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v10, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(a1, "setupFormat:forKey:locale:standalone:", v13, v11, v12, v6);
    }
    else
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:].cold.1((uint64_t)v10, v12, v14);

    }
  }

}

+ (void)generateStandardFormatters:(id)a3
{
  const __CFLocale *v3;
  CFDateFormatterRef v4;
  CFDateFormatterRef v5;
  CFDateFormatterRef v6;
  CFDateFormatterRef v7;
  CFDateFormatterRef v8;
  CFDateFormatterRef v9;
  CFDateFormatterRef v10;
  CFDateFormatterRef v11;

  v3 = (const __CFLocale *)a3;
  v4 = CFDateFormatterCreate(0, v3, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v4, CFSTR("CALFullDateAndTimeFormat"));
  CFRelease(v4);
  v5 = CFDateFormatterCreate(0, v3, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v5, CFSTR("CALShortDateAndTimeFormat"));
  CFRelease(v5);
  v6 = CFDateFormatterCreate(0, v3, kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v6, CFSTR("CALFullDateFormat"));
  CFRelease(v6);
  v7 = CFDateFormatterCreate(0, v3, kCFDateFormatterLongStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v7, CFSTR("CALLongDateFormat"));
  CFRelease(v7);
  v8 = CFDateFormatterCreate(0, v3, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v8, CFSTR("CALAbbrevDateFormat"));
  CFRelease(v8);
  v9 = CFDateFormatterCreate(0, v3, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v9, CFSTR("CALShortDateFormat"));
  CFRelease(v9);
  v10 = CFDateFormatterCreate(0, v3, kCFDateFormatterNoStyle, kCFDateFormatterFullStyle);
  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v10, CFSTR("CALFullTimeFormat"));
  CFRelease(v10);
  v11 = CFDateFormatterCreate(0, v3, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);

  +[CalDateLocalization setupFormatter:forKey:](CalDateLocalization, "setupFormatter:forKey:", v11, CFSTR("CALShortTimeFormat"));
  CFRelease(v11);
}

+ (void)generateAdditionalPrecodedFormatters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8[2];

  v7 = a3;
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("j"), CFSTR("CALHourFormat"), v7);
  +[CalDateLocalization setupFormat:forKey:locale:standalone:](CalDateLocalization, "setupFormat:forKey:locale:standalone:", CFSTR("a"), CFSTR("CALAMPMFormat"), v7, 0);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("d"), CFSTR("CALDayOfMonthFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("y"), CFSTR("CALFullYearFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:](CalDateLocalization, "setupFormatTemplate:forKey:locale:standalone:", CFSTR("LLL"), CFSTR("CALAbbrevMonthFormat"), v7, 1);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:](CalDateLocalization, "setupFormatTemplate:forKey:locale:standalone:", CFSTR("LLLL"), CFSTR("CALFullMonthFormat"), v7, 1);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("cccc"), CFSTR("CALFullDayOfWeekFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("ccc"), CFSTR("CALAbbrevDayOfWeekFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("EEEEd"), CFSTR("CALLongDayOfWeekWithDayOfMonthFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("yMMMMEEEd"), CFSTR("CALAbbrevDayOfWeekWithFullDateFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("yMMMEd"), CFSTR("CALAbbrevDayOfWeekWithAbbrevDateFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMMEEEEd"), CFSTR("CALFullDateWithoutYearFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMEEEEd"), CFSTR("CALLongDayOfWeekAbbrevDateWithoutYearFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMMEEEd"), CFSTR("CALAbbrevDayOfWeekWithFullDateWithoutYearFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMEEEd"), CFSTR("CALAbbrevDateWithoutYearFormat"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMMd"), CFSTR("CALFullMonthWithDay"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:](CalDateLocalization, "setupFormatTemplate:forKey:locale:standalone:", CFSTR("yMMMM"), CFSTR("CALFullYearMonth"), v7, 1);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("MMMd"), CFSTR("CALAbbrevMonthWithDay"), v7);
  +[CalDateLocalization setupFormatTemplate:forKey:locale:](CalDateLocalization, "setupFormatTemplate:forKey:locale:", CFSTR("Md"), CFSTR("CALShortMonthWithDay"), v7);
  v8[0] = 0;
  v8[1] = 0;
  v4 = (void *)MEMORY[0x1E0CB37A0];
  _GetFormatAnd_d_FieldRangeFor_EEEd(v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    objc_msgSend(a1, "setupFormat:forKey:locale:standalone:", v6, CFSTR("CALAbbrevDayOfWeekWithDayOfMonthFormat"), v7, 0);

}

+ (id)_hourSymbolInFormat:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = CFSTR("HH");
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("HH")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("H");
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("H")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = CFSTR("KK");
      if (objc_msgSend(v3, "rangeOfString:", CFSTR("KK")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = CFSTR("K");
        if (objc_msgSend(v3, "rangeOfString:", CFSTR("K")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v4 = CFSTR("kk");
          if (objc_msgSend(v3, "rangeOfString:", CFSTR("kk")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v4 = CFSTR("k");
            if (objc_msgSend(v3, "rangeOfString:", CFSTR("k")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v4 = CFSTR("hh");
              if (objc_msgSend(v3, "rangeOfString:", CFSTR("hh")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                v4 = CFSTR("h");
                if (objc_msgSend(v3, "rangeOfString:", CFSTR("h")) == 0x7FFFFFFFFFFFFFFFLL)
                  v4 = 0;
              }
            }
          }
        }
      }
    }
  }

  return (id)v4;
}

+ (void)generateDerivedTimeFormats:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(a1, "ICUFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CALShortTimeFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hourSymbolInFormat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("jmm"), 0, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("a."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hourSymbolInFormat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") && objc_msgSend(v12, "length") && (objc_msgSend(v12, "isEqualToString:", v6) & 1) == 0)
  {
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, v6);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("a."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[CalDateLocalization setupFormat:forKey:locale:standalone:](CalDateLocalization, "setupFormat:forKey:locale:standalone:", v6, CFSTR("CALHourWithoutAMPMFormat"), v18, 0);
  +[CalDateLocalization setupFormat:forKey:locale:standalone:](CalDateLocalization, "setupFormat:forKey:locale:standalone:", v11, CFSTR("CALHourMinutesWithoutAMPMFormat"), v18, 0);

}

+ (void)generateLocalizedDateTimeFormats
{
  id v3;
  void *v4;
  id v5;

  if (__FormattersInitialized == 1)
  {
    objc_msgSend((id)__ICUFormats, "removeAllObjects");
    objc_msgSend((id)__DateFormatters, "removeAllObjects");
    if (_formattersCache)
    {
      objc_msgSend((id)_formattersCache, "removeAllObjects");
    }
    else
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = (void *)_formattersCache;
      _formattersCache = (uint64_t)v3;

    }
    objc_msgSend(a1, "locale");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateStandardFormatters:", v5);
    objc_msgSend(a1, "generateAdditionalPrecodedFormatters:", v5);
    objc_msgSend(a1, "generateDerivedTimeFormats:", v5);
    objc_msgSend(a1, "generatePreferedOrders");

  }
}

+ (void)generatePreferedOrders
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!_datesFormats)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CALFullDateFormat"), CFSTR("CALLongDateFormat"), CFSTR("CALAbbrevDateFormat"), CFSTR("CALShortDateFormat"), CFSTR("CALShortMonthWithDay"), 0);
    v3 = (void *)_datesFormats;
    _datesFormats = v2;

  }
  if (!_datesWithYear)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CALFullDateFormat"), CFSTR("CALLongDateFormat"), CFSTR("CALAbbrevDateFormat"), CFSTR("CALShortDateFormat"), 0);
    v5 = (void *)_datesWithYear;
    _datesWithYear = v4;

  }
  if (!_fullDatesWithoutYear)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CALFullDateWithoutYearFormat"), CFSTR("CALFullMonthWithDay"), CFSTR("CALAbbrevDateWithoutYearFormat"), CFSTR("CALAbbrevMonthWithDay"), CFSTR("CALShortMonthWithDay"), 0);
    v7 = (void *)_fullDatesWithoutYear;
    _fullDatesWithoutYear = v6;

  }
  if (!_datesWithoutYear)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CALFullDateWithoutYearFormat"), CFSTR("CALAbbrevDateWithoutYearFormat"), CFSTR("CALShortMonthWithDay"), 0);
    v9 = (void *)_datesWithoutYear;
    _datesWithoutYear = v8;

  }
}

+ (id)sizeOrderedDateFormats
{
  return (id)_datesFormats;
}

+ (id)sizeOrderedDateFormatsWithYear
{
  return (id)_datesWithYear;
}

+ (id)sizeOrderedDateFormatsWithoutYear
{
  return (id)_datesWithoutYear;
}

+ (id)sizeOrderedAllDateFormatsWithoutYear
{
  return (id)_fullDatesWithoutYear;
}

+ (id)ICUFormats
{
  objc_msgSend(a1, "initializeFormatters");
  return (id)__ICUFormats;
}

+ (id)dateFormatters
{
  objc_msgSend(a1, "initializeFormatters");
  return (id)__DateFormatters;
}

+ (id)ICUFormatForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "ICUFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (__CFDateFormatter)_dateFormatterForKey:(id)a3
{
  id v4;
  void *v5;
  __CFDateFormatter *v6;

  v4 = a3;
  objc_msgSend(a1, "dateFormatters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFDateFormatter *)objc_msgSend(v5, "objectForKey:", v4);

  return v6;
}

+ (id)longStringForDateAndTime:(id)a3 inTimeZone:(id)a4
{
  id v6;
  const __CFDate *v7;
  const __CFLocale *v8;
  __CFDateFormatter *v9;
  __CFDateFormatter *v10;
  const __CFString *v11;
  const __CFLocale *Locale;
  const __CFString *DateFormatFromTemplate;
  __CFString *StringWithDate;

  v6 = a4;
  v7 = (const __CFDate *)a3;
  v8 = (const __CFLocale *)objc_msgSend(a1, "createCFLocale");
  v9 = CFDateFormatterCreate(0, v8, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  v10 = v9;
  if (v6)
    v11 = CFSTR("EEE  MMM d, jmm z");
  else
    v11 = CFSTR("EEE  MMM d, jmm");
  Locale = CFDateFormatterGetLocale(v9);
  DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate(0, v11, 0, Locale);
  CFDateFormatterSetFormat(v10, DateFormatFromTemplate);
  CFDateFormatterSetProperty(v10, (CFStringRef)*MEMORY[0x1E0C9AF68], v6);

  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v10, v7);
  CFRelease(DateFormatFromTemplate);
  CFRelease(v10);
  CFRelease(v8);
  return StringWithDate;
}

+ (id)dateStringRepresentationForEventCompontentsStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 timeZone:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v10 && v11)
  {
    if (v12)
      v15 = v7;
    else
      v15 = 1;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v12;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimeZone:", v12);
    v41 = v16;
    objc_msgSend(v16, "components:fromDate:", 30, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimeZone:", v12);
    if (v7)
    {
      objc_msgSend(v11, "dateByAddingTimeInterval:", -1.0);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v19;
    }
    objc_msgSend(v18, "components:fromDate:", 30, v11);
    v40 = v17;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:");
    v21 = (void *)objc_opt_new();
    objc_msgSend(a1, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocale:", v22);

    v39 = v18;
    if (v15)
    {
      objc_msgSend(v21, "setTimeZone:", v12);
      objc_msgSend(v21, "setDateStyle:", 2);
      objc_msgSend(v21, "setTimeStyle:", !v7);
      objc_msgSend(v21, "stringFromDate:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v24 = 0;
      else
        v24 = 2;
      objc_msgSend(v21, "setDateStyle:", v24);
      objc_msgSend(v21, "setTimeStyle:", !v7);
      objc_msgSend(v21, "stringFromDate:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v20 & v7;
      v27 = (void *)MEMORY[0x1E0CB3940];
      if (v26 == 1)
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Scheduled: %@"), &stru_1E2A86598, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        objc_msgSend(v27, "localizedStringWithFormat:", v28, v23, v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
      v33 = CFSTR("Scheduled: %@ to %@");
      v34 = &stru_1E2A86598;
    }
    else
    {
      v29 = objc_msgSend(v12, "isEqualToTimeZone:", v12);
      objc_msgSend(v21, "setTimeZone:", v12);
      if (v29)
      {
        objc_msgSend(v21, "setTimeStyle:", 1);
        objc_msgSend(v21, "setDateStyle:", 2);
        objc_msgSend(v21, "stringFromDate:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          v30 = 0;
        else
          v30 = 2;
        objc_msgSend(v21, "setDateStyle:", v30);
        objc_msgSend(v21, "stringFromDate:", v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocalizedDateFormatFromTemplate:", CFSTR("z"));
        objc_msgSend(v21, "stringFromDate:", v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Scheduled: %@ to %@, %@"), &stru_1E2A86598, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringWithFormat:", v32, v23, v25, v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      objc_msgSend(v21, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d, y h:mm a z"));
      objc_msgSend(v21, "stringFromDate:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTimeZone:", v12);
      if (v20)
        v35 = CFSTR("h:mm a z");
      else
        v35 = CFSTR("MMM d, y h:mm a z");
      objc_msgSend(v21, "setLocalizedDateFormatFromTemplate:", v35);
      objc_msgSend(v21, "stringFromDate:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      v33 = CFSTR("Scheduled: %@ to %@ (with timezone information)");
      v34 = CFSTR("Scheduled: %@ to %@");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v33, v34, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v25;
    goto LABEL_27;
  }
LABEL_29:

  return v14;
}

+ (id)dateStringRepresentationForReminderStartDate:(id)a3 allDay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(a1, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  objc_msgSend(v7, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v7, "setDateStyle:", 1);
  objc_msgSend(v7, "setTimeStyle:", !v4);
  objc_msgSend(v7, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)setupFormatTemplate:(NSObject *)a3 forKey:locale:standalone:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "+[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:]";
  v8 = 2112;
  v9 = a1;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_18FC12000, a3, OS_LOG_TYPE_ERROR, "%s ERROR: unable to generate format string from template \"%@\" in locale \"%@\", (uint8_t *)&v6, 0x20u);

}

@end
