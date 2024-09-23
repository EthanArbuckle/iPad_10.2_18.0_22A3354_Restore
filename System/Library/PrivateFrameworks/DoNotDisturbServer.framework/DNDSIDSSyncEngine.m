@implementation DNDSIDSSyncEngine

- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5
{
  return -[DNDSIDSSyncEngine initWithMetadataStore:syncService:keybag:role:syncState:inflightExpirationTime:](self, "initWithMetadataStore:syncService:keybag:role:syncState:inflightExpirationTime:", a3, a4, a5, 0, 3, 86400);
}

- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5 role:(unint64_t)a6 syncState:(unint64_t)a7 inflightExpirationTime:(unint64_t)a8
{
  id v15;
  id v16;
  DNDSIDSSyncEngine *v17;
  NSObject *v18;
  const char *v19;
  _BOOL4 v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  NSMapTable *sourcesByZone;
  uint64_t v26;
  NSMutableDictionary *inflightDateByRequestIdentifier;
  uint64_t v28;
  NSMutableDictionary *inflightMetadataByRequestIdentifier;
  uint64_t v30;
  NSMutableSet *inflightMetadata;
  id v33;
  uint8_t buf[16];
  objc_super v35;

  v33 = a3;
  v15 = a4;
  v16 = a5;
  v35.receiver = self;
  v35.super_class = (Class)DNDSIDSSyncEngine;
  v17 = -[DNDSIDSSyncEngine init](&v35, sel_init);
  if (v17)
  {
    if ((a7 & 2) != 0)
    {
      v18 = DNDSLogIDSSyncEngine;
      v20 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
      if ((a7 & 1) != 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          v19 = "IDS sync engine is available";
          goto LABEL_10;
        }
      }
      else if (v20)
      {
        *(_WORD *)buf = 0;
        v19 = "IDS sync engine is disabled because of unsupported device";
        goto LABEL_10;
      }
    }
    else
    {
      v18 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "IDS sync engine is disabled because of feature flag";
LABEL_10:
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      }
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.donotdisturb.server.DNDSIDSSyncEngine", v21);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v17->_role = a6;
    v17->_syncState = a7;
    v17->_retriesAvailable = 3;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    sourcesByZone = v17->_sourcesByZone;
    v17->_sourcesByZone = (NSMapTable *)v24;

    objc_storeStrong((id *)&v17->_metadataStore, a3);
    v17->_inflightExpirationTime = a8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    inflightDateByRequestIdentifier = v17->_inflightDateByRequestIdentifier;
    v17->_inflightDateByRequestIdentifier = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    inflightMetadataByRequestIdentifier = v17->_inflightMetadataByRequestIdentifier;
    v17->_inflightMetadataByRequestIdentifier = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    inflightMetadata = v17->_inflightMetadata;
    v17->_inflightMetadata = (NSMutableSet *)v30;

    objc_storeStrong((id *)&v17->_syncService, a4);
    -[DNDSSyncService setDelegate:](v17->_syncService, "setDelegate:", v17);
    objc_storeStrong((id *)&v17->_keybag, a5);
    -[DNDSSyncService resume](v17->_syncService, "resume");
    objc_msgSend(v16, "addObserver:", v17);
    -[DNDSIDSSyncEngine validate](v17, "validate");
    DNDSRegisterSysdiagnoseDataProvider(v17);
  }

  return v17;
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DNDSIDSSyncEngine_addRecordIDsToSave_recordIDsToDelete___block_invoke;
  block[3] = &unk_1E86A58D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __58__DNDSIDSSyncEngine_addRecordIDsToSave_recordIDsToDelete___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((~*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) & 7) != 0)
  {
    v3 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 134349056;
      v7 = v4;
      _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring records as the sync engine is disabled: %{public}llu", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDeletedAtDate:forRecordIDs:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setLastModifiedDate:forRecordIDs:", v5, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_queue_resetRetryTimer");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deviceIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(*(id *)(a1 + 32), "_queue_syncDataSourcesToDeviceWithIdentifier:", v2);

  }
}

- (void)setDataSource:(id)a3 forZone:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DNDSIDSSyncEngine *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DNDSIDSSyncEngine_setDataSource_forZone___block_invoke;
  block[3] = &unk_1E86A58D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __43__DNDSIDSSyncEngine_setDataSource_forZone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || (v6 = *(_QWORD *)(a1 + 32), v5, !v6))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "_queue_resetRetryTimer");
    }
  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "deviceIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (*(_QWORD *)(a1 + 32) && v7)
  {
    v9 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 40), "_queue_syncDataSourcesToDeviceWithIdentifier:", v7);
    v8 = v9;
  }

}

