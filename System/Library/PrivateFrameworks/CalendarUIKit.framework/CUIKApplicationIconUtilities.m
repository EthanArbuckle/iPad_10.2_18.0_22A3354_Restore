@implementation CUIKApplicationIconUtilities

+ (id)dateFormatterWithCalendar:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 0);
  objc_msgSend(v5, "setCalendar:", v4);
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLocale:", v6);
  return v5;
}

+ (int64_t)iconDateNameFormatTypeForDateBasedOnDistanceFromNow:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = (objc_msgSend(v7, "isDateInToday:", v6) & 1) == 0
    && (objc_msgSend(a1, "_isWithinPreviousWeek:calendar:", v6, v7) & 1) == 0
    && !objc_msgSend(a1, "_isWithinNextWeek:calendar:", v6, v7);

  return v8;
}

+ (BOOL)_isWithinPreviousWeek:(id)a3 calendar:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "CalSimulatedDateForNow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isDate:withinPreviousWeekOfDate:calendar:", v8, v9, v7);

  return (char)a1;
}

+ (BOOL)_isDate:(id)a3 withinPreviousWeekOfDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "startOfDayForDate:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "CalIsAfterOrSameAsDate:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -6, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "CalIsAfterOrSameAsDate:", v11);

  }
  return v10;
}

+ (BOOL)_isWithinNextWeek:(id)a3 calendar:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "CalSimulatedDateForNow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isDate:withinNextWeekOfDate:calendar:", v8, v9, v7);

  return (char)a1;
}

+ (BOOL)_isDate:(id)a3 withinNextWeekOfDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 1, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOfDayForDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "CalIsBeforeDate:", v11) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 7, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "CalIsBeforeDate:", v14);

  }
  return v12;
}

@end
