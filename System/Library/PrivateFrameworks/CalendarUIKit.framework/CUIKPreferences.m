@implementation CUIKPreferences

- (NSNumber)lastSidebarMode
{
  void *v2;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastSidebarMode"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v2;
}

- (NSString)overlayCalendarID
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overlayCalendarID"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (objc_msgSend(MEMORY[0x1E0D3EFB0], "isLunarCalendarDefaultOn"))
    {
      v3 = (void *)MEMORY[0x1E0D3EFB0];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "preferredLunarCalendarForLocaleID:", v5);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = &stru_1E6EBAE30;
    }
  }
  return (NSString *)v2;
}

- (BOOL)overrideLocaleWeekends
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("overrideLocaleWeekends"), 0);
}

- (BOOL)enableMultiwindowAsserts
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("EnableMultiwindowAsserts"), 0);
}

- (NSNumber)lastViewMode
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastViewType"), objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E6ED6FA8;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  return (NSNumber *)v5;
}

- (NSNumber)weekStart
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", *MEMORY[0x1E0D0BF20], objc_opt_class());
}

- (BOOL)showListView
{
  int v3;

  v3 = CUIKShouldSaveStateInPreferences();
  if (v3)
    LOBYTE(v3) = -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowListView"), 0);
  return v3;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_36);
  return (id)sharedPreferences_sharedPreferences;
}

- (BOOL)showMonthDividedListView
{
  int v3;

  v3 = CUIKShouldSaveStateInPreferences();
  if (v3)
    LOBYTE(v3) = -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowMonthDividedListView"), 0);
  return v3;
}

- (BOOL)showWeekNumbers
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowWeekNumbers"), 0);
}

- (BOOL)isShortResumeToTodayTimeout
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShortResumeToTodayTimeout"), 0);
}

void __36__CUIKPreferences_sharedPreferences__block_invoke()
{
  CUIKPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CUIKPreferences);
  v1 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v0;

}

- (CUIKPreferences)init
{
  CUIKPreferences *v2;
  id v3;
  uint64_t v4;
  CalPreferences *preferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIKPreferences;
  v2 = -[CUIKPreferences init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.requestSyncOnApplicationLaunch"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.showweeknumbers"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.weekViewStartsOnToday"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.showlistview"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.viewedTimeZoneAutomatic"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.drawDebugViewColors"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.immediateAlarmCreation"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.eventsInMonthView"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.weekStart"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.overlayCalendarID"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.LocationSearchResultLimit"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.PromptForCommentWhenDeclining"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.ShowExperimentalUI"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.DisableContinuity"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.swipeToDeleteEnabled"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.largeListViewDisclosingEventDetails"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.showWindowDebugButton"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.shortResumeToTodayTimeout"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.HighColorCarplayChanged"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.OverrideLocaleWeekends"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.AllowSubscribedCalendarSpamDetection"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.monthWeekScale"));
  }
  return v2;
}

- (BOOL)requestSyncOnApplicationLaunch
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("RequestSyncOnApplicationLaunch"), 1);
}

- (BOOL)disableContinuity
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("DisableContinuity"), 0);
}

- (void)setLastViewMode:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastViewType"), a3, 0);
}

- (NSString)lastViewedOccurrenceUID
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastViewedOccurrenceUID"), objc_opt_class());
}

- (NSDate)lastViewedOccurrenceDate
{
  return (NSDate *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastViewedOccurrenceDate"), objc_opt_class());
}

- (NSNumber)lastSuspendTime
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastSuspendTime"), objc_opt_class());
}

- (NSNumber)dayViewHourScale
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DayViewHourScale"), objc_opt_class());
}

- (NSNumber)dayViewFirstVisibleSecond
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DayViewFirstVisibleSecond"), objc_opt_class());
}

- (NSDate)simulatedCurrentDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("SimulatedCurrentDate"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setSimulatedCurrentDate:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("SimulatedCurrentDate"), v5, 0);

}

- (void)setWeekStart:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", *MEMORY[0x1E0D0BF20], a3, CFSTR("com.apple.mobilecal.preference.notification.weekStart"));
}

- (void)setLastSidebarMode:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastSidebarMode"), a3, 0);
}

- (NSNumber)lastViewedDate
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastViewedDate"), objc_opt_class());
}

- (void)setLastViewedDate:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastViewedDate"), a3, 0);
}

- (void)setLastSuspendTime:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastSuspendTime"), a3, 0);
}

- (void)setDayViewHourScale:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("DayViewHourScale"), a3, 0);
}

- (NSNumber)weekViewHourScale
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("WeekViewHourScale"), objc_opt_class());
}

- (void)setWeekViewHourScale:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("WeekViewHourScale"), a3, 0);
}

