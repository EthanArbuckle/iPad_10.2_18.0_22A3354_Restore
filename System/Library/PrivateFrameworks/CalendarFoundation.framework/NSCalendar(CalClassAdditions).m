@implementation NSCalendar(CalClassAdditions)

- (id)dateBySanityCheckingDateRoundedToDay:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "hourInCalendar:", a1);
  if (v5)
  {
    v6 = v5;
    v7 = v4;
    v8 = v7;
    v9 = v7;
    if (v6 >= 12)
    {
      objc_msgSend(v7, "dateByAddingDays:inCalendar:", 1, a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "dateRemovingTimeComponentsInCalendar:", a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isEqualToDate:", v8) & 1) == 0)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "timeZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "descriptionForDate:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v4, 1, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "descriptionForDate:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "calendarIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "locale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v22 = v12;
        v23 = 2112;
        v24 = v13;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        v31 = 2112;
        v32 = v18;
        _os_log_error_impl(&dword_18FC12000, v10, OS_LOG_TYPE_ERROR, "ERROR: The given date could not be rounded to midnight. This date & time may not exist in the active calendar.\n\tInitial Start Date = %@ in %@;\n"
          "\tRevised Start Date = %@ in %@;\n"
          "\tCalendar/Locale = %@/%@;",
          buf,
          0x3Eu);

      }
    }

  }
  return v4;
}

- (uint64_t)daysInWeek
{
  uint64_t v1;

  objc_msgSend(a1, "maximumRangeOfUnit:", 512);
  if (v1 <= 0)
    return 7;
  else
    return v1;
}

+ (id)CalGregorianGMTCalendar
{
  if (CalGregorianGMTCalendar_onceToken != -1)
    dispatch_once(&CalGregorianGMTCalendar_onceToken, &__block_literal_global_10);
  return (id)CalGregorianGMTCalendar_gregorianGMTCalendar;
}

+ (id)CalGregorianCalendarForTimeZone:()CalClassAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;
  unint64_t v11;
  CFTypeRef v12;
  void *v13;
  void *v15;

  v4 = a3;
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEquivalentTo:", v5),
        v5,
        v6))
  {
    objc_msgSend(a1, "CalGregorianGMTCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&CalGregorianCalendarForTimeZone__lock);
  v9 = (id)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
  if (CalGregorianCalendarForTimeZone__calendarForTimeZoneCache)
    goto LABEL_5;
  WeakRetained = objc_loadWeakRetained(&CalGregorianCalendarForTimeZone__weakCache);
  if (!WeakRetained)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = (void *)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
    CalGregorianCalendarForTimeZone__calendarForTimeZoneCache = (uint64_t)v9;

LABEL_5:
    WeakRetained = v9;
  }
  objc_msgSend(WeakRetained, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v4);
    objc_msgSend(WeakRetained, "setObject:forKey:", v7, v8);
    v11 = objc_msgSend(WeakRetained, "count");
    if (CalGregorianCalendarForTimeZone__calendarForTimeZoneCache)
    {
      if (v11 >= 0x20)
      {
        objc_storeWeak(&CalGregorianCalendarForTimeZone__weakCache, (id)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache);
        v12 = CFRetain((CFTypeRef)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache);
        CFAutorelease(v12);
        v13 = (void *)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
        CalGregorianCalendarForTimeZone__calendarForTimeZoneCache = 0;

      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CalGregorianCalendarForTimeZone__lock);

LABEL_12:
  return v7;
}

- (id)CalOccurrencesForBirthday:()CalClassAdditions inDateRange:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  CalDateRange *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isValid"))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setMonth:", objc_msgSend(v6, "month"));
    objc_msgSend(v8, "setLeapMonth:", objc_msgSend(v6, "isLeapMonth"));
    objc_msgSend(v8, "setDay:", objc_msgSend(v6, "day"));
    if (objc_msgSend(v6, "year") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v6, "era") != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "dateFromComponents:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "CalIsAfterDate:", v10);

      if ((v11 & 1) != 0)
      {
        v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v7, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "CalIsAfterDate:", v13);

      if (v14)
      {
        v15 = [CalDateRange alloc];
        objc_msgSend(v7, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CalDateRange initWithStartDate:endDate:](v15, "initWithStartDate:endDate:", v9, v16);

        v7 = (id)v17;
      }

    }
    objc_msgSend(v7, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nextDateAfterDate:matchingHour:minute:second:options:", v18, 0, 0, 0, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_new();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__NSCalendar_CalClassAdditions__CalOccurrencesForBirthday_inDateRange___block_invoke;
    v23[3] = &unk_1E2A84040;
    v7 = v7;
    v24 = v7;
    v20 = v19;
    v25 = v20;
    objc_msgSend(a1, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v9, v8, 256, v23);
    v21 = v25;
    v12 = v20;

    goto LABEL_11;
  }
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_12:

  return v12;
}

