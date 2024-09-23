@implementation NSDateInterval(JulianDay)

+ (id)hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:()JulianDay sourceCalendar:localCalendar:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hk_dayIndexWithCalendar:", v8);

  objc_msgSend(v9, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "hk_dayIndexWithCalendar:", v8);
  if (v11 == v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v11, 0, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v13, 0, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 128, -1, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v17);

  }
  return v14;
}

@end
