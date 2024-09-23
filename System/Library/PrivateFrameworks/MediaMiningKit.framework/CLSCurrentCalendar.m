@implementation CLSCurrentCalendar

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sCLSDateHelperCurrentCalendar;
    sCLSDateHelperCurrentCalendar = v3;

    objc_msgSend(a1, "timezone");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sCLSDateHelperCurrentCalendar, "setTimeZone:", v5);

  }
}

+ (id)calendar
{
  return (id)sCLSDateHelperCurrentCalendar;
}

+ (void)update
{
  uint64_t v2;
  void *v3;
  void *v4;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sCLSDateHelperCurrentCalendar;
  sCLSDateHelperCurrentCalendar = v2;

  objc_msgSend(obj, "timezone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sCLSDateHelperCurrentCalendar, "setTimeZone:", v4);

  objc_sync_exit(obj);
}

+ (BOOL)isWeekendDate:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_METACLASS___CLSCurrentCalendar;
  v6 = objc_msgSendSuper2(&v8, sel_isWeekendDate_, v4);
  objc_sync_exit(v5);

  return v6;
}

+ (BOOL)dateIntervalIntersectsWeekend:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_METACLASS___CLSCurrentCalendar;
  v6 = objc_msgSendSuper2(&v8, sel_dateIntervalIntersectsWeekend_, v4);
  objc_sync_exit(v5);

  return v6;
}

+ (BOOL)closestWeekendLocalStartDate:(id *)a3 interval:(double *)a4 afterDate:(id)a5
{
  id v8;
  id v9;
  objc_super v11;

  v8 = a5;
  v9 = a1;
  objc_sync_enter(v9);
  v11.receiver = v9;
  v11.super_class = (Class)&OBJC_METACLASS___CLSCurrentCalendar;
  LOBYTE(a4) = objc_msgSendSuper2(&v11, sel_closestWeekendLocalStartDate_interval_afterDate_, a3, a4, v8);
  objc_sync_exit(v9);

  return (char)a4;
}

+ (BOOL)rangeOfWeekendLocalStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5
{
  id v8;
  id v9;
  objc_super v11;

  v8 = a5;
  v9 = a1;
  objc_sync_enter(v9);
  v11.receiver = v9;
  v11.super_class = (Class)&OBJC_METACLASS___CLSCurrentCalendar;
  LOBYTE(a4) = objc_msgSendSuper2(&v11, sel_rangeOfWeekendLocalStartDate_interval_containingDate_, a3, a4, v8);
  objc_sync_exit(v9);

  return (char)a4;
}

+ (BOOL)nextWeekendLocalStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6
{
  id v10;
  id v11;
  objc_super v13;

  v10 = a6;
  v11 = a1;
  objc_sync_enter(v11);
  v13.receiver = v11;
  v13.super_class = (Class)&OBJC_METACLASS___CLSCurrentCalendar;
  LOBYTE(a5) = objc_msgSendSuper2(&v13, sel_nextWeekendLocalStartDate_interval_options_afterDate_, a3, a4, a5, v10);
  objc_sync_exit(v11);

  return a5;
}

@end
