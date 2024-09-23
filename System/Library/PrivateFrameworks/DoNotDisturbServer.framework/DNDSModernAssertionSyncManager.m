@implementation DNDSModernAssertionSyncManager

- (DNDSModernAssertionSyncManager)initWithClientDetailsProvider:(id)a3 localSyncService:(id)a4 cloudSyncService:(id)a5 keybag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  dispatch_source_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  DNDSJSONBackingStore *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)DNDSModernAssertionSyncManager;
  v15 = -[DNDSModernAssertionSyncManager init](&v30, sel_init);
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.donotdisturb.server.ModernAssertionSyncManager", v16);
    v18 = (void *)*((_QWORD *)v15 + 1);
    *((_QWORD *)v15 + 1) = v17;

    v19 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v15 + 1));
    v20 = (void *)*((_QWORD *)v15 + 2);
    *((_QWORD *)v15 + 2) = v19;

    objc_storeStrong((id *)v15 + 3, a4);
    objc_storeStrong((id *)v15 + 4, a5);
    objc_storeStrong((id *)v15 + 5, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v15 + 9);
    *((_QWORD *)v15 + 9) = v21;

    *((_BYTE *)v15 + 80) = 0;
    v23 = (void *)*((_QWORD *)v15 + 12);
    *((_QWORD *)v15 + 11) = 0;
    *((_QWORD *)v15 + 12) = 0;

    *((_DWORD *)v15 + 26) = 0;
    v24 = [DNDSJSONBackingStore alloc];
    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_assertionSyncMetadataFileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:](v24, "initWithRecordClass:fileURL:versionNumber:", v25, v26, 0);
    v28 = (void *)*((_QWORD *)v15 + 7);
    *((_QWORD *)v15 + 7) = v27;

    objc_msgSend(v15, "_loadMetadataFromBackingStore");
    if (objc_msgSend(v15, "_maintainMetadataBackingStore"))
      objc_msgSend(v15, "_saveMetadataToBackingStore");
    if ((objc_msgSend(v14, "hasUnlockedSinceBoot") & 1) == 0)
    {
      objc_storeStrong((id *)v15 + 8, a6);
      objc_msgSend(*((id *)v15 + 8), "addObserver:", v15);
    }
    DNDSRegisterSysdiagnoseDataProvider(v15);
  }

  return (DNDSModernAssertionSyncManager *)v15;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModernAssertionSyncManager;
  -[DNDSModernAssertionSyncManager dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__DNDSModernAssertionSyncManager_resume__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __40__DNDSModernAssertionSyncManager_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD handler[5];
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __40__DNDSModernAssertionSyncManager_resume__block_invoke_2;
  handler[3] = &unk_1E86A5970;
  handler[4] = v4;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentlyActivePairedDeviceForSyncManager:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairedDevicesForSyncManager:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = DNDSLogModernAssertionSync;
  v11 = os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Sending forced update to local paired device on resume.", v17, 2u);
    }
    v12 = *(void **)(a1 + 32);
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateDevices:force:shouldFuzz:", v13, 1, 1);

    v19 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_differenceWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  else if (v11)
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Skipping initial state sync on resume because there isn't a paired device.", v17, 2u);
  }
  if (objc_msgSend(v9, "count"))
  {
    v16 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Sending update to cloud devices on resume.", v17, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "updateDevices:force:shouldFuzz:", v9, 0, 1);
  }

}

uint64_t __40__DNDSModernAssertionSyncManager_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDevices");
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[DNDSModernAssertionSyncManager dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentlyActivePairedDeviceForSyncManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModernAssertionSyncManager updateDevices:force:shouldFuzz:](self, "updateDevices:force:shouldFuzz:", v6, 1, 0);

  }
}

- (void)updateForModeAssertionUpdateResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id *v33;
  id *v34;
  char v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t buf[4];
  id v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke;
  v46[3] = &unk_1E86A6FC8;
  v46[4] = &v47;
  v8 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v46);

  if ((v8 & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v4, "invalidations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_2;
  v45[3] = &unk_1E86A6FF0;
  v45[4] = &v47;
  v10 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v45);

  if (v10)
  {
LABEL_3:
    objc_msgSend(v5, "pairedDevicesForSyncManager:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v5, "currentlyActivePairedDeviceForSyncManager:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v14)
  {
    v15 = objc_msgSend(v14, "supportsKettle") ^ 1;
    v16 = objc_msgSend(v11, "isICloudEnabled") ^ 1;
    if ((v15 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  if (!v16)
  {
    v12 = 0;
    goto LABEL_4;
  }
LABEL_15:
  objc_msgSend(v11, "deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_3;
  v43[3] = &unk_1E86A5BB0;
  v36 = v17;
  v44 = v36;
  v35 = objc_msgSend(v18, "bs_containsObjectPassingTest:", v43);

  if ((v35 & 1) != 0)
  {
    v19 = 1;
    if (!v15)
      goto LABEL_21;
  }
  else
  {
    objc_msgSend(v4, "invalidations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_4;
    v41[3] = &unk_1E86A6770;
    v42 = v36;
    v19 = objc_msgSend(v20, "bs_containsObjectPassingTest:", v41);

    v33 = &v42;
    if (!v15)
      goto LABEL_21;
  }
  objc_msgSend(v4, "invalidations", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "bs_containsObjectPassingTest:", &__block_literal_global_16);

  if ((v22 & 1) != 0)
  {
    v23 = 1;
    v24 = 1;
    v25 = 1;
    goto LABEL_24;
  }
LABEL_21:
  objc_msgSend(v4, "assertions", v33);
  v22 = objc_claimAutoreleasedReturnValue();
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_6;
  v39[3] = &unk_1E86A5BB0;
  v26 = v36;
  v40 = v26;
  v27 = objc_msgSend((id)v22, "bs_containsObjectPassingTest:", v39);

  v34 = &v40;
  if ((v27 & 1) != 0)
  {
    v25 = 0;
    v23 = 1;
    v24 = 1;
  }
  else
  {
    objc_msgSend(v4, "invalidations");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_7;
    v37[3] = &unk_1E86A6770;
    v38 = v26;
    v23 = objc_msgSend(v28, "bs_containsObjectPassingTest:", v37);

    v24 = 0;
    v25 = 0;
    v22 = (uint64_t)&v38;
  }
LABEL_24:
  if ((v19 & v23) == 1)
  {
    objc_msgSend(v5, "pairedDevicesForSyncManager:", self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v19)
    {
      if (v23)
      {
        v53[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_29;
    }
    objc_msgSend(v5, "pairedDevicesForSyncManager:", self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v31, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "minusSet:", v32);

    objc_msgSend(v29, "allObjects");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v30;

LABEL_29:
  if ((v24 & 1) == 0)

  if ((v25 & 1) == 0)
  if ((v35 & 1) == 0)

LABEL_4:
  if (objc_msgSend(v12, "count"))
  {
    -[DNDSModernAssertionSyncManager updateDevices:force:shouldFuzz:](self, "updateDevices:force:shouldFuzz:", v12, 0, *((unsigned __int8 *)v48 + 24));
  }
  else
  {
    v13 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v4;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Skipping update as it should not require sync: result=%{public}@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v47, 8);
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if ((objc_msgSend(v3, "isClientScheduled") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v3, "isUserInitiated") ^ 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) &= v7;
    v6 = objc_msgSend(v3, "isInternalScheduled") ^ 1;
  }

  return v6;
}

BOOL __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  int v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "isUserInvalidated") ^ 1;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_BYTE *)(v8 + 24))
      LOBYTE(v7) = 0;
    *(_BYTE *)(v8 + 24) = v7;
    objc_msgSend(v3, "assertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isInternalScheduled"))
      v6 = objc_msgSend(v3, "reason") != 1;
    else
      v6 = 1;

  }
  return v6;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    v6 = objc_msgSend(v3, "isInternalScheduled") ^ 1;
  else
    v6 = 0;

  return v6;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "reason") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  return v4;
}

BOOL __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "reason") == 1)
  {
    objc_msgSend(v2, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v3, "isInternalScheduled") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "reason") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)updateForStateUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "reason") == 3)
  {
    -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentlyActivePairedDeviceForSyncManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((objc_msgSend(v5, "supportsKettle") & 1) == 0)
      {
        v7[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModernAssertionSyncManager updateDevices:](self, "updateDevices:", v6);

      }
    }

  }
}