- (void)setPairedDevice:(id)a3 syncEnabled:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DNDSIDSSyncEngine_setPairedDevice_syncEnabled___block_invoke;
  block[3] = &unk_1E86A58F8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __49__DNDSIDSSyncEngine_setPairedDevice_syncEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  char v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) >> 2) & 1;
  if (v3 != v2)
  {
    v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v5 = "enabled";
      else
        v5 = "disabled";
      v27 = 136446210;
      v28 = v5;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "IDS sync engine changed to %{public}s", (uint8_t *)&v27, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) & 0xFFFFFFFFFFFFFFFBLL | (4 * *(unsigned __int8 *)(a1 + 48));
  }
  v6 = *(_QWORD *)(a1 + 32);
  if ((~*(_DWORD *)(v6 + 32) & 3) != 0)
  {
    v9 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(const char **)(*(_QWORD *)(a1 + 32) + 32);
      v27 = 134349056;
      v28 = v10;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring paired device/enabled change as the sync engine is not available: %{public}llu", (uint8_t *)&v27, 0xCu);
    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = 0;
    goto LABEL_33;
  }
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(v6 + 24);
  if (v7 != v8 && (!v7 || !v8 || (objc_msgSend(v7, "isEqual:") & 1) == 0))
  {
    v13 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v15 = v13;
      objc_msgSend(v14, "deviceIdentifier");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v16;
      v29 = 2114;
      v30 = v17;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Paired device changed from %{public}@ to %{public}@", (uint8_t *)&v27, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_resetRetryTimer");
    v18 = *(void **)(a1 + 40);
    if (v18
      && (unint64_t)objc_msgSend(v18, "configurationSyncProtocolVersion") >= 0xB
      && (unint64_t)objc_msgSend(*(id *)(a1 + 40), "configurationSyncProtocolVersion") <= 0xC
      && objc_msgSend(*(id *)(a1 + 40), "syncServiceType") == 1)
    {
      v19 = objc_msgSend(*(id *)(a1 + 40), "copy");
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 24);
      *(_QWORD *)(v20 + 24) = v19;
    }
    else
    {
      v22 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(const char **)(a1 + 40);
        v27 = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring paired device not supported by IDS Sync Engine: %@", (uint8_t *)&v27, 0xCu);
      }
      v24 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v24 + 24);
      *(_QWORD *)(v24 + 24) = 0;
    }

    goto LABEL_29;
  }
  if (v3 != v2)
  {
LABEL_29:
    objc_msgSend(*(id *)(a1 + 32), "_queue_validate");
    objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hasPerformedInitialSyncForPairedDeviceIdentifier:", v12);
      v26 = *(void **)(a1 + 32);
      if ((v25 & 1) != 0)
        objc_msgSend(v26, "_queue_syncDataSourcesToDeviceWithIdentifier:", v12);
      else
        objc_msgSend(v26, "_queue_sendResyncMessageToDeviceWithIdentifier:", v12);
    }
LABEL_33:

  }
}

- (void)setDidReceiveUnlockMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__DNDSIDSSyncEngine_setDidReceiveUnlockMessage___block_invoke;
  v7[3] = &unk_1E86A5920;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__DNDSIDSSyncEngine_setDidReceiveUnlockMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

- (void)setDidFireMetadataExpirationTimer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__DNDSIDSSyncEngine_setDidFireMetadataExpirationTimer___block_invoke;
  v7[3] = &unk_1E86A5920;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__DNDSIDSSyncEngine_setDidFireMetadataExpirationTimer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (unint64_t)pairSyncState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__DNDSIDSSyncEngine_pairSyncState__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DNDSIDSSyncEngine_pairSyncState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)validate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DNDSIDSSyncEngine_validate__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__DNDSIDSSyncEngine_validate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_validate");
}

- (void)sync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__DNDSIDSSyncEngine_sync__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

void __25__DNDSIDSSyncEngine_sync__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if ((~*(_DWORD *)(v1 + 32) & 7) == 0 && *(_QWORD *)(v1 + 24))
  {
    if (objc_msgSend(*(id *)(v1 + 48), "hasUnlockedSinceBoot"))
    {
      v3 = *(id **)(a1 + 32);
      objc_msgSend(v3[3], "deviceIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_queue_syncDataSourcesToDeviceWithIdentifier:", v4);

    }
  }
}

- (id)inflightMetadata
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__DNDSIDSSyncEngine_inflightMetadata__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__DNDSIDSSyncEngine_inflightMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v9 = a4;
  v10 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  block[3] = &unk_1E86A58D0;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_sync(queue, block);

}

void __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(uint64_t a1)
{
  _DWORD *v2;

  v2 = *(_DWORD **)(a1 + 32);
  if ((~v2[8] & 7) != 0)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v2, "_queue_handleMessage:fromPairedDeviceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_queue_syncDataSourcesToDeviceWithIdentifier:", *(_QWORD *)(a1 + 48));
  }
}

- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  DNDSIDSSyncEngine *v21;
  id v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  v19[3] = &unk_1E86A5998;
  v20 = v11;
  v21 = self;
  v22 = v12;
  v23 = v13;
  v24 = &v26;
  v25 = a5;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_sync(queue, v19);
  LOBYTE(queue) = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)queue;
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  char v4;

  v1 = a1 + 40;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)
    && objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("syncEngine")))
  {
    if ((~*(_DWORD *)(*(_QWORD *)v1 + 32) & 7) != 0)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
        __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_3();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 24), "deviceIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 56));

      if ((v4 & 1) != 0)
      {
        if ((unint64_t)(*(_QWORD *)(a1 + 72) - 13) > 0xFFFFFFFFFFFFFFFDLL)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
        {
          __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      {
        __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_2();
      }
    }
  }
}

- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  BOOL v17;

  v9 = a4;
  v10 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke;
  block[3] = &unk_1E86A59C0;
  v17 = a5;
  block[4] = self;
  v15 = v10;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_sync(queue, block);

}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke(uint64_t a1)
{
  id *v1;
  id *v2;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(id **)(a1 + 32);
  if ((~*((_DWORD *)v1 + 8) & 7) != 0)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_2();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
        __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_1();
      objc_msgSend(*v2, "_queue_startRetryTimer");
      v1 = (id *)*v2;
    }
    objc_msgSend(v1[12], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "minusSet:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_queue_restartInflightExpirationTimer");
    v5 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = objc_msgSend(v4, "count");
      v8 = objc_msgSend(*((id *)*v2 + 14), "count");
      v13 = 134349312;
      v14 = v7;
      v15 = 2050;
      v16 = v8;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Removed %{public}llu inflight records; %{public}llu remaining",
        (uint8_t *)&v13,
        0x16u);

    }
    v9 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)*((_QWORD *)*v2 + 12);
      v11 = v9;
      v12 = objc_msgSend(v10, "count");
      v13 = 134349056;
      v14 = v12;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "%{public}llu outstanding request identifiers", (uint8_t *)&v13, 0xCu);

    }
  }
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DNDSIDSSyncEngine_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__DNDSIDSSyncEngine_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  if ((~*(_DWORD *)(v1 + 32) & 7) == 0)
  {
    v3 = *(void **)(v1 + 24);
    if (v3)
    {
      objc_msgSend(v3, "deviceIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v1, "_queue_sendUnlockMessageToDeviceWithIdentifier:", v4);

      v5 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Sync because keybag is unlocked", buf, 2u);
      }
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v6, "isValidAtDate:", v7);

      if ((v6 & 1) == 0)
      {
        v8 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Metadata store is invalid; purging", v11, 2u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "purge");
      }
      v9 = *(id **)(a1 + 32);
      objc_msgSend(v9[3], "deviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_queue_syncDataSourcesToDeviceWithIdentifier:", v10);

    }
  }
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.DNDSIDSSyncEngine");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  DNDSIDSSyncEngine *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__DNDSIDSSyncEngine_sysdiagnoseDataForDate_redacted___block_invoke;
  v10[3] = &unk_1E86A59E8;
  v7 = v5;
  v11 = v7;
  v12 = self;
  dispatch_sync(queue, v10);
  v8 = v7;

  return v8;
}

