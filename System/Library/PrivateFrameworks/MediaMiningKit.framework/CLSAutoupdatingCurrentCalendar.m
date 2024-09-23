@implementation CLSAutoupdatingCurrentCalendar

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sCLSDateHelperGMTTimeZone;
    sCLSDateHelperGMTTimeZone = v2;

    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sCLSDateHelperAutoupdatingCurrentCalendar;
    sCLSDateHelperAutoupdatingCurrentCalendar = v4;

    objc_msgSend((id)sCLSDateHelperAutoupdatingCurrentCalendar, "setTimeZone:", sCLSDateHelperGMTTimeZone);
  }
}

+ (id)calendar
{
  return (id)sCLSDateHelperAutoupdatingCurrentCalendar;
}

+ (id)timezone
{
  return (id)sCLSDateHelperGMTTimeZone;
}

+ (BOOL)isWeekendDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  int v8;
  id v9;
  void *v10;
  double v11;
  id v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInWeekend:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v8 = objc_msgSend(a1, "nextWeekendLocalStartDate:interval:options:afterDate:", &v13, &v14, 0, v4);
    v9 = v13;
    v10 = v9;
    v7 = 0;
    if (v8)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v4);
      if (v11 <= 0.0)
        v7 = 1;
    }

  }
  return v7;
}

+ (BOOL)dateIntervalIntersectsWeekend:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v12;
  double v13;

  v4 = a3;
  v12 = 0;
  v13 = 0.0;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "nextWeekendLocalStartDate:interval:options:afterDate:", &v12, &v13, 0, v5);
  v7 = v12;

  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    v9 = (void *)objc_msgSend(v8, "initWithStartDate:duration:", v7, v13);
    v10 = objc_msgSend(v4, "intersectsDateInterval:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)closestWeekendLocalStartDate:(id *)a3 interval:(double *)a4 afterDate:(id)a5
{
  id v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double *v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v22;
  uint64_t v23;
  id v24;
  double v25;

  v8 = a5;
  if ((objc_msgSend(a1, "rangeOfWeekendLocalStartDate:interval:containingDate:", a3, a4, v8) & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v24 = 0;
    v25 = 0.0;
    v10 = objc_msgSend(a1, "nextWeekendLocalStartDate:interval:options:afterDate:", &v24, &v25, 4, v8);
    v11 = v24;
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "dateByAddingTimeInterval:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v13);
      v15 = v14;
      v22 = 0;
      v23 = 0;
      v16 = (double *)&v23;
      v9 = objc_msgSend(a1, "nextWeekendLocalStartDate:interval:options:afterDate:", &v22, &v23, 0, v8);
      if (v9)
      {
        v17 = v22;
        objc_msgSend(v17, "timeIntervalSinceDate:", v8);
        if (v15 >= v18)
          v19 = v17;
        else
          v19 = v12;
        if (v15 < v18)
          v16 = &v25;
        *a3 = objc_retainAutorelease(v19);
        v20 = *(_QWORD *)v16;

        *(_QWORD *)a4 = v20;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

+ (BOOL)rangeOfWeekendLocalStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5
{
  id v8;
  void *v9;
  char v10;

  v8 = a5;
  objc_msgSend(a1, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfWeekendStartDate:interval:containingDate:", a3, a4, v8);

  objc_msgSend(*a3, "dateByAddingTimeInterval:", -21600.0);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = *a4 + 21600.0;
  return v10;
}

+ (BOOL)nextWeekendLocalStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6
{
  id v10;
  void *v11;
  char v12;

  v10 = a6;
  objc_msgSend(a1, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "nextWeekendStartDate:interval:options:afterDate:", a3, a4, a5, v10);

  if (a3)
  {
    objc_msgSend(*a3, "dateByAddingTimeInterval:", -21600.0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = *a4 + 21600.0;
  return v12;
}

@end
