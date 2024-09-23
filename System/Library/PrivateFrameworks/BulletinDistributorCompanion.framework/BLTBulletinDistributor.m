@implementation BLTBulletinDistributor

+ (id)sharedDistributor
{
  if (sharedDistributor___onceToken != -1)
    dispatch_once(&sharedDistributor___onceToken, &__block_literal_global_85);
  return (id)sharedDistributor___sharedInstance;
}

void __43__BLTBulletinDistributor_sharedDistributor__block_invoke()
{
  BLTBulletinDistributor *v0;
  void *v1;

  v0 = objc_alloc_init(BLTBulletinDistributor);
  v1 = (void *)sharedDistributor___sharedInstance;
  sharedDistributor___sharedInstance = (uint64_t)v0;

}

- (BLTBulletinDistributor)init
{
  BLTBulletinDistributor *v2;
  uint64_t v3;
  NSDate *startupTime;
  uint64_t v5;
  NSMutableDictionary *bulletins;
  uint64_t v7;
  NSMutableSet *noticesFeed;
  uint64_t v9;
  NSMutableSet *lockScreenFeed;
  BLTHashCache *v11;
  BLTHashCache *attachmentHashCache;
  BLTHashCache *v13;
  BLTHashCache *iconHashCache;
  uint64_t v15;
  NSMutableDictionary *pendingBulletinUpdates;
  uint64_t v17;
  NSMutableSet *bulletinIDsWaitingOnGizmoAdd;
  BLTWatchKitAppList *v19;
  BLTWatchKitAppList *watchKitAppList;
  BLTSectionConfiguration *v21;
  BLTSectionConfiguration *sectionConfiguration;
  BLTClientReplyTimeoutManager *v23;
  void *v24;
  uint64_t v25;
  BLTClientReplyTimeoutManager *clientReplyTimeoutManager;
  BLTGizmoLegacyMap *v27;
  BLTGizmoLegacyMap *gizmoLegacyMap;
  void *v29;
  uint64_t v30;
  FBSDisplayLayoutMonitor *layoutMonitor;
  BLTSimpleCache *v32;
  BLTSimpleCache *mruCacheOfSectionIDs;
  BLTRemoteGizmoClient *v34;
  BLTRemoteGizmoClient *gizmoConnection;
  BLTSettingSync *v36;
  BLTSectionConfiguration *v37;
  void *v38;
  uint64_t v39;
  BLTSettingSync *settingSync;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  BLTPingSubscriberManager *v45;
  BLTPingSubscriberManager *pingSubscriberManager;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)BLTBulletinDistributor;
  v2 = -[BLTBulletinDistributor init](&v54, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startupTime = v2->_startupTime;
    v2->_startupTime = (NSDate *)v3;

    v2->_standaloneTestModeEnabled = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    bulletins = v2->_bulletins;
    v2->_bulletins = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    noticesFeed = v2->_noticesFeed;
    v2->_noticesFeed = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    lockScreenFeed = v2->_lockScreenFeed;
    v2->_lockScreenFeed = (NSMutableSet *)v9;

    v11 = objc_alloc_init(BLTHashCache);
    attachmentHashCache = v2->_attachmentHashCache;
    v2->_attachmentHashCache = v11;

    v13 = objc_alloc_init(BLTHashCache);
    iconHashCache = v2->_iconHashCache;
    v2->_iconHashCache = v13;

    v2->_pendingBulletinUpdatesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingBulletinUpdates = v2->_pendingBulletinUpdates;
    v2->_pendingBulletinUpdates = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    bulletinIDsWaitingOnGizmoAdd = v2->_bulletinIDsWaitingOnGizmoAdd;
    v2->_bulletinIDsWaitingOnGizmoAdd = (NSMutableSet *)v17;

    v19 = objc_alloc_init(BLTWatchKitAppList);
    watchKitAppList = v2->_watchKitAppList;
    v2->_watchKitAppList = v19;

    v21 = -[BLTSectionConfiguration initWithWatchKitAppList:]([BLTSectionConfiguration alloc], "initWithWatchKitAppList:", v2->_watchKitAppList);
    sectionConfiguration = v2->_sectionConfiguration;
    v2->_sectionConfiguration = v21;

    v23 = [BLTClientReplyTimeoutManager alloc];
    BLTWorkQueue();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[BLTClientReplyTimeoutManager initWithQueue:](v23, "initWithQueue:", v24);
    clientReplyTimeoutManager = v2->_clientReplyTimeoutManager;
    v2->_clientReplyTimeoutManager = (BLTClientReplyTimeoutManager *)v25;

    v27 = objc_alloc_init(BLTGizmoLegacyMap);
    gizmoLegacyMap = v2->_gizmoLegacyMap;
    v2->_gizmoLegacyMap = v27;

    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v30;

    v32 = -[BLTSimpleCache initWithCapacity:]([BLTSimpleCache alloc], "initWithCapacity:", 10);
    mruCacheOfSectionIDs = v2->_mruCacheOfSectionIDs;
    v2->_mruCacheOfSectionIDs = v32;

    BLTCleanAttachmentsPath();
    CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
    v34 = objc_alloc_init(BLTRemoteGizmoClient);
    gizmoConnection = v2->_gizmoConnection;
    v2->_gizmoConnection = v34;

    -[BLTRemoteGizmoClient setServer:](v2->_gizmoConnection, "setServer:", v2);
    -[BLTRemoteGizmoClient setGizmoLegacyMap:](v2->_gizmoConnection, "setGizmoLegacyMap:", v2->_gizmoLegacyMap);
    v36 = [BLTSettingSync alloc];
    v37 = v2->_sectionConfiguration;
    BLTWorkQueue();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[BLTSettingSync initWithSectionConfiguration:queue:watchKitAppList:](v36, "initWithSectionConfiguration:queue:watchKitAppList:", v37, v38, v2->_watchKitAppList);
    settingSync = v2->_settingSync;
    v2->_settingSync = (BLTSettingSync *)v39;

    blt_general_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2173D9000, v41, OS_LOG_TYPE_DEFAULT, "Getting summarization setting from gateway", buf, 2u);
    }

    -[BLTSettingSyncInternal settingsGateway](v2->_settingSync, "settingsGateway");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_summarizationSetting = objc_msgSend(v42, "effectiveGlobalSummarizationSetting");

    blt_general_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2->_summarizationSetting);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v44;
      _os_log_impl(&dword_2173D9000, v43, OS_LOG_TYPE_DEFAULT, "Gateway returned summarization setting %@", buf, 0xCu);

    }
    v45 = -[BLTPingSubscriberManager initWithDeviceDelegate:]([BLTPingSubscriberManager alloc], "initWithDeviceDelegate:", v2);
    pingSubscriberManager = v2->_pingSubscriberManager;
    v2->_pingSubscriberManager = v45;

    +[BLTDebugObserverHolder startWithWKAppList:](BLTDebugObserverHolder, "startWithWKAppList:", v2->_watchKitAppList);
    +[BLTPairedSyncCoordinator syncState](BLTPairedSyncCoordinator, "syncState");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "isSyncRestricted") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObserver:selector:name:object:", v2, sel__handleSyncStateChanged_, CFSTR("BLTPairedSyncStateChanged"), 0);

    }
    else
    {
      -[BLTBulletinDistributor _performSync](v2, "_performSync");
    }
    if (objc_msgSend(v47, "isInitialSyncComplete"))
    {
      -[BLTBulletinDistributor _startBulletinListening](v2, "_startBulletinListening");
      if ((objc_msgSend(v47, "isSyncRestricted") & 1) == 0)
        -[BLTBulletinDistributor _handleAllSyncComplete](v2, "_handleAllSyncComplete");
    }
    else
    {
      blt_general_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2173D9000, v49, OS_LOG_TYPE_DEFAULT, "Waiting for initial sync complete before listening for bulletins", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObserver:selector:name:object:", v2, sel__handleInitialSyncStateCompleteChanged_, CFSTR("BLTPairedSyncStateInitialSyncCompleteChanged"), 0);

    }
    objc_initWeak((id *)buf, v2);
    BLTWorkQueue();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v53, (id *)buf);
    v2->_stateHandler = os_state_add_handler();

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);

  }
  return v2;
}

_DWORD *__30__BLTBulletinDistributor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  objc_class *v2;
  void *v3;
  void *v4;
  _DWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BBObserver invalidate](self->_bbObserver, "invalidate");
  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  os_state_remove_handler();
  self->_stateHandler = 0;
  v4.receiver = self;
  v4.super_class = (Class)BLTBulletinDistributor;
  -[BLTBulletinDistributor dealloc](&v4, sel_dealloc);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  -[BLTBulletinDistributor getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:](self, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", a3, 0, a4);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  -[BLTBulletinDistributor getWillNanoPresentNotificationForSectionID:subsectionIDs:subtype:completion:](self, "getWillNanoPresentNotificationForSectionID:subsectionIDs:subtype:completion:", a3, a4, 0xFFFFFFFF80000000, a5);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 completion:(id)a6
{
  BLTSettingSync *settingSync;
  void (**v11)(id, BOOL);

  if (a6)
  {
    settingSync = self->_settingSync;
    v11 = (void (**)(id, BOOL))a6;
    v11[2](v11, -[BLTBulletinDistributor _willNanoPresent:](self, "_willNanoPresent:", -[BLTSettingSyncInternal willNanoPresentNotificationForSectionID:subsectionIDs:subtype:](settingSync, "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:", a3, a4, a5)));

  }
}

- (void)sendBulletinSummary:(id)a3
{
  -[BLTRemoteGizmoClient addBulletinSummary:](self->_gizmoConnection, "addBulletinSummary:", a3);
}

- (BOOL)isLocallyConnectedToRemote
{
  return -[BLTRemoteObject connectionStatus](self->_gizmoConnection, "connectionStatus") == 1;
}

- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4
{
  id v6;
  BLTSettingSync *settingSync;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  settingSync = self->_settingSync;
  v14[0] = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__BLTBulletinDistributor_sendSectionInfoWithSectionID_completion___block_invoke;
  v12[3] = &unk_24D761B98;
  v13 = v6;
  v11 = v6;
  -[BLTSettingSync sendSectionInfosWithSectionIDs:completion:spoolToFile:](settingSync, "sendSectionInfosWithSectionIDs:completion:spoolToFile:", v10, v12, 0);

}

uint64_t __66__BLTBulletinDistributor_sendSectionInfoWithSectionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  BLTSettingSync *settingSync;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  settingSync = self->_settingSync;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__BLTBulletinDistributor_sendAllSectionInfoWithSpool_completion___block_invoke;
  v9[3] = &unk_24D761B98;
  v10 = v6;
  v8 = v6;
  -[BLTSettingSync sendAllSectionInfoWithSpool:completion:](settingSync, "sendAllSectionInfoWithSpool:completion:", v4, v9);

}