void __53__DNDSIDSSyncEngine_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("zones"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("pairedDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("syncState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("retriesAvailable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("inflightExpirationTime"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("inflightMetadata"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("inflightMetadataByRequestIdentifier"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("inflightDateByRequestIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("role"));

}

- (id)_queue_dataSourceForZone:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMapTable objectForKey:](self->_sourcesByZone, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queue_syncDataSourcesToDeviceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  DNDSIDSSyncEngineMetadataStoring *metadataStore;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v20 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Will not sync because keybag is locked";
    goto LABEL_18;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v20 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Will not sync because sync is inactive";
LABEL_18:
    v22 = v20;
LABEL_19:
    _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_20;
  }
  v5 = DNDSLogIDSSyncEngine;
  v6 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v6)
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Will not sync because pairedDeviceIdentifier is nil";
    v22 = v5;
    goto LABEL_19;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Performing sync for all data sources", buf, 2u);
  }
  -[DNDSIDSSyncEngineMetadataStoring modifiedRecordIDsForPairedDeviceIdentifier:](self->_metadataStore, "modifiedRecordIDsForPairedDeviceIdentifier:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSSyncEngineMetadataStoring deletedRecordIDsForPairedDeviceIdentifier:](self->_metadataStore, "deletedRecordIDsForPairedDeviceIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_sourcesByZone;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        -[NSMapTable objectForKey:](self->_sourcesByZone, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "recordIDsForIDSSyncEngine:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }

  -[DNDSIDSSyncEngineMetadataStoring unknownRecordIDsInRecordIDs:](self->_metadataStore, "unknownRecordIDsInRecordIDs:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  metadataStore = self->_metadataStore;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSSyncEngineMetadataStoring setLastModifiedDate:forRecordIDs:](metadataStore, "setLastModifiedDate:forRecordIDs:", v18, v16);

  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSSyncEngine _queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:](self, "_queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:", v19, v7, v4);

LABEL_20:
}

- (void)_queue_sendAckWithMetadata:(id)a3 forAction:(id)a4 toDeviceWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  DNDSApplicationIdentifierMapper *v13;
  DNDSBackingStoreDictionaryContext *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  DNDSSyncService *syncService;
  unint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  DNDSContactProvider *v38;
  DNDSApplicationIdentifierMapper *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  _QWORD v48[4];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v29 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v30 = "Will not send ack because keybag is locked";
LABEL_18:
    _os_log_impl(&dword_1CB895000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_19;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v29 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v30 = "Will not send ack because sync is inactive";
    goto LABEL_18;
  }
  v11 = DNDSLogIDSSyncEngine;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 138543618;
      v51 = v9;
      v52 = 2050;
      v53 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Sending ack for action %{public}@ with %{public}llu record metadata items", buf, 0x16u);

    }
    v13 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    v38 = objc_alloc_init(DNDSContactProvider);
    v39 = v13;
    v14 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 3, 0, v38, v13);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v40 = v8;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentationWithContext:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v18);
    }

    v47[0] = CFSTR("action");
    v47[1] = CFSTR("ackAction");
    v48[0] = CFSTR("ack");
    v48[1] = v9;
    v48[2] = v15;
    v47[2] = CFSTR("metadataAck");
    v47[3] = CFSTR("syncDate");
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    objc_msgSend(v22, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    syncService = self->_syncService;
    v28 = -[DNDSPairedDevice configurationSyncProtocolVersion](self->_pairedDevice, "configurationSyncProtocolVersion");
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke;
    v41[3] = &unk_1E86A5A10;
    v42 = v16;
    -[DNDSSyncService sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:](syncService, "sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:", v25, v28, CFSTR("syncEngine"), v26, v41);

    v8 = v40;
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncEngine _queue_sendAckWithMetadata:forAction:toDeviceWithIdentifier:].cold.1(v11, v31, v32, v33, v34, v35, v36, v37);
  }
LABEL_19:

}

void __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = 134349056;
      v10 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Sent %{public}llu record metadata items in ack", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke_cold_1();
  }

}

- (void)_queue_sendUnlockMessageToDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t v9[8];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)v9 = 0;
    v8 = "Will not send unlock message because keybag is locked";
LABEL_8:
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_9;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)v9 = 0;
    v8 = "Will not send unlock message because sync is inactive";
    goto LABEL_8;
  }
  v10 = CFSTR("action");
  v11[0] = CFSTR("unlock");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncService sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:](self->_syncService, "sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:", v5, -[DNDSPairedDevice configurationSyncProtocolVersion](self->_pairedDevice, "configurationSyncProtocolVersion"), CFSTR("syncEngine"), v6, &__block_literal_global);

LABEL_9:
}

void __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Sent unlock message", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke_cold_1();
  }

}

- (void)_queue_sendResyncMessageToDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t v9[8];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)v9 = 0;
    v8 = "Will not sync because keybag is locked";