- (void)updateDevices:(id)a3
{
  -[DNDSModernAssertionSyncManager updateDevices:force:shouldFuzz:](self, "updateDevices:force:shouldFuzz:", a3, 0, 0);
}

- (void)forceUpdateAllDevices
{
  void *v3;
  void *v4;
  id v5;

  -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedDevicesForSyncManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[DNDSModernAssertionSyncManager updateDevices:force:shouldFuzz:](self, "updateDevices:force:shouldFuzz:", v5, 1, 1);
}

- (void)updateDevices:(id)a3 force:(BOOL)a4 shouldFuzz:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  os_unfair_lock_s *p_timerLock;
  id v9;
  OS_os_transaction *v10;
  OS_os_transaction *timerQueuedTransaction;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  float v17;
  void *v18;
  NSObject *fuzzTimer;
  dispatch_time_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v5 = a5;
  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  p_timerLock = &self->_timerLock;
  v9 = a3;
  os_unfair_lock_lock(p_timerLock);
  if (v6)
    self->_timerQueuedForceUpdate = 1;
  -[NSMutableSet addObjectsFromArray:](self->_timerQueuedDevices, "addObjectsFromArray:", v9);

  if (!self->_timerQueuedTransaction)
  {
    v10 = (OS_os_transaction *)os_transaction_create();
    timerQueuedTransaction = self->_timerQueuedTransaction;
    self->_timerQueuedTransaction = v10;

  }
  if (v5)
  {
    v12 = +[DNDSIDSServerBagValues resolvedScheduledActivityUpdateFuzzMilliseconds](DNDSIDSServerBagValues, "resolvedScheduledActivityUpdateFuzzMilliseconds");
    v13 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = v13;
      objc_msgSend(v14, "numberWithUnsignedLongLong:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      objc_msgSend(v14, "numberWithDouble:", v17 / 1000.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v18;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Delaying sync of fuzzable change by %@ seconds.", buf, 0xCu);

    }
    fuzzTimer = self->_fuzzTimer;
    v20 = dispatch_walltime(0, 1000000 * v12);
    dispatch_source_set_timer(fuzzTimer, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    v21 = +[DNDSIDSServerBagValues resolvedActivityUpdateCoalescingSeconds](DNDSIDSServerBagValues, "resolvedActivityUpdateCoalescingSeconds");
    self->_timerCurrentDelay += v21;
    v22 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v24 = v22;
      objc_msgSend(v23, "numberWithUnsignedLongLong:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_INFO, "Delaying sync for %@ seconds to coalesce update.", buf, 0xCu);

    }
    v26 = self->_fuzzTimer;
    v27 = dispatch_walltime(0, 1000000000 * v21);
    dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    if (self->_timerCurrentDelay > 60 * v21)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke;
      block[3] = &unk_1E86A5970;
      block[4] = self;
      if (updateDevices_force_shouldFuzz__onceToken != -1)
        dispatch_once(&updateDevices_force_shouldFuzz__onceToken, block);
    }
  }
  os_unfair_lock_unlock(p_timerLock);
}

void __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_FAULT))
    __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke_cold_1(a1, v2);
  _DNDSRequestRadar(CFSTR("Focus detected excessive change rate."), 0, 1, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModernAssertionSyncManager.m"), 469);
}

- (void)_queue_updateDevices
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Skipping sync due to server bag override.", a5, a6, a7, a8, 0);
}

- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  DNDSSyncService *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint8_t v23[16];

  v11 = (DNDSSyncService *)a3;
  v12 = a6;
  v13 = a7;
  -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (self->_cloudSyncService != v11 || !objc_msgSend(v14, "isCloudSyncDisabledForSyncManager:", self))
  {
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
        -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:].cold.3();
      goto LABEL_8;
    }
    if (self->_cloudSyncService == v11)
    {
      v17 = 1;
      goto LABEL_20;
    }
    objc_msgSend(v15, "currentlyActivePairedDeviceForSyncManager:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v13);

    v21 = objc_msgSend(v18, "assertionSyncProtocolVersion");
    if ((v20 & 1) != 0)
    {
      if (v21 == a5)
      {
        v17 = 1;
LABEL_19:

        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
        -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    {
      -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:].cold.2();
    }
    v17 = 0;
    goto LABEL_19;
  }
  v16 = DNDSLogModernAssertionSync;
  v17 = 0;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Rejecting message because cloud sync is disabled.", v23, 2u);
LABEL_8:
    v17 = 0;
  }
