@implementation IMCloudKitEventNotificationManager

- (void)visitEventHandlers:(id)a3
{
  -[IMWeakReferenceCollection enumerateObjectsUsingBlock:](self->_eventHandlers, "enumerateObjectsUsingBlock:", a3);
}

- (id)syncStateWithDictionary:(id)a3
{
  id v4;
  IMCloudKitSyncState *v5;

  v4 = a3;
  v5 = -[IMCloudKitSyncState initWithAccountEnabled:stateDictionary:]([IMCloudKitSyncState alloc], "initWithAccountEnabled:stateDictionary:", -[IMCloudKitEventNotificationManager accountHasiMessageEnabled](self, "accountHasiMessageEnabled"), v4);

  return v5;
}

- (void)setProgressPollingInterval:(double)a3
{
  self->_progressPollingInterval = a3;
}

- (void)setPreviousState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (IMCloudKitEventNotificationManager)init
{
  IMCloudKitEventNotificationManager *v2;
  IMCloudKitEventNotificationManager *v3;
  IMWeakReferenceCollection *v4;
  IMWeakReferenceCollection *eventHandlers;
  IMEventNotificationManager *v6;
  IMEventNotificationManager *notificationManager;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMCloudKitEventNotificationManager;
  v2 = -[IMCloudKitEventNotificationManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_progressPollingInterval = 30.0;
    v4 = (IMWeakReferenceCollection *)objc_alloc_init(MEMORY[0x1E0D39B98]);
    eventHandlers = v3->_eventHandlers;
    v3->_eventHandlers = v4;

    v6 = (IMEventNotificationManager *)objc_alloc_init(MEMORY[0x1E0D39838]);
    notificationManager = v3->_notificationManager;
    v3->_notificationManager = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__syncStateDidChange_, CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), 0);

  }
  return v3;
}

- (void)fetchSyncState
{
  id v2;

  -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastCloudKitState");

}

- (NSTimer)fetchStatsTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_fetchStatsTimer);
}

- (id)cloudKitHooks
{
  return +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
}

- (IMCloudKitEventHandlerAccountInfoProvider)accountInfoProvider
{
  return (IMCloudKitEventHandlerAccountInfoProvider *)objc_loadWeakRetained((id *)&self->_accountInfoProvider);
}

- (BOOL)accountHasiMessageEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[IMCloudKitEventNotificationManager accountInfoProvider](self, "accountInfoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[IMCloudKitEventNotificationManager accountInfoProvider](self, "accountInfoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cloudKitEventNotificationManagerAccountHasiMessageEnabled:", self);

  return v5;
}

- (void)_updateProgressWithState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  -[IMCloudKitEventNotificationManager fetchStatsTimer](self, "fetchStatsTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Rescheduled sync progress: cancelled", v16, 2u);
    }

    -[IMCloudKitEventNotificationManager _cancelStatsFetchingTimer](self, "_cancelStatsFetchingTimer");
  }
  if (-[IMCloudKitEventNotificationManager _hasProgressEventListeners](self, "_hasProgressEventListeners"))
  {
    -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1A21965E0(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(v4, "createSyncProgressWithSyncStatistics:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCloudKitEventNotificationManager _sendProgressToEventListeners:](self, "_sendProgressToEventListeners:", v15);

  }
}

- (void)_syncStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCloudKitEventNotificationManager syncStateWithDictionary:](self, "syncStateWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMCloudKitEventNotificationManager setPreviousState:](self, "setPreviousState:", v5);
  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "received new sync state: %@", (uint8_t *)&v7, 0xCu);
  }

  -[IMCloudKitEventNotificationManager _sendSyncStateChangedEventToEventListeners:](self, "_sendSyncStateChangedEventToEventListeners:", v5);
  -[IMCloudKitEventNotificationManager _updateProgressWithState:](self, "_updateProgressWithState:", v5);

}

