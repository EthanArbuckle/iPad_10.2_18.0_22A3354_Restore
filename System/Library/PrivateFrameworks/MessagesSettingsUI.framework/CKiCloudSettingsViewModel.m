@implementation CKiCloudSettingsViewModel

- (CKiCloudSettingsViewModel)init
{
  CKiCloudSettingsViewModel *v2;
  CKiCloudSettingsViewModel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKiCloudSettingsViewModel;
  v2 = -[CKiCloudSettingsViewModel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKiCloudSettingsViewModel _internalInit](v2, "_internalInit");
  return v3;
}

- (void)_internalInit
{
  CKKeepMessagesPreferenceManager *v3;
  CKKeepMessagesPreferenceManager *keepMessagesPreferenceManager;
  CKiCloudSettingsSyncController *v5;
  uint64_t v6;
  CKiCloudSettingsSyncController *v7;
  CKiCloudSettingsSyncController *syncController;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id iCloudMessagingObserverToken;
  void *v16;
  id v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v3 = objc_alloc_init(CKKeepMessagesPreferenceManager);
  keepMessagesPreferenceManager = self->_keepMessagesPreferenceManager;
  self->_keepMessagesPreferenceManager = v3;

  -[CKKeepMessagesPreferenceManager addSyncedSettingObserver:selector:key:](self->_keepMessagesPreferenceManager, "addSyncedSettingObserver:selector:key:", self, sel__syncedSettingsDidChange_, 0);
  location = 0;
  objc_initWeak(&location, self);
  v5 = [CKiCloudSettingsSyncController alloc];
  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __42__CKiCloudSettingsViewModel__internalInit__block_invoke;
  v24[3] = &unk_2511BD358;
  objc_copyWeak(&v25, &location);
  v7 = -[CKiCloudSettingsSyncController initWithSyncStatusHandler:](v5, "initWithSyncStatusHandler:", v24);
  syncController = self->_syncController;
  self->_syncController = v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = (uint64_t)&v27;
  v29 = 0x2020000000;
  v10 = (id *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  v30 = (void *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  if (!getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr)
  {
    v11 = (void *)iCloudQuotaUILibrary();
    v10 = (id *)dlsym(v11, "ICQCurrentInAppMessageChangedNotification");
    *(_QWORD *)(v28 + 24) = v10;
    getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v27, 8);
  if (v10)
  {
    v12 = *v10;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2;
    v22[3] = &unk_2511BD380;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v12, 0, v13, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    iCloudMessagingObserverToken = self->_iCloudMessagingObserverToken;
    self->_iCloudMessagingObserverToken = v14;

    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v16 = (void *)getICQInAppMessagingClass_softClass;
    v35 = getICQInAppMessagingClass_softClass;
    if (!getICQInAppMessagingClass_softClass)
    {
      v27 = v6;
      v28 = 3221225472;
      v29 = (uint64_t)__getICQInAppMessagingClass_block_invoke;
      v30 = &unk_2511BD3A8;
      v31 = &v32;
      __getICQInAppMessagingClass_block_invoke((uint64_t)&v27);
      v16 = (void *)v33[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v32, 8);
    objc_msgSend(v17, "shared");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = (uint64_t)&v27;
    v29 = 0x2020000000;
    v19 = (id *)getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr;
    v30 = (void *)getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr;
    if (!getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr)
    {
      v20 = (void *)iCloudQuotaUILibrary();
      v19 = (id *)dlsym(v20, "ICQUIMessagePlacementInSettingsAppDetail");
      *(_QWORD *)(v28 + 24) = v19;
      getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v27, 8);
    if (v19)
    {
      v21 = *v19;
      objc_msgSend(v18, "observeUpdatesForBundleID:placement:", CFSTR("com.apple.MobileSMS"), v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      return;
    }
    dlerror();
    abort_report_np();
  }
  else
  {
    dlerror();
    abort_report_np();
  }
  __break(1u);
}

void __42__CKiCloudSettingsViewModel__internalInit__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setLastEngineSyncState:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_resolveSyncState");

}

void __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id *v8;
  id WeakRetained;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (_QWORD *)getICQInAppMessageKeySymbolLoc_ptr;
  v15 = getICQInAppMessageKeySymbolLoc_ptr;
  if (!getICQInAppMessageKeySymbolLoc_ptr)
  {
    v6 = (void *)iCloudQuotaUILibrary();
    v5 = dlsym(v6, "ICQInAppMessageKey");
    v13[3] = (uint64_t)v5;
    getICQInAppMessageKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
    __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
  objc_msgSend(v4, "objectForKeyedSubscript:", *v5, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_updateActionForICQInAppMessage:", v7);

  v10 = objc_loadWeakRetained(v8);
  objc_msgSend(v10, "setLastInAppMessage:", v7);

  v11 = objc_loadWeakRetained(v8);
  objc_msgSend(v11, "_resolveSyncState");

}

- (void)stopObservers
{
  void *v3;
  id iCloudMessagingObserverToken;

  -[CKKeepMessagesPreferenceManager removeSyncedSettingObserver:key:](self->_keepMessagesPreferenceManager, "removeSyncedSettingObserver:key:", self, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_iCloudMessagingObserverToken);

  iCloudMessagingObserverToken = self->_iCloudMessagingObserverToken;
  self->_iCloudMessagingObserverToken = 0;

}

- (void)_syncedSettingsDidChange:(id)a3
{
  id v4;

  -[CKiCloudSettingsViewModel delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iCloudSettingsViewModelDidUpdateState:", self);

}

- (id)_stateModelForSyncState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __objc2_class *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  char v15;

  MEMORY[0x24269E2AC](CFSTR("com.apple.madrid"), CFSTR("Server.TotalRecords.messageManateeZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  -[CKiCloudSettingsViewModel _lastSyncedDateFromDefaults](self, "_lastSyncedDateFromDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "messagesToUploadCount");

  LOBYTE(v8) = -[CKiCloudSettingsViewModel _isBetweenInitialAndBackfillSync](self, "_isBetweenInitialAndBackfillSync");
  v10 = CKiCloudSyncStateBuilder;
  v14[0] = a3;
  v14[1] = v6;
  v14[2] = v9;
  v11 = v7;
  v12 = v11;
  v14[3] = v11;
  v15 = (char)v8;
  if (CKiCloudSyncStateBuilder)
  {
    +[CKiCloudSyncStateBuilder syncModelForDescriptor:](CKiCloudSyncStateBuilder, "syncModelForDescriptor:", v14);
    v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  return v10;
}

- (id)_currentKeepMessagesPreference
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  NSObject *v8;
  uint8_t v9[16];

  +[CKKeepMessagesPreferenceManager keepMessagesPreference](CKKeepMessagesPreferenceManager, "keepMessagesPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToNumber:", &unk_2511C23A8))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("KEEP_MESSAGES_FOREVER");
LABEL_7:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(v2, "isEqualToNumber:", &unk_2511C23C0))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("KEEP_MESSAGES_1MONTH");
    goto LABEL_7;
  }
  if (objc_msgSend(v2, "isEqualToNumber:", &unk_2511C23D8))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("KEEP_MESSAGES_1YEAR");
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_24190B000, v8, OS_LOG_TYPE_INFO, "Programming error. Keep Messages preference is unknown.", v9, 2u);
    }

  }
  v6 = &stru_2511BE380;