LABEL_20:

  return v17;
}

- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2048;
    v27 = a5;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_INFO, "Received message from sync service; syncService=%p, message=%{public}@, versionNumber=%lu, deviceIdentifier=%{public}@",
      buf,
      0x2Au);
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __115__DNDSModernAssertionSyncManager_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  v18[3] = &unk_1E86A6928;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = a5;
  v16 = v13;
  v17 = v12;
  dispatch_sync(queue, v18);

}

uint64_t __115__DNDSModernAssertionSyncManager_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = v13;
    objc_msgSend(v14, "numberWithBool:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    v28 = 2112;
    v29 = v16;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_INFO, "Sent message from sync service; syncService=%p, requestIdentifier=%{public}@, success=%@, error=%{public}@",
      buf,
      0x2Au);

  }
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__DNDSModernAssertionSyncManager_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke;
  v20[3] = &unk_1E86A59C0;
  v20[4] = self;
  v21 = v11;
  v23 = v7;
  v22 = v12;
  v18 = v12;
  v19 = v11;
  dispatch_sync(queue, v20);

}

uint64_t __93__DNDSModernAssertionSyncManager_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleDidSendRequestIdentifier:withSuccess:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_queue_handleMessage:(id)a3 withVersionNumber:(unint64_t)a4 fromDeviceIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *log;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncManager:deviceForDeviceIdentifier:", self, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFCLL) == 8)
    {
      v12 = +[DNDSModeAssertionStore newWithSyncDictionaryRepresentation:](DNDSModeAssertionStore, "newWithSyncDictionaryRepresentation:", v8);
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      +[DNDSModeAssertionStore messageDateForSyncDictionaryRepresentation:](DNDSModeAssertionStore, "messageDateForSyncDictionaryRepresentation:", v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self->_metadata, "lastReceivedStoreDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = v17;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v28 = v19;

        if (objc_msgSend(v28, "compare:", v14) != -1)
        {
          v29 = DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v56 = v9;
            v57 = 2114;
            v58 = v14;
            v59 = 2114;
            v60 = v28;
            _os_log_impl(&dword_1CB895000, v29, OS_LOG_TYPE_DEFAULT, "Received store from %{public}@ is older (%{public}@) than the last received store (%{public}@).", buf, 0x20u);
          }
        }
        v49 = v28;
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self->_metadata, "lastReceivedStoreDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v14, v31);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sanitizeDatesForThreshold:", v32);

        objc_msgSend(v13, "resolveSourcesForSyncFromPairedDevice:", v11);
        -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          v37 = v35;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v37 = (id)objc_claimAutoreleasedReturnValue();
        }
        v38 = v37;

        objc_msgSend(v13, "lastUpdateDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "compare:", v38);

        -[DNDSModernAssertionSyncManager delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke;
        v50[3] = &unk_1E86A7078;
        v42 = v13;
        v51 = v42;
        v43 = v11;
        v52 = v43;
        v14 = v14;
        v53 = v14;
        objc_msgSend(v41, "syncManager:performModeAssertionUpdatesWithHandler:", self, v50);

        if (v40 == -1)
        {
          v44 = (void *)DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            log = v44;
            objc_msgSend(v43, "deviceIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastUpdateDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = v47;
            v57 = 2114;
            v58 = v45;
            v59 = 2114;
            v60 = v38;
            _os_log_impl(&dword_1CB895000, log, OS_LOG_TYPE_DEFAULT, "Incoming store from %{public}@ was older (%{public}@) than the store it replaced (%{public}@). Will re-send...", buf, 0x20u);

          }
          v54 = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModernAssertionSyncManager updateDevices:force:shouldFuzz:](self, "updateDevices:force:shouldFuzz:", v46, 1, 1);

        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
        -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:].cold.3();
      v14 = 0;
    }
    v20 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
      -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:].cold.1();
LABEL_26:

}

