@implementation HFCameraUtilities

+ (BOOL)forceDisplayOfDismissedCameraUpgradeBanner
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("HFForceDisplayOfDismissedCameraUpgradeBanner"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (BOOL)eventSpansMultipleDays:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "hf_sharedCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsInTimeZone:fromDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsInTimeZone:fromDate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (objc_msgSend(v8, "isValidDate"))
  {
    if (objc_msgSend(v11, "isValidDate"))
    {
      v12 = objc_msgSend(v8, "day");
      if (v12 != objc_msgSend(v11, "day"))
        v13 = 1;
    }
  }

  return v13;
}

+ (id)percentageOfDurationUntilNextDayForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(a1, "eventSpansMultipleDays:", v4))
  {
    objc_msgSend(v4, "dateOfOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_startOfNextDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateOfOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "hf_duration");
    v12 = v9 / v11;
    *(float *)&v12 = v12;
    objc_msgSend(v10, "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (double)elapsedTimeSinceMidnightForEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "hf_sharedCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextDateAfterDate:matchingHour:minute:second:options:", v6, 0, 0, 0, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  return v10;
}

+ (BOOL)shouldPurgePosterFrameCache
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFPurgePosterFrameCacheOnLoadKey"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)shouldPurgeVideoFileCache
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFPurgeVideoFileCacheOnLoadKey"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)shouldDisableHeroFrameDownloads
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFDisableHeroFrameDownloadsKey"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)shouldDisplayInternalViews
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFEnableCameraInternalViewsKey"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)shouldCacheScrubberTimeScale
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFShouldCacheScrubberTimeScaleKey"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (void)cacheScrubberTimeScale:(double)a3
{
  double v4;
  id v5;

  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v4 = a3;
    objc_msgSend(v5, "setFloat:forKey:", CFSTR("HFCachedScrubberTimeScaleKey"), v4);

  }
}

+ (double)cachedScrubberTimeScale
{
  double v2;
  void *v3;
  void *v4;
  float v5;

  v2 = 0.0;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("HFCachedScrubberTimeScaleKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v2 = v5;

  }
  return v2;
}

+ (BOOL)treatAllClipsAsUnanalyzed
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFTreatAllClipsAsUnanalyzed"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)markCachedVideoAsGreenInTimeline
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFMarkCachedVideoAsGreenInTimeline"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (BOOL)disableFullQualityVideoCaching
{
  _BOOL4 v2;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("HFDisableFullQualityVideoCaching"), CFSTR("com.apple.Home"), 0) != 0;
  return v2;
}

+ (id)overrideVideoDiskCacheLimit
{
  void *v2;
  void *v3;

  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("HFPreferencesOverrideVideoDiskCacheLimit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)overrideVideoCacheDurationLimit
{
  void *v2;
  void *v3;

  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("HFPreferencesOverrideVideoCacheDurationLimit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)forceDisplaySingleCameraUpgradeBanner
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("HFForceDisplaySingleCameraUpgradeBanner"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (BOOL)forceDisplayMultiCameraUpgradeBanner
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("HFForceDisplayMultiCameraUpgradeBanner"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (id)twentyFourHourTimeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379C48;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379C48, &__block_literal_global_203);
  objc_msgSend((id)_MergedGlobals_309, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__HFCameraUtilities_twentyFourHourTimeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_309;
  _MergedGlobals_309 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_309, "setDateFormat:", CFSTR("HH:mm:ss"));
}

+ (id)twelveHourTimeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379C58;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379C58, &__block_literal_global_24_9);
  objc_msgSend((id)qword_1ED379C50, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__HFCameraUtilities_twelveHourTimeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED379C50;
  qword_1ED379C50 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED379C50, "setTimeStyle:", 2);
}

+ (id)dayStringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (qword_1ED379C68 != -1)
    dispatch_once(&qword_1ED379C68, &__block_literal_global_25_4);
  if (objc_msgSend(a1, "isDateToday:", v4))
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraToday"), CFSTR("HFCameraToday"), 1);
  else
    objc_msgSend((id)qword_1ED379C60, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capitalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __39__HFCameraUtilities_dayStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED379C60;
  qword_1ED379C60 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED379C60, "setDateFormat:", CFSTR("EEEE"));
}

+ (BOOL)isDateToday:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "hf_sharedCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDate:inSameDayAsDate:", v4, v6);

  return v7;
}

