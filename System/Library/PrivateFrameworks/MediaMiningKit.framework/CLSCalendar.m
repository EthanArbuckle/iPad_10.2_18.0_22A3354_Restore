@implementation CLSCalendar

+ (void)initialize
{
  objc_super v3;

  if ((id)objc_opt_class() == a1)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&OBJC_METACLASS___CLSCalendar;
    objc_msgSendSuper2(&v3, sel_initialize);
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, &__block_literal_global_5097);
  }
}

+ (BOOL)isDateValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "compare:", v4) == -1)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "compare:", v3) == -1;

    }
  }
  else
  {
    v6 = 1;
  }

  return !v6;
}

+ (id)validDateForDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        v10 = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v8;
        _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid date found: %@, using %@ instead.", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "compare:", v3);

      v8 = v3;
      if (v7 == -1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_9;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)currentLocalDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v3, "secondsFromGMTForDate:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dateComponentsWithUTCDate:(id)a3 localDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isDateValid:", v6) && objc_msgSend(a1, "isDateValid:", v7))
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1;
    objc_sync_enter(v10);
    objc_msgSend((id)sCLSDateHelperCalendar, "componentsInTimeZone:fromDate:", v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)dateComponentsWithLocalDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = a1;
    objc_sync_enter(v6);
    objc_msgSend((id)sCLSDateHelperCalendar, "componentsInTimeZone:fromDate:", sCLSDateHelperGMTTimeZone_5090, v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

  }
  return v4;
}

+ (id)dateFromComponents:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

    if (v7)
    {
      objc_msgSend(v9, "dateByAddingTimeInterval:", (double)objc_msgSend(v7, "secondsFromGMTForDate:", v9));
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)componentsFromDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "validDateForDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1;
  objc_sync_enter(v8);
  if (!v6)
    v6 = (id)sCLSDateHelperGMTTimeZone_5090;
  objc_msgSend((id)sCLSDateHelperCalendar, "componentsInTimeZone:fromDate:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

+ (id)universalDateFromLocalDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "componentsInTimeZone:fromDate:", sCLSDateHelperGMTTimeZone_5090, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
      v11 = (uint64_t)v7;
    else
      v11 = sCLSDateHelperGMTTimeZone_5090;
    objc_msgSend(v9, "setTimeZone:", v11);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v8);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)universalDateFromLocalDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "universalDateFromLocalDate:inTimeZone:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localDateFromUniversalDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v8 = a1;
    objc_sync_enter(v8);
    v9 = (void *)sCLSDateHelperGMTTimeZone_5090;
    if (v7)
      v9 = v7;
    v10 = v9;
    if (v10)
    {
      objc_msgSend((id)sCLSDateHelperCalendar, "componentsInTimeZone:fromDate:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimeZone:", sCLSDateHelperGMTTimeZone_5090);
      objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    objc_sync_exit(v8);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)localDateFromUniversalDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localDateFromUniversalDate:inTimeZone:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)universalDateFromLocalDate:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "timeZone");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (id)sCLSDateHelperGMTTimeZone_5090;
    }
    v10 = v8;
    objc_msgSend(a1, "universalDateFromLocalDate:inTimeZone:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)localDateFromUniversalDate:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "timeZone");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (id)sCLSDateHelperGMTTimeZone_5090;
    }
    v10 = v8;
    objc_msgSend(a1, "localDateFromUniversalDate:inTimeZone:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateBySettingYear:(int64_t)a3 ofDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_msgSend(v7, "components:fromDate:", -24577, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setYear:", a3);
    objc_msgSend(v7, "dateFromComponents:inTimeZone:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)localDateFormatterWithFormat:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", v4);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  return v5;
}

+ (id)timeZoneFromLocation:(id)a3
{
  return (id)objc_msgSend(a3, "timeZone");
}

