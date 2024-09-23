@implementation CDBPreferences

- (int64_t)get_defaultCalendarStoreUID
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("defaultCalendarStoreUID"), 0);
}

- (NSString)get_defaultCalendarID
{
  void *v2;
  void *v3;
  id v4;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarID"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return (NSString *)v3;
}

- (BOOL)get_sqlProfileLoggingEnabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("sqlProfileLoggingEnabled"), 0);
}

+ (id)sharedReadWrite
{
  if (sharedReadWrite_onceToken != -1)
    dispatch_once(&sharedReadWrite_onceToken, &__block_literal_global_1);
  return (id)sharedReadWrite_sharedPreferences;
}

- (BOOL)get_overrideParticipantRoleConstraint
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("overrideParticipantRoleConstraint"), 0);
}

- (int64_t)get_defaultCalendarDatabaseID
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("defaultCalendarDatabaseID"), 0);
}

- (CDBPreferences)initWithPreferences:(id)a3
{
  id v5;
  CDBPreferences *v6;
  CDBPreferences *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDBPreferences;
  v6 = -[CDBPreferences init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferences, a3);
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.enableTravelAdvisoriesForAutomaticBehavior"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.suggestEventLocations"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.sqlProfileLoggingEnabled"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.suggestedLocationsTestMode"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.overrideParticipantRoleConstraint"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.allowUnlimitedMigrationAttempts"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.kCalPreferredDaysToSyncKey"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.kCalRemindersPreferredDaysToSyncKey"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.LastConfirmedSplashScreenVersionViewed"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.privacyPaneHasBeenAcknowledgedVersion"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarStoreUID"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarDatabaseID"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarChangedTimestamp"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.migrationAttempts"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarID"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v7->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarChangedReason"));
  }

  return v7;
}

void __33__CDBPreferences_sharedReadWrite__block_invoke()
{
  CDBPreferences *v0;
  void *v1;

  v0 = -[CDBPreferences initWithReadOnly:]([CDBPreferences alloc], "initWithReadOnly:", 0);
  v1 = (void *)sharedReadWrite_sharedPreferences;
  sharedReadWrite_sharedPreferences = (uint64_t)v0;

}

- (CDBPreferences)initWithReadOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  CDBPreferences *v7;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D0C368]);
  v6 = (void *)objc_msgSend(v5, "initWithDomain:readOnly:", *MEMORY[0x1E0D0C508], v3);
  v7 = -[CDBPreferences initWithPreferences:](self, "initWithPreferences:", v6);

  return v7;
}

- (int64_t)get_kCalPreferredDaysToSyncKey
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("kCalPreferredDaysToSyncKey"), 0);
}

+ (id)sharedReadOnly
{
  if (sharedReadOnly_onceToken != -1)
    dispatch_once(&sharedReadOnly_onceToken, &__block_literal_global_8);
  return (id)sharedReadOnly_sharedPreferences;
}

void __32__CDBPreferences_sharedReadOnly__block_invoke()
{
  CDBPreferences *v0;
  void *v1;

  v0 = -[CDBPreferences initWithReadOnly:]([CDBPreferences alloc], "initWithReadOnly:", 1);
  v1 = (void *)sharedReadOnly_sharedPreferences;
  sharedReadOnly_sharedPreferences = (uint64_t)v0;

}

+ (id)preferencesForDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  CDBPreferences *v6;

  objc_msgSend(MEMORY[0x1E0D0C350], "preferencesStoreForPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D0C368]);
  v5 = (void *)objc_msgSend(v4, "initWithDomain:store:", *MEMORY[0x1E0D0C508], v3);
  v6 = -[CDBPreferences initWithPreferences:]([CDBPreferences alloc], "initWithPreferences:", v5);

  return v6;
}

- (BOOL)get_enableTravelAdvisoriesForAutomaticBehavior
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("enableTravelAdvisoriesForAutomaticBehavior"), 1);
}

- (void)set_enableTravelAdvisoriesForAutomaticBehavior:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("enableTravelAdvisoriesForAutomaticBehavior"), a3, CFSTR("com.apple.calendar.database.preference.notification.enableTravelAdvisoriesForAutomaticBehavior"));
}

- (BOOL)has_enableTravelAdvisoriesForAutomaticBehavior
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("enableTravelAdvisoriesForAutomaticBehavior"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)get_suggestEventLocations
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("suggestEventLocations"), 1);
}

- (void)set_suggestEventLocations:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("suggestEventLocations"), a3, CFSTR("com.apple.calendar.database.preference.notification.suggestEventLocations"));
}

- (BOOL)has_suggestEventLocations
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("suggestEventLocations"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_sqlProfileLoggingEnabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("sqlProfileLoggingEnabled"), a3, CFSTR("com.apple.calendar.database.preference.notification.sqlProfileLoggingEnabled"));
}

- (BOOL)has_sqlProfileLoggingEnabled
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("sqlProfileLoggingEnabled"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)get_suggestedLocationsTestMode
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("suggestedLocationsTestMode"), 0);
}

- (void)set_suggestedLocationsTestMode:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("suggestedLocationsTestMode"), a3, CFSTR("com.apple.calendar.database.preference.notification.suggestedLocationsTestMode"));
}

- (BOOL)has_suggestedLocationsTestMode
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("suggestedLocationsTestMode"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_overrideParticipantRoleConstraint:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("overrideParticipantRoleConstraint"), a3, CFSTR("com.apple.calendar.database.preference.notification.overrideParticipantRoleConstraint"));
}

