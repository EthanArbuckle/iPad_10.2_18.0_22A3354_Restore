@implementation FCActivityManager

- (NSArray)availableActivities
{
  FCActivityManager *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[FCActivityManager _availableActivities](v2, "_availableActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:copyItems:", v4, 1);

  objc_sync_exit(v2);
  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v7 = v6;

  return (NSArray *)v7;
}

- (id)_availableActivities
{
  FCActivityManager *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_availableActivities)
  {
    -[FCActivityManager _modeSelectionService](v2, "_modeSelectionService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 0;
    objc_msgSend(v3, "allModesWithError:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8[0];
    if (v5)
    {
      v6 = (id)FCLogActivities;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[FCActivityManager description](v2, "description");
        objc_claimAutoreleasedReturnValue();
        -[FCActivityManager _availableActivities].cold.1();
      }
    }
    else
    {
      objc_msgSend(v4, "allObjects");
      v6 = objc_claimAutoreleasedReturnValue();
      -[FCActivityManager _updateActivitiesWithModes:](v2, "_updateActivitiesWithModes:", v6);
    }

  }
  objc_sync_exit(v2);

  return v2->_availableActivities;
}

+ (id)sharedActivityManager
{
  if (sharedActivityManager_onceToken != -1)
    dispatch_once(&sharedActivityManager_onceToken, &__block_literal_global_1);
  return (id)sharedActivityManager___sharedActivityManager;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    FCRegisterLogging();
}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  FCActivityManager *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSHashTable *observers;
  void *v10;
  _QWORD v12[4];
  FCActivityManager *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCActivityManager;
  v5 = -[FCActivityManager init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    -[FCActivityManager _modeSelectionService](v5, "_modeSelectionService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__FCActivityManager__initWithIdentifier___block_invoke;
    v12[3] = &unk_24D0E11F8;
    v13 = v5;
    objc_msgSend(v10, "addListener:withCompletionHandler:", v13, v12);

  }
  return v5;
}

void __41__FCActivityManager__initWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)FCLogActivities;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
      __41__FCActivityManager__initWithIdentifier___block_invoke_cold_1(a1, v6);
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    __41__FCActivityManager__initWithIdentifier___block_invoke_cold_2(a1, v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[FCActivityManager setLifetimeDescriptionsUpdatingEnabled:](self, "setLifetimeDescriptionsUpdatingEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FCActivityManager;
  -[FCActivityManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; _identifier: %@>"),
                       objc_opt_class(),
                       self,
                       self->_identifier);
}

void __42__FCActivityManager_sharedActivityManager__block_invoke()
{
  FCActivityManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [FCActivityManager alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[FCActivityManager _initWithIdentifier:](v0, "_initWithIdentifier:", v1);
  v3 = (void *)sharedActivityManager___sharedActivityManager;
  sharedActivityManager___sharedActivityManager = v2;

}

+ (NSURL)activitiesSettingsURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "dnd_defaultSettingsURL");
}

- (unint64_t)maximumActivityCountForUserInterface
{
  return objc_msgSend(MEMORY[0x24BE2D668], "maxUIAddableModes");
}

- (FCActivityDescribing)activeActivity
{
  void *v2;
  void *v3;

  -[FCActivityManager _activeActivity](self, "_activeActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyWithZone:", 0);

  return (FCActivityDescribing *)v3;
}

- (FCActivityDescribing)defaultActivity
{
  FCActivityDescribing *defaultActivity;
  FCActivityDescribing *v4;
  FCActivityDescribing *v5;

  defaultActivity = self->_defaultActivity;
  if (!defaultActivity)
  {
    -[FCActivityManager _activityForModeIdentifier:](self, "_activityForModeIdentifier:", *MEMORY[0x24BE2D5C0]);
    v4 = (FCActivityDescribing *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultActivity;
    self->_defaultActivity = v4;

    defaultActivity = self->_defaultActivity;
  }
  return (FCActivityDescribing *)(id)-[FCActivityDescribing copyWithZone:](defaultActivity, "copyWithZone:", 0);
}

- (BOOL)isDefaultConfiguration
{
  FCActivityManager *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[FCActivityManager _availableActivities](v2, "_availableActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_26);

  objc_sync_exit(v2);
  return v4 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __43__FCActivityManager_isDefaultConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  unint64_t v10;

  v5 = a2;
  if ((objc_msgSend(v5, "isPlaceholder") & 1) != 0
    || (objc_msgSend(v5, "activityIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = BSEqualStrings(),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "_dndMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "semanticType") - 3;

      v8 = v10 < 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      v8 = 1;
    }
    *a4 = v8;
  }

  return v8;
}

- (NSString)localizedTerminationDescriptionForActiveActivity
{
  DNDStateUpdate *activeStateUpdate;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (self->_activeModeAssertion)
  {
    activeStateUpdate = self->_activeStateUpdate;
    if (activeStateUpdate)
    {
      -[DNDStateUpdate state](activeStateUpdate, "state");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FCActivityManager _stateService](self, "_stateService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "queryCurrentStateWithError:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "userVisibleTransitionDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userVisibleTransitionLifetimeType") == 3)
    {
      v8 = 0;
      v9 = CFSTR("FOCUS_STATUS_DND_ON_UNTIL_LOCATION");
    }
    else if (v7
           && (objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"),
               v10 = (void *)objc_claimAutoreleasedReturnValue(),
               v11 = objc_msgSend(v7, "isEqualToDate:", v10),
               v10,
               (v11 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDateInToday:", v7);

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "formatDateAsTimeStyle:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("FOCUS_STATUS_DND_ON_UNTIL_TODAY_TIME");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isDateInTomorrow:", v7);

        objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        if (v16)
        {
          objc_msgSend(v17, "formatDateAsTimeStyle:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("FOCUS_STATUS_DND_ON_UNTIL_TOMORROW_TIME");
        }
        else
        {
          objc_msgSend(v17, "formatDateAsAbbreviatedDayMonthWithTimeStyle:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("FOCUS_STATUS_DND_ON_UNTIL_DATE_TIME");
        }
      }

    }
    else
    {
      v8 = 0;
      v9 = CFSTR("FOCUS_STATUS_DND_ON");
    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v9, &stru_24D0E1520, CFSTR("Focus"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setLifetimeDescriptionsUpdatingEnabled:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  id v6;

  if (self->_lifetimeDescriptionsUpdatingEnabled != a3)
  {
    self->_lifetimeDescriptionsUpdatingEnabled = a3;
    -[FCActivityManager _lifetimeDetailsProvider](self, "_lifetimeDetailsProvider");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_lifetimeDescriptionsUpdatingEnabled)
    {
      objc_msgSend(v6, "startUpdatingLifetimeDetails");
      objc_msgSend(v6, "startUpdatingLifetimeDetailMetadata");
      -[FCActivityManager _updateLifetimesAlternativeDescriptionsForAvailableActivities](self, "_updateLifetimesAlternativeDescriptionsForAvailableActivities");
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)FCDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x24BE151B0], 0, CFNotificationSuspensionBehaviorCoalesce);
    }
    else
    {
      objc_msgSend(v6, "stopUpdatingLifetimeDetails");
      objc_msgSend(v6, "stopUpdatingLifetimeDetailMetadata");
      objc_msgSend(v6, "resetLifetimeDetails");
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x24BE151B0], 0);
    }

  }
}