LABEL_8:
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_9;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)v9 = 0;
    v8 = "Will not send resync message because sync is inactive";
    goto LABEL_8;
  }
  v10 = CFSTR("action");
  v11[0] = CFSTR("resync");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncService sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:](self->_syncService, "sendMessage:withVersionNumber:messageType:toDestinations:completionHandler:", v5, -[DNDSPairedDevice configurationSyncProtocolVersion](self->_pairedDevice, "configurationSyncProtocolVersion"), CFSTR("syncEngine"), v6, &__block_literal_global_60);

LABEL_9:
}

void __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Sent resync message", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke_cold_1();
  }

}

- (void)_queue_sendModifiedRecordIDs:(id)a3 deletedRecordIDs:(id)a4 toDeviceWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  unint64_t role;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const __CFString *v17;
  NSObject *v18;
  const char *v19;
  DNDSApplicationIdentifierMapper *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  DNDSIDSRecord *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSMutableDictionary *inflightMetadataByRequestIdentifier;
  NSObject *v63;
  uint64_t v64;
  DNDSSyncService *syncService;
  unint64_t v66;
  id v67;
  const __CFString *v68;
  DNDSContactProvider *v69;
  DNDSApplicationIdentifierMapper *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id obj;
  DNDSBackingStoreDictionaryContext *v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[3];
  _QWORD v93[3];
  _BYTE v94[16];
  _BYTE v95[128];
  _BYTE v96[16];
  uint8_t v97[128];
  uint8_t buf[4];
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    *(_WORD *)buf = 0;
    v19 = "Will not send records because keybag is locked";
LABEL_20:
    _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    goto LABEL_69;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    *(_WORD *)buf = 0;
    v19 = "Will not send records because sync is inactive";
    goto LABEL_20;
  }
  if (!v10)
  {
    v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    *(_WORD *)buf = 0;
    v19 = "Will not send records because pairedDeviceIdentifier is nil";
    goto LABEL_20;
  }
  if (!objc_msgSend(v8, "count") && !objc_msgSend(v9, "count"))
    goto LABEL_69;
  v11 = (void *)DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134349312;
    v99 = objc_msgSend(v8, "count");
    v100 = 2048;
    v101 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Sending %{public}llu modified records and %{publi}llu deleted record IDs", buf, 0x16u);

  }
  role = self->_role;
  v73 = v9;
  v71 = v10;
  if (role == 1)
    goto LABEL_13;
  if (!role)
  {
    v14 = -[DNDSIDSSyncEngineMetadataStoring hasPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "hasPerformedInitialSyncForPairedDeviceIdentifier:", v10);
    v15 = DNDSLogIDSSyncEngine;
    v16 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Paired device has never synced; sending as replace",
          buf,
          2u);
      }
      -[DNDSIDSSyncEngine _queue_removeAllInflightMetadata](self, "_queue_removeAllInflightMetadata");
      -[DNDSIDSSyncEngine _queue_cancelInflightExpirationTimer](self, "_queue_cancelInflightExpirationTimer");
      v17 = CFSTR("replace");
      goto LABEL_25;
    }
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Paired device has synced before; sending as update",
        buf,
        2u);
    }
LABEL_13:
    v17 = CFSTR("update");
LABEL_25:
    v68 = v17;
    goto LABEL_26;
  }
  v68 = 0;
