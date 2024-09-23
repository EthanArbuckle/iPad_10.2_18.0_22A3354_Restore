@implementation EKPreferences

- (NSArray)unselectedCalendarIdentifiersForFocusMode
{
  void *v3;

  if (_os_feature_enabled_impl())
  {
    -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("UnselectedCalendarIdentifiersForFocusMode"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setDeselectedCalendars:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  EKPreferences *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v27 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134218242;
    v35 = objc_msgSend(v5, "count");
    v36 = 2114;
    v37 = v6;
    _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEFAULT, "Saving of %lu invisible calendars commencing: %{public}@", buf, 0x16u);

  }
  v28 = v6;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "calendarIdentifier", v27, v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = EKLogHandle;
        if (v16)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v16;
            _os_log_debug_impl(&dword_1A2318000, v17, OS_LOG_TYPE_DEBUG, "Saving calendar identifier [%@] of invisible calendar", buf, 0xCu);
          }
          objc_msgSend(v9, "addObject:", v16);
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v15;
          _os_log_error_impl(&dword_1A2318000, v17, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able to save all invisible calendars.  Calendar: [%@]", buf, 0xCu);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  -[EKPreferences _setDeselectedCalendars_iOS:](v27, "_setDeselectedCalendars_iOS:", v10);
  +[EKPreferences shared](EKPreferences, "shared");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setDeselectedCalendarIdentifiers:", v9);

  v19 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKPreferences setDeselectedCalendars:reason:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

}

- (void)_setDeselectedCalendars_iOS:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "calendarIdentifier", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "syncHash");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = EKLogHandle;
        if (v12)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v12;
            v27 = 2112;
            v28 = v11;
            _os_log_debug_impl(&dword_1A2318000, v13, OS_LOG_TYPE_DEBUG, "Saving sync hash [%@] of invisible calendar with identifier [%@]", buf, 0x16u);
          }
          objc_msgSend(v20, "addObject:", v12);
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v26 = v10;
          _os_log_error_impl(&dword_1A2318000, v13, OS_LOG_TYPE_ERROR, "No calendar sync hash found.  Will not be able to save all calendar sync hashes.  Calendar: [%@]", buf, 0xCu);
        }
        objc_msgSend(v10, "selectionSyncIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = EKLogHandle;
        if (v14)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v14;
            v27 = 2112;
            v28 = v11;
            _os_log_debug_impl(&dword_1A2318000, v15, OS_LOG_TYPE_DEBUG, "Saving sync identifier [%@] of invisible calendar with identifier [%@]", buf, 0x16u);
          }
          objc_msgSend(v4, "addObject:", v14);
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v26 = v10;
          _os_log_error_impl(&dword_1A2318000, v15, OS_LOG_TYPE_ERROR, "No calendar sync identifier found.  Will not be able to save all calendar sync identifiers.  Calendar: [%@]", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  +[EKPreferences shared](EKPreferences, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setDeselectedCalendarSyncIdentifiers:", v4);

  +[EKPreferences shared](EKPreferences, "shared");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setDeselectedCalendarSyncHashes:", v20);

}

- (void)_setDeselectedCalendarSyncIdentifiers:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastDeselectedCalendarSyncIdentifiers"), a3, 0);
}

- (void)_setDeselectedCalendarSyncHashes:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastDeselectedCalendarSyncHashes"), a3, CFSTR("com.apple.mobilecal.preference.notification.selectedCalendarSyncHashesChanged"));
}

- (void)_setDeselectedCalendarIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastDeselectedCalendars"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKPreferences _array:hasSameElementAsArray:](self, "_array:hasSameElementAsArray:", v5, v4))
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKPreferences _setDeselectedCalendarIdentifiers:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    CalAnalyticsSendEvent();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastDeselectedCalendars"), v4, CFSTR("com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers"));
  }

}

- (BOOL)_array:(id)a3 hasSameElementAsArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            if (!objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16))
            {
              v14 = 0;
              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v11)
            continue;
          break;
        }
      }
      v14 = 1;
LABEL_14:

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)deselectedCalendarIdentifiers
{
  void *v2;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastDeselectedCalendars"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v2;
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_9);
  return (id)shared_sharedPreferences;
}

- (unint64_t)lastConfirmedSplashScreenVersion
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("LastConfirmedSplashScreenVersionViewed"), 0);
}

- (BOOL)bypassSplashScreen
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("privacyPaneBypass"), 0);
}

void __23__EKPreferences_shared__block_invoke()
{
  EKPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(EKPreferences);
  v1 = (void *)shared_sharedPreferences;
  shared_sharedPreferences = (uint64_t)v0;

}

- (EKPreferences)init
{
  EKPreferences *v2;
  id v3;
  uint64_t v4;
  CalPreferences *preferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKPreferences;
  v2 = -[EKPreferences init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.travelEngineThrottlePeriod"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.preference.notification.refiringReminderAlarmsEnabled"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.preference.notification.selectedCalendarSyncHashesChanged"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.preference.notification.selectedCalendarIdentifiers"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.mobilecal.showdeclinedchanged"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.preference.notification.AlertInviteeDeclines"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"));
  }
  return v2;
}