- (id)lifetimeOfActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(a3, "activityUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[FCActivityManager _activeActivity](self, "_activeActivity"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = BSEqualObjects(),
        v6,
        v7))
  {
    -[FCActivityManager _lifetimeForActiveActivity](self, "_lifetimeForActiveActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setActivity:(id)a3 active:(BOOL)a4 reason:(id)a5
{
  -[FCActivityManager setActivity:active:withLifetime:reason:](self, "setActivity:active:withLifetime:reason:", a3, a4, 0, a5);
}

- (void)setActivity:(id)a3 active:(BOOL)a4 withLifetime:(id)a5 reason:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10 || !v8)
  {
    objc_msgSend(v10, "activityUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15 || v8)
    {
      objc_msgSend(v11, "lifetimeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCActivityManager _lifetimeForLifetimeDetailsIdentifier:ofActivity:](self, "_lifetimeForLifetimeDetailsIdentifier:ofActivity:", v16, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCActivityManager _setActiveActivity:withLifetime:reason:](self, "_setActiveActivity:withLifetime:reason:", v15, v17, v12);
    }
    else
    {
      -[FCActivityManager _deactivateActivity:reason:](self, "_deactivateActivity:reason:", v15, v12);
    }

  }
  else
  {
    v13 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
      -[FCActivityManager setActivity:active:withLifetime:reason:].cold.1(v13, self);
  }

}

- (BOOL)isActivityLocalUserInitiated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FCActivityManager *v8;
  DNDStateUpdate *activeStateUpdate;
  BOOL v10;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "activityUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  -[FCActivityManager _activeActivity](self, "_activeActivity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7 && !BSEqualObjects())
  {
    v10 = 0;
    goto LABEL_11;
  }
  v8 = self;
  objc_sync_enter(v8);
  activeStateUpdate = v8->_activeStateUpdate;
  if (!activeStateUpdate)
  {
    if (v8->_activeModeAssertion && !-[FCActivityManager _isSyncedAssertion:](v8, "_isSyncedAssertion:"))
    {
      -[DNDModeAssertion details](v8->_activeModeAssertion, "details");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "reason") == 1;

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (-[DNDStateUpdate source](activeStateUpdate, "source") != 1)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = -[DNDStateUpdate reason](v8->_activeStateUpdate, "reason") == 1;
LABEL_9:
  objc_sync_exit(v8);

LABEL_11:
  return v10;
}

- (BOOL)shouldActivityShowStatusPill:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FCActivityManager *v8;
  DNDStateUpdate *activeStateUpdate;
  BOOL v10;
  unint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "activityUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  -[FCActivityManager _activeActivity](self, "_activeActivity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7 && !BSEqualObjects())
  {
    LOBYTE(v11) = 0;
    v10 = 0;
  }
  else
  {
    v8 = self;
    objc_sync_enter(v8);
    activeStateUpdate = v8->_activeStateUpdate;
    if (activeStateUpdate)
    {
      v10 = -[DNDStateUpdate source](activeStateUpdate, "source") == 1
         && -[DNDStateUpdate reason](v8->_activeStateUpdate, "reason") == 1;
      v11 = ((unint64_t)-[DNDStateUpdate options](v8->_activeStateUpdate, "options") >> 1) & 1;
    }
    else if (v8->_activeModeAssertion && !-[FCActivityManager _isSyncedAssertion:](v8, "_isSyncedAssertion:"))
    {
      -[DNDModeAssertion details](v8->_activeModeAssertion, "details");
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend((id)v11, "reason") == 1;

      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 0;
      v10 = 0;
    }
    objc_sync_exit(v8);

  }
  return !v10 | v11;
}

- (id)promotedPlaceholderActivity:(id)a3
{
  DNDModeSelectionService *modeSelectionService;
  void *v4;
  void *v5;
  void *v6;
  _FCActivity *v7;
  uint64_t v9;

  modeSelectionService = self->_modeSelectionService;
  objc_msgSend(a3, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  -[DNDModeSelectionService promotedPlaceholderWithModeIdentifier:error:](modeSelectionService, "promotedPlaceholderWithModeIdentifier:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[_FCActivity initWithMode:]([_FCActivity alloc], "initWithMode:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)suggestedActivityForLocation:(int64_t)a3
{
  FCActivityManager *v4;
  NSMapTable *locationsToSuggestedActivitiesOrNull;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = self;
  objc_sync_enter(v4);
  locationsToSuggestedActivitiesOrNull = v4->_locationsToSuggestedActivitiesOrNull;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](locationsToSuggestedActivitiesOrNull, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[FCActivityManager _activitySuggestionClient](v4, "_activitySuggestionClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCActivityManager _updateActivitySuggestion:](v4, "_updateActivitySuggestion:", v9);
    v10 = v4->_locationsToSuggestedActivitiesOrNull;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v10, "objectForKey:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) != 0)
    v13 = 0;
  else
    v13 = (void *)objc_msgSend(v7, "copyWithZone:", 0);

  objc_sync_exit(v4);
  return v13;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](self->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  FCActivityManager *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[FCActivityManager description](self, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_213CA0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated active mode assertion: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  v14 = self;
  objc_sync_enter(v14);
  if ((BSEqualObjects() & 1) == 0)
    -[FCActivityManager _invalidateActiveModeAssertion](v14, "_invalidateActiveModeAssertion");
  -[FCActivityManager _updateWithActiveModeAssertionIfNecessary:stateUpdate:](v14, "_updateWithActiveModeAssertionIfNecessary:stateUpdate:", v9, v10);
  objc_sync_exit(v14);

}

- (void)modeSelectionService:(id)a3 didReceiveModesUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  FCActivityManager *v11;
  FCActivityDescribing *defaultActivity;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[FCActivityManager description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2050;
    v16 = objc_msgSend(v7, "count");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_213CA0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive all modes [%{public}lu] update: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  v11 = self;
  objc_sync_enter(v11);
  -[FCActivityManager _invalidateActiveModeAssertion](v11, "_invalidateActiveModeAssertion");
  defaultActivity = v11->_defaultActivity;
  v11->_defaultActivity = 0;

  -[FCActivityManager _updateActivitiesWithModes:](v11, "_updateActivitiesWithModes:", v7);
  objc_sync_exit(v11);

}

- (void)lifetimeDetailsProvider:(id)a3 didUpdateAvailableLifetimeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  FCActivityManager *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[FCActivityManager description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_213CA0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated available lifetime details: %{public}@", buf, 0x16u);

  }
  v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong((id *)&v11->_activeLifetimeDetailsCollection, a4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FCActivityManager _availableActivities](v11, "_availableActivities", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "supportsDiscreteLifetimes"))
          -[FCActivityManager _updateActivity:withLifetimeDetailsCollection:](v11, "_updateActivity:withLifetimeDetailsCollection:", v16, v11->_activeLifetimeDetailsCollection);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[FCActivityManager description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_213CA0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated activity suggestion: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[FCActivityManager _updateActivitySuggestion:](self, "_updateActivitySuggestion:", v5);

}

- (void)didShowSuggestedActivity:(id)a3 location:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCActivityManager _activitySuggestionClient](self, "_activitySuggestionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didShowConfiguredActivitySuggestionWithSuggestionUUID:location:", v9, a4 == 1);

  }
}

