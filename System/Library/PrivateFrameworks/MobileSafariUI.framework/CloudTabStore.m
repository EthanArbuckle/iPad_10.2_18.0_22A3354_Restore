@implementation CloudTabStore

- (id)syncedCloudTabDevices
{
  return -[CloudTabStore _syncedCloudTabDevicesUsingFilter:](self, "_syncedCloudTabDevicesUsingFilter:", 1);
}

- (BOOL)cloudTabsAreEnabled
{
  void *v3;
  char v4;

  if (objc_msgSend(MEMORY[0x1E0DD9900], "accessLevel") == 2)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("CloudTabsEnabled"));

  return v4;
}

- (void)startObservingTabStoreStateChanges
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__cloudKitDataDidUpdateOnServer_, *MEMORY[0x1E0D89F40], 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__cloudKitDataWasDeletedAfterAccountChange_, *MEMORY[0x1E0D89F38], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_cloudTabsEnabledDidChange, CFSTR("CloudTabStorePrefChangedNotification"), 0, (CFNotificationSuspensionBehavior)1024);
}

+ (id)cloudTabForTabDocument:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "urlForSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForSharing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "safari_userVisibleString");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A850]), "initWithURL:", v3);
  objc_msgSend(v6, "setTitle:", v4);
  objc_msgSend(v6, "setShowingReader:", objc_msgSend(v2, "isShowingReader"));
  objc_msgSend(v2, "readerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollPositionInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReaderScrollPosition:", v8);

  objc_msgSend(v2, "lastViewedTime");
  objc_msgSend(v6, "setLastViewedTime:");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A838]), "initWithParameters:", v6);

  return v9;
}

void __36__CloudTabStore_sharedCloudTabStore__block_invoke()
{
  CloudTabStore *v0;
  void *v1;

  v0 = objc_alloc_init(CloudTabStore);
  v1 = (void *)sharedCloudTabStore_cloudTabStore;
  sharedCloudTabStore_cloudTabStore = (uint64_t)v0;

}

- (void)didGetCachedDevicesFromCloudKitForCloudTabStore:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[5];

  v4 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CloudTabStore_didGetCachedDevicesFromCloudKitForCloudTabStore___block_invoke;
  v6[3] = &unk_1E9CF1900;
  v6[4] = self;
  objc_msgSend(v4, "setHandler:", v6);
  if (-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cloudTabStoreDidGetCachedDevicesFromCloudKit:", self);

  }
}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  NSObject *v3;
  const char *v4;
  objc_super v5;
  uint8_t buf[16];

  if (!-[CloudTabStore _cloudKitDataNeedsFetching](self, "_cloudKitDataNeedsFetching"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v4 = "Bypassing fetching data from CloudKit because we're already up-to-date";
    goto LABEL_8;
  }
  -[CloudTabStore _setCloudKitDataNeedsFetching:](self, "_setCloudKitDataNeedsFetching:", 0);
  if (-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    self->_hasInitiatedFetchOfCloudKitDataAtLeastOnce = 1;
    v5.receiver = self;
    v5.super_class = (Class)CloudTabStore;
    -[WBSCloudTabStore fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit](&v5, sel_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit);
    return;
  }
  v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v4 = "Bypassing fetching data from CloudKit because sync agent is not available";
LABEL_8:
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
  }
}

- (CloudTabStore)init
{
  CloudTabStore *v2;
  CloudTabStore *v3;
  CloudTabStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CloudTabStore;
  v2 = -[WBSCloudTabStore init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSCloudTabStore setWbsDelegate:](v2, "setWbsDelegate:", v2);
    -[CloudTabStore _setCloudKitDataNeedsFetching:](v3, "_setCloudKitDataNeedsFetching:", 1);
    v4 = v3;
  }

  return v3;
}

- (void)_setCloudKitDataNeedsFetching:(BOOL)a3
{
  self->__cloudKitDataNeedsFetching = a3;
}

