@implementation CUIKDateStrings

+ (id)longStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForDateStyle:timeStyle:calendar:", 3, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cachedDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%lu"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CUIKDateStrings_cachedDateFormatterForDateStyle_timeStyle_calendar___block_invoke;
  v13[3] = &unk_1E6EB7828;
  v16 = a3;
  v17 = a4;
  v14 = v8;
  v15 = a1;
  v10 = v8;
  objc_msgSend(a1, "_cachedDateFormatterForDomain:calendar:formatterKey:creationBlock:", CFSTR("com.apple.calendarUIKit.dateStrings.formattersByStyles"), v10, v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cachedDateFormatterForDomain:(id)a3 calendar:(id)a4 formatterKey:(id)a5 creationBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "threadDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v9);
  }
  objc_msgSend(v10, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v10, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, v18);

  }
  objc_msgSend(v17, "objectForKey:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v17, "setObject:forKey:", v19, v10);
  }
  objc_msgSend(v19, "objectForKey:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v12[2](v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v11);
  }

  return v20;
}

id __70__CUIKDateStrings_cachedDateFormatterForDateStyle_timeStyle_calendar___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 40), "_newDateFormatterForDateStyle:timeStyle:calendar:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

+ (id)_newDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(v8, "setCalendar:", v7);
  objc_msgSend(v8, "setDateStyle:", a3);
  objc_msgSend(v8, "setTimeStyle:", a4);
  objc_msgSend(v7, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTimeZone:", v10);
  return v8;
}

+ (id)_newDateFormatterForFormat:(id)a3 calendar:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "_newDateFormatterForDateStyle:timeStyle:calendar:", 4, 4, a4);
  objc_msgSend(v7, "setDateFormat:", v6);

  return v7;
}

+ (id)_newDateFormatterForTemplate:(id)a3 calendar:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3578];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(a1, "_newDateFormatterForFormat:calendar:", v10, v7);
  return v11;
}

+ (id)cachedDateFormatterForFormat:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__CUIKDateStrings_cachedDateFormatterForFormat_calendar___block_invoke;
  v12[3] = &unk_1E6EB7800;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_cachedDateFormatterForDomain:calendar:formatterKey:creationBlock:", CFSTR("com.apple.calendarUIKit.dateStrings.formattersByFormat"), v8, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__CUIKDateStrings_cachedDateFormatterForFormat_calendar___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 48), "_newDateFormatterForFormat:calendar:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)cachedDateFormatterForTemplate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__CUIKDateStrings_cachedDateFormatterForTemplate_calendar___block_invoke;
  v12[3] = &unk_1E6EB7800;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_cachedDateFormatterForDomain:calendar:formatterKey:creationBlock:", CFSTR("com.apple.calendarUIKit.dateStrings.formattersByTemplate"), v8, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __59__CUIKDateStrings_cachedDateFormatterForTemplate_calendar___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 48), "_newDateFormatterForTemplate:calendar:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)yearStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForTemplate:calendar:", CFSTR("y"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)yearMonthStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForTemplate:calendar:", CFSTR("yMMMM"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)yearMonthDayStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForTemplate:calendar:", CFSTR("UMMMd"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)monthStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForTemplate:calendar:", CFSTR("MMM"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)monthDayStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForTemplate:calendar:", CFSTR("MMMd"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mediumStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "cachedDateFormatterForDateStyle:timeStyle:calendar:", 2, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)overlayCalendarTypeForCalendarIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996A0]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996D0]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996F0]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C99700]) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    +[CUIKLogSubsystem dateStrings](CUIKLogSubsystem, "dateStrings");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CUIKDateStrings overlayCalendarTypeForCalendarIdentifier:].cold.1((uint64_t)v3, v5, v6);

    v4 = 0;
  }

  return v4;
}

+ (id)_significantLocaleComponents:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *MEMORY[0x1E0C99820];
  v19[0] = *MEMORY[0x1E0C997E8];
  v19[1] = v5;
  v6 = *MEMORY[0x1E0C99848];
  v19[2] = *MEMORY[0x1E0C997B0];
  v19[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v4, "setObject:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  return v4;
}

