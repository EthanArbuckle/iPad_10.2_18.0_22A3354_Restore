@implementation NSString(FormatExtras)

+ (id)_navigation_formattedStringForInteger:()FormatExtras
{
  void *v4;
  void *v5;
  void *v6;

  if (qword_1ED0C3E78 != -1)
    dispatch_once(&qword_1ED0C3E78, &__block_literal_global_7);
  v4 = (void *)_MergedGlobals_21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)_navigation_formattedStringForFloat:()FormatExtras
{
  return objc_msgSend(a1, "_navigation_formattedStringForFloat:useIncreasedPrecision:", 0);
}

+ (id)_navigation_formattedStringForFloat:()FormatExtras useIncreasedPrecision:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(v6, "setNumberStyle:", 1);
  objc_msgSend(v6, "setRoundingMode:", 6);
  if (a1 >= 100.0)
  {
    objc_msgSend(v6, "setUsesSignificantDigits:", 1);
    objc_msgSend(v6, "setMaximumSignificantDigits:", 3);
    v8 = 0;
  }
  else
  {
    if (a4)
      v8 = 3;
    else
      v8 = 1;
    objc_msgSend(v6, "setUsesSignificantDigits:", 0);
  }
  objc_msgSend(v6, "setMaximumFractionDigits:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_navigation_formatFloatForPrintedDistance:()FormatExtras
{
  _BOOL4 v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a1 < 10.0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setNumberStyle:", 1);
  objc_msgSend(v3, "setRoundingMode:", 6);
  objc_msgSend(v3, "setMaximumFractionDigits:", 2 * v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_navigation_formattedStringForOperatingHours:()FormatExtras timeZone:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "startTime", (_QWORD)v23);
        v16 = v15;
        objc_msgSend(v14, "duration");
        if (v17 > 0.0)
        {
          v18 = v17;
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v19, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);
          objc_msgSend(v8, "addObject:", v20);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "_navigation_formattedStringForHourRanges:timeZone:", v8, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  _MNLocalizedStringFromThisBundle(CFSTR("Operating Hours Separator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_navigation_formattedStringForHourRanges:timeZone:delimeter:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:delimeter:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  BOOL v36;
  int v37;
  void *v38;
  id v39;
  id v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "count") & 1) != 0)
  {
    GEOFindOrCreateLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      v66 = 1024;
      v67 = 465;
      v68 = 2080;
      v69 = "([startEndDates count] % 2) == 0";
      _os_log_impl(&dword_1B0AD7000, v51, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

    if (v8)
    {
LABEL_3:
      if (v9)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if (v8)
  {
    goto LABEL_3;
  }
  GEOFindOrCreateLog();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
    v64 = 2080;
    v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
    v66 = 1024;
    v67 = 466;
    v68 = 2080;
    v69 = "timeZone != nil";
    _os_log_impl(&dword_1B0AD7000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
  }

  if (!v9)
  {
LABEL_47:
    GEOFindOrCreateLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      v66 = 1024;
      v67 = 467;
      v68 = 2080;
      v69 = "delimeter != nil";
      _os_log_impl(&dword_1B0AD7000, v53, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
LABEL_4:
  v54 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v11, "setDateStyle:", 0);
  v61 = v11;
  objc_msgSend(v11, "setTimeStyle:", 1);
  v58 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v55 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v56 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v12 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale;
  if (!_navigation_formattedStringForHourRanges_timeZone_delimeter__locale)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) != 0
    || (v15 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale) != 0
    && (objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqual:", v16),
        v16,
        (v17 & 1) != 0))
  {
    v60 = 0;
    v18 = v61;
  }
  else
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale;
    _navigation_formattedStringForHourRanges_timeZone_delimeter__locale = v19;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, _navigation_formattedStringForHourRanges_timeZone_delimeter__locale);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v21, "isEqualToString:", CFSTR("h a"));
    if (v60)
    {
      objc_msgSend(v58, "setDateFormat:", v21);
      objc_msgSend(v55, "setDateFormat:", CFSTR("h"));
      v18 = v61;
      objc_msgSend(v61, "dateFormat");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "containsString:", CFSTR("a")))
      {
        objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("a"), &stru_1E61D9090);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "setDateFormat:", v25);
        v22 = (void *)v25;
      }
      else
      {
        v26 = v61;

        v56 = v26;
      }

    }
    else
    {
      v18 = v61;
    }

  }
  objc_msgSend(v58, "setTimeZone:", v8);
  objc_msgSend(v55, "setTimeZone:", v8);
  objc_msgSend(v18, "setTimeZone:", v8);
  v57 = v8;
  objc_msgSend(v56, "setTimeZone:", v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (unint64_t)objc_msgSend(v7, "count") >> 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v28 = 1;
    v59 = v7;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v28 - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "copy");

        objc_msgSend(v32, "setTimeZone:", v57);
        v33 = objc_msgSend(v32, "component:fromDate:", 32, v29);
        v34 = objc_msgSend(v32, "component:fromDate:", 32, v30);
        v35 = v33 <= 11 && v34 < 12;
        if (!v35 && (v33 >= 12 ? (v36 = v34 < 12) : (v36 = 1), v36))
        {
          v37 = objc_msgSend(v29, "isWholeHour");
          v38 = v58;
          if (!v37)
            v38 = v18;
        }
        else
        {
          v41 = objc_msgSend(v29, "isWholeHour");
          v38 = v55;
          if (!v41)
            v38 = v56;
        }
        v39 = v38;
        v42 = objc_msgSend(v30, "isWholeHour");
        v43 = v58;
        if (!v42)
          v43 = v18;
        v40 = v43;

      }
      else
      {
        v39 = v18;
        v40 = v39;
      }
      objc_msgSend(v39, "stringFromDate:", v29);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringFromDate:", v30);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x1E0CB3940];
      _MNLocalizedStringFromThisBundle(CFSTR("Operating Hours Range"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v47, v44, v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "addObject:", v48);
      v7 = v59;
      v28 += 2;
      v18 = v61;
    }
    while (v28 < objc_msgSend(v59, "count"));
  }
  objc_msgSend(v27, "componentsJoinedByString:", v54);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

+ (id)_navigation_stringForExpectedTravelTime:()FormatExtras dateUnitStyle:
{
  int v6;
  int v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (int)(a2 / 3600.0);
  v7 = vcvtpd_s64_f64((a2 - (double)(3600 * v6)) / 60.0);
  if (v7 >= 59)
    v8 = 59;
  else
    v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v9, "setHour:", v6);
  objc_msgSend(v9, "setMinute:", v8);
  if (a4 == 1)
  {
    objc_msgSend(v9, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3570], "localizedStringFromDateComponents:unitsStyle:", v9, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)_componentsWillUseShortFormat:()FormatExtras
{
  id v3;
  _BOOL8 v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "hour") >= 1 && objc_msgSend(v3, "minute") > 0;

  return v4;
}

+ (__CFString)_frequencyStringForComponents:()FormatExtras forRange:forceShort:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setFormattingContext:", 2);
  v10 = objc_msgSend(v8, "hour");
  v11 = objc_msgSend(v8, "minute");
  if (v10 >= 1)
  {
    if (v11 >= 1)
    {
      if (objc_msgSend(v8, "minute") >= 60)
      {
        GEOFindOrCreateLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = 136315906;
          v26 = "+[NSString(FormatExtras) _frequencyStringForComponents:forRange:forceShort:]";
          v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          v29 = 1024;
          v30 = 575;
          v31 = 2080;
          v32 = "components.minute < 60";
          _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v25, 0x26u);
        }

      }
      objc_msgSend(v9, "calendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v13));

      objc_msgSend(v9, "setAllowedUnits:", 96);
      objc_msgSend(v9, "setMaximumUnitCount:", 2);
      v14 = objc_msgSend(v8, "hour");
      v15 = 60 * (objc_msgSend(v8, "minute") + 60 * v14);
      goto LABEL_22;
    }
    if ((a4 & 1) == 0 && objc_msgSend(v8, "hour") == 1)
    {
      v16 = CFSTR("TransitDepartureFrequency_component_singleHour");
      goto LABEL_12;
    }
    objc_msgSend(v9, "setAllowedUnits:", 32);
    objc_msgSend(v9, "setMaximumUnitCount:", 1);
    if (a5)
    {
      objc_msgSend(v9, "calendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "locale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v21));

    }
    else
    {
      objc_msgSend(v9, "setUnitsStyle:", 2);
    }
    v15 = 3600 * objc_msgSend(v8, "hour");
    goto LABEL_22;
  }
  if (v11 >= 1)
  {
    if ((a4 & 1) == 0 && objc_msgSend(v8, "minute") == 1)
    {
      v16 = CFSTR("TransitDepartureFrequency_component_singleMinute");
LABEL_12:
      _MNLocalizedStringFromThisBundle(v16);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v22 = (__CFString *)v17;
      goto LABEL_24;
    }
    objc_msgSend(v9, "setAllowedUnits:", 64);
    objc_msgSend(v9, "setMaximumUnitCount:", 1);
    if (a5)
    {
      objc_msgSend(v9, "calendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "locale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v19));

    }
    else
    {
      objc_msgSend(v9, "setUnitsStyle:", 2);
    }
    v15 = 60 * objc_msgSend(v8, "minute");