- (uint64_t)calendarDaysFromDate:()CalClassAdditions toDate:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (v6 == v7 || (objc_msgSend(v6, "isEqualToDate:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "components:fromDate:toDate:options:", 48, v6, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "day");
    if (objc_msgSend(v9, "hour"))
    {
      v10 = objc_msgSend(v6, "hourInCalendar:", a1);
      objc_msgSend(a1, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "secondsFromGMTForDate:", v7);
      objc_msgSend(a1, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 - objc_msgSend(v13, "secondsFromGMTForDate:", v6);

      if (v14 <= 0)
        v15 = 0;
      else
        v15 = v14 / 0xE10uLL;
      v16 = objc_msgSend(v9, "hour") + v10 + v15;
      if (v16 < 24)
        v8 += v16 >> 63;
      else
        ++v8;
    }

  }
  return v8;
}

- (uint64_t)secondsInMinute
{
  uint64_t v1;

  objc_msgSend(a1, "maximumRangeOfUnit:", 128);
  if (v1 <= 0)
    return 60;
  else
    return v1;
}

+ (id)sharedAutoupdatingCurrentCalendar
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NSCalendar_CalClassAdditions__sharedAutoupdatingCurrentCalendar__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAutoupdatingCurrentCalendar_onceToken != -1)
    dispatch_once(&sharedAutoupdatingCurrentCalendar_onceToken, block);
  return (id)sharedAutoupdatingCurrentCalendar_autoupdatingCalendar;
}

- (BOOL)dateIsFirstOfMonth:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a1, "components:fromDate:", 14, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(a1, "compareDate:toDate:toUnitGranularity:", v6, v4, 16) == 0;
  else
    v7 = 0;

  return v7;
}

- (uint64_t)monthsInYearForDate:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "yearInCalendar:", a1);
  objc_msgSend(MEMORY[0x1E0C99D78], "CalComponentForYears:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "yearInCalendar:", a1) == v5)
  {
    v8 = 0;
    v9 = v4;
    do
    {
      objc_msgSend(v7, "dateByAddingMonths:inCalendar:", ++v8, a1);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v4;
    }
    while (objc_msgSend(v4, "yearInCalendar:", a1) == v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)minutesInHour
{
  uint64_t v1;

  objc_msgSend(a1, "maximumRangeOfUnit:", 64);
  if (v1 <= 0)
    return 60;
  else
    return v1;
}

- (uint64_t)hoursInDay
{
  uint64_t v1;

  objc_msgSend(a1, "maximumRangeOfUnit:", 32);
  if (v1 <= 0)
    return 24;
  else
    return v1;
}

+ (id)CalYearlessDateThreshold
{
  if (CalYearlessDateThreshold_onceToken != -1)
    dispatch_once(&CalYearlessDateThreshold_onceToken, &__block_literal_global_3);
  return (id)CalYearlessDateThreshold_s_threshold;
}

- (uint64_t)secondsInDay
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "secondsInMinute");
  v3 = objc_msgSend(a1, "minutesInHour") * v2;
  return v3 * objc_msgSend(a1, "hoursInDay");
}