uint64_t __65__BLTBulletinDistributor_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v4;
  BLTSettingSync *settingSync;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  settingSync = self->_settingSync;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BLTBulletinDistributor_spoolSectionInfoWithCompletion___block_invoke;
  v7[3] = &unk_24D761B98;
  v8 = v4;
  v6 = v4;
  -[BLTSettingSync spoolSectionInfoWithCompletion:](settingSync, "spoolSectionInfoWithCompletion:", v7);

}

uint64_t __57__BLTBulletinDistributor_spoolSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSectionInfoSentCache
{
  -[BLTSettingSync clearSectionInfoSentCache](self->_settingSync, "clearSectionInfoSentCache");
}

- (BOOL)isStandaloneTestModeEnabled
{
  return self->_standaloneTestModeEnabled;
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  self->_standaloneTestModeEnabled = 1;
  -[BLTRemoteObject enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:](self->_gizmoConnection, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:");
  -[BLTSettingSyncInternal enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:](self->_settingSync, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:", a3, a4, a5, a6);
}

- (void)disableStandaloneTestMode
{
  self->_standaloneTestModeEnabled = 0;
  -[BLTRemoteObject disableStandaloneTestMode](self->_gizmoConnection, "disableStandaloneTestMode");
  -[BLTSettingSyncInternal disableStandaloneTestMode](self->_settingSync, "disableStandaloneTestMode");
}

- (id)settingOverrides
{
  return -[BLTSettingSync settingOverrides](self->_settingSync, "settingOverrides");
}

- (id)originalSettings
{
  return -[BLTSettingSync originalSettings](self->_settingSync, "originalSettings");
}

- (id)overriddenSettings
{
  return -[BLTSettingSync overriddenSettings](self->_settingSync, "overriddenSettings");
}

- (void)removeSectionID:(id)a3
{
  -[BLTSettingSync sendRemoveSectionWithSectionID:sent:](self->_settingSync, "sendRemoveSectionWithSectionID:sent:", a3, 0);
}

- (void)_handleSyncStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BLTBulletinDistributor *v9;

  v4 = a3;
  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__BLTBulletinDistributor__handleSyncStateChanged___block_invoke;
  v7[3] = &unk_24D761AA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__BLTBulletinDistributor__handleSyncStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becameSyncUnrestricted:", *(_QWORD *)(a1 + 32));

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "_performSync");
}

- (void)_handleInitialSyncStateCompleteChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BLTBulletinDistributor *v9;

  v4 = a3;
  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__BLTBulletinDistributor__handleInitialSyncStateCompleteChanged___block_invoke;
  v7[3] = &unk_24D761AA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__BLTBulletinDistributor__handleInitialSyncStateCompleteChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInitialSyncComplete"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_startBulletinListening");
    if ((objc_msgSend(v2, "isSyncRestricted") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_handleAllSyncComplete");
  }

}

- (void)_performSync
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BLTBulletinDistributor__performSync__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  if (_performSync_onceToken != -1)
    dispatch_once(&_performSync_onceToken, block);
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 96);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__BLTBulletinDistributor__performSync__block_invoke_3;
  v4[3] = &unk_24D761AD0;
  v4[4] = v1;
  return objc_msgSend(v2, "performInitialSyncWithProgress:completion:", &__block_literal_global_114, v4);
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke_2()
{
  return +[BLTPairedSyncCoordinator reportProgress:](BLTPairedSyncCoordinator, "reportProgress:");
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;

  +[BLTPairedSyncCoordinator syncDidComplete](BLTPairedSyncCoordinator, "syncDidComplete");
  +[BLTPairedSyncCoordinator syncState](BLTPairedSyncCoordinator, "syncState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInitialSyncComplete");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_handleAllSyncComplete");
  return objc_msgSend(*(id *)(a1 + 32), "_registerForPairedDeviceBuildChanges");
}

- (void)_startBulletinListening
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BLTBulletinDistributor__startBulletinListening__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  if (_startBulletinListening_onceToken != -1)
    dispatch_once(&_startBulletinListening_onceToken, block);
}

uint64_t __49__BLTBulletinDistributor__startBulletinListening__block_invoke(uint64_t a1)
{
  NSObject *v2;
  char v3;
  _QWORD *v4;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Start listening for bulletins", buf, 2u);
  }

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isLoaded");
  v4 = *(_QWORD **)(a1 + 32);
  if ((v3 & 1) != 0)
    return objc_msgSend(v4, "_setupBBObserver");
  v6 = (void *)v4[11];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BLTBulletinDistributor__startBulletinListening__block_invoke_115;
  v7[3] = &unk_24D761AD0;
  v7[4] = v4;
  return objc_msgSend(v6, "fetchWatchKitInfoWithCompletion:", v7);
}

uint64_t __49__BLTBulletinDistributor__startBulletinListening__block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupBBObserver");
}

- (void)_handleAllSyncComplete
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  if (_handleAllSyncComplete_onceToken != -1)
    dispatch_once(&_handleAllSyncComplete_onceToken, block);
}

void __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Sync is not restricted and initial sync complete", buf, 2u);
  }

  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_116;
  block[3] = &unk_24D761AD0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v7 = 60.0 - v6;
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = 0.0;
  blt_general_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v8;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for %f seconds until we send bulletin metadata", buf, 0xCu);
  }

  v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  BLTWorkQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_117;
  v12[3] = &unk_24D761AD0;
  v12[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v10, v11, v12);

}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_116(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "handleAllSyncComplete");
}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_117(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_2;
  v3[3] = &unk_24D761AD0;
  v3[4] = v1;
  return objc_msgSend(v1, "_reloadBulletinsWithCompletion:", v3);
}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCurrentBulletinIdentifiers");
}

- (void)_registerForPairedDeviceBuildChanges
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x24BE6B3E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke;
  v5[3] = &unk_24D7631C8;
  v5[4] = self;
  objc_msgSend(v3, "registerForPropertyChanges:withBlock:", v4, v5);

}

void __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  BLTWorkQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke_2;
  block[3] = &unk_24D761AD0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendAllSectionInfoWithSpool:completion:", 0, 0);
}

- (void)_setupBBObserver
{
  NSObject *v3;
  void *v4;
  void *v5;
  BBObserver *v6;
  BBObserver *bbObserver;
  uint8_t v8[16];

  blt_general_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "Setting up BB Observer", v8, 2u);
  }

  BLTWorkQueue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BLTWorkQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBObserver surrogateGatewayWithQueue:calloutQueue:name:priority:](BLTBBObserver, "surrogateGatewayWithQueue:calloutQueue:name:priority:", v4, v5, CFSTR("GizmoGateway"), 2);
  v6 = (BBObserver *)objc_claimAutoreleasedReturnValue();
  bbObserver = self->_bbObserver;
  self->_bbObserver = v6;

  -[BBObserver setDelegate:](self->_bbObserver, "setDelegate:", self);
  -[BBObserver setObserverFeed:](self->_bbObserver, "setObserverFeed:", 33663);
}

- (void)_pingSubscriberWithBulletin:(id)a3 ack:(id)a4
{
  BLTPingSubscriberManager *pingSubscriberManager;
  id v6;
  id v7;
  id v8;

  pingSubscriberManager = self->_pingSubscriberManager;
  v6 = a4;
  v7 = a3;
  -[BLTPingSubscriberManager subscribers](pingSubscriberManager, "subscribers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pingWithBulletin:ack:", v7, v6);

}

- (void)_notifyGizmoOfCancelBulletin:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 feed:(unint64_t)a6 withBulletinDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  BLTRemoteGizmoClient *gizmoConnection;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(a7, "timeIntervalSinceNow");
  v16 = v15 + 86400.0;
  blt_general_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = " not going to send";
    v30 = 2112;
    v28 = 138413314;
    v29 = v12;
    if (v16 > 0.0)
      v18 = "";
    v31 = v14;
    v32 = 2048;
    v33 = a6;
    v34 = 2048;
    v35 = v16;
    v36 = 2080;
    v37 = v18;
    _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _notifyGizmoOfCancelBulletin with publisherMatchID: %@ in universal section: %@ forFeed: %lu timeout: %f%s", (uint8_t *)&v28, 0x34u);
  }

  if (v16 > 0.0)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v13, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:](self->_gizmoLegacyMap, "gizmoPublisherBulletinIDForPhoneKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap gizmoSectionInfoForPhoneKey:](self->_gizmoLegacyMap, "gizmoSectionInfoForPhoneKey:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mappedSectionID");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (void *)v22;
    else
      v24 = v14;
    v25 = v24;

    gizmoConnection = self->_gizmoConnection;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTRemoteGizmoClient cancelBulletinWithPublisherMatchID:universalSectionID:feed:withTimeout:](gizmoConnection, "cancelBulletinWithPublisherMatchID:universalSectionID:feed:withTimeout:", v20, v25, a6, v27);

  }
}

- (void)_mapBulletin:(id)a3
{
  void *v4;
  BLTSectionConfiguration *sectionConfiguration;
  void *v6;
  uint64_t v7;
  BLTGizmoLegacyMap *gizmoLegacyMap;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BDF8818], "notificationForBulletin:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sectionConfiguration = self->_sectionConfiguration;
  objc_msgSend(v10, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTSectionConfigurationInternal legacyMapLocationForSectionID:](sectionConfiguration, "legacyMapLocationForSectionID:", v6);

  if (v7 == 1)
  {
    gizmoLegacyMap = self->_gizmoLegacyMap;
    objc_msgSend(v10, "sectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap mapNotification:sectionID:](gizmoLegacyMap, "mapNotification:sectionID:", v4, v9);

  }
}