uint64_t __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v49 = a1;
  objc_msgSend(*(id *)(a1 + 32), "invalidations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "assertion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "details");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "source");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v3, "takeAssertionWithUUID:details:source:startDate:", v10, v11, v12, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v6);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(*(id *)(v49 + 32), "invalidationRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v15);
        v20 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v17);
  }

  v21 = (void *)MEMORY[0x1E0D1D5F8];
  objc_msgSend(*(id *)(v49 + 40), "deviceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateForModeAssertionsWithDeviceIdentifier:", v22);
  v23 = objc_claimAutoreleasedReturnValue();

  v48 = (void *)v23;
  objc_msgSend(v3, "modeAssertionsMatchingPredicate:", v23);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bs_mapNoNulls:", &__block_literal_global_48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v46, "mutableCopy");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(*(id *)(v49 + 32), "assertions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v30, "UUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "details");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "source");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v3, "takeAssertionWithUUID:details:source:startDate:", v31, v32, v33, v34);

        objc_msgSend(v24, "removeObject:", v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v27);
  }

  v36 = objc_msgSend(v24, "count");
  if (v36)
  {
    v37 = v36;
    v38 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v63 = v37;
      v64 = 2114;
      v65 = v24;
      _os_log_impl(&dword_1CB895000, v38, OS_LOG_TYPE_DEFAULT, "%lu assertion(s) were abandoned by the remote device, will invalidate: UUIDs=%{public}@", buf, 0x16u);
    }
    +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc(MEMORY[0x1E0D1D648]);
    objc_msgSend(*(id *)(v49 + 40), "deviceIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.sync"), v41);

    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v39, *(_QWORD *)(v49 + 48), 0, v42, 0, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v43);

  }
  return 1;
}