LABEL_22:
    objc_msgSend(v9, "stringFromTimeInterval:", (double)v15);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v22 = &stru_1E61D9090;
LABEL_24:

  return v22;
}

+ (id)_navigation_formattedDescriptionForFrequency:()FormatExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "frequencyType");
  if (v5 == 2)
  {
    objc_msgSend(a1, "_frequencyDateComponents:", objc_msgSend(v4, "displayFrequency"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "minute") || objc_msgSend(v7, "hour") != 1)
    {
      if (objc_msgSend(v7, "minute") != 1 || objc_msgSend(v7, "hour"))
      {
        v9 = objc_msgSend(v7, "hour");
        v10 = objc_msgSend(v4, "isEstimate");
        if (v9)
        {
          if (v10)
            v11 = CFSTR("TransitDepartureFrequency_estimated_hours_format");
          else
            v11 = CFSTR("TransitDepartureFrequency_hours_format");
          _MNLocalizedStringFromThisBundle(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_frequencyStringForComponents:forRange:forceShort:", v7, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%d %@"), &v17, objc_msgSend(v7, "hour"), v13);
        }
        else
        {
          if (v10)
            v14 = CFSTR("TransitDepartureFrequency_estimated_minutes_format");
          else
            v14 = CFSTR("TransitDepartureFrequency_minutes_format");
          _MNLocalizedStringFromThisBundle(v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_frequencyStringForComponents:forRange:forceShort:", v7, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%d %@"), &v16, objc_msgSend(v7, "minute"), v13);
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      v8 = CFSTR("TransitDepartureFrequency_format_singleMinute");
    }
    else
    {
      v8 = CFSTR("TransitDepartureFrequency_format_singleHour");
    }
    _MNLocalizedStringFromThisBundle(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  if (v5 == 1)
  {
    objc_msgSend(a1, "_navigation_descriptionForFrequencyRangeWithMinFrequency:maxFrequency:estimate:recurring:", objc_msgSend(v4, "minFrequency"), objc_msgSend(v4, "maxFrequency"), objc_msgSend(v4, "isEstimate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_23:

  return v6;
}

+ (id)_navigation_formattedDescriptionForLiveStatus:()FormatExtras updatedDepartureTimeString:
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  switch((unint64_t)a3)
  {
    case 0uLL:
      v7 = CFSTR("TransitDepartureLiveStatus_description_unknown");
      goto LABEL_12;
    case 1uLL:
    case 2uLL:
      v7 = CFSTR("TransitDepartureLiveStatus_description_ontime");
      goto LABEL_12;
    case 3uLL:
      if (v5)
      {
        v8 = CFSTR("TransitDepartureLiveStatus_description_early_format");
        goto LABEL_8;
      }
      v7 = CFSTR("TransitDepartureLiveStatus_description_early");
      goto LABEL_12;
    case 4uLL:
      if (v5)
      {
        v8 = CFSTR("TransitDepartureLiveStatus_description_delayed_format");
LABEL_8:
        _MNLocalizedStringFromThisBundle(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v6);
        a3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = CFSTR("TransitDepartureLiveStatus_description_delayed");
LABEL_12:
        _MNLocalizedStringFromThisBundle(v7);
        a3 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_13:

      return a3;
    case 5uLL:
      v7 = CFSTR("TransitDepartureLiveStatus_description_canceled");
      goto LABEL_12;
    default:
      goto LABEL_13;
  }
}

+ (id)_frequencyDateComponents:()FormatExtras
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if ((unint64_t)(a3 - 61) >= 0x1D)
    v3 = a3 / 60;
  else
    v3 = 0;
  v4 = a3 - 60 * v3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setMinute:", v4);
  objc_msgSend(v5, "setHour:", v3);
  return v5;
}

+ (id)_navigation_descriptionForFrequencyMinuteValue:()FormatExtras
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_frequencyDateComponents:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_frequencyStringForComponents:forRange:forceShort:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_navigation_descriptionForFrequencyRangeWithMinFrequency:()FormatExtras maxFrequency:estimate:recurring:
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v9 = a3 < 90;
  v10 = a4 < 90;
  if (v9 && v10)
    v11 = 0;
  else
    v11 = a4 / 60;
  if (v9 && v10)
    v12 = 0;
  else
    v12 = a3 / 60;
  v13 = a3 - 60 * v12;
  v14 = a4 - 60 * v11;
  if (v12 >= 1 && v11 >= 1 && (v13 | v14) == 0)
  {
    objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInHoursWithMinHours:maxHours:estimate:recurring:", v12, v11, a5, a6);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v21 = (void *)v20;
    return v21;
  }
  if (!(v12 | v11))
  {
    objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInMinutesWithMinMinutes:maxMinutes:estimate:recurring:", a3 - 60 * v12, a4 - 60 * v11, a5, a6);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v17, "setMinute:", v13);
  objc_msgSend(v17, "setHour:", v12);
  v18 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v18, "setMinute:", v14);
  objc_msgSend(v18, "setHour:", v11);
  if ((objc_msgSend(a1, "_componentsWillUseShortFormat:", v17) & 1) != 0)
    v19 = 1;
  else
    v19 = objc_msgSend(a1, "_componentsWillUseShortFormat:", v18);
  objc_msgSend(a1, "_frequencyStringForComponents:forRange:forceShort:", v18, 1, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_frequencyStringForComponents:forRange:forceShort:", v17, 1, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInMixedUnitsWithMinString:maxString:estimate:recurring:", v23, v22, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_navigation_frequencyRangeLocalizedInMinutesWithMinMinutes:()FormatExtras maxMinutes:estimate:recurring:
{
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a6)
  {
    if (a5)
    {
      _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_estimated_range_min_format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a3;
      v9 = (id *)&v20;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %d"), &v20, a4, v17, v19, 0);
    }
    else
    {
      _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_range_min_format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a3;
      v9 = (id *)&v19;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %d"), &v19, a4, v18, 0, v20);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v9;

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_description_minutes_range"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v12, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

+ (id)_navigation_frequencyRangeLocalizedInHoursWithMinHours:()FormatExtras maxHours:estimate:recurring:
{
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a6)
  {
    if (a5)
    {
      _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_estimated_range_hr_format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a3;
      v9 = (id *)&v20;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %d"), &v20, a4, v17, v19, 0);
    }
    else
    {
      _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_range_hr_format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a3;
      v9 = (id *)&v19;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %d"), &v19, a4, v18, 0, v20);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v9;

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_description_hour_range"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v12, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

+ (id)_navigation_frequencyRangeLocalizedInMixedUnitsWithMinString:()FormatExtras maxString:estimate:recurring:
{
  id v9;
  id v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = CFSTR("TransitDepartureFrequency_description_mixes_range_recurring");
  if (a5)
    v11 = CFSTR("TransitDepartureFrequency_description_mixes_range_estimated_recurring");
  if (a6)
    v12 = (__CFString *)v11;
  else
    v12 = CFSTR("TransitDepartureFrequency_description_mixes_range");
  _MNLocalizedStringFromThisBundle(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", a3, 1, 0, 0, 0);
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  _OWORD v14[2];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v15 = CFSTR("{currentDestination}");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = a4[1];
  v14[0] = *a4;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v7, v14, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:allTokensExpanded:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v17 = CFSTR("{currentDestination}");
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = a4[1];
  v16[0] = *a4;
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", v9, v16, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = v12;
  if (v12)
  {
    v17 = CFSTR("{currentDestination}");
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:", v11, a4, a5, a6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:allTokensExpanded:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = v12;
  if (v12)
  {
    v17 = CFSTR("{currentDestination}");
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", v11, a4, a5, a6, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:
{
  __int128 v5;
  _OWORD v7[2];

  v5 = a4[1];
  v7[0] = *a4;
  v7[1] = v5;
  objc_msgSend(a1, "_navigation_replacementForFormatToken:options:overrideVariables:useMetric:", a3, v7, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:useMetric:
{
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  double v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __int128 v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  uint64_t v45;
  float v46;
  double v47;
  void *v49;
  __int128 v50;
  __int128 v51;

  objc_msgSend(a1, "_navigation_overridenTokenForToken:overrideVariables:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", objc_msgSend(v9, "value1"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 2:
      v15 = (double)objc_msgSend(v9, "value1");
      if (a4[16])
        objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:context:extraDetail:", 0, 0, v15);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:shouldScale:", *((_QWORD *)a4 + 1), *a4, 0, a6, 0, objc_msgSend(v9, "shouldScaleUnits"), v15);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 3:
    case 9:
      objc_msgSend(v9, "timeStampValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v13 = *((_OWORD *)a4 + 1);
        v50 = *(_OWORD *)a4;
        v51 = v13;
        objc_msgSend(a1, "_navigation_stringWithTimeStampValues:options:", v12, &v50);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v10 = (__CFString *)v14;
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_46;
    case 4:
      v16 = a4[16];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_msgSend(v9, "value1");
      v19 = v17;
      v20 = 1;
      if (!v16)
        goto LABEL_10;
      goto LABEL_12;
    case 5:
      v21 = a4[16];
      v22 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_msgSend(v9, "value1");
      v19 = v22;
      v20 = 0;
      if (v21)
      {
LABEL_12:
        objc_msgSend(v19, "_navigation_spokenStringWithSeconds:abbreviated:", v18, v20);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_10:
        objc_msgSend(v19, "_navigation_stringWithSeconds:abbreviated:", v18, v20);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_45;
    case 6:
      v23 = llroundf((float)objc_msgSend(v9, "value1") / 60.0);
      if (v23 <= 1)
        v24 = 1;
      else
        v24 = v23;
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_descriptionForFrequencyMinuteValue:", v24);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 7:
      v25 = llroundf((float)objc_msgSend(v9, "value1") / 60.0);
      v26 = llroundf((float)objc_msgSend(v9, "value2") / 60.0);
      if (v25 <= 1)
        v27 = 1;
      else
        v27 = v25;
      if (v26 <= 1)
        v28 = 1;
      else
        v28 = v26;
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_descriptionForFrequencyRangeWithMinFrequency:maxFrequency:estimate:recurring:", v27, v28, 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 8:
      objc_msgSend(v9, "priceValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "value");
        v32 = v31;
        objc_msgSend(v30, "currencyCode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_navigation_formattedStringForPriceValue:currencyCode:", v33, v32);
        v34 = objc_claimAutoreleasedReturnValue();
LABEL_41:
        v10 = (__CFString *)v34;

      }
      else
      {
        v10 = 0;
      }

LABEL_46:
      return v10;
    case 10:
    case 17:
    case 18:
      goto LABEL_2;
    case 11:
      objc_msgSend(v9, "artworkValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "shieldDataSource");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shieldText");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "length"))
      {
        v38 = v37;
LABEL_34:
        v10 = v38;
      }
      else
      {
        objc_msgSend(v9, "stringValue");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "length"))
        {
          objc_msgSend(v9, "stringValue");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

      }
      goto LABEL_35;
    case 12:
      objc_msgSend(v9, "countdownValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *((_OWORD *)a4 + 1);
      v50 = *(_OWORD *)a4;
      v51 = v39;
      objc_msgSend(a1, "_navigation_stringWithCountdownValue:inToken:options:", v12, v9, &v50);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 13:
      if (qword_1ED0C3E88 != -1)
        dispatch_once(&qword_1ED0C3E88, &__block_literal_global_561);
      v40 = (void *)qword_1ED0C3E80;
      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "percentageValue");
      *(float *)&v43 = v42 * 0.01;
      objc_msgSend(v41, "numberWithFloat:", v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringFromNumber:", v37);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 14:
      objc_msgSend(v9, "urlValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "displayTitle");
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 15:
      objc_msgSend(v9, "stringValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
LABEL_2:
        objc_msgSend(v9, "stringValue");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_45:
        v10 = (__CFString *)v11;
      }
      else
      {
        objc_msgSend(v9, "maneuverValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v37, "maneuverType");
        v10 = CFSTR("NO_TURN");
        switch((int)v45)
        {
          case 0:
            break;
          case 1:
            v10 = CFSTR("LEFT_TURN");
            break;
          case 2:
            v10 = CFSTR("RIGHT_TURN");
            break;
          case 3:
            v10 = CFSTR("STRAIGHT_AHEAD");
            break;
          case 4:
            v10 = CFSTR("U_TURN");
            break;
          case 5:
            v10 = CFSTR("FOLLOW_ROAD");
            break;
          case 6:
            v10 = CFSTR("ENTER_ROUNDABOUT");
            break;
          case 7:
            v10 = CFSTR("EXIT_ROUNDABOUT");
            break;
          case 11:
            v10 = CFSTR("OFF_RAMP");
            break;
          case 12:
            v10 = CFSTR("ON_RAMP");
            break;
          case 16:
            v10 = CFSTR("ARRIVE_END_OF_NAVIGATION");
            break;
          case 17:
            v10 = CFSTR("START_ROUTE");
            break;
          case 18:
            v10 = CFSTR("ARRIVE_AT_DESTINATION");
            break;
          case 20:
            v10 = CFSTR("KEEP_LEFT");
            break;
          case 21:
            v10 = CFSTR("KEEP_RIGHT");
            break;
          case 22:
            v10 = CFSTR("ENTER_FERRY");
            break;
          case 23:
            v10 = CFSTR("EXIT_FERRY");
            break;
          case 24:
            v10 = CFSTR("CHANGE_FERRY");
            break;
          case 25:
            v10 = CFSTR("START_ROUTE_WITH_U_TURN");
            break;
          case 26:
            v10 = CFSTR("U_TURN_AT_ROUNDABOUT");
            break;
          case 27:
            v10 = CFSTR("LEFT_TURN_AT_END");
            break;
          case 28:
            v10 = CFSTR("RIGHT_TURN_AT_END");
            break;
          case 29:
            v10 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
            break;
          case 30:
            v10 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
            break;
          case 33:
            v10 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
            break;
          case 34:
            v10 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
            break;
          case 35:
            v10 = CFSTR("U_TURN_WHEN_POSSIBLE");
            break;
          case 39:
            v10 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
            break;
          case 41:
            v10 = CFSTR("ROUNDABOUT_EXIT_1");
            break;
          case 42:
            v10 = CFSTR("ROUNDABOUT_EXIT_2");
            break;
          case 43:
            v10 = CFSTR("ROUNDABOUT_EXIT_3");
            break;
          case 44:
            v10 = CFSTR("ROUNDABOUT_EXIT_4");
            break;
          case 45:
            v10 = CFSTR("ROUNDABOUT_EXIT_5");
            break;
          case 46:
            v10 = CFSTR("ROUNDABOUT_EXIT_6");
            break;
          case 47:
            v10 = CFSTR("ROUNDABOUT_EXIT_7");
            break;
          case 48:
            v10 = CFSTR("ROUNDABOUT_EXIT_8");
            break;
          case 49:
            v10 = CFSTR("ROUNDABOUT_EXIT_9");
            break;
          case 50:
            v10 = CFSTR("ROUNDABOUT_EXIT_10");
            break;
          case 51:
            v10 = CFSTR("ROUNDABOUT_EXIT_11");
            break;
          case 52:
            v10 = CFSTR("ROUNDABOUT_EXIT_12");
            break;
          case 53:
            v10 = CFSTR("ROUNDABOUT_EXIT_13");
            break;
          case 54:
            v10 = CFSTR("ROUNDABOUT_EXIT_14");
            break;
          case 55:
            v10 = CFSTR("ROUNDABOUT_EXIT_15");
            break;
          case 56:
            v10 = CFSTR("ROUNDABOUT_EXIT_16");
            break;
          case 57:
            v10 = CFSTR("ROUNDABOUT_EXIT_17");
            break;
          case 58:
            v10 = CFSTR("ROUNDABOUT_EXIT_18");
            break;
          case 59:
            v10 = CFSTR("ROUNDABOUT_EXIT_19");
            break;
          case 60:
            v10 = CFSTR("SHARP_LEFT_TURN");
            break;
          case 61:
            v10 = CFSTR("SHARP_RIGHT_TURN");
            break;
          case 62:
            v10 = CFSTR("SLIGHT_LEFT_TURN");
            break;
          case 63:
            v10 = CFSTR("SLIGHT_RIGHT_TURN");
            break;
          case 64:
            v10 = CFSTR("CHANGE_HIGHWAY");
            break;
          case 65:
            v10 = CFSTR("CHANGE_HIGHWAY_LEFT");
            break;
          case 66:
            v10 = CFSTR("CHANGE_HIGHWAY_RIGHT");
            break;
          case 80:
            v10 = CFSTR("TOLL_STATION");
            break;
          case 81:
            v10 = CFSTR("ENTER_TUNNEL");
            break;
          case 82:
            v10 = CFSTR("WAYPOINT_STOP");
            break;
          case 83:
            v10 = CFSTR("WAYPOINT_STOP_LEFT");
            break;
          case 84:
            v10 = CFSTR("WAYPOINT_STOP_RIGHT");
            break;
          case 85:
            v10 = CFSTR("RESUME_ROUTE");
            break;
          case 86:
            v10 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
            break;
          case 87:
            v10 = CFSTR("CUSTOM");
            break;
          case 88:
            v10 = CFSTR("TURN_AROUND");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v45);
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
        }
LABEL_35:

      }
      goto LABEL_46;
    case 16:
      objc_msgSend(v9, "numberData");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_46;
      objc_msgSend(v9, "numberData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "value");
      v47 = v46;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_navigation_stringForPower:unit:", v33, v47);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    default:
      goto LABEL_46;
  }
}

+ (_TempToken)_navigation_overridenTokenForToken:()FormatExtras overrideVariables:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _TempToken *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  int v22;
  double v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[_TempToken initWithToken:]([_TempToken alloc], "initWithToken:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            -[_TempToken setValue1:](v9, "setValue1:", objc_msgSend(v13, "unsignedIntegerValue"));

        }
      }
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v16 = objc_opt_isKindOfClass();

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
            -[_TempToken setValue2:](v9, "setValue2:", objc_msgSend(v17, "unsignedIntegerValue"));

        }
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v8;
        -[_TempToken setValue1:](v9, "setValue1:", objc_msgSend(v19, "unsignedIntegerValue"));
        objc_msgSend(v19, "floatValue");
        -[_TempToken setPercentageValue:](v9, "setPercentageValue:");
        v20 = objc_alloc_init(MEMORY[0x1E0D272B0]);
        objc_msgSend(v19, "floatValue");
        v22 = v21;

        LODWORD(v23) = v22;
        objc_msgSend(v20, "setValue:", v23);
        -[_TempToken setNumberData:](v9, "setNumberData:", v20);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[_TempToken setStringValue:](v9, "setStringValue:", v8);
      }
    }
  }
  else
  {
    v9 = (_TempToken *)v5;
  }

  return v9;
}

+ (id)_navigation_replacementForFormatToken:()FormatExtras abbreviatedUnits:overrideVariables:detail:spoken:
{
  _BYTE v8[8];
  uint64_t v9;
  char v10;
  _BYTE v11[15];

  v8[0] = a4;
  memset(&v8[1], 0, 7);
  v9 = a6;
  v10 = a7;
  memset(v11, 0, sizeof(v11));
  objc_msgSend(a1, "_navigation_replacementForFormatToken:options:overrideVariables:", a3, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_replaceToken:()FormatExtras composedString:replacement:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "+[NSString(FormatExtras) _replaceToken:composedString:replacement:]";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      v21 = 1024;
      v22 = 1141;
      v23 = 2080;
      v24 = "tokenString != nil";
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v17, 0x26u);
    }

  }
  v10 = objc_msgSend(v8, "rangeOfString:", v7);
  v12 = 1;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11)
  {
    v13 = v10;
    do
    {
      if (v9)
      {
        objc_msgSend(v8, "replaceCharactersInRange:withString:", v13, v11, v9);
      }
      else
      {
        objc_msgSend(v8, "deleteCharactersInRange:", v13, v11);
        v12 = 0;
      }
      v14 = objc_msgSend(v8, "rangeOfString:", v7);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v13 = v14;
    }
    while (v11);
  }

  return v12 & 1;
}

+ (uint64_t)_replaceToken:()FormatExtras composedString:options:overrideVariables:
{
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _OWORD v19[2];

  v10 = a6;
  v11 = a4;
  objc_msgSend(a1, "_navigation_overridenTokenForToken:overrideVariables:", a3, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a5[1];
  v19[0] = *a5;
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_replacementForFormatToken:options:overrideVariables:", v12, v19, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "token");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "_replaceToken:composedString:replacement:", v16, v11, v14);

  return v17;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:
{
  __int128 v5;
  _OWORD v7[2];

  v5 = a4[1];
  v7[0] = *a4;
  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", a3, v7, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:allTokensExpanded:
{
  id v7;
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  int v22;
  int v23;
  char v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  BOOL v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  __int128 v73;
  id v74;
  NSObject *v75;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  id obj;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  int v96;
  uint64_t v97;
  void *v99;
  int v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  id v109;
  int v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE buf[32];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v95 = a5;
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "formatStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v91 = v7;
  objc_msgSend(v7, "formatStrings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
  if (v86)
  {
    v87 = *(_QWORD *)v124;
    v96 = 1;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v124 != v87)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
        if (objc_msgSend(v11, "length", v84))
        {
          v84 = i;
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v11);
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          objc_msgSend(v91, "formatTokens");
          v90 = (id)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
          if (!v93)
            goto LABEL_61;
          v92 = *(_QWORD *)v120;
          v99 = v12;
          while (1)
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v120 != v92)
                objc_enumerationMutation(v90);
              v97 = v13;
              v14 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v13);
              objc_msgSend(v14, "genericCombinations", v84);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v105)
              {
                v19 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("{currentDestination}"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = a4[1];
                *(_OWORD *)buf = *a4;
                *(_OWORD *)&buf[16] = v21;
                v22 = objc_msgSend(v19, "_replaceToken:composedString:options:overrideVariables:", v14, v12, buf, v20);

                if ((v22 & 1) != 0)
                {
                  v23 = v96 & v22;
                  goto LABEL_52;
                }
LABEL_53:
                MNGetMNStringExtrasLog();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v14, "token");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v66;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v91;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)&buf[24] = v95;
                  _os_log_impl(&dword_1B0AD7000, v65, OS_LOG_TYPE_ERROR, "Error replacing token %@ for string: %@. Overrides: %@", buf, 0x20u);

                }
                objc_msgSend(v91, "alternativeString");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = v67;
                if (!v67)
                  goto LABEL_58;
                objc_msgSend(v67, "condition");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v69, "conditionType");

                if (v70 != 5)
                  goto LABEL_58;
                v71 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v68, "formattedString");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = a4[1];
                *(_OWORD *)buf = *a4;
                *(_OWORD *)&buf[16] = v73;
                objc_msgSend(v71, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v72, buf, v95);
                v74 = (id)objc_claimAutoreleasedReturnValue();

                if (!v74)
                {
LABEL_58:

                  v96 = 0;
                  goto LABEL_59;
                }
                MNGetMNStringExtrasLog();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v74;
                  _os_log_impl(&dword_1B0AD7000, v75, OS_LOG_TYPE_DEFAULT, "Replacing string with alternative: \"%@\", buf, 0xCu);
                }

                if (a6)
                  *a6 = 0;

LABEL_72:
                goto LABEL_73;
              }
              objc_msgSend(v14, "token");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("{WaypointCategory}"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v94, "intValue");
              if (v17 > 0xB)
              {
                v18 = 0;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(&off_1E61D2228 + (int)v17));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v117 = 0u;
              v118 = 0u;
              v115 = 0u;
              v116 = 0u;
              v101 = v18;
              v104 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
              if (!v104)
              {
                v25 = 0;
                goto LABEL_50;
              }
              v24 = 0;
              v25 = 0;
              v102 = v14;
              v103 = *(_QWORD *)v116;
LABEL_20:
              v26 = 0;
LABEL_21:
              if (*(_QWORD *)v116 != v103)
                objc_enumerationMutation(v101);
              if ((v24 & 1) == 0)
              {
                v27 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v26);
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v105, "substitutes");
                v109 = (id)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
                if (!v28)
                {
                  v24 = 0;
                  goto LABEL_46;
                }
                v29 = v28;
                v100 = v25;
                v106 = v26;
                v30 = *(_QWORD *)v112;
LABEL_26:
                v31 = 0;
                while (1)
                {
                  if (*(_QWORD *)v112 != v30)
                    objc_enumerationMutation(v109);
                  v32 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v31);
                  v33 = objc_msgSend(v32, "waypointCategory");
                  if (v33 == objc_msgSend(v27, "intValue"))
                  {
                    objc_msgSend(v32, "substitute");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "formatArguments");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "firstObject");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v36)
                    {
                      v47 = objc_alloc(MEMORY[0x1E0CB37A0]);
                      objc_msgSend(v32, "substitute");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "formatStrings");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "firstObject");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = (void *)objc_msgSend(v47, "initWithString:", v50);

                      v52 = (void *)MEMORY[0x1E0CB3940];
                      v14 = v102;
                      objc_msgSend(v102, "token");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = v52;
                      goto LABEL_45;
                    }
                    objc_msgSend(v36, "stringSubstituteData");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = objc_msgSend(v37, "stringSubstituteType");
                    if (v16)
                    {
                      v108 = v32;
                      v38 = v16;
                      v39 = v16;
                      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("{Name}_source"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("{Address}_source"));
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v107 = v39;

                      if (objc_msgSend(v40, "intValue") == v110)
                      {

                        v16 = v38;
LABEL_44:
                        v55 = objc_alloc(MEMORY[0x1E0CB37A0]);
                        objc_msgSend(v108, "substitute");
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v56, "formatStrings");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v57, "firstObject");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = (void *)objc_msgSend(v55, "initWithString:", v58);

                        v59 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(v108, "substitute");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "formatArguments");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "firstObject");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        v63 = a4[1];
                        *(_OWORD *)buf = *a4;
                        *(_OWORD *)&buf[16] = v63;
                        objc_msgSend(v59, "_replaceToken:composedString:options:overrideVariables:", v62, v51, buf, v107);

                        v64 = (void *)MEMORY[0x1E0CB3940];
                        v14 = v102;
                        objc_msgSend(v102, "token");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = v64;