- (BOOL)_rememberBulletin:(id)a3 forFeed:(unint64_t)a4 syncChangesToWatch:(BOOL)a5
{
  char v6;
  id v8;
  NSMutableDictionary *bulletins;
  void *v10;
  BLTBulletinStorageSection *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id v15;
  NSMutableSet *lockScreenFeed;
  void *v17;
  NSMutableSet *noticesFeed;
  void *v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  BLTBulletinDistributor *v27;
  uint64_t *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a4;
  v8 = a3;
  bulletins = self->_bulletins;
  objc_msgSend(v8, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bulletins, "objectForKeyedSubscript:", v10);
  v11 = (BLTBulletinStorageSection *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = -[BLTBulletinStorageSection initWithMaxContextSize:]([BLTBulletinStorageSection alloc], "initWithMaxContextSize:", 204800);
    v12 = self->_bulletins;
    objc_msgSend(v8, "sectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  -[BLTBulletinStorageSection addOrReplaceBulletin:](v11, "addOrReplaceBulletin:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke;
  v25 = &unk_24D7631F0;
  v15 = v8;
  v27 = self;
  v28 = &v30;
  v29 = a5;
  v26 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v22);
  if (*((_BYTE *)v31 + 24))
  {
    -[BLTBulletinDistributor _mapBulletin:](self, "_mapBulletin:", v15, v22, v23, v24, v25);
    if ((v6 & 8) != 0)
    {
      lockScreenFeed = self->_lockScreenFeed;
      objc_msgSend(v15, "bulletinID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](lockScreenFeed, "addObject:", v17);

    }
    if ((v6 & 1) != 0)
    {
      noticesFeed = self->_noticesFeed;
      objc_msgSend(v15, "bulletinID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](noticesFeed, "addObject:", v19);

    }
  }
  v20 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  blt_notification_size_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4 == v3)
  {
    if (v6)
      __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_1((id *)(a1 + 32), v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (v6)
      __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_2(v3, v5);

    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 40), "_performRemoveBulletin:forFeed:", v3, 65023);
  }

}

- (void)_postWillSendBulletinToGizmoNotificationForBulletin:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1530];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("sectionID");
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("BLTWillSendBulletinToGizmoNotification"), 0, v7);
}

- (void)_attachAttachment:(id)a3 attachmentType:(int64_t)a4 toBulletin:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BLTHashCache *attachmentHashCache;
  void *v28;
  void *v29;
  id v30;
  char v31;
  BLTBulletinDistributor *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setContainsUpdatedAttachment:", 1);
    objc_msgSend(v10, "setAttachment:", v8);
    objc_msgSend(v10, "setAttachmentType:", a4);
  }
  else
  {
    v32 = self;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasAttachment") & 1) != 0 || objc_msgSend(v10, "hasAttachmentURL"))
    {
      objc_msgSend(v10, "attachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentURLURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLTHashCacheItem hashCacheItemWithData:URL:identifier:](BLTHashCacheItem, "hashCacheItemWithData:URL:identifier:", v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v16);
      v31 = 1;
    }
    else
    {
      v31 = 0;
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v33 = v10;
    objc_msgSend(v10, "additionalAttachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v22, "uRL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v22, "attachmentURLURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[BLTHashCacheItem hashCacheItemWithData:URL:identifier:](BLTHashCacheItem, "hashCacheItemWithData:URL:identifier:", 0, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObject:", v26);
            objc_msgSend(v12, "addObject:", v22);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v19);
    }

    v10 = v33;
    attachmentHashCache = v32->_attachmentHashCache;
    objc_msgSend(v33, "sectionID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "publisherMatchID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __70__BLTBulletinDistributor__attachAttachment_attachmentType_toBulletin___block_invoke;
    v34[3] = &unk_24D763218;
    v37 = v31;
    v35 = v33;
    v36 = v12;
    v30 = v12;
    -[BLTHashCache updateCacheWithItems:forSectionID:matchID:result:](attachmentHashCache, "updateCacheWithItems:forSectionID:matchID:result:", v11, v28, v29, v34);

    v8 = 0;
  }

}

void __70__BLTBulletinDistributor__attachAttachment_attachmentType_toBulletin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BLTPBBulletinAttachment *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = a3;
    v16 = 2112;
    v17 = v9;
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Attachment hash cache updated item index %lu id %@ with result %lu", (uint8_t *)&v14, 0x20u);

  }
  if (a4 == 2)
  {
    if (!a3 && *(_BYTE *)(a1 + 48))
      goto LABEL_14;
    v11 = objc_alloc_init(BLTPBBulletinAttachment);
    -[BLTPBBulletinAttachment setIsUpdated:](v11, "setIsUpdated:", 1);
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletinAttachment setIdentifier:](v11, "setIdentifier:", v12);

    objc_msgSend(*(id *)(a1 + 32), "setContainsUpdatedAttachment:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addAdditionalAttachments:", v11);
    goto LABEL_17;
  }
  v10 = a3 - *(unsigned __int8 *)(a1 + 48);
  if (a4 == 1)
  {
    if (!a3 && *(_BYTE *)(a1 + 48))
    {
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "setContainsUpdatedAttachment:", 1);
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v10);
    v11 = (BLTPBBulletinAttachment *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletinAttachment setIsUpdated:](v11, "setIsUpdated:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setContainsUpdatedAttachment:", 1);
LABEL_17:

    goto LABEL_18;
  }
  if (!a4)
  {
    if (a3 || !*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setURL:", 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setAttachment:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setAttachmentURL:", 0);
    }
  }
LABEL_18:

}

- (void)_attachIconToBulletin:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BLTHashCache *iconHashCache;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "variantsCount");

  if (v6)
  {
    objc_msgSend(v4, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "variantAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTHashCacheItem hashCacheItemWithData:URL:identifier:](BLTHashCacheItem, "hashCacheItemWithData:URL:identifier:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v11);
  }
  else
  {
    v9 = 0;
  }
  iconHashCache = self->_iconHashCache;
  objc_msgSend(v4, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisherMatchID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__BLTBulletinDistributor__attachIconToBulletin___block_invoke;
  v16[3] = &unk_24D763240;
  v17 = v4;
  v15 = v4;
  -[BLTHashCache updateCacheWithItems:forSectionID:matchID:result:](iconHashCache, "updateCacheWithItems:forSectionID:matchID:result:", v9, v13, v14, v16);

}

void __48__BLTBulletinDistributor__attachIconToBulletin___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = a3;
    v10 = 2048;
    v11 = a4;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Icon hash cache updated item index %lu with result %lu", (uint8_t *)&v8, 0x16u);
  }

  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4)
      objc_msgSend(*(id *)(a1 + 32), "setIcon:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setContainsUpdateIcon:", 1);
  }
}

- (void)_handleAddBulletin:(id)a3 feed:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5 performedWithSuccess:(BOOL)a6 sendAttemptTime:(id)a7 connectionStatus:(unint64_t)a8 isGizmoReady:(BOOL)a9 shouldSendReplyIfNeeded:(BOOL)a10 replyToken:(id)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[22];
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v11 = a6;
  v12 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a11;
  blt_general_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      v18 = "Successfully notified";
    else
      v18 = "Failed to notify";
    objc_msgSend(v15, "publisherMatchID");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = "NO";
    *(_DWORD *)v28 = 136315906;
    *(_QWORD *)&v28[4] = v18;
    *(_WORD *)&v28[12] = 2112;
    if (v12)
      v21 = "YES";
    *(_QWORD *)&v28[14] = v19;
    v29 = 2048;
    v30 = a4;
    v31 = 2080;
    v32 = v21;
    _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_DEFAULT, "%s gizmo of bulletin with publisherMatchID: %@ forFeed: %lu playLightsAndSirens: %s", v28, 0x2Au);

  }
  if (!v11)
  {
    if (a10)
    {
      objc_msgSend(v15, "publisherMatchID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sectionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:finalReply:replyToken:](self, "_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:finalReply:replyToken:", 0, v22, v23, 1, v16);

    }
    objc_msgSend(v15, "publisherMatchID", *(_OWORD *)v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionMatchID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateOrRecencyDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTBulletinDistributor _notifyGizmoOfCancelBulletin:sectionID:universalSectionID:feed:withBulletinDate:](self, "_notifyGizmoOfCancelBulletin:sectionID:universalSectionID:feed:withBulletinDate:", v24, v25, v26, a4, v27);

  }
}

- (void)_sendPBBulletin:(id)a3 forBulletin:(id)a4 feed:(unint64_t)a5 updateType:(unint64_t)a6 playLightsAndSirens:(BOOL)a7 shouldSendReplyIfNeeded:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BLTRemoteGizmoClient *gizmoConnection;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;
  _BOOL4 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34[3];
  BOOL v35;
  BOOL v36;
  BOOL v37;
  id buf[2];

  v8 = a8;
  v29 = a7;
  v12 = a3;
  v13 = a4;
  v14 = -[BLTRemoteObject connectionStatus](self->_gizmoConnection, "connectionStatus");
  if (v14 != (void *)1)
  {
    blt_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_DEFAULT, "Not locally connected to gizmo. Replying to local bulletin board immediately.", (uint8_t *)buf, 2u);
    }

    if (v8)
    {
      objc_msgSend(v13, "publisherMatchID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sectionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replyToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:finalReply:replyToken:](self, "_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:finalReply:replyToken:", 0, v16, v17, 0, v18);

    }
  }
  v27 = v8;
  v26 = -[BLTRemoteObject isPairedDeviceReady](self->_gizmoConnection, "isPairedDeviceReady");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", BLTGetPlayLightsAndSirensTimeout(v14 == (void *)1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  objc_msgSend(v12, "replyToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  gizmoConnection = self->_gizmoConnection;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __114__BLTBulletinDistributor__sendPBBulletin_forBulletin_feed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded___block_invoke;
  v30[3] = &unk_24D763268;
  objc_copyWeak(v34, buf);
  v23 = v13;
  v31 = v23;
  v34[1] = (id)a5;
  v35 = v29;
  v24 = v20;
  v32 = v24;
  v34[2] = v14;
  v36 = v26;
  v37 = v27;
  v25 = v21;
  v33 = v25;
  -[BLTRemoteGizmoClient addBulletin:playLightsAndSirens:updateType:withTimeout:completion:](gizmoConnection, "addBulletin:playLightsAndSirens:updateType:withTimeout:completion:", v12, v29, a6, v19, v30);

  objc_destroyWeak(v34);
  objc_destroyWeak(buf);

}

void __114__BLTBulletinDistributor__sendPBBulletin_forBulletin_feed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  LOWORD(v4) = *(_WORD *)(a1 + 81);
  objc_msgSend(WeakRetained, "_handleAddBulletin:feed:shouldPlayLightsAndSirens:performedWithSuccess:sendAttemptTime:connectionStatus:isGizmoReady:shouldSendReplyIfNeeded:replyToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v4, *(_QWORD *)(a1 + 48));

}

