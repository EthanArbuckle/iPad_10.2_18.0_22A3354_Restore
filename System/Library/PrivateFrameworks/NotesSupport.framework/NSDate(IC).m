@implementation NSDate(IC)

- (id)ic_briefFormattedDate
{
  BOOL v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (ic_briefFormattedDate_cachedDateString)
    v2 = ic_briefFormattedDate_cachedDate == 0;
  else
    v2 = 1;
  if (v2 || (objc_msgSend((id)ic_briefFormattedDate_cachedDate, "timeIntervalSinceDate:", a1), fabs(v3) >= 1.0))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(a1, "ic_briefFormattedDate:locale:", 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)ic_briefFormattedDate_cachedDateString;
    ic_briefFormattedDate_cachedDateString = v6;

    objc_storeStrong((id *)&ic_briefFormattedDate_cachedDate, a1);
  }
  return (id)ic_briefFormattedDate_cachedDateString;
}

- (BOOL)ic_isLaterThanDate:()IC
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (uint64_t)ic_isToday
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToDate:", v7);

  return v8;
}

- (uint64_t)ic_isYesterday
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", -1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "isEqualToDate:", v9);
  return v10;
}

- (uint64_t)ic_localDateWithSeconds
{
  if (ic_localDateWithSeconds_localFormatterOnceToken != -1)
    dispatch_once(&ic_localDateWithSeconds_localFormatterOnceToken, &__block_literal_global_23);
  return objc_msgSend((id)ic_localDateWithSeconds_localFormatter, "stringFromDate:", a1);
}

- (id)ic_startOfDay
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_endOfDay
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)ic_iso8601Date
{
  if (ic_iso8601Date_onceToken != -1)
    dispatch_once(&ic_iso8601Date_onceToken, &__block_literal_global_4_0);
  return objc_msgSend((id)ic_iso8601Date_dateFormatter, "stringFromDate:", a1);
}

- (uint64_t)ic_shortFormattedDate
{
  return objc_msgSend(a1, "ic_shortFormattedDateForAccessibility:", 0);
}

- (uint64_t)ic_shortFormattedDateForAccessibility
{
  return objc_msgSend(a1, "ic_shortFormattedDateForAccessibility:", 1);
}

- (id)ic_shortFormattedDateForAccessibility:()IC
{
  uint64_t *v5;

  if ((objc_msgSend(a1, "ic_isToday") & 1) != 0 || objc_msgSend(a1, "ic_isYesterday"))
  {
    if (ic_shortFormattedDateForAccessibility__shortRelativeOnceToken != -1)
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortRelativeOnceToken, &__block_literal_global_6_2);
    v5 = &ic_shortFormattedDateForAccessibility__shortRelativeformatter;
  }
  else if (a3)
  {
    if (ic_shortFormattedDateForAccessibility__shortAccessibilityStandardOnceToken != -1)
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortAccessibilityStandardOnceToken, &__block_literal_global_7_0);
    v5 = &ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter;
  }
  else
  {
    if (ic_shortFormattedDateForAccessibility__shortStandardOnceToken != -1)
      dispatch_once(&ic_shortFormattedDateForAccessibility__shortStandardOnceToken, &__block_literal_global_8_1);
    v5 = &ic_shortFormattedDateForAccessibility__shortStandardformatter;
  }
  objc_msgSend((id)*v5, "stringFromDate:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)ic_briefFormattedDateForSiriLocale:()IC forAccessibility:
{
  return objc_msgSend(a1, "ic_briefFormattedDate:locale:", a4, a3);
}

- (id)ic_briefFormattedDateForAccessibility
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_briefFormattedDate:locale:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_briefFormattedDate:()IC locale:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD block[4];
  id v37;

  v6 = a4;
  v7 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  if (objc_msgSend(v7, "ic_isToday"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke;
    block[3] = &unk_1EA823E80;
    v37 = v6;
    if (ic_briefFormattedDate_locale__briefTodayOnceToken != -1)
      dispatch_once(&ic_briefFormattedDate_locale__briefTodayOnceToken, block);
    objc_msgSend((id)ic_briefFormattedDate_locale__briefTodayFormatter, "stringFromDate:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v37;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:", 28, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, -1, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", v16) == 1 || objc_msgSend(v7, "compare:", v17) != 1)
    {
      if (a3)
      {
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v28 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_3;
        v29 = &unk_1EA823E80;
        v18 = &v30;
        v30 = v6;
        if (ic_briefFormattedDate_locale__templateOnceToken_11 != -1)
          dispatch_once(&ic_briefFormattedDate_locale__templateOnceToken_11, &v26);
        v19 = &ic_briefFormattedDate_locale__accessibilityDateFormatter;
      }
      else
      {
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_4;
        v24 = &unk_1EA823E80;
        v18 = &v25;
        v25 = v6;
        if (ic_briefFormattedDate_locale__briefRelativeOnceToken != -1)
          dispatch_once(&ic_briefFormattedDate_locale__briefRelativeOnceToken, &v21);
        v19 = &ic_briefFormattedDate_locale__briefRelativeFormatter;
      }
    }
    else
    {
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_2;
      v34 = &unk_1EA823E80;
      v18 = &v35;
      v35 = v6;
      if (ic_briefFormattedDate_locale__templateOnceToken != -1)
        dispatch_once(&ic_briefFormattedDate_locale__templateOnceToken, &v31);
      v19 = &ic_briefFormattedDate_locale__templateFormatter;
    }
    objc_msgSend((id)*v19, "stringFromDate:", v7, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (uint64_t)ic_truncated
{
  void *v1;
  double v2;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(v1, "dateWithTimeIntervalSince1970:", trunc(v2));
}

- (uint64_t)ic_isSameDayAsDate:()IC
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:inSameDayAsDate:", a1, v5);

  return v7;
}

- (BOOL)ic_isEarlierThanDate:()IC
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)ic_isLaterThanUnitsAgo:()IC value:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", a3, -a4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "ic_isLaterThanDate:", v9);
  return v10;
}

- (uint64_t)ic_isWithinInclusiveDayIntervalBeginning:()IC ending:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(a1, "ic_isEarlierThanDate:", v6)
    && !objc_msgSend(v8, "isDate:inSameDayAsDate:", a1, v6))
  {
    v9 = 0;
  }
  else if (v7 && objc_msgSend(a1, "ic_isLaterThanDate:", v7))
  {
    v9 = objc_msgSend(v8, "isDate:inSameDayAsDate:", a1, v7);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (uint64_t)ic_isWithinSameMonth:()IC
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", a1, v5, 8);

  return v7;
}

- (uint64_t)ic_isWithinSameYear:()IC
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", a1, v5, 4);

  return v7;
}

- (unint64_t)ic_numberOfDaysFromDate:()IC
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ordinalityOfUnit:inUnit:forDate:", 16, 2, a1);
  v8 = objc_msgSend(v6, "ordinalityOfUnit:inUnit:forDate:", 16, 2, v5);

  if (v7 <= v8)
    v9 = v8 - v7;
  else
    v9 = v7 - v8;

  return v9;
}

@end