+ (BOOL)isDateYesterday:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "hf_sharedCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInYesterday:", v4);

  return v6;
}

+ (id)liveStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379C78;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379C78, &__block_literal_global_30_5);
  objc_msgSend((id)qword_1ED379C70, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __40__HFCameraUtilities_liveStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED379C70;
  qword_1ED379C70 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED379C70, "setTimeStyle:", 1);
}

+ (id)twentyFourHourLiveStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379C88;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379C88, &__block_literal_global_31_8);
  objc_msgSend((id)qword_1ED379C80, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__HFCameraUtilities_twentyFourHourLiveStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED379C80;
  qword_1ED379C80 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED379C80, "setDateFormat:", CFSTR("HH:mm"));
}

+ (id)attributedStringFromTwentyFourHourDateString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (attributedStringFromTwentyFourHourDateString__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&attributedStringFromTwentyFourHourDateString__onceToken, &__block_literal_global_34_8);
    if (v4)
      goto LABEL_3;
  }
  HFLogForCategory(0xEuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = 0;
    _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Unable to parse proper twenty-four hour components from string:%@.", buf, 0xCu);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

void __66__HFCameraUtilities_attributedStringFromTwentyFourHourDateString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attributedStringFromTwentyFourHourDateString__font;
  attributedStringFromTwentyFourHourDateString__font = v0;

}

+ (id)attributedStringFromDateString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ED379CA0 != -1)
    dispatch_once(&qword_1ED379CA0, &__block_literal_global_40_9);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithString:", v9);

    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "rangeOfString:", v12);
    v15 = v14;

    v16 = *MEMORY[0x1E0CEA098];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0CEA098], qword_1ED379C90, 0, v13);
    objc_msgSend(v10, "addAttribute:value:range:", v16, qword_1ED379C98, v13, v15);
  }
  else
  {
    HFLogForCategory(0xEuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "Unable to parse proper twelve hour components from string:%@. Displaying full string without small caps.", buf, 0xCu);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
    v18 = *MEMORY[0x1E0CEA098];
    v19 = qword_1ED379C90;
    objc_msgSend(v10, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "rangeOfString:", v3);
    objc_msgSend(v10, "addAttribute:value:range:", v18, v19, v21, v22);

  }
  return v10;
}

void __52__HFCameraUtilities_attributedStringFromDateString___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379C90;
  qword_1ED379C90 = v0;

  v13 = *MEMORY[0x1E0CEB4D0];
  v2 = *MEMORY[0x1E0CEB518];
  v10[0] = *MEMORY[0x1E0CEB520];
  v10[1] = v2;
  v11[0] = &unk_1EA7CD210;
  v11[1] = &unk_1EA7CD228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ED379C90, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 18.0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED379C98;
  qword_1ED379C98 = v8;

}

+ (BOOL)_shouldUseTwentyFourHourTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsString:", CFSTR("a")) ^ 1;
  return (char)v3;
}