- (BOOL)_notifyGizmoOfBulletin:(id)a3 forFeed:(unint64_t)a4 updateType:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 shouldSendReplyIfNeeded:(BOOL)a7 attachment:(id)a8 attachmentType:(int64_t)a9 replyToken:(id)a10
{
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  const char *v22;
  BOOL v23;
  BOOL v24;
  BLTWatchKitAppList *watchKitAppList;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  BLTSectionConfiguration *sectionConfiguration;
  void *v40;
  void *v41;
  BLTSectionConfiguration *v42;
  void *v43;
  BLTSectionConfiguration *v44;
  void *v45;
  BLTSectionConfiguration *v46;
  void *v47;
  void *v48;
  BLTSectionConfiguration *v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  BBObserver *bbObserver;
  BOOL v64;
  int v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  BOOL v72;
  id v73;
  unint64_t v74;
  BOOL v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  int64_t v84;
  unint64_t v85;
  unint64_t v86;
  BOOL v87;
  BOOL v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  unint64_t v92;
  __int16 v93;
  const char *v94;
  uint64_t v95;

  v12 = a6;
  v95 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a8;
  v18 = a10;
  blt_general_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "publisherMatchID");
    v20 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = "NO";
    *(_DWORD *)buf = 138412802;
    v90 = v21;
    if (v12)
      v22 = "YES";
    v91 = 2048;
    v92 = a4;
    v93 = 2080;
    v94 = v22;
    _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _notifyGizmoOfBulletin with publisherMatchID: %@ forFeed: %lu playLightsAndSirens: %s", buf, 0x20u);

    v18 = v20;
  }

  v23 = -[BLTBulletinDistributor _rememberBulletin:forFeed:syncChangesToWatch:](self, "_rememberBulletin:forFeed:syncChangesToWatch:", v16, a4, 1);
  v24 = v23;
  if (v23)
  {
    v75 = v23;
    v76 = v18;
    v77 = v17;
    -[BLTBulletinDistributor _postWillSendBulletinToGizmoNotificationForBulletin:](self, "_postWillSendBulletinToGizmoNotificationForBulletin:", v16);
    objc_msgSend(v16, "bulletinID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->_bulletinIDsWaitingOnGizmoAdd, "addObject:");
    watchKitAppList = self->_watchKitAppList;
    objc_msgSend(v16, "sectionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTWatchKitAppList watchKitAppDefinitionWithBundleID:](watchKitAppList, "watchKitAppDefinitionWithBundleID:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDC1538];
    objc_msgSend(v16, "sectionID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "applicationProxyForIdentifier:", v29);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "sectionID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "publisherMatchID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v78 = (void *)v32;
    -[BLTGizmoLegacyMap gizmoSectionInfoForPhoneKey:](self->_gizmoLegacyMap, "gizmoSectionInfoForPhoneKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "mappedSectionID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v36 = v34;
    }
    else
    {
      objc_msgSend(v16, "sectionID");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v36;

    -[BLTSettingSync universalSectionIDForSectionID:](self->_settingSync, "universalSectionIDForSectionID:", v38);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTRemoteGizmoClient queuePendingRequests](self->_gizmoConnection, "queuePendingRequests");
    sectionConfiguration = self->_sectionConfiguration;
    objc_msgSend(v16, "sectionID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionConfigurationInternal watchVersionThatUsesUserInfoForContextForSectionID:](sectionConfiguration, "watchVersionThatUsesUserInfoForContextForSectionID:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v38;
    v67 = v41;
    if (v41)
      v66 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(v41, "unsignedIntegerValue")) ^ 1;
    else
      LOBYTE(v66) = 0;
    v42 = self->_sectionConfiguration;
    objc_msgSend(v16, "sectionID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = !-[BLTSectionConfigurationInternal hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:](v42, "hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:", v43);

    v44 = self->_sectionConfiguration;
    objc_msgSend(v16, "sectionID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[BLTSectionConfigurationInternal shouldUsePhoneExpirationDateForSectionID:](v44, "shouldUsePhoneExpirationDateForSectionID:", v45);

    v46 = self->_sectionConfiguration;
    objc_msgSend(v16, "sectionID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionConfigurationInternal watchVersionThatUsesAttachmentURLForSectionID:](v46, "watchVersionThatUsesAttachmentURLForSectionID:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = self->_sectionConfiguration;
    objc_msgSend(v16, "sectionID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[BLTSectionConfigurationInternal hasSectionIDOptedOutOfAttachmentCoordination:](v49, "hasSectionIDOptedOutOfAttachmentCoordination:", v50);

    v74 = a4;
    v71 = v12;
    v72 = a7;
    if (v48)
      v52 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(v48, "unsignedIntegerValue")) ^ 1;
    else
      v52 = 0;
    if (v51)
      v53 = 2;
    else
      v53 = v52;
    -[NSObject watchKitAppBundleID](v27, "watchKitAppBundleID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    bbObserver = self->_bbObserver;
    objc_msgSend(v79, "teamID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:](self->_gizmoLegacyMap, "gizmoPublisherBulletinIDForPhoneKey:", v78);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap categoryIDForBulletinKey:](self->_gizmoLegacyMap, "categoryIDForBulletinKey:", v78);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTGizmoLegacyMap sectionSubtypeForBulletinKey:](self->_gizmoLegacyMap, "sectionSubtypeForBulletinKey:", v78);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __149__BLTBulletinDistributor__notifyGizmoOfBulletin_forFeed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded_attachment_attachmentType_replyToken___block_invoke;
    v80[3] = &unk_24D763290;
    v80[4] = self;
    v17 = v77;
    v81 = v77;
    v84 = a9;
    v85 = v74;
    v86 = a5;
    v87 = v71;
    v88 = v72;
    v82 = v16;
    v83 = v70;
    v73 = v70;
    v60 = v53;
    BYTE1(v59) = v65;
    LOBYTE(v59) = v66;
    v18 = v76;
    LOBYTE(v58) = v64;
    +[BLTPBBulletin bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:attachOption:completion:](BLTPBBulletin, "bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:attachOption:completion:", v82, v62, bbObserver, v74, v61, v68, v58, v76, v54, v55, v69, v56, v59, v60, v80);

    v37 = v27;
    v24 = v75;
  }
  else
  {
    blt_notification_size_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[BLTBulletinDistributor _notifyGizmoOfBulletin:forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:].cold.1(v16, v37);
  }

  return v24;
}

uint64_t __149__BLTBulletinDistributor__notifyGizmoOfBulletin_forFeed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded_attachment_attachmentType_replyToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = a2;
  objc_msgSend(v3, "_attachAttachment:attachmentType:toBulletin:", v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "_attachIconToBulletin:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_sendPBBulletin:forBulletin:feed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89));

  objc_msgSend(*(id *)(a1 + 32), "_performNextPendingBulletinUpdateForBulletinID:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObject:", *(_QWORD *)(a1 + 56));
}

- (id)_bulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
  void *v5;
  void *v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  char v19;
  char v20;
  void *v21;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
  {
    v16 = 0;
    goto LABEL_30;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bulletins, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v13, "bulletins");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v27)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v14 = *(_QWORD *)v29;
  v24 = v12;
  v25 = *(_QWORD *)v29;
  v23 = v13;
  while (2)
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "bulletin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "publisherBulletinID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v10);
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v16, "recordID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isEqualToString:", v11) & 1) != 0)
          goto LABEL_26;
      }
      if (v11)
      {
        if (v10)
        {
          v20 = 0;
          goto LABEL_17;
        }
LABEL_15:
        objc_msgSend(v16, "recordID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "isEqualToString:", v11);

        v14 = v25;
        if (v11)
          goto LABEL_17;
        goto LABEL_16;
      }
      objc_msgSend(v16, "publisherBulletinID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v10))
      {

        if ((v19 & 1) != 0)
LABEL_26:

LABEL_28:
        v13 = v23;
        v12 = v24;
        goto LABEL_29;
      }
      if (!v10)
        goto LABEL_15;
      v20 = 0;
LABEL_16:

LABEL_17:
      if ((v19 & 1) != 0)

      if ((v20 & 1) != 0)
        goto LABEL_28;

    }
    v16 = 0;
    v13 = v23;
    v12 = v24;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v27)
      continue;
    break;
  }
LABEL_29:

LABEL_30:
  return v16;
}

- (BOOL)_willNanoPresent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFE7FLL) == 0;
}

- (unint64_t)_nanoPresentableFeedFromPhoneFeed:(unint64_t)a3
{
  if ((a3 & 0x817E) == 0x10)
    return a3 | 4;
  else
    return a3;
}

- (BOOL)_willNanoPresent:(unint64_t)a3 forBulletin:(id)a4 feed:(unint64_t)a5
{
  __int16 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  BOOL v16;
  char v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  if ((v5 & 0x817E) != 0x10)
    goto LABEL_6;
  objc_msgSend(v8, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {
    v14 = objc_msgSend(v9, "isLoading");

    if ((v14 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v12 = (void *)v11;
    objc_msgSend(v9, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {

LABEL_6:
      v15 = 1;
      goto LABEL_7;
    }
    v18 = objc_msgSend(v9, "isLoading");

    if ((v18 & 1) != 0)
      goto LABEL_6;
  }
  blt_general_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "bulletinID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v20;
    _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_DEFAULT, "Bulletin with id: %@ has no message and was sent to sounds feed only. Should not coordinate", (uint8_t *)&v21, 0xCu);

  }
  v15 = 0;
LABEL_7:
  v16 = -[BLTBulletinDistributor _willNanoPresent:](self, "_willNanoPresent:", a3);

  return v15 & v16;
}

- (void)_reloadBulletinsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BBObserver *bbObserver;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BLTBulletinDistributor _obsoletionDateRelativeToNow](self, "_obsoletionDateRelativeToNow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bbObserver = self->_bbObserver;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke;
  v8[3] = &unk_24D763330;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[BBObserver getPublisherMatchIDsOfBulletinsPublishedAfterDate:withCompletion:](bbObserver, "getPublisherMatchIDsOfBulletinsPublishedAfterDate:withCompletion:", v5, v8);

}

void __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  uint64_t v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_2;
  v8[3] = &unk_24D763308;
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_5;
  v6[3] = &unk_24D762270;
  v4 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v6[1] = 3221225472;
  v6[4] = v9;
  v7 = v4;
  +[BLTBulletinFetcher batchBulletinFetchForBulletinIDs:fetcher:completion:](BLTBulletinFetcher, "batchBulletinFetchForBulletinIDs:fetcher:completion:", a2, v8, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBulletinFetcher:", v5);

}

void __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_3;
  v11[3] = &unk_24D7632E0;
  v11[4] = v8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "getBulletinsForPublisherMatchIDs:sectionID:withCompletion:", a2, a3, v11);

}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_4;
  v4[3] = &unk_24D7632B8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rememberBulletin:forFeed:syncChangesToWatch:", a2, 0, 0);
}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setBulletinFetcher:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_obsoletionDateRelativeToNow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_sendCurrentBulletinIdentifiers
{
  BLTPBFullBulletinList *v3;
  void *v4;
  NSMutableDictionary *bulletins;
  uint64_t v6;
  BLTPBFullBulletinList *v7;
  id v8;
  _QWORD v9[4];
  BLTPBFullBulletinList *v10;
  _QWORD v11[5];
  id v12;

  v3 = objc_alloc_init(BLTPBFullBulletinList);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bulletins = self->_bulletins;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke;
  v11[3] = &unk_24D763380;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bulletins, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_3;
  v9[3] = &unk_24D7633D0;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[BLTRemoteGizmoClient updateBulletinList:](self->_gizmoConnection, "updateBulletinList:", v7);

}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "bulletins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_2;
  v6[3] = &unk_24D763358;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  BLTPBBulletinIdentifier *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a2, "bulletin");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "publisherMatchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "gizmoSectionInfoForPhoneKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mappedSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v15, "sectionID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);
  }
  v12 = objc_alloc_init(BLTPBBulletinIdentifier);
  objc_msgSend(v15, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinIdentifier setRecordID:](v12, "setRecordID:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "gizmoPublisherBulletinIDForPhoneKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinIdentifier setPublisherBulletinID:](v12, "setPublisherBulletinID:", v14);

  objc_msgSend(v11, "addObject:", v12);
}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BLTPBSectionBulletinList *v7;
  BLTPBSectionBulletinList *v8;
  _QWORD v9[4];
  BLTPBSectionBulletinList *v10;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(BLTPBSectionBulletinList);
  -[BLTPBSectionBulletinList setSectionID:](v7, "setSectionID:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_4;
  v9[3] = &unk_24D7633A8;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "addSectionBulletinList:", v8);
}

