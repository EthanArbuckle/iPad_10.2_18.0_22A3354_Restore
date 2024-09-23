@implementation NSDateInterval(HKChartQueryCalendarDayAlignment)

- (id)hk_dateIntervalShiftedToQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend(a1, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_sleepDayStartWithCalendar:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v9);
  }
  else
  {
    v10 = a1;
  }
  return v10;
}

- (id)hk_dateIntervalUnshiftedFromQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend(a1, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOfDayForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOfDayForDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v11);
  }
  else
  {
    v12 = a1;
  }
  return v12;
}

@end