- (void)userDidSeeSuggestedActivity:(id)a3 location:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCActivityManager _activitySuggestionClient](self, "_activitySuggestionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidSeeConfiguredActivitySuggestionWithSuggestionUUID:location:", v9, a4 == 1);

  }
}

- (void)userDidAcceptSuggestedActivity:(id)a3 location:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCActivityManager _activitySuggestionClient](self, "_activitySuggestionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidAcceptConfiguredActivitySuggestionWithSuggestionUUID:location:", v9, a4 == 1);

  }
}

- (void)userDidRejectSuggestedActivity:(id)a3 location:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCActivityManager _activitySuggestionClient](self, "_activitySuggestionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidRejectConfiguredActivitySuggestionWithSuggestionUUID:location:", v9, a4 == 1);

  }
}

- (id)_modeSelectionService
{
  DNDModeSelectionService *modeSelectionService;
  DNDModeSelectionService *v4;
  DNDModeSelectionService *v5;

  modeSelectionService = self->_modeSelectionService;
  if (!modeSelectionService)
  {
    objc_msgSend(MEMORY[0x24BE2D6D0], "serviceForClientIdentifier:", CFSTR("com.apple.focus.activity-manager"));
    v4 = (DNDModeSelectionService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_modeSelectionService;
    self->_modeSelectionService = v4;

    modeSelectionService = self->_modeSelectionService;
  }
  return modeSelectionService;
}

- (id)_lifetimeDetailsProvider
{
  FCActivityManager *v2;
  DNDLifetimeDetailsProvider *v3;
  DNDLifetimeDetailsProvider *lifetimeDetailsProvider;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_lifetimeDescriptionsUpdatingEnabled && !v2->_lifetimeDetailsProvider)
  {
    v3 = (DNDLifetimeDetailsProvider *)objc_alloc_init(MEMORY[0x24BE2D750]);
    lifetimeDetailsProvider = v2->_lifetimeDetailsProvider;
    v2->_lifetimeDetailsProvider = v3;

    -[DNDLifetimeDetailsProvider setDelegate:](v2->_lifetimeDetailsProvider, "setDelegate:", v2);
  }
  objc_sync_exit(v2);

  return v2->_lifetimeDetailsProvider;
}

- (id)_stateService
{
  DNDStateService *stateService;
  DNDStateService *v4;
  DNDStateService *v5;

  stateService = self->_stateService;
  if (!stateService)
  {
    objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", CFSTR("com.apple.focus.activity-manager"));
    v4 = (DNDStateService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stateService;
    self->_stateService = v4;

    stateService = self->_stateService;
  }
  return stateService;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }

}

- (void)_updateCreationDateOfActivity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "activityIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = BSEqualStrings();

      if ((v6 & 1) == 0)
      {
        -[FCActivityManager _modeSelectionService](self, "_modeSelectionService");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "activityIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        objc_msgSend(v7, "modeConfigurationForModeIdentifier:error:", v8, &v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v15;

        if (v9)
        {
          objc_msgSend(v9, "created");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_setActivityCreationDate:", v11);

        }
        else
        {
          v12 = (void *)FCLogActivities;
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
            {
              v13 = v12;
              -[FCActivityManager description](self, "description");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v17 = v14;
              v18 = 2114;
              v19 = v4;
              v20 = 2114;
              v21 = v10;
              _os_log_error_impl(&dword_213CA0000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error requesting mode configuration: activity: %{public}@; error: %{public}@",
                buf,
                0x20u);

            }
          }
          else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
          {
            -[FCActivityManager _updateCreationDateOfActivity:].cold.1();
          }
        }

      }
    }
  }

}

- (void)_notifyObserversOfAvailableActivitiesChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke;
  v2[3] = &unk_24D0E1260;
  v2[4] = self;
  -[FCActivityManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_availableActivitiesDidChangeForManager_, v2);
}

void __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke_cold_1(a1, v4, (uint64_t)v3);
  objc_msgSend(v3, "availableActivitiesDidChangeForManager:", *(_QWORD *)(a1 + 32));

}

- (void)_updateActivitiesWithModes:(id)a3
{
  id v4;
  FCActivityManager *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _FCActivity *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSMutableDictionary allValues](v5->_allActivitiesByIdentifier, "allValues");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (!v6)
  {

    goto LABEL_32;
  }
  v7 = 0;
  v8 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v45 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "visibility");
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __48__FCActivityManager__updateActivitiesWithModes___block_invoke;
      v43[3] = &unk_24D0E1288;
      v43[4] = v10;
      objc_msgSend(v37, "bs_firstObjectPassingTest:", v43);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
        v15 = (objc_opt_respondsToSelector() & 1) != 0 && -[_FCActivity _updateMode:](v14, "_updateMode:", v10);
        v16 = v11 != 1 && v15;
        v7 |= v16;
        goto LABEL_21;
      }
      v14 = -[_FCActivity initWithMode:]([_FCActivity alloc], "initWithMode:", v10);
      -[FCActivityManager _updateCreationDateOfActivity:](v5, "_updateCreationDateOfActivity:", v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[_FCActivity supportsDiscreteLifetimes](v14, "supportsDiscreteLifetimes"))
        {
          if (v5->_activeLifetimeDetailsCollection)
            -[FCActivityManager _updateActivity:withLifetimeDetailsCollection:](v5, "_updateActivity:withLifetimeDetailsCollection:", v14);
        }
        else
        {
          -[FCActivityManager _updateLifetimesAlternativeDescriptionForActivity:](v5, "_updateLifetimesAlternativeDescriptionForActivity:", v14);
        }
      }
      v7 |= v11 != 1;
      if (v14)
      {
        LOBYTE(v15) = 1;
LABEL_21:
        if (v11 != 1)
          objc_msgSend(v34, "addObject:", v14);
        -[_FCActivity activityIdentifier](v14, "activityIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v14, v17);

        if (!v15)
        {
          v18 = (id)FCLogActivities;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            -[FCActivityManager description](v5, "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v19;
            v51 = 2114;
            v52 = v13;
            _os_log_debug_impl(&dword_213CA0000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Activity didn't change from cached value: %{public}@", buf, 0x16u);

          }
        }
      }

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
  {
    v20 = 1;
    goto LABEL_33;
  }
LABEL_32:
  v21 = -[NSArray count](v5->_availableActivities, "count");
  v20 = v21 != objc_msgSend(v34, "count");
LABEL_33:
  objc_storeStrong((id *)&v5->_allActivitiesByIdentifier, v36);
  objc_msgSend(v34, "sortUsingFunction:context:", _FCSortRealizedAndPlaceholderActivities, 0);
  -[FCActivityManager _setAvailableActivities:](v5, "_setAvailableActivities:", v34);
  -[FCActivityDescribing activityUniqueIdentifier](v5->_activeActivity, "activityUniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](v5, "_activityForUniqueIdentifier:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _updateActiveActivity:](v5, "_updateActiveActivity:", v23);

  if (v20)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__FCActivityManager__updateActivitiesWithModes___block_invoke_68;
    block[3] = &unk_24D0E12B0;
    block[4] = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v24 = (id)FCLogActivities;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[FCActivityManager description](v5, "description");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCActivityManager _updateActivitiesWithModes:].cold.1(v25, (uint64_t)buf, v24);
    }

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = (void *)-[NSMapTable copy](v5->_locationsToSuggestedActivitiesOrNull, "copy");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        -[NSMapTable objectForKey:](v5->_locationsToSuggestedActivitiesOrNull, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v31, "activityUniqueIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCActivityManager _activityForUniqueIdentifier:](v5, "_activityForUniqueIdentifier:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[FCActivityManager _updateSuggestedActivity:forLocation:](v5, "_updateSuggestedActivity:forLocation:", v33, objc_msgSend(v30, "integerValue"));
        }

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v27);
  }

  objc_sync_exit(v5);
}

