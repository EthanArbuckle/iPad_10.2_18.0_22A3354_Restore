@implementation MSSendLaterContext

+ (unint64_t)contextForCurrentDate
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MSSendLaterContext contextForDate:](MSSendLaterContext, "contextForDate:", v2);

  return v3;
}

+ (unint64_t)contextForDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99D48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightInNdays:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", 7, 30, 0, v3, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v7;
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v21))
  {
    if (objc_msgSend(v3, "ef_isEarlierThanDate:", v7))
      v8 = 35;
    else
      v8 = 33;
  }
  else
  {
    v8 = 33;
  }
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", 5, 0, 0, v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", 20, 30, 0, v3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v9)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v10))
  {
    v8 |= 4uLL;
  }
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", 12, 0, 0, v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightInNdays:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v11)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v12))
  {
    v8 |= 8uLL;
  }
  objc_msgSend(v5, "components:fromDate:", 512, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "weekday");

  if (v14 == 1)
    v15 = -1;
  else
    v15 = 6;
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_thisWeekday:hour:minute:second:", v15, 17, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == 1)
    v17 = 1;
  else
    v17 = 8;
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_thisWeekday:hour:minute:second:", v17, 12, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v16)
    && objc_msgSend(v3, "ef_isEarlierThanDate:", v18))
  {
    v8 |= 0x10uLL;
  }

  return v8;
}

+ (BOOL)shouldShowSendLaterDisclaimerAlertForContext:(unint64_t)a3
{
  void *v4;
  char v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D1E088]);

  v6 = v5 ^ 1;
  if (a3 == 1)
    v6 = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFDFLL) != 0)
    return v6;
  else
    return 0;
}

+ (id)titleAndDateForSendLaterContext:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  switch(a3)
  {
    case 1uLL:
      goto LABEL_4;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "ef_morning");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D1EF38];
      objc_msgSend(a1, "_configuredTitleForFormat:date:", CFSTR("Send at %@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pairWithFirst:second:", v8, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return v3;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "ef_tonight");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D1EF38];
      objc_msgSend(a1, "_configuredTitleForFormat:date:", CFSTR("Send %@ Tonight"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pairWithFirst:second:", v8, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "ef_tomorrowMorning");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D1EF38];
      objc_msgSend(a1, "_configuredTitleForFormat:date:", CFSTR("Send %@ Tomorrow"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pairWithFirst:second:", v8, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      if (a3 == 16)
      {
        +[MSSendLaterContext _nextMondayMorning](MSSendLaterContext, "_nextMondayMorning");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D1EF38];
        objc_msgSend(a1, "_configuredTitleForFormat:date:", CFSTR("Send %@ Monday"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pairWithFirst:second:", v8, v6);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v3 = (void *)v9;

      }
      else
      {
        if (a3 != 32)
          return v3;
LABEL_4:
        v5 = (void *)MEMORY[0x1E0D1EF38];
        _EFLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pairWithFirst:second:", v6, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v3;
  }
}

+ (id)_nextMondayMorning
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 512, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "weekday");

  if (v7 == 1)
    v8 = 2;
  else
    v8 = 9;
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_thisWeekday:hour:minute:second:", v8, 8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_configuredTitleForFormat:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatterForStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "formattingContext");
  objc_msgSend(v7, "setFormattingContext:", 5);
  objc_msgSend(v7, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "component:fromDate:", 32, v6);
  v12 = (void *)MEMORY[0x1E0CB3940];
  _EFLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, v11, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFormattingContext:", v8);
  return v14;
}

@end
