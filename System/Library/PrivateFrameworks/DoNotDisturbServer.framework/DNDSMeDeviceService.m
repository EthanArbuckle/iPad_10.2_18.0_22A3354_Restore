@implementation DNDSMeDeviceService

- (DNDSMeDeviceService)init
{
  DNDSMeDeviceService *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *calloutQueue;
  uint64_t v8;
  NSMutableSet *listeners;
  DNDMeDeviceState *meDeviceState;
  DNDSJSONBackingStore *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  DNDSBackingStore *backingStore;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DNDSMeDeviceService;
  v2 = -[DNDSMeDeviceService init](&v19, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.fmf-me-device.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.donotdisturb.DNDSMeDeviceService.call-out", v5);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableSet *)v8;

    meDeviceState = v2->_meDeviceState;
    v2->_meDeviceState = 0;

    v11 = [DNDSJSONBackingStore alloc];
    v12 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_meDeviceStoreFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:](v11, "initWithRecordClass:fileURL:versionNumber:", v12, v13, 0);
    backingStore = v2->_backingStore;
    v2->_backingStore = (DNDSBackingStore *)v14;

    -[DNDSMeDeviceService _loadDataFromBackingStore](v2, "_loadDataFromBackingStore");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)meDeviceChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E0D20250], 0, CFNotificationSuspensionBehaviorCoalesce);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v2, (CFNotificationCallback)fmfDevicesChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E0D20248], 0, CFNotificationSuspensionBehaviorCoalesce);
    DNDSRegisterSysdiagnoseDataProvider(v2);
  }
  return v2;
}

- (DNDMeDeviceState)meDeviceState
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__DNDSMeDeviceService_meDeviceState__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (DNDMeDeviceState *)v3;
}

void __36__DNDSMeDeviceService_meDeviceState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__DNDSMeDeviceService_addListener___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

uint64_t __35__DNDSMeDeviceService_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DNDSMeDeviceService_removeListener___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

uint64_t __38__DNDSMeDeviceService_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)meDeviceChanged
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DNDSMeDeviceService_meDeviceChanged__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__DNDSMeDeviceService_meDeviceChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "received notification that 'Me Device' status changed fetching devices", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAllDevices");
}

- (void)devicesChanged
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DNDSMeDeviceService_devicesChanged__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __37__DNDSMeDeviceService_devicesChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "received notification that 'Me Device' devices changed fetching devices", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAllDevices");
}

- (void)_queue_fetchAllDevices
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D20260], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__DNDSMeDeviceService__queue_fetchAllDevices__block_invoke;
  v4[3] = &unk_1E86A6AD8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getAllDevices:", v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

void __45__DNDSMeDeviceService__queue_fetchAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DNDSMeDeviceService__queue_fetchAllDevices__block_invoke_2;
  block[3] = &unk_1E86A58D0;
  block[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __45__DNDSMeDeviceService__queue_fetchAllDevices__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processDevices:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_processDevices:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *calloutQueue;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  DNDSMeDeviceService *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    v8 = DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "error determining current 'Me Device' status; error=%{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    -[DNDSMeDeviceService _queue_computeMeDeviceStateForDevices:](self, "_queue_computeMeDeviceStateForDevices:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v9, "meDeviceStatus");
      DNDMeDeviceStatusToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "meDeviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "current 'Me Device' state determined; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
        buf,
        0x16u);

    }
    if ((-[DNDMeDeviceState isEqual:](self->_meDeviceState, "isEqual:", v9) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_meDeviceState, v9);
      v21 = 0;
      -[DNDSMeDeviceService _queue_saveDataToBackingStoreWithError:](self, "_queue_saveDataToBackingStoreWithError:", &v21);
      v7 = v21;
      v14 = (void *)-[NSMutableSet copy](self->_listeners, "copy");
      calloutQueue = self->_calloutQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__DNDSMeDeviceService__queue_processDevices_error___block_invoke;
      v17[3] = &unk_1E86A58D0;
      v18 = v9;
      v19 = v14;
      v20 = self;
      v16 = v14;
      dispatch_async(calloutQueue, v17);

    }
  }

}