uint64_t __48__FCActivityManager__updateActivitiesWithModes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  return v5;
}

uint64_t __48__FCActivityManager__updateActivitiesWithModes___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfAvailableActivitiesChange");
}

- (void)_setAvailableActivities:(id)a3
{
  FCActivityManager *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_availableActivities != v6)
    objc_storeStrong((id *)&v5->_availableActivities, a3);
  objc_sync_exit(v5);

}

- (void)_invalidateActiveModeAssertion
{
  DNDModeAssertion *activeModeAssertion;
  FCActivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  activeModeAssertion = obj->_activeModeAssertion;
  obj->_activeModeAssertion = 0;

  obj->_activeModeAssertionIsValid = 0;
  objc_sync_exit(obj);

}

- (BOOL)_doesActivity:(id)a3 identifySameModeAsActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v9 = 1;
  }
  else if (v5)
  {
    objc_msgSend(v5, "activityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateWithActiveModeAssertionIfNecessary:(id)a3 stateUpdate:(id)a4
{
  id v7;
  id v8;
  FCActivityManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v9->_activeModeAssertionIsValid)
  {
    v9->_activeModeAssertionIsValid = 1;
    v10 = (id)FCLogActivities;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[FCActivityManager description](v9, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_213CA0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating active mode assertion: %{public}@", (uint8_t *)&v15, 0x16u);

    }
    objc_storeStrong((id *)&v9->_activeModeAssertion, a3);
    objc_storeStrong((id *)&v9->_activeStateUpdate, a4);
    if (v7)
    {
      objc_msgSend(v7, "details");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCActivityManager _activityForModeIdentifier:](v9, "_activityForModeIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[FCActivityManager _updateActiveActivity:](v9, "_updateActiveActivity:", v14);
    -[FCActivityManager _updateLifetimeForActiveActivity](v9, "_updateLifetimeForActiveActivity");

  }
  objc_sync_exit(v9);

}

- (void)_updateActiveModeAssertionIfNecessary
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_213CA0000, v6, v4, "[%{public}@] Encountered error requesting active activity: %{public}@", v5);

  OUTLINED_FUNCTION_19();
}