uint64_t __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)_queue_sendStateSnapshotToPairedDevices:(id)a3 force:(BOOL)a4
{
  NSObject *queue;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _DNDSSyncMessageGroup *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id obj;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v39 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v6 = a3;
  dispatch_assert_queue_V2(queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pairedDevicesForSyncManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke;
  v54[3] = &unk_1E86A70A0;
  v36 = v8;
  v55 = v36;
  objc_msgSend(v6, "bs_filter:", v54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModernAssertionSyncManager delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__9;
  v52 = __Block_byref_object_dispose__9;
  v53 = 0;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_56;
  v47[3] = &unk_1E86A70C8;
  v47[4] = &v48;
  objc_msgSend(v37, "syncManager:performModeAssertionUpdatesWithHandler:", self, v47);
  v10 = DNDSLogModernAssertionSync;
  v11 = os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v57 = v9;
    v12 = "Sending forced update to devices: %@";
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v57 = v9;
    v12 = "Sending update to devices: %@";
  }
  _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v62, 16);
  if (v13)
  {
    v40 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v16 = (void *)objc_msgSend((id)v49[5], "mutableCopy");
        v17 = (id)DNDSLogModernAssertionSync;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "deviceIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v57 = v18;
          v58 = 2112;
          v59 = v16;
          _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_INFO, "Generating message for sync to %@: %@", buf, 0x16u);

        }
        objc_msgSend(v16, "filterForSyncToPairedDevice:clientDetailsProvider:", v15, self->_clientDetailsProvider);
        objc_msgSend(v16, "unresolveSourcesForSyncToPairedDevice:", v15);
        -[DNDSModernAssertionSyncManager dataSource](self, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "downgradeAssertionsIfNeededForSyncToPairedDevice:dataSource:syncManager:", v15, v19, self);

        -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deviceIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        objc_msgSend(v16, "lastUpdateDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "compare:", v26) == -1 || v39)
        {
          v28 = -[_DNDSSyncMessageGroup initWithServiceType:protocolVersion:store:]([_DNDSSyncMessageGroup alloc], "initWithServiceType:protocolVersion:store:", objc_msgSend(v15, "syncServiceType"), objc_msgSend(v15, "assertionSyncProtocolVersion"), v16);
          objc_msgSend(v41, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29 == 0;

          if (v30)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v31, v28);

          }
          objc_msgSend(v41, "objectForKeyedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v15);

        }
        else
        {
          v27 = DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v57 = v15;
            v58 = 2114;
            v59 = v26;
            v60 = 2114;
            v61 = v25;
            _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "Skipping sending store to %@ as it is the same as or earlier than the previous (current: %{public}@; previ"
              "ous: %{public}@)",
              buf,
              0x20u);
          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v62, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v41, "allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bs_flatten");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v34;
      _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Preparing to sync to %@", buf, 0xCu);
    }
    objc_msgSend(v37, "syncManager:prepareForSyncToDevices:", self, v34);

  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_60;
  v42[3] = &unk_1E86A7180;
  v42[4] = self;
  objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v42);
  if (objc_msgSend(v41, "count"))
    -[DNDSModernAssertionSyncManager _saveMetadataToBackingStore](self, "_saveMetadataToBackingStore");

  _Block_object_dispose(&v48, 8);
}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_56(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_62);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(v10, "updateConfigurationModificationDatesWithDataSource:syncManager:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncDictionaryRepresentationWithDate:messageUUID:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)DNDSLogModernAssertionSync;
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      DNDSStringFromSyncServiceType(objc_msgSend(v5, "serviceType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "protocolVersion"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Syncing on %{public}@ version %@: %@", buf, 0x20u);

    }
    v19 = objc_msgSend(v5, "serviceType");
    if (v19 == 1)
    {
      v20 = 24;
    }
    else
    {
      if (v19 != 2)
      {
        v21 = 0;
        goto LABEL_12;
      }
      v20 = 32;
    }
    v21 = *(id *)(*(_QWORD *)(a1 + 32) + v20);
LABEL_12:
    v22 = objc_msgSend(v5, "protocolVersion");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_64;
    v25[3] = &unk_1E86A7158;
    v26 = v5;
    v23 = v8;
    v24 = *(_QWORD *)(a1 + 32);
    v27 = v23;
    v28 = v24;
    v29 = v10;
    objc_msgSend(v21, "sendMessage:withVersionNumber:messageType:toDestinations:identifyingCompletionHandler:", v14, v22, 0, v23, v25);

    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_60_cold_1();
LABEL_13:

}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceIdentifier");
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_64(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_65;
    block[3] = &unk_1E86A7130;
    v15 = *(id *)(a1 + 32);
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = *(id *)(a1 + 40);
    dispatch_sync(v9, block);

  }
  else
  {
    v13 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
      __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_64_cold_1(a1, v13, (uint64_t)v8);
  }

}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_65(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _DNDSPendingMessageRecipients *v7;
  void *v8;
  _DNDSPendingMessageRecipients *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    DNDSStringFromSyncServiceType(objc_msgSend(v3, "serviceType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_INFO, "Sending %{public}@ assertions pending with identifier %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v7 = [_DNDSPendingMessageRecipients alloc];
  objc_msgSend(*(id *)(a1 + 56), "lastUpdateDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_DNDSPendingMessageRecipients initWithLastUpdateDate:deviceIdentifiers:](v7, "initWithLastUpdateDate:deviceIdentifiers:", v8, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "pendingLastSentStoreDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

}

- (void)_queue_handleDidSendRequestIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v6 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self->_metadata, "pendingLastSentStoreDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self->_metadata, "pendingLastSentStoreDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v8);

    if (v6)
    {
      v39 = v9;
      v40 = v8;
      objc_msgSend(v11, "lastUpdateDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v11, "deviceIdentifiers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (!v14)
        goto LABEL_23;
      v15 = v14;
      v16 = *(_QWORD *)v43;
      while (1)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          v23 = v22;

          v24 = objc_msgSend(v23, "compare:", v13);
          switch(v24)
          {
            case 1:
              goto LABEL_18;
            case 0:
              v29 = DNDSLogModernAssertionSync;
              if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                v47 = v18;
                v48 = 2114;
                v49 = v40;
                v50 = 2114;
                v51 = v13;
                v52 = 2114;
                v53 = v23;
                _os_log_impl(&dword_1CB895000, v29, OS_LOG_TYPE_INFO, "Leaving lastUpdateDate unchanged for %{public}@ (%{public}@). Got %{public}@ and already have %{public}@", buf, 0x2Au);
              }
LABEL_18:
              v30 = DNDSLogModernAssertionSync;
              if (!os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
                break;
              *(_DWORD *)buf = 138544130;
              v47 = v18;
              v48 = 2114;
              v49 = v40;
              v50 = 2114;
              v51 = v13;
              v52 = 2114;
              v53 = v23;
              v26 = v30;
              v27 = "Rewinding lastUpdateDate for %{public}@ (%{public}@). Got %{public}@ but already have %{public}@";
              v28 = 42;
LABEL_20:
              _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_INFO, v27, buf, v28);
              break;
            case -1:
              v25 = DNDSLogModernAssertionSync;
              if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                v47 = v18;
                v48 = 2114;
                v49 = v23;
                v50 = 2114;
                v51 = v13;
                v26 = v25;
                v27 = "Bumping lastUpdateDate for %{public}@ from %{public}@ to %{public}@";
                v28 = 32;
                goto LABEL_20;
              }
              break;
          }
          -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v13, v18);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (!v15)
        {
LABEL_23:

          -[DNDSModernAssertionSyncManager _saveMetadataToBackingStore](self, "_saveMetadataToBackingStore");
          v8 = v40;
          v9 = v39;
          goto LABEL_28;
        }
      }
    }
    v36 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      objc_msgSend(v11, "deviceIdentifiers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v8;
      v48 = 2114;
      v49 = v9;
      v50 = 2114;
      v51 = v38;
      _os_log_error_impl(&dword_1CB895000, v37, OS_LOG_TYPE_ERROR, "Send request %{public}@ failed with error %{public}@. Recipients: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v32 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)MEMORY[0x1E0CB37E8];
      v34 = v32;
      objc_msgSend(v33, "numberWithBool:", v6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v8;
      v48 = 2112;
      v49 = v35;
      v50 = 2114;
      v51 = v9;
      _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, "Got send results from unrecognized identifier %{public}@. success: %@, error: %{public}@", buf, 0x20u);

    }
  }