void __51__DNDSMeDeviceService__queue_processDevices_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "meDeviceStatus");
    DNDMeDeviceStatusToString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "meDeviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "notifying listeners of a change to 'Me Device' state; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
      buf,
      0x16u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "meDeviceService:didReceiveMeDeviceStateUpdate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_queue_computeMeDeviceStateForDevices:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_msgSend(v4, "count"))
  {
    v5 = (void *)DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      DNDMeDeviceStatusToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2114;
      v24 = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "no devices returned by FMF; current 'Me Device' state updated: meDeviceStatus=%{public}@, meDeviceName=%{public}@",
        buf,
        0x16u);

    }
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    v11 = 2;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isThisDevice", (_QWORD)v16)
          && (objc_msgSend(v13, "isActiveDevice") & 1) != 0)
        {
          goto LABEL_16;
        }
        if ((objc_msgSend(v13, "isActiveDevice") & 1) != 0)
        {
          v11 = 3;
LABEL_16:
          objc_msgSend(v13, "deviceName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_17:

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5E8]), "initWithStatus:name:", v11, v9);
  return v14;
}

- (void)_loadDataFromBackingStore
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  DNDSMeDeviceStore *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v31 = 0;
  objc_msgSend(v2, "readRecordWithError:", &v31);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v31;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v7)
  {
    if (v4)
    {
      v8 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_ERROR))
        __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_cold_1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
      _DNDSRequestRadar(CFSTR("Failed to load current 'Me Device' database"), v4, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSMeDeviceService.m"), 213);
    }
    v15 = objc_alloc_init(DNDSMeDeviceStore);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_msgSend(v7, "meDeviceStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "meDeviceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5E8]), "initWithStatus:name:", v19, v20);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 24);
  *(_QWORD *)(v22 + 24) = v21;

  if (!v19 || ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2 ? (v24 = v20 == 0) : (v24 = 0), v24))
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(NSObject **)(v28 + 8);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_14;
    v30[3] = &unk_1E86A5970;
    v30[4] = v28;
    dispatch_async(v29, v30);
  }
  else
  {
    v25 = (void *)DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      DNDMeDeviceStatusToString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2114;
      v35 = v20;
      _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "current 'Me Device' state loaded from store; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
        buf,
        0x16u);

    }
  }

}

uint64_t __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "current 'Me Device' state unknown / incomplete; requesting active device",
      v4,
      2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAllDevices");
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  NSObject *workQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DNDSMeDeviceService__saveDataToBackingStoreWithError___block_invoke;
  block[3] = &unk_1E86A6B00;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(workQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __56__DNDSMeDeviceService__saveDataToBackingStoreWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_saveDataToBackingStoreWithError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_saveDataToBackingStoreWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  DNDSBackingStore *backingStore;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)-[DNDSMeDeviceStore mutableCopy](self->_store, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDMeDeviceState meDeviceStatus](self->_meDeviceState, "meDeviceStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeDeviceStatus:", v6);

  -[DNDMeDeviceState meDeviceName](self->_meDeviceState, "meDeviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeDeviceName:", v7);

  backingStore = self->_backingStore;
  v24 = 0;
  v9 = -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v5, &v24);
  v10 = v24;
  if (v9)
  {
    if (v9 == 1)
    {
      v22 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v10;
        v12 = "failed to write 'Me Device' store, but error can be ignored; error=%{public}@";
        v13 = v22;
        v14 = 12;
        goto LABEL_11;
      }
    }
    else if (v9 == 2)
    {
      v11 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "wrote out 'Me Device' store to file";
        v13 = v11;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    v15 = DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_ERROR))
      -[DNDSMeDeviceService _queue_saveDataToBackingStoreWithError:].cold.1((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);
    _DNDSRequestRadar(CFSTR("Failed to write 'Me Device' store"), v10, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSMeDeviceService.m"), 260);
  }
  if (a3 && v10)
    *a3 = objc_retainAutorelease(v10);

  return v9 == 2;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.MeDeviceService");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMeDeviceService meDeviceState](self, "meDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "meDeviceStatus");
  DNDMeDeviceStatusToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("status"));

  if (!a4)
  {
    objc_msgSend(v7, "meDeviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  }
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_meDeviceState, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "failed to load current 'Me Device' database, will request a radar; error=%{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)_queue_saveDataToBackingStoreWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "failed to write 'Me Device' store, will request radar; error=%{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