LABEL_26:
  v20 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v69 = objc_alloc_init(DNDSContactProvider);
  v70 = v20;
  v78 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 3, 0, v69, v20);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v72 = v8;
  obj = v8;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v89 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        -[DNDSIDSSyncEngineMetadataStoring recordMetadataForRecordID:](self->_metadataStore, "recordMetadataForRecordID:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          if (-[NSMutableSet containsObject:](self->_inflightMetadata, "containsObject:", v27))
          {
            v28 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              objc_msgSend(v27, "recordID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v99 = (uint64_t)v30;
              _os_log_impl(&dword_1CB895000, v29, OS_LOG_TYPE_DEFAULT, "Metadata for modified record with ID %{public}@ is already syncing", buf, 0xCu);

            }
          }
          else
          {
            v31 = -[DNDSIDSRecord initWithMetadata:]([DNDSIDSRecord alloc], "initWithMetadata:", v27);
            objc_msgSend(v26, "zone");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngine _queue_dataSourceForZone:](self, "_queue_dataSourceForZone:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "idsSyncEngine:prepareRecordToSave:", self, v31);
            -[DNDSIDSRecord dictionaryRepresentationWithContext:](v31, "dictionaryRepresentationWithContext:", v78);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(v76, "addObject:", v34);
              objc_msgSend(v21, "addObject:", v27);
            }
            else
            {
              v35 = (void *)DNDSLogIDSSyncEngine;
              if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
                -[DNDSIDSSyncEngine _queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:].cold.2((uint64_t)v96, v35);
            }

          }
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v23);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v36 = v73;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v85 != v39)
          objc_enumerationMutation(v36);
        -[DNDSIDSSyncEngineMetadataStoring recordMetadataForRecordID:](self->_metadataStore, "recordMetadataForRecordID:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          if (-[NSMutableSet containsObject:](self->_inflightMetadata, "containsObject:", v41))
          {
            v42 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              v43 = v42;
              objc_msgSend(v41, "recordID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v99 = (uint64_t)v44;
              _os_log_impl(&dword_1CB895000, v43, OS_LOG_TYPE_DEFAULT, "Metadata for deleted record with ID %{public}@ is already syncing", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v41, "dictionaryRepresentationWithContext:", v78);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              objc_msgSend(v75, "addObject:", v45);
              objc_msgSend(v21, "addObject:", v41);
            }
            else
            {
              v46 = (void *)DNDSLogIDSSyncEngine;
              if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
                -[DNDSIDSSyncEngine _queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:].cold.1((uint64_t)v94, v46);
            }

          }
        }

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    }
    while (v38);
  }

  v47 = objc_msgSend(v21, "count");
  v48 = DNDSLogIDSSyncEngine;
  v49 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
  if (v47)
  {
    v10 = v71;
    v8 = v72;
    if (v49)
    {
      v50 = v48;
      v51 = objc_msgSend(v76, "count");
      v52 = objc_msgSend(v75, "count");
      *(_DWORD *)buf = 134349312;
      v99 = v51;
      v100 = 2050;
      v101 = v52;
      _os_log_impl(&dword_1CB895000, v50, OS_LOG_TYPE_DEFAULT, "Syncing %{public}llu modifications and %{public}llu deletions", buf, 0x16u);

    }
    v92[0] = CFSTR("action");
    v92[1] = CFSTR("modifiedRecords");
    v93[0] = v68;
    v93[1] = v76;
    v92[2] = CFSTR("deletedMetadata");
    v93[2] = v75;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "UUIDString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inflightMetadataByRequestIdentifier, "setObject:forKeyedSubscript:", v21, v55);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inflightDateByRequestIdentifier, "setObject:forKeyedSubscript:", v56, v55);

    -[NSMutableSet unionSet:](self->_inflightMetadata, "unionSet:", v21);
    -[DNDSIDSSyncEngine _queue_restartInflightExpirationTimer](self, "_queue_restartInflightExpirationTimer");
    v57 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = objc_msgSend(v21, "count");
      v60 = -[NSMutableSet count](self->_inflightMetadata, "count");
      *(_DWORD *)buf = 134349312;
      v99 = v59;
      v100 = 2050;
      v101 = v60;
      _os_log_impl(&dword_1CB895000, v58, OS_LOG_TYPE_DEFAULT, "Added %{public}llu inflight records; %{public}llu remaining",
        buf,
        0x16u);

    }
    v61 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      inflightMetadataByRequestIdentifier = self->_inflightMetadataByRequestIdentifier;
      v63 = v61;
      v64 = -[NSMutableDictionary count](inflightMetadataByRequestIdentifier, "count");
      *(_DWORD *)buf = 134349056;
      v99 = v64;
      _os_log_impl(&dword_1CB895000, v63, OS_LOG_TYPE_DEFAULT, "%{public}llu outstanding request identifiers", buf, 0xCu);

    }
    syncService = self->_syncService;
    v66 = -[DNDSPairedDevice configurationSyncProtocolVersion](self->_pairedDevice, "configurationSyncProtocolVersion");
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke;
    v79[3] = &unk_1E86A5AC0;
    v79[4] = self;
    v80 = v55;
    v81 = obj;
    v82 = v36;
    v83 = v21;
    v67 = v55;
    -[DNDSSyncService sendMessage:withVersionNumber:messageType:toDestinations:identifyingCompletionHandler:](syncService, "sendMessage:withVersionNumber:messageType:toDestinations:identifyingCompletionHandler:", v53, v66, CFSTR("syncEngine"), v74, v79);

  }
  else
  {
    v10 = v71;
    v8 = v72;
    if (v49)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v48, OS_LOG_TYPE_DEFAULT, "Update message is empty; will not send", buf, 2u);
    }
  }

  v9 = v73;
LABEL_69:

}

void __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2;
  block[3] = &unk_1E86A5A98;
  block[4] = v9;
  v15 = v10;
  v21 = a2;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = v7;
  v19 = *(id *)(a1 + 64);
  v20 = v8;
  v12 = v8;
  v13 = v7;
  dispatch_sync(v11, block);

}

uint64_t __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  v2 = (void *)DNDSLogIDSSyncEngine;
  if (*(_BYTE *)(a1 + 88))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 48);
      v4 = v2;
      v5 = objc_msgSend(v3, "count");
      v6 = objc_msgSend(*(id *)(a1 + 56), "count");
      v9 = 134349312;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Sent %{public}llu modified record IDs and %{publi}llu deleted record IDs", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 64));

    return objc_msgSend(*(id *)(a1 + 32), "_queue_restartInflightExpirationTimer");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2_cold_1();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "minusSet:", *(_QWORD *)(a1 + 72));
    return objc_msgSend(*(id *)(a1 + 32), "_queue_startRetryTimer");
  }
}

- (void)_queue_startRetryTimer
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Exhausted retry attempts; will not try again", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __43__DNDSIDSSyncEngine__queue_startRetryTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 134349056;
    v8 = v3;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Retry timer fired (attempt #%{public}llu)", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRetryTimer");
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[3];
  if (v5)
  {
    objc_msgSend(v5, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_queue_syncDataSourcesToDeviceWithIdentifier:", v6);

  }
}

- (void)_queue_resetRetryTimer
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[DNDSIDSSyncEngine _queue_cancelRetryTimer](self, "_queue_cancelRetryTimer"))
  {
    v3 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Resetting retry timer", v4, 2u);
    }
    self->_retriesAvailable = 3;
  }
}

- (BOOL)_queue_cancelRetryTimer
{
  OS_dispatch_source *retryTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling retry timer", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_retryTimer);
    v5 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  return retryTimer != 0;
}

- (double)_queue_earliestExpirationTimeSinceNowForInflightMetadata
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_inflightDateByRequestIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_inflightDateByRequestIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8), (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "earlierDate:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v9)
        {
          v11 = v9;

          v3 = v11;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)self->_inflightExpirationTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceNow");
  v14 = v13;

  return v14;
}

- (void)_queue_restartInflightExpirationTimer
{
  -[DNDSIDSSyncEngine _queue_cancelInflightExpirationTimer](self, "_queue_cancelInflightExpirationTimer");
  -[DNDSIDSSyncEngine _queue_startInflightExpirationTimer](self, "_queue_startInflightExpirationTimer");
}