+ (id)startOfDayForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend((id)sCLSDateHelperCalendar, "startOfDayForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)endOfDayForDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfDayForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateByAddingDays:toDate:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -0.01);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)startOfWeekForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:", 24576, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)endOfWeekForDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfWeekForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateByAddingWeeksOfYear:toDate:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -0.01);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)startOfMonthForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:", 14, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)endOfMonthForDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "startOfMonthForDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateByAddingMonths:toDate:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -0.01);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)components:(unint64_t)a3 fromDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "isDateValid:", v6))
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int64_t)yearFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 4, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)yearForWeekOfYearFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 0x4000, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)monthFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 8, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)weekOfYearFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 0x2000, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)weekOfMonthFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 4096, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)dayFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 16, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)dayOfWeekFromDate:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 512, v4);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = -1;
    else
      v7 = v6;
    objc_sync_exit(v5);

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (int64_t)hourFromDate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)sCLSDateHelperCalendar, "component:fromDate:", 32, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (id)dateByAddingHours:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setHour:", a3);
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateByAddingDays:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setDay:", a3);
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateByAddingMonths:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setMonth:", a3);
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateByAddingYears:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setYear:", a3);
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateByAddingWeeksOfYear:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setWeekOfYear:", a3);
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sCLSDateHelperCalendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)dateFromComponents:(unint64_t)a3 ofDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  if ((objc_msgSend(a1, "isDateValid:", v6) & 1) != 0)
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sCLSDateHelperCalendar, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (int64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:toDate:options:", 16, a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "day");
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = -v5;

  return v6;
}

+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularities:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = a1;
    objc_sync_enter(v12);
    if (((v5 & 4) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 4)) == 0)
      && ((v5 & 8) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 8)) == 0)
      && ((v5 & 0x10) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 16)) == 0)
      && ((v5 & 0x20) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 32)) == 0)
      && ((v5 & 0x40) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 64)) == 0)
      && ((v5 & 0x80) == 0
       || (v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, 128)) == 0))
    {
      v11 = 0;
    }
    objc_sync_exit(v12);

  }
  return v11;
}

+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = a1;
    objc_sync_enter(v12);
    v11 = objc_msgSend((id)sCLSDateHelperCalendar, "compareDate:toDate:toUnitGranularity:", v8, v10, a5);
    objc_sync_exit(v12);

  }
  return v11;
}

+ (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v8 = a5;
  if (objc_msgSend(a1, "isDateValid:", v8))
  {
    v9 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v9);
    v10 = objc_msgSend((id)sCLSDateHelperCalendar, "rangeOfUnit:inUnit:forDate:", a3, a4, v8);
    v12 = v11;
    objc_sync_exit(v9);

  }
  else
  {
    v12 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v10;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (BOOL)isLastWeekOfMonthForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
    v6 = objc_msgSend(a1, "dayFromDate:", v4) + 7 > v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isLastTwoWeeksOfMonthForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
    v6 = objc_msgSend(a1, "dayFromDate:", v4) + 14 > v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isFirstTwoWeeksOfMonthForLocalDate:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
    v6 = objc_msgSend(a1, "dayFromDate:", v4) - 14 < v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v13 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v13);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDateComponents:toDateComponents:options:", a3, v9, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v13);

  }
  return v12;
}

+ (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v13 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v13);
    objc_msgSend((id)sCLSDateHelperCalendar, "components:fromDate:toDate:options:", a3, v9, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v13);

  }
  return v12;
}

+ (id)northernMeteorologicalSeasonNameForDateComponents:(id)a3
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_msgSend(a3, "month");
  v4 = CFSTR("Spring");
  v5 = CFSTR("Autumn");
  if (v3 < 9)
    v5 = CFSTR("Summer");
  if (v3 >= 6)
    v4 = v5;
  if (v3 - 12 >= 0xFFFFFFFFFFFFFFF7)
    return (id)v4;
  else
    return CFSTR("Winter");
}

+ (id)southernMeteorologicalSeasonNameForDateComponents:(id)a3
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_msgSend(a3, "month");
  v4 = CFSTR("Autumn");
  v5 = CFSTR("Spring");
  if (v3 < 9)
    v5 = CFSTR("Winter");
  if (v3 >= 6)
    v4 = v5;
  if (v3 - 12 >= 0xFFFFFFFFFFFFFFF7)
    return (id)v4;
  else
    return CFSTR("Summer");
}

+ (id)s_seasonCountryCodesDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CLSCalendar_s_seasonCountryCodesDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (s_seasonCountryCodesDictionary_onceToken != -1)
    dispatch_once(&s_seasonCountryCodesDictionary_onceToken, block);
  return (id)s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary;
}