- (void)_sendSyncStateChangedEventToEventListeners:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A205B154;
  v6[3] = &unk_1E471F080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMCloudKitEventNotificationManager visitEventHandlers:](self, "visitEventHandlers:", v6);

}

- (BOOL)_hasProgressEventListeners
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A205CDB8;
  v4[3] = &unk_1E471F2A8;
  v4[4] = &v5;
  -[IMCloudKitEventNotificationManager visitEventHandlers:](self, "visitEventHandlers:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200BFE8;
  block[3] = &unk_1E471F058;
  block[4] = a1;
  if (qword_1ECF12418 != -1)
    dispatch_once(&qword_1ECF12418, block);
  return (id)qword_1EE65F348;
}

+ (id)logHandle
{
  if (qword_1ECF123D8 != -1)
    dispatch_once(&qword_1ECF123D8, &unk_1E471D558);
  return (id)qword_1ECF123F0;
}

+ (void)__setSingleton__im:(id)a3
{
  objc_storeStrong((id *)&qword_1EE65F348, a3);
}

- (void)addEventHandler:(id)a3
{
  -[IMWeakReferenceCollection addObject:](self->_eventHandlers, "addObject:", a3);
}

- (void)removeEventHandler:(id)a3
{
  -[IMWeakReferenceCollection removeObject:](self->_eventHandlers, "removeObject:", a3);
}

- (IMCloudKitSyncState)syncState
{
  IMCloudKitSyncState *v3;
  IMCloudKitSyncState *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  -[IMCloudKitEventNotificationManager previousState](self, "previousState");
  v3 = (IMCloudKitSyncState *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [IMCloudKitSyncState alloc];
    v5 = -[IMCloudKitEventNotificationManager accountHasiMessageEnabled](self, "accountHasiMessageEnabled");
    -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncStateDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[IMCloudKitSyncState initWithAccountEnabled:stateDictionary:](v4, "initWithAccountEnabled:stateDictionary:", v5, v7);

  }
  return v3;
}

- (void)fetchSyncStateAfterFetchingAccountStatus
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Requesting to broadcast CloudKit syncState after fetching account status", v5, 2u);
    }

  }
  -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcastCloudKitStateAfterFetchingAccountStatus");

}

- (void)fetchSyncStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A205B33C;
  v8[3] = &unk_1E471F0C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471DCD8, v8);

}

- (void)fetchRampStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createEventListenerForNotificationName:object:", CFSTR("IMCloudKitFetchedRampStateNotification"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A205B538;
  v8[3] = &unk_1E471F0F0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471C2D0, v8);

}

- (void)fetchSyncStateAfterClearingErrors
{
  void *v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagesIniCloudVersion2");

  if ((v4 & 1) == 0)
  {
    -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "broadcastCloudKitStateAfterClearingErrors");

  }
}

- (void)fetchSyncStateAfterClearingErrorsWithRepairSuccess:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMessagesIniCloudVersion2");

  if ((v8 & 1) == 0)
  {
    -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A205B7EC;
    v11[3] = &unk_1E471F118;
    v11[4] = self;
    v12 = v6;
    v13 = a3;
    objc_msgSend(v10, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471BA00, v11);

  }
}

- (void)setCloudKitSyncEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "set messages in cloud enabled: %@", buf, 0xCu);
    }

  }
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A205BC04;
  v9[3] = &unk_1E471F180;
  v10 = v3;
  objc_msgSend(v8, "startListeningForEventTarget:sendStartingEvent:completion:", self, v9, &unk_1E471DD58);

}

- (void)setCloudKitSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  BOOL v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "set messages in cloud enabled: %@", buf, 0xCu);
  }

  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A205BDC4;
  v14[3] = &unk_1E471F180;
  v15 = v4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1A205BE04;
  v12[3] = &unk_1E471F0F0;
  v11 = v6;
  objc_msgSend(v10, "startListeningForEventTarget:sendStartingEvent:completion:", self, v14, v12);

}