- (unint64_t)monthViewScaleSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  if ((_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl())
    return 0;
  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("MonthViewScaleSize"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 3;

  return v5;
}

- (void)setMonthViewScaleSize:(unint64_t)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("MonthViewScaleSize"), v4, CFSTR("com.apple.mobilecal.preference.notification.monthWeekScale"));

}

- (unint64_t)monthViewEventScaleSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("MonthViewEventScaleSize"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    if (v4 <= 3)
      v5 = 3;
    else
      v5 = v4;
  }
  else
  {
    v5 = 3;
  }

  return v5;
}

- (void)setMonthViewEventScaleSize:(unint64_t)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("MonthViewEventScaleSize"), v4, 0);

}

- (NSString)searchString
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("searchString"), objc_opt_class());
}

- (void)setSearchString:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("searchString"), a3, 0);
}

- (void)setOverlayCalendarID:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overlayCalendarID"), a3, CFSTR("com.apple.mobilecal.preference.notification.overlayCalendarID"));
}

- (void)setShowWeekNumbers:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowWeekNumbers"), a3, CFSTR("com.apple.mobilecal.preference.notification.showweeknumbers"));
}

- (BOOL)weekViewStartsOnToday
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("WeekViewStartsOnToday"), 0);
}

- (void)setWeekViewStartsOnToday:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("WeekViewStartsOnToday"), a3, CFSTR("com.apple.mobilecal.preference.notification.weekViewStartsOnToday"));
}

- (void)setShowListView:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowListView"), a3, CFSTR("com.apple.mobilecal.preference.notification.showlistview"));
}

- (int64_t)numDaysToShow
{
  if (CUIKShouldSaveStateInPreferences())
    return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("NumDaysToShow"), 1);
  else
    return 1;
}

- (void)setNumDaysToShow:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("NumDaysToShow"), a3, CFSTR("com.apple.mobilecal.preference.notification.numDaysToShow"));
}

- (void)setShowMonthDividedListView:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowMonthDividedListView"), a3, CFSTR("com.apple.mobilecal.preference.notification.showmonthDividedListView"));
}

- (BOOL)immediateAlarmCreation
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ImmediateAlarmCreation"), 0);
}

- (void)setImmediateAlarmCreation:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ImmediateAlarmCreation"), a3, CFSTR("com.apple.mobilecal.preference.notification.immediateAlarmCreation"));
}

- (BOOL)viewedTimeZoneAutomatic
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", *MEMORY[0x1E0D0C4E0], 1);
}

- (void)setViewedTimeZoneAutomatic:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", *MEMORY[0x1E0D0C4E0], a3, CFSTR("com.apple.mobilecal.preference.notification.viewedTimeZoneAutomatic"));
}

- (void)setRequestSyncOnApplicationLaunch:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("RequestSyncOnApplicationLaunch"), a3, CFSTR("com.apple.mobilecal.preference.notification.requestSyncOnApplicationLaunch"));
}

- (NSArray)calendarUUIDsExcludedFromNotifications
{
  void *v2;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("CalendarsExcludedFromNotifications"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v2;
}

- (void)setCalendarUUIDsExcludedFromNotifications:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("CalendarsExcludedFromNotifications"), a3, CFSTR("com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications"));
}

- (NSNumber)locationSearchResultLimit
{
  void *v2;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LocationSearchResultLimit"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", 50);
  return (NSNumber *)v2;
}

- (void)setLocationSearchResultLimit:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LocationSearchResultLimit"), a3, CFSTR("com.apple.mobilecal.preference.notification.LocationSearchResultLimit"));
}

- (unint64_t)promptForCommentWhenDeclining
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("PromptForCommentWhenDeclining"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (void)setPromptForCommentWhenDeclining:(unint64_t)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("PromptForCommentWhenDeclining"), v4, CFSTR("com.apple.mobilecal.preference.notification.PromptForCommentWhenDeclining"));

}

- (BOOL)showExperimentalUI
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowExperimentalUI"), 0);
}

- (void)setShowExperimentalUI:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowExperimentalUI"), a3, CFSTR("com.apple.mobilecal.preference.notification.ShowExperimentalUI"));
}

- (void)setDisableContinuity:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("DisableContinuity"), a3, CFSTR("com.apple.mobilecal.preference.notification.DisableContinuity"));
}

- (BOOL)swipeToDeleteEnabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("swipeToDeleteEnabled"), 0);
}

- (void)setSwipeToDeleteEnabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("swipeToDeleteEnabled"), a3, CFSTR("com.apple.mobilecal.preference.notification.swipeToDeleteEnabled"));
}

- (BOOL)largeListViewDisclosingEventDetails
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("largeListViewDisclosingEventDetails"), 0);
}