- (void)_updateLifetimeForActiveActivity
{
  FCActivityManager *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  FCActivityDescribing *activeActivity;
  void *v10;
  DNDModeAssertion *activeModeAssertion;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  DNDModeAssertion *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_activeModeAssertion)
  {
    -[FCActivityManager _lifetimeDetailsProvider](v2, "_lifetimeDetailsProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDModeAssertion details](v2->_activeModeAssertion, "details");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "lifetimeDetailsForAssertionDetails:error:", v4, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;

    if (v5)
    {
      objc_msgSend(v5, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      -[FCActivityManager _lifetimeForLifetimeDetailsIdentifier:ofActivity:](v2, "_lifetimeForLifetimeDetailsIdentifier:ofActivity:", v7, v2->_activeActivity);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v6)
      {
        v8 = 0;
        goto LABEL_10;
      }
      v7 = (id)FCLogActivities;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[FCActivityManager description](v2, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        activeModeAssertion = v2->_activeModeAssertion;
        *(_DWORD *)buf = 138543874;
        v14 = v10;
        v15 = 2114;
        v16 = activeModeAssertion;
        v17 = 2114;
        v18 = v6;
        _os_log_error_impl(&dword_213CA0000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error requesting lifetime details for active mode assertion: activeModeAssertion: %{public}@; error: %{public}@",
          buf,
          0x20u);

      }
      v8 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  v5 = 0;
  v8 = 0;
LABEL_11:
  -[FCActivityManager _setLifetimeForActiveActivity:](v2, "_setLifetimeForActiveActivity:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[FCActivityDescribing supportsDiscreteLifetimes](v2->_activeActivity, "supportsDiscreteLifetimes"))
  {
    activeActivity = v2->_activeActivity;
    if (v2->_activeLifetimeDetailsCollection)
      -[FCActivityManager _updateActivity:withLifetimeDetailsCollection:](v2, "_updateActivity:withLifetimeDetailsCollection:", activeActivity);
    else
      -[FCActivityManager _updateActivity:withLifetimeDetails:](v2, "_updateActivity:withLifetimeDetails:", activeActivity, v5);
  }
  objc_sync_exit(v2);

}

- (void)_updateLifetimeForActiveActivityIfNecessary
{
  FCActivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_lifetimeOfActiveActivity)
    -[FCActivityManager _updateLifetimeForActiveActivity](obj, "_updateLifetimeForActiveActivity");
  objc_sync_exit(obj);

}

- (id)_lifetimeForActiveActivity
{
  -[FCActivityManager _updateActiveModeAssertionIfNecessary](self, "_updateActiveModeAssertionIfNecessary");
  -[FCActivityManager _updateLifetimeForActiveActivityIfNecessary](self, "_updateLifetimeForActiveActivityIfNecessary");
  return self->_lifetimeOfActiveActivity;
}

- (id)_activityForATXActivityOrSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "modeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = objc_opt_class();
    v13 = v6;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    objc_msgSend(v15, "uuidString");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v11, "length"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
    if (v16)
    {
      -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_activityForModeIdentifier:(id)a3
{
  id v4;
  FCActivityManager *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[FCActivityManager _availableActivities](v5, "_availableActivities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__FCActivityManager__activityForModeIdentifier___block_invoke;
    v9[3] = &unk_24D0E1288;
    v10 = v4;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __48__FCActivityManager__activityForModeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_activityForUniqueIdentifier:(id)a3
{
  id v4;
  FCActivityManager *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[FCActivityManager _availableActivities](v5, "_availableActivities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__FCActivityManager__activityForUniqueIdentifier___block_invoke;
    v9[3] = &unk_24D0E1288;
    v10 = v4;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __50__FCActivityManager__activityForUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_lifetimeForLifetimeDetailsIdentifier:(id)a3 ofActivity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    objc_msgSend(a4, "activityLifetimeDescriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__FCActivityManager__lifetimeForLifetimeDetailsIdentifier_ofActivity___block_invoke;
    v9[3] = &unk_24D0E12D8;
    v10 = v5;
    objc_msgSend(v7, "bs_firstObjectPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __70__FCActivityManager__lifetimeForLifetimeDetailsIdentifier_ofActivity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lifetimeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_updateActiveActivity:(id)a3
{
  FCActivityDescribing *v5;
  FCActivityManager *v6;
  NSObject *v7;
  void *v8;
  FCActivityDescribing *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  FCActivityDescribing *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (FCActivityDescribing *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_activeActivity != v5)
  {
    v7 = (id)FCLogActivities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FCActivityManager description](v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_213CA0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating active activity: %{public}@", buf, 0x16u);

    }
    v9 = v6->_activeActivity;
    objc_storeStrong((id *)&v6->_activeActivity, a3);
    if (!-[FCActivityManager _doesActivity:identifySameModeAsActivity:](v6, "_doesActivity:identifySameModeAsActivity:", v6->_activeActivity, v9))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__FCActivityManager__updateActiveActivity___block_invoke;
      block[3] = &unk_24D0E12B0;
      block[4] = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }

  }
  objc_sync_exit(v6);

}

uint64_t __43__FCActivityManager__updateActiveActivity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__FCActivityManager__updateActiveActivity___block_invoke_2;
  v7[3] = &unk_24D0E1260;
  v7[4] = v2;
  objc_msgSend(v2, "_enumerateObserversRespondingToSelector:usingBlock:", sel_activeActivityDidChangeForManager_, v7);
  v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __43__FCActivityManager__updateActiveActivity___block_invoke_79;
  v6[3] = &unk_24D0E1260;
  v6[4] = v4;
  return objc_msgSend(v4, "_enumerateObserversRespondingToSelector:usingBlock:", sel_activeModeDidChangeForManager_, v6);
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __43__FCActivityManager__updateActiveActivity___block_invoke_2_cold_1(a1, v4, (uint64_t)v3);
  objc_msgSend(v3, "activeActivityDidChangeForManager:", *(_QWORD *)(a1 + 32));

}

void __43__FCActivityManager__updateActiveActivity___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __43__FCActivityManager__updateActiveActivity___block_invoke_79_cold_1(a1, v4, (uint64_t)v3);
  objc_msgSend(v3, "activeModeDidChangeForManager:", *(_QWORD *)(a1 + 32));

}

- (id)_activeActivity
{
  -[FCActivityManager _updateActiveModeAssertionIfNecessary](self, "_updateActiveModeAssertionIfNecessary");
  return self->_activeActivity;
}

- (void)_setLifetimeForActiveActivity:(id)a3
{
  id v5;
  FCActivityManager *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((BSEqualObjects() & 1) == 0)
  {
    v7 = (id)FCLogActivities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FCActivityManager description](v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_213CA0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating lifetime of active activity: %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)&v6->_lifetimeOfActiveActivity, a3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke;
    block[3] = &unk_24D0E12B0;
    block[4] = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_sync_exit(v6);

}

uint64_t __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2;
  v3[3] = &unk_24D0E1260;
  v3[4] = v1;
  return objc_msgSend(v1, "_enumerateObserversRespondingToSelector:usingBlock:", sel_activeActivityLifetimeDidChangeForManager_, v3);
}

void __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2_cold_1(a1, v4, (uint64_t)v3);
  objc_msgSend(v3, "activeActivityLifetimeDidChangeForManager:", *(_QWORD *)(a1 + 32));

}

- (void)_setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSArray *v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  FCActivityManager *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  NSArray *availableActivities;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  NSArray *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  NSObject *v38;
  __int16 v39;
  NSArray *v40;
  __int16 v41;
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FCActivityManager _activeActivity](self, "_activeActivity");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 == v8)
  {
    -[FCActivityManager lifetimeOfActivity:](self, "lifetimeOfActivity:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v9)
      goto LABEL_21;
  }
  else
  {

  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke;
  v33[3] = &unk_24D0E1300;
  v33[4] = self;
  v13 = (NSArray *)v9;
  v34 = v13;
  v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199C0D0C](v33);
  if (v8)
  {
    v15 = self;
    objc_sync_enter(v15);
    -[FCActivityManager _availableActivities](v15, "_availableActivities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v8);

    v18 = (id)FCLogActivities;
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[FCActivityManager description](v15, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v20;
        v37 = 2114;
        v38 = v8;
        v39 = 2114;
        v40 = v13;
        v41 = 2114;
        v42 = v10;
        _os_log_impl(&dword_213CA0000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activating activity: activity: %{public}@; lifetime: %{public}@; reason: %{public}@",
          buf,
          0x2Au);

      }
      v32 = 0;
      v21 = ((uint64_t (**)(_QWORD, NSObject *, NSArray *, id *))v14)[2](v14, v8, v13, &v32);
      v19 = v32;
      if ((v21 & 1) == 0)
      {
        v22 = (id)FCLogActivities;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[FCActivityManager description](v15, "description");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v36 = v30;
          v37 = 2114;
          v38 = v8;
          v39 = 2114;
          v40 = v13;
          v41 = 2114;
          v42 = v19;
          _os_log_error_impl(&dword_213CA0000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error activating activity: activity: %{public}@; lifetime: %{public}@; error: %{public}@",
            buf,
            0x2Au);

        }
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[FCActivityManager description](v15, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      availableActivities = v15->_availableActivities;
      *(_DWORD *)buf = 138543874;
      v36 = v28;
      v37 = 2114;
      v38 = v8;
      v39 = 2114;
      v40 = availableActivities;
      _os_log_error_impl(&dword_213CA0000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Attempt to activate activity not in collection: activity: %{public}@; availableActivities: %{public}@",
        buf,
        0x20u);

    }
    objc_sync_exit(v15);
  }
  else
  {
    v23 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      -[FCActivityManager description](self, "description");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_213CA0000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating all activities: reason: %{public}@", buf, 0x16u);

    }
    v31 = 0;
    v26 = ((uint64_t (**)(_QWORD, _QWORD, NSArray *, id *))v14)[2](v14, 0, v13, &v31);
    v15 = (FCActivityManager *)v31;
    if ((v26 & 1) == 0)
    {
      v27 = (void *)FCLogActivities;
      if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
        -[FCActivityManager _setActiveActivity:withLifetime:reason:].cold.1(v27, self, (uint64_t)v15);
    }
  }

LABEL_21:
}

BOOL __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_modeSelectionService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v11 = 0;
LABEL_15:
    v22 = 0;
    objc_msgSend(v9, "activateModeWithDetails:error:", v11, &v22);
    v18 = v22;
    goto LABEL_16;
  }
  v10 = objc_alloc_init(MEMORY[0x24BE2D700]);
  v11 = v10;
  if (!v8)
  {
    objc_msgSend(v10, "setIdentifier:", CFSTR("com.apple.focus.activity-manager"));
    objc_msgSend(v7, "activityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModeIdentifier:", v20);

    objc_msgSend(v11, "setReason:", 1);
    objc_msgSend(MEMORY[0x24BE2D670], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x24BE2D5C8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v8, "lifetimeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v12);

  objc_msgSend(v7, "activityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModeIdentifier:", v13);

  objc_msgSend(v11, "setReason:", 1);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "_dndLifetimeDetails"), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v19 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
      __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke_cold_1(a1 + 32, v19);
    v17 = 0;
LABEL_12:
    v18 = 0;
    if (!v17)
      goto LABEL_14;
    goto LABEL_13;
  }
  v15 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 32), "_lifetimeDetailsProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v16, "lifetimeForLifetimeDetails:error:", v15, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;

  if (v17)