LABEL_28:

}

- (void)_loadMetadataFromBackingStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load load assertion sync metadata store, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_maintainMetadataBackingStore
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  DNDSModernAssertionSyncManager *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  void *v35;
  BOOL v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self->_metadata, "lastReceivedStoreDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke;
  v45[3] = &unk_1E86A71A8;
  v7 = v3;
  v46 = v7;
  v8 = v4;
  v47 = v8;
  objc_msgSend(v5, "bs_each:", v45);

  v9 = objc_msgSend(v8, "count");
  v36 = v9 != 0;
  if (v9)
  {
    v10 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v8;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Retiring device(s) from last seen metadata: %@", buf, 0xCu);
    }
    -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self->_metadata, "lastReceivedStoreDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsForKeys:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke_72;
  v42[3] = &unk_1E86A71A8;
  v37 = v7;
  v43 = v37;
  v14 = v12;
  v44 = v14;
  objc_msgSend(v13, "bs_each:", v42);

  v35 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v15 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v14;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Retiring device(s) from last sent metadata: %@", buf, 0xCu);
    }
    -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self->_metadata, "lastSentStoreDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsForKeys:", v14);

    v36 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self->_metadata, "pendingLastSentStoreDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v24 = self;
        -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self->_metadata, "pendingLastSentStoreDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastUpdateDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceDate:", v27);
        v29 = v28;

        if (v29 > 86400.0)
          objc_msgSend(v17, "addObject:", v23);
        self = v24;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v20);
  }

  v30 = v17;
  v31 = v36;
  if (objc_msgSend(v17, "count"))
  {
    v32 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v17;
      _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Retiring pending message(s) from metadata: %@", buf, 0xCu);
    }
    -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self->_metadata, "pendingLastSentStoreDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectsForKeys:", v30);

    v31 = 1;
  }

  return v31;
}