- (uint64_t)daysInMonthContainingDate:()CalClassAdditions
{
  uint64_t v3;

  objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 16, 8, a3);
  return v3;
}

- (uint64_t)CalDaysInYearContainingDate:()CalClassAdditions
{
  uint64_t v3;

  objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 16, 4, a3);
  return v3;
}

- (uint64_t)CalWeeksInMonthContainingDate:()CalClassAdditions
{
  uint64_t v3;

  objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 4096, 8, a3);
  return v3;
}

- (uint64_t)CalWeeksInYearContainingDate:()CalClassAdditions
{
  uint64_t v3;

  objc_msgSend(a1, "rangeOfUnit:inUnit:forDate:", 0x2000, 4, a3);
  return v3;
}

- (BOOL)dateIsFirstOfYear:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a1, "components:fromDate:", 14, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  objc_msgSend(a1, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend(a1, "compareDate:toDate:toUnitGranularity:", v7, v4, 16) == 0;
  else
    v8 = 0;

  return v8;
}

- (uint64_t)cal_isMultidayEventForUIWithStartDate:()CalClassAdditions endDate:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isDate:inSameDayAsDate:", v6, v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "startOfDayForDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 1, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToDate:", v10) ^ 1;

  }
  return v8;
}

- (id)CalDateFromComponents:()CalClassAdditions inTimeZone:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTimeZone:", v6);

  objc_msgSend(a1, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTimeZone:", v8);
  return v9;
}

- (id)CalDateBySubtractingComponents:()CalClassAdditions fromDate:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(v6, "era") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setEra:", -objc_msgSend(v6, "era"));
  if (objc_msgSend(v6, "year") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setYear:", -objc_msgSend(v6, "year"));
  if (objc_msgSend(v6, "month") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setMonth:", -objc_msgSend(v6, "month"));
  if (objc_msgSend(v6, "day") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setDay:", -objc_msgSend(v6, "day"));
  if (objc_msgSend(v6, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setHour:", -objc_msgSend(v6, "hour"));
  if (objc_msgSend(v6, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setMinute:", -objc_msgSend(v6, "minute"));
  if (objc_msgSend(v6, "second") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setSecond:", -objc_msgSend(v6, "second"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)CalCalendarWithUnsanitizedCalendarIdentifier:()CalClassAdditions
{
  id v3;
  void *v4;

  v3 = a3;
  if (!v3)
    v3 = (id)*MEMORY[0x1E0C996C8];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)CalDateFromBirthdayComponents:()CalClassAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  if (objc_msgSend(v3, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend((id)*MEMORY[0x1E0C996C8], "isEqualToString:", v7);

    if (v8)
    {
      v9 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v9, "setYear:", 1604);
      objc_msgSend(v3, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFromComponents:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v25[5];
      v25[5] = v11;

    }
    else
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v23[3] = 0;
      objc_msgSend(v3, "setEra:", 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(v3, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "CalYearlessDateThreshold");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke;
      v19[3] = &unk_1E2A84068;
      v21 = &v24;
      v20 = v3;
      v22 = v23;
      objc_msgSend(v15, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v16, v20, 6, v19);

      _Block_object_dispose(v23, 8);
    }
  }
  else
  {
    objc_msgSend(v3, "date");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v25[5];
    v25[5] = v13;

  }
  v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (id)mapDatesFromDate:()CalClassAdditions stepSize:range:mapBlock:
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  v13 = v10;
  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", a5, 1, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (objc_msgSend(v13, "isBeforeDate:", v14))
  {
    v16 = v13;
    do
    {
      objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", a4, 1, v16, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v11[2](v11, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v17);

      v16 = v15;
    }
    while ((objc_msgSend(v15, "isBeforeDate:", v14) & 1) != 0);
  }

  return v12;
}

@end