+ (id)_languageIDfromLocalID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "_significantLocaleComponents:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("zh"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "addLikelySubtagsForLocaleIdentifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)overlayLocalizedStringForKey:(id)a3 calendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_languageIDfromLocalID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredLocalizations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34D0];
  v22[0] = v9;
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLocalizationsFromArray:forPreferences:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:localization:", v6, 0, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (BOOL)supportsOverlayCalendarWithIdentifier:(id)a3
{
  return objc_msgSend(a1, "overlayCalendarTypeForCalendarIdentifier:", a3) != 0;
}

+ (id)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "overlayCalendarTypeForCalendarIdentifier:", v5) - 1;
  if (v6 > 3)
  {
LABEL_15:
    v7 = CFSTR("First day of lunar month");
    goto LABEL_16;
  }
  objc_msgSend(a1, "overlayLocalizedStringForKey:calendar:", off_1E6EB7898[v6], v4);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[CUIKLogSubsystem dateStrings](CUIKLogSubsystem, "dateStrings");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:].cold.2((uint64_t)v5, v4);

    switch(v6)
    {
      case 0uLL:
        CUIKBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("First Day of Chinese Month");
        goto LABEL_8;
      case 1uLL:
        CUIKBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("First Day of Hebrew Month");
LABEL_8:
        v12 = &stru_1E6EBAE30;
        goto LABEL_11;
      case 2uLL:
        CUIKBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("First Day of Hijri-IslamicCivil Month");
        v12 = CFSTR("First Day of Hijri Month");
        goto LABEL_11;
      case 3uLL:
        CUIKBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("First Day of Hijri-IslamicUmmAlQura Month");
        v12 = CFSTR("First Day of Hijri Month (Umm al-Qura)");
LABEL_11:
        objc_msgSend(v9, "localizedStringForKey:value:table:", v11, v12, 0);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          goto LABEL_12;
        goto LABEL_16;
      default:
LABEL_12:
        +[CUIKLogSubsystem dateStrings](CUIKLogSubsystem, "dateStrings");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:].cold.1();

        break;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

+ (id)overlayCalendarPickerDisplayNameForCalendarWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  v4 = a3;
  switch(objc_msgSend(a1, "overlayCalendarTypeForCalendarIdentifier:", v4))
  {
    case 0:
      v5 = v4;
      break;
    case 1:
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Chinese");
      goto LABEL_6;
    case 2:
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Hebrew");
LABEL_6:
      v9 = &stru_1E6EBAE30;
      goto LABEL_9;
    case 3:
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Hijri-IslamicCivil");
      v9 = CFSTR("Hijri");
      goto LABEL_9;
    case 4:
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Hijri-IslamicUmmAlQura");
      v9 = CFSTR("Hijri (Umm al-Qura)");
LABEL_9:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

+ (id)overlayDayNumberStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (overlayDayNumberStringForDate_inCalendar__onceToken != -1)
    dispatch_once(&overlayDayNumberStringForDate_inCalendar__onceToken, &__block_literal_global_31);
  if ((id)overlayDayNumberStringForDate_inCalendar__s_previousCalendar != v7 && (objc_msgSend(v7, "isEqual:") & 1) == 0)
  {
    objc_msgSend((id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings, "removeAllObjects");
    objc_storeStrong((id *)&overlayDayNumberStringForDate_inCalendar__s_previousCalendar, a4);
  }
  v8 = objc_msgSend(v7, "component:fromDate:", 16, v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(a1, "cachedDateFormatterForFormat:calendar:", CFSTR("d"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings, "setObject:forKey:", v10, v9);
  }

  return v10;
}

void __60__CUIKDateStrings_overlayDayNumberStringForDate_inCalendar___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)overlayDayNumberStringForDate_inCalendar__s_cachedStrings;
  overlayDayNumberStringForDate_inCalendar__s_cachedStrings = v0;

}