- (void)startPeriodicSync
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "beginning periodic sync", v5, 2u);
    }

  }
  -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiatePeriodicSync");

}

- (void)startUserInitiatedSync
{
  id v2;

  -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUserInitiatedSync");

}

- (void)startInitialSync
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "beginning initial sync", v5, 2u);
  }

  -[IMCloudKitEventNotificationManager cloudKitHooks](self, "cloudKitHooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiateSync:forceRunNow:reply:", CFSTR("initial"), 1, &unk_1E471C450);

}

- (BOOL)didPromptForCloudKitSync
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HasPromptedForMessagesInCloud"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDidPromptForCloudKitSync:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "set did prompt for cloud kit sync to %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, CFSTR("HasPromptedForMessagesInCloud"));

}

- (void)disableAllSyncEnabledCloudKitDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "attempting to disable all icloud devices", v6, 2u);
    }

  }
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.tryToDisableAllDevicesReturned"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471F1C0, &unk_1E471C490);
}

- (void)performAdditionalStorageRequiredCheck
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Check if additional storage is required", v6, 2u);
    }

  }
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createEventListenerForNotificationName:object:", CFSTR("com.apple.IMCore.IMCloudKitHooks.AdditionalStorageCheckReturned"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471DE58, &unk_1E471BB00);
}

- (void)_fetchSyncStateStatistics:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, void *);
  void *v20;
  IMCloudKitEventNotificationManager *v21;
  id v22;

  v4 = a3;
  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1A21963F4(v5, v6, v7, v8, v9, v10, v11, v12);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_1A205C950;
  v20 = &unk_1E471F0C8;
  v21 = self;
  v22 = v4;
  v13 = v4;
  v14 = _Block_copy(&v17);
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createEventListenerForNotificationName:object:", CFSTR("IMCloudKitFetchedSyncStatsNotification"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "startListeningForEventTarget:sendStartingEvent:completion:", self, &unk_1E471F208, v14);
}

- (void)_sendSyncStatisticsToEventHandlers:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A205CB74;
  v10[3] = &unk_1E471F230;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IMCloudKitEventNotificationManager visitEventHandlers:](self, "visitEventHandlers:", v10);

}

- (void)fetchSyncStateStatistics
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1A205CC14;
  v2[3] = &unk_1E471F258;
  v2[4] = self;
  -[IMCloudKitEventNotificationManager _fetchSyncStateStatistics:](self, "_fetchSyncStateStatistics:", v2);
}

- (void)fetchSyncStateStatisticsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A205CC9C;
  v6[3] = &unk_1E471F280;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMCloudKitEventNotificationManager _fetchSyncStateStatistics:](self, "_fetchSyncStateStatistics:", v6);

}

- (void)_cancelStatsFetchingTimer
{
  void *v3;
  id v4;

  -[IMCloudKitEventNotificationManager fetchStatsTimer](self, "fetchStatsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");
    -[IMCloudKitEventNotificationManager setFetchStatsTimer:](self, "setFetchStatsTimer:", 0);
    v3 = v4;
  }

}

- (void)_timerExpiredForSyncStatsFetching:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Rescheduled sync progress: firing", v5, 2u);
  }

  -[IMCloudKitEventNotificationManager fetchSyncState](self, "fetchSyncState");
  -[IMCloudKitEventNotificationManager setFetchStatsTimer:](self, "setFetchStatsTimer:", 0);
}

- (void)_rescheduleFetchSyncProgress
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMCloudKitEventNotificationManager fetchStatsTimer](self, "fetchStatsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[IMCloudKitEventNotificationManager progressPollingInterval](self, "progressPollingInterval");
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Rescheduled sync progress pending (interval %f secs)", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    -[IMCloudKitEventNotificationManager _cancelStatsFetchingTimer](self, "_cancelStatsFetchingTimer");
    -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMCloudKitEventNotificationManager progressPollingInterval](self, "progressPollingInterval");
      v9 = 134217984;
      v10 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Rescheduled sync progress for %f seconds in the future", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0C99E88];
    -[IMCloudKitEventNotificationManager progressPollingInterval](self, "progressPollingInterval");
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerExpiredForSyncStatsFetching_, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    -[IMCloudKitEventNotificationManager setFetchStatsTimer:](self, "setFetchStatsTimer:", v4);
  }

}

