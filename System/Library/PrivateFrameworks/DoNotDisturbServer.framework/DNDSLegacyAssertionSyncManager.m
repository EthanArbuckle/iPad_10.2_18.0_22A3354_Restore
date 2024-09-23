@implementation DNDSLegacyAssertionSyncManager

+ (void)cleanupState
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[16];

  v2 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up state", v5, 2u);
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.nano"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndState"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndStateDate"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndCompanionAssertActive"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndGizmoAssertActive"));
  v4 = (id)objc_msgSend(v3, "synchronize");

}

- (DNDSLegacyAssertionSyncManager)initWithClientDetailsProvider:(id)a3 pairedDevice:(id)a4
{
  id v7;
  id v8;
  DNDSLegacyAssertionSyncManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NPSManager *v13;
  NPSManager *npsManager;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NPSDomainAccessor *accessor;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DNDSLegacyAssertionSyncManager;
  v9 = -[DNDSLegacyAssertionSyncManager init](&v21, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.donotdisturb.server.LegacyAssertionSyncManager", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    npsManager = v9->_npsManager;
    v9->_npsManager = v13;

    v15 = objc_alloc(MEMORY[0x1E0D51610]);
    objc_msgSend(v8, "pairingIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingDataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.nano"), v16, v17);
    accessor = v9->_accessor;
    v9->_accessor = (NPSDomainAccessor *)v18;

    objc_storeStrong((id *)&v9->_clientDetailsProvider, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSLegacyAssertionSyncManager _endMonitoringForChanges](self, "_endMonitoringForChanges");
  v3.receiver = self;
  v3.super_class = (Class)DNDSLegacyAssertionSyncManager;
  -[DNDSLegacyAssertionSyncManager dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  -[DNDSLegacyAssertionSyncManager _beginMonitoringForChanges](self, "_beginMonitoringForChanges");
  -[DNDSLegacyAssertionSyncManager _updateForReason:](self, "_updateForReason:", 0);
}

- (void)updateForStateUpdate:(id)a3
{
  -[DNDSLegacyAssertionSyncManager _updateForReason:](self, "_updateForReason:", objc_msgSend(a3, "reason"));
}

- (void)_updateForReason:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__DNDSLegacyAssertionSyncManager__updateForReason___block_invoke;
  v4[3] = &unk_1E86A5AE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __51__DNDSLegacyAssertionSyncManager__updateForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateToggleSyncForReason:", *(_QWORD *)(a1 + 40));
}

- (void)_updateGizmoAssertionSync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke_2;
  v7 = &unk_1E86A6C70;
  v8 = v3;
  objc_msgSend(v2, "syncManager:performModeAssertionUpdatesWithHandler:");

}

uint64_t __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateGizmoAssertionSyncWithModeAssertionUpdateContext:", a2);
  return 1;
}

