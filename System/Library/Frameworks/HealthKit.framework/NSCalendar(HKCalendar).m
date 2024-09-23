@implementation NSCalendar(HKCalendar)

- (uint64_t)hk_dateBySubtractingDays:()HKCalendar fromDate:
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, -a3, a4, 0);
}

+ (id)hk_gregorianCalendarWithUTCTimeZone
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v1);

  return v0;
}

- (uint64_t)hk_startOfDateBySubtractingDays:()HKCalendar fromDate:
{
  return objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", -a3);
}

- (id)hk_startOfDateByAddingDays:()HKCalendar toDate:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hk_dateByShiftingToGregorianCalendarWithUTCTimeZone:()HKCalendar
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "components:fromDate:", 254, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hk_startOfFitnessWeekBeforeDate:()HKCalendar
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", HKFirstDayOfWeekForWeeklyGoalCalculations(), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_startOfWeekWithFirstWeekday:()HKCalendar beforeDate:addingWeeks:
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v8 = a4;
  v9 = objc_msgSend(a1, "component:fromDate:", 512, v8);
  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 7 * ((v9 - a3 + 7) / 7) - (v9 - a3 + 7), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "startOfDayForDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v12, "setCalendar:", a1);
    objc_msgSend(v12, "setWeekOfYear:", 1);
    objc_msgSend(v12, "hk_dateByAddingInterval:toDate:", a5, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  return v11;
}

+ (uint64_t)hk_gregorianCalendar
{
  return objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
}

- (id)hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:()HKCalendar
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 254, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)hk_canonicalDateOfBirthDateComponentsWithDate:()HKCalendar
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendarWithUTCTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

  return v6;
}

- (id)hk_dateOfBirthDateComponentsWithDate:()HKCalendar
{
  void *v4;

  objc_msgSend(a1, "components:fromDate:", 30, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", a1);
  return v4;
}

+ (id)hk_gregorianCalendarWithLocalTimeZone
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v1);

  return v0;
}

+ (id)hk_gregorianCalendarWithCupertinoTimeZone
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v1);

  return v0;
}

+ (id)hk_gregorianCalendarWithFirstWeekdayFromRegion
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C99790]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFirstWeekday:", objc_msgSend(v2, "firstWeekday"));

  return v0;
}

+ (id)hk_localDateOfBirthDateComponentsWithDate:()HKCalendar
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

  return v6;
}

- (id)hk_weeksContainingInterval:()HKCalendar firstWeekday:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12)
  {
    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v13, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v10);

  return v15;
}

- (id)hk_startOfMinuteForDate:()HKCalendar moduloMinutes:addingModuloCount:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  objc_msgSend(a1, "components:fromDate:", 126, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 < 1)
  {
    a4 = 1;
  }
  else if (0x3CuLL % a4)
  {
    a4 = 1;
  }
  objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a4 * a4);
  objc_msgSend(a1, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v11, "setCalendar:", a1);
    objc_msgSend(v11, "setMinute:", a4);
    objc_msgSend(v11, "hk_dateByAddingInterval:toDate:", a5, v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }

  return v10;
}

- (id)hk_startOfHourForDate:()HKCalendar addingHours:
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a1, "components:fromDate:", 62, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v8, "setCalendar:", a1);
    objc_msgSend(v8, "setHour:", 1);
    objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a4, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)hk_startOfHourForDate:()HKCalendar moduloHours:addingModuloCount:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  objc_msgSend(a1, "components:fromDate:", 62, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 < 1)
  {
    a4 = 1;
  }
  else if (0x18uLL % a4)
  {
    a4 = 1;
  }
  objc_msgSend(v8, "setHour:", objc_msgSend(v8, "hour") / a4 * a4);
  objc_msgSend(a1, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v11, "setCalendar:", a1);
    objc_msgSend(v11, "setHour:", a4);
    objc_msgSend(v11, "hk_dateByAddingInterval:toDate:", a5, v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }

  return v10;
}