LABEL_45:
                        v12 = v99;
                        v25 = objc_msgSend(v54, "_replaceToken:composedString:replacement:", v53, v99, v51);

                        v24 = 1;
                        v26 = v106;
                        goto LABEL_46;
                      }
                      v42 = v30;
                      v43 = v36;
                      v44 = v27;
                      v45 = objc_msgSend(v41, "intValue");

                      v46 = v45 == v110;
                      v27 = v44;
                      v36 = v43;
                      v30 = v42;
                      v16 = v38;
                      if (v46)
                        goto LABEL_44;
                    }
                    else
                    {

                    }
                  }
                  if (v29 == ++v31)
                  {
                    v29 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
                    if (v29)
                      goto LABEL_26;
                    v24 = 0;
                    v12 = v99;
                    v14 = v102;
                    v26 = v106;
                    v25 = v100;
LABEL_46:

                    if (++v26 == v104)
                    {
                      v104 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
                      if (!v104)
                        break;
                      goto LABEL_20;
                    }
                    goto LABEL_21;
                  }
                }
              }
LABEL_50:

              if ((v25 & 1) == 0)
                goto LABEL_53;
              v23 = v96 & v25;
LABEL_52:
              v96 = v23;
LABEL_59:

              v13 = v97 + 1;
            }
            while (v97 + 1 != v93);
            v93 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
            if (!v93)
            {
LABEL_61:

              if (objc_msgSend(v12, "length"))
                objc_msgSend(v89, "addObject:", v12);

              i = v84;
              break;
            }
          }
        }
      }
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    }
    while (v86);
  }
  else
  {
    LOBYTE(v96) = 1;
  }

  v74 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v77 = v89;
  if (objc_msgSend(v89, "count"))
  {
    v78 = 0;
    do
    {
      objc_msgSend(v77, "objectAtIndexedSubscript:", v78, v84);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "appendString:", v79);
      if (v78 < objc_msgSend(v77, "count") - 1)
      {
        objc_msgSend(v91, "separators");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = &stru_1E61D9090;
        if (v78 < objc_msgSend(v80, "count"))
        {
          objc_msgSend(v91, "separators");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectAtIndexedSubscript:", v78);
          v81 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v74, "appendString:", v81);

      }
      ++v78;
      v77 = v89;
    }
    while (v78 < objc_msgSend(v89, "count"));
  }
  if (a6)
    *a6 = v96 & 1;
  if ((v96 & 1) == 0)
  {
    MNGetMNStringExtrasLog();
    v83 = objc_claimAutoreleasedReturnValue();
    obj = v83;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v74;
      _os_log_impl(&dword_1B0AD7000, v83, OS_LOG_TYPE_ERROR, "Error replacing all tokens. Resulting string is \"%@\".", buf, 0xCu);
    }
    goto LABEL_72;
  }