- (void)_queue_startInflightExpirationTimer
{
  double v3;
  int64_t v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *inflightExpirationTimer;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  _QWORD handler[5];
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NSMutableSet count](self->_inflightMetadata, "count"))
  {
    v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v12 = "No inflight metadata; will not start expiration timer";
LABEL_13:
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    return;
  }
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v12 = "Will not set expiration timer because keybag is locked";
    goto LABEL_13;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v12 = "Will not set expiration retry timer because sync is inactive";
    goto LABEL_13;
  }
  -[DNDSIDSSyncEngine _queue_earliestExpirationTimeSinceNowForInflightMetadata](self, "_queue_earliestExpirationTimeSinceNowForInflightMetadata");
  v4 = (unint64_t)(v3 * 1000000000.0);
  v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Expiration timer will fire in %llus", buf, 0xCu);
  }
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  inflightExpirationTimer = self->_inflightExpirationTimer;
  self->_inflightExpirationTimer = v6;

  v8 = self->_inflightExpirationTimer;
  v9 = dispatch_time(0, v4);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  v10 = self->_inflightExpirationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __56__DNDSIDSSyncEngine__queue_startInflightExpirationTimer__block_invoke;
  handler[3] = &unk_1E86A5970;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_inflightExpirationTimer);
}

uint64_t __56__DNDSIDSSyncEngine__queue_startInflightExpirationTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t result;
  uint8_t v6[16];

  v2 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Expiration timer fired", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelInflightExpirationTimer");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queue_removeAllInflightMetadataWithExpirationDate:", v4);

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_queue_cancelInflightExpirationTimer
{
  OS_dispatch_source *inflightExpirationTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  inflightExpirationTimer = self->_inflightExpirationTimer;
  if (inflightExpirationTimer)
  {
    v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling expiration timer", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_inflightExpirationTimer);
    v5 = self->_inflightExpirationTimer;
    self->_inflightExpirationTimer = 0;

  }
  return inflightExpirationTimer != 0;
}

- (void)_queue_removeAllInflightMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet removeAllObjects](self->_inflightMetadata, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_inflightMetadataByRequestIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_inflightDateByRequestIdentifier, "removeAllObjects");
}

- (void)_queue_removeAllInflightMetadataWithExpirationDate:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_inflightDateByRequestIdentifier;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_inflightDateByRequestIdentifier, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateByAddingTimeInterval:", (double)self->_inflightExpirationTime);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "laterDate:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
          objc_msgSend(v21, "addObject:", v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v21;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_inflightMetadataByRequestIdentifier, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inflightMetadataByRequestIdentifier, "setObject:forKeyedSubscript:", 0, v19);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inflightDateByRequestIdentifier, "setObject:forKeyedSubscript:", 0, v19);
        -[NSMutableSet minusSet:](self->_inflightMetadata, "minusSet:", v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

}

- (void)_queue_handleMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    v9 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Will not handle message because sync is inactive", v10, 2u);
    }
  }
  else
  {
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("update")))
    {
      -[DNDSIDSSyncEngine _queue_handleUpdateMessage:fromPairedDeviceIdentifier:](self, "_queue_handleUpdateMessage:fromPairedDeviceIdentifier:", v6, v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("replace")))
    {
      -[DNDSIDSSyncEngine _queue_handleReplaceMessage:fromPairedDeviceIdentifier:](self, "_queue_handleReplaceMessage:fromPairedDeviceIdentifier:", v6, v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ack")))
    {
      -[DNDSIDSSyncEngine _queue_handleAckMessage:fromPairedDeviceIdentifier:](self, "_queue_handleAckMessage:fromPairedDeviceIdentifier:", v6, v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("unlock")))
    {
      -[DNDSIDSSyncEngine _queue_handleUnlockMessage:fromPairedDeviceIdentifier:](self, "_queue_handleUnlockMessage:fromPairedDeviceIdentifier:", v6, v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("resync")))
    {
      -[DNDSIDSSyncEngine _queue_handleResyncMessage:fromPairedDeviceIdentifier:](self, "_queue_handleResyncMessage:fromPairedDeviceIdentifier:", v6, v7);
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
    {
      -[DNDSIDSSyncEngine _queue_handleMessage:fromPairedDeviceIdentifier:].cold.1();
    }

  }
}

- (void)_queue_handleResyncMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  NSObject *queue;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Received resync message", v8, 2u);
  }
  -[DNDSIDSSyncEngineMetadataStoring removePairedDeviceIdentifier:](self->_metadataStore, "removePairedDeviceIdentifier:", v6);
  -[DNDSIDSSyncEngine _queue_removeAllInflightMetadata](self, "_queue_removeAllInflightMetadata");
  -[DNDSIDSSyncEngine _queue_cancelInflightExpirationTimer](self, "_queue_cancelInflightExpirationTimer");
  -[DNDSIDSSyncEngine _queue_syncDataSourcesToDeviceWithIdentifier:](self, "_queue_syncDataSourcesToDeviceWithIdentifier:", v6);

}

- (void)_queue_handleAckMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  DNDSBackingStoreDictionaryContext *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t role;
  DNDSApplicationIdentifierMapper *v22;
  DNDSApplicationIdentifierMapper *v23;
  DNDSContactProvider *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "bs_safeArrayForKey:", CFSTR("metadataAck"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("syncDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("ackAction"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v8;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Received ack message for action %{public}@", buf, 0xCu);
  }
  v25 = (void *)v8;
  v23 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v24 = objc_alloc_init(DNDSContactProvider);
  v10 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 3, 0, v24, v23);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:context:](DNDSIDSRecordMetadata, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v10);
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  v18 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("replace")))
  {
    v20 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Paired device has performed an initial sync", buf, 2u);
    }
    -[DNDSIDSSyncEngineMetadataStoring setPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "setPerformedInitialSyncForPairedDeviceIdentifier:", v27);
  }
  role = self->_role;
  if (role == 1)
  {
    -[DNDSIDSSyncEngineMetadataStoring setSyncDate:forRecordsMatchingMetadata:forPairedDeviceIdentifier:](self->_metadataStore, "setSyncDate:forRecordsMatchingMetadata:forPairedDeviceIdentifier:", v19, v11, v27);
    v22 = v23;
    if ((-[DNDSIDSSyncEngineMetadataStoring hasPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "hasPerformedInitialSyncForPairedDeviceIdentifier:", v27) & 1) == 0)-[DNDSIDSSyncEngine _queue_sendResyncMessageToDeviceWithIdentifier:](self, "_queue_sendResyncMessageToDeviceWithIdentifier:", v27);
  }
  else
  {
    v22 = v23;
    if (!role
      && -[DNDSIDSSyncEngineMetadataStoring hasPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "hasPerformedInitialSyncForPairedDeviceIdentifier:", v27))
    {
      -[DNDSIDSSyncEngineMetadataStoring setSyncDate:forRecordsMatchingMetadata:forPairedDeviceIdentifier:](self->_metadataStore, "setSyncDate:forRecordsMatchingMetadata:forPairedDeviceIdentifier:", v19, v11, v27);
    }
  }

}

