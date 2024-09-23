@implementation NSDate(VSAdditions)

+ (uint64_t)vs_currentDate
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)vs_dateRoundedToDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 30, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v2);
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [components date] parameter must not be nil."));
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_dateIncrementedByDays:()VSAdditions
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, a3, a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [calendar dateByAddingUnit:NSCalendarUnitDay value:days toDate:self options:0] parameter must not be nil."));
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, a3, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vs_dateIncrementedByMinutes:()VSAdditions
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 64, a3, a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [calendar dateByAddingUnit:NSCalendarUnitMinute value:minutes toDate:self options:0] parameter must not be nil."));
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 64, a3, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)vs_isAfter:()VSAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)vs_isBefore:()VSAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

@end
