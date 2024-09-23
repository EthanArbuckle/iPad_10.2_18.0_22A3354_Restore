@implementation NSDate(EmailFoundationAdditions)

- (BOOL)ef_isEarlierThanDate:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (double)ef_timeIntervalSinceDate:()EmailFoundationAdditions
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "timeIntervalSinceDate:", v4);
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)ef_isMoreThanTimeIntervalAgo:()EmailFoundationAdditions
{
  double v3;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return -v3 > a2;
}

- (BOOL)ef_isEarlierThanOrEqualDate:()EmailFoundationAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)ef_isLaterThanDate:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)ef_isLaterThanOrEqualDate:()EmailFoundationAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)ef_isEarlierThanNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 < 0.0;
}

- (BOOL)ef_isLaterThanNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 > 0.0;
}

- (uint64_t)ef_isDateNextDayOrLater:()EmailFoundationAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ef_gregorianCalendarForTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateBySettingHour:minute:second:ofDate:options:", 0, 0, 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v9);

  return v10;
}

+ (uint64_t)ef_lastWeekMidnight
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightNdaysAgo:", 7);
}

+ (id)ef_morning
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ef_morningDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");
  v7 = objc_msgSend(v4, "second");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ef_tonight
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ef_nightDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");
  v7 = objc_msgSend(v4, "second");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ef_inOneHour
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 64, 60, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ef_tomorrowNight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ef_nightDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ef_tomorrowMorning
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ef_morningDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ef_nextWeekMorning
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ef_morningDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 7, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)ef_midnightNdaysAgo:()EmailFoundationAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightInNdays:", -a3);
}

+ (id)ef_midnightInNdays:()EmailFoundationAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, a3, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateBySettingHour:minute:second:ofDate:options:", 0, 0, 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ef_dateHoursAgo:()EmailFoundationAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 32, -a3, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_dateWithTruncatedSeconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ef_dateWithTruncatedSeconds
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 126, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ef_thisWeekday:()EmailFoundationAdditions hour:minute:second:
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, a3 - objc_msgSend(v12, "component:fromDate:", 512, v13), v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateBySettingHour:minute:second:ofDate:options:", a4, a5, a6, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)ef_localCombinedDate:()EmailFoundationAdditions time:timeZone:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "components:fromDate:", 28, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 96, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSecond:", 0);
  objc_msgSend(v13, "setHour:", objc_msgSend(v14, "hour"));
  objc_msgSend(v13, "setMinute:", objc_msgSend(v14, "minute"));
  if (v10)
    objc_msgSend(v13, "setTimeZone:", v10);
  objc_msgSend(v12, "dateFromComponents:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_ef_nightDateComponents
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v0, "setHour:", 21);
  objc_msgSend(v0, "setMinute:", 0);
  objc_msgSend(v0, "setSecond:", 0);
  return v0;
}

+ (id)_ef_morningDateComponents
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v0, "setHour:", 8);
  objc_msgSend(v0, "setMinute:", 0);
  objc_msgSend(v0, "setSecond:", 0);
  return v0;
}

+ (id)_ef_gregorianCalendarForTimeZone:()EmailFoundationAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99D48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setTimeZone:", v6);
  if (!v3)

  return v5;
}

@end
