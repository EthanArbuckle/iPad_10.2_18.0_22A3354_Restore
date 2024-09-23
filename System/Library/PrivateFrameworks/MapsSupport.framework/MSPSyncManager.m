@implementation MSPSyncManager

- (MSPSyncManager)init
{
  MSPSyncManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *saveQueue;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  SYService *service;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v15.receiver = self;
  v15.super_class = (Class)MSPSyncManager;
  v2 = -[MSPSyncManager init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.companionsync.save", v3);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v4;

    -[MSPSyncManager _updateFromDisk](v2, "_updateFromDisk");
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v6 = (void *)_MergedGlobals_45;
    v24 = _MergedGlobals_45;
    if (!_MergedGlobals_45)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getSYServiceClass_block_invoke;
      v19 = &unk_1E6652190;
      v20 = &v21;
      __getSYServiceClass_block_invoke((uint64_t)&v16);
      v6 = (void *)v22[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v21, 8);
    v8 = objc_msgSend([v7 alloc], "initWithService:priority:asMasterStore:options:", CFSTR("com.apple.private.alloy.maps.sync"), 0, 1, 0);
    service = v2->_service;
    v2->_service = (SYService *)v8;

    -[SYService setDelegate:queue:](v2->_service, "setDelegate:queue:", v2, v2->_saveQueue);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)qword_1ED328478;
    v24 = qword_1ED328478;
    if (!qword_1ED328478)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getNRPairedDeviceRegistryClass_block_invoke_0;
      v19 = &unk_1E6652190;
      v20 = &v21;
      __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)&v16);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v11, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getActivePairedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[MSPSyncManager _resumeSyncService](v2, "_resumeSyncService");
  }
  return v2;
}

- (void)_resumeSyncService
{
  SYService *service;
  uint64_t v3;

  service = self->_service;
  v3 = 0;
  -[SYService resume:](service, "resume:", &v3);
}

- (void)setNeedsFullSync
{
  NSObject *v4;
  void *v5;
  _BOOL4 resetSyncRequested;
  int v7;
  void *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    resetSyncRequested = self->_resetSyncRequested;
    v7 = 138478083;
    v8 = v5;
    v9 = 1024;
    v10 = resetSyncRequested;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSyncRequested:%i)", (uint8_t *)&v7, 0x12u);

  }
  if (!self->_resetSyncRequested)
  {
    self->_resetSyncRequested = 1;
    -[SYService setNeedsResetSync](self->_service, "setNeedsResetSync");
  }
}