LABEL_8:

  return v6;
}

- (NSNumber)keepMessagePreferenceValue
{
  return (NSNumber *)+[CKKeepMessagesPreferenceManager keepMessagesPreference](CKKeepMessagesPreferenceManager, "keepMessagesPreference");
}

- (BOOL)isSyncingEnabled
{
  return IMGetDomainBoolForKey();
}

- (BOOL)isSyncing
{
  void *v2;
  char v3;

  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyncing");

  return v3;
}

- (BOOL)syncSupportsCancellation
{
  _BOOL4 v3;

  v3 = -[CKiCloudSettingsViewModel isSyncing](self, "isSyncing");
  if (v3)
    LOBYTE(v3) = -[IMCloudKitSyncState syncType](self->_lastEngineSyncState, "syncType") == 6;
  return v3;
}

- (BOOL)isSyncButtonEnabled
{
  return !-[CKiCloudSettingsViewModel isSyncing](self, "isSyncing")
      || -[CKiCloudSettingsViewModel syncSupportsCancellation](self, "syncSupportsCancellation");
}

- (BOOL)micAccountsMatch
{
  void *v2;
  char v3;

  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "micAccountsMatch");

  return v3;
}

- (void)syncButtonPressed
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSyncing");

  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "cancelCurrentSync");
  else
    objc_msgSend(v5, "startSync");

}