- (void)setLargeListViewDisclosingEventDetails:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("largeListViewDisclosingEventDetails"), a3, CFSTR("com.apple.mobilecal.preference.notification.largeListViewDisclosingEventDetails"));
}

- (BOOL)showWindowDebugButton
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowWindowDebugButton"), 0);
}

- (void)setShowWindowDebugButton:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowWindowDebugButton"), a3, CFSTR("com.apple.mobilecal.preference.notification.showWindowDebugButton"));
}

- (BOOL)hideInlineDayViewInEventDetails
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("HideInlineDayViewInEventDetails"), 0);
}

- (void)setHideInlineDayViewInEventDetails:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("HideInlineDayViewInEventDetails"), a3, CFSTR("com.apple.mobilecal.preference.notification.HideInlineDayViewInEventDetailsChanged"));
}

- (void)setEnableMultiwindowAsserts:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("EnableMultiwindowAsserts"), a3, 0);
}

- (void)setShortResumeToTodayTimeout:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShortResumeToTodayTimeout"), a3, CFSTR("com.apple.mobilecal.preference.notification.shortResumeToTodayTimeout"));
}

- (BOOL)disableTodayPushes
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("DisableTodayPushes"), 0);
}

- (void)setDisableTodayPushes:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("DisableTodayPushes"), a3, 0);
}

- (BOOL)enableAvatars
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("enableAvatars"), 0);
}

- (void)setEnableAvatars:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("enableAvatars"), a3, 0);
}

- (BOOL)eventAutocompleteEnabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("EventAutocompleteEnabled"), 1);
}

- (void)setEventAutocompleteEnabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("EventAutocompleteEnabled"), a3, 0);
}

- (NSArray)deselectedCalendarSyncHashes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectedCalendarSyncHashes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setDayViewFirstVisibleSecond:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("DayViewFirstVisibleSecond"), a3, 0);
}

- (void)setOverrideLocaleWeekends:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("overrideLocaleWeekends"), a3, CFSTR("com.apple.mobilecal.preference.notification.OverrideLocaleWeekends"));
}

- (void)setLastViewedOccurrenceUID:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastViewedOccurrenceUID"), a3, 0);
}

- (void)setLastViewedOccurrenceDate:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastViewedOccurrenceDate"), a3, 0);
}

- (BOOL)scanForDiscoveredVirtualConferences
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("scanForDiscoveredVirtualConferences"), 1);
}

- (void)setScanForDiscoveredVirtualConferences:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("scanForDiscoveredVirtualConferences"), a3, 0);
}

- (BOOL)allowSubscribedCalendarSpamDetection
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("allowSubscribedCalendarSpamDetection"), 0);
}

- (void)setAllowSubscribedCalendarSpamDetection:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("allowSubscribedCalendarSpamDetection"), a3, CFSTR("com.apple.mobilecal.preference.notification.AllowSubscribedCalendarSpamDetection"));
}

- (void)resetSubscribedCalendarSpamDetectionToNull
{
  -[CalPreferences removePreference:notificationName:](self->_preferences, "removePreference:notificationName:", CFSTR("allowSubscribedCalendarSpamDetection"), CFSTR("com.apple.mobilecal.preference.notification.AllowSubscribedCalendarSpamDetection"));
}

- (BOOL)displayedSubscribedCalendarSpamDetectionPrivacyNotice
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("displayedSubscribedCalendarSpamDetectionPrivacyNotice"), 0);
}

- (void)setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("displayedSubscribedCalendarSpamDetectionPrivacyNotice"), a3, 0);
}

- (BOOL)perSectionShowAllHideAllButtonSpecifier
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("perSectionShowAllHideAllButtonSpecifier"), 0);
}

- (void)setPerSectionShowAllHideAllButtonSpecifier:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("perSectionShowAllHideAllButtonSpecifier"), a3, 0);
}

- (BOOL)showDeclinedAndCancelledEventsInWidgets
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("showDeclinedAndCancelledEventsInWidgets"), 0);
}

- (void)setShowDeclinedAndCancelledEventsInWidgets:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("showDeclinedAndCancelledEventsInWidgets"), a3, 0);
}

- (BOOL)debugLocationSearchResults
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("debugLocationSearchResults"), 0);
}

- (void)setDebugLocationSearchResults:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("debugLocationSearchResults"), a3, 0);
}

- (BOOL)forceAllowClearComments
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("forceAllowClearComments"), 0);
}

- (void)setForceAllowClearComments:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("forceAllowClearComments"), a3, 0);
}

- (BOOL)drawDebugViewColors
{
  return self->_drawDebugViewColors;
}

- (void)setDrawDebugViewColors:(BOOL)a3
{
  self->_drawDebugViewColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