uint64_t __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBulletinIdentifier:", a2);
}

- (void)_performNextPendingBulletinUpdateForBulletinID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingBulletinUpdates, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    blt_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "updateType");
      v9 = CFSTR("remove");
      if (v8 != 1)
        v9 = 0;
      if (!v8)
        v9 = CFSTR("modify");
      v10 = v9;
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Performing pending update type %@ for %@", (uint8_t *)&v14, 0x16u);

    }
    v11 = objc_msgSend(v6, "updateType");
    if (v11 == 1)
    {
      objc_msgSend(v6, "bulletin");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTBulletinDistributor _performRemoveBulletin:forFeed:](self, "_performRemoveBulletin:forFeed:", v13, objc_msgSend(v6, "feed"));

      -[BLTBulletinDistributor _performNextPendingBulletinUpdateForBulletinID:](self, "_performNextPendingBulletinUpdateForBulletinID:", v4);
    }
    else if (!v11)
    {
      objc_msgSend(v6, "bulletin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTBulletinDistributor _performModifyBulletin:forFeed:](self, "_performModifyBulletin:forFeed:", v12, objc_msgSend(v6, "feed"));

    }
  }

}

- (BOOL)_enqueuBulletinUpdate:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  int v17;
  __CFString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "bulletinID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSMutableSet containsObject:](self->_bulletinIDsWaitingOnGizmoAdd, "containsObject:", v9);
  if (v10)
  {
    os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingBulletinUpdates, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingBulletinUpdates, "setObject:forKeyedSubscript:", v11, v9);
      os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
    }
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("remove");
      if (a3 != 1)
        v13 = 0;
      if (!a3)
        v13 = CFSTR("modify");
      v14 = v13;
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      v21 = 2048;
      v22 = a5;
      _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_DEFAULT, "Enqueuing bulletin update: %@ for bulletin: %@ feed: %lu", (uint8_t *)&v17, 0x20u);

    }
    +[BLTBulletinDistributorBulletinUpdate bulletinUpdateWithType:bulletin:feed:](BLTBulletinDistributorBulletinUpdate, "bulletinUpdateWithType:bulletin:feed:", a3, v8, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

  }
  return v10;
}

- (void)_removeTranscodedAttachmentIfNeededForBulletin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "bulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    BLTBulletinAttachmentsURL(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v10);
      v8 = v10;

      if ((v7 & 1) == 0)
      {
        blt_general_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BLTBulletinDistributor _removeTranscodedAttachmentIfNeededForBulletin:].cold.1((uint64_t)v5, (uint64_t)v8, v9);

      }
    }

  }
}

- (void)_cleanupForAddedBulletin:(id)a3
{
  id v4;
  BLTGizmoLegacyMap *gizmoLegacyMap;
  void *v6;
  id v7;

  v4 = a3;
  -[BLTBulletinDistributor _removeTranscodedAttachmentIfNeededForBulletin:](self, "_removeTranscodedAttachmentIfNeededForBulletin:", v4);
  objc_msgSend(MEMORY[0x24BDF8818], "notificationForBulletin:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  gizmoLegacyMap = self->_gizmoLegacyMap;
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTGizmoLegacyMap unmapNotification:sectionID:](gizmoLegacyMap, "unmapNotification:sectionID:", v7, v6);
}

+ (id)stringForSettingsWillPresentBlockedBy:(unint64_t)a3
{
  return _stringForSettingsWillPresentBlockedBy(a3);
}

- (void)setReplyBlock:(id)a3 forSection:(id)a4 bulletin:(id)a5 publicationDate:(id)a6 replyToken:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  blt_general_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_2173D9000, v16, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor setReplyBlock: forSection: %@ bulletin: %@", (uint8_t *)&v19, 0x16u);
  }

  +[BLTLightsAndSirensReplyInfoCache sharedReplyCache](BLTLightsAndSirensReplyInfoCache, "sharedReplyCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cacheReply:withSectionID:bulletinID:publicationDate:replyToken:", v15, v11, v12, v14, v13);

  blt_general_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_2173D9000, v18, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor saved new reply", (uint8_t *)&v19, 2u);
  }

}

- (void)clearReplyBlockForReplyToken:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  blt_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor clearReplyBlockForReplyToken: %@", (uint8_t *)&v8, 0xCu);
  }

  +[BLTLightsAndSirensReplyInfoCache sharedReplyCache](BLTLightsAndSirensReplyInfoCache, "sharedReplyCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheDidPlayLightsAndSirens:withReplyToken:", 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[BLTLightsAndSirensReplyInfoCache sharedReplyCache](BLTLightsAndSirensReplyInfoCache, "sharedReplyCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purgeReplyInfo:withReplyToken:", v6, v3);

}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[BLTBulletinDistributor observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:](self, "observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:", a3, a4, a5, a6, 0, 0, v7, a7);
}

- (id)_replyTokenForSectionID:(id)a3 publisherMatchID:(id)a4
{
  void *v4;
  void *v5;

  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_subscriberWillAllowBulletin:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 *p_buf;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 8.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin with timeout %@", (uint8_t *)&buf, 0xCu);

  }
  -[BLTBulletinDistributor clientReplyTimeoutManager](self, "clientReplyTimeoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherMatchID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke;
  v23[3] = &unk_24D7633F8;
  v25 = v26;
  v14 = v7;
  v24 = v14;
  objc_msgSend(v10, "addClientReplyTimeoutForBulletin:sectionID:timeout:handler:", v11, v12, v23, 8.0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v29[5];
  v29[5] = v15;

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v36 = 0;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_158;
  v18[3] = &unk_24D763448;
  p_buf = &buf;
  v21 = v26;
  v18[4] = self;
  v22 = &v28;
  v17 = v14;
  v19 = v17;
  -[BLTBulletinDistributor _pingSubscriberWithBulletin:ack:](self, "_pingSubscriberWithBulletin:ack:", v6, v18);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

}

uint64_t __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin timed out waiting for subscriber, returning allow bulletin", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_158(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  __int128 v6;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_2;
  block[3] = &unk_24D763420;
  v10 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  dispatch_async(v4, block);

}

void __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin received ack from subscriber", (uint8_t *)&v7, 2u);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_INFO, "BLTBulletinDistributor _subscriberWillAllowBulletin this is first ack", (uint8_t *)&v7, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      blt_general_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin not timed out, returning %@", (uint8_t *)&v7, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "clientReplyTimeoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateClientReplyTimeout:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) == 1);
    }
  }
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 attachment:(id)a7 attachmentType:(int64_t)a8 alwaysSend:(BOOL)a9 withReply:(id)a10
{
  id v16;
  id v17;
  void *v18;
  BLTSimpleCache *mruCacheOfSectionIDs;
  void *v20;
  id v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void (**v33)(_QWORD);
  uint64_t v34;
  void *v35;
  void *v36;
  BLTSettingSync *settingSync;
  void *v38;
  void (**v39)(_QWORD);
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  _QWORD v48[5];
  void (**v49)(_QWORD);
  uint64_t *v50;
  __int128 *p_buf;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  unint64_t v63;
  int64_t v64;
  BOOL v65;
  BOOL v66;
  __int128 buf;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v16 = a4;
  v44 = a7;
  v17 = a10;
  objc_msgSend(v16, "sectionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    mruCacheOfSectionIDs = self->_mruCacheOfSectionIDs;
    objc_msgSend(v16, "sectionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSimpleCache cacheObject:](mruCacheOfSectionIDs, "cacheObject:", v20);

    kdebug_trace();
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke;
    v59[3] = &unk_24D763498;
    v65 = a9;
    v59[4] = self;
    v21 = v16;
    v60 = v21;
    v63 = a5;
    v66 = a6;
    v62 = v17;
    v61 = v44;
    v64 = a8;
    v22 = (void (**)(_QWORD))MEMORY[0x219A0C15C](v59);
    -[BLTBulletinDistributor _mapBulletin:](self, "_mapBulletin:", v21);
    if (a9)
    {
      v22[2](v22);
    }
    else
    {
      objc_msgSend(v21, "sectionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "publisherMatchID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v24, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[BLTGizmoLegacyMap gizmoSectionInfoForPhoneKey:](self->_gizmoLegacyMap, "gizmoSectionInfoForPhoneKey:", v42);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "icon");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIcon:", v27);

      objc_msgSend(v21, "sectionDisplayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDisplayName:", v28);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v68 = 0x3032000000;
      v69 = __Block_byref_object_copy__6;
      v70 = __Block_byref_object_dispose__6;
      v71 = 0;
      v55 = 0;
      v56 = &v55;
      v57 = 0x2020000000;
      v58 = 0;
      -[BLTBulletinDistributor clientReplyTimeoutManager](self, "clientReplyTimeoutManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "publisherMatchID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sectionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = BLTGetSettingSyncForNotificationTimeout();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2;
      v52[3] = &unk_24D7633F8;
      v54 = &v55;
      v33 = v22;
      v53 = v33;
      objc_msgSend(v29, "addClientReplyTimeoutForBulletin:sectionID:timeout:handler:", v30, v31, v52, v32);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v34;

      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_173;
      v48[3] = &unk_24D7634C0;
      v50 = &v55;
      v48[4] = self;
      p_buf = &buf;
      v49 = v33;
      v36 = (void *)MEMORY[0x219A0C15C](v48);
      settingSync = self->_settingSync;
      objc_msgSend(v21, "sectionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_174;
      v45[3] = &unk_24D7633F8;
      v47 = &v55;
      v39 = v36;
      v46 = v39;
      v40 = -[BLTSettingSync performSyncIfNeededForSectionID:gizmoSectionInfo:completion:](settingSync, "performSyncIfNeededForSectionID:gizmoSectionInfo:completion:", v38, v26, v45);

      if (v40 == 2 && !*((_BYTE *)v56 + 24))
      {
        blt_general_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[BLTBulletinDistributor observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:].cold.1();

        v39[2](v39);
      }

      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(&buf, 8);

    }
  }
  else
  {
    blt_general_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_2173D9000, v23, OS_LOG_TYPE_ERROR, "Serious error adding bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&buf, 0xCu);
    }

    _BLTCaptureBug(CFSTR("BBAddBulletinSectionNil"));
  }

}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  char v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 80))
  {
    v2 = 0;
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(*(id *)(a1 + 40), "sectionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "subsectionIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "sectionSubtype");
    objc_msgSend(*(id *)(a1 + 40), "categoryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:category:ignoresDowntime:isCritical:", v4, v5, v6, v7, objc_msgSend(*(id *)(a1 + 40), "ignoresDowntime"), objc_msgSend(*(id *)(a1 + 40), "hasCriticalIcon"));

  }
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "publisherMatchID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v12 = "NO";
    if (*(_BYTE *)(a1 + 81))
      v13 = "YES";
    else
      v13 = "NO";
    if (objc_msgSend(*(id *)(a1 + 40), "turnsOnDisplay"))
      v12 = "YES";
    _stringForSettingsWillPresentBlockedBy(v2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v43 = (const char *)v9;
    v44 = 2112;
    v45 = v10;
    v46 = 2048;
    v47 = v11;
    v48 = 2080;
    v49 = v13;
    v50 = 2080;
    v51 = v12;
    v52 = 2112;
    v53 = v14;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor addBulletin: %@ (publisherMatchID: %@) forFeed: %lu playLightsAndSirens: %s turnsOnDisplay: %s willPresentNotification: %@", buf, 0x3Eu);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_willNanoPresent:forBulletin:feed:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cleanupForAddedBulletin:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  v15 = *(_QWORD *)(a1 + 64) & 0x817ELL;
  v16 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_162;
  v32[3] = &unk_24D763470;
  v40 = v15 != 0;
  v37 = v2;
  v17 = *(id *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 32);
  v33 = v17;
  v34 = v18;
  v19 = *(void **)(a1 + 56);
  v38 = *(_QWORD *)(a1 + 64);
  v36 = v19;
  v41 = *(_BYTE *)(a1 + 81);
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 72);
  v35 = v20;
  v39 = v21;
  v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0C15C](v32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "subscribers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sectionID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "hasSubscribersForSectionID:", v24);

  blt_general_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = "NO";
    if (v25)
      v27 = "YES";
    *(_DWORD *)buf = 136315138;
    v43 = v27;
    _os_log_impl(&dword_2173D9000, v26, OS_LOG_TYPE_INFO, "BLTBulletinDistributor addBulletin hasSubscribers: %s", buf, 0xCu);
  }

  if (!v25)
    goto LABEL_21;
  v29 = *(void **)(a1 + 32);
  v28 = *(_QWORD *)(a1 + 40);
  if (!v15)
  {
    objc_msgSend(v29, "_pingSubscriberWithBulletin:ack:", v28, 0);
LABEL_21:
    v22[2](v22, 1);
    goto LABEL_22;
  }
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_172;
  v30[3] = &unk_24D762AC0;
  v31 = v22;
  objc_msgSend(v29, "_subscriberWillAllowBulletin:completion:", v28, v30);