- (void)didUpdateDevicesAndCloseRequestsFromCloudKitForCloudTabStore:(id)a3 error:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  self->_hasCompletedFetchOfCloudKitDataAtLeastOnce = 1;
  if (-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    self->_didAttemptToCloseAtLeastOneTab = 0;
    -[WBSCloudTabStore handleCloseTabRequestsFromCloudKit](self, "handleCloseTabRequestsFromCloudKit");
    -[CloudTabStore _notifyCloudTabStoreDidUpdate](self, "_notifyCloudTabStoreDidUpdate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cloudTabStore:didUpdateDevicesFromCloudKitWithError:", self, v6);
    if (self->_didAttemptToCloseAtLeastOneTab)
      objc_msgSend(WeakRetained, "saveCloudTabsUsingCloudTabStore:", self);
    -[CloudTabStore _callFetchCloudKitDataCompletionHandlers](self, "_callFetchCloudKitDataCompletionHandlers");

  }
  else
  {
    -[CloudTabStore _callFetchCloudKitDataCompletionHandlers](self, "_callFetchCloudKitDataCompletionHandlers");
  }

}

- (BOOL)_cloudKitDataNeedsFetching
{
  return self->__cloudKitDataNeedsFetching;
}

- (void)_callFetchCloudKitDataCompletionHandlers
{
  NSMutableArray *fetchCloudKitDataCompletionHandlers;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  fetchCloudKitDataCompletionHandlers = self->_fetchCloudKitDataCompletionHandlers;
  if (fetchCloudKitDataCompletionHandlers)
  {
    v4 = fetchCloudKitDataCompletionHandlers;
    v5 = self->_fetchCloudKitDataCompletionHandlers;
    self->_fetchCloudKitDataCompletionHandlers = 0;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)_currentDeviceUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0D4EC58], "deviceUUID");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)sharedCloudTabStore
{
  if (sharedCloudTabStore_onceToken != -1)
    dispatch_once(&sharedCloudTabStore_onceToken, &__block_literal_global_13);
  return (id)sharedCloudTabStore_cloudTabStore;
}

- (void)stopObservingTabStoreStateChanges
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_cloudTabsEnabledDidChange
{
  void *v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cloudTabStore:cloudTabsEnabledDidChange:", self, -[CloudTabStore cloudTabsAreEnabled](self, "cloudTabsAreEnabled"));

}

- (void)_cloudKitDataDidUpdateOnServer:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[CloudTabStore _setCloudKitDataNeedsFetching:](self, "_setCloudKitDataNeedsFetching:", 1);
  v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit because data was updated on server", v5, 2u);
  }
  -[CloudTabStore fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit](self, "fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit");
}

- (void)_cloudKitDataWasDeletedAfterAccountChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Received notification of CloudKit data deletion after account change.", v5, 2u);
  }
  -[CloudTabStore _setCloudKitDataNeedsFetching:](self, "_setCloudKitDataNeedsFetching:", 1);
}

- (void)_notifyCloudTabStoreDidUpdate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("CloudTabStoreDidUpdateNotification"), self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v4);

  -[WBSCloudTabStore notifyObserversOfSyncedCloudTabDevicesChanged](self, "notifyObserversOfSyncedCloudTabDevicesChanged");
}

- (id)currentDevice
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    -[WBSCloudTabStore dictionaryRepresentationOfCurrentDeviceInCloudKit](self, "dictionaryRepresentationOfCurrentDeviceInCloudKit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0D8A840]);
      -[CloudTabStore _currentDeviceUUID](self, "_currentDeviceUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v4, "initWithDictionary:uuid:", v3, v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CloudTabStore currentDevice].cold.1();
    v7 = 0;
  }
  return v7;
}

- (NSArray)allSyncedCloudTabDevices
{
  return (NSArray *)-[CloudTabStore _syncedCloudTabDevicesUsingFilter:](self, "_syncedCloudTabDevicesUsingFilter:", 0);
}

