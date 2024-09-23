@implementation NSDateComponents(CalClassAdditions)

- (id)CalRepresentedDate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "dateFromComponents:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)CalComponentForMinutes:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setMinute:", a3);
  return v4;
}

+ (id)CalComponentForHours:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setHour:", a3);
  return v4;
}

+ (id)CalComponentForDays:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setDay:", a3);
  return v4;
}

+ (id)CalComponentForWeeks:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setWeekOfYear:", a3);
  return v4;
}

+ (id)CalComponentForMonths:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setMonth:", a3);
  return v4;
}

+ (id)CalComponentForYears:()CalClassAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setYear:", a3);
  return v4;
}

+ (id)CalComponentsWithYear:()CalClassAdditions month:day:hour:minute:second:
{
  void *v14;

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setYear:", a3);
  objc_msgSend(v14, "setMonth:", a4);
  objc_msgSend(v14, "setDay:", a5);
  objc_msgSend(v14, "setHour:", a6);
  objc_msgSend(v14, "setMinute:", a7);
  objc_msgSend(v14, "setSecond:", a8);
  return v14;
}

- (uint64_t)CalIsSameDayAsComponents:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "day");
  if (v5 == objc_msgSend(v4, "day"))
    v6 = objc_msgSend(a1, "CalIsSameMonthAsComponents:", v4);
  else
    v6 = 0;

  return v6;
}

- (uint64_t)CalIsSameMonthAsComponents:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "month");
  if (v5 == objc_msgSend(v4, "month"))
    v6 = objc_msgSend(a1, "CalIsSameYearAsComponents:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)CalIsSameYearAsComponents:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "year");
  if (v5 == objc_msgSend(v4, "year"))
  {
    v6 = objc_msgSend(a1, "era");
    v7 = v6 == objc_msgSend(v4, "era");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)CalDateComponents:()CalClassAdditions byAddingComponents:calendar:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v11);

  objc_msgSend(v8, "dateFromComponents:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v9, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "components:fromDate:", a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v10);

  return v14;
}

- (id)CalDateComponents:()CalClassAdditions byAddingDays:calendar:
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x1E0C99D78];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setDay:", a4);
  objc_msgSend(a1, "CalDateComponents:byAddingComponents:calendar:", a3, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)CalDateComponentsForDateOnly
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setEra:", objc_msgSend(a1, "era"));
  objc_msgSend(v2, "setYear:", objc_msgSend(a1, "year"));
  objc_msgSend(v2, "setMonth:", objc_msgSend(a1, "month"));
  objc_msgSend(v2, "setDay:", objc_msgSend(a1, "day"));
  return v2;
}

- (id)CalDateComponentsForEndOfDay
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v1, "setHour:", 23);
  objc_msgSend(v1, "setMinute:", 59);
  objc_msgSend(v1, "setSecond:", 59);
  return v1;
}

- (unint64_t)CalGregorianDate
{
  unsigned int v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unint64_t v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, "year");
  v3 = objc_msgSend(a1, "month");
  v4 = objc_msgSend(a1, "day");
  if (objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (unint64_t)objc_msgSend(a1, "hour") << 48;
  if (objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = objc_msgSend(a1, "minute") << 56;
  if (objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "second");
  return v2 | ((unint64_t)v3 << 32) & 0xFFFF00FFFFFFFFFFLL | ((unint64_t)v4 << 40) | v5 | v6;
}

- (BOOL)CalHasTimeComponents
{
  return objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)CalClearTimeComponents
{
  objc_msgSend(a1, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(a1, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
  return objc_msgSend(a1, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
}

@end