- (double)progressBroadcastDelay
{
  return 1.0;
}

- (void)_sendProgressToEventListenersDeferred
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[IMCloudKitEventNotificationManager progressToSend](self, "progressToSend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCloudKitEventNotificationManager setProgressToSend:](self, "setProgressToSend:", 0);
  -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Sending progress to event handlers: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A205D084;
  v6[3] = &unk_1E471F080;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[IMCloudKitEventNotificationManager visitEventHandlers:](self, "visitEventHandlers:", v6);

}

- (void)_sendProgressToEventListeners:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[IMCloudKitEventNotificationManager setProgressToSend:](self, "setProgressToSend:", v4);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMessagesIniCloudVersion2");

  if (v6)
  {
    -[IMCloudKitEventNotificationManager _sendProgressToEventListenersDeferred](self, "_sendProgressToEventListenersDeferred");
  }
  else
  {
    -[IMCloudKitEventNotificationManager progressBroadcastDelay](self, "progressBroadcastDelay");
    v8 = v7;
    objc_msgSend(v4, "broadcastDeferralOverride");
    if (v8 <= v9)
      objc_msgSend(v4, "broadcastDeferralOverride");
    else
      -[IMCloudKitEventNotificationManager progressBroadcastDelay](self, "progressBroadcastDelay");
    v11 = v10;
    -[IMCloudKitEventNotificationManager logHandle](self, "logHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1A2196570(v12, v11, v13, v14);

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__sendProgressToEventListenersDeferred, 0);
    -[IMCloudKitEventNotificationManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__sendProgressToEventListenersDeferred, 0, v11);
  }

}

- (void)_sendHiddenProgressToEventListeners
{
  IMCloudKitSyncProgress *v3;

  v3 = -[IMCloudKitSyncProgress initWithType:syncState:syncStatistics:]([IMCloudKitSyncProgress alloc], "initWithType:syncState:syncStatistics:", 2, 0, 0);
  -[IMCloudKitEventNotificationManager _sendProgressToEventListeners:](self, "_sendProgressToEventListeners:", v3);

}

- (void)fetchSyncDebuggingInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Fetching sync state debugging info…", buf, 2u);
    }

  }
  -[IMCloudKitEventNotificationManager notificationManager](self, "notificationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createEventListenerForNotificationName:object:", CFSTR("IMCloudKitFetchedSyncDebuggingInfoNotification"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A205D5EC;
  v9[3] = &unk_1E471F2F8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "startListeningForEventTarget:sendStartingEvent:completion:", self, v9, &unk_1E471DED8);

}

- (void)setAccountInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_accountInfoProvider, a3);
}

- (double)progressPollingInterval
{
  return self->_progressPollingInterval;
}

- (IMWeakReferenceCollection)eventHandlers
{
  return (IMWeakReferenceCollection *)objc_getProperty(self, a2, 24, 1);
}

- (IMEventNotificationManager)notificationManager
{
  return (IMEventNotificationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setFetchStatsTimer:(id)a3
{
  objc_storeWeak((id *)&self->_fetchStatsTimer, a3);
}

- (IMCloudKitSyncState)previousState
{
  return (IMCloudKitSyncState *)objc_getProperty(self, a2, 48, 1);
}

- (IMCloudKitSyncProgress)progressToSend
{
  return (IMCloudKitSyncProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressToSend:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressToSend, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_destroyWeak((id *)&self->_fetchStatsTimer);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_destroyWeak((id *)&self->_accountInfoProvider);
}

@end