LABEL_13:
    objc_msgSend(v11, "setLifetime:", v17);
LABEL_14:

  if (!v18)
    goto LABEL_15;
LABEL_16:
  if (a4 && v18)
    *a4 = objc_retainAutorelease(v18);

  return v18 == 0;
}

- (void)_deactivateActivity:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  DNDModeAssertion *activeModeAssertion;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FCActivityManager _activeActivity](self, "_activeActivity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

    goto LABEL_3;
  }
  activeModeAssertion = self->_activeModeAssertion;

  if (!activeModeAssertion)
  {
LABEL_3:
    -[FCActivityManager _activeActivity](self, "_activeActivity");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)FCLogActivities;
    v11 = os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR);
    if (v9 == v6)
    {
      if (v11)
        -[FCActivityManager _deactivateActivity:reason:].cold.1(v10, self);
    }
    else if (v11)
    {
      -[FCActivityManager _deactivateActivity:reason:].cold.2();
    }
    goto LABEL_15;
  }
  -[FCActivityManager _modeSelectionService](self, "_modeSelectionService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[FCActivityManager description](self, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_213CA0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating active activity: reason: %{public}@", buf, 0x16u);

  }
  -[DNDModeAssertion UUID](self->_activeModeAssertion, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v13, "invalidateModeAssertionWithUUID:error:", v17, &v20);
  v19 = v20;

  if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
    -[FCActivityManager _deactivateActivity:reason:].cold.3();

LABEL_15:
}

- (void)_notifyObserversOfLifetimeChangeForActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke;
    v6[3] = &unk_24D0E1328;
    v6[4] = self;
    v5 = v4;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    -[FCActivityManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_activityManager_lifetimeDescriptionsDidChangeForActivity_, v6);

    v4 = v5;
  }

}

void __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke_cold_1(a1, v4, (uint64_t)v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
  objc_msgSend(v3, "activityManager:lifetimeDescriptionsDidChangeForActivity:", v5, v6);

}

- (void)_updateActivity:(id)a3 withLifetimeDescriptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "activityLifetimeDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualArrays();

    if ((v9 & 1) == 0)
    {
      v10 = (void *)FCLogActivities;
      if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        -[FCActivityManager description](self, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v12;
        v17 = 2114;
        v18 = v6;
        v19 = 2114;
        v20 = v7;
        _os_log_impl(&dword_213CA0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating lifetime descriptions for activity: activity: %{public}@; lifetime descriptions: %{public}@",
          buf,
          0x20u);

      }
      objc_msgSend(v6, "_setActivityLifetimeDescriptions:", v7);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__FCActivityManager__updateActivity_withLifetimeDescriptions___block_invoke;
      v13[3] = &unk_24D0E1350;
      v13[4] = self;
      v14 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v13);

    }
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    -[FCActivityManager _updateActivity:withLifetimeDescriptions:].cold.1();
  }

}

uint64_t __62__FCActivityManager__updateActivity_withLifetimeDescriptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfLifetimeChangeForActivity:", *(_QWORD *)(a1 + 40));
}

- (void)_updateActivity:(id)a3 withLifetimeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _FCActivityLifetime *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  FCActivityManager *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "activityLifetimeDescriptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
      v11 = v10;
      v20 = self;
      if (v10)
        v12 = v10;
      else
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v13 = v12;

      v14 = -[_FCActivityLifetime initWithLifetimeDetails:]([_FCActivityLifetime alloc], "initWithLifetimeDetails:", v8);
      if (objc_msgSend(v9, "count"))
      {
        v15 = 0;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lifetimeIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
            break;

          if (++v15 >= (unint64_t)objc_msgSend(v9, "count"))
            goto LABEL_13;
        }
        objc_msgSend(v13, "setObject:atIndexedSubscript:", v14, v15);

      }
      else
      {
LABEL_13:
        objc_msgSend(v13, "addObject:", v14);
      }
      -[FCActivityManager _updateActivity:withLifetimeDescriptions:](v20, "_updateActivity:withLifetimeDescriptions:", v6, v13);

    }
    else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
    {
      -[FCActivityManager _updateActivity:withLifetimeDescriptions:].cold.1();
    }
  }

}

- (void)_updateActivity:(id)a3 withLifetimeDetailsCollection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _FCActivityLifetime *v15;
  _FCActivityLifetime *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          v15 = [_FCActivityLifetime alloc];
          v16 = -[_FCActivityLifetime initWithLifetimeDetails:](v15, "initWithLifetimeDetails:", v14, (_QWORD)v17);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[FCActivityManager _updateActivity:withLifetimeDescriptions:](self, "_updateActivity:withLifetimeDescriptions:", v6, v8);
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    -[FCActivityManager _updateActivity:withLifetimeDescriptions:].cold.1();
  }

}

- (void)_updateLifetimesAlternativeDescription:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  FCActivityManager *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = objc_opt_class();
    v10 = v7;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v12, "activityLifetimesAlternativeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualStrings();

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v10, "_setActivityLifetimesAlternativeDescription:", v6);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__FCActivityManager__updateLifetimesAlternativeDescription_forActivity___block_invoke;
      v15[3] = &unk_24D0E1350;
      v15[4] = v8;
      v16 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v15);

    }
    objc_sync_exit(v8);

  }
}

uint64_t __72__FCActivityManager__updateLifetimesAlternativeDescription_forActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfLifetimeChangeForActivity:", *(_QWORD *)(a1 + 40));
}

