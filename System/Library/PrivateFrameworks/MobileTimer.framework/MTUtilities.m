@implementation MTUtilities

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7 numericOnly:(BOOL)a8
{
  _BOOL4 v8;
  id v11;
  int64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  unint64_t v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  unint64_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  int64_t v37;
  void *v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  int64_t v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  __CFString *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  _BOOL4 v66;
  id v67;

  v8 = a8;
  v65 = a6;
  v66 = a7;
  v67 = a3;
  v11 = a5;
  v12 = a4 / 3600;
  if (!gNumberFormatter)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v14 = (void *)gNumberFormatter;
    gNumberFormatter = (uint64_t)v13;

    objc_msgSend((id)gNumberFormatter, "setNumberStyle:", 1);
    v15 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v16 = (void *)gTodayFormatter;
    gTodayFormatter = (uint64_t)v15;

    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gTodayFormatter, "setTimeZone:", v17);
    objc_msgSend((id)gTodayFormatter, "setDateStyle:", 2);
    objc_msgSend((id)gTodayFormatter, "setTimeStyle:", 0);
    objc_msgSend((id)gTodayFormatter, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend((id)gTodayFormatter, "setFormattingContext:", 4);
    v18 = objc_opt_new();
    v19 = (void *)gDateComponentsFormatter;
    gDateComponentsFormatter = v18;

    objc_msgSend((id)gDateComponentsFormatter, "setUnitsStyle:", 0);
  }
  v20 = a4 % 3600;
  v21 = (void *)gTodayFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a4)
    {
      if (a4 >= 0)
        v33 = a4;
      else
        v33 = -a4;
      if (v33 > 0xE0F)
      {
        if (v33 == 3600)
        {
          v42 = CFSTR("DAY_FORMAT_ONE_HOUR_BEHIND");
          if (a4 <= 0)
          {
            v43 = CFSTR("ONE_HOUR_BEHIND");
          }
          else
          {
            v42 = CFSTR("DAY_FORMAT_ONE_HOUR_AHEAD");
            v43 = CFSTR("ONE_HOUR_AHEAD");
          }
          v27 = v42;
          v28 = v43;
          objc_msgSend((id)gNumberFormatter, "stringFromNumber:", &unk_1E3A05D50);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
        if (v12 < 0)
          v12 = a4 / -3600;
        if (!v20)
        {
          v61 = CFSTR("DAY_FORMAT_HOURS_BEHIND");
          if (a4 <= 0)
          {
            v62 = CFSTR("HOURS_BEHIND");
          }
          else
          {
            v61 = CFSTR("DAY_FORMAT_HOURS_AHEAD");
            v62 = CFSTR("HOURS_AHEAD");
          }
          v27 = v61;
          v28 = v62;
          v63 = (void *)gNumberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringFromNumber:", v64);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_50;
        }
        v49 = CFSTR("DAY_FORMAT_HOURS_MINUTES_BEHIND");
        if (a4 <= 0)
        {
          v50 = CFSTR("HOURS_MINUTES_BEHIND");
        }
        else
        {
          v49 = CFSTR("DAY_FORMAT_HOURS_MINUTES_AHEAD");
          v50 = CFSTR("HOURS_MINUTES_AHEAD");
        }
        v27 = v49;
        v28 = v50;
        v38 = (void *)objc_opt_new();
        objc_msgSend(v38, "setHour:", v12);
        objc_msgSend(v38, "setMinute:", (2185 * (v33 % 0xE10)) >> 17);
        objc_msgSend((id)gDateComponentsFormatter, "stringFromDateComponents:", v38);
        v39 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = CFSTR("DAY_FORMAT_MINUTES_BEHIND");
        if (a4 <= 0)
        {
          v35 = CFSTR("MINUTES_BEHIND");
        }
        else
        {
          v34 = CFSTR("DAY_FORMAT_MINUTES_AHEAD");
          v35 = CFSTR("MINUTES_AHEAD");
        }
        v27 = v34;
        v28 = v35;
        v36 = (void *)gNumberFormatter;
        if (a4 / 60 >= 0)
          v37 = a4 / 60;
        else
          v37 = a4 / -60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringFromNumber:", v38);
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v32 = (void *)v39;

    }
    else
    {
      objc_msgSend((id)gNumberFormatter, "stringFromNumber:", &unk_1E3A05D38);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("DAY_FORMAT_HOURS_AHEAD");
      v28 = CFSTR("HOURS_AHEAD");
    }
LABEL_50:
    if (v11)
    {
      -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", CFSTR("_TZ"));
      v51 = objc_claimAutoreleasedReturnValue();

      v27 = (__CFString *)v51;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", v27, &stru_1E39CF258, CFSTR("Localizable"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      -[__CFString stringByAppendingString:](v28, "stringByAppendingString:", CFSTR("_SPACE"));
      v53 = objc_claimAutoreleasedReturnValue();

      v28 = (__CFString *)v53;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", v28, &stru_1E39CF258, CFSTR("Localizable"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v55, v32);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v48, v23, v56, v11);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    if (v66)
      v59 = v56;
    else
      v59 = (void *)v57;
    v40 = v59;

    v41 = v67;
    goto LABEL_58;
  }
  if (a4)
  {
    if (v20)
    {
      v24 = CFSTR("DAY_FORMAT_HOURS_MINUTES_BEHIND");
      if (a4 <= 0)
      {
        v25 = CFSTR("HOURS_MINUTES_BEHIND");
      }
      else
      {
        v24 = CFSTR("DAY_FORMAT_HOURS_MINUTES_AHEAD");
        v25 = CFSTR("HOURS_MINUTES_AHEAD");
      }
      if (a4 >= 0)
        v26 = a4;
      else
        v26 = -a4;
      v27 = v24;
      v28 = v25;
      v29 = (void *)objc_opt_new();
      v30 = v29;
      if (a4 / 3600 >= 0)
        v31 = a4 / 3600;
      else
        v31 = a4 / -3600;
      objc_msgSend(v29, "setHour:", v31);
      objc_msgSend(v30, "setMinute:", (2185 * (v26 % 0xE10)) >> 17);
      objc_msgSend((id)gDateComponentsFormatter, "stringFromDateComponents:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = CFSTR("HOURS_MINUTES_BEHIND");
      if (a4 > 0)
        v44 = CFSTR("HOURS_MINUTES_AHEAD");
      v28 = v44;
      v45 = (void *)gNumberFormatter;
      if (a4 / 3600 >= 0)
        v46 = a4 / 3600;
      else
        v46 = a4 / -3600;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringFromNumber:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v28;
    }
    v41 = v67;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringForKey:value:table:", v28, &stru_1E39CF258, CFSTR("Localizable"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v48, v32);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_58:

    goto LABEL_59;
  }
  v40 = &stru_1E39CF258;
  v41 = v67;
LABEL_59:

  return v40;
}

+ (id)widgetURL
{
  void *v3;
  NSObject *v4;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("clock-worldclock:default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = a1;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Returning widget URL: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

+ (id)widgetOverrideDate
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (widgetOverrideDate_onceToken != -1)
    dispatch_once(&widgetOverrideDate_onceToken, &__block_literal_global_280);
  if (!widgetOverrideDate_internal)
    return 0;
  v3 = (void *)CFPreferencesCopyValue(CFSTR("ForceClock"), CFSTR("com.apple.mobiletimer"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy:MM:dd:HH:mm"));
    objc_msgSend(v4, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = a1;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: widget override date: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __33__MTUtilities_widgetOverrideDate__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  widgetOverrideDate_internal = result;
  return result;
}

+ (id)mtCityFromWorldClockCity:(id)a3
{
  id v3;
  MTCity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTCity *v9;
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
  void *v21;

  v3 = a3;
  v4 = [MTCity alloc];
  objc_msgSend(v3, "alCityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alCity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayNameIncludingCountry:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTCity initWithIdentifier:displayString:](v4, "initWithIdentifier:displayString:", v6, v8);

  objc_msgSend(v3, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCity setCityName:](v9, "setCityName:", v10);

  objc_msgSend(v3, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCity setTimeZoneName:](v9, "setTimeZoneName:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "alCity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latitude");
  objc_msgSend(v12, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCity setLatitude:](v9, "setLatitude:", v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "alCity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "longitude");
  objc_msgSend(v15, "numberWithFloat:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCity setLongditude:](v9, "setLongditude:", v17);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.mobiletimer-framework"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alCityId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E39CF258, CFSTR("WorldClock"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCity setAbbreviation:](v9, "setAbbreviation:", v21);

  return v9;
}

+ (BOOL)mtSBUIIsSystemApertureEnabled
{
  if (mtSBUIIsSystemApertureEnabled_onceToken != -1)
    dispatch_once(&mtSBUIIsSystemApertureEnabled_onceToken, &__block_literal_global_289);
  return mtSBUIIsSystemApertureEnabled_apertureEnabled;
}

uint64_t __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke()
{
  uint64_t (*v0)(void);
  uint64_t result;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(void))getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  v6 = getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  if (!getSBUIIsSystemApertureEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E39CB690;
    v2[4] = &v3;
    __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke_cold_1();
  result = v0();
  mtSBUIIsSystemApertureEnabled_apertureEnabled = result;
  return result;
}

void __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_SBUIIsSystemApertureEnabled(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTUtilities.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