+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "s_seasonCountryCodesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("northernHemisphereCountryCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "s_seasonCountryCodesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("southernHemisphereCountryCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

+ (id)seasonNameForDateComponents:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "isCountryCodePartOfNorthernHemisphere:", v8);

  if (v9)
  {
    objc_msgSend(a1, "northernMeteorologicalSeasonNameForDateComponents:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "isCountryCodePartOfSouthernHemisphere:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_9;
    }
    objc_msgSend(a1, "southernMeteorologicalSeasonNameForDateComponents:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
LABEL_9:

  return v13;
}

+ (id)seasonNameForLocalDate:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "componentsFromDate:inTimeZone:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "seasonNameForDateComponents:locale:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isSecondHalfOfSeasonForLocalDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v9;
  BOOL v11;
  BOOL v13;
  BOOL v16;
  char v17;
  char v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    objc_msgSend(a1, "componentsFromDate:inTimeZone:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "month");
    v7 = objc_msgSend(v5, "day");
    v9 = v6 == 4 && v7 > 14;
    v11 = v6 == 7 && v7 > 14;
    v13 = v6 == 10 && v7 > 14;
    v16 = v6 == 1 && v7 > 14 || v6 == 2;
    v17 = v13 || v16;
    if (v6 == 11)
      v17 = 1;
    if (v11)
      v18 = 1;
    else
      v18 = v17;
    if (v6 == 8)
      v18 = 1;
    if (v9)
      v19 = 1;
    else
      v19 = v18;
    if (v6 == 5)
      v20 = 1;
    else
      v20 = v19;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)isFirstMonthOfSeasonForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = objc_msgSend(a1, "monthFromDate:", v4);
    if (v5 <= 0xC)
      v6 = (0x1248u >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isFirstTenDaysOfSeasonForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "containsDate:", v4);
  else
    v7 = 0;

  return v7;
}

+ (id)localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    objc_msgSend(a1, "localStartSeasonDateForLocalDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateByAddingDays:toDate:", 11, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -0.01);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isMiddleMonthOfSeasonForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = objc_msgSend(a1, "monthFromDate:", v4);
    if (v5 <= 0xA)
      v6 = (0x492u >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isLastMonthOfSeasonForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;

  v4 = a3;
  if (objc_msgSend(a1, "isDateValid:", v4))
  {
    v5 = objc_msgSend(a1, "monthFromDate:", v4);
    if (v5 <= 0xB)
      v6 = (0x8A4u >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)localStartDateForNextSeasonAfterLocalDate:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "dateByAddingMonths:toDate:", 3, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localStartSeasonDateForLocalDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)currentLocaleSupportsSeasons
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "supportsSeasonsWithLocale:", v3);

  return (char)a1;
}

+ (BOOL)supportsSeasonsWithLocale:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isCountryCodePartOfNorthernHemisphere:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isCountryCodePartOfSouthernHemisphere:", v7);

  }
  return v6;
}

+ (id)localStartSeasonDateForLocalDate:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(a1, "isDateValid:", v4) & 1) != 0)
  {
    v5 = objc_msgSend(a1, "monthFromDate:", v4);
    v6 = 3;
    v7 = 9;
    if (v5 < 9)
      v7 = 6;
    if (v5 >= 6)
      v6 = v7;
    if (v5 - 12 >= 0xFFFFFFFFFFFFFFF7)
      v8 = v6;
    else
      v8 = 12;
    objc_msgSend((id)sCLSDateHelperCalendar, "dateBySettingUnit:value:ofDate:options:", 8, v8, v4, 260);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startOfMonthForDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "validDateForDate:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __45__CLSCalendar_s_seasonCountryCodesDictionary__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("seasonsCountryCodes"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary;
  s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary = v1;

}

uint64_t __25__CLSCalendar_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sCLSDateHelperGMTTimeZone_5090;
  sCLSDateHelperGMTTimeZone_5090 = v0;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sCLSDateHelperCalendar;
  sCLSDateHelperCalendar = v2;

  return objc_msgSend((id)sCLSDateHelperCalendar, "setTimeZone:", sCLSDateHelperGMTTimeZone_5090);
}

@end