LABEL_73:

  return v74;
}

+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", a3, a4, a5, a6, a7, 0);
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:
{
  _BYTE v9[8];
  uint64_t v10;
  char v11;
  _BYTE v12[15];

  v9[0] = a4;
  memset(&v9[1], 0, 7);
  v10 = a5;
  v11 = a6;
  memset(v12, 0, sizeof(v12));
  objc_msgSend(a1, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", a3, v9, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras context:extraDetail:
{
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  BOOL v20;
  double v21;
  BOOL v22;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_navigation_distanceUsesMetricSystem");

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_navigation_useYardsForShortDistances");

  if (a5)
    v12 = 2;
  else
    v12 = 0;
  if (a4)
  {
    if (a4 == 5)
    {
      v12 = 3;
      v13 = 1;
    }
    else
    {
      v13 = a4 != 4;
    }
  }
  else
  {
    v15 = MNInstructionsCalculateScaledDistanceUnits(v9, v11, 0, 1, a1);
    v20 = v15 != 4 && v15 != 1 || *(float *)&v16 <= 1.0 || *(float *)&v16 >= 10.0 || (v16 & 0x100000000) == 0;
    v21 = floor(*(float *)&v16);
    v22 = v20 || v21 == *(float *)&v16;
    v13 = 2;
    if (v22)
      v12 = 1;
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", v12, v13, 0, 0, 0, a1);
}

+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:
{
  return objc_msgSend(a1, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:shouldScale:", a3, a4, a5, a6, a7, 1);
}

+ (id)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:shouldScale:
{
  id v15;
  _MNDistanceFormatOptions *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v15 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_alloc_init(_MNDistanceFormatOptions);
  if (a7 == 2)
  {
    v17 = 1;
  }
  else if (a7 == 1)
  {
    v17 = 0;
  }
  else
  {
    if (a7)
      goto LABEL_10;
    v17 = objc_msgSend(v15, "_navigation_distanceUsesMetricSystem");
  }
  -[_MNDistanceFormatOptions setMetric:](v16, "setMetric:", v17);
LABEL_10:
  if (a8 == 2)
  {
    v18 = 1;
  }
  else if (a8 == 1)
  {
    v18 = 0;
  }
  else
  {
    if (a8)
      goto LABEL_17;
    v18 = objc_msgSend(v15, "_navigation_useYardsForShortDistances");
  }
  -[_MNDistanceFormatOptions setYards:](v16, "setYards:", v18);
LABEL_17:
  -[_MNDistanceFormatOptions setMinimumFractionDigits:](v16, "setMinimumFractionDigits:", 1);
  -[_MNDistanceFormatOptions setAbbreviateUnits:](v16, "setAbbreviateUnits:", a5 == 1);
  -[_MNDistanceFormatOptions setSpoken:](v16, "setSpoken:", a5 == 2);
  -[_MNDistanceFormatOptions setRounding:](v16, "setRounding:", a4);
  if (a4 <= 3)
    -[_MNDistanceFormatOptions setMaximumFractionDigits:](v16, "setMaximumFractionDigits:", qword_1B0BF2F50[a4]);
  if (-[_MNDistanceFormatOptions spoken](v16, "spoken"))
  {
    -[_MNDistanceFormatOptions setAbbreviateUnits:](v16, "setAbbreviateUnits:", 0);
    -[_MNDistanceFormatOptions setMaximumFractionDigits:](v16, "setMaximumFractionDigits:", -[_MNDistanceFormatOptions maximumFractionDigits](v16, "maximumFractionDigits") != 0);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_navigation_isNavd");

    v21 = (void *)MEMORY[0x1E0C99DC8];
    if (v20)
      +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
    else
      +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentVoiceLanguage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localeWithLocaleIdentifier:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v24;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForDistance:formatter:locale:shouldScale:", v16, v15, a9, a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_navigation_formatterForOptions:()FormatExtras
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (qword_1ED0C3E98 != -1)
    dispatch_once(&qword_1ED0C3E98, &__block_literal_global_572);
  objc_msgSend((id)qword_1ED0C3E90, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3760]);
    objc_msgSend(v4, "setUnitOptions:", 1);
    if (objc_msgSend(v3, "abbreviateUnits"))
      v5 = 2;
    else
      v5 = 3;
    objc_msgSend(v4, "setUnitStyle:", v5);
    v6 = objc_msgSend(v3, "minimumFractionDigits");
    objc_msgSend(v4, "numberFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinimumFractionDigits:", v6);

    v8 = objc_msgSend(v3, "maximumFractionDigits");
    objc_msgSend(v4, "numberFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaximumFractionDigits:", v8);

    objc_msgSend(v3, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v10);

    objc_msgSend((id)qword_1ED0C3E90, "setObject:forKey:", v4, v3);
  }

  return v4;
}

+ (id)_navigation_stringForDistance:()FormatExtras formatter:locale:shouldScale:
{
  id v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  int v20;
  __CFString *v21;
  uint64_t v22;
  float v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v39;
  __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  objc_msgSend(v9, "setLocale:", a5);
  v10 = objc_msgSend(v9, "spoken");
  v11 = MNInstructionsCalculateScaledDistanceUnits(objc_msgSend(v9, "metric"), objc_msgSend(v9, "yards"), objc_msgSend(v9, "rounding"), a6, a1);
  v13 = v12;
  v14 = *(float *)&v12;
  v15 = objc_msgSend(v9, "rounding");
  v16 = HIDWORD(v13) & 1;
  if (v15 != 1)
    LODWORD(v16) = 0;
  if (v10)
  {
    if ((_DWORD)v16)
    {
      GEOFindOrCreateLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v46 = 136315906;
        v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
        v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
        v50 = 1024;
        v51 = 1533;
        v52 = 2080;
        v53 = "formatOptions.rounding != MNInstructionsDistanceDetailLevelWholeNumbers || !distanceUnits.hasDecimalComponent";
        _os_log_impl(&dword_1B0AD7000, v42, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
      }

    }
    v17 = objc_msgSend(v9, "rounding");
    v18 = floorf(v14);
    if (v17 == 1)
      v19 = v18;
    else
      v19 = v14;
    switch(v11)
    {
      case 0:
        goto LABEL_26;
      case 1:
        goto LABEL_32;
      case 2:
        goto LABEL_27;
      case 3:
        goto LABEL_28;
      case 4:
        goto LABEL_34;
      case 5:
        v20 = (int)v19;
        if (((int)v19 - 4) <= 0xFFFFFFFC)
        {
          GEOFindOrCreateLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v46 = 136315906;
            v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
            v48 = 2080;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
            v50 = 1024;
            v51 = 1566;
            v52 = 2080;
            v53 = "integralDistance > 0 && integralDistance < 4";
            _os_log_impl(&dword_1B0AD7000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
          }

        }
        if (v20 == 2)
        {
          v21 = CFSTR("half a mile [SPOKEN]");
        }
        else if (v20 == 3)
        {
          v21 = CFSTR("three quarters of a mile [SPOKEN]");
        }
        else
        {
          v21 = CFSTR("a quarter mile [SPOKEN]");
        }
        _MNStringFromSpokenLocalization(v21);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      default:
        GEOFindOrCreateLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v46 = 136315650;
          v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
          v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          v50 = 1024;
          v51 = 1577;
          _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v46, 0x1Cu);
        }
        goto LABEL_36;
    }
  }
  if ((_DWORD)v16)
  {
    GEOFindOrCreateLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v46 = 136315906;
      v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
      v48 = 2080;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      v50 = 1024;
      v51 = 1583;
      v52 = 2080;
      v53 = "formatOptions.rounding != MNInstructionsDistanceDetailLevelWholeNumbers || !distanceUnits.hasDecimalComponent";
      _os_log_impl(&dword_1B0AD7000, v43, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
    }

  }
  v22 = objc_msgSend(v9, "rounding");
  v23 = floorf(v14);
  if (v22 == 1)
    v19 = v23;
  else
    v19 = v14;
  if ((v13 & 0x100000000) != 0)
  {
    v24 = objc_msgSend(v9, "minimumFractionDigits");
    v25 = __exp10((double)(unint64_t)objc_msgSend(v9, "maximumFractionDigits"));
    v26 = objc_msgSend(v9, "minimumFractionDigits");
    if (v26 < objc_msgSend(v9, "maximumFractionDigits"))
    {
      v27 = round(v25 * v19) / v25;
      v28 = __exp10((double)v26);
      if (round(v28 * v19) / v28 != v27)
      {
        v29 = v26 + 1;
        do
        {
          v24 = v29;
          if (v29 >= objc_msgSend(v9, "maximumFractionDigits"))
            break;
          v30 = __exp10((double)v24);
          v29 = v24 + 1;
        }
        while (round(v30 * v19) / v30 != v27);
      }
    }
  }
  else
  {
    v24 = 0;
  }
  switch(v11)
  {
    case 0:
LABEL_26:
      objc_msgSend(v9, "setMinimumFractionDigits:", 0);
      objc_msgSend(v9, "setMaximumFractionDigits:", 0);
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 1:
      objc_msgSend(v9, "setMinimumFractionDigits:", v24);
      objc_msgSend(v9, "setMaximumFractionDigits:", v24);
LABEL_32:
      objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 2:
LABEL_27:
      objc_msgSend(v9, "setMinimumFractionDigits:", 0);
      objc_msgSend(v9, "setMaximumFractionDigits:", 0);
      objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 3:
LABEL_28:
      objc_msgSend(v9, "setMinimumFractionDigits:", 0);
      objc_msgSend(v9, "setMaximumFractionDigits:", 0);
      objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 4:
      objc_msgSend(v9, "setMinimumFractionDigits:", v24);
      objc_msgSend(v9, "setMaximumFractionDigits:", v24);
LABEL_34:
      objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_35:
      v32 = v31;
      objc_msgSend(v9, "setUnitLength:", v31);
LABEL_36:

      goto LABEL_37;
    case 5:
      v39 = (int)v19;
      if (((int)v19 - 4) <= 0xFFFFFFFC)
      {
        GEOFindOrCreateLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = 136315906;
          v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
          v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          v50 = 1024;
          v51 = 1636;
          v52 = 2080;
          v53 = "integralDistance > 0 && integralDistance < 4";
          _os_log_impl(&dword_1B0AD7000, v45, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
        }

      }
      if (v39 == 2)
      {
        v40 = CFSTR("1/2 mile");
      }
      else if (v39 == 3)
      {
        v40 = CFSTR("3/4 mile");
      }
      else
      {
        v40 = CFSTR("1/4 mile");
      }
      _MNLocalizedStringFromThisBundle(v40);
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_49:
      v37 = (void *)v41;
      if (!v41)
        goto LABEL_37;
      goto LABEL_38;
    default:
LABEL_37:
      objc_msgSend((id)objc_opt_class(), "_navigation_formatterForOptions:", v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v9, "unitLength");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithDoubleValue:unit:", v35, v19);
      objc_msgSend(v33, "stringFromMeasurement:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
      return v37;
  }
}

+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras abbreviated:
{
  return objc_msgSend(a1, "_navigation_stringWithSeconds:andAbbreviationType:", a3, a4);
}

+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras andAbbreviationType:
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 60 * (a3 / 0x3C);
  v4 = a3 == v3;
  v5 = v3 + 60;
  if (v4)
    v5 = a3;
  return objc_msgSend(a1, "_navigation_stringWithMinutes:andAbbreviationType:", v5 / 0x3C);
}

+ (id)_navigation_stringWithMinutes:()FormatExtras andAbbreviationType:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(v7, "setZeroFormattingBehavior:", 14);
  objc_msgSend(v7, "setAllowedUnits:", 112);
  objc_msgSend(v7, "setMaximumUnitCount:", 2);
  if (a4 == 2)
  {
    objc_msgSend(v7, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v11));

  }
  else
  {
    if (a4 == 1)
    {
      v8 = v7;
      v9 = 2;
    }
    else
    {
      if (a4)
        goto LABEL_8;
      v8 = v7;
      v9 = 3;
    }
    objc_msgSend(v8, "setUnitsStyle:", v9);
  }