+ (id)overlayShortStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "component:fromDate:", 16, v7) == 1)
    objc_msgSend(a1, "monthStringForDate:inCalendar:", v7, v6);
  else
    objc_msgSend(a1, "overlayDayNumberStringForDate:inCalendar:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)overlayMediumStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "component:fromDate:", 16, v7) == 1)
    objc_msgSend(a1, "monthDayStringForDate:inCalendar:", v7, v6);
  else
    objc_msgSend(a1, "overlayDayNumberStringForDate:inCalendar:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_zodiacSymbolForDate:(id)a3 inCalendar:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BYTE v10[2];
  int v11;
  _QWORD block[4];
  id v13;

  v5 = a3;
  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke;
  block[3] = &unk_1E6EB60F8;
  v7 = v6;
  v13 = v7;
  if (_zodiacSymbolForDate_inCalendar__onceToken != -1)
    dispatch_once(&_zodiacSymbolForDate_inCalendar__onceToken, block);
  if (_zodiacSymbolForDate_inCalendar__s_formatter)
  {
    objc_msgSend(v7, "component:fromDate:", 4, v5);
    v11 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v10, (int)udat_getSymbols());
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  int v3;

  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "locale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  _zodiacSymbolForDate_inCalendar__s_formatter = udat_open();

}

+ (id)overlayYearStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  if (v9)
  {
    objc_msgSend(a1, "cachedDateFormatterForFormat:calendar:", CFSTR("U"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_zodiacSymbolForDate:inCalendar:", v6, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = (__CFString *)v12;
    else
      v13 = &stru_1E6EBAE30;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@年"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "yearStringForDate:inCalendar:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)stylizedTimelineHourStringForHourDate:(id)a3 baseFontSize:(double)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  void *v87;
  __int128 v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  void *v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  uint64_t *v97;
  uint64_t *v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[5];
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _QWORD v112[2];
  _QWORD v113[2];
  _BYTE v114[128];
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  _QWORD v122[2];
  _QWORD v123[2];
  uint64_t v124;
  uint64_t v125;
  _BYTE v126[128];
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[2];
  _QWORD v130[5];

  v130[2] = *MEMORY[0x1E0C80C00];
  v70 = a3;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D0C2B0], "uses24HourTime"))
  {
    objc_msgSend(v70, "localizedStringWithFormat:timeZone:", *MEMORY[0x1E0D0BF28], v69);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
    v7 = objc_msgSend(v5, "length");
    v129[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", floor(a4));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v130[0] = v8;
    v129[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v130[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAttributes:range:", v10, 0, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0C2B0], "timelineHourDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v11);

    objc_msgSend(v5, "_attributedStringWithFieldsFromDate:", v70);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v106 = 0;
    v107 = &v106;
    v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__13;
    v110 = __Block_byref_object_dispose__13;
    v111 = 0;
    v104[0] = 0;
    v104[1] = v104;
    v104[2] = 0x3032000000;
    v104[3] = __Block_byref_object_copy__13;
    v104[4] = __Block_byref_object_dispose__13;
    v105 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0;
    v101 = &v100;
    v102 = 0x2020000000;
    v103 = -1;
    v15 = objc_msgSend(v13, "length");
    v16 = MEMORY[0x1E0C809B0];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke;
    v94[3] = &unk_1E6EB7850;
    v17 = v13;
    v95 = v17;
    v97 = &v106;
    v98 = &v100;
    v99 = v104;
    v68 = v14;
    v96 = v68;
    objc_msgSend(v17, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0, v94);
    if ((objc_msgSend((id)v107[5], "isEqual:", CFSTR("AM")) & 1) != 0
      || objc_msgSend((id)v107[5], "isEqual:", CFSTR("PM")))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(v18, "setBounds:", 0.0, 0.0, 2.0, 0.0);
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertAttributedString:atIndex:", v19, v101[3]);

    }
    v89 = 0;
    v90 = &v89;
    v91 = 0x3010000000;
    v92 = &unk_1B8BDE616;
    v93 = xmmword_1B8BA48C0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x3010000000;
    v87 = &unk_1B8BDE616;
    v88 = xmmword_1B8BA48C0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "length");
    v79[0] = v16;
    v79[1] = 3221225472;
    v79[2] = __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke_2;
    v79[3] = &unk_1E6EB7878;
    v22 = v17;
    v80 = v22;
    v82 = &v84;
    v83 = &v89;
    v23 = v20;
    v81 = v23;
    objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", 0, v21, 0, v79);
    v66 = v23;
    if (v90[4] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", floor(a4), *MEMORY[0x1E0DC1438]);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0DC1138];
      v67 = (void *)v24;
      v113[0] = v24;
      v26 = *MEMORY[0x1E0DC1140];
      v112[0] = v25;
      v112[1] = v26;
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_timelineHourColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setAttributes:range:", v28, 0, objc_msgSend(v22, "length"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_timelineHourColor");
      v29 = objc_claimAutoreleasedReturnValue();
      v60 = *MEMORY[0x1E0DC1140];
      v127 = *MEMORY[0x1E0DC1140];
      v128 = v29;
      v67 = (void *)v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v90[4];
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v22, "addAttributes:range:", v28, v30, v90[5]);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v31 = v23;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v126, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v76;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v76 != v33)
              objc_enumerationMutation(v31);
            v35 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v34), "rangeValue");
            objc_msgSend(v22, "addAttributes:range:", v28, v35, v36);
            ++v34;
          }
          while (v32 != v34);
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v126, 16);
        }
        while (v32);
      }

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", floor(a4 * 1.36363636));
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "cuik_createFontFromFont:withFontGrade:", v37, 2);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x1E0DC1138];
      v124 = *MEMORY[0x1E0DC1138];
      v59 = (void *)v38;
      v125 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v90[4];
      if (v40 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v22, "addAttributes:range:", v62, v40, v90[5]);
      objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *MEMORY[0x1E0DC13D0];
      v122[0] = *MEMORY[0x1E0DC13D8];
      v122[1] = v41;
      v123[0] = &unk_1E6ED6F00;
      v123[1] = &unk_1E6ED6F18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "fontDescriptor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = *MEMORY[0x1E0DC1380];
      v119 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "fontDescriptorByAddingAttributes:", v44);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v63, floor(a4));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v60;
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_timelineDesignatorColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v85[4];
      if (v47 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v22, "addAttributes:range:", v61, v47, v85[5]);
      v115 = v39;
      v116 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v85[4];
      if (v49 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v22, "addAttributes:range:", v48, v49, v85[5]);
      v50 = (void *)v37;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v51 = v31;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v114, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v72;
        do
        {
          v54 = 0;
          do
          {
            if (*(_QWORD *)v72 != v53)
              objc_enumerationMutation(v51);
            v55 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v54), "rangeValue");
            objc_msgSend(v22, "addAttributes:range:", v48, v55, v56);
            ++v54;
          }
          while (v52 != v54);
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v114, 16);
        }
        while (v52);
      }

    }
    v57 = v81;
    v6 = v22;

    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(&v89, 8);

    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(v104, 8);

    _Block_object_dispose(&v106, 8);
  }

  return v6;
}