- (void)_setHasChangesAvailable
{
  NSMutableArray *v3;
  uint64_t v4;

  if (!self->_resetSyncRequested)
  {
    v3 = self->_pendingSyncItems;
    objc_sync_enter(v3);
    v4 = -[NSMutableArray count](self->_pendingSyncItems, "count");
    objc_sync_exit(v3);

    if (v4)
      -[SYService setHasChangesAvailable](self->_service, "setHasChangesAvailable");
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 resetSyncRequested;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableArray *pendingSyncItems;
  void *v17;
  MSPSerializer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    resetSyncRequested = self->_resetSyncRequested;
    *(_DWORD *)buf = 138478083;
    v26 = CFSTR("startSession");
    v27 = 1024;
    v28 = resetSyncRequested;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSyncRequested:%i)", buf, 0x12u);
  }

  if (self->_resetSyncRequested)
  {
    self->_resetSyncRequested = 0;
    v11 = self->_pendingSyncItems;
    objc_sync_enter(v11);
    -[MSPSyncManager _updateFromDisk](self, "_updateFromDisk");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_pins;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          pendingSyncItems = self->_pendingSyncItems;
          -[MSPSyncManager _wrapPin:changeType:](self, "_wrapPin:changeType:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 1, (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](pendingSyncItems, "addObject:", v17);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_sync_exit(v11);
    -[MSPSyncManager preparingSync](self, "preparingSync");
  }
  objc_msgSend(v8, "setDelegate:", self, (_QWORD)v20);
  v18 = objc_alloc_init(MSPSerializer);
  objc_msgSend(v8, "setSerializer:", v18);

  objc_msgSend(v8, "setTargetQueue:", self->_saveQueue);
  return 1;
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v12 = v7;
    v13 = 2113;
    v14 = v8;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:didSwitchFromPairingID:%{private}@ toPairingID:%{private}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MSPSyncManager_service_didSwitchFromPairingID_toPairingID___block_invoke;
  block[3] = &unk_1E6651E88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__MSPSyncManager_service_didSwitchFromPairingID_toPairingID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeSyncService");
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *pendingSyncItems;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  uint64_t v31;
  NSMutableArray *obja;
  NSMutableArray *obj;
  id v34;
  uint64_t (**v35)(void);
  NSObject *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = (uint64_t (**)(void))a4;
  v31 = *MEMORY[0x1E0D263F8];
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v49 = CFSTR("enqueueChanges");
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
  }

  obja = self->_pendingSyncItems;
  objc_sync_enter(obja);
  v37 = (void *)-[NSMutableArray mutableCopy](self->_pendingSyncItems, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pendingSyncItems = self->_pendingSyncItems;
  self->_pendingSyncItems = v8;

  objc_sync_exit(obja);
  objc_msgSend(v37, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    while (1)
    {
      v36 = v11;
      if ((v35[2]() & 1) == 0)
        break;
      objc_msgSend(v37, "removeObjectAtIndex:", 0);
      objc_msgSend(v37, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = v12;
      if (!v12)
        goto LABEL_7;
    }
    obj = self->_pendingSyncItems;
    objc_sync_enter(obj);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableArray count](self->_pendingSyncItems, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = self->_pendingSyncItems;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "syncId", v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v17);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v37;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v22)
    {
      v23 = 0;
      v24 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v26, "syncId", v31);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v15, "containsObject:", v27);

          if ((v28 & 1) == 0)
            -[NSMutableArray insertObject:atIndex:](self->_pendingSyncItems, "insertObject:atIndex:", v26, v23++);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v22);
    }

    objc_sync_exit(obj);
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v49 = CFSTR("continue");
      _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
    }

    v13 = 1;
    v14 = v36;
  }
  else
  {
LABEL_7:
    if (objc_msgSend(v34, "isResetSync", v31))
      -[MSPSyncManager completedPreparingSync](self, "completedPreparingSync");
    GEOFindOrCreateLog();
    v13 = 2;
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v49 = CFSTR("sendComplete");
      _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v23 = CFSTR("applyChanges");
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "changeType", (_QWORD)v17);
        switch(v16)
        {
          case 3:
            -[MSPSyncManager _applyDeleteItem:](self, "_applyDeleteItem:", v15);
            break;
          case 2:
            -[MSPSyncManager _applyUpdateItem:](self, "_applyUpdateItem:", v15);
            break;
          case 1:
            -[MSPSyncManager _applyAddItem:](self, "_applyAddItem:", v15);
            break;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if (v8)
  {
    v8[2](v8, 1, 0);
    -[MSPSyncManager _notifyObservers](self, "_notifyObservers");
  }

}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138478339;
    v10 = CFSTR("complete");
    v11 = 1024;
    v12 = objc_msgSend(v6, "isResetSync");
    v13 = 2113;
    v14 = v7;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSync:%i error:%{private}@)", (uint8_t *)&v9, 0x1Cu);
  }

  if (objc_msgSend(v6, "isResetSync"))
    -[MSPSyncManager completedSync](self, "completedSync");

}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  NSObject *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138477827;
    v8 = CFSTR("resetDataStore");
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", (uint8_t *)&v7, 0xCu);
  }

  -[MSPSyncManager _clearAllNanoPersistableData](self, "_clearAllNanoPersistableData");
  return 1;
}

- (void)_clearAllNanoPersistableData
{
  NSMutableArray *obj;

  -[NSMutableArray removeAllObjects](self->_pins, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pinsMap, "removeAllObjects");
  obj = self->_pendingSyncItems;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_pendingSyncItems, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)_applyAddItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "hasPin"))
  {
    objc_msgSend(v5, "pin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSyncManager _addPin:](self, "_addPin:", v4);

  }
}

