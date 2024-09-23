@implementation ATXTimeUtil

+ (id)nextStartOfDayAfter:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDay:", 1);
  calendarWithTimeZone(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startOfDayForDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)todayWithTimeZone:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getDayFromTime:timeZone:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)yesterdayWithTimeZone:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  calendarWithTimeZone(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDay:", -1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getDayFromTime:(id)a3 timeZone:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v6);

  objc_msgSend(v8, "startOfDayForDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getTimeFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", -1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setHour:", objc_msgSend(v6, "hour"));
  objc_msgSend(v7, "setMinute:", objc_msgSend(v6, "minute"));
  objc_msgSend(v7, "setSecond:", objc_msgSend(v6, "second"));
  objc_msgSend(v7, "setNanosecond:", objc_msgSend(v6, "nanosecond"));
  objc_msgSend(v7, "setCalendar:", v5);

  return v7;
}

+ (BOOL)time:(id)a3 isBetweenStartTime:(id)a4 andEndTime:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "getTimeFromDate:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getTimeFromDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getTimeFromDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (v15 == -1)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v10, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "compare:", v17) != 1;

  }
  return v18;
}

@end
