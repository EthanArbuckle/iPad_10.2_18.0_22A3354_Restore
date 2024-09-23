@implementation NSDate(HKSleepDayIndex)

+ (uint64_t)hk_sleepDayStartForMorningIndex:()HKSleepDayIndex calendar:
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", a3 - 1, 18, a4);
}

- (uint64_t)hk_morningIndexWithCalendar:()HKSleepDayIndex
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKDayIndex.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  objc_msgSend(v5, "components:fromDate:", 60, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hour");
  v10 = objc_msgSend(v8, "hk_dayIndex");
  if (v9 < 18)
    v11 = v10;
  else
    v11 = v10 + 1;

  return v11;
}

- (id)hk_sleepDayStartWithCalendar:()HKSleepDayIndex
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+HKDayIndex.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  v8 = objc_msgSend(a1, "hk_morningIndexWithCalendar:", v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)hk_sleepWeekStartForMorningIndex:()HKSleepDayIndex calendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "hk_noonWithDayIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v6, "firstWeekday"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)hk_sleepMonthStartForMorningIndex:()HKSleepDayIndex calendar:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "hk_noonWithDayIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfMonthForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_sleepDayMidnightWithCalendar:()HKSleepDayIndex
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "hk_morningIndexWithCalendar:", v4);
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_sleepDayIntervalForMorningIndex:calendar:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