- (id)hk_startOfMonthForDate:()HKCalendar
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "components:fromDate:", 14, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_startOfMonthForDate:()HKCalendar addingMonths:
{
  void *v6;
  id v7;
  uint64_t v8;

  objc_msgSend(a1, "hk_startOfMonthForDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setCalendar:", a1);
    objc_msgSend(v7, "setMonth:", 1);
    objc_msgSend(v7, "hk_dateByAddingInterval:toDate:", a4, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (id)hk_startOfYearForDate:()HKCalendar addingYears:
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a1, "components:fromDate:", 6, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v8, "setCalendar:", a1);
    objc_msgSend(v8, "setYear:", 1);
    objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a4, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)hk_nearestStartOfDayForDate:()HKCalendar
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_nearestDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hk_nearestStartOfWeekWithFirstWeekDay:()HKCalendar date:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", 7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_nearestDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hk_nearestStartOfMonthForDate:()HKCalendar
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "hk_startOfMonthForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setCalendar:", a1);
  objc_msgSend(v6, "setMonth:", 1);
  objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_nearestDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_sixMonthPeriodContaining:()HKCalendar dateBefore:
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "components:fromDate:", 24578, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setEra:", objc_msgSend(v6, "era"));
  objc_msgSend(v7, "setYearForWeekOfYear:", objc_msgSend(v6, "yearForWeekOfYear"));
  v8 = objc_msgSend(v6, "weekOfYear");
  if (a4)
  {
    if (v8 <= 26)
      v9 = 1;
    else
      v9 = 27;
  }
  else if (v8 < 27)
  {
    v9 = 27;
  }
  else
  {
    objc_msgSend(v7, "setYearForWeekOfYear:", objc_msgSend(v7, "yearForWeekOfYear") + 1);
    v9 = 1;
  }
  objc_msgSend(v7, "setWeekOfYear:", v9);
  objc_msgSend(a1, "dateFromComponents:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)hk_dateByAddingDays:()HKCalendar toDate:
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, a3, a4, 0);
}