- (void)_queue_handleUnlockMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  NSObject *queue;
  id v6;
  NSObject *v7;
  void (**didReceiveUnlockMessage)(void);
  uint8_t v9[16];

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Received unlock message", v9, 2u);
  }
  didReceiveUnlockMessage = (void (**)(void))self->_didReceiveUnlockMessage;
  if (didReceiveUnlockMessage)
    didReceiveUnlockMessage[2]();
  -[DNDSIDSSyncEngine _queue_removeAllInflightMetadata](self, "_queue_removeAllInflightMetadata");
  -[DNDSIDSSyncEngine _queue_cancelInflightExpirationTimer](self, "_queue_cancelInflightExpirationTimer");
  -[DNDSIDSSyncEngine _queue_syncDataSourcesToDeviceWithIdentifier:](self, "_queue_syncDataSourcesToDeviceWithIdentifier:", v6);

}

- (void)_queue_handleUpdateMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  DNDSApplicationIdentifierMapper *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  DNDSIDSSyncEngineMetadataStoring *metadataStore;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  DNDSIDSSyncEngineMetadataStoring *v27;
  void *v28;
  void *v29;
  DNDSIDSSyncEngineMetadataStoring *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id v39;
  DNDSIDSSyncEngineMetadataStoring *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  DNDSIDSSyncEngineMetadataStoring *v51;
  void *v52;
  DNDSIDSSyncEngineMetadataStoring *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  DNDSContactProvider *v63;
  DNDSApplicationIdentifierMapper *v64;
  void *v65;
  id obj;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  DNDSBackingStoreDictionaryContext *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  id v82;
  uint8_t v83[128];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  void *v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Received update message", buf, 2u);
  }
  if (self->_role
    || (-[DNDSIDSSyncEngineMetadataStoring hasPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "hasPerformedInitialSyncForPairedDeviceIdentifier:", v7) & 1) != 0)
  {
    v70 = v7;
    v9 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    v63 = objc_alloc_init(DNDSContactProvider);
    v64 = v9;
    v72 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 3, 0, v63, v9);
    objc_msgSend(v6, "bs_safeArrayForKey:", CFSTR("modifiedRecords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v6;
    objc_msgSend(v6, "bs_safeArrayForKey:", CFSTR("deletedMetadata"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    if (v11)
    {
      v12 = v11;
      v67 = *(id *)v78;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(id *)v78 != v67)
            objc_enumerationMutation(obj);
          v14 = +[DNDSIDSRecord newWithDictionaryRepresentation:context:](DNDSIDSRecord, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i), v72);
          metadataStore = self->_metadataStore;
          objc_msgSend(v14, "recordID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSIDSSyncEngineMetadataStoring recordMetadataForRecordID:](metadataStore, "recordMetadataForRecordID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            goto LABEL_14;
          objc_msgSend(v17, "lastModified");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "metadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastModified");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "earlierDate:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastModified");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 == v22)
          {
LABEL_14:
            objc_msgSend(v14, "recordID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "zone");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngine _queue_dataSourceForZone:](self, "_queue_dataSourceForZone:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = self->_metadataStore;
            objc_msgSend(v14, "metadata");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v28;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngineMetadataStoring updateMetadata:](v27, "updateMetadata:", v29);

            v30 = self->_metadataStore;
            objc_msgSend(v14, "recordID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngineMetadataStoring setSyncDate:forRecordIDs:forPairedDeviceIdentifier:](v30, "setSyncDate:forRecordIDs:forPairedDeviceIdentifier:", v69, v32, v70);

            v33 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              v85 = v14;
              v86 = 2114;
              v87 = v26;
              _os_log_impl(&dword_1CB895000, v33, OS_LOG_TYPE_DEFAULT, "Sending modified record %{private}@ to data source %{public}@", buf, 0x16u);
            }
            objc_msgSend(v26, "idsSyncEngine:didFetchRecord:", self, v14);

          }
          else
          {
            v23 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v85 = v14;
              _os_log_error_impl(&dword_1CB895000, v23, OS_LOG_TYPE_ERROR, "Incoming modified record %{private}@ has an older lastModified date than the existing record", buf, 0xCu);
            }
          }
          objc_msgSend(v14, "metadata");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v34);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      }
      while (v12);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v68 = v62;
    v35 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v74 != v37)
            objc_enumerationMutation(v68);
          v39 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:context:](DNDSIDSRecordMetadata, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j), v72);
          v40 = self->_metadataStore;
          objc_msgSend(v39, "recordID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSIDSSyncEngineMetadataStoring recordMetadataForRecordID:](v40, "recordMetadataForRecordID:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
            goto LABEL_28;
          objc_msgSend(v42, "lastModified");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "lastModified");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "earlierDate:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "lastModified");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45 == v46)
          {
LABEL_28:
            objc_msgSend(v39, "recordID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "zone");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngine _queue_dataSourceForZone:](self, "_queue_dataSourceForZone:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = self->_metadataStore;
            v82 = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngineMetadataStoring updateMetadata:](v51, "updateMetadata:", v52);

            v53 = self->_metadataStore;
            objc_msgSend(v39, "recordID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v54;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngineMetadataStoring setSyncDate:forRecordIDs:forPairedDeviceIdentifier:](v53, "setSyncDate:forRecordIDs:forPairedDeviceIdentifier:", v69, v55, v70);

            v56 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              objc_msgSend(v39, "recordID");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v85 = v58;
              v86 = 2114;
              v87 = v50;
              _os_log_impl(&dword_1CB895000, v57, OS_LOG_TYPE_DEFAULT, "Sending deleted recordID %{private}@ to data source %{public}@", buf, 0x16u);

            }
            objc_msgSend(v39, "recordID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "idsSyncEngine:recordWithIDWasDeleted:", self, v59);

          }
          else
          {
            v47 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v85 = v39;
              _os_log_error_impl(&dword_1CB895000, v47, OS_LOG_TYPE_ERROR, "Incoming deleted metadata %{private}@ has an older lastModified date than the existing metadata", buf, 0xCu);
            }
          }
          objc_msgSend(v71, "addObject:", v39);

        }
        v36 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v36);
    }

    v6 = v65;
    objc_msgSend(v65, "bs_safeStringForKey:", CFSTR("action"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v70;
    -[DNDSIDSSyncEngine _queue_sendAckWithMetadata:forAction:toDeviceWithIdentifier:](self, "_queue_sendAckWithMetadata:forAction:toDeviceWithIdentifier:", v71, v60, v70);

  }
  else
  {
    v61 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v61, OS_LOG_TYPE_DEFAULT, "Ignoring update from paired device that we have never synced with", buf, 2u);
    }
  }

}