LABEL_8:
  objc_msgSend(v7, "stringFromTimeInterval:", (double)(unint64_t)(60 * a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E61D9090);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras abbreviated:
{
  return objc_msgSend(a1, "_navigation_spokenStringWithSeconds:andAbbreviationType:", a3, a4);
}

+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras andAbbreviationType:
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 60 * (a3 / 0x3C);
  v4 = a3 == v3;
  v5 = v3 + 60;
  if (v4)
    v5 = a3;
  return objc_msgSend(a1, "_navigation_spokenStringWithMinutes:andAbbreviationType:", v5 / 0x3C);
}

+ (id)_navigation_spokenStringWithMinutes:()FormatExtras andAbbreviationType:
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(v7, "setZeroFormattingBehavior:", 14);
  objc_msgSend(v7, "setAllowedUnits:", 112);
  objc_msgSend(v7, "setMaximumUnitCount:", 2);
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_navigation_isNavd");

  v11 = (void *)MEMORY[0x1E0C99DC8];
  if (v10)
    +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  else
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentVoiceLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeWithLocaleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v14);

  objc_msgSend(v7, "setCalendar:", v8);
  if (a4 == 2)
  {
    objc_msgSend(v7, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v18));

  }
  else
  {
    if (a4 == 1)
    {
      v15 = v7;
      v16 = 2;
    }
    else
    {
      if (a4)
        goto LABEL_11;
      v15 = v7;
      v16 = 3;
    }
    objc_msgSend(v15, "setUnitsStyle:", v16);
  }