- (void)_updateLifetimesAlternativeDescriptionForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isSleepActivity"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_ACTIVATE_ON_SCHEDULE"), &stru_24D0E1520, CFSTR("Focus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCActivityManager _updateLifetimesAlternativeDescription:forActivity:](self, "_updateLifetimesAlternativeDescription:forActivity:", v6, v4);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isDrivingActivity"))
  {
    -[FCActivityManager _carDNDStatus](self, "_carDNDStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke;
    v8[3] = &unk_24D0E1378;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "fetchAutomaticDNDTriggerPreferenceWithReply:", v8);

  }
}

void __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
      __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_localizedAutomaticDrivingTriggerDescriptionForPreference:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateLifetimesAlternativeDescription:forActivity:", v8, *(_QWORD *)(a1 + 40));

  }
}

- (void)_updateLifetimesAlternativeDescriptionsForAvailableActivities
{
  FCActivityManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[FCActivityManager _availableActivities](v2, "_availableActivities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[FCActivityManager _updateLifetimesAlternativeDescriptionForActivity:](v2, "_updateLifetimesAlternativeDescriptionForActivity:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_isSyncedAssertion:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_activitySuggestionClient
{
  ATXActivitySuggestionClient *activitySuggestionClient;
  ATXActivitySuggestionClient *v4;
  ATXActivitySuggestionClient *v5;

  activitySuggestionClient = self->_activitySuggestionClient;
  if (!activitySuggestionClient)
  {
    objc_msgSend(MEMORY[0x24BE040E8], "sharedInstance");
    v4 = (ATXActivitySuggestionClient *)objc_claimAutoreleasedReturnValue();
    v5 = self->_activitySuggestionClient;
    self->_activitySuggestionClient = v4;

    -[ATXActivitySuggestionClient registerObserver:sendingInitialChangeNotification:](self->_activitySuggestionClient, "registerObserver:sendingInitialChangeNotification:", self, 1);
    activitySuggestionClient = self->_activitySuggestionClient;
  }
  return activitySuggestionClient;
}

- (void)_updateSuggestedActivity:(id)a3 forLocation:(int64_t)a4
{
  id v6;
  FCActivityManager *v7;
  NSMapTable *locationsToSuggestedActivitiesOrNull;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSMapTable *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  NSMapTable *v22;
  void *v23;
  _QWORD v24[6];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  locationsToSuggestedActivitiesOrNull = v7->_locationsToSuggestedActivitiesOrNull;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](locationsToSuggestedActivitiesOrNull, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
    v12 = 0;
  else
    v12 = v10;
  v13 = v12;

  if ((BSEqualObjects() & 1) == 0)
  {
    if (v6 && !v7->_locationsToSuggestedActivitiesOrNull)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v7->_locationsToSuggestedActivitiesOrNull;
      v7->_locationsToSuggestedActivitiesOrNull = (NSMapTable *)v14;

    }
    v16 = (id)FCLogActivities;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[FCActivityManager description](v7, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("[unknown]");
      if (a4 == 1)
        v18 = CFSTR("prominent");
      if (!a4)
        v18 = CFSTR("unobtrusive");
      v19 = v18;
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_213CA0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating suggested activity: %{public}@ (%{public}@)", buf, 0x20u);

    }
    if (v6)
    {
      v20 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    v22 = v7->_locationsToSuggestedActivitiesOrNull;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v22, "setObject:forKey:", v21, v23);

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke;
    v24[3] = &unk_24D0E13C8;
    v24[4] = v7;
    v24[5] = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], v24);

  }
  objc_sync_exit(v7);

}

uint64_t __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2;
  v3[3] = &unk_24D0E13A0;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_enumerateObserversRespondingToSelector:usingBlock:", sel_activityManager_suggestedActivityDidChangeForLocation_, v3);
}

void __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
    __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2_cold_1(a1, v4);
  objc_msgSend(v3, "activityManager:suggestedActivityDidChangeForLocation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_updateSuggestedActivity:(id)a3 forLocations:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;

  v7 = 0;
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    if ((v9 & 1) != 0)
      v11 = 1;
    else
      v11 = v7;
    if ((v11 & a4) != 0)
      -[FCActivityManager _updateSuggestedActivity:forLocation:](self, "_updateSuggestedActivity:forLocation:", a3, v8);
    v9 = 0;
    v7 = 2;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
}

- (void)_updateActivitySuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  -[FCActivityManager _activityForATXActivityOrSuggestion:](self, "_activityForATXActivityOrSuggestion:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
      -[FCActivityManager _updateActivitySuggestion:].cold.1();
    goto LABEL_7;
  }
  v6 = (void *)v5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    v7 = 3;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v4, "location");
LABEL_9:
  -[FCActivityManager _updateSuggestedActivity:forLocations:](self, "_updateSuggestedActivity:forLocations:", v6, v7);

}

- (id)_localizedAutomaticDrivingTriggerDescriptionForPreference:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 > 2)
    v3 = 0;
  else
    v3 = *(&off_24D0E1428 + a3);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24D0E1520, CFSTR("Focus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_drivingTriggerDidChange
{
  void *v3;
  NSObject *v4;
  void *v5;
  FCActivityManager *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCActivityManager description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_213CA0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Driving trigger did change", (uint8_t *)&v9, 0xCu);

  }
  v6 = self;
  objc_sync_enter(v6);
  -[FCActivityManager _availableActivities](v6, "_availableActivities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_113);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _updateLifetimesAlternativeDescriptionForActivity:](v6, "_updateLifetimesAlternativeDescriptionForActivity:", v8);

  objc_sync_exit(v6);
}

uint64_t __45__FCActivityManager__drivingTriggerDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isDrivingActivity");
  else
    v3 = 0;

  return v3;
}

- (id)_carDNDStatus
{
  CARAutomaticDNDStatus *v3;
  CARAutomaticDNDStatus *carDNDStatus;

  if (self->_lifetimeDescriptionsUpdatingEnabled && !self->_carDNDStatus)
  {
    v3 = (CARAutomaticDNDStatus *)objc_alloc_init(MEMORY[0x24BE15218]);
    carDNDStatus = self->_carDNDStatus;
    self->_carDNDStatus = v3;

  }
  return self->_carDNDStatus;
}

- (void)_setDefaultActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isLifetimeDescriptionsUpdatingEnabled
{
  return self->_lifetimeDescriptionsUpdatingEnabled;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultActivity, 0);
  objc_storeStrong((id *)&self->_activeActivity, 0);
  objc_storeStrong((id *)&self->_availableActivities, 0);
  objc_storeStrong((id *)&self->_carDNDStatus, 0);
  objc_storeStrong((id *)&self->_locationsToSuggestedActivitiesOrNull, 0);
  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
  objc_storeStrong((id *)&self->_lifetimeOfActiveActivity, 0);
  objc_storeStrong((id *)&self->_activeLifetimeDetailsCollection, 0);
  objc_storeStrong((id *)&self->_allActivitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_activeStateUpdate, 0);
  objc_storeStrong((id *)&self->_activeModeAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_lifetimeDetailsProvider, 0);
  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