LABEL_22:
}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_162(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a2 && *(_BYTE *)(a1 + 88))
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (objc_msgSend(*(id *)(a1 + 32), "hasCriticalIcon"))
      v5 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsCriticalAndGroupingSettings") ^ 1;
    else
      v5 = 0;
    v9 = objc_msgSend(*(id *)(a1 + 32), "blt_isVOIPCall");
    v10 = v9;
    v11 = 1;
    if (v4 != 128 && v4 != 256)
      v11 = v5 | v9;
    v12 = objc_msgSend(*(id *)(a1 + 40), "_nanoPresentableFeedFromPhoneFeed:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "sectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAddBulletinReplyToken"))
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
    }
    else
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "publisherMatchID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_replyTokenForSectionID:publisherMatchID:", v13, v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (v4 == 128)
      {
        v17 = "Wrist detection disabled";
      }
      else if (v4 == 256)
      {
        v17 = "Forwarded only";
      }
      else
      {
        v22 = "Alerting everywhere";
        if (v10)
          v22 = "Ringtone call";
        if (v5)
          v17 = "Critical icon";
        else
          v17 = v22;
      }
      blt_general_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = v17;
        _os_log_impl(&dword_2173D9000, v23, OS_LOG_TYPE_INFO, "BLTBulletinDistributor: %s so lie to Companion that Gizmo won't alert.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "publisherMatchID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "publishDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setReplyBlock:forSection:bulletin:publicationDate:replyToken:", v18, v13, v20, v21, v16);

    }
    v25 = *(void **)(a1 + 32);
    v24 = *(void **)(a1 + 40);
    v26 = objc_msgSend(v25, "turnsOnDisplay");
    if (((v26 ^ 1 | v11) & 1) == 0)
      v26 = *(_BYTE *)(a1 + 89) != 0;
    if ((objc_msgSend(v24, "_notifyGizmoOfBulletin:forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:", v25, v12, 0, v26, v11 ^ 1u, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), v16) & 1) == 0)
    {
      blt_general_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2173D9000, v27, OS_LOG_TYPE_DEFAULT, "Will not notify gizmo", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_cleanupForAddedBulletin:", *(_QWORD *)(a1 + 32));
      if ((v11 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "clearReplyBlockForReplyToken:", v16);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
    }

  }
  else
  {
    blt_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = "subscriber suppressed";
      if (a2)
        v7 = "unknown reason";
      if (*(_BYTE *)(a1 + 88))
        v8 = v7;
      else
        v8 = "Not in interrupting feed";
      *(_DWORD *)buf = 136315138;
      v29 = v8;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_INFO, "BLTBulletinDistributor: %s so not going to coordinate.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_cleanupForAddedBulletin:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    blt_general_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_173(uint64_t a1)
{
  void *v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "clientReplyTimeoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateClientReplyTimeout:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_174(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    blt_general_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Sync'ing section info completed. Performing add bulletin now", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7;
  void *v8;
  NSMutableDictionary *bulletins;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    bulletins = self->_bulletins;
    objc_msgSend(v7, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](bulletins, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bulletinIDToBulletin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bulletinID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14
      && !-[BLTBulletinDistributor _enqueuBulletinUpdate:bulletin:feed:](self, "_enqueuBulletinUpdate:bulletin:feed:", 0, v7, a5))
    {
      -[BLTBulletinDistributor _performModifyBulletin:forFeed:](self, "_performModifyBulletin:forFeed:", v7, a5);
    }
  }
  else
  {
    blt_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_ERROR, "Serious error modifying bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&v16, 0xCu);
    }

    _BLTCaptureBug(CFSTR("BBModifyBulletinSectionNil"));
  }

}

- (void)_performModifyBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  blt_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v9 = a4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Modifying bulletin for feed: %lu %@", buf, 0x16u);
  }

  -[BLTBulletinDistributor _notifyGizmoOfBulletin:forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:](self, "_notifyGizmoOfBulletin:forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:", v6, a4, 1, 0, 0, 0, 0, 0);
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7;
  void *v8;
  NSMutableDictionary *bulletins;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    bulletins = self->_bulletins;
    objc_msgSend(v7, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](bulletins, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bulletinIDToBulletin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bulletinID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14
      && !-[BLTBulletinDistributor _enqueuBulletinUpdate:bulletin:feed:](self, "_enqueuBulletinUpdate:bulletin:feed:", 1, v7, a5))
    {
      -[BLTBulletinDistributor _performRemoveBulletin:forFeed:](self, "_performRemoveBulletin:forFeed:", v7, a5);
    }
  }
  else
  {
    blt_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_ERROR, "Serious error removing bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&v16, 0xCu);
    }

    _BLTCaptureBug(CFSTR("BBRemoveBulletinSectionNil"));
  }

}