LABEL_11:
  objc_msgSend(v7, "stringFromTimeInterval:", (double)(unint64_t)(60 * a3));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E61D9090);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_navigation_stringWithTimeStampValues:()FormatExtras options:
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  void *v60;
  char v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = objc_msgSend(v5, "count");
  if (v7 <= 3)
    v8 = 3;
  else
    v8 = v7;
  objc_msgSend(v6, "arrayWithCapacity:", v8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v10);

  objc_msgSend(v9, "AMSymbol");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PMSymbol");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v11 | v57)
  {
    if (*(_BYTE *)(a4 + 17))
      v12 = 1;
    else
      v12 = (unint64_t)objc_msgSend(v5, "count") > 1;
  }
  else
  {
    v12 = 0;
  }
  if (*(_BYTE *)(a4 + 17))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = 0;
  }
  v55 = a4;
  v56 = (void *)v11;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v5;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (!v13)
  {
    v61 = 0;
    v58 = 0;
    goto LABEL_47;
  }
  v14 = v13;
  v61 = 0;
  v58 = 0;
  v15 = *(_QWORD *)v64;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v64 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_msgSend(v17, "formatPattern");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (!v19)
        continue;
      objc_msgSend(v17, "timeZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "formatPattern");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocalizedDateFormatFromTemplate:", v21);

      objc_msgSend(v9, "setTimeZone:", v20);
      v22 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v17, "timeStamp");
      objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v12 = 0;
        goto LABEL_42;
      }
      if (!v56 || (v25 = objc_msgSend(v24, "rangeOfString:", v56), v25 == 0x7FFFFFFFFFFFFFFFLL))
      {
        v27 = 0;
LABEL_25:
        v31 = v58;
        goto LABEL_26;
      }
      v28 = v25;
      if (*(_BYTE *)(v55 + 17))
      {
        objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v25, v26, &stru_1E61D9090);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v54);
        v30 = objc_claimAutoreleasedReturnValue();

        v27 = 0;
        v24 = (void *)v30;
        goto LABEL_25;
      }
      v27 = (void *)objc_msgSend(v56, "copy");
      v31 = v58;
      v61 |= (v58 | v28) == 0;
      if (v27)
        goto LABEL_28;