- (void)_beginMonitoringForChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDSyncStateChanged, CFSTR("DNDStateChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)DNDAssertionStateChanged, CFSTR("DNDAssertStateChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("DNDStateChangedNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("DNDAssertStateChangedNotification"), 0);
}

- (void)_queue_updateToggleSyncForReason:(unint64_t)a3
{
  id v5;
  void *v6;
  _QWORD v7[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  -[DNDSLegacyAssertionSyncManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__DNDSLegacyAssertionSyncManager__queue_updateToggleSyncForReason___block_invoke;
  v7[3] = &unk_1E86A6C98;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "syncManager:performModeAssertionUpdatesWithHandler:", self, v7);

}

uint64_t __67__DNDSLegacyAssertionSyncManager__queue_updateToggleSyncForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStateForLegacyAssertionSyncManager:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v3;
  objc_msgSend(v3, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUpdateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "activeModeAssertionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "activeDateInterval");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "laterDate:", v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_gizmoUpdateDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    DNDStateUpdateReasonToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    v30 = 2114;
    v31 = v16;
    v32 = 2114;
    v33 = v19;
    _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Update toggle sync: companionUpdateDate=%{public}@, gizmoUpdateDate=%{public}@, reason=%{public}@", buf, 0x20u);

  }
  v20 = objc_msgSend(v7, "compare:", v16);
  if (v20 < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGizmoToggleSyncForState:companionUpdateDate:reason:", v5, v7, *(_QWORD *)(a1 + 40));
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  if (v20 != -1)
    goto LABEL_14;
  v21 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateCompanionToggleSyncForGizmoUpdateDate:modeAssertionUpdateContext:", v16, v23);
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateCompanionAssertionMirroringForState:", v5);

  return v21;
}

- (id)_queue_gizmoUpdateDate
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v24;

  v24 = 0;
  -[NPSDomainAccessor doubleForKey:keyExistsAndHasValidFormat:](self->_accessor, "doubleForKey:keyExistsAndHasValidFormat:", CFSTR("dndStateDate"), &v24);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v3 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR))
      -[DNDSLegacyAssertionSyncManager _queue_gizmoUpdateDate].cold.3(v3);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "compare:", v5) != -1)
  {
    v6 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR))
      -[DNDSLegacyAssertionSyncManager _queue_gizmoUpdateDate].cold.2((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "compare:", v14) != -1)
  {
    v15 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR))
      -[DNDSLegacyAssertionSyncManager _queue_gizmoUpdateDate].cold.1((uint64_t)v2, v15, v16, v17, v18, v19, v20, v21);
    v22 = v14;

    v2 = v22;
  }

  return v2;
}

- (void)_queue_updateGizmoToggleSyncForState:(id)a3 companionUpdateDate:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NPSDomainAccessor *accessor;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  _BYTE v24[10];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a5 == 1)
  {
    v10 = -[NPSDomainAccessor BOOLForKey:](self->_accessor, "BOOLForKey:", CFSTR("dndState"));
    objc_msgSend(v8, "activeModeAssertionMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __98__DNDSLegacyAssertionSyncManager__queue_updateGizmoToggleSyncForState_companionUpdateDate_reason___block_invoke;
    v22[3] = &unk_1E86A6CC0;
    v22[4] = self;
    v12 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v22);

    v13 = (void *)DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      DNDStateUpdateReasonToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v24 = v12;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v10;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Will update toggle sync state to reflect current companion state, companionToggleDNDActive=%{BOOL}d, gizmoDNDActive=%{BOOL}d, reason=%{public}@", buf, 0x18u);

    }
    -[NPSDomainAccessor setBool:forKey:](self->_accessor, "setBool:forKey:", v12, CFSTR("dndState"));
    accessor = self->_accessor;
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    -[NPSDomainAccessor setDouble:forKey:](accessor, "setDouble:forKey:", CFSTR("dndStateDate"));
    v17 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("dndState"), CFSTR("dndStateDate"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v18);

  }
  else
  {
    v19 = (void *)DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      DNDStateUpdateReasonToString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v24 = v21;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring update to toggle for reason %{public}@ as it was not user initiated", buf, 0xCu);

    }
  }

}