- (void)showICloudUpsellIfAvailable
{
  id v2;

  -[CKiCloudSettingsViewModel upgradeICloudAction](self, "upgradeICloudAction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction");

}

- (void)_updateActionForICQInAppMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9
    && (objc_msgSend(v9, "actions"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4)
    && (objc_msgSend(v9, "actions"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 == 1))
  {
    objc_msgSend(v9, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKiCloudSettingsViewModel setUpgradeICloudAction:](self, "setUpgradeICloudAction:", v8);

  }
  else
  {
    -[CKiCloudSettingsViewModel setUpgradeICloudAction:](self, "setUpgradeICloudAction:", 0);
  }

}

- (void)updateKeepMessagesPreference:(id)a3
{
  -[CKKeepMessagesPreferenceManager updateKeepMessagesPreference:](self->_keepMessagesPreferenceManager, "updateKeepMessagesPreference:", a3);
}

- (int64_t)syncState
{
  return -[CKiCloudSyncStateModel syncState](self->_syncStateModel, "syncState");
}

- (NSString)messagesInCloudCount
{
  return -[CKiCloudSyncStateModel messagesInCloudCount](self->_syncStateModel, "messagesInCloudCount");
}

- (NSString)syncStatus
{
  return -[CKiCloudSyncStateModel syncStatus](self->_syncStateModel, "syncStatus");
}

- (int64_t)syncStatusMacButtonType
{
  return -[CKiCloudSyncStateModel syncStatusMacButtonType](self->_syncStateModel, "syncStatusMacButtonType");
}

