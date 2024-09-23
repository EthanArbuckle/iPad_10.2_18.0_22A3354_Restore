@implementation CalChronometry

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "_configureChronometry");
}

+ (void)_configureChronometry
{
  void *v3;
  void *v4;
  id v5;

  if ((_configureChronometry___DidInitialize & 1) == 0)
  {
    _configureChronometry___DidInitialize = 1;
    objc_msgSend(a1, "_updateActiveCalendar");
    +[CalDateLocalization initializeFormatters](CalDateLocalization, "initializeFormatters");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__currentLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__currentTimeZoneDidChange_, *MEMORY[0x1E0C998A0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", a1, sel__resetTodayRolloverTimer, *MEMORY[0x1E0C99898], 0);

  }
}

+ (void)_currentLocaleDidChange:(id)a3
{
  objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__updateForLocaleChange, 0);
  objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel__updateForLocaleChange, 0, 0.5);
}

+ (void)_updateForLocaleChange
{
  id v2;

  objc_msgSend(a1, "_updateEveything");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.calendar.LocaleChanged"), 0);

}

+ (void)_currentTimeZoneDidChange:(id)a3
{
  objc_msgSend(a1, "_updateActiveTimeZone", a3);
  objc_msgSend(a1, "_resetTodayRolloverTimer");
}

+ (void)_updateEveything
{
  objc_msgSend(a1, "_updateActiveCalendar");
  +[CalDateLocalization rebuildFormatters](CalDateLocalization, "rebuildFormatters");
  +[CalDateLocalization rebuildWeekendDays](CalDateLocalization, "rebuildWeekendDays");
}

+ (id)activeTimeZone
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
}

+ (void)setActiveTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "activeTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "setDefaultTimeZone:", v6);
      objc_msgSend(a1, "_updateActiveTimeZone");
      objc_msgSend(a1, "_resetTodayRolloverTimer");
    }
  }

}

+ (void)_updateActiveTimeZone
{
  id v2;

  objc_msgSend(a1, "_updateActiveCalendar");
  +[CalDateLocalization rebuildFormatters](CalDateLocalization, "rebuildFormatters");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.calendar.TimeZoneChanged"), 0);

}

+ (void)_updateActiveCalendar
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!obj)
    abort();
  v3 = a1;
  objc_sync_enter(v3);
  if ((id)__ActiveCalendar != obj)
  {
    objc_storeStrong((id *)&__ActiveCalendar, obj);
    v4 = (void *)__ActiveCalendar;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    v6 = (void *)__ActiveCalendar;
    objc_msgSend(v3, "activeTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

  }
  objc_sync_exit(v3);

}

+ (id)activeCalendar
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)__ActiveCalendar;
  objc_sync_exit(v2);

  return v3;
}

+ (id)currentLocationCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)currentLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (void)_resetTodayRolloverTimer
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend((id)_todayRolloverTimer, "invalidate");
  v3 = (void *)_todayRolloverTimer;
  _todayRolloverTimer = 0;

  objc_msgSend(a1, "activeTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEquivalentTo:", v5);

  if ((v6 & 1) == 0)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v16, "setDay:", 1);
    objc_msgSend(a1, "activeCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v16, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "components:fromDate:", 30, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E88];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    objc_msgSend(v12, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__todayRolloverTimerFired, 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)_todayRolloverTimer;
    _todayRolloverTimer = v14;

  }
}

+ (void)_todayRolloverTimerFired
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CalChronometryTodayChangedNotification"), 0);

  objc_msgSend(a1, "_resetTodayRolloverTimer");
}

@end