uint64_t __98__DNDSLegacyAssertionSyncManager__queue_updateGizmoToggleSyncForState_companionUpdateDate_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "lifetimeType");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientDetailsForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 4)
  {
    if (objc_msgSend(v7, "isSyncSuppressedClient"))
    {
      objc_msgSend(v3, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.donotdisturb.private.schedule"));

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_queue_updateCompanionToggleSyncForGizmoUpdateDate:(id)a3 modeAssertionUpdateContext:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v28;
  void *v29;
  const __CFString *v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[NPSDomainAccessor BOOLForKey:](self->_accessor, "BOOLForKey:", CFSTR("dndState"));
  v8 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Gizmo has toggled DND, will mirror locally: gizmoDNDActive=%{BOOL}d", buf, 8u);
  }
  v30 = CFSTR("com.donotdisturb.server.sync.legacy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1, v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1D5F8], "predicateForModeAssertionsWithClientIdentifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modeAssertionsMatchingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = 0;
  else
    v13 = v7;
  if ((v13 & 1) != 0 || v7 != 1)
  {
    -[DNDSLegacyAssertionSyncManager dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentlyActivePairedDeviceForSyncManager:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D1D648]);
    objc_msgSend(v17, "deviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.donotdisturb.server.sync.legacy"), v19);

    if (v13)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v21, "setIdentifier:", CFSTR("com.apple.donotdisturb.sync.legacy.toggle-assertion"));
      objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x1E0D1D3C8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLifetime:", v22);

      objc_msgSend(v21, "setReason:", 1);
      objc_msgSend(v6, "takeAssertionWithDetails:source:startDate:", v21, v20, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "assertions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v24, "count") != 0;

    }
    else
    {
      if ((v7 & 1) != 0)
      {
        v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v25 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_DEFAULT, "Gizmo has invalidated its DND assertion, will mirror locally", buf, 2u);
      }
      +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion](DNDSModeAssertionInvalidationPredicate, "predicateForAnyAssertion");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v21, v29, v20, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(v6, "invalidateAssertionsForRequest:", v23);
      v15 = 1;
    }

    goto LABEL_18;
  }
  v14 = DNDSLogLegacyAssertionSync;
  v15 = 0;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Did not update local state as it was not required", buf, 2u);
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (void)_queue_updateCompanionAssertionMirroringForState:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "activeModeAssertionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__DNDSLegacyAssertionSyncManager__queue_updateCompanionAssertionMirroringForState___block_invoke;
  v11[3] = &unk_1E86A6CC0;
  v11[4] = self;
  v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v11);

  if ((_DWORD)v7 != -[NPSDomainAccessor BOOLForKey:](self->_accessor, "BOOLForKey:", CFSTR("dndCompanionAssertActive")))
  {
    v8 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v7;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Companion assertion active changed, will update gizmo: value=%{BOOL}d", buf, 8u);
    }
    -[NPSDomainAccessor setBool:forKey:](self->_accessor, "setBool:forKey:", v7, CFSTR("dndCompanionAssertActive"));
    v9 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("dndCompanionAssertActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v10);

  }
}

uint64_t __83__DNDSLegacyAssertionSyncManager__queue_updateCompanionAssertionMirroringForState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "lifetimeType");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clientDetailsForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 4)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "isSyncSuppressedClient") ^ 1;

  return v8;
}

- (void)_queue_updateGizmoAssertionSyncWithModeAssertionUpdateContext:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t v25[16];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  v6 = -[NPSDomainAccessor BOOLForKey:](self->_accessor, "BOOLForKey:", CFSTR("dndGizmoAssertActive"));
  v26[0] = CFSTR("com.donotdisturb.server.sync.legacy.workout");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1D5F8], "predicateForModeAssertionsWithClientIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeAssertionsMatchingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 0;
  else
    v11 = v6;
  if (v10)
    v12 = v6;
  else
    v12 = 1;
  if ((v11 & 1) != 0 || !v12)
  {
    -[DNDSLegacyAssertionSyncManager dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentlyActivePairedDeviceForSyncManager:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0D1D648]);
    objc_msgSend(v14, "deviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.donotdisturb.server.sync.legacy.workout"), v16);

    if (v11)
    {
      v18 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Gizmo has taken a DND assertion, will mirror locally", v25, 2u);
      }
      objc_msgSend(MEMORY[0x1E0D1D618], "detailsWithIdentifier:modeIdentifier:lifetime:reason:", CFSTR("com.apple.donotdisturb.sync.legacy.mirror-assertion"), CFSTR("com.apple.donotdisturb.mode.workout"), 0, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v4, "takeAssertionWithDetails:source:startDate:", v19, v17, v20);
    }
    else
    {
      if ((v12 & 1) != 0)
      {
LABEL_18:

        goto LABEL_19;
      }
      v22 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Gizmo has invalidated its DND assertion, will mirror locally", v25, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v20, v19, v17, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v4, "invalidateAssertionsForRequest:", v23);

    }
    goto LABEL_18;
  }
LABEL_19:

}

- (DNDSLegacyAssertionSyncManagerDataSource)dataSource
{
  return (DNDSLegacyAssertionSyncManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSAssertionSyncManagerDelegate)delegate
{
  return (DNDSAssertionSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_gizmoUpdateDate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Gizmo date was not valid, will reset to distantPast", v1, 2u);
}

@end
