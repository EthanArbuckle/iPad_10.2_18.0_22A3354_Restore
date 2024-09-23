@implementation NSDate(AAAFoundation)

- (uint64_t)aaf_isRelative
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3578], "aaf_standardFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "aaf_standardFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDoesRelativeDateFormatting:", 0);
  objc_msgSend(v4, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5) ^ 1;

  return v6;
}

- (uint64_t)aaf_isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "aaf_isTodayWithCalendar:", v2);

  return v3;
}

- (uint64_t)aaf_isTodayWithCalendar:()AAAFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "dayComponentsWithCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dayComponentsWithCalendar:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "isEqual:", v7);
  return v8;
}

- (uint64_t)dayComponentsWithCalendar:()AAAFoundation
{
  return objc_msgSend(a3, "components:fromDate:", 30, a1);
}

@end