- (BOOL)has_overrideParticipantRoleConstraint
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overrideParticipantRoleConstraint"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)get_allowUnlimitedMigrationAttempts
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("allowUnlimitedMigrationAttempts"), 0);
}

- (void)set_allowUnlimitedMigrationAttempts:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("allowUnlimitedMigrationAttempts"), a3, CFSTR("com.apple.calendar.database.preference.notification.allowUnlimitedMigrationAttempts"));
}

- (BOOL)has_allowUnlimitedMigrationAttempts
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("allowUnlimitedMigrationAttempts"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_kCalPreferredDaysToSyncKey:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("kCalPreferredDaysToSyncKey"), a3, CFSTR("com.apple.calendar.database.preference.notification.kCalPreferredDaysToSyncKey"));
}

- (BOOL)has_kCalPreferredDaysToSyncKey
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("kCalPreferredDaysToSyncKey"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)get_kCalRemindersPreferredDaysToSyncKey
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("kCalRemindersPreferredDaysToSyncKey"), 31);
}

- (void)set_kCalRemindersPreferredDaysToSyncKey:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("kCalRemindersPreferredDaysToSyncKey"), a3, CFSTR("com.apple.calendar.database.preference.notification.kCalRemindersPreferredDaysToSyncKey"));
}

- (BOOL)has_kCalRemindersPreferredDaysToSyncKey
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("kCalRemindersPreferredDaysToSyncKey"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)get_LastConfirmedSplashScreenVersionViewed
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("LastConfirmedSplashScreenVersionViewed"), 0);
}

- (void)set_LastConfirmedSplashScreenVersionViewed:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("LastConfirmedSplashScreenVersionViewed"), a3, CFSTR("com.apple.calendar.database.preference.notification.LastConfirmedSplashScreenVersionViewed"));
}

- (BOOL)has_LastConfirmedSplashScreenVersionViewed
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("LastConfirmedSplashScreenVersionViewed"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)get_privacyPaneHasBeenAcknowledgedVersion
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("privacyPaneHasBeenAcknowledgedVersion"), 0);
}

- (void)set_privacyPaneHasBeenAcknowledgedVersion:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("privacyPaneHasBeenAcknowledgedVersion"), a3, CFSTR("com.apple.calendar.database.preference.notification.privacyPaneHasBeenAcknowledgedVersion"));
}

- (BOOL)has_privacyPaneHasBeenAcknowledgedVersion
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("privacyPaneHasBeenAcknowledgedVersion"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarStoreUID:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("defaultCalendarStoreUID"), a3, CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarStoreUID"));
}

- (BOOL)has_defaultCalendarStoreUID
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarStoreUID"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarDatabaseID:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("defaultCalendarDatabaseID"), a3, CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarDatabaseID"));
}

- (BOOL)has_defaultCalendarDatabaseID
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarDatabaseID"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)get_defaultCalendarChangedTimestamp
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("defaultCalendarChangedTimestamp"), 0);
}

- (void)set_defaultCalendarChangedTimestamp:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("defaultCalendarChangedTimestamp"), a3, CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarChangedTimestamp"));
}

- (BOOL)has_defaultCalendarChangedTimestamp
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarChangedTimestamp"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)get_migrationAttempts
{
  return -[CalPreferences getIntegerPreference:defaultValue:](self->_preferences, "getIntegerPreference:defaultValue:", CFSTR("migrationAttempts"), 0);
}

- (void)set_migrationAttempts:(int64_t)a3
{
  -[CalPreferences setIntegerPreference:value:notificationName:](self->_preferences, "setIntegerPreference:value:notificationName:", CFSTR("migrationAttempts"), a3, CFSTR("com.apple.calendar.database.preference.notification.migrationAttempts"));
}

- (BOOL)has_migrationAttempts
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("migrationAttempts"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarID:(id)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  v4 = (id)objc_msgSend(a3, "copy");
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("defaultCalendarID"), v4, CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarID"));

}

- (BOOL)has_defaultCalendarID
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarID"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)get_defaultCalendarChangedReason
{
  void *v2;
  void *v3;
  id v4;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarChangedReason"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return (NSString *)v3;
}

- (void)set_defaultCalendarChangedReason:(id)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  v4 = (id)objc_msgSend(a3, "copy");
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("defaultCalendarChangedReason"), v4, CFSTR("com.apple.calendar.database.preference.notification.defaultCalendarChangedReason"));

}

- (BOOL)has_defaultCalendarChangedReason
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultCalendarChangedReason"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSNumber)get_DefaultTimedAlarmOffset
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DefaultTimedAlarmOffset"), objc_opt_class());
}

- (void)set_DefaultTimedAlarmOffset:(id)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  v4 = (id)objc_msgSend(a3, "copy");
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("DefaultTimedAlarmOffset"), v4, CFSTR("com.apple.calendar.database.preference.notification.DefaultTimedAlarmOffset"));

}

- (BOOL)has_DefaultTimedAlarmOffset
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DefaultTimedAlarmOffset"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSNumber)get_DefaultAllDayAlarmOffset
{
  return (NSNumber *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DefaultAllDayAlarmOffset"), objc_opt_class());
}

- (void)set_DefaultAllDayAlarmOffset:(id)a3
{
  CalPreferences *preferences;
  id v4;

  preferences = self->_preferences;
  v4 = (id)objc_msgSend(a3, "copy");
  -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("DefaultAllDayAlarmOffset"), v4, CFSTR("com.apple.calendar.database.preference.notification.DefaultAllDayAlarmOffset"));

}

- (BOOL)has_DefaultAllDayAlarmOffset
{
  void *v2;
  BOOL v3;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("DefaultAllDayAlarmOffset"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CalPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