- (void)_queue_handleReplaceMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Received replace message", buf, 2u);
  }
  if (self->_role)
  {
    v9 = (void *)-[NSMapTable copy](self->_sourcesByZone, "copy");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14), (_QWORD)v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "purgeRecordsForIDSSyncEngine:", self);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    -[DNDSIDSSyncEngineMetadataStoring purge](self->_metadataStore, "purge");
    -[DNDSIDSSyncEngineMetadataStoring setPerformedInitialSyncForPairedDeviceIdentifier:](self->_metadataStore, "setPerformedInitialSyncForPairedDeviceIdentifier:", v7);
    -[DNDSIDSSyncEngine _queue_handleUpdateMessage:fromPairedDeviceIdentifier:](self, "_queue_handleUpdateMessage:fromPairedDeviceIdentifier:", v6, v7);

  }
  else
  {
    v16 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      -[DNDSIDSSyncEngine _queue_handleReplaceMessage:fromPairedDeviceIdentifier:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

- (void)_queue_validate
{
  DNDSIDSSyncEngineMetadataStoring *metadataStore;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSIDSSyncEngine _queue_removeAllInflightMetadata](self, "_queue_removeAllInflightMetadata");
  -[DNDSIDSSyncEngine _queue_cancelInflightExpirationTimer](self, "_queue_cancelInflightExpirationTimer");
  if ((~LODWORD(self->_syncState) & 7) == 0)
  {
    if (self->_pairedDevice)
    {
      if (-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot"))
      {
        metadataStore = self->_metadataStore;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(metadataStore) = -[DNDSIDSSyncEngineMetadataStoring isValidAtDate:](metadataStore, "isValidAtDate:", v4);

        if ((metadataStore & 1) == 0)
        {
          v5 = DNDSLogIDSSyncEngine;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v7 = 0;
            _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Metadata store is invalid; purging and syncing",
              v7,
              2u);
          }
          -[DNDSIDSSyncEngineMetadataStoring purge](self->_metadataStore, "purge");
          -[DNDSPairedDevice deviceIdentifier](self->_pairedDevice, "deviceIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSIDSSyncEngine _queue_syncDataSourcesToDeviceWithIdentifier:](self, "_queue_syncDataSourcesToDeviceWithIdentifier:", v6);

        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFireMetadataExpirationTimer, 0);
  objc_storeStrong(&self->_didReceiveUnlockMessage, 0);
  objc_storeStrong((id *)&self->_inflightMetadata, 0);
  objc_storeStrong((id *)&self->_inflightDateByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightMetadataByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightExpirationTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_sourcesByZone, 0);
}

void __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Ignoring incoming message as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2050;
  v4 = 12;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v0, v1, "*** PLEASE UPDATE DEVICES *** Rejecting incoming message as the version number is not supported by this sync protocol: versionNumber=%{public}lu, currentVersionNumber=%{public}lu", v2);
  OUTLINED_FUNCTION_1();
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v1, (uint64_t)v1, "Rejecting incoming message as it is not from the active device: deviceIdentifier=%{public}@, pairedDevice=%{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Rejecting incoming message as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error in didSendWithRequestIdentifier sending record modifications: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Ignoring message send callback as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_sendAckWithMetadata:(uint64_t)a3 forAction:(uint64_t)a4 toDeviceWithIdentifier:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Will not send ack because action is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error sending metadata ack: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to send unlock message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to send resync message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_sendModifiedRecordIDs:(uint64_t)a1 deletedRecordIDs:(void *)a2 toDeviceWithIdentifier:.cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_6(a1, a2);
  objc_msgSend(v3, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_4(&dword_1CB895000, v7, v8, "Deleted record metadata could not be serialized: %@");

  OUTLINED_FUNCTION_10();
}

- (void)_queue_sendModifiedRecordIDs:(uint64_t)a1 deletedRecordIDs:(void *)a2 toDeviceWithIdentifier:.cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_6(a1, a2);
  objc_msgSend(v3, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_4(&dword_1CB895000, v7, v8, "Modified record could not be serialized: %@");

  OUTLINED_FUNCTION_10();
}

void __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error in sendMessage sending record modifications: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleMessage:fromPairedDeviceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unknown action %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleReplaceMessage:(uint64_t)a3 fromPairedDeviceIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Paired device should never send a replace message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end