- (id)_syncedCloudTabDevicesUsingFilter:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  objc_super v18;
  uint8_t buf[16];

  if (-[CloudTabStore cloudTabsAreEnabled](self, "cloudTabsAreEnabled"))
  {
    v18.receiver = self;
    v18.super_class = (Class)CloudTabStore;
    -[WBSCloudTabStore syncedCloudTabDevices](&v18, sel_syncedCloudTabDevices);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing before returning iCloud Tab devices", buf, 2u);
    }
    -[CloudTabStore synchronizeCloudTabDevices](self, "synchronizeCloudTabDevices");
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("uuidOfCloudTabDeviceUsedForRestoration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleForKey:", CFSTR("lastModifiedTimeOfCloudTabDeviceUsedForRestoration"));
    if (v8 && a3)
    {
      v10 = v9;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__CloudTabStore__syncedCloudTabDevicesUsingFilter___block_invoke;
      v15[3] = &unk_1E9CF4BD8;
      v16 = v8;
      v17 = v10;
      objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v11;
    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "No iCloud Tab devices returned because iCloud Tabs are disabled", buf, 2u);
    }
    v12 = 0;
  }
  return v12;
}

uint64_t __51__CloudTabStore__syncedCloudTabDevicesUsingFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5
    && (objc_msgSend(v3, "lastModified"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "timeIntervalSinceReferenceDate"),
        v8 = v7,
        v9 = *(double *)(a1 + 40),
        v6,
        v8 <= v9))
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    v10 = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastModified");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = 138543618;
      v18 = v14;
      v19 = 2048;
      v20 = v16;
      _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "Filtering out device with uuid %{public}@ and last modified time %f", (uint8_t *)&v17, 0x16u);

      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)synchronizeCloudTabDevices
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Synchronizing with CloudKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[8];
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_cloudKitDataNeedsFetching"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke_2;
    block[3] = &unk_1E9CF1900;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_DEFAULT, "Bypassing fetching data from CloudKit as part of synchronizing because we're already up-to-date", v3, 2u);
    }
  }
}

uint64_t __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit as part of synchronizing", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit");
}

- (void)_waitForInitialCloudKitFetchToComplete:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSMutableArray *fetchCloudKitDataCompletionHandlers;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  _QWORD aBlock[4];
  void (**v16)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (self->_hasCompletedFetchOfCloudKitDataAtLeastOnce)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:].cold.4();
    v4[2](v4, 1);
    goto LABEL_16;
  }
  if (!self->_hasInitiatedFetchOfCloudKitDataAtLeastOnce)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:].cold.1();
    goto LABEL_15;
  }
  if (!-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:].cold.3();
LABEL_15:
    v4[2](v4, 0);
    goto LABEL_16;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke;
  aBlock[3] = &unk_1E9CF1950;
  v16 = v4;
  v6 = _Block_copy(aBlock);
  v7 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CloudTabStore _waitForInitialCloudKitFetchToComplete:].cold.2();
  fetchCloudKitDataCompletionHandlers = self->_fetchCloudKitDataCompletionHandlers;
  if (fetchCloudKitDataCompletionHandlers)
  {
    v9 = _Block_copy(v6);
    -[NSMutableArray addObject:](fetchCloudKitDataCompletionHandlers, "addObject:", v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DE8];
    v9 = _Block_copy(v6);
    objc_msgSend(v12, "arrayWithObject:", v9);
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_fetchCloudKitDataCompletionHandlers;
    self->_fetchCloudKitDataCompletionHandlers = v13;

  }
LABEL_16:

}

uint64_t __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CloudTabStore;
  v5 = -[WBSCloudTabStore closeTab:onDevice:](&v7, sel_closeTab_onDevice_, a3, a4);
  if (v5)
    -[CloudTabStore _notifyCloudTabStoreDidUpdate](self, "_notifyCloudTabStoreDidUpdate");
  return v5;
}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CloudTabStore;
  v4 = -[WBSCloudTabStore closeAllTabsOnDevice:](&v6, sel_closeAllTabsOnDevice_, a3);
  if (v4)
    -[CloudTabStore _notifyCloudTabStoreDidUpdate](self, "_notifyCloudTabStoreDidUpdate");
  return v4;
}