- (NSString)syncStatusFooterText
{
  void *v3;
  void *v4;

  MEMORY[0x24269E2AC](CFSTR("com.apple.madrid"), CFSTR("ShowDebugSummary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    -[CKiCloudSettingsSyncController syncSummary](self->_syncController, "syncSummary");
  else
    -[CKiCloudSyncStateModel syncStatusFooterText](self->_syncStateModel, "syncStatusFooterText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)syncStatusMacToolTipText
{
  return -[CKiCloudSyncStateModel syncStatusMacToolTipText](self->_syncStateModel, "syncStatusMacToolTipText");
}

- (id)_lastSyncedDateString
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[CKiCloudSyncStateModel lastSyncedDateString](self->_syncStateModel, "lastSyncedDateString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_2511BE380;
  v4 = v2;

  return v4;
}

- (NSString)syncStatusFooterSubstringForHyperlink
{
  return -[CKiCloudSyncStateModel syncStatusFooterSubstringForHyperlink](self->_syncStateModel, "syncStatusFooterSubstringForHyperlink");
}

- (BOOL)isSyncAvailable
{
  return -[CKiCloudSyncStateModel isSyncAvailable](self->_syncStateModel, "isSyncAvailable");
}

- (NSString)messagesLearnMoreUrlString
{
  return (NSString *)CFSTR("https://support.apple.com/HT208532");
}

- (id)_lastSyncedDateFromDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  MEMORY[0x24269E2AC](CFSTR("com.apple.madrid"), *MEMORY[0x24BE50BC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE50C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE50CD8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isBetweenInitialAndBackfillSync
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  MEMORY[0x24269E2AC](CFSTR("com.apple.madrid"), *MEMORY[0x24BE50BC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE50CA8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE50C88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)footerHyperlinkUrl
{
  unint64_t v2;
  NSObject *v4;
  uint8_t v5[16];

  v2 = -[CKiCloudSyncStateModel syncState](self->_syncStateModel, "syncState") - 3;
  if (v2 < 4)
    return &off_2511BD3E0[v2]->isa;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_24190B000, v4, OS_LOG_TYPE_INFO, "Tried to get a footer hyperlink URL for an unsupported Sync State. Programmer error.", v5, 2u);
    }

  }
  return 0;
}

- (void)_resolveSyncState
{
  IMCloudKitSyncState *v3;
  ICQInAppMessage *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  CKiCloudSyncStateModel *v24;
  CKiCloudSyncStateModel *syncStateModel;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = self->_lastEngineSyncState;
  v4 = self->_lastInAppMessage;
  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMiCEnabled");

  -[CKiCloudSettingsViewModel syncController](self, "syncController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "micAccountsMatch");

  v9 = 6;
  if (v8)
    v9 = 0;
  v10 = v6 ^ 1 | v8;
  if (v6)
    v11 = v9;
  else
    v11 = 0;
  if (v10 == 1 && v3)
  {
    v12 = -[IMCloudKitSyncState syncJobState](v3, "syncJobState") - 1;
    if (v12 < 5)
    {
      v11 = qword_24192CB08[v12];
      goto LABEL_40;
    }
    v11 = 0;
  }
  if (!v11 && v4)
  {
    -[ICQInAppMessage reason](v4, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v14 = (_QWORD *)getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr;
    v30 = getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr;
    if (!getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr)
    {
      v15 = (void *)iCloudQuotaUILibrary();
      v14 = dlsym(v15, "ICQUIInAppMessageReasonServerUnreachable");
      v28[3] = (uint64_t)v14;
      getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v27, 8);
    if (!v14)
      __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
    if ((objc_msgSend(v13, "isEqualToString:", *v14, v27) & 1) != 0)
    {
      v11 = 3;
    }
    else
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v16 = (_QWORD *)getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr;
      v30 = getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr;
      if (!getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr)
      {
        v17 = (void *)iCloudQuotaUILibrary();
        v16 = dlsym(v17, "ICQUIInAppMessageReasonAirplaneModeOn");
        v28[3] = (uint64_t)v16;
        getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr = (uint64_t)v16;
      }
      _Block_object_dispose(&v27, 8);
      if (!v16)
        __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
      if ((objc_msgSend(v13, "isEqualToString:", *v16, v27) & 1) != 0)
      {
        v11 = 4;
      }
      else
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v18 = (_QWORD *)getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr;
        v30 = getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr;
        if (!getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr)
        {
          v19 = (void *)iCloudQuotaUILibrary();
          v18 = dlsym(v19, "ICQUIInAppMessageReasonCellularDataOff");
          v28[3] = (uint64_t)v18;
          getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr = (uint64_t)v18;
        }
        _Block_object_dispose(&v27, 8);
        if (!v18)
          __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
        if ((objc_msgSend(v13, "isEqualToString:", *v18, v27) & 1) != 0)
        {
          v11 = 5;
        }
        else
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v20 = (_QWORD *)getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
          v30 = getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
          if (!getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr)
          {
            v21 = (void *)iCloudQuotaUILibrary();
            v20 = dlsym(v21, "ICQUIInAppMessageReasoniCloudAlmostFull");
            v28[3] = (uint64_t)v20;
            getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr = (uint64_t)v20;
          }
          _Block_object_dispose(&v27, 8);
          if (!v20)
            __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
          if ((objc_msgSend(v13, "isEqualToString:", *v20, v27) & 1) != 0)
          {
            v11 = 7;
          }
          else
          {
            v27 = 0;
            v28 = &v27;
            v29 = 0x2020000000;
            v22 = (_QWORD *)getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
            v30 = getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
            if (!getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr)
            {
              v23 = (void *)iCloudQuotaUILibrary();
              v22 = dlsym(v23, "ICQUIInAppMessageReasoniCloudFull");
              v28[3] = (uint64_t)v22;
              getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr = (uint64_t)v22;
            }
            _Block_object_dispose(&v27, 8);
            if (!v22)
              __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
            if (objc_msgSend(v13, "isEqualToString:", *v22, v27))
              v11 = 8;
            else
              v11 = 0;
          }
        }
      }
    }

  }
LABEL_40:
  self->_resolvedSyncState = v11;
  -[CKiCloudSettingsViewModel _stateModelForSyncState:](self, "_stateModelForSyncState:", v11);
  v24 = (CKiCloudSyncStateModel *)objc_claimAutoreleasedReturnValue();
  syncStateModel = self->_syncStateModel;
  self->_syncStateModel = v24;

  -[CKiCloudSettingsViewModel delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "iCloudSettingsViewModelDidUpdateState:", self);

}

- (id)captionTextForCaptionTextType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HEADING_TITLE");
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("SECURELY_STORE_YOUR_MESSAGES_IN_ICLOUD");
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("USE_ON_THIS_DEVICE");
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("MANAGE_STORAGE_TITLE");
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("IN_ICLOUD_TITLE");
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("KEEP_MESSAGES_TITLE");
      goto LABEL_9;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("STATUS_TITLE");
LABEL_9:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)valueTextForValueTextType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      -[CKiCloudSettingsViewModel messagesInCloudCount](self, "messagesInCloudCount", v3, v4);
      self = (CKiCloudSettingsViewModel *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKiCloudSettingsViewModel keepMessagesPreference](self, "keepMessagesPreference", v3, v4);
      self = (CKiCloudSettingsViewModel *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKiCloudSettingsViewModel syncStatus](self, "syncStatus", v3, v4);
      self = (CKiCloudSettingsViewModel *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKiCloudSettingsViewModel _lastSyncedDateString](self, "_lastSyncedDateString", v3, v4);
      self = (CKiCloudSettingsViewModel *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (NSString)syncButtonText
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (-[CKiCloudSettingsViewModel syncSupportsCancellation](self, "syncSupportsCancellation"))
  {
    v3 = -[CKiCloudSettingsViewModel isSyncing](self, "isSyncing");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = CFSTR("CANCEL_SYNCING");
    else
      v6 = CFSTR("SYNC_NOW");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SYNC_NOW");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ICQInAppAction)upgradeICloudAction
{
  return (ICQInAppAction *)objc_loadWeakRetained((id *)&self->_upgradeICloudAction);
}

- (void)setUpgradeICloudAction:(id)a3
{
  objc_storeWeak((id *)&self->_upgradeICloudAction, a3);
}

- (CKiCloudSettingsViewModelDelegate)delegate
{
  return (CKiCloudSettingsViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKiCloudSettingsSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (CKiCloudSyncStateModel)syncStateModel
{
  return self->_syncStateModel;
}

- (void)setSyncStateModel:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateModel, a3);
}

- (id)iCloudMessagingObserverToken
{
  return self->_iCloudMessagingObserverToken;
}

- (void)setICloudMessagingObserverToken:(id)a3
{
  objc_storeStrong(&self->_iCloudMessagingObserverToken, a3);
}

- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager
{
  return self->_keepMessagesPreferenceManager;
}

- (void)setKeepMessagesPreferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, a3);
}

- (ICQInAppMessage)lastInAppMessage
{
  return self->_lastInAppMessage;
}

- (void)setLastInAppMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastInAppMessage, a3);
}

- (IMCloudKitSyncState)lastEngineSyncState
{
  return self->_lastEngineSyncState;
}

- (void)setLastEngineSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_lastEngineSyncState, a3);
}

- (int64_t)resolvedSyncState
{
  return self->_resolvedSyncState;
}

- (void)setResolvedSyncState:(int64_t)a3
{
  self->_resolvedSyncState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEngineSyncState, 0);
  objc_storeStrong((id *)&self->_lastInAppMessage, 0);
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, 0);
  objc_storeStrong(&self->_iCloudMessagingObserverToken, 0);
  objc_storeStrong((id *)&self->_syncStateModel, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_upgradeICloudAction);
}

void __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __getICQInAppMessagingClass_block_invoke_cold_1(v0);
}

@end