void __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", a3);
  if (v5 > 3024000.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke_72(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", a3);
  if (v5 > 3024000.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (BOOL)_saveMetadataToBackingStore
{
  DNDSModernAssertionSyncMetadataStore *metadata;
  DNDSBackingStore *metadataBackingStore;
  uint64_t v4;
  id v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  metadata = self->_metadata;
  metadataBackingStore = self->_metadataBackingStore;
  v12 = 0;
  v4 = -[DNDSBackingStore writeRecord:error:](metadataBackingStore, "writeRecord:error:", metadata, &v12);
  v5 = v12;
  if (v4)
  {
    if (v4 == 1)
    {
      v10 = DNDSLogModernAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v5;
        v7 = "Failed to write assertion sync metadata store, but error can be ignored; error=%{public}@";
        v8 = v10;
        v9 = 12;
        goto LABEL_11;
      }
    }
    else if (v4 == 2)
    {
      v6 = DNDSLogModernAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Wrote out assertion sync metadata store.";
        v8 = v6;
        v9 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
      -[DNDSModernAssertionSyncManager _saveMetadataToBackingStore].cold.1();
    _DNDSRequestRadar(CFSTR("Failed to write sync metadata"), v5, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModernAssertionSyncManager.m"), 878);
  }

  return v4 == 2;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.AssertionSync");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  DNDSModernAssertionSyncManager *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __66__DNDSModernAssertionSyncManager_sysdiagnoseDataForDate_redacted___block_invoke;
  v13 = &unk_1E86A59E8;
  v14 = self;
  v15 = v5;
  v7 = v5;
  dispatch_sync(queue, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __66__DNDSModernAssertionSyncManager_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v1 = a1;
  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastReceivedStoreDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v1;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1E0CB3578];
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v11, 1, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("device %@"), v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v6);
    }

    v14 = (void *)objc_msgSend(v3, "copy");
    v1 = v42;
    objc_msgSend(*(id *)(v42 + 40), "setObject:forKeyedSubscript:", v14, CFSTR("last-received-dates"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "lastSentStoreDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = v15;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          v23 = (void *)MEMORY[0x1E0CB3578];
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringFromDate:dateStyle:timeStyle:", v24, 1, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("device %@"), v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v26);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v19);
    }

    v27 = (void *)objc_msgSend(v16, "copy");
    v1 = v42;
    objc_msgSend(*(id *)(v42 + 40), "setObject:forKeyedSubscript:", v27, CFSTR("last-sent-dates"));

    v15 = v40;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "pendingLastSentStoreDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v41 = v28;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
          objc_msgSend(v30, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "description");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("message %@"), v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, v38);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v32);
    }

    v39 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(*(id *)(v42 + 40), "setObject:forKeyedSubscript:", v39, CFSTR("pending-messages"));

    v28 = v41;
  }

}

- (DNDSAssertionSyncManagerDataSource)dataSource
{
  return (DNDSAssertionSyncManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
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
  objc_storeStrong((id *)&self->_timerQueuedTransaction, 0);
  objc_storeStrong((id *)&self->_timerQueuedDevices, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_metadataBackingStore, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_cloudSyncService, 0);
  objc_storeStrong((id *)&self->_localSyncService, 0);
  objc_storeStrong((id *)&self->_fuzzTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1CB895000, v4, OS_LOG_TYPE_FAULT, "Coalescing timer has delayed sync for %@ seconds. This may indicate a rogue trigger.", v6, 0xCu);

}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_1CB895000, v0, v1, "*** PLEASE UPDATE DEVICES *** Rejecting incoming message as the version number is not supported by this sync protocol: versionNumber=%lu, currentVersionNumber=%lu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v1, (uint64_t)v1, "Rejecting incoming message as it is not from the active device: deviceIdentifier=%{public}@, pairedDevice=%{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Rejecting incoming message with unhandled messageType: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to find paired device for device identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleMessage:(uint64_t)a3 withVersionNumber:(uint64_t)a4 fromDeviceIdentifier:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Error decoding the assertion store from sync message", a5, a6, a7, a8, 0);
}

- (void)_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_1CB895000, v0, v1, "Received impossible version number: versionNumber=%lu, currentVersionNumber=%lu", v2);
  OUTLINED_FUNCTION_1();
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to generate store message for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_64_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  DNDSStringFromSyncServiceType(objc_msgSend(v4, "serviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v9 = 2112;
  v10 = v7;
  v11 = 2114;
  v12 = a3;
  _os_log_error_impl(&dword_1CB895000, v5, OS_LOG_TYPE_ERROR, "Error sending %{public}@ assertions to %@: error=%{public}@", v8, 0x20u);

}

- (void)_saveMetadataToBackingStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to write assertion sync metadata store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