- (void)_clearAllDevices
{
  if (-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
    -[WBSCloudTabStore deleteAllDevicesFromCloudKit](self, "deleteAllDevicesFromCloudKit");
}

- (void)clearTabsForCurrentDevice
{
  -[CloudTabStore _clearTabsForCurrentDeviceWithSyncCompletionHandler:](self, "_clearTabsForCurrentDeviceWithSyncCompletionHandler:", 0);
}

- (void)_clearTabsForCurrentDeviceWithSyncCompletionHandler:(id)a3
{
  -[CloudTabStore _saveCurrentDeviceCloudTabs:syncCompletionHandler:](self, "_saveCurrentDeviceCloudTabs:syncCompletionHandler:", 0, a3);
  -[CloudTabStore _notifyCloudTabStoreDidUpdate](self, "_notifyCloudTabStoreDidUpdate");
}

- (void)_removeConflictingDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Sync agent not available so not removing conflicting device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t __41__CloudTabStore__removeConflictingDevice__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3) ^ 1;

  return v4;
}

- (void)saveCurrentDeviceCloudTabsForEnteringBackground:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke;
  aBlock[3] = &unk_1E9CF1950;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v6)
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke_35;
    v12[3] = &unk_1E9CF4C28;
    v12[4] = self;
    v13 = v6;
    v14 = v10;
    -[CloudTabStore _waitForInitialCloudKitFetchToComplete:](self, "_waitForInitialCloudKitFetchToComplete:", v12);

  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Saving iCloud Tabs when entering background because tabs are nil", buf, 2u);
    }
    -[CloudTabStore saveCurrentDeviceCloudTabs:](self, "saveCurrentDeviceCloudTabs:", 0);
    v10[2](v10);
  }

}

uint64_t __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke_35(uint64_t a1, char a2)
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  __int16 v15;
  __int16 v16;
  uint8_t buf[2];

  if ((a2 & 1) == 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "Saving iCloud Tabs when entering background because no CloudKit data is available";
      v5 = buf;
      goto LABEL_7;
    }
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "saveCurrentDeviceCloudTabs:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "uniqueDeviceMultiplicity") | 2) == 2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v4 = "Saving iCloud Tabs when entering background because at least one other device is registered or registered dev"
           "ices cannot be determined";
      v5 = (uint8_t *)&v16;
LABEL_7:
      _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "currentDeviceIsRegisteredInCloudKit") & 1) == 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v15 = 0;
    v4 = "Saving iCloud Tabs when entering background with no other devices because this device isn't registered";
    v5 = (uint8_t *)&v15;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sf_dateForKey:", CFSTR("CloudTabStoreDateOfLastSaveWhenEnteringBackgroundWithNoOtherDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && (objc_msgSend(v8, "timeIntervalSinceDate:", v7), v10 < 86400.0))
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Not saving iCloud Tabs when entering background with no other devices", v14, 2u);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_DEFAULT, "Saving iCloud Tabs when entering background with no other devices", v13, 2u);
    }
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("CloudTabStoreDateOfLastSaveWhenEnteringBackgroundWithNoOtherDevices"));
    objc_msgSend(*(id *)(a1 + 32), "saveCurrentDeviceCloudTabs:", *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)saveCurrentDeviceCloudTabs:(id)a3
{
  -[CloudTabStore _saveCurrentDeviceCloudTabs:syncCompletionHandler:](self, "_saveCurrentDeviceCloudTabs:syncCompletionHandler:", a3, 0);
}