- (id)hk_firstDateWithHour:()HKCalendar minute:afterDate:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", a3, a4, 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hk_isBeforeDate:", v8))
  {
    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 1, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", a3, a4, 0, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

- (id)hk_weekendDays
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_weekendDaysForDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_hk_weekendDaysForDate:()HKCalendar
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 7;
  do
  {
    if (objc_msgSend(a1, "isDateInWeekend:", v4))
    {
      objc_msgSend(a1, "components:fromDate:", 512, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "weekday");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
    objc_msgSend(a1, "hk_dateByAddingDays:toDate:", 1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v10;
    --v6;
  }
  while (v6);

  return v5;
}

- (id)hk_nearestNoonBeforeDateOrEqualToDate:()HKCalendar
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", 12, 0, 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hk_isBeforeDate:", v6);

  if (v7)
  {
    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, -1, v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (double)hk_timeIntervalSinceStartOfDayForDate:()HKCalendar
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7;
}

- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:
{
  return objc_msgSend(a1, "hk_dateFromComponentsWithYear:month:day:hour:minute:second:", a3, a4, a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:
{
  return objc_msgSend(a1, "hk_dateFromComponentsWithYear:month:day:hour:minute:second:", a3, a4, a5, a6, a7, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:second:
{
  id v15;
  void *v16;

  v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v15, "setYear:", a3);
  objc_msgSend(v15, "setMonth:", a4);
  objc_msgSend(v15, "setDay:", a5);
  objc_msgSend(v15, "setHour:", a6);
  objc_msgSend(v15, "setMinute:", a7);
  objc_msgSend(v15, "setSecond:", a8);
  objc_msgSend(a1, "dateFromComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)hk_enumerateDateInterval:()HKCalendar byDateComponents:block:
{
  id v8;
  id v9;
  void (**v10)(id, void *, _BYTE *);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "hk_isBeforeDate:", v12);

  if (v13)
  {
    while (1)
    {
      objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v9, v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v8, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKDateMin(v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v11, v17);
      v10[2](v10, v18, &v21);

      if (v21)
        break;

      objc_msgSend(v8, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "hk_isBeforeDate:", v19);

      v11 = v14;
      if ((v20 & 1) == 0)
        goto LABEL_7;
    }

  }
  v14 = v11;
LABEL_7:

}

- (double)hk_lengthOfDayForDate:()HKCalendar
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "startOfDayForDate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v3, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v2);
  v6 = v5;

  return v6;
}

- (id)hk_timeZoneDependentReferenceDate
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  os_unfair_lock_lock((os_unfair_lock_t)&hk_timeZoneDependentReferenceDate___referenceDateCacheLock);
  v2 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
  if (!hk_timeZoneDependentReferenceDate___referenceDateCache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v4 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
    hk_timeZoneDependentReferenceDate___referenceDateCache = (uint64_t)v3;

    v2 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
  }
  objc_msgSend(a1, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v9, "setYear:", 2001);
    objc_msgSend(v9, "setMonth:", 1);
    objc_msgSend(v9, "setDay:", 1);
    objc_msgSend(v7, "dateFromComponents:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
    objc_msgSend(a1, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v6, v11);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&hk_timeZoneDependentReferenceDate___referenceDateCacheLock);
  return v6;
}

- (uint64_t)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:()HKCalendar calendarUnit:
{
  id v6;
  id v7;
  void *v8;
  _HKDateCalendarUnitKey *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateLock);
  if (!_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache;
    _hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache = (uint64_t)v7;

  }
  v9 = -[_HKDateCalendarUnitKey initWithDate:calendar:unit:]([_HKDateCalendarUnitKey alloc], "initWithDate:calendar:unit:", v6, a1, a4);
  objc_msgSend((id)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(a1, "hk_timeZoneDependentReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "components:fromDate:toDate:options:", a4, v11, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "valueForComponent:", a4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache, "setObject:forKey:", v10, v9);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateLock);
  v14 = objc_msgSend(v10, "integerValue");

  return v14;
}

- (double)_hk_cachedLengthOfUnitForUnitStartDate:()HKCalendar calendarUnit:
{
  id v7;
  id v8;
  void *v9;
  _HKDateCalendarUnitKey *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;

  v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitLock);
  if (!_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache;
    _hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache = (uint64_t)v8;

  }
  v10 = -[_HKDateCalendarUnitKey initWithDate:calendar:unit:]([_HKDateCalendarUnitKey alloc], "initWithDate:calendar:unit:", v7, a1, a4);
  objc_msgSend((id)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_dateComponentsForCalendarUnit:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v12, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "timeIntervalSinceDate:", v7);
    v15 = v14;
    if (v14 <= 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCalendar+HKCalendar.m"), 508, CFSTR("Encountered zero length of unit %lu for date %@"), a4, v7);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache, "setObject:forKey:", v11, v10);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitLock);
  objc_msgSend(v11, "doubleValue");
  v17 = v16;

  return v17;
}

- (id)hk_startOfUnitForDate:()HKCalendar calendarUnit:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  switch(a4)
  {
    case 8:
      objc_msgSend(a1, "hk_startOfMonthForDate:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      objc_msgSend(a1, "hk_startOfHourForDate:addingHours:", v7, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      objc_msgSend(a1, "startOfDayForDate:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCalendar+HKCalendar.m"), 526, CFSTR("Unsuppored calendar unit."));

      v9 = 0;
      goto LABEL_9;
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (BOOL)hk_isDate:()HKCalendar withinNumberOfCalendarDays:ofDate:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _BOOL8 v14;

  v8 = a5;
  objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", a3, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v9, 16);
  objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", v8, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v11, 16);
  v13 = v10 - v12;
  if (v10 - v12 < 0)
    v13 = v12 - v10;
  v14 = v13 <= a4;

  return v14;
}

- (double)hk_durationSinceReferenceDateForDate:()HKCalendar calendarUnit:
{
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCalendar+HKCalendar.m"), 546, CFSTR("date must be an NSDate"));

  }
  objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v8, a4);
  objc_msgSend(a1, "_hk_cachedLengthOfUnitForUnitStartDate:calendarUnit:", v8, a4);
  v11 = v10;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v15 = (v13 - v14) / v11 + (double)v9;

  return v15;
}

- (id)hk_dateWithDurationSinceReferenceDate:()HKCalendar calendarUnit:
{
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v7 = (uint64_t)a2;
  objc_msgSend(a1, "hk_timeZoneDependentReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", a4, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hk_cachedLengthOfUnitForUnitStartDate:calendarUnit:", v9, a4);
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)(fmod(a2, 1.0) * v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