- (id)activityWithIdentifier:(id)a3
{
  id v4;
  FCActivityManager *v5;
  NSMutableDictionary *allActivitiesByIdentifier;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13[5];

  v13[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    allActivitiesByIdentifier = v5->_allActivitiesByIdentifier;
    if (!allActivitiesByIdentifier)
    {
      -[FCActivityManager _modeSelectionService](v5, "_modeSelectionService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = 0;
      objc_msgSend(v7, "allModesWithError:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13[0];
      if (v9)
      {
        v10 = (id)FCLogActivities;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[FCActivityManager description](v5, "description");
          objc_claimAutoreleasedReturnValue();
          -[FCActivityManager _availableActivities].cold.1();
        }
      }
      else
      {
        objc_msgSend(v8, "allObjects");
        v10 = objc_claimAutoreleasedReturnValue();
        -[FCActivityManager _updateActivitiesWithModes:](v5, "_updateActivitiesWithModes:", v10);
      }

      allActivitiesByIdentifier = v5->_allActivitiesByIdentifier;
    }
    -[NSMutableDictionary objectForKey:](allActivitiesByIdentifier, "objectForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)newActivityManagerWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:", v4);

  return v5;
}

+ (id)newActivityManager
{
  return (id)objc_msgSend(a1, "newActivityManagerWithIdentifier:", CFSTR("DEFAULT"));
}

- (void)setActiveActivity:(id)a3
{
  -[FCActivityManager setActiveActivity:reason:](self, "setActiveActivity:reason:", a3, CFSTR("[NO REASON PROVIDED]"));
}

- (void)setActiveActivity:(id)a3 reason:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "activityUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[FCActivityManager _setActiveActivity:withLifetime:reason:](self, "_setActiveActivity:withLifetime:reason:", v8, 0, v6);
}

- (void)setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "activityUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager _activityForUniqueIdentifier:](self, "_activityForUniqueIdentifier:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lifetimeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCActivityManager _lifetimeForLifetimeDetailsIdentifier:ofActivity:](self, "_lifetimeForLifetimeDetailsIdentifier:ofActivity:", v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCActivityManager _setActiveActivity:withLifetime:reason:](self, "_setActiveActivity:withLifetime:reason:", v13, v12, v8);
}

- (void)promotePlaceholderActivity:(id)a3
{
  DNDModeSelectionService *modeSelectionService;
  void *v4;
  uint64_t v5;

  modeSelectionService = self->_modeSelectionService;
  objc_msgSend(a3, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  -[DNDModeSelectionService promotePlaceholderWithModeIdentifier:error:](modeSelectionService, "promotePlaceholderWithModeIdentifier:error:", v4, &v5);

}

void __41__FCActivityManager__initWithIdentifier___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_22(&dword_213CA0000, v3, v5, "[%{public}@] Added selection update listener", (uint8_t *)&v6);

  OUTLINED_FUNCTION_13();
}

void __41__FCActivityManager__initWithIdentifier___block_invoke_cold_2(uint64_t a1, void *a2)
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

  OUTLINED_FUNCTION_23(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v4, v5, "[%{public}@] Error adding selection update listener: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)setActivity:(void *)a1 active:(void *)a2 withLifetime:reason:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(&dword_213CA0000, v5, v6, "[%{public}@] Activating a nil activity isn't permitted – ignoring", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_13();
}

- (void)_updateCreationDateOfActivity:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_213CA0000, v0, v3, "[%{public}@] Failed to obtain mode configuration for activity: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

void __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  v5 = OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %p"), OUTLINED_FUNCTION_16(), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_10(&dword_213CA0000, v5, v8, "[%{public}@] Notifying observer of available activities change: %{public}@", v9);

  OUTLINED_FUNCTION_11();
}

- (void)_updateActivitiesWithModes:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_22(&dword_213CA0000, a3, (uint64_t)a3, "[%{public}@] Available activities didn't change from cached value", (uint8_t *)a2);

  OUTLINED_FUNCTION_19();
}

- (void)_availableActivities
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_213CA0000, v6, v4, "[%{public}@] Encountered error requesting available activities: %{public}@", v5);

  OUTLINED_FUNCTION_19();
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  v5 = OUTLINED_FUNCTION_15(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  v15 = OUTLINED_FUNCTION_16();
  v16 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_213CA0000, v9, v10, "[%{public}@] Notifying observer of active activity change: observer: %{public}@; active activity: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);

  OUTLINED_FUNCTION_6();
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_79_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  v5 = OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %p"), OUTLINED_FUNCTION_16(), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_10(&dword_213CA0000, v5, v8, "[%{public}@] [Deprecated] Notifying observer of active mode change: %{public}@", v9);

  OUTLINED_FUNCTION_11();
}

void __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  v5 = OUTLINED_FUNCTION_15(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  v15 = OUTLINED_FUNCTION_16();
  v16 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_213CA0000, v9, v10, "[%{public}@] Notifying observer of active lifetime change: observer: %{public}@; lifetime: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);

  OUTLINED_FUNCTION_6();
}

- (void)_setActiveActivity:(void *)a1 withLifetime:(void *)a2 reason:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_3(&dword_213CA0000, v5, v7, "[%{public}@] Encountered error deactivating all activites: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1();
}

void __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v5, v6, "[%{public}@] Failed to retrieve dndLifetimeDetails from provided lifetime: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_deactivateActivity:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(&dword_213CA0000, v5, v6, "[%{public}@] Encountered error deactivating activity: no active mode assertion", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_13();
}

- (void)_deactivateActivity:reason:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v3, v4, "[%{public}@] Encountered error deactivating activity: '%{public}@' isn't the active activity", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_deactivateActivity:reason:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v3, v4, "[%{public}@] Encountered error deactivating activity: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  v5 = OUTLINED_FUNCTION_15(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  v15 = OUTLINED_FUNCTION_16();
  v16 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_213CA0000, v9, v10, "[%{public}@] Notifying observer of lifetime descriptions change for activity: observer: %{public}@; activity: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);

  OUTLINED_FUNCTION_6();
}

- (void)_updateActivity:withLifetimeDescriptions:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v3, v4, "[%{public}@] Lifetime descriptions can't be updated for activity: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  NSObject *v5;
  void *v6;
  __int16 v7;
  uint8_t v8[22];
  __int16 v9;
  uint64_t v10;

  v5 = OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  v9 = v7;
  v10 = a3;
  _os_log_error_impl(&dword_213CA0000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error fetching car automatic DND preference: activity: %{public}@; error: %{public}@",
    v8,
    0x20u);

  OUTLINED_FUNCTION_11();
}

void __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_23(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_213CA0000, v2, v4, "[%{public}@] Notifying observer of suggested activity change: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_updateActivitySuggestion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_213CA0000, v3, v4, "[%{public}@] Failed to find activity for suggestion: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
