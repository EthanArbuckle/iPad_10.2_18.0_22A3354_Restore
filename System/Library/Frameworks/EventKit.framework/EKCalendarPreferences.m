@implementation EKCalendarPreferences

+ (id)calendarPreferences
{
  if (calendarPreferences_onceToken != -1)
    dispatch_once(&calendarPreferences_onceToken, &__block_literal_global_83);
  return (id)calendarPreferences_calendarPreferences;
}

void __44__EKCalendarPreferences_calendarPreferences__block_invoke()
{
  EKCalendarPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(EKCalendarPreferences);
  v1 = (void *)calendarPreferences_calendarPreferences;
  calendarPreferences_calendarPreferences = (uint64_t)v0;

}

- (EKCalendarPreferences)init
{
  EKCalendarPreferences *v2;
  id v3;
  uint64_t v4;
  CalPreferences *preferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKCalendarPreferences;
  v2 = -[EKCalendarPreferences init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.iCal.viewModelChanged"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.calendar.preference.notification.changed"));
  }
  return v2;
}

- (BOOL)sharedCalendarNotificationsDisabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("SharedCalendarNotificationsDisabled"), 0);
}

- (void)setSharedCalendarNotificationsDisabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("SharedCalendarNotificationsDisabled"), a3, CFSTR("com.apple.calendar.preference.notification.changed"));
}

- (BOOL)invitationNotificationsDisabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("InvitationNotificationsDisabled"), 0);
}

- (void)setInvitationNotificationsDisabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("InvitationNotificationsDisabled"), a3, CFSTR("com.apple.calendar.preference.notification.changed"));
}

- (void)updateCheckedStateForCalendarWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5
{
  -[EKCalendarPreferences _updateStateForDisabledOrCollapsedItemWithUID:delegateID:state:withKey:withNotification:](self, "_updateStateForDisabledOrCollapsedItemWithUID:delegateID:state:withKey:withNotification:", a3, a4, a5, CFSTR("DisabledCalendars"), CFSTR("com.apple.iCal.viewModelChanged"));
}

- (BOOL)checkedStateForCalendarWithUID:(id)a3 delegateID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;

  v6 = a3;
  -[EKCalendarPreferences _disabledOrCollapsedItemsForDelegateID:withKey:](self, "_disabledOrCollapsedItemsForDelegateID:withKey:", a4, CFSTR("DisabledCalendars"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "containsObject:", v6) ^ 1;
  else
    LOBYTE(v9) = 1;

  return v9;
}

- (id)disabledCalendarsForDelegateWithUID:(id)a3
{
  return -[EKCalendarPreferences _disabledOrCollapsedItemsForDelegateID:withKey:](self, "_disabledOrCollapsedItemsForDelegateID:withKey:", a3, CFSTR("DisabledCalendars"));
}

- (id)disabledCalendarsForMainWindow
{
  return -[EKCalendarPreferences disabledCalendarsForDelegateWithUID:](self, "disabledCalendarsForDelegateWithUID:", CFSTR("MainWindow"));
}

- (void)updateExpandedStateForTopLevelNodeWithUID:(id)a3 state:(BOOL)a4
{
  -[EKCalendarPreferences _updateStateForDisabledOrCollapsedItemWithUID:delegateID:state:withKey:withNotification:](self, "_updateStateForDisabledOrCollapsedItemWithUID:delegateID:state:withKey:withNotification:", a3, 0, a4, CFSTR("CollapsedTopLevelNodes"), CFSTR("com.apple.iCal.viewModelChanged"));
}

- (BOOL)expandedStateForTopLevelNodeWithUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[EKCalendarPreferences _disabledOrCollapsedItemsForDelegateID:withKey:](self, "_disabledOrCollapsedItemsForDelegateID:withKey:", 0, CFSTR("CollapsedTopLevelNodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "containsObject:", v4) ^ 1;
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (void)_updateStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5 withKey:(id)a6 withNotification:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  CalPreferences *preferences;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v9 = a5;
  v21 = a3;
  v12 = a4;
  v13 = a6;
  preferences = self->_preferences;
  v15 = a7;
  -[CalPreferences getValueForPreference:expectedClass:](preferences, "getValueForPreference:expectedClass:", v13, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EKCalendarPreferences _keyForDelegateID:](self, "_keyForDelegateID:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v18);
  if (v9)
    objc_msgSend(v20, "removeObject:inRange:", v21, 0, objc_msgSend(v20, "count"));
  else
    objc_msgSend(v20, "addObject:", v21);
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", v13, v17, v15);

}

- (id)_disabledOrCollapsedItemsForDelegateID:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[EKCalendarPreferences _keyForDelegateID:](self, "_keyForDelegateID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", v6, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_checkedStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 withKey:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;

  v7 = a3;
  -[EKCalendarPreferences _disabledOrCollapsedItemsForDelegateID:withKey:](self, "_disabledOrCollapsedItemsForDelegateID:withKey:", a4, CFSTR("DisabledCalendars"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "containsObject:", v7) ^ 1;
  else
    LOBYTE(v10) = 1;

  return v10;
}

- (id)_keyForDelegateID:(id)a3
{
  __CFString *v3;

  v3 = (__CFString *)a3;
  if (!v3)
    v3 = CFSTR("MainWindow");
  return v3;
}

- (unint64_t)displayOrderForLocalGroupWithSourceIdentifier:(id)a3
{
  return -[EKCalendarPreferences _displayOrderForSourceWithIdentifier:key:](self, "_displayOrderForSourceWithIdentifier:key:", a3, CFSTR("LocalGroupsDisplayOrder"));
}

- (void)updateDisplayOrderForLocalGroupsWithSourceIdentifiers:(id)a3
{
  -[EKCalendarPreferences _updateDisplayOrderForSources:key:](self, "_updateDisplayOrderForSources:key:", a3, CFSTR("LocalGroupsDisplayOrder"));
}

- (id)displayOrderForAccounts
{
  return (id)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("AccountDisplayOrder"), objc_opt_class());
}

- (unint64_t)displayOrderForAccountWithSourceIdentifier:(id)a3
{
  return -[EKCalendarPreferences _displayOrderForSourceWithIdentifier:key:](self, "_displayOrderForSourceWithIdentifier:key:", a3, CFSTR("AccountDisplayOrder"));
}

- (void)updateDisplayOrderForAccountsWithSourceIdentifiers:(id)a3
{
  -[EKCalendarPreferences _updateDisplayOrderForSources:key:](self, "_updateDisplayOrderForSources:key:", a3, CFSTR("AccountDisplayOrder"));
}

- (unint64_t)_displayOrderForSourceWithIdentifier:(id)a3 key:(id)a4
{
  id v6;
  CalPreferences *preferences;
  id v8;
  void *v9;
  unint64_t v10;

  v6 = a3;
  preferences = self->_preferences;
  v8 = a4;
  -[CalPreferences getValueForPreference:expectedClass:](preferences, "getValueForPreference:expectedClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "indexOfObject:", v6);
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;

  return v10;
}

- (void)_updateDisplayOrderForSources:(id)a3 key:(id)a4
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", a4, a3, CFSTR("com.apple.iCal.viewModelChanged"));
}

- (CalPreferences)calPreferences
{
  return (CalPreferences *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCalPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calPreferences, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
