@implementation NSDateInterval(HKSleepDayIndex)

+ (id)hk_sleepDayIntervalForMorningIndex:()HKSleepDayIndex calendar:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "hk_sleepDayStartForMorningIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", a3 + 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  return v9;
}

+ (id)hk_sleepDayIntervalForMorningIndexRange:()HKSleepDayIndex calendar:
{
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a5;
  objc_msgSend(v7, "hk_sleepDayStartForMorningIndex:calendar:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 <= 0)
    v10 = 0x8000000000000000;
  else
    v10 = a3 + a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
  return v12;
}

+ (id)hk_sleepWeekIntervalForMorningIndex:()HKSleepDayIndex calendar:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "hk_sleepWeekStartForMorningIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dateByAddingDays:toDate:", 7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  return v9;
}

- (id)hk_dateIntervalByMappingToSleepDayWithMorningIndex:()HKSleepDayIndex calendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsDate:", v8) & 1) != 0)
  {
    objc_msgSend(a1, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsDate:", v9);

    if (v10)
    {
      v11 = a1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 224, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "hour") >= 18)
    v18 = v13;
  else
    v18 = v15;
  objc_msgSend(a1, "_hk_dateForYearMonthDayComponents:hourMinuteSecondComponents:calendar:", v18, v17, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v19, "dateByAddingTimeInterval:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "hk_isAfterDate:", v21);

  if (v22)
  {
    objc_msgSend(v7, "endDate");
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v19, v20);

LABEL_11:
  return v11;
}

- (uint64_t)hk_dayIndexRangeWithCalendar:()HKSleepDayIndex
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_morningIndexWithCalendar:", v4);

  objc_msgSend(a1, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_morningIndexWithCalendar:", v4);

  return v6;
}

- (id)_hk_dateForYearMonthDayComponents:()HKSleepDayIndex hourMinuteSecondComponents:calendar:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0C99D78];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "setCalendar:", v8);

  objc_msgSend(v11, "setYear:", objc_msgSend(v10, "year"));
  objc_msgSend(v11, "setMonth:", objc_msgSend(v10, "month"));
  v12 = objc_msgSend(v10, "day");

  objc_msgSend(v11, "setDay:", v12);
  objc_msgSend(v11, "setHour:", objc_msgSend(v9, "hour"));
  objc_msgSend(v11, "setMinute:", objc_msgSend(v9, "minute"));
  v13 = objc_msgSend(v9, "second");

  objc_msgSend(v11, "setSecond:", v13);
  objc_msgSend(v11, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