void __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  id v14;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0C99728]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "hasPrefix:", CFSTR("a")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    goto LABEL_7;
  }
  objc_msgSend(v14, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("h")))
  {

LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
    goto LABEL_7;
  }
  objc_msgSend(v14, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("k"));

  if (v11)
    goto LABEL_6;
  objc_msgSend(v8, "stringByTrimmingWhitespaceAndRemovingNewlines");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", &stru_1E6EBAE30);

  if ((v13 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
LABEL_7:

}

void __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0C99728]);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "hasPrefix:", CFSTR("a")))
  {
    v9 = *(_QWORD *)(a1 + 48);
LABEL_7:
    v13 = *(_QWORD *)(v9 + 8);
    *(_QWORD *)(v13 + 32) = a3;
    *(_QWORD *)(v13 + 40) = a4;
    goto LABEL_8;
  }
  objc_msgSend(v18, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("h")))
  {

LABEL_6:
    v9 = *(_QWORD *)(a1 + 56);
    goto LABEL_7;
  }
  objc_msgSend(v18, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("k"));

  if (v12)
    goto LABEL_6;
  objc_msgSend(v8, "stringByTrimmingWhitespaceAndRemovingNewlines");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", &stru_1E6EBAE30);

  if ((v15 & 1) == 0)
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
LABEL_8:

}

+ (void)overlayCalendarTypeForCalendarIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1B8A6A000, a2, a3, "Unexpected overlay calendar: '%@'", (uint8_t *)&v3);
}

+ (void)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v2, v3, "Fallback string missing for first-day-of-month string for calendar: '%@', locale: '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

+ (void)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a2, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v4, v5, "Localization missing for first-day-of-month string for calendar: '%@', locale: '%@'", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5();
}

+ (void)_zodiacSymbolForDate:(UErrorCode *)a1 inCalendar:(NSObject *)a2 .cold.1(UErrorCode *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  v4 = 136315138;
  v5 = OUTLINED_FUNCTION_4_2(a1);
  OUTLINED_FUNCTION_0_3(&dword_1B8A6A000, a2, v3, "Error getting zodiac symbol: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4_0();
}

void __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke_cold_1(UErrorCode *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  v4 = 136315138;
  v5 = OUTLINED_FUNCTION_4_2(a1);
  OUTLINED_FUNCTION_0_3(&dword_1B8A6A000, a2, v3, "Error creating zodiac formatter: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4_0();
}

@end
