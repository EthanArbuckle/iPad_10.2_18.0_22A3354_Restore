@implementation ATDevicePairedSyncManager

- (ATDevicePairedSyncManager)init
{
  ATDevicePairedSyncManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  ATDeviceService *deviceService;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATDevicePairedSyncManager;
  v2 = -[ATDevicePairedSyncManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.amp.AirTraffic.ATDevicePairedSyncManager.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    +[ATDeviceService sharedInstance](ATDeviceService, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    deviceService = v2->_deviceService;
    v2->_deviceService = (ATDeviceService *)v6;

  }
  return v2;
}

- (void)start
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePendingSyncSettingForDataClass:", CFSTR("PlayActivity-Sync"));
  objc_msgSend(v4, "synchronize");

}

- (void)stop
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)hasRestriction
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInitialSyncComplete") ^ 1;

  return v3;
}

- (void)_cleanupSyncState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v18 = v3;
  objc_msgSend(v3, "allPairedDeviceGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryDeviceSync();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up sync state. allPairedDeviceGUIDs = %{public}@", buf, 0xCu);
  }

  objc_msgSend(v2, "endpointInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v2, "hostInfoForLibrary:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deviceGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_msgSend(v6, "containsObject:", v15) & 1) == 0)
        {
          _ATLogCategoryDeviceSync();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v13;
            v25 = 2114;
            v26 = v15;
            _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_DEFAULT, "removing endpoint for library %{public}@. GUID=%{public}@", buf, 0x16u);
          }

          objc_msgSend(v2, "removeEndpointInfoForLibrary:", v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

}

- (void)_triggerInitialSync
{
  id v3;

  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setPairingSyncCompletionTime:");
  objc_msgSend(v3, "setSyncPending:forDataClass:", 1, CFSTR("Media"));
  -[ATDeviceService requestSyncForPairedDeviceWithPriority:withCompletion:](self->_deviceService, "requestSyncForPairedDeviceWithPriority:withCompletion:", 2, 0);

}

- (void)nanoPairedDeviceStatusMonitorPairedDeviceChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorPairedDeviceChanged___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)nanoPairedDeviceStatusMonitorNewActiveDevice:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorNewActiveDevice___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)nanoPairedDeviceStatusMonitor:(id)a3 didFinishInitialSyncForPairingIdentifier:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitor_didFinishInitialSyncForPairingIdentifier___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceService, 0);
}

uint64_t __100__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitor_didFinishInitialSyncForPairingIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
}

uint64_t __74__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorNewActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
}

uint64_t __78__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorPairedDeviceChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupSyncState");
}

+ (id)sharedPairedSyncManager
{
  if (sharedPairedSyncManager_onceToken != -1)
    dispatch_once(&sharedPairedSyncManager_onceToken, &__block_literal_global);
  return (id)sharedPairedSyncManager___sharedInstance;
}

void __52__ATDevicePairedSyncManager_sharedPairedSyncManager__block_invoke()
{
  ATDevicePairedSyncManager *v0;
  void *v1;

  v0 = objc_alloc_init(ATDevicePairedSyncManager);
  v1 = (void *)sharedPairedSyncManager___sharedInstance;
  sharedPairedSyncManager___sharedInstance = (uint64_t)v0;

}

@end