- (void)_performRemoveBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSMutableSet *lockScreenFeed;
  void *v9;
  NSMutableSet *noticesFeed;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  NSMutableSet *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  BLTRemoteGizmoClient *gizmoConnection;
  void *v30;
  void *v31;
  NSMutableDictionary *bulletins;
  void *v33;
  void *v34;
  BLTHashCache *attachmentHashCache;
  void *v36;
  void *v37;
  BLTHashCache *iconHashCache;
  void *v39;
  void *v40;
  int v41;
  unint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  blt_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 134218242;
    v42 = a4;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Removing bulletin for feed: %lu %@", (uint8_t *)&v41, 0x16u);
  }

  if ((a4 & 8) != 0)
  {
    lockScreenFeed = self->_lockScreenFeed;
    objc_msgSend(v6, "bulletinID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](lockScreenFeed, "removeObject:", v9);

  }
  if ((a4 & 1) != 0)
  {
    noticesFeed = self->_noticesFeed;
    objc_msgSend(v6, "bulletinID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](noticesFeed, "removeObject:", v11);

  }
  v12 = self->_lockScreenFeed;
  objc_msgSend(v6, "bulletinID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](v12, "containsObject:", v13) & 1) != 0)
    goto LABEL_16;
  v14 = self->_noticesFeed;
  objc_msgSend(v6, "bulletinID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = -[NSMutableSet containsObject:](v14, "containsObject:", v15);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateOrRecencyDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingTimeInterval:", 86400.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v13);
    v19 = v18;

    if (v19 <= 0.0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "sectionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publisherMatchID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[BLTGizmoLegacyMap gizmoSectionInfoForPhoneKey:](self->_gizmoLegacyMap, "gizmoSectionInfoForPhoneKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mappedSectionID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(v6, "sectionID");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    gizmoConnection = self->_gizmoConnection;
    -[BLTGizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:](self->_gizmoLegacyMap, "gizmoPublisherBulletinIDForPhoneKey:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTRemoteGizmoClient removeBulletinWithPublisherBulletinID:recordID:sectionID:withTimeout:](gizmoConnection, "removeBulletinWithPublisherBulletinID:recordID:sectionID:withTimeout:", v30, v31, v28, v20);

    -[BLTBulletinDistributor _cleanupForAddedBulletin:](self, "_cleanupForAddedBulletin:", v6);
    bulletins = self->_bulletins;
    objc_msgSend(v6, "sectionID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](bulletins, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeBulletin:", v6);

    attachmentHashCache = self->_attachmentHashCache;
    objc_msgSend(v6, "sectionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publisherMatchID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTHashCache updateCacheWithItems:forSectionID:matchID:result:](attachmentHashCache, "updateCacheWithItems:forSectionID:matchID:result:", 0, v36, v37, 0);

    iconHashCache = self->_iconHashCache;
    objc_msgSend(v6, "sectionID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publisherMatchID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTHashCache updateCacheWithItems:forSectionID:matchID:result:](iconHashCache, "updateCacheWithItems:forSectionID:matchID:result:", 0, v39, v40, 0);

LABEL_16:
  }

}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BLTBulletinDistributor setSummarizationSetting:](self, "setSummarizationSetting:", objc_msgSend(a4, "globalSummarizationSetting", a3));
  blt_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLTBulletinDistributor summarizationSetting](self, "summarizationSetting"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Updated summarization setting to %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 finalReply:(BOOL)a6 replyToken:(id)a7
{
  _BOOL8 v10;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v10 = a3;
  v12 = (void *)MEMORY[0x24BDBCE60];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v12, "date");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = a6;
  -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:](self, "_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:", v10, v15, v14, v17, v17, 0, v16, v13);

}

- (void)handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 replyToken:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  BLTWorkQueue();
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__BLTBulletinDistributor_handleDidPlayLightsAndSirens_forBulletin_inPhoneSection_transmissionDate_receptionDate_replyToken___block_invoke;
  block[3] = &unk_24D7634E8;
  v31 = a3;
  block[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(v19, block);

}

uint64_t __124__BLTBulletinDistributor_handleDidPlayLightsAndSirens_forBulletin_inPhoneSection_transmissionDate_receptionDate_replyToken___block_invoke(uint64_t a1)
{
  uint64_t v2;

  LOBYTE(v2) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:", *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, v2, *(_QWORD *)(a1 + 72));
}

- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 fromGizmo:(BOOL)a8 finalReply:(BOOL)a9 replyToken:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  _BYTE v37[12];
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v10 = a8;
  v13 = a3;
  v44 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a10;
  if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAddBulletinReplyToken") & 1) == 0)
  {
    -[BLTBulletinDistributor _replyTokenForSectionID:publisherMatchID:](self, "_replyTokenForSectionID:publisherMatchID:", v16, v15);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = v19;
  }
  if (v18)
  {
    if (v13)
      v20 = 1;
    else
      v20 = 2;
    +[BLTLightsAndSirensReplyInfoCache sharedReplyCache](BLTLightsAndSirensReplyInfoCache, "sharedReplyCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cacheDidPlayLightsAndSirens:withReplyToken:", v20, v18);
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      blt_general_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:].cold.2((uint64_t)v18, v23);
      goto LABEL_31;
    }
    -[NSObject publisherMatchID](v22, "publisherMatchID");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject sectionID](v22, "sectionID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    blt_general_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = "NO";
      *(_DWORD *)v37 = 136315906;
      if (v13)
        v26 = "YES";
      *(_QWORD *)&v37[4] = v26;
      v38 = 2112;
      v39 = v18;
      v40 = 2112;
      v41 = v23;
      v42 = 2112;
      v43 = v24;
      _os_log_impl(&dword_2173D9000, v25, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor handleDidPlayLightsAndSirens: %s forReplyToken: %@ bulletin: %@ inSection: %@", v37, 0x2Au);
    }

    if (v10)
    {
      blt_perf_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", v17);
        *(_DWORD *)v37 = 138412802;
        *(_QWORD *)&v37[4] = v24;
        v38 = 2112;
        v39 = v23;
        v40 = 2048;
        v41 = v29;
        _os_log_impl(&dword_2173D9000, v27, OS_LOG_TYPE_INFO, "%@.%@.GizmoToCompanionDelay: %f", v37, 0x20u);

      }
      blt_perf_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bulletinPublicationDate](v22, "bulletinPublicationDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSinceDate:", v32);
        *(_DWORD *)v37 = 138412802;
        *(_QWORD *)&v37[4] = v24;
        v38 = 2112;
        v39 = v23;
        v40 = 2048;
        v41 = v33;
        _os_log_impl(&dword_2173D9000, v30, OS_LOG_TYPE_INFO, "%@.%@.PublicationToReplayDelay: %f", v37, 0x20u);

      }
    }
    v34 = -[NSObject sendReply](v22, "sendReply", *(_QWORD *)v37);
    blt_general_log();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_2173D9000, v35, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor sending reply", v37, 2u);
      }

      if (!a9)
        goto LABEL_30;
      +[BLTLightsAndSirensReplyInfoCache sharedReplyCache](BLTLightsAndSirensReplyInfoCache, "sharedReplyCache");
      v35 = objc_claimAutoreleasedReturnValue();
      -[NSObject purgeReplyInfo:withReplyToken:](v35, "purgeReplyInfo:withReplyToken:", v22, v18);
    }
    else if (v36)
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2173D9000, v35, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor saved didPlayLightsAndSirens state", v37, 2u);
    }

LABEL_30:
LABEL_31:

    goto LABEL_32;
  }
  blt_general_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:].cold.1();
LABEL_32:

}

- (void)handleAction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BLTBulletinDistributor *v9;

  v4 = a3;
  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BLTBulletinDistributor_handleAction___block_invoke;
  v7[3] = &unk_24D761AA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__BLTBulletinDistributor_handleAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  unint64_t v47;
  NSObject *v48;
  id *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  NSObject *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BLTNameForActionType(objc_msgSend(*(id *)(a1 + 32), "actionType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "publisherBulletinID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v73 = v3;
    v74 = 2112;
    v75 = v4;
    v76 = 2112;
    v77 = v5;
    v78 = 2112;
    v79 = v6;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Received %@ action for publisherBulletinD: %@, recordID: %@, sectionID: %@", buf, 0x2Au);

  }
  v8 = *(void **)(a1 + 40);
  v7 = (id *)(a1 + 40);
  v9 = v7 - 1;
  objc_msgSend(*(v7 - 1), "publisherBulletinID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(v7 - 1), "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(v7 - 1), "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bulletinWithPublisherBulletinID:recordID:sectionID:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  blt_general_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v13;
      _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Found matching bulletin: %@", buf, 0xCu);
    }

    v16 = 0x24BE6B000uLL;
    objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v17 && (unint64_t)-[NSObject bltVersion](v17, "bltVersion") <= 3)
    {
      objc_msgSend(v13, "sectionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

    }
    else
    {
      v19 = 0;
    }
    switch(objc_msgSend(*v9, "actionType"))
    {
      case 3:
        objc_msgSend(v13, "responseForAcknowledgeAction");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v19 = 0;
          goto LABEL_49;
        }
        blt_general_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2173D9000, v46, OS_LOG_TYPE_DEFAULT, "Did not find acknowledgeAction. Synthesizing action.", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BE0FE18], "actionWithIdentifier:", CFSTR("BLTAcknowledgeActionIdentifier"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "responseForAction:", v37);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 6:
        objc_msgSend(v13, "responseForSnoozeAction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_56;
        goto LABEL_49;
      case 7:
        v61 = v15;
        v62 = v7;
        v24 = *v9;
        blt_general_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v24, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v73 = v26;
          _os_log_impl(&dword_2173D9000, v25, OS_LOG_TYPE_INFO, "Looking for action with identifier: %@", buf, 0xCu);

        }
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v63 = v13;
        objc_msgSend(v13, "supplementaryActions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (!v28)
          goto LABEL_30;
        v29 = v28;
        v30 = *(_QWORD *)v68;
        break;
      case 8:
        objc_msgSend(v13, "dismissAction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "responseForAction:", v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_56;
        goto LABEL_49;
      case 11:
        objc_msgSend(v13, "followActivityAction");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend(v13, "responseForAction:", v37);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          blt_general_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = *v7;
            *(_DWORD *)buf = 138412802;
            v73 = v39;
            v74 = 2112;
            v75 = v37;
            v76 = 2112;
            v77 = v21;
            _os_log_impl(&dword_2173D9000, v38, OS_LOG_TYPE_INFO, "%@ handleAction: followActivityAction: %@ response: %@", buf, 0x20u);
          }
        }
        else
        {
          blt_general_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            __39__BLTBulletinDistributor_handleAction___block_invoke_cold_4();
          v21 = 0;
        }

LABEL_48:
        v19 = 0;
        if (v21)
          goto LABEL_49;
        goto LABEL_56;
      default:
        v22 = v13;
        blt_general_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __39__BLTBulletinDistributor_handleAction___block_invoke_cold_3(v7 - 1);

        v13 = v22;
        goto LABEL_56;
    }
LABEL_24:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v31);
      objc_msgSend(v32, "identifier", v61, v62);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToString:", v34);

      if ((v35 & 1) != 0)
        break;
      if (v29 == ++v31)
      {
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v29)
          goto LABEL_24;
LABEL_30:

        v7 = v62;
        v13 = v63;
        v15 = v61;
        goto LABEL_37;
      }
    }
    v13 = v63;
    objc_msgSend(v63, "responseForAction:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v61;
    v7 = v62;
    if (v21)
      goto LABEL_55;
LABEL_37:
    objc_msgSend(v24, "identifier", v61, v62);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      blt_general_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v24, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v73 = v42;
        _os_log_impl(&dword_2173D9000, v41, OS_LOG_TYPE_DEFAULT, "Did not find action with identifier: %@. Synthesizing action.", buf, 0xCu);

      }
      v43 = (void *)MEMORY[0x24BE0FE18];
      objc_msgSend(v24, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "actionWithIdentifier:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "responseForAction:", v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
LABEL_55:

    v19 = 0;
    v16 = 0x24BE6B000;
    if (v21)
    {
LABEL_49:
      v47 = v16;
      v48 = v15;
      v49 = v7;
      objc_msgSend(*v9, "context");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "mutableCopy");

      if (!v51)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(v47 + 1248), "blt_boundedWaitForActivePairedDevice");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", NRWatchOSVersionForRemoteDevice());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKey:", v53, CFSTR("BLTNRWatchOSVersion"));

      objc_msgSend(v21, "setContext:", v51);
      v54 = *v49;
      v55 = (void *)*((_QWORD *)*v49 + 5);
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __39__BLTBulletinDistributor_handleAction___block_invoke_182;
      v64[3] = &unk_24D763510;
      v64[4] = v54;
      v65 = *v9;
      v56 = v21;
      v66 = v56;
      objc_msgSend(v55, "sendResponse:withCompletion:", v56, v64);
      if (v19)
      {
        v57 = (void *)*((_QWORD *)*v49 + 5);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v13);
        v58 = v13;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "sectionID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "clearBulletins:inSection:", v59, v60);

        v13 = v58;
      }

      v15 = v48;
    }
    else
    {
LABEL_56:
      blt_general_log();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        __39__BLTBulletinDistributor_handleAction___block_invoke_cold_2(v9);
    }

  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __39__BLTBulletinDistributor_handleAction___block_invoke_cold_1();
  }

}