LABEL_26:
      if (!v57 || (v32 = objc_msgSend(v24, "rangeOfString:", v57), v32 == 0x7FFFFFFFFFFFFFFFLL))
      {
LABEL_28:
        if ((v61 & 1) != 0)
          goto LABEL_29;
LABEL_40:
        v12 = 0;
        v34 = v24;
        goto LABEL_41;
      }
      v37 = v32;
      if (!*(_BYTE *)(v55 + 17))
      {
        v27 = (void *)objc_msgSend((id)v57, "copy");
        if (((v31 | v37) == 0) | v61 & 1)
        {
LABEL_29:
          v34 = v24;
LABEL_30:
          if (v31 && objc_msgSend(v27, "isEqualToString:", v31))
          {
            objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", v27, &stru_1E61D9090);
            v35 = objc_claimAutoreleasedReturnValue();

            v34 = (void *)v35;
          }
          v36 = objc_msgSend(v27, "copy");

          v12 = 1;
          v58 = v36;
          goto LABEL_41;
        }
        goto LABEL_40;
      }
      objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v32, v33, &stru_1E61D9090);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringByTrimmingCharactersInSet:", v54);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      if ((v61 & 1) != 0)
        goto LABEL_30;
      v12 = 0;
LABEL_41:

      v24 = v34;
      v61 = v12;
LABEL_42:
      objc_msgSend(v60, "addObject:", v24);
      v39 = objc_msgSend(v60, "count");

      if (v39 == 3)
        goto LABEL_47;
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  }
  while (v14);
LABEL_47:

  v40 = v56;
  if ((unint64_t)objc_msgSend(v60, "count") > 1)
  {
    _MNLocalizedStringFromThisBundle(CFSTR("timestamp list delimiter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "componentsJoinedByString:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v61 & 1) != 0 || *(_BYTE *)(v55 + 17))
    {
      v41 = v43;
LABEL_52:

      goto LABEL_53;
    }
    if (objc_msgSend(v56, "length") && objc_msgSend((id)v57, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((\\s*%@)(?=(?:.(?!%@))+(?:(?=%@))))|((\\s*%@)(?=(?:.(?!%@))+(?:(?=%@))))"), v56, v57, v56, v57, v56, v57);
    }
    else
    {
      if (!objc_msgSend(v56, "length") && !objc_msgSend((id)v57, "length"))
      {
        v47 = 0;
        goto LABEL_63;
      }
      v45 = objc_msgSend(v56, "length");
      v46 = (void *)v57;
      if (v45)
        v46 = v56;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(\\s*%@)(?=.*%@)"), v46, v46, v50, v51, v52, v53);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:
    if (objc_msgSend(v47, "length"))
    {
      v62 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v47, 0, &v62);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v62)
      {
        objc_msgSend(v48, "stringByReplacingMatchesInString:options:range:withTemplate:", v43, 0, 0, objc_msgSend(v43, "length"), &stru_1E61D9090);
        v49 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v49;
      }

      v40 = v56;
    }
    v41 = v43;

    goto LABEL_52;
  }
  objc_msgSend(v60, "firstObject");
  v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v41;
}

