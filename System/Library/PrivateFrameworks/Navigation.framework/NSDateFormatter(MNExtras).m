@implementation NSDateFormatter(MNExtras)

+ (id)_timestampFormatterForTimeZone:()MNExtras displayTimeZone:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3578];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  if (a4)
    v9 = CFSTR("jmaz");
  else
    v9 = CFSTR("jma");
  objc_msgSend(v7, "setLocalizedDateFormatFromTemplate:", v9);
  objc_msgSend(v7, "setTimeZone:", v6);

  return v7;
}

+ (uint64_t)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:
{
  return objc_msgSend(a1, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", a3, a4, a5, 0, 0);
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v11 = a3;
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v12 && (a6 & 1) == 0)
    v15 = objc_msgSend(v12, "_navigation_isEquivalentToTimeZone:forDate:", v14, v11) ^ 1;
  objc_msgSend(MEMORY[0x1E0CB3578], "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", v11, v12, a5, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:relativeToTimeZone:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v11)
  {
    v14 = v10;
    v15 = v11;
LABEL_9:
    v16 = objc_msgSend(v14, "_navigation_isEquivalentToTimeZone:forDate:", v15, v9) ^ 1;
    goto LABEL_10;
  }
  if (v10 && (v14 = v10, !v11) || (v16 = 0, !v10) && (v14 = v11) != 0)
  {
    v15 = v13;
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3578], "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", v9, v10, a5, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:showTimeZone:useShortFormat:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v12 = a3;
  v13 = a4;
  if (qword_1ED0C3E58 != -1)
    dispatch_once(&qword_1ED0C3E58, &__block_literal_global_6);
  v14 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v13)
    {
LABEL_5:
      v17 = v13;
      goto LABEL_8;
    }
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v18 = (void *)_MergedGlobals_20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v16, v19);

    if (v13)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeZone");
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend(v16, "objectForKey:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = v21;
    if ((_DWORD)a6)
      v23 = CFSTR("jmaz");
    else
      v23 = CFSTR("jma");
    objc_msgSend(v21, "setLocalizedDateFormatFromTemplate:", v23);
  }
  else
  {
    objc_msgSend(a1, "_timestampFormatterForTimeZone:displayTimeZone:", v17, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v22, v17);
  }
  objc_msgSend(v22, "stringFromDate:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "_navigation_isDateInToday:inTimeZone:", v12, v13) & 1) != 0)
  {

LABEL_17:
    v26 = v24;
    goto LABEL_22;
  }
  if (a7)
  {
    objc_msgSend(v25, "_navigation_dateStringForDate:withStyle:useRelativeFormatting:inTimeZone:", v12, 1, 0, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB3940];
    _MNLocalizedStringFromThisBundle(CFSTR("%@ %@"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v29, v24, v27);
  }
  else
  {
    objc_msgSend(v25, "_navigation_dateStringForDate:withStyle:useRelativeFormatting:inTimeZone:", v12, 1, 1, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB3940];
    _MNLocalizedStringFromThisBundle(CFSTR("%@ at %@"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v29, v27, v24);
  }
  v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v26;
}

+ (id)_navigation_debugDescriptionForDate:()MNExtras
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED0C3E68;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED0C3E68, &__block_literal_global_21_0);
  objc_msgSend((id)qword_1ED0C3E60, "stringForObjectValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