- (void)_saveCurrentDeviceCloudTabs:(id)a3 syncCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!-[WBSCloudTabStore syncAgentIsAvailable](self, "syncAgentIsAvailable"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[CloudTabStore _saveCurrentDeviceCloudTabs:syncCompletionHandler:].cold.1();
      if (!v7)
        goto LABEL_8;
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    v7[2](v7, 0);
    goto LABEL_8;
  }
  if (!-[CloudTabStore canSaveCloudTabsForCurrentDevice](self, "canSaveCloudTabsForCurrentDevice"))
  {

    v6 = 0;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CloudTabStore__saveCurrentDeviceCloudTabs_syncCompletionHandler___block_invoke;
  v9[3] = &unk_1E9CF4C50;
  objc_copyWeak(&v12, &location);
  v6 = v6;
  v10 = v6;
  v11 = v7;
  -[CloudTabStore _waitForInitialCloudKitFetchToComplete:](self, "_waitForInitialCloudKitFetchToComplete:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
LABEL_8:

}

void __67__CloudTabStore__saveCurrentDeviceCloudTabs_syncCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_saveCurrentDeviceCloudTabsNow:syncCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_saveCurrentDeviceCloudTabsNow:(id)a3 syncCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  double v24;
  objc_super v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[WBSCloudTabStore dictionaryRepresentationOfCurrentDeviceInCloudKit](self, "dictionaryRepresentationOfCurrentDeviceInCloudKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_4:
    v9 = objc_msgSend(MEMORY[0x1E0DD9900], "accessLevel") == 2;
    v10 = objc_alloc_init(MEMORY[0x1E0D8A848]);
    objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userAssignedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceName:", v12);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastModified:", v13);

    objc_msgSend(v10, "setTabs:", v6);
    objc_msgSend(v10, "setEphemeralDevice:", v9);
    objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceTypeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceTypeIdentifier:", v15);

    objc_msgSend(v10, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("DeviceName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("DeviceName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CloudTabStore tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:](self, "tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:", v16, v8, 0)&& objc_msgSend(v17, "isEqual:", v18))
    {
      if (-[CloudTabStore tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:](self, "tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:", v16, v8, 1))
      {
        v19 = 86400.0;
      }
      else
      {
        v25.receiver = self;
        v25.super_class = (Class)CloudTabStore;
        -[WBSCloudTabStore syncedCloudTabDevices](&v25, sel_syncedCloudTabDevices);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (unint64_t)objc_msgSend(v20, "count") > 1;

        v19 = dbl_1D7EA8600[v21];
      }
      objc_msgSend(v16, "objectForKey:", CFSTR("LastModified"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("LastModified"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v22, "timeIntervalSinceDate:", v23);
        if (v24 < v19)
        {
          if (v7)
            v7[2](v7, 0);

          goto LABEL_18;
        }
      }

    }
    -[WBSCloudTabStore saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:](self, "saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:", v16, v7);
LABEL_18:

    goto LABEL_19;
  }
  if (v6)
  {
    -[CloudTabStore _removeConflictingDevice](self, "_removeConflictingDevice");
    goto LABEL_4;
  }
  if (v7)
    v7[2](v7, 0);
LABEL_19:

}

- (BOOL)tabArrayOfDeviceFromDictionary:(id)a3 isEqualToOtherDeviceTabsFromDictionary:(id)a4 includingLastViewedTime:(BOOL)a5
{
  id v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD aBlock[4];
  BOOL v16;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke;
  aBlock[3] = &__block_descriptor_33_e26___NSArray_16__0__NSArray_8l;
  v16 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Tabs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Tabs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  return v13;
}

id __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_42);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = *MEMORY[0x1E0DCCBD8];
  v5 = a3;
  objc_msgSend(a2, "safari_numberForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_numberForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = -1;
  else
    v8 = v7 != 0;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

id __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DCCBD8]);
  return v2;
}

- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3
{
  -[CloudTabStore saveCurrentDeviceTabsFromBrowserState:syncCompletionHandler:](self, "saveCurrentDeviceTabsFromBrowserState:syncCompletionHandler:", a3, 0);
}

- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3 syncCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  CloudTabStore *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "windowStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v7;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v28)
    {
      v26 = v6;
      v27 = *(_QWORD *)v38;
      v24 = self;
      v25 = v7;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v32, "localTabGroup");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v29 = v9;
            v30 = i;
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v9, "allTabs");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v34 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                  objc_msgSend(v15, "url");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v16)
                  {
                    objc_msgSend(v15, "uuid");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v17, "length"))
                    {
                      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
                      if (v18)
                      {
                        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A850]), "initWithURL:", v16);
                        objc_msgSend(v19, "setUuid:", v18);
                        objc_msgSend(v15, "title");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v19, "setTitle:", v20);

                        objc_msgSend(v19, "setShowingReader:", objc_msgSend(v15, "isShowingReader"));
                        objc_msgSend(v32, "sceneID");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v19, "setSceneID:", v21);

                        objc_msgSend(v15, "lastViewedTime");
                        objc_msgSend(v19, "setLastViewedTime:");
                        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A838]), "initWithParameters:", v19);
                        if (v22)
                          objc_msgSend(v31, "addObject:", v22);

                      }
                    }

                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v12);
            }

            v7 = v25;
            v6 = v26;
            self = v24;
            v9 = v29;
            i = v30;
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v31, "count"))
      -[CloudTabStore _saveCurrentDeviceCloudTabs:syncCompletionHandler:](self, "_saveCurrentDeviceCloudTabs:syncCompletionHandler:", v31, v6);
    else
      -[CloudTabStore _clearTabsForCurrentDeviceWithSyncCompletionHandler:](self, "_clearTabsForCurrentDeviceWithSyncCompletionHandler:", v6);

  }
  else
  {
    -[CloudTabStore _clearTabsForCurrentDeviceWithSyncCompletionHandler:](self, "_clearTabsForCurrentDeviceWithSyncCompletionHandler:", v6);
  }

}

uint64_t __65__CloudTabStore_didGetCachedDevicesFromCloudKitForCloudTabStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callFetchCloudKitDataCompletionHandlers");
}

- (void)_closeRequestedTabIfPossible:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "tabUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to close tab with UUID %{public}@", (uint8_t *)&v11, 0xCu);

  }
  v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CloudTabStore _closeRequestedTabIfPossible:].cold.1(v9, v4);
  self->_didAttemptToCloseAtLeastOneTab = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cloudTabStore:didReceiveTabCloseRequest:", self, v4);

}

- (CloudTabStoreDelegate)delegate
{
  return (CloudTabStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchCloudKitDataCompletionHandlers, 0);
}

- (void)_saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:(int)a4 isForEnteringBackground:(void *)a5 completion:
{
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v9 = a3;
  v10 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v18;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "cloudTab", v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safari_addObjectUnlessNil:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __116__CloudTabStore_SafariAdditions___saveCurrentDeviceTabs_sceneIDToLocalGroupTabs_isForEnteringBackground_completion___block_invoke;
    v19[3] = &unk_1E9CFA348;
    v17 = v11;
    v20 = v17;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);
    if (a4)
    {
      objc_msgSend(a1, "saveCurrentDeviceCloudTabsForEnteringBackground:completion:", v17, v10);
    }
    else
    {
      objc_msgSend(a1, "saveCurrentDeviceCloudTabs:", v17);
      if (v10)
        v10[2](v10);
    }

  }
}

void __116__CloudTabStore_SafariAdditions___saveCurrentDeviceTabs_sceneIDToLocalGroupTabs_isForEnteringBackground_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0D8A850]);
        objc_msgSend(v9, "syncableURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithURL:", v11);

        v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v9, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
        objc_msgSend(v12, "setUuid:", v15);

        objc_msgSend(v9, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:", v16);

        objc_msgSend(v12, "setSceneID:", v5);
        objc_msgSend(v9, "lastViewedTime");
        objc_msgSend(v12, "setLastViewedTime:");
        v17 = *(void **)(a1 + 32);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A838]), "initWithParameters:", v12);
        objc_msgSend(v17, "safari_addObjectUnlessNil:", v18);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

}

- (void)saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1)
    -[CloudTabStore _saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:isForEnteringBackground:completion:](a1, v6, v5, 0, 0);

}

- (void)saveCurrentDeviceTabsForEnteringBackground:(void *)a3 sceneIDToLocalGroupTabs:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
    -[CloudTabStore _saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:isForEnteringBackground:completion:](a1, v9, v7, 1, v8);

}

- (void)currentDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Sync agent not available so can't retrieve current device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Initial CloudKit fetch was never started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Waiting for initial CloudKit fetch to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Sync agent not available so initial CloudKit fetch will never complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Initial CloudKit fetch has already completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Initial CloudKit fetch has completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_saveCurrentDeviceCloudTabs:syncCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Sync agent not available so not saving current device's tabs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_closeRequestedTabIfPossible:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEBUG, "Tab URL: \"%{private}@\", (uint8_t *)&v5, 0xCu);

}

@end