- (void)_applyUpdateItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "hasPin"))
  {
    objc_msgSend(v5, "pin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSyncManager _updatePin:](self, "_updatePin:", v4);

  }
}

- (void)_applyDeleteItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "hasPin"))
  {
    objc_msgSend(v5, "pin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSyncManager _removePin:](self, "_removePin:", v4);

  }
}

- (void)_notifyObservers
{
  void *v3;
  NSObject *saveQueue;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_pins, 1);
  saveQueue = self->_saveQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MSPSyncManager__notifyObservers__block_invoke;
  v6[3] = &unk_1E6651C08;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(saveQueue, v6);

}

uint64_t __34__MSPSyncManager__notifyObservers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "writePins:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "notifyObservers");
}

- (void)_updateFromDisk
{
  NSMutableArray *v3;
  NSMutableArray *pendingSyncItems;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *pins;
  NSMutableDictionary *v8;
  NSMutableDictionary *pinsMap;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pendingSyncItems = self->_pendingSyncItems;
  self->_pendingSyncItems = v3;

  -[MSPSyncManager readPins](self, "readPins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
  pins = self->_pins;
  self->_pins = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  pinsMap = self->_pinsMap;
  self->_pinsMap = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_pins;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = self->_pinsMap;
        objc_msgSend(v15, "identifier", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (id)_wrapPin:(id)a3 changeType:(int64_t)a4
{
  id v5;
  MSPCompanionSyncedItem *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(MSPCompanionSyncedItem);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSPCompanionSyncedItem syncIdWithPrefix:identifier:](MSPCompanionSyncedItem, "syncIdWithPrefix:identifier:", CFSTR("pin:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPCompanionSyncedItem setSyncId:](v6, "setSyncId:", v8);

  -[MSPCompanionSyncedItem setPin:](v6, "setPin:", v5);
  -[MSPCompanionSyncedItem setSyChangeType:](v6, "setSyChangeType:", a4);
  return v6;
}

- (void)_addPin:(id)a3
{
  NSMutableArray *pins;
  id v5;
  NSMutableDictionary *pinsMap;
  id v7;

  pins = self->_pins;
  v5 = a3;
  -[NSMutableArray addObject:](pins, "addObject:", v5);
  pinsMap = self->_pinsMap;
  objc_msgSend(v5, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pinsMap, "setObject:forKey:", v5, v7);

}

- (void)_updatePin:(id)a3
{
  NSMutableDictionary *pinsMap;
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  pinsMap = self->_pinsMap;
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pinsMap, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeObject:](self->_pins, "removeObject:", v9);
  -[NSMutableArray addObject:](self->_pins, "addObject:", v5);
  v7 = self->_pinsMap;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v5, v8);

}

- (void)_removePin:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pinsMap, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_pins, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_pinsMap, "removeObjectForKey:", v5);

}

- (id)pins
{
  return (id)-[NSMutableArray copy](self->_pins, "copy");
}

- (void)setDroppedPin:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableArray *pendingSyncItems;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_pendingSyncItems;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)-[NSMutableArray copy](self->_pins, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    v10 = v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MSPSyncManager _removePin:](self, "_removePin:", v12);
        pendingSyncItems = self->_pendingSyncItems;
        -[MSPSyncManager _wrapPin:changeType:](self, "_wrapPin:changeType:", v12, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](pendingSyncItems, "addObject:", v14);

      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (v4)
  {
    -[MSPSyncManager _addPin:](self, "_addPin:", v4);
    v15 = self->_pendingSyncItems;
    -[MSPSyncManager _wrapPin:changeType:](self, "_wrapPin:changeType:", v4, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    objc_sync_exit(v5);
LABEL_11:
    -[MSPSyncManager writePins:](self, "writePins:", self->_pins);
    -[MSPSyncManager _setHasChangesAvailable](self, "_setHasChangesAvailable");
    goto LABEL_12;
  }
  objc_sync_exit(v5);

  if (v8)
    goto LABEL_11;
LABEL_12:

}

- (id)readPins
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSyncItems, 0);
  objc_storeStrong((id *)&self->_pinsMap, 0);
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