+ (id)_navigation_stringWithCountdownValue:()FormatExtras inToken:options:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int IsImminentDepartureTimeInterval;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _TempTokenTimestampValue *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v47;
  NSObject *v48;
  uint64_t v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE buf[38];
  __int16 v58;
  void *v59;
  _TempTokenTimestampValue *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(v7, "timestamps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = a5;
  if (*(double *)(a5 + 24) <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v8;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  v52 = v12;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v54;
    v17 = 2;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v12);
        v19 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "doubleValue");
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v11);
        v22 = v21;
        IsImminentDepartureTimeInterval = GEOTransitDepartureIsImminentDepartureTimeInterval();
        if (v22 >= 0.0 || IsImminentDepartureTimeInterval != 0)
        {
          if ((IsImminentDepartureTimeInterval & 1) != 0)
          {
            v17 -= (v15 & 1) == 0;
            v15 = 1;
          }
          else
          {
            v25 = (uint64_t)v22 / 60 <= 1 ? 1 : (uint64_t)v22 / 60;
            objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v26);

            v12 = v52;
          }
          if (objc_msgSend(v9, "count") == v17)
          {

            goto LABEL_25;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_25:

  if (*(_BYTE *)(v50 + 18))
  {
    v27 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v9, "reverseObjectEnumerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayWithArray:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v12 = v52;
    v9 = (void *)v30;
  }
  if ((v15 & 1) != 0 && objc_msgSend(v9, "count"))
  {
    v31 = 2;
  }
  else
  {
    v32 = objc_msgSend(v9, "count");
    if (v32)
      v31 = 3;
    else
      v31 = 1;
    if (!((v32 != 0) | v15 & 1))
    {
      v35 = objc_alloc_init(_TempTokenTimestampValue);
      objc_msgSend(v12, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      -[_TempTokenTimestampValue setTimeStamp:](v35, "setTimeStamp:");

      -[_TempTokenTimestampValue setFormatPattern:](v35, "setFormatPattern:", CFSTR("jjmm"));
      v60 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_OWORD *)(v50 + 16);
      *(_OWORD *)buf = *(_OWORD *)v50;
      *(_OWORD *)&buf[16] = v39;
      objc_msgSend(a1, "_navigation_stringWithTimeStampValues:options:", v38, buf);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

      goto LABEL_43;
    }
  }
  objc_msgSend(v7, "alternativeFormatStringsByType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v34);
  v35 = (_TempTokenTimestampValue *)objc_claimAutoreleasedReturnValue();

  if (!v35 && objc_msgSend(v7, "countdownType") != v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Server did not provide a format string for us to use"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "+[NSString(FormatExtras) _navigation_stringWithCountdownValue:inToken:options:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1959;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = "formatString || value.countdownType == preferredType";
      v58 = 2112;
      v59 = v47;
      _os_log_impl(&dword_1B0AD7000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  objc_msgSend(v7, "separator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "length"))
    objc_msgSend(v7, "separator");
  else
    objc_msgSend(a1, "_navigation_commaListDelimiter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v52;
  objc_msgSend(v9, "componentsJoinedByString:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0CB3940];
  _MNLocalizedStringFromThisBundle(CFSTR("FormattedString_Countdownlist_Min_Format"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", v44, v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v51, "token");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TempTokenTimestampValue stringByReplacingOccurrencesOfString:withString:](v35, "stringByReplacingOccurrencesOfString:withString:", v38, v40);
    v45 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v45;
    goto LABEL_42;
  }
LABEL_43:

  return v40;
}

+ (id)_navigation_commaListDelimiter
{
  return _MNLocalizedStringFromThisBundle(CFSTR(", "));
}

+ (id)_navigation_formattedStringForPriceValue:()FormatExtras currencyCode:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:
{
  return objc_msgSend(a1, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", a3, a4, 1);
}

+ (id)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:showsCurrencySymbol:
{
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v17;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("CNY"));
  v10 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v11);

  objc_msgSend(v10, "setNumberStyle:", 2);
  if (!v9)
  {
    objc_msgSend(v10, "setCurrencyCode:", v7);
    if (a5)
      v15 = 0;
    else
      v15 = &stru_1E61D9090;
    objc_msgSend(v10, "setCurrencySymbol:", v15);
    objc_msgSend(v10, "stringFromNumber:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v10, "setMinimumFractionDigits:", 0);
  objc_msgSend(v10, "setCurrencyCode:", CFSTR("CNY"));
  if (a5)
    v12 = 0;
  else
    v12 = &stru_1E61D9090;
  objc_msgSend(v10, "setCurrencySymbol:", v12);
  objc_msgSend(v10, "stringFromNumber:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([￥¥])(\\s*)"), 0, &v17);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), CFSTR("⁠¥"));
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
LABEL_12:

  }
  return v13;
}

- (__CFString)_navigation_stringByMakingPhonetic
{
  __CFString *v2;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("\x1B\\toi=lhp\\"), a1, CFSTR("\x1B\\toi=orth\\"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E61D9090;
  }
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsAddress
{
  __CFString *v2;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("\x1B\\tn=address\\"), a1, CFSTR("\x1B\\tn=nav\\"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E61D9090;
  }
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsNavigationText
{
  __CFString *v2;
  int v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  const __CFString *v12;

  v2 = &stru_1E61D9090;
  if (objc_msgSend(a1, "length"))
  {
    v3 = objc_msgSend(a1, "_navigation_isPrivate");
    v4 = a1;
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("[private] "), "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v6 = objc_msgSend(v5, "length");
    v7 = objc_msgSend(CFSTR("\x1B\\tn=nav\\"), "length");
    if (v6 >= objc_msgSend(CFSTR("\x1B\\tn=normal\\"), "length") + v7)
    {
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(CFSTR("\x1B\\tn=nav\\"), "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("\x1B\\tn=nav\\")) & 1) != 0)
      {
        objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - objc_msgSend(CFSTR("\x1B\\tn=normal\\"), "length"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("\x1B\\tn=normal\\"));

        if (v10)
        {
          v11 = (__CFString *)v4;
LABEL_12:
          v2 = v11;

          return v2;
        }
      }
      else
      {

      }
    }
    v12 = CFSTR("[private] ");
    if (!v3)
      v12 = &stru_1E61D9090;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v12, CFSTR("\x1B\\tn=nav\\"), v5, CFSTR("\x1B\\tn=normal\\"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsNormalText
{
  __CFString *v2;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("\x1B\\tn=normal\\"), a1, CFSTR("\x1B\\tn=nav\\"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E61D9090;
  }
  return v2;
}

- (uint64_t)_navigation_isCJK
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    if (qword_1ED0C3EA8 != -1)
      dispatch_once(&qword_1ED0C3EA8, &__block_literal_global_628);
    return objc_msgSend(a1, "rangeOfCharacterFromSet:", qword_1ED0C3EA0) != 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (id)_navigation_languageDirectionStringWithFormat:()FormatExtras
{
  objc_class *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  CFRange v16;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);
  v16.length = -[__CFString length](v10, "length");
  v16.location = 0;
  v12 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v10, v16);

  if (objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v12) == 2)
    v13 = CFSTR("\u200F");
  else
    v13 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_navigation_stripTagsFromSpokenString
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR(".\\\\\\w+=[^\\\\]+\\\\"), 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1E61D9090);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_navigation_stringByMarkingAsPrivateText
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("[private] "), a1);
}

- (id)_navigation_stringByStrippingPrivateTag
{
  id v2;

  if (objc_msgSend(a1, "_navigation_isPrivate"))
  {
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("[private] "), &stru_1E61D9090);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (uint64_t)_navigation_isPrivate
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("[private] "));
}

- (id)_navigation_stripVariablesFromString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\{\\w+\\}"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1E61D9090);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_navigation_logMismatchBetweenServerInstruction:()FormatExtras clientInstruction:
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  MNGetMNStringExtrasLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138478083;
    v9 = v5;
    v10 = 2113;
    v11 = v6;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Routing service string doesn't match client's expectation:\n  server instruction: '%{private}@'\n  client instruction: '%{private}@'", (uint8_t *)&v8, 0x16u);
  }

}

- (BOOL)_navigation_containsVariables
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\{\\w+\\}"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;

  return v3;
}

+ (uint64_t)_navigation_logIfContainsVariables:()FormatExtras
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138543362;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "_navigation_containsVariables", v13))
        {
          MNGetMNStringExtrasLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Instruction contains variables: '%{public}@'", buf, 0xCu);
          }

          v7 = 1;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

+ (id)_navigation_selectInstructionWithServerString:()FormatExtras isSpoken:clientBlock:
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_navigation_logIfContainsVariables:", v5);

  return v3;
}

+ (id)_navigation_selectInstructionWithServerStringArray:()FormatExtras isSpoken:clientBlock:
{
  id v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_logIfContainsVariables:", v3);
  return v3;
}

- (uint64_t)_navigation_distanceLevenshtein:()FormatExtras
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t i;
  _QWORD *v14;
  unint64_t j;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t *v24;
  char *v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(v4, "length");
  v24 = &v23;
  v23 = v6 + 1;
  v7 = (char *)&v23 - ((8 * (v6 + 1 + (v6 + 1) * v5) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v9 = v6;
  v25 = v7;
  do
  {
    v10 = 0;
    v11 = (unint64_t *)v7;
    do
    {
      if (v8)
        v12 = 0;
      else
        v12 = v10;
      if (!v10)
        v12 = v8;
      *v11 = v12;
      ++v10;
      v11 += v6 + 1;
    }
    while (v10 <= v5);
    ++v8;
    v7 += 8;
  }
  while (v8 <= v6);
  if (v6)
  {
    v26 = v6;
    v27 = v25 + 8;
    for (i = 1; i <= v26; ++i)
    {
      if (v5)
      {
        v14 = v27;
        for (j = 1; j <= v5; ++j)
        {
          v16 = objc_msgSend(a1, "characterAtIndex:", j - 1, v23, v24);
          v17 = objc_msgSend(v4, "characterAtIndex:", i - 1);
          v18 = *(v14 - 1);
          if (v16 != v17)
            ++v18;
          v19 = *v14 + 1;
          v20 = v14[v9];
          if (v19 >= v20 + 1)
            v19 = v20 + 1;
          if (v18 >= v19)
            v18 = v19;
          v14[v9 + 1] = v18;
          v14 = (_QWORD *)((char *)v14 + v9 * 8 + 8);
        }
      }
      v6 = v26;
      ++v27;
    }
  }
  v21 = *(_QWORD *)&v25[8 * v23 * v5 + 8 * v6];

  return v21;
}

+ (uint64_t)_navigation_abbreviatedFromatterUnitsStyleForLocale:()FormatExtras
{
  void *v3;
  int v4;

  objc_msgSend(a3, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ja"));

  if (v4)
    return 5;
  else
    return 1;
}

+ (id)_navigation_stringForPower:()FormatExtras unit:
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = qword_1ED0C3EB8;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&qword_1ED0C3EB8, &__block_literal_global_640);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", v6, a1);

  objc_msgSend((id)qword_1ED0C3EB0, "stringFromMeasurement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