+ (id)_fullTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "twentyFourHourTimeStringFromDate:", a3);
  else
    objc_msgSend(a1, "twelveHourTimeStringFromDate:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fullTimeStringFromDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_fullTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, objc_msgSend(a1, "_shouldUseTwentyFourHourTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)attributedFullTimeStringFromDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "_shouldUseTwentyFourHourTime");
  objc_msgSend(a1, "_fullTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v5)
    objc_msgSend(a1, "attributedStringFromTwentyFourHourDateString:", v6);
  else
    objc_msgSend(a1, "attributedStringFromDateString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_shortTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "twentyFourHourLiveStringFromDate:", a3);
  else
    objc_msgSend(a1, "liveStringFromDate:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shortTimeStringFromDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_shortTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, objc_msgSend(a1, "_shouldUseTwentyFourHourTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)attributedShortTimeStringFromDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "_shouldUseTwentyFourHourTime");
  objc_msgSend(a1, "_shortTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v5)
    objc_msgSend(a1, "attributedStringFromTwentyFourHourDateString:", v6);
  else
    objc_msgSend(a1, "attributedStringFromDateString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localizerKeyDayNameFromDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (qword_1ED379CB0 != -1)
  {
    dispatch_once(&qword_1ED379CB0, &__block_literal_global_54_4);
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFCameraUtilities.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 512, v6);

  objc_msgSend((id)qword_1ED379CA8, "objectAtIndexedSubscript:", v8 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __49__HFCameraUtilities_localizerKeyDayNameFromDate___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED379CA8;
  qword_1ED379CA8 = (uint64_t)&unk_1EA7CDEA0;

}

+ (BOOL)shouldDisplayInternalUpgradeViews
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;

  v2 = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("HFShouldDisplayInternalUpgradeViews"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (void)toggleDisplayOfInternalUpgradeViews:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HFShouldDisplayInternalUpgradeViews"));

  }
}

+ (BOOL)internalCameraFeedbackSupported
{
  return !+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled")
      && +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
}

+ (BOOL)hasAcceptedCameraFeedbackEmployeeConsent
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HFEmployeeAcceptedCameraFeedbackConsent_2020"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)acceptEmployeeCameraFeedbackConsent
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if ((objc_msgSend(a1, "hasAcceptedCameraFeedbackEmployeeConsent") & 1) == 0)
  {
    HFLogForCategory(0x14uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "User has accepted the employee consent.", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("HFEmployeeAcceptedCameraFeedbackConsent_2020"));

  }
}

+ (id)cameraFeedbackQueryString
{
  return CFSTR("&feedback=1");
}

+ (double)durationOfRecordingAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  double Seconds;
  void *v8;
  void *v9;
  CMTime time;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  Seconds = 0.0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  return Seconds;
}

+ (id)videoCachesDirectoryURL
{
  void *v2;
  void *v3;

  +[HFUtilities cachesDirectoryURL](HFUtilities, "cachesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Video"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)videoDestinationURLForCameraClip:(id)a3
{
  return (id)objc_msgSend(a1, "videoDestinationURLForCameraClip:strippedAudio:", a3, 0);
}

+ (id)videoDestinationURLForCameraClip:(id)a3 strippedAudio:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "quality");
  if (v9 == 1)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-timelapse"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  if (v4)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-noaac"));
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("mp4"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "videoCachesDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLWithString:relativeToURL:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)isTimelapseVideoFileAtURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("-timelapse"));

  return v5;
}

+ (BOOL)isVideoFileWithStrippedAudioAtURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("-noaac"));

  return v5;
}

+ (int64_t)compareCreationDateOfFileAtURL:(id)a3 toDaysFromNow:(int64_t)a4
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0;
  v6 = *MEMORY[0x1E0C998E8];
  v16 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v17, v6, &v16);
  v8 = v17;
  v9 = v16;
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_dateByAddingDays:toDate:", a4, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v8, "compare:", v12);
  }
  else
  {
    HFLogForCategory(0x15uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v19 = "+[HFCameraUtilities compareCreationDateOfFileAtURL:toDaysFromNow:]";
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v15;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "%s: %@; %@", buf, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isMP4FileAtURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("mp4")) == 0;

  return v4;
}

+ (id)cameraRecordingEventDateOfOccurenceComparator
{
  return &__block_literal_global_84_2;
}

uint64_t __66__HFCameraUtilities_cameraRecordingEventDateOfOccurenceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