- (double)travelEngineThrottlePeriod
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("TravelEngineThrottlePeriod"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 900.0;
  }

  return v5;
}

- (void)setTravelEngineThrottlePeriod:(double)a3
{
  NSObject *v4;
  id v6;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("TravelEngineThrottlePeriod"), v6, CFSTR("com.apple.eventkit.debug.preference.notification.travelEngineThrottlePeriod"));

  }
  else
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKPreferences setTravelEngineThrottlePeriod:].cold.1(v4, a3);
  }
}

- (BOOL)refiringReminderAlarmsEnabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("refiringReminderAlarmsEnabled"), 1);
}

- (void)setRefiringReminderAlarmsEnabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("refiringReminderAlarmsEnabled"), a3, CFSTR("com.apple.eventkit.preference.notification.refiringReminderAlarmsEnabled"));
}

- (BOOL)useShortReminderSnoozeInterval
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("useShortReminderSnoozeInterval"), 0);
}

- (void)setUseShortReminderSnoozeInterval:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("useShortReminderSnoozeInterval"), a3, 0);
}

- (BOOL)useShortReminderRefireInterval
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("useShortReminderRefireInterval"), 0);
}

- (void)setUseShortReminderRefireInterval:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("useShortReminderRefireInterval"), a3, 0);
}

- (BOOL)alwaysSetArrivedAndSettledForReminders
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("alwaysSetArrivedAndSettledForReminders"), 0);
}

- (void)setAlwaysSetArrivedAndSettledForReminders:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("alwaysSetArrivedAndSettledForReminders"), a3, 0);
}

- (void)setLastConfirmedSplashScreenVersion:(unint64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("LastConfirmedSplashScreenVersionViewed"), a3, 0);
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("CollapsedSectionIdentifiers"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKPreferences _array:hasSameElementAsArray:](self, "_array:hasSameElementAsArray:", v5, v4))
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKPreferences setCollapsedSectionIdentifiers:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("CollapsedSectionIdentifiers"), v4, 0);
  }

}

- (NSArray)collapsedSectionIdentifiers
{
  void *v2;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("CollapsedSectionIdentifiers"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v2;
}

- (NSArray)deselectedCalendarSyncHashes
{
  return (NSArray *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastDeselectedCalendarSyncHashes"), objc_opt_class());
}

- (NSArray)deselectedCalendarSyncIdentifiers
{
  return (NSArray *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastDeselectedCalendarSyncIdentifiers"), objc_opt_class());
}

- (NSArray)selectedCalendarIdentifiers
{
  return (NSArray *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastViewedCalendars"), objc_opt_class());
}

- (void)setSelectedCalendarIdentifiers:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("LastViewedCalendars"), a3, CFSTR("com.apple.eventkit.preference.notification.selectedCalendarIdentifiers"));
}

- (NSArray)customDeselectedCalendarSyncIdentifiers
{
  return (NSArray *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("CustomDeselectedCalendarIdentifiers"), objc_opt_class());
}

- (NSArray)customDeselectedCalendarSyncHashes
{
  return (NSArray *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("CustomDeselectedCalendarHashes"), objc_opt_class());
}

- (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3
{
  CalPreferences *preferences;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    preferences = self->_preferences;
    if (v5)
      -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("UnselectedCalendarIdentifiersForFocusMode"), v5, CFSTR("com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"));
    else
      -[CalPreferences removePreference:notificationName:](preferences, "removePreference:notificationName:", CFSTR("UnselectedCalendarIdentifiersForFocusMode"), CFSTR("com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"));
  }

}

- (BOOL)showDeclinedEvents
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowDeclinedEvents"), 0);
}

- (void)setShowDeclinedEvents:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowDeclinedEvents"), a3, CFSTR("com.apple.mobilecal.showdeclinedchanged"));
}

- (BOOL)showCompletedReminders
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("ShowCompletedReminders"), 1);
}

- (void)setShowCompletedReminders:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("ShowCompletedReminders"), a3, CFSTR("com.apple.mobilecal.showCompletedRemindersChanged"));
}

- (BOOL)alertInviteeDeclines
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("InviteeDeclineAlerts"), 1);
}

- (void)setAlertInviteeDeclines:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("InviteeDeclineAlerts"), a3, CFSTR("com.apple.eventkit.preference.notification.AlertInviteeDeclines"));
}

- (NSDictionary)conferenceRoomTypeIdentifiersByMRU
{
  return (NSDictionary *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("conferenceRoomTypeIdentifiersByMRU"), objc_opt_class());
}

- (void)setConferenceRoomTypeIdentifiersByMRU:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("conferenceRoomTypeIdentifiersByMRU"), a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)setTravelEngineThrottlePeriod:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Will not set a travel lookahead interval of less than 0.  Given value: [%f]", (uint8_t *)&v2, 0xCu);
}

- (void)setCollapsedSectionIdentifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Not updating collapsed section identifiers because nothing has actually changed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setDeselectedCalendars:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Saving of invisible calendars completed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_setDeselectedCalendarIdentifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Not updating deselected calendar identifiers because nothing has actually changed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