void __39__BLTBulletinDistributor_handleAction___block_invoke_182(_QWORD *a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = a1[6];
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ handleAction: SUCCESS: actionInfo: %@ at sending response %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __39__BLTBulletinDistributor_handleAction___block_invoke_182_cold_1();
  }

}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BLTBulletinDistributor *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLTWorkQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__BLTBulletinDistributor_removeBulletinWithPublisherBulletinID_recordID_sectionID___block_invoke;
  v15[3] = &unk_24D762160;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__BLTBulletinDistributor_removeBulletinWithPublisherBulletinID_recordID_sectionID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v11 = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Received remove bulletin for publisherBulletinID: %@, recordID: %@, sectionID %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "_bulletinWithPublisherBulletinID:recordID:sectionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  blt_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "Found matching bulletin: %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(void **)(*(_QWORD *)(a1 + 56) + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearBulletins:inSection:", v8, v10);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Could not find matching bulletin", (uint8_t *)&v11, 2u);
  }

}

- (BOOL)shouldSuppressLightsAndSirensNow
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDB2550], "currentCarPlayExternalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)willSendLightsAndSirensWithPublisherBulletinID:(id)a3 recordID:(id)a4 inPhoneSection:(id)a5 systemApp:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  BLTWorkQueue();
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __118__BLTBulletinDistributor_willSendLightsAndSirensWithPublisherBulletinID_recordID_inPhoneSection_systemApp_completion___block_invoke;
  v21[3] = &unk_24D763538;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v26 = a6;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, v21);

}

void __118__BLTBulletinDistributor_willSendLightsAndSirensWithPublisherBulletinID_recordID_inPhoneSection_systemApp_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_bulletinWithPublisherBulletinID:recordID:sectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 40);
      if (!v5)
        v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v28 = v4;
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)&v28[10] = v5;
      _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: found a stored bulletin for sectionID: %@ publisherMatchID: %@", buf, 0x16u);
    }
    v6 = 0;
LABEL_7:
    v7 = 1;
LABEL_8:

    goto LABEL_9;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "currentLayout");
    v3 = objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSObject elements](v3, "elements", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v23;
      v16 = *MEMORY[0x24BE38278];
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v16);

          if ((v19 & 1) != 0)
          {
            LODWORD(v14) = 1;
            goto LABEL_29;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_29:

    v20 = -[NSObject displayBacklightLevel](v3, "displayBacklightLevel");
    blt_general_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v28 = v20 != 0;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v14;
      _os_log_impl(&dword_2173D9000, v21, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: no stored bulletin and not for a system app. willSend based on screenIsOn: %{BOOL}u isUILocked: %{BOOL}u", buf, 0xEu);
    }

    v6 = 0;
    if (v20)
      v7 = v14 ^ 1;
    else
      v7 = 0;
    goto LABEL_8;
  }
  blt_general_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: no stored bulletin but this is for a system app", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "subscribers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSubscribersForSectionID:", *(_QWORD *)(a1 + 56));

  if (v11)
  {
    v6 = 120;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "subscribers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pingWithRecordID:forSectionID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v28 = 120;
      _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: found subscribers sending response with additional time: %lu", buf, 0xCu);
    }
    goto LABEL_7;
  }
  v6 = 0;
  v7 = 1;
LABEL_9:
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v28 = v7;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = v6;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: sending back response willSend: %{BOOL}u additionalTime: %lu", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v12;
  id v16;
  BBObserver *bbObserver;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v12 = a5;
  v16 = a9;
  bbObserver = self->_bbObserver;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __115__BLTBulletinDistributor__addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke;
  v20[3] = &unk_24D762AC0;
  v21 = v16;
  v18 = v16;
  LOBYTE(v19) = a8;
  -[BLTBulletinDistributor observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:](self, "observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:", bbObserver, a3, a4, v12, a6, a7, v19, v20);

}

uint64_t __115__BLTBulletinDistributor__addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_stateDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[BLTBulletinDistributor settingSync](self, "settingSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSimpleCache objects](self->_mruCacheOfSectionIDs, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingsDescriptionForSectionIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BLTRemoteGizmoClient)gizmoConnection
{
  return self->_gizmoConnection;
}

- (void)setGizmoConnection:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoConnection, a3);
}

- (int64_t)summarizationSetting
{
  return self->_summarizationSetting;
}

- (void)setSummarizationSetting:(int64_t)a3
{
  self->_summarizationSetting = a3;
}

- (BBObserver)bbObserver
{
  return self->_bbObserver;
}

- (void)setBbObserver:(id)a3
{
  objc_storeStrong((id *)&self->_bbObserver, a3);
}

- (NSMutableDictionary)bulletins
{
  return self->_bulletins;
}

- (void)setBulletins:(id)a3
{
  objc_storeStrong((id *)&self->_bulletins, a3);
}

- (NSMutableSet)noticesFeed
{
  return self->_noticesFeed;
}

- (void)setNoticesFeed:(id)a3
{
  objc_storeStrong((id *)&self->_noticesFeed, a3);
}

- (NSMutableSet)lockScreenFeed
{
  return self->_lockScreenFeed;
}

- (void)setLockScreenFeed:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenFeed, a3);
}

- (BLTHashCache)attachmentHashCache
{
  return self->_attachmentHashCache;
}

- (void)setAttachmentHashCache:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentHashCache, a3);
}

- (BLTHashCache)iconHashCache
{
  return self->_iconHashCache;
}

- (void)setIconHashCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconHashCache, a3);
}

- (BLTWatchKitAppList)watchKitAppList
{
  return self->_watchKitAppList;
}

- (void)setWatchKitAppList:(id)a3
{
  objc_storeStrong((id *)&self->_watchKitAppList, a3);
}

- (BLTSettingSync)settingSync
{
  return self->_settingSync;
}

- (void)setSettingSync:(id)a3
{
  objc_storeStrong((id *)&self->_settingSync, a3);
}

- (NSDate)startupTime
{
  return self->_startupTime;
}

- (void)setStartupTime:(id)a3
{
  objc_storeStrong((id *)&self->_startupTime, a3);
}

- (BOOL)standaloneTestModeEnabled
{
  return self->_standaloneTestModeEnabled;
}

- (void)setStandaloneTestModeEnabled:(BOOL)a3
{
  self->_standaloneTestModeEnabled = a3;
}

- (NSMutableDictionary)pendingBulletinUpdates
{
  return self->_pendingBulletinUpdates;
}

- (void)setPendingBulletinUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBulletinUpdates, a3);
}

- (NSMutableSet)bulletinIDsWaitingOnGizmoAdd
{
  return self->_bulletinIDsWaitingOnGizmoAdd;
}

- (void)setBulletinIDsWaitingOnGizmoAdd:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinIDsWaitingOnGizmoAdd, a3);
}

- (BLTClientReplyTimeoutManager)clientReplyTimeoutManager
{
  return self->_clientReplyTimeoutManager;
}

- (void)setClientReplyTimeoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_clientReplyTimeoutManager, a3);
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sectionConfiguration, a3);
}

- (BLTBulletinFetcher)bulletinFetcher
{
  return self->_bulletinFetcher;
}

- (void)setBulletinFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinFetcher, a3);
}

- (BLTPingSubscriberManager)pingSubscriberManager
{
  return self->_pingSubscriberManager;
}

- (void)setPingSubscriberManager:(id)a3
{
  objc_storeStrong((id *)&self->_pingSubscriberManager, a3);
}

- (BLTGizmoLegacyMap)gizmoLegacyMap
{
  return self->_gizmoLegacyMap;
}

- (void)setGizmoLegacyMap:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoLegacyMap, a3);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (BLTSimpleCache)mruCacheOfSectionIDs
{
  return self->_mruCacheOfSectionIDs;
}

- (void)setMruCacheOfSectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mruCacheOfSectionIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mruCacheOfSectionIDs, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_gizmoLegacyMap, 0);
  objc_storeStrong((id *)&self->_pingSubscriberManager, 0);
  objc_storeStrong((id *)&self->_bulletinFetcher, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_clientReplyTimeoutManager, 0);
  objc_storeStrong((id *)&self->_bulletinIDsWaitingOnGizmoAdd, 0);
  objc_storeStrong((id *)&self->_pendingBulletinUpdates, 0);
  objc_storeStrong((id *)&self->_startupTime, 0);
  objc_storeStrong((id *)&self->_settingSync, 0);
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
  objc_storeStrong((id *)&self->_iconHashCache, 0);
  objc_storeStrong((id *)&self->_attachmentHashCache, 0);
  objc_storeStrong((id *)&self->_lockScreenFeed, 0);
  objc_storeStrong((id *)&self->_noticesFeed, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_gizmoConnection, 0);
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "publisherMatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a2, v6, "Not going to store/coordinate bulletin sectionID: %@ publisherMatch: %@", v7);

  OUTLINED_FUNCTION_4_0();
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publisherMatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a2, v6, "Exceeded space for bulletins. Dropping bulletin from coordination sectionID: %@ publisherMatch: %@", v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)_notifyGizmoOfBulletin:(void *)a1 forFeed:(NSObject *)a2 updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publisherMatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a2, v6, "Couldn't store bulletin. Not sending to gizmo sectionID: %@ publisherMatch: %@", v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)_removeTranscodedAttachmentIfNeededForBulletin:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a3, (uint64_t)a3, "Unable to remove transcoded attachment file at %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2173D9000, v0, v1, "Section sync has been waiting. Performing add bulletin anyway!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2173D9000, v0, v1, "Sync'ing section info timed out. Performing add bulletin anyway!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2173D9000, v0, v1, "Received did play lights and sirens message for nil replyToken!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleDidPlayLightsAndSirens:(uint64_t)a1 forBulletin:(NSObject *)a2 inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Error: Trying to cache lights and sirens value for unknown replyToken: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2173D9000, v0, v1, "Could not find matching bulletin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_2(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = OUTLINED_FUNCTION_9(a1);
  BLTNameForActionType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "publisherBulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6(&dword_2173D9000, v7, v8, "Failed to find matching action for %@ for publisherBulletinD: %@, recordID: %@, sectionID: %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_1();
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_3(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = OUTLINED_FUNCTION_9(a1);
  BLTNameForActionType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "publisherBulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6(&dword_2173D9000, v7, v8, "No handler for %@ for publisherBulletinD: %@, recordID: %@, sectionID: %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_1();
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, v0, v1, "%@ handleAction: no followActivityAction for response: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_182_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_2173D9000, v3, OS_LOG_TYPE_ERROR, "%@ handleAction: FAILED: actionInfo: %@ at sending response %@", v4, 0x20u);
}

@end
