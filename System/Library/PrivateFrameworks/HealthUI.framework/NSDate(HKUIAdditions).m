@implementation NSDate(HKUIAdditions)

- (id)hk_dateFromSourceTimeZone:()HKUIAdditions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E80];
    v5 = a3;
    objc_msgSend(v4, "localTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "secondsFromGMTForDate:", a1);

    objc_msgSend(a1, "dateByAddingTimeInterval:", (double)v7 - (double)objc_msgSend(v6, "secondsFromGMTForDate:", a1));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a1;
  }
  return v8;
}

- (uint64_t)hk_dateWithTruncatedSecond
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", floor(v1 / 60.0) * 60.0);
}

+ (id)hk_minimumDateForBirthDateWithCalendar:()HKUIAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 4, -130, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hkui_dateNormalizedFromDateInterval:()HKUIAdditions toDateInterval:
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v8);
  v10 = v9;

  objc_msgSend(v6, "duration");
  v12 = v11;
  objc_msgSend(v7, "duration");
  v14 = v13;

  objc_msgSend(v6, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "dateByAddingTimeInterval:", v10 * (v12 / v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
