@implementation NNMKSyncProvider

- (id)watchAccounts
{
  NSObject *providerQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__NNMKSyncProvider_watchAccounts__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)requestWatchAccounts
{
  NSObject *providerQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSyncProvider_requestWatchAccounts__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPaired
{
  NSObject *providerQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__NNMKSyncProvider_isPaired__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__NNMKSyncProvider_watchAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_watchAccounts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __40__NNMKSyncProvider_requestWatchAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_watchAccounts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NNMKSyncProvider_requestWatchAccounts__block_invoke_2;
  block[3] = &unk_24F9F6270;
  block[4] = v5;
  dispatch_async(v6, block);
}

- (id)_watchAccounts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  -[NNMKDeviceSyncRegistry allSyncedAccountsKeyedByAccountId](self->_pairedDeviceRegistry, "allSyncedAccountsKeyedByAccountId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__NNMKSyncProvider__watchAccounts__block_invoke;
  v9[3] = &unk_24F9F7000;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (NNMKSyncProvider)initWithDelegate:(id)a3 syncStateManager:(id)a4 directoryProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_t v11;
  NNMKSyncProvider *v12;
  NSObject *providerQueue;
  _QWORD block[4];
  NNMKSyncProvider *v16;
  id v17;
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_queue_create("com.apple.nanomail.providerQueue", 0);
  v19.receiver = self;
  v19.super_class = (Class)NNMKSyncProvider;
  v12 = -[NNMKSyncEndpoint initWithQueue:](&v19, sel_initWithQueue_, v11);
  if (v12)
  {
    nnmk_setupLoggingSubsystems();
    objc_storeWeak((id *)&v12->_delegate, v8);
    objc_storeStrong((id *)&v12->_providerQueue, v11);
    providerQueue = v12->_providerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke;
    block[3] = &unk_24F9F6718;
    v16 = v12;
    v17 = v10;
    v18 = v9;
    dispatch_sync(providerQueue, block);

  }
  return v12;
}

- (void)_verifyPairingForcingSync:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NNMKSyncStateManager *syncStateManager;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v5 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncProvider _verifyPairingForcingSync:].cold.2(v3, v5);
  -[NNMKDirectoryProvider pairedDeviceRegistryPath](self->_directoryProvider, "pairedDeviceRegistryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncStateManager pairingStorePath](self->_syncStateManager, "pairingStorePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NNMKSyncProvider _isPaired](self, "_isPaired");
  if (v7)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = objc_msgSend(v6, "hasPrefix:", v7) ^ 1;
  v11 = -[NNMKSyncStateManager isInitialSyncRestricted](self->_syncStateManager, "isInitialSyncRestricted");
  if ((((v7 != 0) ^ v8) & 1) == 0 && !v10)
  {
    if (v8 && v3)
    {
      if (-[NNMKSyncProvider _pairedDeviceSupportsMultipleMailboxes](self, "_pairedDeviceSupportsMultipleMailboxes"))
      {
        v12 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE We are paired, but force re-sync was requested. Triggering #initial-sync", (uint8_t *)&v24, 2u);
        }
        -[NNMKSyncProvider _triggerInitialSyncToRecoverFromSyncVersionMismatch](self, "_triggerInitialSyncToRecoverFromSyncVersionMismatch");
      }
      else
      {
        -[NNMKDeviceSyncRegistry syncEnabledMailboxes](self->_pairedDeviceRegistry, "syncEnabledMailboxes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (!v22)
        {
          v23 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_22E161000, v23, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE We should be paired, but we don't have any synced mailbox. Forcing #initial-sync", (uint8_t *)&v24, 2u);
          }
          -[NNMKSyncProvider _triggerInitialSync](self, "_triggerInitialSync");
        }
      }
    }
    else
    {
      v15 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        syncStateManager = self->_syncStateManager;
        v17 = v15;
        -[NNMKSyncStateManager pairingStorePath](syncStateManager, "pairingStorePath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = 67240962;
        HIDWORD(v24) = v8;
        v25 = 1026;
        v26 = v7 != 0;
        v27 = 1024;
        v28 = v3;
        v29 = 2114;
        v30 = v18;
        _os_log_impl(&dword_22E161000, v17, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE State has not changed. Initial sync will not be triggered (paired: %{public}d, should: %{public}d, force: %{piblic}d). SyncStateManager.pairingStorePath %{public}@", (uint8_t *)&v24, 0x1Eu);

      }
    }
    goto LABEL_38;
  }
  if (v7)
  {
    if (v8)
    {
      v13 = qword_253E87A90;
      if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:
        -[NNMKSyncProvider _handleDidPairWithNewDevice](self, "_handleDidPairWithNewDevice", v24);
        goto LABEL_38;
      }
      LOWORD(v24) = 0;
      v14 = "#PAIRING_STATE Pairing verification determined we're paired with a new device. Will start syncing with new device...";
LABEL_20:
      _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, 2u);
      goto LABEL_37;
    }
    if (!v11)
    {
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        -[NNMKSyncProvider _verifyPairingForcingSync:].cold.1();
      goto LABEL_37;
    }
    if (v3
      && !-[NNMKDeviceSyncRegistry isMessagesSyncSuspendedByConnectivity](self->_pairedDeviceRegistry, "isMessagesSyncSuspendedByConnectivity"))
    {
      v13 = qword_253E87A90;
      if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      LOWORD(v24) = 0;
      v14 = "#PAIRING_STATE Pairing verification determined we're paired and we should force syncing, even though PairedS"
            "ync hasn't told Mail to start yet. Will force syncing...";
      goto LABEL_20;
    }
    v20 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_22E161000, v20, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Pairing verification determined we're paired. However, we're waiting for PairedSync to tell us to start syncing. Waiting...", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    v19 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_22E161000, v19, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Pairing verification determined we're no longer paired. Will unpair...", (uint8_t *)&v24, 2u);
    }
    -[NNMKSyncProvider _handleDidUnpair](self, "_handleDidUnpair");
  }
LABEL_38:

}

uint64_t __28__NNMKSyncProvider_isPaired__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPaired");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isPaired
{
  return self->_pairedDeviceRegistry != 0;
}

void __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke(uint64_t a1)
{
  NNMKSyncSessionController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NNMKDeviceSyncRegistry *v8;
  uint64_t v9;
  void *v10;
  NNMKSyncController *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NNMKSyncPersistenceHandler *v16;
  uint64_t v17;
  void *v18;
  NNMKInitialSyncProgressTracker *v19;
  uint64_t v20;
  void *v21;
  NNMKResendScheduler *v22;
  uint64_t v23;
  void *v24;
  NNMKBatchRequestHandler *v25;
  uint64_t v26;
  void *v27;
  NNMKMessagesSyncServiceServer *v28;
  uint64_t v29;
  void *v30;
  NNMKMessageContentSyncServiceServer *v31;
  uint64_t v32;
  void *v33;
  NNMKAccountsSyncServiceServer *v34;
  uint64_t v35;
  void *v36;
  NNMKFetchesSyncServiceServer *v37;
  uint64_t v38;
  void *v39;
  NNMKProtectedSyncServiceServer *v40;
  uint64_t v41;
  void *v42;
  NNMKProtectedContentSyncServiceServer *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  _QWORD block[4];
  id v50;
  uint8_t buf[16];

  v2 = objc_alloc_init(NNMKSyncSessionController);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "pairedDeviceRegistryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, 0);

    if (v7)
    {
      v8 = -[NNMKDeviceSyncRegistry initWithPath:]([NNMKDeviceSyncRegistry alloc], "initWithPath:", v5);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = v8;

    }
  }
  v11 = objc_alloc_init(NNMKSyncController);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 136);
  *(_QWORD *)(v12 + 136) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setDelegate:");
  v14 = *(void **)(a1 + 48);
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createDefaultSyncStateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v15);
  if (!v14)

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
  v16 = objc_alloc_init(NNMKSyncPersistenceHandler);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 80);
  *(_QWORD *)(v17 + 80) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setSyncController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setSyncStateManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setSessionController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v19 = objc_alloc_init(NNMKInitialSyncProgressTracker);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 168);
  *(_QWORD *)(v20 + 168) = v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setExecutionQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setSyncStateManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v22 = objc_alloc_init(NNMKResendScheduler);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 160);
  *(_QWORD *)(v23 + 160) = v22;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setSyncController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v25 = objc_alloc_init(NNMKBatchRequestHandler);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 176);
  *(_QWORD *)(v26 + 176) = v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setResendScheduler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setSyncController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setExecutionQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setBatchRequestHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v28 = -[NNMKMessagesSyncServiceServer initWithQueue:]([NNMKMessagesSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 88);
  *(_QWORD *)(v29 + 88) = v28;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setDelegate:");
  v31 = -[NNMKMessageContentSyncServiceServer initWithQueue:]([NNMKMessageContentSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 96);
  *(_QWORD *)(v32 + 96) = v31;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
  v34 = -[NNMKAccountsSyncServiceServer initWithQueue:]([NNMKAccountsSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v35 = *(_QWORD *)(a1 + 32);
  v36 = *(void **)(v35 + 104);
  *(_QWORD *)(v35 + 104) = v34;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setDelegate:");
  v37 = -[NNMKFetchesSyncServiceServer initWithQueue:]([NNMKFetchesSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v38 = *(_QWORD *)(a1 + 32);
  v39 = *(void **)(v38 + 112);
  *(_QWORD *)(v38 + 112) = v37;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setDelegate:");
  v40 = -[NNMKProtectedSyncServiceServer initWithQueue:]([NNMKProtectedSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 120);
  *(_QWORD *)(v41 + 120) = v40;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setDelegate:");
  v43 = -[NNMKProtectedContentSyncServiceServer initWithQueue:]([NNMKProtectedContentSyncServiceServer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v44 = *(_QWORD *)(a1 + 32);
  v45 = *(void **)(v44 + 128);
  *(_QWORD *)(v44 + 128) = v43;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setDelegate:");
  v46 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E161000, v46, OS_LOG_TYPE_DEFAULT, "SyncProvider Created...", buf, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "resetSyncRequestedFromMailboxes");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "recreatedFromScratch"))
  {
    objc_msgSend(*(id *)(a1 + 32), "providerQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke_18;
    block[3] = &unk_24F9F6270;
    v50 = *(id *)(a1 + 32);
    dispatch_async(v47, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_verifyPairingForcingSync:", 0);
  objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "forceRetryingAllPendingIDSMessages");

  objc_msgSend(*(id *)(a1 + 32), "_checkConnectivityBasedSuspensionTimer:", objc_msgSend(*(id *)(a1 + 32), "_isConnectedToWatch"));
}

- (NNMKResendScheduler)resendScheduler
{
  return self->_resendScheduler;
}

- (BOOL)_isConnectedToWatch
{
  return -[NNMKSyncProvider _isUsingCompaionSync](self, "_isUsingCompaionSync")
      || -[NNMKSyncServiceEndpoint connectivityState](self->_messagesSyncService, "connectivityState") == 4;
}

- (BOOL)_isUsingCompaionSync
{
  return -[NNMKSyncServiceEndpoint connectivityState](self->_messagesSyncService, "connectivityState") == 2
      || -[NNMKSyncServiceEndpoint connectivityState](self->_messagesSyncService, "connectivityState") == 3;
}

- (void)_checkConnectivityBasedSuspensionTimer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  NSObject *providerQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a3;
  -[NNMKDeviceSyncRegistry disconnectedSince](self->_pairedDeviceRegistry, "disconnectedSince");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (((v6 ^ v3) & 1) != 0)
  {
    if (v3)
      return;
    goto LABEL_14;
  }
  v7 = qword_253E87A90;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "Is now disconnected. Initiating timer to suspend sync.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKDeviceSyncRegistry setDisconnectedSince:](self->_pairedDeviceRegistry, "setDisconnectedSince:", v9);

LABEL_14:
    -[NNMKDeviceSyncRegistry disconnectedSince](self->_pairedDeviceRegistry, "disconnectedSince");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBCE60];
      v12 = *(double *)&kIntervalBeforeSuspendingDueToLackOfConnectivity;
      -[NNMKDeviceSyncRegistry disconnectedSince](self->_pairedDeviceRegistry, "disconnectedSince");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateWithTimeInterval:sinceDate:", v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      providerQueue = self->_providerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__NNMKSyncProvider__checkConnectivityBasedSuspensionTimer___block_invoke;
      block[3] = &unk_24F9F6270;
      block[4] = self;
      dispatch_after(v16, providerQueue, block);

    }
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncProvider _checkConnectivityBasedSuspensionTimer:].cold.1();
  -[NNMKDeviceSyncRegistry setDisconnectedSince:](self->_pairedDeviceRegistry, "setDisconnectedSince:", 0);
  if (-[NNMKDeviceSyncRegistry isMessagesSyncSuspendedByConnectivity](self->_pairedDeviceRegistry, "isMessagesSyncSuspendedByConnectivity"))
  {
    -[NNMKDeviceSyncRegistry setIsMessagesSyncSuspendedByConnectivity:](self->_pairedDeviceRegistry, "setIsMessagesSyncSuspendedByConnectivity:", 0);
    v8 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "Sync was suspending due to lack of connectivity. We're connected now, so resuming...", buf, 2u);
    }
    -[NNMKSyncProvider _verifyPairingForcingSync:](self, "_verifyPairingForcingSync:", 1);
  }
}

- (id)currentDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

uint64_t __40__NNMKSyncProvider_requestWatchAccounts__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_253E87AA0;
  if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "Requesting watch accounts authentication status from watch", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendWatchAccountStatusRequest");
}

- (void)_sendWatchAccountStatusRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  -[NNMKSyncSessionController setAccountAuthRequestLastRequestTime:](self->_sessionController, "setAccountAuthRequestLastRequestTime:");

  -[NNMKSyncProvider accountsSyncService](self, "accountsSyncService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncSessionController accountAuthRequestLastRequestTime](self->_sessionController, "accountAuthRequestLastRequestTime");
  objc_msgSend(v4, "addAccountAuthenticationStatusRequest:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "requestWatchAccountsStatus:", v5);

}

- (NNMKSyncPersistenceHandler)persistenceHandler
{
  return self->_persistenceHandler;
}

- (NNMKAccountsSyncServiceServer)accountsSyncService
{
  return self->_accountsSyncService;
}

- (NNMKSyncProvider)initWithDelegate:(id)a3
{
  id v4;
  NNMKDirectoryProvider *v5;
  NNMKSyncProvider *v6;

  v4 = a3;
  v5 = objc_alloc_init(NNMKDirectoryProvider);
  v6 = -[NNMKSyncProvider initWithDelegate:syncStateManager:directoryProvider:](self, "initWithDelegate:syncStateManager:directoryProvider:", v4, 0, v5);

  return v6;
}

- (id)_createDefaultSyncStateManager
{
  return objc_alloc_init(NNMKSyncStateManager);
}

+ (BOOL)prepareForSystemAppDeletion:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingStorePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v5, 1);
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("NanoMail/registry.sqlite"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, a3);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because database was created from scratch.", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
}

- (void)dealloc
{
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  NNMKSyncStateManager *syncStateManager;
  objc_super v5;

  -[NNMKBatchRequestHandler cancelFetchTimeout](self->_batchRequestHandler, "cancelFetchTimeout");
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  self->_pairedDeviceRegistry = 0;

  syncStateManager = self->_syncStateManager;
  self->_syncStateManager = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)NNMKSyncProvider;
  -[NNMKSyncEndpoint dealloc](&v5, sel_dealloc);
}

- (void)tearDown
{
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  self->_pairedDeviceRegistry = 0;

}

- (void)_triggerInitialSyncToRecoverFromSyncVersionMismatch
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch)
  {
    v2 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring #initial-sync request. Already one in progress.", v3, 2u);
    }
  }
  else
  {
    self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch = 1;
    -[NNMKSyncProvider _triggerInitialSync](self, "_triggerInitialSync");
  }
}

- (void)_triggerInitialSync
{
  -[NNMKSyncProvider _triggerInitialSyncTrackingProgress:](self, "_triggerInitialSyncTrackingProgress:", 0);
}

- (void)_triggerInitialSyncTrackingProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  NSObject *v7;
  void *v8;
  void *v9;
  NNMKDeviceSyncRegistry *v10;
  NSObject *v11;
  uint64_t v12;
  NNMKProtoPrepareForFullSyncRequest *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    v7 = v5;
    v15 = 134217984;
    v16 = -[NNMKDeviceSyncRegistry fullSyncVersion](pairedDeviceRegistry, "fullSyncVersion");
    _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "#initial-sync triggered. (Previous #sync-version: %lu)", (uint8_t *)&v15, 0xCu);

  }
  if (v3)
  {
    -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startTrackingInitialSync");

  }
  -[NNMKDeviceSyncRegistry cleanUpForInitialSync](self->_pairedDeviceRegistry, "cleanUpForInitialSync");
  v9 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_pairedDeviceRegistry;
    v11 = v9;
    v12 = -[NNMKDeviceSyncRegistry fullSyncVersion](v10, "fullSyncVersion");
    v15 = 134217984;
    v16 = v12;
    _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "Incrementing #sync-version. %lu", (uint8_t *)&v15, 0xCu);

  }
  v13 = objc_alloc_init(NNMKProtoPrepareForFullSyncRequest);
  -[NNMKProtoPrepareForFullSyncRequest setFullSyncVersion:](v13, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
  -[NNMKFetchesSyncServiceServer requestPrepareForFullSync:](self->_fetchesSyncService, "requestPrepareForFullSync:", v13);
  -[NNMKSyncProvider _requestDelegateForAccounts](self, "_requestDelegateForAccounts");
  v14 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "Requesting VIP List due to #initial-sync", (uint8_t *)&v15, 2u);
  }
  -[NNMKSyncProvider _requestDelegateForVIPList:](self, "_requestDelegateForVIPList:", 0);

}

- (void)replyWithAccounts:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__NNMKSyncProvider_replyWithAccounts___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __38__NNMKSyncProvider_replyWithAccounts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 40);
      v4 = v2;
      v15 = 134217984;
      v16 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Received accounts from MobileMail to sync to watch. %lu accounts.", (uint8_t *)&v15, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deleteAllMailboxes");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginUpdates");
    objc_msgSend(*(id *)(a1 + 32), "persistenceHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistAccounts:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "nnmk_map:", &__block_literal_global_9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "sendInitialAccountsSync:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerIDSIdentifier:objectIds:type:resendInterval:", v8, v7, CFSTR("Account"), 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "endUpdates");
    objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateProgressWithAccountsSent");

    objc_msgSend(*(id *)(a1 + 32), "_sendUpdatedMailboxSelection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "fullSyncVersion"));
    objc_msgSend(*(id *)(a1 + 32), "syncController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mailboxesToSync");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to initial account sync.", (uint8_t *)&v15, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_triggerFullSyncForMailboxes:", v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishedSendingInitialSyncContentToPairedDevice");

    }
  }
}

uint64_t __38__NNMKSyncProvider_replyWithAccounts___block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accountId");
}

- (void)_triggerFullSyncForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v6);

  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _triggerFullSyncForMailbox:].cold.1();
  }

}

- (void)_triggerFullSyncForMailboxes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NNMKDeviceSyncRegistry *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NNMKSyncProvider *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v4;
    v6 = v4;
    v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v27)
      goto LABEL_16;
    v7 = *(_QWORD *)v29;
    v26 = self;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        objc_msgSend(v9, "mailboxId");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NNMKDeviceSyncRegistry mailboxWithId:](pairedDeviceRegistry, "mailboxWithId:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v11) = objc_msgSend(v12, "syncRequested");
        v13 = (void *)qword_253E87A90;
        v14 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
        if ((v11 & 1) != 0)
        {
          if (!v14)
            goto LABEL_14;
          v15 = v13;
          objc_msgSend(v9, "mailboxId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = (uint64_t)v16;
          _os_log_impl(&dword_22E161000, v15, OS_LOG_TYPE_DEFAULT, "It will not request #full-sync for mailbox, because it has already been requested before. %{public}@", buf, 0xCu);
        }
        else
        {
          if (v14)
          {
            v17 = self->_pairedDeviceRegistry;
            v18 = v13;
            v19 = -[NNMKDeviceSyncRegistry fullSyncVersion](v17, "fullSyncVersion");
            objc_msgSend(v9, "mailboxId");
            v20 = v7;
            v21 = v6;
            v22 = v5;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v33 = v19;
            v34 = 2114;
            v35 = v23;
            _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "#full-sync triggered for mailbox. Requesting messages from MobileMail (#sync-version: %lu, mailbox:%{public}@).", buf, 0x16u);

            v5 = v22;
            v6 = v21;
            v7 = v20;
            self = v26;

          }
          objc_msgSend(v5, "addObject:", v9);
          -[NNMKDeviceSyncRegistry cleanUpForFullSyncWithMailbox:](self->_pairedDeviceRegistry, "cleanUpForFullSyncWithMailbox:", v9);
          objc_msgSend(v9, "setSyncRequested:", 1);
          -[NNMKDeviceSyncRegistry updateSyncRequestedForMailbox:](self->_pairedDeviceRegistry, "updateSyncRequestedForMailbox:", v9);
          -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mailboxId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject deletePendingIDSMessagesForMailboxId:](v15, "deletePendingIDSMessagesForMailboxId:", v16);
        }

LABEL_14:
      }
      v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (!v27)
      {
LABEL_16:

        if (objc_msgSend(v5, "count"))
        {
          -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "resetInitialSyncResendInterval");

          -[NNMKSyncProvider _requestDelegateForFirstMessagesForMailboxes:](self, "_requestDelegateForFirstMessagesForMailboxes:", v5);
        }

        v4 = v25;
        goto LABEL_21;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKSyncProvider _triggerFullSyncForMailboxes:].cold.1();
LABEL_21:

}

- (void)replyWithFirstMessages:(id)a3 includesProtectedMessages:(BOOL)a4 mailboxes:(id)a5 organizedByThread:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *providerQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a5;
  providerQueue = self->_providerQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke;
  v15[3] = &unk_24F9F6E48;
  v15[4] = self;
  v16 = v10;
  v18 = a6;
  v17 = v11;
  v19 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(providerQueue, v15);

}

void __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = qword_253E87A90;
  v4 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      v6 = v3;
      v13 = 134217984;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Received first messages from MobileMail (Message count: %lu).", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setOrganizeByThread:", *(unsigned __int8 *)(a1 + 56));
    if (objc_msgSend(*(id *)(a1 + 32), "_pairedDeviceSupportsMultipleMailboxes"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_sendFirstMessages:mailboxes:shouldUseProtectedChannel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 57));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateProgressWithMessageHeadersSent:", v7);

      return;
    }
    v8 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "Paired device does not support multiple mailboxes. Sending first messages to default mailbox.", (uint8_t *)&v13, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mailboxWithId:", CFSTR("-1"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (id)objc_msgSend(*(id *)(a1 + 32), "_legacy_sendFirstMessages:syncedMailbox:shouldUseProtectedChannel:", *(_QWORD *)(a1 + 40), v9, *(unsigned __int8 *)(a1 + 57));

      v7 = 0;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke_cold_1();
  }
  else if (v4)
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "No paired device. It won't sync messages for #full-sync.", (uint8_t *)&v13, 2u);
  }
}

- (id)_sendFirstMessages:(id)a3 mailboxes:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t j;
  void *v21;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NNMKDeviceSyncRegistry *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  int *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v53;
  void *v54;
  id obj;
  id v56;
  NNMKProtoInitialMessagesSyncBatch *v57;
  uint64_t v58;
  _BOOL4 v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v59 = a5;
  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupMessagesByMailboxId:", v7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = objc_alloc_init(NNMKProtoInitialMessagesSyncBatch);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v67 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "mailboxId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v13);
  }

  v17 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    objc_msgSend(v10, "nnmk_description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v71 = (uint64_t)v19;
    _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Preparing to send #full-sync for mailboxes. %{public}@", buf, 0xCu);

  }
  v54 = v7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count", v10));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v11;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  if (v61)
  {
    v58 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v63 != v58)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        objc_msgSend(v21, "mailboxId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKDeviceSyncRegistry mailboxWithId:](pairedDeviceRegistry, "mailboxWithId:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = objc_msgSend(v21, "syncActive");
          if (v25 != objc_msgSend(v24, "syncActive")
            || (v26 = objc_msgSend(v21, "syncEnabled"), v26 != objc_msgSend(v24, "syncEnabled")))
          {
            objc_msgSend(v21, "setSyncActive:", objc_msgSend(v24, "syncActive"));
            objc_msgSend(v21, "setSyncEnabled:", objc_msgSend(v24, "syncEnabled"));
          }
        }
        -[NNMKSyncProvider syncController](self, "syncController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "mailboxId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "filterMessages:byAlreadySynced:byMailbox:", v29, 0, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          objc_msgSend(v21, "mailboxId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = self->_pairedDeviceRegistry;
          objc_msgSend(v21, "mailboxId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](v34, "syncVersionForMailboxId:", v35);
          v37 = objc_msgSend(v30, "count");
          *(_DWORD *)buf = 138543874;
          v71 = (uint64_t)v33;
          v72 = 2048;
          v73 = v36;
          v74 = 2048;
          v75 = v37;
          _os_log_impl(&dword_22E161000, v32, OS_LOG_TYPE_DEFAULT, "Preparing messages to send for mailbox. (Mailbox: %{public}@, #mailbox-sync-version: %lu, Message count: %lu)", buf, 0x20u);

        }
        -[NNMKSyncProvider _initialSyncForMailbox:messages:shouldUseProtectedChannel:](self, "_initialSyncForMailbox:messages:shouldUseProtectedChannel:", v21, v30, v59);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          -[NNMKProtoInitialMessagesSyncBatch addInitialMessagesSync:](v57, "addInitialMessagesSync:", v38);
          objc_msgSend(v56, "addObjectsFromArray:", v30);
        }
        else
        {
          v39 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            objc_msgSend(v21, "mailboxId");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v71 = (uint64_t)v41;
            _os_log_impl(&dword_22E161000, v40, OS_LOG_TYPE_DEFAULT, "It won't send mailbox on #full-sync. %{public}@", buf, 0xCu);

          }
        }

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    }
    while (v61);
  }

  -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
  -[NNMKProtoInitialMessagesSyncBatch setFullSyncVersion:](v57, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
  v42 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
  if (v59)
    v42 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
  v43 = *(id *)((char *)&self->super.super.isa + *v42);
  objc_msgSend(v43, "sendBatchedInitialMessagesSync:", v57);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v53, "copy");
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "registerIDSIdentifier:objectIds:type:resendInterval:", v44, v46, CFSTR("InitialSync"), objc_msgSend(v47, "initialSyncResendInterval"));

  v48 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v48;
    v50 = objc_msgSend(v56, "count");
    objc_msgSend(v53, "nnmk_description");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v71 = v50;
    v72 = 2114;
    v73 = (uint64_t)v44;
    v74 = 2114;
    v75 = (uint64_t)v51;
    _os_log_impl(&dword_22E161000, v49, OS_LOG_TYPE_DEFAULT, "#full-sync messages sent (%lu messages - IDS identifier: %{public}@ - Mailbox ids: %{public}@).", buf, 0x20u);

  }
  return v56;
}

- (id)_initialSyncForMailbox:(id)a3 messages:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  id v7;
  id v8;
  NNMKProtoInitialMessagesSync *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v16;
  NNMKProtoInitialMessagesSync *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NNMKSyncedMessage *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v39;
  void *v40;
  uint64_t v41;
  NNMKProtoInitialMessagesSync *v42;
  NNMKSyncProvider *v43;
  id obj;
  _BOOL4 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v45 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "syncActive") & 1) != 0 || (objc_msgSend(v7, "syncEnabled") & 1) == 0)
  {
    v35 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      objc_msgSend(v7, "mailboxId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v37;
      v52 = 2048;
      v53 = objc_msgSend(v7, "syncActive");
      v54 = 2048;
      v55 = objc_msgSend(v7, "syncEnabled");
      _os_log_impl(&dword_22E161000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring MobileMail reply for first messages. Mailbox: %{public}@, active: %lu, enabled: %lu.", buf, 0x20u);

    }
    v17 = 0;
  }
  else
  {
    v9 = objc_alloc_init(NNMKProtoInitialMessagesSync);
    v10 = 72;
    -[NNMKProtoInitialMessagesSync setFullSyncVersion:](v9, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
    v11 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoInitialMessagesSync setDateSynced:](v9, "setDateSynced:", v13);

    +[NNMKProtoMailbox protoMailboxFromMailbox:](NNMKProtoMailbox, "protoMailboxFromMailbox:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoInitialMessagesSync setMailbox:](v9, "setMailbox:", v14);

    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    v40 = v7;
    objc_msgSend(v7, "mailboxId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoInitialMessagesSync setMailboxSyncVersion:](v9, "setMailboxSyncVersion:", -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](pairedDeviceRegistry, "syncVersionForMailboxId:", v16));

    v17 = v9;
    -[NNMKProtoInitialMessagesSync setOrganizedByThread:](v9, "setOrganizedByThread:", -[NNMKDeviceSyncRegistry organizeByThread](self->_pairedDeviceRegistry, "organizeByThread"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v39 = v8;
    obj = v8;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v47;
      v42 = v17;
      v43 = self;
      v41 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v23 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            objc_msgSend(v22, "messageId");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "accountId");
            v26 = v10;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dateReceived");
            v28 = v19;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v22, "status"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "messageIdHeader");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v51 = v25;
            v52 = 2114;
            v53 = (unint64_t)v27;
            v54 = 2114;
            v55 = (unint64_t)v29;
            v56 = 2112;
            v57 = v30;
            v58 = 2114;
            v59 = v31;
            _os_log_impl(&dword_22E161000, v24, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #full-sync)", buf, 0x34u);

            v19 = v28;
            v10 = v26;
            v20 = v41;

            v17 = v42;
            self = v43;

          }
          -[NNMKSyncProvider _messageProtobufForMessage:](self, "_messageProtobufForMessage:", v22, v39);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoInitialMessagesSync addInitialMessage:](v17, "addInitialMessage:", v32);

          v33 = -[NNMKSyncedMessage initWithMessage:]([NNMKSyncedMessage alloc], "initWithMessage:", v22);
          -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v33, "setUsedProtectedChannelForMessageSync:", v45);
          -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleMessageAdded:", v22);

          objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "addOrUpdateSyncedMessage:", v33);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      }
      while (v19);
    }

    v7 = v40;
    objc_msgSend(v40, "setSyncActive:", 1);
    objc_msgSend(v40, "setSyncRequested:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "updateSyncActiveForMailbox:", v40);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "updateSyncRequestedForMailbox:", v40);
    v8 = v39;
  }

  return v17;
}

- (id)_legacy_sendFirstMessages:(id)a3 syncedMailbox:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NNMKSyncedMessage *v9;
  NSObject *v10;
  void *v11;
  NNMKSyncedMessage *v12;
  void *v13;
  NNMKProtoInitialMessagesSync *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NNMKProtoInitialMessagesSync *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  int *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v45;
  NNMKSyncedMessage *v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  NNMKSyncedMessage *v59;
  _BYTE v60[128];
  uint64_t v61;

  v5 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NNMKSyncedMessage *)a4;
  if (-[NNMKSyncedMessage syncActive](v9, "syncActive"))
  {
    v10 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Reply from delegate for didRequestFirstMessages but mailbox is already active.", buf, 2u);
    }
    obj = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[NNMKSyncedMessage setSyncEnabled:](v9, "setSyncEnabled:", 1);
    -[NNMKDeviceSyncRegistry updateSyncEnabledForMailbox:](self->_pairedDeviceRegistry, "updateSyncEnabledForMailbox:", v9);
    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    -[NNMKSyncProvider syncController](self, "syncController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v8;
    objc_msgSend(v11, "filterMessages:byAlreadySynced:byMailbox:", v8, 0, v9);
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(NNMKProtoInitialMessagesSync);
    -[NNMKProtoInitialMessagesSync setFullSyncVersion:](v14, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
    v15 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoInitialMessagesSync setDateSynced:](v14, "setDateSynced:", v17);

    +[NNMKProtoMailbox protoMailboxFromMailbox:](NNMKProtoMailbox, "protoMailboxFromMailbox:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoInitialMessagesSync setMailbox:](v14, "setMailbox:", v18);

    v19 = +[NNMKMailbox syncedTypeFromMailbox:](NNMKMailbox, "syncedTypeFromMailbox:", v12);
    v46 = v12;
    if (v12)
    {
      -[NNMKProtoInitialMessagesSync setSyncedMailboxType:](v14, "setSyncedMailboxType:", v19);
      -[NNMKSyncedMessage accountId](v12, "accountId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoInitialMessagesSync setSyncedMailboxAccountId:](v14, "setSyncedMailboxAccountId:", v20);

      -[NNMKSyncedMessage url](v12, "url");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "absoluteString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoInitialMessagesSync setSyncedMailboxURL:](v14, "setSyncedMailboxURL:", v22);

      -[NNMKSyncedMessage customName](v12, "customName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoInitialMessagesSync setSyncedMailboxCustomName:](v14, "setSyncedMailboxCustomName:", v23);

    }
    else
    {
      -[NNMKProtoInitialMessagesSync setSyncedMailboxType:](v14, "setSyncedMailboxType:", 0);
    }
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v24, "dateReceived");
      v12 = (NNMKSyncedMessage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoInitialMessagesSync setDateForRequestingMoreMessages:](v14, "setDateForRequestingMoreMessages:", v26);

    }
    v27 = v14;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v13;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[NNMKSyncProvider _messageProtobufForMessage:](self, "_messageProtobufForMessage:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoInitialMessagesSync addInitialMessage:](v27, "addInitialMessage:", v33);

          v12 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:]([NNMKSyncedMessage alloc], "initWithMessage:useDefaultMailbox:", v32, 1);
          -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v12, "setUsedProtectedChannelForMessageSync:", v5);
          -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleMessageAdded:", v32);

          -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v12);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v29);
    }

    v35 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v5)
      v35 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    v45 = *(id *)((char *)&self->super.super.isa + *v35);
    objc_msgSend(v45, "sendInitialMessagesSync:", v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v46;
    if (v46)
    {
      -[NNMKSyncedMessage mailboxId](v46, "mailboxId");
      v12 = (NNMKSyncedMessage *)objc_claimAutoreleasedReturnValue();
      v59 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = (void *)MEMORY[0x24BDBD1A8];
    }
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "registerIDSIdentifier:objectIds:type:resendInterval:", v36, v38, CFSTR("InitialSync"), objc_msgSend(v39, "initialSyncResendInterval"));

    if (v46)
    {

    }
    -[NNMKSyncedMessage setSyncActive:](v46, "setSyncActive:", 1);
    -[NNMKDeviceSyncRegistry updateSyncActiveForMailbox:](self->_pairedDeviceRegistry, "updateSyncActiveForMailbox:", v46);
    -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
    v40 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      v42 = objc_msgSend(obj, "count");
      -[NNMKSyncedMessage mailboxId](v46, "mailboxId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v54 = v42;
      v55 = 2114;
      v56 = v43;
      v57 = 2114;
      v58 = v36;
      _os_log_impl(&dword_22E161000, v41, OS_LOG_TYPE_DEFAULT, "#full-sync messages sent (%lu messages - Mailbox id: %{public}@ IDS identifier: %{public}@).", buf, 0x20u);

    }
    v8 = v47;
  }

  return obj;
}

- (void)replyWithMoreMessages:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *providerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke;
  block[3] = &unk_24F9F6718;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(providerQueue, block);

}

void __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "mailboxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke_2;
  v7[3] = &unk_24F9F6E70;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "groupMessagesByMailbox:mailboxes:block:", v3, v4, v7);

}

void __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "conversationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v10, "conversationId");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_replyWithMoreMessages:forConversationWithId:includesProtectedMessages:mailbox:", v7, v12, objc_msgSend(*(id *)(a1 + 32), "hasProtectedMessages"), v6);
  }
  else
  {
    objc_msgSend(v10, "beforeDate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_replyWithMoreMessages:forDateReceivedBefore:includesProtectedMessages:mailbox:messagesForSpecialMailbox:", v7, v12, objc_msgSend(*(id *)(a1 + 32), "hasProtectedMessages"), v6, objc_msgSend(*(id *)(a1 + 32), "messagesForSpecialMailbox"));
  }

}

- (void)_replyWithMoreMessages:(id)a3 forDateReceivedBefore:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6 messagesForSpecialMailbox:(unint64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v9 = a5;
  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if ((objc_msgSend(v14, "syncActive") & 1) != 0)
  {
    if (a7)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19++), "setIsSpecialMailboxSpecific:", a7, (_QWORD)v33);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v17);
      }

    }
    -[NNMKSyncProvider syncController](self, "syncController", (_QWORD)v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filterMessages:byAlreadySynced:byMailbox:", v12, 1, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_msgSend(v21, "count");
      objc_msgSend(v14, "mailboxId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v38 = v24;
      v39 = 2048;
      v40 = a7;
      v41 = 2114;
      v42 = v13;
      v43 = 2114;
      v44 = v25;
      _os_log_impl(&dword_22E161000, v23, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES request. (Message Count: %lu, Special Mailbox Request: %lu, Date Request: %{public}@, Mailbox id: %{public}@)", buf, 0x2Au);

    }
    -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addMoreMessages:mailbox:isProtectedData:", v21, v14, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v9)
      v29 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v29), "sendMoreMessages:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "registerIDSIdentifier:objectIds:type:resendInterval:", v30, v28, CFSTR("Message"), 0);

    -[NNMKSyncProvider _requestDelegateForContentForMessageIds:highPriority:](self, "_requestDelegateForContentForMessageIds:highPriority:", v28, 0);
  }
  else
  {
    v32 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v32, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES request but we were actually expecting another response.", buf, 2u);
    }
  }

}

- (void)_replyWithMoreMessages:(id)a3 forConversationWithId:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(v12, "syncActive") & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17++), "setIsThreadSpecific:", 1, (_QWORD)v30);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v15);
    }

    -[NNMKSyncProvider syncController](self, "syncController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filterMessages:byAlreadySynced:byMailbox:", v13, 1, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v35 = v22;
      _os_log_impl(&dword_22E161000, v21, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES conversation request. (Message count: %lu)", buf, 0xCu);

    }
    -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler", (_QWORD)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addMoreConversationSpecificMessages:conversationId:mailbox:isProtectedData:", v19, v11, v12, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v7)
      v26 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v26), "sendMoreMessagesForConversation:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerIDSIdentifier:objectIds:type:resendInterval:", v27, v25, CFSTR("Message"), 0);

    -[NNMKSyncProvider _requestDelegateForContentForMessageIds:highPriority:](self, "_requestDelegateForContentForMessageIds:highPriority:", v25, 0);
  }
  else
  {
    v29 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v29, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES conversation request but we were actually expecting another response.", buf, 2u);
    }
  }

}

- (void)replyWithMessagesToSendAsFetchResponse:(id)a3 includesProtectedMessages:(BOOL)a4
{
  id v5;
  NSObject *providerQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  NNMKSyncProvider *v10;

  v5 = a3;
  providerQueue = self->_providerQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__NNMKSyncProvider_replyWithMessagesToSendAsFetchResponse_includesProtectedMessages___block_invoke;
  v8[3] = &unk_24F9F6298;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(providerQueue, v8);

}

uint64_t __85__NNMKSyncProvider_replyWithMessagesToSendAsFetchResponse_includesProtectedMessages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "MobileMail replied with full headers messages for %lu message IDs for #BATCHED_RESPONSE. Checking if we can now send batch back to Watch...", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "batchRequestHandler", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleMessageAdded:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_checkBatchFetchedMessages");
}

- (void)replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4
{
  id v6;
  NSObject *providerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke;
  block[3] = &unk_24F9F6EC0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(providerQueue, block);

}

void __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke_2;
  v4[3] = &unk_24F9F6E98;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "groupMessagesByMailbox:mailboxes:block:", v3, 0, v4);

}

uint64_t __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replyWithMessagesToResend:includesProtectedMessages:mailbox:", a2, *(unsigned __int8 *)(a1 + 40), a3);
}

- (void)_replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4 mailbox:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "syncActive"))
  {
    -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMessagesToResend:mailbox:isProtectedData:", v8, v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "messageIdsWithDefaultPriority");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
      if (v6)
        v14 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
      v15 = *(id *)((char *)&self->super.super.isa + *v14);
      objc_msgSend(v11, "protoMessagesWithDefaultPriority");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addMessages:notificationPriority:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageIdsWithDefaultPriority");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "registerIDSIdentifier:objectIds:type:resendInterval:", v17, v19, CFSTR("Message"), objc_msgSend(v11, "resendInterval"));

      v20 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v11, "messageIdsWithDefaultPriority");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 134218498;
        v24 = objc_msgSend(v22, "count");
        v25 = 2114;
        v26 = v17;
        v27 = 2048;
        v28 = objc_msgSend(v11, "resendInterval");
        _os_log_impl(&dword_22E161000, v21, OS_LOG_TYPE_DEFAULT, "Messages RESENT (Count: %lu - IDS Identifier: %{public}@ - Resend Interval: %lu).", (uint8_t *)&v23, 0x20u);

      }
    }

  }
}

- (void)replyWithAccountToResend:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__NNMKSyncProvider_replyWithAccountToResend___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __45__NNMKSyncProvider_replyWithAccountToResend___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NNMKProtoAccountAdditionOrUpdate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v3, "accountId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "syncedAccountForAccountWithId:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && (objc_msgSend(v5, "resendRequested") & 1) != 0)
      {
        v6 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(void **)(a1 + 40);
          v8 = v6;
          objc_msgSend(v7, "accountId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v9;
          _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "Account RESENT (Id: %{public}@).", buf, 0xCu);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginUpdates");
        v10 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
        objc_msgSend(*(id *)(a1 + 40), "accountId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setAccountId:](v10, "setAccountId:", v11);

        objc_msgSend(*(id *)(a1 + 40), "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setDisplayName:](v10, "setDisplayName:", v12);

        -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v10, "setShouldArchive:", objc_msgSend(*(id *)(a1 + 40), "shouldArchive"));
        -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v10, "setFullSyncVersion:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "fullSyncVersion"));
        objc_msgSend(*(id *)(a1 + 40), "username");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setUsername:](v10, "setUsername:", v13);

        objc_msgSend(*(id *)(a1 + 40), "localId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setLocalId:](v10, "setLocalId:", v14);

        objc_msgSend(*(id *)(a1 + 40), "parentAccountIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setParentId:](v10, "setParentId:", v15);

        objc_msgSend(*(id *)(a1 + 40), "typeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setTypeIdentifier:](v10, "setTypeIdentifier:", v16);

        objc_msgSend(*(id *)(a1 + 40), "emailAddressToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setEmailAddressToken:](v10, "setEmailAddressToken:", v17);

        objc_msgSend(*(id *)(a1 + 40), "pccEmailAddress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setPccEmailAddress:](v10, "setPccEmailAddress:", v18);

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "emailAddresses", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              -[NNMKProtoAccountAdditionOrUpdate addEmail:](v10, "addEmail:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v23++));
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v21);
        }

        objc_msgSend(*(id *)(a1 + 40), "defaultEmailAddress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setDefaultEmail:](v10, "setDefaultEmail:", v24);

        objc_msgSend(*(id *)(a1 + 32), "persistenceHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "updateMailboxListForAccount:mailboxListChanged:", *(_QWORD *)(a1 + 40), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setMailboxes:](v10, "setMailboxes:", v26);

        v27 = objc_msgSend(v5, "resendInterval");
        objc_msgSend(*(id *)(a1 + 40), "displayName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDisplayName:", v28);

        objc_msgSend(v5, "setShouldArchive:", objc_msgSend(*(id *)(a1 + 40), "shouldArchive"));
        objc_msgSend(*(id *)(a1 + 40), "emailAddresses");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setEmailAddresses:", v29);

        objc_msgSend(*(id *)(a1 + 40), "defaultEmailAddress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDefaultEmailAddress:", v30);

        objc_msgSend(*(id *)(a1 + 40), "typeIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTypeIdentifier:", v31);

        objc_msgSend(*(id *)(a1 + 40), "emailAddressToken");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setEmailAddressToken:", v32);

        objc_msgSend(*(id *)(a1 + 40), "pccEmailAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPccEmailAddress:", v33);

        objc_msgSend(v5, "setResendRequested:", 0);
        objc_msgSend(v5, "setResendInterval:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addOrUpdateSyncedAccount:", v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addOrUpdateAccount:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accountId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "registerIDSIdentifier:objectIds:type:resendInterval:", v34, v37, CFSTR("Account"), v27);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "endUpdates");
      }
      else
      {
        v38 = (void *)qword_253E87A90;
        if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

          return;
        }
        v39 = *(void **)(a1 + 40);
        v10 = v38;
        objc_msgSend(v39, "accountId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        _os_log_impl(&dword_22E161000, &v10->super.super, OS_LOG_TYPE_DEFAULT, "Unexpected reply from delegate for 'account to resend' (Id: %{public}@).", buf, 0xCu);

      }
      goto LABEL_18;
    }
    v41 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v41, OS_LOG_TYPE_DEFAULT, "Account does not exist anymore. It will not resend", buf, 2u);
    }
  }
}

- (void)replyWithMessageSendingProgress:(int64_t)a3 forComposedMessageId:(id)a4
{
  id v6;
  NSObject *providerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NNMKSyncProvider_replyWithMessageSendingProgress_forComposedMessageId___block_invoke;
  block[3] = &unk_24F9F6958;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(providerQueue, block);

}

void __73__NNMKSyncProvider_replyWithMessageSendingProgress_forComposedMessageId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NNMKProtoComposedMessageSendingProgressReport *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "hasMailboxSyncedActive"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 == 0x7FFFFFFF || v2 == -1)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeProgressForComposedMessageWithId:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setProgress:forComposedMessageWithId:");
    v4 = objc_alloc_init(NNMKProtoComposedMessageSendingProgressReport);
    -[NNMKProtoComposedMessageSendingProgressReport setComposedMessageId:](v4, "setComposedMessageId:", *(_QWORD *)(a1 + 40));
    -[NNMKProtoComposedMessageSendingProgressReport setProgress:](v4, "setProgress:", *(unsigned int *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "reportComposedMessageSendingProgress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Sending progress for composed message (Id: %{public}@ - Progress: %li - IDS Identifier: %{public}@)...", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerIDSIdentifier:objectIds:type:resendInterval:", v5, v10, CFSTR("SendingProgress"), 0);

    if (*(_QWORD *)(a1 + 48) == -1)
    {
      +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reportMessageDeliveryFailedInMode:", 0);

    }
  }
}

- (void)addMessages:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__NNMKSyncProvider_addMessages___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __32__NNMKSyncProvider_addMessages___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__NNMKSyncProvider_addMessages___block_invoke_2;
  v4[3] = &unk_24F9F6EE8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "groupMessagesByMailbox:mailboxes:block:", v3, 0, v4);

}

uint64_t __32__NNMKSyncProvider_addMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addMessages:mailbox:", a2, a3);
}

- (void)_addMessages:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "syncActive");
  v9 = (void *)qword_253E87A90;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "mailboxId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2048;
      v15 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Adding new messages for mailbox. %{public}@ - count: %lu", (uint8_t *)&v12, 0x16u);

    }
    -[NNMKSyncProvider _addMessages:messagesAreNew:mailbox:](self, "_addMessages:messagesAreNew:mailbox:", v6, 1, v7);
  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _addMessages:mailbox:].cold.1(v9, v7, (uint64_t)v6);
  }

}

- (void)updateMessagesStatus:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NNMKSyncProvider_updateMessagesStatus___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __41__NNMKSyncProvider_updateMessagesStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__NNMKSyncProvider_updateMessagesStatus___block_invoke_2;
  v4[3] = &unk_24F9F6EE8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "groupMessagesByMailbox:mailboxes:block:", v3, 0, v4);

}

uint64_t __41__NNMKSyncProvider_updateMessagesStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMessagesStatus:mailbox:", a2, a3);
}

- (void)_updateMessagesStatus:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NNMKMessagesSyncServiceServer *messagesSyncService;
  void *v12;
  void *v13;
  NNMKMessagesSyncServiceServer *v14;
  void *v15;
  void *v16;
  NNMKProtectedSyncServiceServer *protectedSyncService;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "syncActive") & 1) != 0)
  {
    -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateMessagesStatus:mailbox:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __50__NNMKSyncProvider__updateMessagesStatus_mailbox___block_invoke;
    v27[3] = &unk_24F9F6F10;
    v27[4] = self;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E327EE4](v27);
    messagesSyncService = self->_messagesSyncService;
    objc_msgSend(v9, "protoMessageUpdatesWithNotificationPriority");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageIdsWithNotificationPriority");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v10)[2](v10, messagesSyncService, v12, v13, 1);

    v14 = self->_messagesSyncService;
    objc_msgSend(v9, "protoMessageUpdatesWithDefaultPriority");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageIdsWithDefaultPriority");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, _QWORD))v10)[2](v10, v14, v15, v16, 0);

    protectedSyncService = self->_protectedSyncService;
    objc_msgSend(v9, "protoMessageUpdatesWithDefaultPriorityAndProtectedChannel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageIdsWithDefaultPriorityAndProtectedChannel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKProtectedSyncServiceServer *, void *, void *, _QWORD))v10)[2](v10, protectedSyncService, v18, v19, 0);

    objc_msgSend(v9, "messageIdsToDelete");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v9, "messageIdsToDelete");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider deleteMessagesWithIds:](self, "deleteMessagesWithIds:", v22);

    }
    objc_msgSend(v9, "messagesToAdd");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      objc_msgSend(v9, "messagesToAdd");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider _addMessages:messagesAreNew:mailbox:](self, "_addMessages:messagesAreNew:mailbox:", v25, 0, v7);

    }
  }
  else
  {
    v26 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider _updateMessagesStatus:mailbox:].cold.1(v26, v7, (uint64_t)v6);
  }

}

void __50__NNMKSyncProvider__updateMessagesStatus_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "messageStatusUpdatesCount"))
  {
    objc_msgSend(v13, "updateMessagesStatus:notificationPriority:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerIDSIdentifier:objectIds:type:resendInterval:", v11, v10, CFSTR("Message"), 0);

  }
}

- (void)deleteMessagesWithIds:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NNMKSyncProvider *v9;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke;
  v7[3] = &unk_24F9F6298;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "syncedMessageForMessageWithId:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "syncController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke_2;
  v10[3] = &unk_24F9F6EE8;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "groupMessagesByMailbox:mailboxes:block:", v2, 0, v10);

}

void __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deleteMessagesWithIds:mailbox:", v6, v5);

}

- (void)_deleteMessagesWithIds:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NNMKProtectedSyncServiceServer *protectedSyncService;
  void *v12;
  void *v13;
  NNMKMessagesSyncServiceServer *messagesSyncService;
  void *v15;
  void *v16;
  NNMKMessagesSyncServiceServer *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "syncActive"))
  {
    -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteMessagesWithIds:mailbox:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __51__NNMKSyncProvider__deleteMessagesWithIds_mailbox___block_invoke;
    v20[3] = &unk_24F9F6F38;
    v20[4] = self;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E327EE4](v20);
    protectedSyncService = self->_protectedSyncService;
    objc_msgSend(v9, "protectedProtobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protectedMessageIds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKProtectedSyncServiceServer *, void *, void *, _QWORD))v10)[2](v10, protectedSyncService, v12, v13, 0);

    messagesSyncService = self->_messagesSyncService;
    objc_msgSend(v9, "unprotectedNotificationProtobuf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprotectedNotificationMessageIds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v10)[2](v10, messagesSyncService, v15, v16, 1);

    v17 = self->_messagesSyncService;
    objc_msgSend(v9, "unprotectedDefaultProtobuf");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprotectedDefaultMessageIds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, _QWORD))v10)[2](v10, v17, v18, v19, 0);

  }
}

void __51__NNMKSyncProvider__deleteMessagesWithIds_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "messageDeletionsCount"))
  {
    objc_msgSend(v9, "deleteMessages:notificationPriority:", v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerIDSIdentifier:objectIds:type:resendInterval:", v12, v11, CFSTR("Message"), 0);

    v14 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "Deletion operation sent to watch. (IDS Identifier: %{public}@, Channel: %{public}@)", buf, 0x16u);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1 + 32), "_requestDelegateToStopDownloadingMessageElementsForMessageWithId:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (void)updateConversationId:(id)a3 notify:(BOOL)a4 messages:(id)a5
{
  if (a4)
    -[NNMKSyncProvider markConversationIdForNotify:messages:includesProtectedMessages:](self, "markConversationIdForNotify:messages:includesProtectedMessages:", a3, a5, 0);
  else
    -[NNMKSyncProvider markConversationIdForNotNotify:](self, "markConversationIdForNotNotify:", a3, a4, a5);
}

- (void)updateConversationId:(id)a3 mute:(BOOL)a4
{
  id v6;
  NSObject *providerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NNMKSyncProvider_updateConversationId_mute___block_invoke;
  block[3] = &unk_24F9F6EC0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(providerQueue, block);

}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "syncedMessagesForConversationWithId:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_2;
    v6[3] = &unk_24F9F6F60;
    v4 = *(id *)(a1 + 40);
    v9 = *(_BYTE *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "groupMessagesByMailbox:mailboxes:block:", v2, 0, v6);

  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1();
  }

}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "syncActive"))
  {
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(unsigned __int8 *)(a1 + 48);
      v8 = 138543618;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Conversation muted status updated (Id: %{public}@, Muted: %lu).", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_markConversationWithId:forState:include:mailbox:", *(_QWORD *)(a1 + 32), 2048, *(unsigned __int8 *)(a1 + 48), v4);
  }

}

- (void)markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *providerQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NNMKSyncProvider *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  providerQueue = self->_providerQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke;
  v13[3] = &unk_24F9F6F88;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(providerQueue, v13);

}

void __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "syncController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_41;
    v9[3] = &unk_24F9F6F60;
    v5 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v4, "groupMessagesByMailbox:mailboxes:block:", v5, 0, v9);

  }
  else
  {
    objc_msgSend(v2[9], "syncedMessagesForConversationWithId:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "syncController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_2;
      v12[3] = &unk_24F9F6F60;
      v8 = *(void **)(a1 + 48);
      v12[4] = *(_QWORD *)(a1 + 40);
      v13 = v8;
      v14 = *(_BYTE *)(a1 + 56);
      objc_msgSend(v7, "groupMessagesByMailbox:mailboxes:block:", v6, 0, v12);

    }
    else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_cold_1();
    }

  }
}

uint64_t __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markConversationIdForNotify:messages:includesProtectedMessages:mailbox:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), a3);
}

uint64_t __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markConversationIdForNotify:messages:includesProtectedMessages:mailbox:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48), a3);
}

- (void)_markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v11, "syncActive"))
  {
    v12 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "Conversation marked for notify (Id: %{public}@).", (uint8_t *)&v13, 0xCu);
    }
    -[NNMKSyncProvider _markConversationWithId:forState:include:mailbox:](self, "_markConversationWithId:forState:include:mailbox:", v9, 128, 1, v11);
    if (v10)
      -[NNMKSyncProvider _addMessages:mailbox:](self, "_addMessages:mailbox:", v10, v11);
  }

}

- (void)markConversationIdForNotNotify:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "syncedMessagesForConversationWithId:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke_2;
    v6[3] = &unk_24F9F6E70;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "groupMessagesByMailbox:mailboxes:block:", v2, 0, v6);

  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1();
  }

}

void __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "syncActive"))
  {
    v5 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Conversation marked for stop notifying (Id: %{public}@).", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_markConversationWithId:forState:include:mailbox:", *(_QWORD *)(a1 + 32), 128, 0, v4);
  }

}

- (void)addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *providerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  providerQueue = self->_providerQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke;
  v13[3] = &unk_24F9F6F88;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(providerQueue, v13);

}

void __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 40), "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailboxWithId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addMessageContent:forMessage:loadedProtected:mailbox:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), v5);
  }
  else
  {
    v6 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke_cold_1(v3, v6);
  }

}

- (void)_addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5 mailbox:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int *v23;
  NNMKMessageContentSyncServiceServer *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  NSObject *log;
  NNMKMessageContentSyncServiceServer *v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;
  _QWORD v77[3];

  v7 = a5;
  v77[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v12, "syncActive"))
  {
    v13 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      objc_msgSend(v11, "mailboxId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v15;
      _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_INFO, "Received message content from MobileMail - Id %{public}@", buf, 0xCu);

    }
    objc_msgSend(v10, "messageId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reportOriginalMessageContentSizeInBytes:source:", objc_msgSend(v10, "originalContentSize"), 0);

      -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addMessageContent:forMessage:mailbox:isProtectedData:", v10, v11, v12, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "protoMessageContentSync");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v25 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          objc_msgSend(v10, "messageId");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v19, "messageDoesNotExist") ^ 1;
          v29 = objc_msgSend(v19, "alreadySyncedWithCurrentPriority");
          *(_DWORD *)buf = 138543874;
          v64 = v27;
          v65 = 1024;
          v66 = v28;
          v67 = 1024;
          v68 = v29;
          _os_log_impl(&dword_22E161000, v26, OS_LOG_TYPE_DEFAULT, "Message Content ADDED but not synced (Message Id: %{public}@ Message Had Been Synced: %d, Already Synced With Current Priority: %d).", buf, 0x18u);

        }
        goto LABEL_26;
      }
      if (v7)
      {
        -[NNMKSyncProvider currentDeviceRegistry](self, "currentDeviceRegistry");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "protectedContentChannelSupported");
        v23 = &OBJC_IVAR___NNMKSyncProvider__contentSyncService;
        if (v22)
          v23 = &OBJC_IVAR___NNMKSyncProvider__protectedContentSyncService;
        v24 = (NNMKMessageContentSyncServiceServer *)*(id *)((char *)&self->super.super.isa + *v23);

      }
      else
      {
        v24 = self->_contentSyncService;
      }
      objc_msgSend(v19, "protoMessageContentSync");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v24;
      -[NNMKMessageContentSyncServiceServer syncMessageContent:notificationPriority:userRequested:](v24, "syncMessageContent:notificationPriority:userRequested:", v30, objc_msgSend(v19, "isNotificationPriority"), objc_msgSend(v19, "isUserRequest"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      -[NNMKSyncProvider sessionController](self, "sessionController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "notificationPayloadAcks");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        v36 = objc_msgSend(v19, "isNotificationPriority");

        if (!v36)
        {
LABEL_21:
          -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageId");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = v45;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "isUserRequest"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringValue");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v77[1] = v47;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "registerIDSIdentifier:objectIds:type:resendInterval:", v62, v48, CFSTR("MessageContent"), objc_msgSend(v19, "resendInterval"));

          v49 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            log = v49;
            objc_msgSend(v10, "messageId");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v19, "isNotificationPriority");
            v50 = objc_msgSend(v19, "isUserRequest");
            objc_msgSend(v10, "textData");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "length");
            v53 = objc_msgSend(v19, "compressedTextDataLength");
            objc_msgSend(v19, "protoMessageContentSync");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "fullSyncVersion");
            *(_DWORD *)buf = 138544898;
            v64 = v59;
            v65 = 1024;
            v66 = v58;
            v67 = 1024;
            v68 = v50;
            v69 = 2048;
            v70 = v52;
            v71 = 2048;
            v72 = v53;
            v73 = 2114;
            v74 = v62;
            v75 = 1024;
            v76 = v55;
            _os_log_impl(&dword_22E161000, log, OS_LOG_TYPE_DEFAULT, "Message Content ADDED (Id: %{public}@ - Notification Priority: %d - User Requested: %d - Data Length: %lu - Compressed Data Length: %lu - IDS Identifier: %{public}@ (#sync-version: %u)).", buf, 0x3Cu);

          }
          if (objc_msgSend(v19, "isContentCompletelySynced"))
          {
            -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "messageId");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "updateProgressWithContentCompletelySyncedForMessageId:", v57);

          }
LABEL_26:

          goto LABEL_27;
        }
        v37 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          objc_msgSend(v10, "messageId");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v64 = v39;
          _os_log_impl(&dword_22E161000, v38, OS_LOG_TYPE_DEFAULT, "Notifying BulletinDistributor Ping Subscriber that we synced content for notification. (Message Id: %{public}@)", buf, 0xCu);

        }
        -[NNMKSyncProvider sessionController](self, "sessionController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "notificationPayloadAcks");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "messageId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v42);
        v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v43[2](v43, 1);

        -[NNMKSyncProvider sessionController](self, "sessionController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "notificationPayloadAcks");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "messageId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v33);
      }

      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider _addMessageContent:forMessage:loadedProtected:mailbox:].cold.1();
  }
LABEL_27:

}

- (void)reportMessageContentDownloadFailureForMessageId:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__NNMKSyncProvider_reportMessageContentDownloadFailureForMessageId___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __68__NNMKSyncProvider_reportMessageContentDownloadFailureForMessageId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailboxForMessageWithId:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reportMessageContentDownloadFailureForMessageId:mailbox:", *(_QWORD *)(a1 + 40), v4);
    v3 = v4;
  }

}

- (void)_reportMessageContentDownloadFailureForMessageId:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NNMKProtoErrorDownloadingContentForMessageWarning *v10;
  void *v11;
  void *v12;
  void *v13;
  NNMKFetchesSyncServiceServer *fetchesSyncService;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "syncActive"))
  {
    v8 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v6;
      _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "Reported failure downloading content for message (Id: %{public}@).", (uint8_t *)&v18, 0xCu);
    }
    -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(NNMKProtoErrorDownloadingContentForMessageWarning);
      -[NNMKSyncProvider syncController](self, "syncController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "watchMessageIdFromMessageId:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoErrorDownloadingContentForMessageWarning setMessageId:](v10, "setMessageId:", v12);

      objc_msgSend(v7, "mailboxId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoErrorDownloadingContentForMessageWarning setMailboxId:](v10, "setMailboxId:", v13);

      fetchesSyncService = self->_fetchesSyncService;
      v15 = objc_msgSend(v9, "usedNotificationPriorityForMessageSync");
      if ((objc_msgSend(v9, "contentSyncedBecauseUserRequested") & 1) != 0)
        v16 = 1;
      else
        v16 = objc_msgSend(v9, "contentRequestedByUser");
      -[NNMKFetchesSyncServiceServer warnErrorDownloadingContentForMessage:notificationPriority:userRequested:](fetchesSyncService, "warnErrorDownloadingContentForMessage:notificationPriority:userRequested:", v10, v15, v16);
      objc_msgSend(v9, "setContentRequestedByUser:", 0);
      -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateProgressWithMessageContentDownloadFailed:", v6);

      -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v9);
    }

  }
}

- (void)addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *providerQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__NNMKSyncProvider_addAttachmentData_forMessageId_contentId_loadedProtected___block_invoke;
  block[3] = &unk_24F9F6FB0;
  block[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(providerQueue, block);

}

void __77__NNMKSyncProvider_addAttachmentData_forMessageId_contentId_loadedProtected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailboxForMessageWithId:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addAttachmentData:forMessageId:contentId:loadedProtected:mailbox:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v4);
    v3 = v4;
  }

}

- (void)addImageAttachment:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *providerQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__NNMKSyncProvider_addImageAttachment_forMessageId_contentId_loadedProtected___block_invoke;
  block[3] = &unk_24F9F6FB0;
  block[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(providerQueue, block);

}

void __78__NNMKSyncProvider_addImageAttachment_forMessageId_contentId_loadedProtected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailboxForMessageWithId:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    UIImageJPEGRepresentation(*(UIImage **)(a1 + 48), 0.9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_addAttachmentData:forMessageId:contentId:loadedProtected:mailbox:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v4);

  }
}

- (void)_addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6 mailbox:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  id v25;
  NNMKProtoAttachmentSync *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  unsigned int v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  _BYTE v50[10];
  void *v51;
  uint64_t v52;

  v8 = a6;
  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(a7, "syncActive"))
  {
    if (v12)
    {
      -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "contentSyncedUsingNotificationPriority");
      v44 = objc_msgSend(v15, "contentSyncedBecauseUserRequested");
      objc_msgSend(v15, "attachmentsContentIdsNotYetSynced");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v14);

      -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
      if (v15)
        v21 = v18 == 0;
      else
        v21 = 1;
      if (v21)
      {
        v22 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v46 = v13;
          v47 = 2114;
          v48 = v14;
          v49 = 1024;
          *(_DWORD *)v50 = v15 != 0;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v18;
          _os_log_impl(&dword_22E161000, v22, OS_LOG_TYPE_DEFAULT, "Attachment ADDED but not synced (Message Id: %{public}@, Content Id: %{public}@, Message Had Been Synced: %d, Attachment Not Yet Synced: %d).", buf, 0x22u);
        }
      }
      else
      {
        if (v16)
        {
          v19 = (double)(unint64_t)objc_msgSend(v12, "length");
          v20 = 1048576.0;
          v43 = v19 <= 1048576.0;
        }
        else
        {
          v43 = 0;
        }
        v24 = (double)(unint64_t)objc_msgSend(v12, "length", v19, v20);
        if (v24 > 2097152.0)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "data", v24, 2097152.0);

        }
        v25 = v12;
        v26 = objc_alloc_init(NNMKProtoAttachmentSync);
        -[NNMKProtoAttachmentSync setFullSyncVersion:](v26, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
        v27 = (void *)MEMORY[0x24BDD1618];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAttachmentSync setDateSynced:](v26, "setDateSynced:", v29);

        -[NNMKSyncProvider syncController](self, "syncController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "watchMessageIdFromMessageId:", v13);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAttachmentSync setMessageId:](v26, "setMessageId:", v31);

        objc_msgSend(v15, "mailboxId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAttachmentSync setMailboxId:](v26, "setMailboxId:", v32);

        -[NNMKSyncProvider syncController](self, "syncController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "watchAttachmentContentIdFromContentId:", v14);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAttachmentSync setContentId:](v26, "setContentId:", v34);

        -[NNMKProtoAttachmentSync setAttachmentData:](v26, "setAttachmentData:", v25);
        if (v8
          && -[NNMKDeviceSyncRegistry protectedContentChannelSupported](self->_pairedDeviceRegistry, "protectedContentChannelSupported"))
        {
          v35 = &OBJC_IVAR___NNMKSyncProvider__protectedContentSyncService;
        }
        else
        {
          v35 = &OBJC_IVAR___NNMKSyncProvider__contentSyncService;
        }
        v36 = *(id *)((char *)&self->super.super.isa + *v35);
        objc_msgSend(v36, "syncAttachment:notificationPriority:userRequested:", v26, v43, v44);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attachmentsContentIdsNotYetSynced");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "removeObject:", v14);

        v39 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v39;
          *(_DWORD *)buf = 138544130;
          v46 = v13;
          v47 = 2114;
          v48 = v14;
          v49 = 2048;
          *(_QWORD *)v50 = objc_msgSend(v25, "length");
          *(_WORD *)&v50[8] = 2114;
          v51 = v37;
          _os_log_impl(&dword_22E161000, v40, OS_LOG_TYPE_DEFAULT, "Attachment ADDED (Message Id: %{public}@, Content Id: %{public}@, Bytes: %lu, - IDS Identifier: %{public}@).", buf, 0x2Au);

        }
      }
      if (objc_msgSend(v15, "isContentCompletelySynced"))
      {
        -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "messageId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "updateProgressWithContentCompletelySyncedForMessageId:", v42);

      }
      -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v15);
      -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");

    }
    else
    {
      v23 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v46 = v13;
        v47 = 2114;
        v48 = v14;
        _os_log_impl(&dword_22E161000, v23, OS_LOG_TYPE_DEFAULT, "Received data to send = nil. MobileMail probably failed downloading it. Ignoring so we can re-try later upon user request (Message Id: %{public}@ - Content Id: %{public}@).", buf, 0x16u);
      }
    }
  }

}

- (void)reportWillDownloadFirstMessages
{
  NSObject *providerQueue;
  _QWORD block[5];

  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NNMKSyncProvider_reportWillDownloadFirstMessages__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_async(providerQueue, block);
}

void __51__NNMKSyncProvider_reportWillDownloadFirstMessages__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "MobileMail will download headers for the messages that are part of the #initial-sync. We're ignoring the download for the sake of reporting to PairedSync. Notifying client that we're done sending everything...", v4, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishedSendingInitialSyncContentToPairedDevice");

  }
}

- (void)addUpdateOrDeleteAccounts:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__NNMKSyncProvider_addUpdateOrDeleteAccounts___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __46__NNMKSyncProvider_addUpdateOrDeleteAccounts___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  NNMKSyncedAccount *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  NNMKProtoAccountAdditionOrUpdate *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NNMKProtoAccountDeletion *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  int v117;
  void *v118;
  uint64_t v119;
  id obj;
  id obja;
  id v122;
  int v123;
  uint64_t v124;
  NNMKProtoAccountDeletion *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  char v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  void *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  void *v152;
  uint8_t v153[128];
  uint8_t buf[4];
  void *v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  _BYTE v159[14];
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  uint64_t v163;

  v1 = a1;
  v163 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
    return;
  objc_msgSend(v2, "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "allSyncedAccountsKeyedByAccountId");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v126, "count"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = *(id *)(v1 + 40);
  v131 = v1;
  v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  if (!v127)
  {
    v117 = 0;
    v123 = 0;
    goto LABEL_53;
  }
  v117 = 0;
  v123 = 0;
  v124 = *(_QWORD *)v146;
  v3 = 0x24BDD1000uLL;
  do
  {
    for (i = 0; i != v127; ++i)
    {
      if (*(_QWORD *)v146 != v124)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
      objc_msgSend(v5, "accountId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "addObject:", v6);

      objc_msgSend(v5, "accountId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKeyedSubscript:", v7);
      v8 = (NNMKSyncedAccount *)objc_claimAutoreleasedReturnValue();

      v144 = 0;
      objc_msgSend(*(id *)(v1 + 32), "persistenceHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateMailboxListForAccount:mailboxListChanged:", v5, &v144);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v10 = -[NNMKSyncedAccount shouldArchive](v8, "shouldArchive");
        if (v10 == objc_msgSend(v5, "shouldArchive"))
        {
          v20 = *(void **)(v3 + 1992);
          -[NNMKSyncedAccount displayName](v8, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isString:equalToNullableString:", v21, v22))
          {
            v23 = *(void **)(v3 + 1992);
            -[NNMKSyncedAccount username](v8, "username");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "username");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isString:equalToNullableString:", v24, v25))
            {
              v114 = v25;
              v118 = v24;
              v26 = (void *)MEMORY[0x24BDBCF20];
              -[NNMKSyncedAccount emailAddresses](v8, "emailAddresses");
              v116 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setWithArray:");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)MEMORY[0x24BDBCF20];
              objc_msgSend(v5, "emailAddresses");
              v29 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setWithArray:", v29);
              v115 = v27;
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = (void *)v29;
              if (objc_msgSend(v27, "isEqualToSet:"))
              {
                v30 = v3;
                v31 = *(void **)(v3 + 1992);
                -[NNMKSyncedAccount defaultEmailAddress](v8, "defaultEmailAddress");
                v32 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "defaultEmailAddress");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v111 = (void *)v32;
                if (objc_msgSend(v31, "isString:equalToNullableString:", v32))
                {
                  v33 = *(void **)(v30 + 1992);
                  -[NNMKSyncedAccount typeIdentifier](v8, "typeIdentifier");
                  v34 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "typeIdentifier");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = (void *)v34;
                  if (objc_msgSend(v33, "isString:equalToNullableString:", v34))
                  {
                    v35 = *(void **)(v30 + 1992);
                    -[NNMKSyncedAccount emailAddressToken](v8, "emailAddressToken");
                    v36 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "emailAddressToken");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = (void *)v36;
                    if (objc_msgSend(v35, "isString:equalToNullableString:", v36))
                    {
                      v37 = *(void **)(v30 + 1992);
                      -[NNMKSyncedAccount pccEmailAddress](v8, "pccEmailAddress");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "pccEmailAddress");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = objc_msgSend(v37, "isString:equalToNullableString:", v38, v39) ^ 1;

                    }
                    else
                    {
                      v11 = 1;
                    }
                    v24 = v118;
                    v40 = (void *)v116;
                    v25 = v114;

                  }
                  else
                  {
                    v11 = 1;
                    v24 = v118;
                    v40 = (void *)v116;
                    v25 = v114;
                  }

                }
                else
                {
                  v11 = 1;
                  v24 = v118;
                  v40 = (void *)v116;
                  v25 = v114;
                }

              }
              else
              {
                v11 = 1;
                v24 = v118;
                v40 = (void *)v116;
                v25 = v114;
              }

            }
            else
            {
              v11 = 1;
            }

            v1 = v131;
          }
          else
          {
            v11 = 1;
          }

          if ((v11 & 1) == 0 && !v144)
          {
            v41 = v130;
            goto LABEL_49;
          }
        }
        else
        {
          v11 = 1;
        }
        objc_msgSend(v5, "displayName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setDisplayName:](v8, "setDisplayName:", v42);

        objc_msgSend(v5, "username");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setUsername:](v8, "setUsername:", v43);

        -[NNMKSyncedAccount setShouldArchive:](v8, "setShouldArchive:", objc_msgSend(v5, "shouldArchive"));
        objc_msgSend(v5, "emailAddresses");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setEmailAddresses:](v8, "setEmailAddresses:", v44);

        objc_msgSend(v5, "defaultEmailAddress");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setDefaultEmailAddress:](v8, "setDefaultEmailAddress:", v45);

        objc_msgSend(v5, "typeIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setTypeIdentifier:](v8, "setTypeIdentifier:", v46);

        objc_msgSend(v5, "emailAddressToken");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setEmailAddressToken:](v8, "setEmailAddressToken:", v47);

        objc_msgSend(v5, "pccEmailAddress");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setPccEmailAddress:](v8, "setPccEmailAddress:", v48);

        if (v11)
        {
          v49 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v50 = v49;
            objc_msgSend(v5, "accountId");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayName");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "username");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v5, "shouldArchive");
            objc_msgSend(v5, "emailAddresses");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "nnmk_description");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v155 = v51;
            v156 = 2114;
            v157 = (uint64_t)v52;
            v158 = 2114;
            *(_QWORD *)v159 = v53;
            *(_WORD *)&v159[8] = 1024;
            *(_DWORD *)&v159[10] = v54;
            v1 = v131;
            v160 = 2114;
            v161 = v56;
            _os_log_impl(&dword_22E161000, v50, OS_LOG_TYPE_DEFAULT, "Account UPDATED (Id: %{public}@ - Display Name: %{public}@ - Username: %{public}@ - Should Archive: %d - Email addresses: %{public}@).", buf, 0x30u);

          }
        }
        v19 = v130;
        if (v144)
        {
          v57 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v58 = v57;
            objc_msgSend(v5, "accountId");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v130, "count");
            *(_DWORD *)buf = 138543618;
            v155 = v59;
            v156 = 2048;
            v157 = v60;
            _os_log_impl(&dword_22E161000, v58, OS_LOG_TYPE_DEFAULT, "Account mailboxes UPDATED (Id: %{public}@ - New Mailboxes Count: %lu).", buf, 0x16u);

          }
        }
        v117 = 1;
      }
      else
      {
        v8 = -[NNMKSyncedAccount initWithAccount:]([NNMKSyncedAccount alloc], "initWithAccount:", v5);
        v12 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v5, "accountId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "shouldArchive");
          objc_msgSend(v5, "emailAddresses");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "nnmk_description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v155 = v14;
          v156 = 2114;
          v157 = (uint64_t)v15;
          v158 = 1024;
          *(_DWORD *)v159 = v16;
          *(_WORD *)&v159[4] = 2114;
          *(_QWORD *)&v159[6] = v18;
          _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Account ADDED (Id: %{public}@ - Display Name: %{public}@ - Should Archive: %d - Email addresses: %{public}@).", buf, 0x26u);

          v1 = v131;
        }
        v123 = 1;
        v19 = v130;
      }
      v61 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
      objc_msgSend(v5, "accountId");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setAccountId:](v61, "setAccountId:", v62);

      objc_msgSend(v5, "displayName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setDisplayName:](v61, "setDisplayName:", v63);

      -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v61, "setShouldArchive:", objc_msgSend(v5, "shouldArchive"));
      -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v61, "setFullSyncVersion:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "fullSyncVersion"));
      objc_msgSend(v5, "parentAccountIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setParentId:](v61, "setParentId:", v64);

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      objc_msgSend(v5, "emailAddresses");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v140, v153, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v141;
        do
        {
          for (j = 0; j != v67; ++j)
          {
            if (*(_QWORD *)v141 != v68)
              objc_enumerationMutation(v65);
            -[NNMKProtoAccountAdditionOrUpdate addEmail:](v61, "addEmail:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * j));
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v140, v153, 16);
        }
        while (v67);
      }

      objc_msgSend(v5, "defaultEmailAddress");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setDefaultEmail:](v61, "setDefaultEmail:", v70);

      objc_msgSend(v5, "username");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setUsername:](v61, "setUsername:", v71);

      objc_msgSend(v5, "localId");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setLocalId:](v61, "setLocalId:", v72);

      objc_msgSend(v5, "typeIdentifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setTypeIdentifier:](v61, "setTypeIdentifier:", v73);

      objc_msgSend(v5, "emailAddressToken");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setEmailAddressToken:](v61, "setEmailAddressToken:", v74);

      objc_msgSend(v5, "pccEmailAddress");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoAccountAdditionOrUpdate setPccEmailAddress:](v61, "setPccEmailAddress:", v75);

      -[NNMKProtoAccountAdditionOrUpdate setMailboxes:](v61, "setMailboxes:", v19);
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "addOrUpdateSyncedAccount:", v8);
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 104), "addOrUpdateAccount:", v61);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "resendScheduler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountId");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v78;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v152, 1);
      v41 = v19;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "registerIDSIdentifier:objectIds:type:resendInterval:", v76, v79, CFSTR("Account"), 0);

LABEL_49:
      v3 = 0x24BDD1000;
    }
    v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  }
  while (v127);
LABEL_53:

  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  objc_msgSend(v126, "allKeys");
  v122 = (id)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v137;
    v119 = *(_QWORD *)v137;
    do
    {
      v83 = 0;
      obja = (id)v81;
      do
      {
        if (*(_QWORD *)v137 != v82)
          objc_enumerationMutation(v122);
        v84 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v83);
        if ((objc_msgSend(v129, "containsObject:", v84) & 1) == 0)
        {
          v85 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v155 = v84;
            _os_log_impl(&dword_22E161000, v85, OS_LOG_TYPE_DEFAULT, "Account DELETED (Id: %{public}@).", buf, 0xCu);
          }
          v128 = v83;
          objc_msgSend(*(id *)(v1 + 32), "sessionController");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "deleteStandaloneStateForAccountId:", v84);

          v87 = objc_alloc_init(NNMKProtoAccountDeletion);
          -[NNMKProtoAccountDeletion setAccountId:](v87, "setAccountId:", v84);
          v125 = v87;
          -[NNMKProtoAccountDeletion setFullSyncVersion:](v87, "setFullSyncVersion:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "fullSyncVersion"));
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "removeSyncedAccountForAccountWithId:", v84);
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "mailboxesForAccountId:", v84);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          v135 = 0u;
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v133;
            do
            {
              for (k = 0; k != v90; ++k)
              {
                if (*(_QWORD *)v133 != v91)
                  objc_enumerationMutation(v88);
                v93 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
                v94 = (void *)qword_253E87A90;
                if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
                {
                  v95 = v94;
                  objc_msgSend(v93, "mailboxId");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v155 = v96;
                  v156 = 2114;
                  v157 = (uint64_t)v84;
                  _os_log_impl(&dword_22E161000, v95, OS_LOG_TYPE_DEFAULT, "Mailbox DELETED (Id: %{public}@, Account Id: %{public}@).", buf, 0x16u);

                  v1 = v131;
                }
                v97 = *(void **)(*(_QWORD *)(v1 + 32) + 72);
                objc_msgSend(v93, "mailboxId");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "deleteMailboxWithId:startTransaction:", v98, 0);

              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
            }
            while (v90);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 104), "deleteAccount:", v125);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 32), "resendScheduler");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v84;
          v123 = 1;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "registerIDSIdentifier:objectIds:type:resendInterval:", v99, v101, CFSTR("Account"), 0);

          v82 = v119;
          v81 = (uint64_t)obja;
          v83 = v128;
        }
        ++v83;
      }
      while (v83 != v81);
      v81 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
    }
    while (v81);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 72), "endUpdates");
  if (((v123 | v117) & 1) != 0)
  {
    v102 = qword_253E87AA0;
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v102, OS_LOG_TYPE_DEFAULT, "Requesting watch accounts authentication status from watch due to account update", buf, 2u);
    }
    objc_msgSend(*(id *)(v1 + 32), "_sendWatchAccountStatusRequest");
  }
  if ((v123 & 1) != 0)
  {
    objc_msgSend(*(id *)(v1 + 32), "syncController");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "mailboxWithId:", CFSTR("-1"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      v105 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E161000, v105, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync due to account add or deleted.", buf, 2u);
      }
      objc_msgSend(*(id *)(v1 + 32), "_triggerInitialSync");
    }

  }
}

- (void)updateMailboxSelection:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__NNMKSyncProvider_updateMailboxSelection___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

void __43__NNMKSyncProvider_updateMailboxSelection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint8_t v14[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_isPaired"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_pairedDeviceSupportsMultipleMailboxes") & 1) != 0
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "fullSyncVersion"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateMailboxSelection:notifyClient:", *(_QWORD *)(a1 + 40), 1);
      return;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mailboxWithId:", CFSTR("-1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "mailboxesWithAllMessagesSyncEnabled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3)
      v6 = v5 == 1;
    else
      v6 = 0;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "mailboxesWithAllMessagesSyncEnabled");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
      {
LABEL_16:

        return;
      }
    }
    else if ((v3 != 0) == (v5 == 1))
    {
      v7 = objc_msgSend(v2, "filterType");
      if (v7 == objc_msgSend(*(id *)(a1 + 40), "aggregatedMailboxesFilterTypes"))
        goto LABEL_16;
    }
    v13 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Synced mailbox changed. Triggering #initial-sync", v14, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
    goto LABEL_16;
  }
}

- (void)updateVIPSenderList:(id)a3
{
  -[NNMKSyncProvider updateVIPSenderList:requestContext:](self, "updateVIPSenderList:requestContext:", a3, 0);
}

- (void)updateVIPSenderList:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NSObject *providerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NNMKSyncProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NNMKSyncProvider_updateVIPSenderList_requestContext___block_invoke;
  block[3] = &unk_24F9F6718;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(providerQueue, block);

}

void __55__NNMKSyncProvider_updateVIPSenderList_requestContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Received VIP List. Count: %lu", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "accountsSyncService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKProtoVIPSenderList protoVIPList:](NNMKProtoVIPSenderList, "protoVIPList:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncVIPList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resendScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerIDSIdentifier:objectIds:type:resendInterval:", v7, 0, CFSTR("VIPList"), objc_msgSend(*(id *)(a1 + 48), "resendInterval"));

}

- (void)_updateMailboxSelection:(id)a3 notifyClient:(BOOL)a4
{
  id v5;
  NSObject *v6;
  NNMKMailboxSelection *v7;
  void *v8;
  NNMKMailboxSelection *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NNMKMailboxSelection *v53;
  void *v54;
  _BOOL4 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  unint64_t v67;
  __int16 v68;
  NNMKMailboxSelection *v69;
  uint64_t v70;

  v55 = a4;
  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v67 = v55;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Mailbox selection changed. (Notify client: %lu)", buf, 0xCu);
  }
  v7 = [NNMKMailboxSelection alloc];
  -[NNMKDeviceSyncRegistry syncEnabledMailboxes](self->_pairedDeviceRegistry, "syncEnabledMailboxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NNMKMailboxSelection initWithMailboxes:](v7, "initWithMailboxes:", v8);

  if (-[NNMKMailboxSelection isEqual:](v9, "isEqual:", v5))
  {
    v10 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Requested to udpate mailbox selection, but it has not changed. Ignoring.", buf, 2u);
    }
  }
  else
  {
    if (v55)
    {
      +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reportMailboxSelectionChanged:source:", v5, 0);

    }
    v12 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v67 = (unint64_t)v5;
      v68 = 2114;
      v69 = v9;
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "New Selection: [%{public}@], Previous Selection: [%{public}@]", buf, 0x16u);
    }
    -[NNMKSyncProvider syncController](self, "syncController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeInvalidMailboxesFromMailboxSelection:", v5);
    v14 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v14;
    +[NNMKMailboxSelection mailboxChangesApplyingSelection:previousSelection:](NNMKMailboxSelection, "mailboxChangesApplyingSelection:previousSelection:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      objc_msgSend(v15, "mailboxesToUpdate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nnmk_description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = (unint64_t)v19;
      _os_log_impl(&dword_22E161000, v17, OS_LOG_TYPE_DEFAULT, "Mailboxes to update. %{public}@", buf, 0xCu);

    }
    v20 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v15, "mailboxesToReSync");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "nnmk_description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = (unint64_t)v23;
      _os_log_impl(&dword_22E161000, v21, OS_LOG_TYPE_DEFAULT, "Mailboxes to re-sync. %{public}@", buf, 0xCu);

    }
    v53 = v9;
    v24 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend(v15, "mailboxesToDisableSync");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nnmk_description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = (unint64_t)v27;
      _os_log_impl(&dword_22E161000, v25, OS_LOG_TYPE_DEFAULT, "Mailboxes to disable sync. %{public}@", buf, 0xCu);

    }
    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v54 = v15;
    objc_msgSend(v15, "mailboxesToUpdate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v61 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          objc_msgSend(v33, "mailboxId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKDeviceSyncRegistry mailboxWithId:](pairedDeviceRegistry, "mailboxWithId:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "setSyncActive:", objc_msgSend(v36, "syncActive"));
          if (objc_msgSend(v33, "syncRequested"))
          {
            objc_msgSend(v33, "setSyncEnabled:", 1);
            if (!v55)
              objc_msgSend(v33, "setSyncRequested:", 0);
          }
          v37 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v67 = (unint64_t)v33;
            _os_log_impl(&dword_22E161000, v37, OS_LOG_TYPE_DEFAULT, "Updating mailbox. %{public}@", buf, 0xCu);
          }
          -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](self->_pairedDeviceRegistry, "addOrUpdateMailbox:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v30);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v54, "mailboxesToDisableSync");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          v44 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v67 = (unint64_t)v43;
            _os_log_impl(&dword_22E161000, v44, OS_LOG_TYPE_DEFAULT, "Disabling sync for mailbox. %{public}@", buf, 0xCu);
          }
          objc_msgSend(v43, "setSyncEnabled:", 0);
          -[NNMKDeviceSyncRegistry updateSyncEnabledForMailbox:](self->_pairedDeviceRegistry, "updateSyncEnabledForMailbox:", v43);
          -[NNMKDeviceSyncRegistry cleanUpForFullSyncWithMailbox:](self->_pairedDeviceRegistry, "cleanUpForFullSyncWithMailbox:", v43);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v40);
    }

    -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
    if (v55)
      -[NNMKSyncProvider _sendUpdatedMailboxSelection:](self, "_sendUpdatedMailboxSelection:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
    objc_msgSend(v54, "mailboxesToReSync");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    v9 = v53;
    if (v46)
    {
      v47 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        objc_msgSend(v54, "mailboxesToReSync");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "nnmk_description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = (unint64_t)v50;
        _os_log_impl(&dword_22E161000, v48, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to mailbox-selection changed. %{public}@", buf, 0xCu);

      }
      objc_msgSend(v54, "mailboxesToReSync");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v51);

    }
    v5 = v52;
  }

}

- (void)_sendUpdatedMailboxSelection:(unint64_t)a3
{
  -[NNMKSyncProvider _sendUpdatedMailboxSelection:resendInterval:](self, "_sendUpdatedMailboxSelection:resendInterval:", a3, 0);
}

- (void)_sendUpdatedMailboxSelection:(unint64_t)a3 resendInterval:(unint64_t)a4
{
  NSObject *v7;
  NNMKMailboxSelection *v8;
  void *v9;
  NNMKMailboxSelection *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v7 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "Sending updated mailbox selection.", v14, 2u);
  }
  v8 = [NNMKMailboxSelection alloc];
  -[NNMKDeviceSyncRegistry syncEnabledMailboxes](self->_pairedDeviceRegistry, "syncEnabledMailboxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NNMKMailboxSelection initWithMailboxes:](v8, "initWithMailboxes:", v9);

  +[NNMKProtoMailboxSelection protoMailboxSelectionFromMailboxSelection:fullSyncVersion:](NNMKProtoMailboxSelection, "protoMailboxSelectionFromMailboxSelection:fullSyncVersion:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMessagesSyncServiceServer updateMailboxSelection:](self->_messagesSyncService, "updateMailboxSelection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerIDSIdentifier:objectIds:type:resendInterval:", v12, 0, CFSTR("MailboxSelection"), a4);

}

- (void)notifyFetchCompleted
{
  NSObject *providerQueue;
  _QWORD block[5];

  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NNMKSyncProvider_notifyFetchCompleted__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __40__NNMKSyncProvider_notifyFetchCompleted__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NNMKProtoFetchRequestCompletedNotification *v4;
  uint8_t v6[16];

  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "#FETCH Manual Completed.", v6, 2u);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v4 = objc_alloc_init(NNMKProtoFetchRequestCompletedNotification);
  objc_msgSend(v3, "notifyFetchRequestCompleted:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_checkBatchFetchedMessages");
}

- (void)notifyFetchCompletedForMailboxId:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *providerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  NNMKSyncProvider *v14;

  v6 = a3;
  v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NNMKSyncProvider_notifyFetchCompletedForMailboxId_error___block_invoke;
  block[3] = &unk_24F9F6718;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(providerQueue, block);

}

void __59__NNMKSyncProvider_notifyFetchCompletedForMailboxId_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BOOL4 v4;
  NNMKProtoFetchRequestCompletedNotification *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40) != 0;
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "#FETCH Manual Completed (mailboxId: %{public}@, error: %d)", (uint8_t *)&v6, 0x12u);
  }
  v5 = objc_alloc_init(NNMKProtoFetchRequestCompletedNotification);
  -[NNMKProtoFetchRequestCompletedNotification setMailboxId:](v5, "setMailboxId:", *(_QWORD *)(a1 + 32));
  -[NNMKProtoFetchRequestCompletedNotification setFailed:](v5, "setFailed:", *(_QWORD *)(a1 + 40) != 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 112), "notifyFetchRequestCompleted:", v5);
  objc_msgSend(*(id *)(a1 + 48), "_checkBatchFetchedMessages");

}

- (id)bulletinFlagsForMessageStatus:(unint64_t)a3 dateReceived:(id)a4 messageWillBeAddedToSyncProvider:(BOOL)a5 mailboxId:(id)a6
{
  id v10;
  id v11;
  NSObject *providerQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a4;
  v11 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  providerQueue = self->_providerQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __106__NNMKSyncProvider_bulletinFlagsForMessageStatus_dateReceived_messageWillBeAddedToSyncProvider_mailboxId___block_invoke;
  v17[3] = &unk_24F9F6FD8;
  v17[4] = self;
  v18 = v11;
  v22 = a5;
  v20 = &v23;
  v21 = a3;
  v19 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_sync(providerQueue, v17);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __106__NNMKSyncProvider_bulletinFlagsForMessageStatus_dateReceived_messageWillBeAddedToSyncProvider_mailboxId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailboxWithId:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 72)
    && objc_msgSend(v7, "syncActive")
    && objc_msgSend(v7, "filterType")
    && (objc_msgSend(*(id *)(a1 + 32), "syncController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isValidMessageStatus:forMailbox:", *(_QWORD *)(a1 + 64), v7),
        v3,
        v4))
  {
    if (objc_msgSend(v7, "filterType") == 64)
      v5 = objc_msgSend(*(id *)(a1 + 48), "nnmk_isToday");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("MessageWillBeSynced"));

}

- (NNMKMailboxSelection)mailboxSelection
{
  NSObject *providerQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_mailboxSelection__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NNMKMailboxSelection *)v3;
}

void __36__NNMKSyncProvider_mailboxSelection__block_invoke(uint64_t a1)
{
  NNMKMailboxSelection *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = [NNMKMailboxSelection alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "syncEnabledMailboxes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NNMKMailboxSelection initWithMailboxes:](v2, "initWithMailboxes:", v6);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)syncedMailboxes
{
  NSObject *providerQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__NNMKSyncProvider_syncedMailboxes__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__NNMKSyncProvider_syncedMailboxes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "syncEnabledMailboxes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)containsSyncedMailbox:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL8 v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NNMKSyncProvider syncedMailboxes](self, "syncedMailboxes");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "mailboxId", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mailboxId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v14) = 1;
          v15 = v5;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (-[NNMKSyncProvider _pairedDeviceSupportsMultipleMailboxes](self, "_pairedDeviceSupportsMultipleMailboxes"))
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      LOBYTE(v14) = 0;
    else
      v14 = objc_msgSend(v4, "type") == 1;
LABEL_12:

  }
  return v14;
}

- (void)syncStandaloneAccountIdentity:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NNMKSyncProvider_syncStandaloneAccountIdentity___block_invoke;
  v7[3] = &unk_24F9F6298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

uint64_t __50__NNMKSyncProvider_syncStandaloneAccountIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendStandaloneAccountIdentity:resendInterval:", *(_QWORD *)(a1 + 40), 0);
}

void __34__NNMKSyncProvider__watchAccounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "account");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStandaloneState:", objc_msgSend(v4, "standaloneStateForAccountId:", v5));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

- (void)_sendStandaloneAccountIdentity:(id)a3 resendInterval:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addStandaloneAccountIdentity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)qword_253E87AA0;
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v6, "accountId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Sending standalone account identity: %{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    -[NNMKSyncSessionController setAccountAuthRequestLastRequestTime:](self->_sessionController, "setAccountAuthRequestLastRequestTime:");

    -[NNMKSyncProvider sessionController](self, "sessionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncingAccountIdentityByUsername");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "username");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v15);

    -[NNMKSyncProvider accountsSyncService](self, "accountsSyncService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendStandaloneAccountIdentity:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerIDSIdentifier:objectIds:type:resendInterval:", v17, v20, CFSTR("AccountIdentity"), a4);

  }
}

- (BOOL)organizeByThread
{
  NSObject *providerQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_organizeByThread__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__NNMKSyncProvider_organizeByThread__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "organizeByThread");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOrganizeByThread:(BOOL)a3
{
  NSObject *providerQueue;
  _QWORD v4[5];
  BOOL v5;

  providerQueue = self->_providerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__NNMKSyncProvider_setOrganizeByThread___block_invoke;
  v4[3] = &unk_24F9F7028;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(providerQueue, v4);
}

void __40__NNMKSyncProvider_setOrganizeByThread___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  char v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    v3 = objc_msgSend(v2, "organizeByThread");
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 != v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setOrganizeByThread:", v4 != 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allSyncedAccountsKeyedByAccountId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(NSObject **)(v7 + 56);
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_2;
        v9[3] = &unk_24F9F7028;
        v10 = *(_BYTE *)(a1 + 40);
        v9[4] = v7;
        dispatch_async(v8, v9);
      }
      else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      {
        __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because \"organized by thread\" flag changed. %lu", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
}

- (NNMKPairedDeviceInfo)pairedDeviceInfo
{
  NSObject *providerQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_pairedDeviceInfo__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NNMKPairedDeviceInfo *)v3;
}

void __36__NNMKSyncProvider_pairedDeviceInfo__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenWidth");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenScale");
  +[NNMKPairedDeviceInfo pairedDeviceInfoWithScreenWidth:screenScale:](NNMKPairedDeviceInfo, "pairedDeviceInfoWithScreenWidth:screenScale:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenWidth");
  if (v8 == 0.0 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenScale"), v9 != 0.0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_storeScreenRelatedValues");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenWidth");
    v11 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceScreenScale");
    +[NNMKPairedDeviceInfo pairedDeviceInfoWithScreenWidth:screenScale:](NNMKPairedDeviceInfo, "pairedDeviceInfoWithScreenWidth:screenScale:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (void)resendObjectsForIDSIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resendObjectsForIDSIdentifier:", v4);

}

- (void)messagesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
  -[NNMKSyncProvider _handleDidFailSendingProtobufWithIDSIdentifier:errorCode:](self, "_handleDidFailSendingProtobufWithIDSIdentifier:errorCode:", a4, a5);
}

- (void)messagesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrackingInitialSync");

  if (v7)
  {
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageTypeForIDSIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("InitialSync")))
    {
      -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateProgressWithMessageHeadersArrivedInPairedDevice");

      v11 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v5;
        _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "#full-sync sent successfully by IDS (IDS Identifier: %{public}@).", (uint8_t *)&v13, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    {
      -[NNMKSyncProvider messagesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:].cold.1();
    }

  }
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleIDSMessageSentSuccessfullyWithId:", v5);

}

- (void)messagesSyncServiceServerSpaceBecameAvailable:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "IDS Reported Space Became Available.", v6, 2u);
  }
  -[NNMKDeviceSyncRegistry prepareIDSIdentifiersForResendForErrorCode:](self->_pairedDeviceRegistry, "prepareIDSIdentifiersForResendForErrorCode:", 27);
  -[NNMKDeviceSyncRegistry datesForIDSIdentifiersScheduledToBeResent](self->_pairedDeviceRegistry, "datesForIDSIdentifiersScheduledToBeResent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncEndpoint enqueueIDSIdentifiersForResend:](self, "enqueueIDSIdentifiersForResend:", v5);

}

- (void)messagesSyncServiceServerConnectivityChanged:(id)a3
{
  _BOOL8 v4;
  void *v5;
  NNMKMessagesSyncServiceServer *messagesSyncService;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[NNMKSyncProvider _isConnectedToWatch](self, "_isConnectedToWatch", a3);
  v5 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
  {
    messagesSyncService = self->_messagesSyncService;
    v7 = v5;
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 2048;
    v11 = -[NNMKSyncServiceEndpoint connectivityState](messagesSyncService, "connectivityState");
    _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_INFO, "Connectivity changed (Connected: %d - Connectivity type: %lu)", (uint8_t *)v9, 0x12u);

  }
  -[NNMKSyncProvider sessionController](self, "sessionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceInStandalone:", -[NNMKSyncProvider _isUsingCompaionSync](self, "_isUsingCompaionSync") ^ 1);

  -[NNMKSyncProvider _checkConnectivityBasedSuspensionTimer:](self, "_checkConnectivityBasedSuspensionTimer:", v4);
}

- (void)messagesSyncServiceServer:(id)a3 didUpdateMessagesStatus:(id)a4
{
  id v5;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unint64_t v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  -[NNMKSyncProvider syncController](self, "syncController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageStatusUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageIdFromWatchMessageId:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](pairedDeviceRegistry, "syncedMessageForMessageWithId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKSyncProvider syncController](self, "syncController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mailboxWithId:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v15))
  {
    v42 = v15;
    v43 = v12;
    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "messageStatusUpdatesCount"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = v5;
    objc_msgSend(v5, "messageStatusUpdates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (!v16)
      goto LABEL_21;
    v17 = v16;
    v18 = *(_QWORD *)v48;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        -[NNMKSyncProvider syncController](self, "syncController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "messageId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "messageIdFromWatchMessageId:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          v34 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v35 = v34;
            +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v20, "updatedStatus"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v23;
            v53 = 2112;
            v54 = v36;
            _os_log_impl(&dword_22E161000, v35, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but we don't have it in our records. Updating anyway... (Id: %{public}@ - Status: %@ - Source: Watch).", buf, 0x16u);

          }
          goto LABEL_17;
        }
        v25 = objc_msgSend(v20, "statusVersion");
        v26 = objc_msgSend(v24, "statusVersion");
        v27 = (void *)qword_253E87A90;
        v28 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
        if (v26 <= v25)
        {
          if (v28)
          {
            v37 = v27;
            +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v20, "updatedStatus"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v23;
            v53 = 2112;
            v54 = v38;
            _os_log_impl(&dword_22E161000, v37, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED (Id: %{public}@ - Status: %@ - Source: Watch).", buf, 0x16u);

          }
          objc_msgSend(v24, "setStatus:", objc_msgSend(v20, "updatedStatus"));
          -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v24);
LABEL_17:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v20, "updatedStatus"));
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v29, v23);
          goto LABEL_18;
        }
        if (!v28)
          goto LABEL_19;
        v29 = v27;
        +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v20, "updatedStatus"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v24, "status"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v20, "statusVersion");
        v33 = objc_msgSend(v24, "statusVersion");
        *(_DWORD *)buf = 138544386;
        v52 = v23;
        v53 = 2112;
        v54 = v30;
        v55 = 2112;
        v56 = v31;
        v57 = 2048;
        v58 = v32;
        v59 = 2048;
        v60 = v33;
        _os_log_impl(&dword_22E161000, v29, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but version is outdated (Id: %{public}@ - Status: %@ - Local Status: %@ - Client Version: %lu - Local Version: %lu - Source: Watch).", buf, 0x34u);

LABEL_18:
LABEL_19:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (!v17)
      {
LABEL_21:

        -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
        if (objc_msgSend(v46, "count"))
          -[NNMKSyncProvider _notifyDelegateThatMessagesStatusWereUpdated:](self, "_notifyDelegateThatMessagesStatusWereUpdated:", v46);

        v12 = v43;
        v5 = v44;
        v15 = v42;
        goto LABEL_26;
      }
    }
  }
  v39 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v39;
    objc_msgSend(v12, "messageId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v41;
    _os_log_impl(&dword_22E161000, v40, OS_LOG_TYPE_DEFAULT, "Message Status DROPPED (Id: %{public}@ - Source: Watch).", buf, 0xCu);

  }
LABEL_26:

}

- (void)messagesSyncServiceServer:(id)a3 didDeleteMessages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  _BYTE v53[14];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "messageDeletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  -[NNMKSyncProvider syncController](self, "syncController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageIdFromWatchMessageId:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](pairedDeviceRegistry, "syncedMessageForMessageWithId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKSyncProvider syncController](self, "syncController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mailboxWithId:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v15))
  {
    v39 = v15;
    v40 = v12;
    v41 = v8;
    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "messageDeletionsCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = v5;
    objc_msgSend(v5, "messageDeletions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v17)
    {
      v18 = v17;
      v44 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v44)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[NNMKSyncProvider syncController](self, "syncController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "messageId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "messageIdFromWatchMessageId:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)qword_253E87A90;
          v26 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
          if (v24)
          {
            if (v26)
            {
              v27 = v25;
              v28 = objc_msgSend(v20, "deletionState");
              *(_DWORD *)buf = 138543618;
              v51 = v23;
              v52 = 2048;
              *(_QWORD *)v53 = v28;
              _os_log_impl(&dword_22E161000, v27, OS_LOG_TYPE_DEFAULT, "Message DELETED from Client (Id: %{public}@ - Deletion State: %lu).", buf, 0x16u);

            }
            -[NNMKDeviceSyncRegistry removeSyncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "removeSyncedMessageForMessageWithId:", v23);
            -[NNMKSyncProvider sessionController](self, "sessionController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "messageIdsToIgnoreStatusUpdates");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v23);

          }
          else if (v26)
          {
            v31 = v25;
            v32 = objc_msgSend(v20, "deletionState");
            *(_DWORD *)buf = 138543618;
            v51 = v23;
            v52 = 2048;
            *(_QWORD *)v53 = v32;
            _os_log_impl(&dword_22E161000, v31, OS_LOG_TYPE_DEFAULT, "Message DELETED from Client but we don't have it in our records. Deleting anyway... (Id: %{public}@ - Deletion State: %lu).", buf, 0x16u);

          }
          -[NNMKSyncProvider sessionController](self, "sessionController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "notificationPayloadAcks");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeObjectForKey:", v23);

          -[NNMKSyncProvider _requestDelegateToStopDownloadingMessageElementsForMessageWithId:](self, "_requestDelegateToStopDownloadingMessageElementsForMessageWithId:", v23);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v20, "deletionState"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, v23);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v18);
    }

    -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
    if (objc_msgSend(v16, "count"))
      -[NNMKSyncProvider _notifyDelegateThatMessagesStatusWereUpdated:](self, "_notifyDelegateThatMessagesStatusWereUpdated:", v16);

    v8 = v41;
    v5 = v42;
    v15 = v39;
    v12 = v40;
  }
  else
  {
    v36 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      objc_msgSend(v12, "mailboxId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v38;
      v52 = 1024;
      *(_DWORD *)v53 = v15 != 0;
      *(_WORD *)&v53[4] = 2114;
      *(_QWORD *)&v53[6] = v8;
      _os_log_error_impl(&dword_22E161000, v37, OS_LOG_TYPE_ERROR, "Ignoring deletion. Mailbox: %{public}@ (exists: %d), messageId: %{public}@", buf, 0x1Cu);

    }
  }

}

- (void)messagesSyncServiceServer:(id)a3 didRequestSendMessage:(id)a4
{
  id v5;
  NNMKComposedMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v20;
  NNMKDeviceSyncRegistry *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "hasComposedMessageId") & 1) != 0
    || objc_msgSend(v5, "tosCount")
    || objc_msgSend(v5, "ccsCount")
    || (objc_msgSend(v5, "hasSubject") & 1) != 0)
  {
    v6 = objc_alloc_init(NNMKComposedMessage);
    if ((objc_msgSend(v5, "hasComposedMessageId") & 1) != 0)
    {
      objc_msgSend(v5, "composedMessageId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKComposedMessage setComposedMessageId:](v6, "setComposedMessageId:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKComposedMessage setComposedMessageId:](v6, "setComposedMessageId:", v8);

    }
    -[NNMKComposedMessage setSendingType:](v6, "setSendingType:", objc_msgSend(v5, "sendingType"));
    objc_msgSend(v5, "tos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setTo:](v6, "setTo:", v9);

    objc_msgSend(v5, "ccs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setCc:](v6, "setCc:", v10);

    objc_msgSend(v5, "subject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setSubject:](v6, "setSubject:", v11);

    objc_msgSend(v5, "from");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setFrom:](v6, "setFrom:", v12);

    objc_msgSend(v5, "body");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setBody:](v6, "setBody:", v13);

    if ((objc_msgSend(v5, "hasReferenceMessageId") & 1) != 0)
    {
      -[NNMKSyncProvider syncController](self, "syncController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "referenceMessageId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "messageIdFromWatchMessageId:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKComposedMessage setReferenceMessageId:](v6, "setReferenceMessageId:", v16);

    }
    else
    {
      -[NNMKComposedMessage setReferenceMessageId:](v6, "setReferenceMessageId:", &stru_24F9F9D80);
    }
    if (objc_msgSend(v5, "hasIncludeAttachments"))
      v17 = objc_msgSend(v5, "includeAttachments");
    else
      v17 = 0;
    -[NNMKComposedMessage setIncludeAttachments:](v6, "setIncludeAttachments:", v17);
    objc_msgSend(v5, "accountId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKComposedMessage setAccountId:](v6, "setAccountId:", v18);

    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    -[NNMKComposedMessage composedMessageId](v6, "composedMessageId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKDeviceSyncRegistry setProgress:forComposedMessageWithId:](pairedDeviceRegistry, "setProgress:forComposedMessageWithId:", 0, v20);

    if (objc_msgSend(v5, "includeAttachments"))
    {
      v21 = self->_pairedDeviceRegistry;
      -[NNMKComposedMessage composedMessageId](v6, "composedMessageId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKDeviceSyncRegistry attachmentsForComposedMessageId:](v21, "attachmentsForComposedMessageId:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        -[NNMKDeviceSyncRegistry storePendingComposedMessage:](self->_pairedDeviceRegistry, "storePendingComposedMessage:", v6);
        v29 = (void *)qword_253E87A90;
        if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v25 = v29;
        objc_msgSend(v5, "composedMessageId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v26;
        _os_log_impl(&dword_22E161000, v25, OS_LOG_TYPE_DEFAULT, "Waiting to send Composed Message until attachment recieved (Composed Message Id: %{public}@).", (uint8_t *)&v30, 0xCu);
        goto LABEL_19;
      }
      -[NNMKComposedMessage setAttachments:](v6, "setAttachments:", v23);

    }
    -[NNMKSyncProvider _requestDelegateToSendComposedMessage:](self, "_requestDelegateToSendComposedMessage:", v6);
    v24 = (void *)qword_253E87A90;
    if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      goto LABEL_21;
    }
    v25 = v24;
    -[NNMKComposedMessage composedMessageId](v6, "composedMessageId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[NNMKComposedMessage sendingType](v6, "sendingType");
    -[NNMKComposedMessage referenceMessageId](v6, "referenceMessageId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543874;
    v31 = v26;
    v32 = 2048;
    v33 = v27;
    v34 = 2114;
    v35 = v28;
    _os_log_impl(&dword_22E161000, v25, OS_LOG_TYPE_DEFAULT, "Composed Message SENT from Client (Composed Message Id: %{public}@, Send Type: %lu - Message Id: %{public}@).", (uint8_t *)&v30, 0x20u);

LABEL_19:
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKSyncProvider messagesSyncServiceServer:didRequestSendMessage:].cold.1();
LABEL_21:

}

- (void)messagesSyncServiceServer:(id)a3 didUpdateMailboxSelection:(id)a4
{
  id v5;
  void *v6;
  NNMKMailboxSelection *v7;
  void *v8;
  NNMKMailboxSelection *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  uint8_t v14[16];

  v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", objc_msgSend(v5, "fullSyncVersion")))
  {
    objc_msgSend(v5, "mailboxSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [NNMKMailboxSelection alloc];
    -[NNMKDeviceSyncRegistry syncEnabledMailboxes](self->_pairedDeviceRegistry, "syncEnabledMailboxes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NNMKMailboxSelection initWithMailboxes:](v7, "initWithMailboxes:", v8);

    if (-[NNMKMailboxSelection isEqual:](v9, "isEqual:", v6))
    {
      v10 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Requested to update mailbox selection but no changes was found. Ignoring.", v14, 2u);
      }
    }
    else
    {
      -[NNMKSyncProvider _updateMailboxSelection:notifyClient:](self, "_updateMailboxSelection:notifyClient:", v6, 0);
      -[NNMKSyncProvider delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[NNMKSyncProvider delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "syncProvider:didUpdateMailboxSelection:", self, v6);

      }
    }

  }
}

- (void)messagesSyncServiceServer:(id)a3 didMoveMessages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id obj;
  _BOOL4 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v8);
  -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = v5;
  objc_msgSend(v5, "messageIds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NNMKSyncProvider syncController](self, "syncController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "messageIdFromWatchMessageId:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)qword_253E87A90;
        v18 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v31)
          {
            if (v18)
            {
              v19 = v17;
              objc_msgSend(v32, "mailboxId");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v13;
              v39 = 2114;
              v40 = v20;
              _os_log_impl(&dword_22E161000, v19, OS_LOG_TYPE_DEFAULT, "Message MOVED from Client (Id: %{public}@ - mailboxId: %{public}@).", buf, 0x16u);

            }
            objc_msgSend(v32, "mailboxId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setMailboxId:", v21);

            -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v16);
          }
          else
          {
            if (v18)
            {
              v24 = v17;
              objc_msgSend(v32, "mailboxId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v13;
              v39 = 2114;
              v40 = v25;
              _os_log_impl(&dword_22E161000, v24, OS_LOG_TYPE_DEFAULT, "Message MOVED from Client but new mailbox isn't active so deleting message (Id: %{public}@ - mailboxId: %{public}@).", buf, 0x16u);

            }
            -[NNMKDeviceSyncRegistry removeSyncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "removeSyncedMessageForMessageWithId:", v15);
          }
        }
        else if (v18)
        {
          v22 = v17;
          objc_msgSend(v32, "mailboxId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v13;
          v39 = 2114;
          v40 = v23;
          _os_log_impl(&dword_22E161000, v22, OS_LOG_TYPE_DEFAULT, "Message MOVED but we don't have it in our records. Updating anyway... (Id: %{public}@ - mailboxId: %{public}@ - Source: Watch).", buf, 0x16u);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v10);
  }

  -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
  -[NNMKSyncProvider delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    -[NNMKSyncProvider delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "messageIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "syncProvider:didMoveMessageIds:toMailbox:", self, v29, v8);

  }
}

- (void)messagesSyncServiceServer:(id)a3 didRecieveAttachmentsAtURL:(id)a4 composedMessageId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[NNMKDeviceSyncRegistry pendingComposedMessageWithId:](self->_pairedDeviceRegistry, "pendingComposedMessageWithId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NNMKDeviceSyncRegistry attachmentsFromURL:](self->_pairedDeviceRegistry, "attachmentsFromURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttachments:", v10);
    -[NNMKSyncProvider _requestDelegateToSendComposedMessage:](self, "_requestDelegateToSendComposedMessage:", v9);
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v9, "composedMessageId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "sendingType");
      objc_msgSend(v9, "referenceMessageId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "Recieved attachments and SENT Composed Message from Client (Composed Message Id: %{public}@, Send Type: %lu - Message Id: %{public}@).", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    v16 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v8;
      _os_log_impl(&dword_22E161000, v16, OS_LOG_TYPE_DEFAULT, "Recieved attachments, but waiting for composedMesageId: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    -[NNMKDeviceSyncRegistry saveAttachmentsForComposedMessageId:temporaryURL:](self->_pairedDeviceRegistry, "saveAttachmentsForComposedMessageId:temporaryURL:", v8, v7);
  }

}

- (void)messagesSyncServiceServer:(id)a3 didWarnMessagesFilteredOut:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v8))
  {
    v20 = v8;
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 134217984;
      v27 = objc_msgSend(v5, "removedMessageIdsCount");
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Messages filtered out. (Count: %lu).", buf, 0xCu);

    }
    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "removedMessageIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          -[NNMKSyncProvider syncController](self, "syncController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "messageIdFromWatchMessageId:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKDeviceSyncRegistry removeSyncedMessageForMessageWithId:](pairedDeviceRegistry, "removeSyncedMessageForMessageWithId:", v19);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
    v8 = v20;
  }

}

- (void)messagesSyncServiceServer:(id)a3 didRequestCompactMessages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v8))
  {
    v9 = (void *)MEMORY[0x24BDD1620];
    v10 = objc_opt_class();
    objc_msgSend(v5, "beforeDateReceived");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKDeviceSyncRegistry removeSyncedMessagesBeforeDateReceived:mailbox:](self->_pairedDeviceRegistry, "removeSyncedMessagesBeforeDateReceived:mailbox:", v12, v8);
  }
  else
  {
    v13 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider messagesSyncServiceServer:didRequestCompactMessages:].cold.1(v13, v5);
  }

}

- (void)messageContentSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
  -[NNMKSyncProvider _handleDidFailSendingProtobufWithIDSIdentifier:errorCode:](self, "_handleDidFailSendingProtobufWithIDSIdentifier:errorCode:", a4, a5);
}

- (void)messageContentSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrackingInitialSync");

  if (v7)
  {
    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectIdsForPendingIDSIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateProgressWithMessageContentArrivedInPairedDevice:", v10);

    }
  }
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncProvider messageContentSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:].cold.1();
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleIDSMessageSentSuccessfullyWithId:", v5);

}

- (void)accountsSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
  -[NNMKSyncProvider _handleDidFailSendingProtobufWithIDSIdentifier:errorCode:](self, "_handleDidFailSendingProtobufWithIDSIdentifier:errorCode:", a4, a5);
}

- (void)accountsSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateProgressWithAccountsArrivedInPairedDevice");

  v7 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "Accounts sent successfully by IDS (IDS Identifier: %{public}@).", (uint8_t *)&v9, 0xCu);
  }
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleIDSMessageSentSuccessfullyWithId:", v5);

}

- (void)accountsSyncServiceServer:(id)a3 didChangeAccountSourceType:(id)a4
{
  id v5;
  NNMKAccount *v6;
  void *v7;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NNMKDeviceSyncRegistry *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NNMKDeviceSyncRegistry *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", objc_msgSend(v5, "fullSyncVersion")))
  {
    v6 = objc_alloc_init(NNMKAccount);
    objc_msgSend(v5, "accountId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKAccount setAccountId:](v6, "setAccountId:", v7);

    -[NNMKAccount setSourceType:](v6, "setSourceType:", objc_msgSend(v5, "sourceType"));
    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    -[NNMKAccount accountId](v6, "accountId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NNMKDeviceSyncRegistry accountSourceTypeForAccountId:](pairedDeviceRegistry, "accountSourceTypeForAccountId:", v9);

    v11 = (void *)qword_253E87AA0;
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[NNMKAccount accountId](v6, "accountId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v13;
      v38 = 2048;
      v39 = -[NNMKAccount sourceType](v6, "sourceType");
      v40 = 2048;
      v41 = v10;
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "Received account source type change from watch. Id: %{public}@, Source Type: %lu, Previous: %lu", buf, 0x20u);

    }
    v14 = self->_pairedDeviceRegistry;
    v15 = -[NNMKAccount sourceType](v6, "sourceType");
    -[NNMKAccount accountId](v6, "accountId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKDeviceSyncRegistry updateSourceType:forAccountId:](v14, "updateSourceType:forAccountId:", v15, v16);

    if (!-[NNMKAccount sourceType](v6, "sourceType"))
    {
      v17 = (void *)qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        -[NNMKAccount accountId](v6, "accountId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v19;
        _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Account source type changed back to source type companion. Triggering #full-sync for all synced enabled mailboxes from account id %{public}@", buf, 0xCu);

      }
      v20 = self->_pairedDeviceRegistry;
      -[NNMKAccount accountId](v6, "accountId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKDeviceSyncRegistry mailboxesForAccountId:](v20, "mailboxesForAccountId:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "count"))
      {
        v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v32 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v29, "syncEnabled", (_QWORD)v31))
                objc_msgSend(v23, "addObject:", v29);
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v26);
        }

        -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v23);
        -[NNMKSyncProvider _requestDelegateForFetchForMailboxes:](self, "_requestDelegateForFetchForMailboxes:", v24);

      }
    }

  }
  else
  {
    v30 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider accountsSyncServiceServer:didChangeAccountSourceType:].cold.1(v30);
  }

}

- (void)accountsSyncServiceServer:(id)a3 didReceivedAccountAuthenticationStatus:(id)a4 requestTime:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  void *v12;
  NNMKSyncSessionController *sessionController;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id WeakRetained;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  id v51;
  char v52;
  void *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  id v72;
  id v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  NNMKSyncProvider *v77;
  id v78;
  id v79;
  id v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  double v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = qword_253E87AA0;
  if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Received watch accounts authentication status from watch.", buf, 2u);
  }
  if (a5 <= 0.0
    || (-[NNMKSyncSessionController accountAuthRequestLastRequestTime](self->_sessionController, "accountAuthRequestLastRequestTime"), v11 <= a5))
  {
    v62 = v8;
    -[NNMKDeviceSyncRegistry allSyncedAccountsKeyedByAccountId](self->_pairedDeviceRegistry, "allSyncedAccountsKeyedByAccountId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke;
    v75[3] = &unk_24F9F7078;
    v22 = v17;
    v76 = v22;
    v77 = self;
    v23 = v19;
    v78 = v23;
    v24 = v20;
    v79 = v24;
    v59 = v18;
    v80 = v59;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v75);
    v71[0] = v21;
    v71[1] = 3221225472;
    v71[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_72;
    v71[3] = &unk_24F9F70A0;
    v71[4] = self;
    v74 = 0;
    v25 = v23;
    v72 = v25;
    v26 = v24;
    v73 = v26;
    v60 = v22;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v71);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v24) = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v28 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NNMKSyncProvider _watchAccounts](self, "_watchAccounts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "syncProvider:didUpdateWatchAccounts:", self, v29);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v30 = v25;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    v32 = v30;
    if (v31)
    {
      v33 = v31;
      v34 = *(_QWORD *)v68;
LABEL_11:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v68 != v34)
          objc_enumerationMutation(v30);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v35), "maySupportStandaloneMode") & 1) != 0)
          break;
        if (v33 == ++v35)
        {
          v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
          if (v33)
            goto LABEL_11;
          v32 = v30;
          goto LABEL_22;
        }
      }

      v36 = objc_loadWeakRetained((id *)&self->_delegate);
      v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) == 0)
        goto LABEL_23;
      v38 = (void *)qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        objc_msgSend(v30, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "accountId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "standaloneState");
        *(_DWORD *)buf = 138543618;
        v84 = *(double *)&v41;
        v85 = 2048;
        v86 = v43;
        _os_log_impl(&dword_22E161000, v39, OS_LOG_TYPE_DEFAULT, "Requesting re-authentication for account: %{public}@ - State: %lu", buf, 0x16u);

      }
      v32 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v30, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "syncProvider:didRequestReauthenticationForAccount:", self, v44);

    }
LABEL_22:

LABEL_23:
    v58 = v30;
    v61 = v9;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v45 = v26;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v64 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v51 = objc_loadWeakRetained((id *)&self->_delegate);
          v52 = objc_opt_respondsToSelector();

          if ((v52 & 1) != 0)
          {
            v53 = (void *)qword_253E87AA0;
            if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
            {
              v54 = v53;
              objc_msgSend(v50, "accountId");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v50, "standaloneState");
              *(_DWORD *)buf = 138543618;
              v84 = *(double *)&v55;
              v85 = 2048;
              v86 = v56;
              _os_log_impl(&dword_22E161000, v54, OS_LOG_TYPE_DEFAULT, "Notifying authentication failed for account: %{public}@ - State: %lu", buf, 0x16u);

            }
            v57 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v57, "syncProvider:didFailAuthenticatingAccount:", self, v50);

          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      }
      while (v47);
    }

    v9 = v61;
    v8 = v62;
  }
  else
  {
    v12 = (void *)qword_253E87AA0;
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      sessionController = self->_sessionController;
      v14 = v12;
      -[NNMKSyncSessionController accountAuthRequestLastRequestTime](sessionController, "accountAuthRequestLastRequestTime");
      *(_DWORD *)buf = 134218240;
      v84 = a5;
      v85 = 2048;
      v86 = v15;
      _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "Received outdated accounts status, Ignoring. requestTime: %f, lastRequestTime: %f", buf, 0x16u);

    }
  }

}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);
    objc_msgSend(v7, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syncingAccountIdentityByUsername");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "sessionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "standaloneStateForAccountId:", v13);

    v15 = objc_msgSend(v6, "standaloneState");
    if (v14 != v15)
    {
      v16 = qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v5;
        v34 = 2048;
        v35 = v15;
        _os_log_impl(&dword_22E161000, v16, OS_LOG_TYPE_DEFAULT, "Updating standalone state for account. Account: %{public}@ - State: %lu", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "sessionController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateStandaloneState:forAccountId:", v15, v5);

      if (v14 == 2 && (_DWORD)v15 != 2)
      {
        v18 = *(void **)(a1 + 48);
LABEL_15:
        objc_msgSend(v7, "account");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        goto LABEL_16;
      }
      if (v14 == 1 && (_DWORD)v15 != 2)
      {
        v18 = *(void **)(a1 + 56);
        goto LABEL_15;
      }
    }
LABEL_16:
    objc_msgSend(v7, "emailAddressToken");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v7, "emailAddressToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "emailAddressToken");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
      {
LABEL_19:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v28, v5);

        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v6, "emailAddressToken");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_19;
    }
    objc_msgSend(v6, "emailAddressToken");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmailAddressToken:", v25);

    objc_msgSend(v6, "pccEmailAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPccEmailAddress:", v26);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addOrUpdateSyncedAccount:", v7);
    objc_msgSend(v7, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_69;
    v30[3] = &unk_24F9F7050;
    v31 = v7;
    +[NNMKStandaloneAccountHelper saveLocalAccountProperties:withCompletion:](NNMKStandaloneAccountHelper, "saveLocalAccountProperties:withCompletion:", v27, v30);

    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
    __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_cold_1();
LABEL_20:

}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_69(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)qword_253E87AA0;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "emailAddressToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 67109120;
      v10[1] = v9 != 0;
      _os_log_impl(&dword_22E161000, v8, OS_LOG_TYPE_DEFAULT, "#cloud-notifications Updated local account properties (hasToken: %d)", (uint8_t *)v10, 8u);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
  {
    __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_69_cold_1(a1, v6);
  }

}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sessionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "standaloneStateForAccountId:", v5);

  if (v8 != *(_QWORD *)(a1 + 56))
  {
    v9 = qword_253E87AA0;
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v20 = 138543618;
      v21 = v5;
      v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Updating standalone state for account. Account: %{public}@ - State: %lu", (uint8_t *)&v20, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "sessionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateStandaloneState:forAccountId:", *(_QWORD *)(a1 + 56), v5);

    objc_msgSend(v6, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "syncingAccountIdentityByUsername");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v15);

    }
    objc_msgSend(v6, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStandaloneState:", objc_msgSend(v17, "standaloneStateForAccountId:", v18));

    if (v8 == 1)
    {
      v19 = (id *)(a1 + 48);
    }
    else
    {
      if (v8 != 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      v19 = (id *)(a1 + 40);
    }
    objc_msgSend(*v19, "addObject:", v16);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)fetchesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
  -[NNMKSyncProvider _handleDidFailSendingProtobufWithIDSIdentifier:errorCode:](self, "_handleDidFailSendingProtobufWithIDSIdentifier:errorCode:", a4, a5);
}

- (void)fetchesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleIDSMessageSentSuccessfullyWithId:", v5);

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFetchInBatch:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", objc_msgSend(v5, "fullSyncVersion"));
  v7 = (void *)qword_253E87A90;
  v8 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      objc_msgSend(v5, "fetchRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v39 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "#FETCH requested (Requests: %lu)", buf, 0xCu);

    }
    v11 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "fetchRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "fetchRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v5;
    objc_msgSend(v5, "fetchRequests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v33 = 0;
          -[NNMKSyncProvider _handleFetchRequest:shouldResumeSync:](self, "_handleFetchRequest:shouldResumeSync:", v21, &v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              if (objc_msgSend(v21, "wantsBatchedResponse"))
                v25 = CFSTR("#BATCHED_RESPONSE");
              else
                v25 = &stru_24F9F9D80;
              objc_msgSend(v22, "mailboxId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = (uint64_t)v25;
              v40 = 2114;
              v41 = v26;
              _os_log_impl(&dword_22E161000, v24, OS_LOG_TYPE_DEFAULT, "Handling #FETCH %{public}@. (Mailbox id: %{public}@)", buf, 0x16u);

            }
            objc_msgSend(v13, "addObject:", v22);
            if (v33)
              objc_msgSend(v32, "addObject:", v22);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v18);
    }

    v5 = v31;
    if (objc_msgSend(v31, "wantsBatchedResponse"))
    {
      -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startFetchTimeout");

    }
    if (objc_msgSend(v13, "count"))
      -[NNMKSyncProvider _requestDelegateForFetchForMailboxes:](self, "_requestDelegateForFetchForMailboxes:", v13);
    if (objc_msgSend(v32, "count"))
    {
      v28 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E161000, v28, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes to resume sync due to fetch request.", buf, 2u);
      }
      -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v32);
    }
    -[NNMKSyncProvider _verifyPairingForcingSync:](self, "_verifyPairingForcingSync:", 0);

  }
  else
  {
    if (v8)
    {
      v29 = v7;
      objc_msgSend(v5, "fetchRequests");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v39 = objc_msgSend(v30, "count");
      _os_log_impl(&dword_22E161000, v29, OS_LOG_TYPE_DEFAULT, "#FETCH requested but #sync-version verification failed. (Requests: %lu)", buf, 0xCu);

    }
    -[NNMKSyncProvider _verifyPairingForcingSync:](self, "_verifyPairingForcingSync:", 1);
  }

}

- (id)_handleFetchRequest:(id)a3 shouldResumeSync:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKSyncProvider syncController](self, "syncController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxWithId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!objc_msgSend(v9, "syncActive")
      || !objc_msgSend(v9, "syncEnabled")
      || -[NNMKDeviceSyncRegistry isMessagesSyncSuspendedByConnectivity](self->_pairedDeviceRegistry, "isMessagesSyncSuspendedByConnectivity"))
    {
      if ((objc_msgSend(v9, "syncRequested") & 1) != 0)
      {
        v10 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v6, "mailboxId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "syncRequestedDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v12;
          v27 = 2114;
          v28 = v13;
          _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "Not enabling mailbox because syncRequested for mailbox: %{public}@, request date: %{public}@", (uint8_t *)&v25, 0x16u);

        }
      }
      else if (a4)
      {
        v15 = objc_msgSend(v9, "syncEnabled");
        v16 = (void *)qword_253E87A90;
        v17 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) != 0)
        {
          if (v17)
          {
            v18 = v16;
            objc_msgSend(v6, "mailboxId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v19;
            _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Ending suspensions, as we've received a fetch request for mailbox: %{public}@", (uint8_t *)&v25, 0xCu);

          }
        }
        else
        {
          if (v17)
          {
            v20 = v16;
            objc_msgSend(v6, "mailboxId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v21;
            _os_log_impl(&dword_22E161000, v20, OS_LOG_TYPE_DEFAULT, "Enabling mailbox due to a fetch request from the mailbox: %{public}@", (uint8_t *)&v25, 0xCu);

          }
          objc_msgSend(v9, "setSyncEnabled:", 1);
          -[NNMKDeviceSyncRegistry updateSyncEnabledForMailbox:](self->_pairedDeviceRegistry, "updateSyncEnabledForMailbox:", v9);
        }
        *a4 = 1;
      }
      -[NNMKDeviceSyncRegistry setIsMessagesSyncSuspendedByConnectivity:](self->_pairedDeviceRegistry, "setIsMessagesSyncSuspendedByConnectivity:", 0);
      -[NNMKDeviceSyncRegistry setDisconnectedSince:](self->_pairedDeviceRegistry, "setDisconnectedSince:", 0);
    }
    -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleBatchRequest:", v6);

    v23 = v9;
  }
  else
  {
    v14 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider _handleFetchRequest:shouldResumeSync:].cold.1(v14);
    -[NNMKSyncProvider _handleMailboxesDesync](self, "_handleMailboxesDesync");
  }

  return v9;
}

- (void)_handleMailboxesDesync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Ignoring mailboxes desync and #initial-sync because no accounts are synced yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke_2;
  block[3] = &unk_24F9F6270;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because of mailbox desync detected", v5, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setLastSyncDueToMailboxesMismatchRequestTime:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_triggerInitialSync");
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFetch:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "fullSyncVersion");
  -[NNMKSyncProvider syncController](self, "syncController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxWithId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", v6, v9);

  if ((v6 & 1) != 0)
  {
    v18 = 0;
    -[NNMKSyncProvider _handleFetchRequest:shouldResumeSync:](self, "_handleFetchRequest:shouldResumeSync:", v5, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "wantsBatchedResponse"))
    {
      -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startFetchTimeout");

    }
    if (v10)
    {
      v20 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider _requestDelegateForFetchForMailboxes:](self, "_requestDelegateForFetchForMailboxes:", v12);

      if (v18)
      {
        v13 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes to resume sync due to fetch request.", buf, 2u);
        }
        v19 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v14);

      }
    }
    -[NNMKSyncProvider _verifyPairingForcingSync:](self, "_verifyPairingForcingSync:", 0);

  }
  else
  {
    v15 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v5, "mailboxId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_22E161000, v16, OS_LOG_TYPE_DEFAULT, "Fetch Requested but #sync-version verification failed. (Mailbox: %{public}@)", buf, 0xCu);

    }
    -[NNMKSyncProvider _verifyPairingForcingSync:](self, "_verifyPairingForcingSync:", 1);
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesInBatch:(id)a4
{
  id v5;
  void *v6;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", objc_msgSend(v5, "fullSyncVersion")))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "moreMessagesRequests", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          -[NNMKSyncProvider _handleFetchRequestFromWatch:](self, "_handleFetchRequestFromWatch:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessagesInBatch:].cold.1();
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v8))
  {
    -[NNMKSyncProvider _handleFetchRequestFromWatch:](self, "_handleFetchRequestFromWatch:", v5);
  }
  else
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessages:].cold.1(v9, v5);
  }

}

- (void)_handleFetchRequestFromWatch:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "filterType");
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v5;
    v10 = objc_msgSend(v8, "filterType");
    if (v5)
      v11 = v10 == v5;
    else
      v11 = 1;
    v12 = !v11;
    if (!v11)
      objc_msgSend(v8, "setFilterType:", v5);
    v13 = (void *)MEMORY[0x24BDD1620];
    v14 = objc_opt_class();
    objc_msgSend(v4, "beforeDateReceived");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v8, "mailboxId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v16;
      v26 = 2048;
      v27 = v9;
      v28 = 2114;
      v29 = v19;
      _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "#LOAD_MORE_MESSAGES Requested (Date Request: %{public}@, Filter type: %lu, Mailbox: %{public}@)", (uint8_t *)&v24, 0x20u);

    }
    if (v12)
      v20 = objc_msgSend(v8, "filterType");
    else
      v20 = 0;
    -[NNMKSyncProvider _requestDelegateForMoreMessagesWithMailbox:beforeDate:messagesForspecialMailboxFilterType:](self, "_requestDelegateForMoreMessagesWithMailbox:beforeDate:messagesForspecialMailboxFilterType:", v8, v16, v20);

  }
  else
  {
    v21 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      objc_msgSend(v4, "mailboxId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_22E161000, v22, OS_LOG_TYPE_DEFAULT, "No mailbox found. #LOAD_MORE_MESSAGES request will be ignored. Id: %{public}@", (uint8_t *)&v24, 0xCu);

    }
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesForConversation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v8)&& -[NNMKDeviceSyncRegistry organizeByThread](self->_pairedDeviceRegistry, "organizeByThread"))
  {
    objc_msgSend(v5, "conversationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1620];
    v11 = objc_opt_class();
    objc_msgSend(v5, "beforeDateReceived");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v9;
      _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "#LOAD_MORE_MESSAGES Requested (Conversation Id: %{public}@)", (uint8_t *)&v16, 0xCu);
    }
    -[NNMKSyncProvider _requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:](self, "_requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:", v13, v9, v8);

  }
  else
  {
    v15 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessagesForConversation:].cold.1(v15);
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestContent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider syncController](self, "syncController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageIdFromWatchMessageId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mailboxId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKSyncProvider syncController](self, "syncController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailboxWithId:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", objc_msgSend(v5, "fullSyncVersion"), v12))
  {
    -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_msgSend(v5, "highPriority") & 1) != 0 || (objc_msgSend(v13, "contentSynced") & 1) == 0)
      {
        v17 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = 138543618;
          v20 = v8;
          v21 = 1024;
          v22 = objc_msgSend(v5, "highPriority");
          _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Message Content Requested (Id: %{public}@, High Priority: %d).", (uint8_t *)&v19, 0x12u);

        }
        if (objc_msgSend(v5, "highPriority") && (objc_msgSend(v13, "contentRequestedByUser") & 1) == 0)
        {
          objc_msgSend(v13, "setContentRequestedByUser:", 1);
          -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v13);
        }
        -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v8, objc_msgSend(v5, "highPriority"));
      }
      else
      {
        v14 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          v19 = 138543618;
          v20 = v8;
          v21 = 1024;
          v22 = objc_msgSend(v5, "highPriority");
          _os_log_impl(&dword_22E161000, v15, OS_LOG_TYPE_DEFAULT, "Message Content Requested but not processed, as it has been requested multiple times (Id: %{public}@, High Priority: %d).", (uint8_t *)&v19, 0x12u);

        }
      }
    }

  }
  else
  {
    v16 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543874;
      v20 = v10;
      v21 = 1024;
      v22 = v12 != 0;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_22E161000, v16, OS_LOG_TYPE_ERROR, "Ignoring did request content. Mailbox %{public}@ (exists: %d), messageId: %{public}@", (uint8_t *)&v19, 0x1Cu);
    }
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFullSync:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_pairedDeviceRegistry)
  {
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:](self, "_fastForwardToFullSyncVersion:", objc_msgSend(v7, "fullSyncVersion"));
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v13 = 134217984;
      v14 = objc_msgSend(v8, "fullSyncVersion");
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "#full-sync requested (Version in Client: %lu). Triggering #initial-sync...", (uint8_t *)&v13, 0xCu);

    }
    -[NNMKSyncProvider _triggerInitialSync](self, "_triggerInitialSync");
  }
  else
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = 134217984;
      v14 = objc_msgSend(v8, "fullSyncVersion");
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "#full-sync requested, but we haven't detected any pairing yet. Ignoring the #full-sync request and waiting... (Version in Client: %lu)", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didRequestHaltSync:(id)a4
{
  id v6;
  id v7;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  v9 = (void *)qword_253E87A90;
  v10 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
  if (pairedDeviceRegistry)
  {
    if (v10)
    {
      v11 = v9;
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v7, "fullSyncVersion");
      _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "halt-sync requested (Version in Client: %lu). Triggering...", buf, 0xCu);

    }
    objc_msgSend(v7, "mailboxId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NNMKSyncProvider syncController](self, "syncController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mailboxId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mailboxWithId:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NNMKSyncProvider _handleHaltSyncForMailbox:](self, "_handleHaltSyncForMailbox:", v15);
      }
      else
      {
        v21 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          objc_msgSend(v7, "mailboxId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = (unint64_t)v23;
          _os_log_impl(&dword_22E161000, v22, OS_LOG_TYPE_DEFAULT, "halt-sync requested for unknown mailbox %{public}@", buf, 0xCu);

        }
      }
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[NNMKDeviceSyncRegistry activeMailboxes](self->_pairedDeviceRegistry, "activeMailboxes", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v15);
            -[NNMKSyncProvider _handleHaltSyncForMailbox:](self, "_handleHaltSyncForMailbox:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          }
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v18);
      }
    }

  }
  else if (v10)
  {
    v16 = v9;
    *(_DWORD *)buf = 134217984;
    v30 = objc_msgSend(v7, "fullSyncVersion");
    _os_log_impl(&dword_22E161000, v16, OS_LOG_TYPE_DEFAULT, "halt-sync requested, but we haven't detected any pairing yet. Ignoring the halt sync request and waiting... (Version in Client: %lu)", buf, 0xCu);

  }
}

- (void)_handleHaltSyncForMailbox:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "syncEnabled") && (objc_msgSend(v4, "syncActive") & 1) == 0)
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v4, "mailboxId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring halt-sync request. Mailbox is not active. (Mailbox Id: %{public}@)", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    v5 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "mailboxId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "halt-sync started for mailbox. (Mailbox id: %{public}@)", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v4, "setSyncActive:", 0);
    -[NNMKDeviceSyncRegistry updateSyncActiveForMailbox:](self->_pairedDeviceRegistry, "updateSyncActiveForMailbox:", v4);
    -[NNMKDeviceSyncRegistry cleanUpForFullSyncWithMailbox:](self->_pairedDeviceRegistry, "cleanUpForFullSyncWithMailbox:", v4);
  }

}

- (void)fetchesSyncServiceServer:(id)a3 didNotifyInitialSyncFinished:(id)a4
{
  id v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  unint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTrackingInitialSync"))
  {
    v7 = objc_msgSend(v5, "fullSyncVersion");
    v8 = -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion");

    if (v8 == v7)
    {
      -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syncCompleted");

      goto LABEL_7;
    }
  }
  else
  {

  }
  v10 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isTrackingInitialSync");
    v14 = -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion");
    v15[0] = 67109376;
    v15[1] = v13;
    v16 = 2048;
    v17 = v14;
    _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "#initial-sync finished notification received. However, we're no longer waiting for it. Ignoring... (Tracking: %d - Current #sync-version: %lu)", (uint8_t *)v15, 0x12u);

  }
LABEL_7:

}

- (void)fetchesSyncServiceServer:(id)a3 didNotifyAboutWebKitStatus:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a4, "supportsWebKit", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry setSupportsWebKit:](self->_pairedDeviceRegistry, "setSupportsWebKit:", v5);

}

- (void)syncStateManagerDidUnpair:(id)a3
{
  NSObject *providerQueue;
  _QWORD block[5];

  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NNMKSyncProvider_syncStateManagerDidUnpair___block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __46__NNMKSyncProvider_syncStateManagerDidUnpair___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Unpairing detected. Triggering verification to insure we don't stop sync'ing if we still have another device we're talking to...", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_verifyPairingForcingSync:", 0);
}

- (void)syncStateManagerDidChangePairedDevice:(id)a3
{
  NSObject *providerQueue;
  _QWORD block[5];

  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NNMKSyncProvider_syncStateManagerDidChangePairedDevice___block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __58__NNMKSyncProvider_syncStateManagerDidChangePairedDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Paired device changed. Handling as unpaired...", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleDidUnpair");
  return objc_msgSend(*(id *)(a1 + 32), "_verifyPairingForcingSync:", 0);
}

- (void)syncStateManagerDidBeginSyncSession:(id)a3 syncSessionType:(id)a4 syncSessionIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *providerQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__NNMKSyncProvider_syncStateManagerDidBeginSyncSession_syncSessionType_syncSessionIdentifier___block_invoke;
  block[3] = &unk_24F9F6718;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(providerQueue, block);

}

void __94__NNMKSyncProvider_syncStateManagerDidBeginSyncSession_syncSessionType_syncSessionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "pairedDeviceRegistryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = qword_253E87A90;
  v4 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New session began, but we're already paired. (Type: %{public}@, Session ID: %{public}@). Responding with success...", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTrackingInitialSync");

    objc_msgSend(*(id *)(a1 + 32), "initialSyncProgressTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncCompleted");

  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New session began, requesting #initial-sync (Type: %{public}@, Session ID: %{public}@). Triggering #initial-sync...", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleDidPairWithNewDevice");
  }

}

- (void)syncStateManagerDidInvalidateSyncSession:(id)a3 syncSessionIdentifier:(id)a4
{
  id v5;
  NSObject *providerQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  NNMKSyncProvider *v10;

  v5 = a4;
  providerQueue = self->_providerQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__NNMKSyncProvider_syncStateManagerDidInvalidateSyncSession_syncSessionIdentifier___block_invoke;
  v8[3] = &unk_24F9F6298;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(providerQueue, v8);

}

uint64_t __83__NNMKSyncProvider_syncStateManagerDidInvalidateSyncSession_syncSessionIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_22E161000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Session invalidate. Invalidating #full-sync (Session ID: %{public}@). We'll verify if everything seems alright...", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_verifyPairingForcingSync:", 0);
}

- (BOOL)syncStateManagerShouldAddFavoriteSubsectionForMailboxId:(id)a3
{
  void *v3;
  BOOL v4;

  -[NNMKDeviceSyncRegistry mailboxWithId:](self->_pairedDeviceRegistry, "mailboxWithId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") != 1;

  return v4;
}

- (void)_handleDidPairWithNewDevice
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v3 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New Pairing Detected. Will trigger #initial-sync.", buf, 2u);
  }
  if (-[NNMKSyncProvider setupPairedDeviceRegistry](self, "setupPairedDeviceRegistry"))
  {
    -[NNMKSyncProvider _triggerInitialSyncTrackingProgress:](self, "_triggerInitialSyncTrackingProgress:", 1);
    -[NNMKSyncProvider _storeScreenRelatedValues](self, "_storeScreenRelatedValues");
  }
  else
  {
    v4 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE No device registry path found. Unpairing...", v5, 2u);
    }
    -[NNMKSyncProvider _handleDidUnpair](self, "_handleDidUnpair");
  }
}

- (BOOL)setupPairedDeviceRegistry
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NNMKDeviceSyncRegistry *v7;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v9;
  void *v10;

  -[NNMKSyncStateManager pairingStorePath](self->_syncStateManager, "pairingStorePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("NanoMail/registry.sqlite"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    if (v5)
    {
      v7 = -[NNMKDeviceSyncRegistry initWithPath:]([NNMKDeviceSyncRegistry alloc], "initWithPath:", v5);
      pairedDeviceRegistry = self->_pairedDeviceRegistry;
      self->_pairedDeviceRegistry = v7;

      -[NNMKDeviceSyncRegistry setOrganizeByThread:](self->_pairedDeviceRegistry, "setOrganizeByThread:", 1);
      -[NNMKDirectoryProvider setPairedDeviceRegistryPath:](self->_directoryProvider, "setPairedDeviceRegistryPath:", v5);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider setupPairedDeviceRegistry].cold.1();
    -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTrackingInitialSync");

    -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncFailedWithError:", CFSTR("PairedDeviceRegistry returned no devices."));

    v6 = 0;
  }

  return v6;
}

- (void)_handleDidUnpair
{
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  self->_pairedDeviceRegistry = 0;

  -[NNMKDirectoryProvider setPairedDeviceRegistryPath:](self->_directoryProvider, "setPairedDeviceRegistryPath:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[NNMKSyncProvider sessionController](self, "sessionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageIdsToIgnoreStatusUpdates:", v4);

  -[NNMKSyncProvider sessionController](self, "sessionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationPayloadAcks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[NNMKSyncProvider _requestDelegateToStopDownloadingAllMessageElements](self, "_requestDelegateToStopDownloadingAllMessageElements");
  -[NNMKBatchRequestHandler cancelFetchTimeout](self->_batchRequestHandler, "cancelFetchTimeout");
  -[NNMKBatchRequestHandler reset](self->_batchRequestHandler, "reset");
}

- (void)_storeScreenRelatedValues
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  id v9;

  -[NNMKSyncStateManager pairedDeviceScreenSize](self->_syncStateManager, "pairedDeviceScreenSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v3)
    objc_msgSend(v3, "CGSizeValue");
  else
    v4 = 200.0;
  -[NNMKDeviceSyncRegistry setDeviceScreenWidth:](self->_pairedDeviceRegistry, "setDeviceScreenWidth:", v4);
  -[NNMKSyncStateManager pairedDeviceScreenScale](self->_syncStateManager, "pairedDeviceScreenScale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 2.0;
  }
  -[NNMKDeviceSyncRegistry setDeviceScreenScale:](self->_pairedDeviceRegistry, "setDeviceScreenScale:", v8);
  -[NNMKDeviceSyncRegistry setProtectedContentChannelSupported:](self->_pairedDeviceRegistry, "setProtectedContentChannelSupported:", -[NNMKSyncStateManager pairedDeviceSupportsMailContentProtectedChannel](self->_syncStateManager, "pairedDeviceSupportsMailContentProtectedChannel"));

}

- (void)resendScheduler:(id)a3 didRequestRetryFullSyncForMailboxes:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to retry.", v7, 2u);
  }
  -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v5);

}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMailboxSelectionWithResendInterval:(unint64_t)a4
{
  -[NNMKSyncProvider _sendUpdatedMailboxSelection:resendInterval:](self, "_sendUpdatedMailboxSelection:resendInterval:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion", a3), a4);
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageWithIds:(id)a4
{
  -[NNMKSyncProvider _requestDelegateForResendingMessagesWithIds:](self, "_requestDelegateForResendingMessagesWithIds:", a4);
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageDeletions:(id)a4 deletionsMessageIds:(id)a5 resendInterval:(unint64_t)a6
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = v8;
  objc_msgSend(v8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v35;
    *(_QWORD *)&v11 = 138543362;
    v30 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NNMKDeviceSyncRegistry mailboxWithId:](self->_pairedDeviceRegistry, "mailboxWithId:", v15, v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v33, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
          v18 = (void *)MEMORY[0x24BDD1618];
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setDateSynced:", v20);

          objc_msgSend(v16, "mailboxId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setMailboxId:", v21);

          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          objc_msgSend(v16, "mailboxId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setMailboxSyncVersion:", -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](pairedDeviceRegistry, "syncVersionForMailboxId:", v23));

          -[NNMKMessagesSyncServiceServer deleteMessages:notificationPriority:](self->_messagesSyncService, "deleteMessages:notificationPriority:", v17, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "registerIDSIdentifier:objectIds:type:resendInterval:", v24, v9, CFSTR("Message"), a6);

          v26 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            objc_msgSend(v9, "nnmk_description");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v39 = v24;
            v40 = 2114;
            v41 = v28;
            _os_log_impl(&dword_22E161000, v27, OS_LOG_TYPE_DEFAULT, "Retrying sending message deletions. (IDS Identifier: %{public}@, deletions: %{public}@)", buf, 0x16u);

          }
        }
        else
        {
          v29 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v39 = v15;
            _os_log_impl(&dword_22E161000, v29, OS_LOG_TYPE_DEFAULT, "Mailbox does not exist anymore. Ignoring resend deletion. %{public}@", buf, 0xCu);
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v12);
  }

}

- (void)resendScheduler:(id)a3 didRequestRetrySendingContentForMessageId:(id)a4 highPriority:(BOOL)a5
{
  -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", a4, a5);
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountWithId:(id)a4
{
  -[NNMKSyncProvider _requestDelegateForResendingAccountWithId:](self, "_requestDelegateForResendingAccountWithId:", a4);
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountIdentifier:(id)a4 resendInterval:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  -[NNMKSyncProvider sessionController](self, "sessionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncingAccountIdentityByUsername");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NNMKSyncProvider _sendStandaloneAccountIdentity:resendInterval:](self, "_sendStandaloneAccountIdentity:resendInterval:", v10, a5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider resendScheduler:didRequestRetrySendingAccountIdentifier:resendInterval:].cold.1();
    -[NNMKSyncProvider pairedDeviceRegistry](self, "pairedDeviceRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountIdForUsername:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKSyncProvider sessionController](self, "sessionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateStandaloneState:forAccountId:", 0, v12);

  }
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingVIPListWithResendInterval:(unint64_t)a4
{
  NNMKRequestContext *v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(NNMKRequestContext);
  -[NNMKRequestContext setResendInterval:](v6, "setResendInterval:", a4);
  v7 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "Requesting VIP List to retry. Resend Interval: %lu", (uint8_t *)&v8, 0xCu);
  }
  -[NNMKSyncProvider _requestDelegateForVIPList:](self, "_requestDelegateForVIPList:", v6);

}

- (void)resendScheduler:(id)a3 didRequestRetrySendingDeletionForAccountWithId:(id)a4 resendInterval:(unint64_t)a5
{
  id v7;
  NNMKProtoAccountDeletion *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = objc_alloc_init(NNMKProtoAccountDeletion);
  -[NNMKProtoAccountDeletion setAccountId:](v8, "setAccountId:", v7);
  -[NNMKAccountsSyncServiceServer deleteAccount:](self->_accountsSyncService, "deleteAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerIDSIdentifier:objectIds:type:resendInterval:", v9, v11, CFSTR("Account"), a5);

  v12 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "Retrying sending deletion for account. (IDS Identifier: %{public}@)", (uint8_t *)&v13, 0xCu);
  }

}

- (void)resendScheduler:(id)a3 didRequestRetrySendingComposeMessageProgress:(int64_t)a4 messageId:(id)a5 resendInterval:(unint64_t)a6
{
  id v9;
  NNMKProtoComposedMessageSendingProgressReport *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = objc_alloc_init(NNMKProtoComposedMessageSendingProgressReport);
  -[NNMKProtoComposedMessageSendingProgressReport setComposedMessageId:](v10, "setComposedMessageId:", v9);
  -[NNMKProtoComposedMessageSendingProgressReport setProgress:](v10, "setProgress:", a4);
  -[NNMKFetchesSyncServiceServer reportComposedMessageSendingProgress:](self->_fetchesSyncService, "reportComposedMessageSendingProgress:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerIDSIdentifier:objectIds:type:resendInterval:", v11, v13, CFSTR("SendingProgress"), a6);

  if (a4 == -1)
  {
    v14 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "Failing composed message, as we restarted before even adding the message to the Outbox queue. (Composed Message Id: %{public}@ - IDS Identifier: %{public}@).", (uint8_t *)&v16, 0x16u);
    }
  }
  v15 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_22E161000, v15, OS_LOG_TYPE_DEFAULT, "Retrying sending compose message progress. (IDS Identifier: %{public}@)", (uint8_t *)&v16, 0xCu);
  }

}

- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifierForResend:(id)a4 date:(id)a5 silent:(BOOL)a6
{
  -[NNMKSyncEndpoint enqueueIDSIdentifierForResend:atDate:silent:](self, "enqueueIDSIdentifierForResend:atDate:silent:", a4, a5, a6);
}

- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifiersForResend:(id)a4
{
  -[NNMKSyncEndpoint enqueueIDSIdentifiersForResend:](self, "enqueueIDSIdentifiersForResend:", a4);
}

- (void)resendScheduler:(id)a3 didRequestDequeueIDSIdentifierForResend:(id)a4
{
  -[NNMKSyncEndpoint dequeueIDSIdentifierForResend:](self, "dequeueIDSIdentifierForResend:", a4);
}

- (unint64_t)resendScheduler:(id)a3 didRequestNewResendIntervalForPreviousResendInterval:(unint64_t)a4 errorCode:(int64_t)a5
{
  return -[NNMKSyncEndpoint newResendIntervalForPreviousResendInterval:errorCode:](self, "newResendIntervalForPreviousResendInterval:errorCode:", a4, a5);
}

- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3 mailbox:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "syncActive") & 1) != 0)
  {
    v8 = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", a3);
  }
  else
  {
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:](self, "_fastForwardToFullSyncVersion:", a3);
    v9 = (void *)qword_253E87A90;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "mailboxId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Message received but sync isn't active. (Mailbox id: %{public}@) Discarding...", (uint8_t *)&v13, 0xCu);

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  _BOOL4 fullSyncRecoveredInThisSession;
  NSObject *v9;
  _BOOL4 v10;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  int v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion");
  v6 = v5;
  if (v5 <= a3)
  {
    if (v5 >= a3)
      goto LABEL_15;
    v12 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      v16 = v12;
      v18 = 134218496;
      v19 = a3;
      v20 = 2048;
      v21 = v6;
      v22 = 2048;
      v23 = -[NNMKSyncProvider _isPaired](self, "_isPaired");
      _os_log_error_impl(&dword_22E161000, v16, OS_LOG_TYPE_ERROR, "Client has a #sync-version higher than what the server has (Version in Client: %lu - Local: %lu - Paired: %lu). Triggering #initial-sync...", (uint8_t *)&v18, 0x20u);

    }
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:](self, "_fastForwardToFullSyncVersion:", a3);
    -[NNMKSyncProvider _triggerInitialSyncToRecoverFromSyncVersionMismatch](self, "_triggerInitialSyncToRecoverFromSyncVersionMismatch");
    +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportFullSyncRequestedFromDevice:corruptionDetected:migrationRelated:idsFailureRelated:fullSyncVersionMatchRelated:", 1, 0, 0, 0, 1);

    v14 = -[NNMKSyncProvider _isPaired](self, "_isPaired");
    LOBYTE(v10) = 0;
    if (v14)
LABEL_15:
      LOBYTE(v10) = 1;
  }
  else
  {
    if ((int)a3 - (int)v5 >= 0)
      v7 = a3 - v5;
    else
      v7 = v5 - a3;
    fullSyncRecoveredInThisSession = self->_fullSyncRecoveredInThisSession;
    v9 = qword_253E87A90;
    v10 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
    if (!fullSyncRecoveredInThisSession && v7 >= 3)
    {
      if (v10)
      {
        v18 = 134218240;
        v19 = v6;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Received message that has a #sync-version so distant from the local one that we're triggering a #initial-sync. (Local: %lu - Client: %lu).", (uint8_t *)&v18, 0x16u);
      }
      self->_fullSyncRecoveredInThisSession = 1;
      -[NNMKSyncProvider _triggerInitialSyncToRecoverFromSyncVersionMismatch](self, "_triggerInitialSyncToRecoverFromSyncVersionMismatch");
      +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reportFullSyncRequestedFromDevice:corruptionDetected:migrationRelated:idsFailureRelated:fullSyncVersionMatchRelated:", 1, 0, 0, 0, 1);

      goto LABEL_19;
    }
    if (v10)
    {
      v18 = 134218240;
      v19 = v6;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Message discarded because #sync-version is different (Local: %lu - Client: %lu).", (uint8_t *)&v18, 0x16u);
LABEL_19:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (void)_addMessages:(id)a3 messagesAreNew:(BOOL)a4 mailbox:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NNMKMessagesSyncServiceServer *messagesSyncService;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v25;
  void *v26;
  uint64_t v27;
  NNMKMessagesSyncServiceServer *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  NNMKProtoOldMessagesAvailableNotification *v51;
  void *v52;
  NSObject *log;
  NSObject *loga;
  void *v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v6 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v8;
  objc_msgSend(v10, "addMessages:containsNewMessages:mailbox:", v8, v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "protoMessagesWithNotificationPriority");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "messageAdditionsCount");

  if (v13)
  {
    messagesSyncService = self->_messagesSyncService;
    objc_msgSend(v11, "protoMessagesWithNotificationPriority");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMessagesSyncServiceServer addMessages:notificationPriority:](messagesSyncService, "addMessages:notificationPriority:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageIdsWithNotificationPriority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerIDSIdentifier:objectIds:type:resendInterval:", v16, v18, CFSTR("Message"), 0);

    objc_msgSend(v11, "messageIdsWithNotificationPriority");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider _requestDelegateForContentForMessageIds:highPriority:](self, "_requestDelegateForContentForMessageIds:highPriority:", v19, 1);

    v20 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      log = v20;
      objc_msgSend(v11, "protoMessagesWithNotificationPriority");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v6;
      v6 = objc_msgSend(v21, "messageAdditionsCount");
      objc_msgSend(v9, "mailboxId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      pairedDeviceRegistry = self->_pairedDeviceRegistry;
      objc_msgSend(v9, "mailboxId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v57 = v6;
      LODWORD(v6) = v22;
      v58 = 2114;
      v59 = v16;
      v60 = 2114;
      v61 = v23;
      v62 = 2048;
      v63 = -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](pairedDeviceRegistry, "syncVersionForMailboxId:", v25);
      _os_log_impl(&dword_22E161000, log, OS_LOG_TYPE_DEFAULT, "Messages sent with URGENT priority. (Count: %lu - IDS Identifier: %{public}@ - Mailbox: %{public}@ - #mailbox-sync-version: %lu).", buf, 0x2Au);

    }
  }
  objc_msgSend(v11, "protoMessagesWithDefaultPriority");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "messageAdditionsCount");

  if (v27)
  {
    v28 = self->_messagesSyncService;
    objc_msgSend(v11, "protoMessagesWithDefaultPriority");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMessagesSyncServiceServer addMessages:notificationPriority:](v28, "addMessages:notificationPriority:", v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageIdsWithDefaultPriority");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "registerIDSIdentifier:objectIds:type:resendInterval:", v30, v32, CFSTR("Message"), 0);

    objc_msgSend(v11, "messageIdsWithDefaultPriority");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((_DWORD)v6)
    {
      v35 = objc_msgSend(v33, "count");

      if (v35)
      {
        v36 = 1;
        do
        {
          objc_msgSend(v11, "messageIdsWithDefaultPriority");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v36 - 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v38, 0);
          objc_msgSend(v11, "messageIdsWithDefaultPriority");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v36 >= v40)
            break;
        }
        while (v36++ < 0xA);
      }
    }
    else
    {
      -[NNMKSyncProvider _requestDelegateForContentForMessageIds:highPriority:](self, "_requestDelegateForContentForMessageIds:highPriority:", v33, 0);

    }
    v42 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      loga = v42;
      objc_msgSend(v11, "protoMessagesWithDefaultPriority");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "messageAdditionsCount");
      objc_msgSend(v9, "mailboxId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncProvider currentDeviceRegistry](self, "currentDeviceRegistry");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxId");
      v47 = v9;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v46, "syncVersionForMailboxId:", v48);
      *(_DWORD *)buf = 134218754;
      v57 = v44;
      v58 = 2114;
      v59 = v30;
      v60 = 2114;
      v61 = v45;
      v62 = 2048;
      v63 = v49;
      _os_log_impl(&dword_22E161000, loga, OS_LOG_TYPE_DEFAULT, "Messages sent with DEFAULT priority. (Count: %lu - IDS Identifier: %{public}@ - Mailbox: %{public}@ - #mailbox-sync-version: %lu).", buf, 0x2Au);

      v9 = v47;
    }

  }
  if (objc_msgSend(v11, "receivedOldMessages"))
  {
    v50 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v50, OS_LOG_TYPE_DEFAULT, "Old messages are available for fetching. Sending notification to client...", buf, 2u);
    }
    v51 = objc_alloc_init(NNMKProtoOldMessagesAvailableNotification);
    -[NNMKProtoOldMessagesAvailableNotification setFullSyncVersion:](v51, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
    objc_msgSend(v9, "mailboxId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoOldMessagesAvailableNotification setMailboxId:](v51, "setMailboxId:", v52);

    -[NNMKFetchesSyncServiceServer notifyOldMessagesAvailable:](self->_fetchesSyncService, "notifyOldMessagesAvailable:", v51);
  }

}

- (void)_markConversationWithId:(id)a3 forState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NNMKMessagesSyncServiceServer *messagesSyncService;
  void *v16;
  void *v17;
  NNMKMessagesSyncServiceServer *v18;
  void *v19;
  void *v20;
  NNMKProtectedSyncServiceServer *protectedSyncService;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateMessagesFromConversation:withState:include:mailbox:", v11, a4, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__NNMKSyncProvider__markConversationWithId_forState_include_mailbox___block_invoke;
  v27[3] = &unk_24F9F6F10;
  v27[4] = self;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E327EE4](v27);
  messagesSyncService = self->_messagesSyncService;
  objc_msgSend(v13, "protoMessageUpdatesWithNotificationPriority");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageIdsWithNotificationPriority");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v14)[2](v14, messagesSyncService, v16, v17, 1);

  v18 = self->_messagesSyncService;
  objc_msgSend(v13, "protoMessageUpdatesWithDefaultPriority");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageIdsWithDefaultPriority");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NNMKMessagesSyncServiceServer *, void *, void *, _QWORD))v14)[2](v14, v18, v19, v20, 0);

  protectedSyncService = self->_protectedSyncService;
  objc_msgSend(v13, "protoMessageUpdatesWithDefaultPriorityAndProtectedChannel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageIdsWithDefaultPriorityAndProtectedChannel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NNMKProtectedSyncServiceServer *, void *, void *, _QWORD))v14)[2](v14, protectedSyncService, v22, v23, 0);

  objc_msgSend(v13, "messageIdsToDelete");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(v13, "messageIdsToDelete");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider deleteMessagesWithIds:](self, "deleteMessagesWithIds:", v26);

  }
}

void __69__NNMKSyncProvider__markConversationWithId_forState_include_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "messageStatusUpdatesCount"))
  {
    objc_msgSend(v13, "updateMessagesStatus:notificationPriority:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resendScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerIDSIdentifier:objectIds:type:resendInterval:", v11, v10, CFSTR("Message"), 0);

  }
}

- (id)_bbSubsectionIdsForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v3, "accountId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "checkState:", 64))
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.mobilemail.bulletin-subsection.VIP"));
  if (objc_msgSend(v3, "checkState:", 128))
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.mobilemail.bulletin-subsection.ThreadNotify"));

  return v6;
}

- (void)syncStateManager:(id)a3 handleForwardForNotification:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *providerQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__NNMKSyncProvider_syncStateManager_handleForwardForNotification_completion___block_invoke;
  block[3] = &unk_24F9F70C8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(providerQueue, block);

}

uint64_t __77__NNMKSyncProvider_syncStateManager_handleForwardForNotification_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldHandleForwardForNotification:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_shouldHandleForwardForNotification:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.mail.nanoMessageId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v7)
    {
      -[NNMKSyncProvider pairedDeviceRegistry](self, "pairedDeviceRegistry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "syncedMessageForMessageWithId:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[NNMKSyncProvider pairedDeviceRegistry](self, "pairedDeviceRegistry");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mailboxId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mailboxWithId:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "accountId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "content");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("com.apple.mail.accountReference"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[NNMKSyncProvider pairedDeviceRegistry](self, "pairedDeviceRegistry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "syncedAccountForAccountWithId:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "sourceType"))
      {
        v23 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          objc_msgSend(v22, "accountId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543618;
          v39 = v11;
          v40 = 2114;
          v41 = v25;
          _os_log_impl(&dword_22E161000, v24, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Suppressing notification for message because account is in standalone mode. Message Id: %{public}@ - Account Id: %{public}@", (uint8_t *)&v38, 0x16u);

        }
        v7[2](v7, 0);
      }
      else
      {
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        if (pairedDeviceRegistry
          && (-[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](pairedDeviceRegistry, "syncedMessageForMessageWithId:", v11), (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v28 = v27;
          if (objc_msgSend(v27, "contentSyncedUsingNotificationPriority"))
          {
            v29 = qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v38 = 138543362;
              v39 = v11;
              _os_log_impl(&dword_22E161000, v29, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but we already sync'ed the content through the high priority channel for this message. Notifying back... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
            }
            v7[2](v7, 1);
          }
          else
          {
            v33 = objc_msgSend(v28, "usedNotificationPriorityForMessageSync");
            v34 = qword_253E87A90;
            if ((v33 & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
              {
                v38 = 138543362;
                v39 = v11;
                _os_log_impl(&dword_22E161000, v34, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message. We already have the message. Waiting for the content... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
                -[NNMKSyncProvider _shouldHandleForwardForNotification:withCompletion:].cold.2();
              objc_msgSend(v28, "setUsedNotificationPriorityForMessageSync:", 1);
              if (objc_msgSend(v28, "contentSynced"))
              {
                objc_msgSend(v28, "setContentSyncedBecauseUserRequested:", 0);
                objc_msgSend(v28, "setContentSynced:", 0);
                -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v11, 1);
              }
              -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v28);
            }
            v35 = (void *)MEMORY[0x22E327EE4](v7);
            -[NNMKSyncProvider sessionController](self, "sessionController");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "notificationPayloadAcks");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, v11);

          }
        }
        else
        {
          v30 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v38 = 138543362;
            v39 = v11;
            _os_log_impl(&dword_22E161000, v30, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message. Waiting... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
          }
          v28 = (void *)MEMORY[0x22E327EE4](v7);
          -[NNMKSyncProvider sessionController](self, "sessionController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "notificationPayloadAcks");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v28, v11);

        }
      }

    }
    else
    {
      v18 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
      {
        v38 = 138543362;
        v39 = v11;
        _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_INFO, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but the ack handler was NULL. Ignoring... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncProvider _shouldHandleForwardForNotification:withCompletion:].cold.1();
    v7[2](v7, 1);
  }

}

- (void)_fastForwardToFullSyncVersion:(unint64_t)a3
{
  NNMKDeviceSyncRegistry *pairedDeviceRegistry;
  __int128 v6;
  void *v7;
  NNMKDeviceSyncRegistry *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
  {
    if (-[NNMKDeviceSyncRegistry fullSyncVersion](pairedDeviceRegistry, "fullSyncVersion") < a3)
    {
      *(_QWORD *)&v6 = 134218240;
      v11 = v6;
      do
      {
        v7 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v8 = self->_pairedDeviceRegistry;
          v9 = v7;
          v10 = -[NNMKDeviceSyncRegistry fullSyncVersion](v8, "fullSyncVersion");
          *(_DWORD *)buf = v11;
          v13 = a3 + 1;
          v14 = 2048;
          v15 = v10;
          _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Fast forwarding #sync-version (To: %lu - Current: %lu).", buf, 0x16u);

        }
        -[NNMKDeviceSyncRegistry setFullSyncVersion:](self->_pairedDeviceRegistry, "setFullSyncVersion:", a3, v11);
        -[NNMKDeviceSyncRegistry cleanUpForInitialSync](self->_pairedDeviceRegistry, "cleanUpForInitialSync");
      }
      while (-[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion") < a3);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:].cold.1();
  }
}

- (void)_stopTaks
{
  void *v3;
  void *v4;

  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_messagesSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_contentSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_protectedSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_protectedContentSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_fetchesSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncServiceEndpoint resetRepeatPreventionHistory](self->_accountsSyncService, "resetRepeatPreventionHistory");
  -[NNMKSyncProvider sessionController](self, "sessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationPayloadAcks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[NNMKSyncProvider _requestDelegateToStopDownloadingAllMessageElements](self, "_requestDelegateToStopDownloadingAllMessageElements");
}

- (BOOL)isMessageOkForSyncedMailboxes:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NNMKSyncProvider_isMessageOkForSyncedMailboxes___block_invoke;
  block[3] = &unk_24F9F69D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(providerQueue, block);
  LOBYTE(providerQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)providerQueue;
}

void __50__NNMKSyncProvider_isMessageOkForSyncedMailboxes___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "syncController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "doesMessageBelongToSyncedMailboxes:", *(_QWORD *)(a1 + 40));

}

- (id)_messageProtobufForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NNMKSyncProvider persistenceHandler](self, "persistenceHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protoMessageFromMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __59__NNMKSyncProvider__checkConnectivityBasedSuspensionTimer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "disconnectedSince");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isMessagesSyncSuspendedByConnectivity");

    if ((v4 & 1) == 0)
    {
      v5 = (void *)MEMORY[0x24BDBCE60];
      v6 = *(double *)&kIntervalBeforeSuspendingDueToLackOfConnectivity;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "disconnectedSince");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateWithTimeInterval:sinceDate:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", v8);

      if (v10 != -1)
      {
        v11 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "Suspending sync due to lack of connectivity...", v13, 2u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setIsMessagesSyncSuspendedByConnectivity:", 1);
        +[NNMKAnalytics sharedInstance](NNMKAnalytics, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reportHaltSyncRequestedFromSource:", 0);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cleanUpForInitialSync");
        objc_msgSend(*(id *)(a1 + 32), "_stopTaks");
      }

    }
  }
}

- (void)batchRequestHandlerDidTimeoutFetchRequest:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "#FETCH #BATCHED_RESPONSE timed out. It will check if headers are available to respond back.", v5, 2u);
  }
  -[NNMKSyncProvider _checkBatchFetchedMessages](self, "_checkBatchFetchedMessages");
}

- (void)_checkBatchFetchedMessages
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NNMKMessagesSyncServiceServer *messagesSyncService;
  NNMKProtoCoalescedBatchedFetchResult *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[NNMKSyncProvider batchRequestHandler](self, "batchRequestHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkBatchFetchedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v47 = v4;
    objc_msgSend(v4, "fetchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            v14 = v12;
            objc_msgSend(v13, "mailboxId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = (uint64_t)v15;
            _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "Responding for #FETCH #BATCHED_RESPONSE request. (Mailbox id: %{public}@)", buf, 0xCu);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v9);
    }

    v4 = v47;
    objc_msgSend(v47, "fetchResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 == 1)
    {
      messagesSyncService = self->_messagesSyncService;
      objc_msgSend(v47, "fetchResults");
      v19 = (NNMKProtoCoalescedBatchedFetchResult *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoCoalescedBatchedFetchResult firstObject](v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NNMKMessagesSyncServiceServer sendBatchedFetchResult:](messagesSyncService, "sendBatchedFetchResult:", v20);

    }
    else
    {
      v19 = objc_alloc_init(NNMKProtoCoalescedBatchedFetchResult);
      objc_msgSend(v47, "fetchResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");
      -[NNMKProtoCoalescedBatchedFetchResult setFetchResults:](v19, "setFetchResults:", v23);

      v24 = -[NNMKMessagesSyncServiceServer sendCoalescedBatchedFetchResult:](self->_messagesSyncService, "sendCoalescedBatchedFetchResult:", v19);
    }

    -[NNMKDeviceSyncRegistry beginUpdates](self->_pairedDeviceRegistry, "beginUpdates");
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v47, "messageIdsForRequestingContentDownload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v49 != v28)
            objc_enumerationMutation(v25);
          -[NNMKDeviceSyncRegistry syncedMessageForMessageWithId:](self->_pairedDeviceRegistry, "syncedMessageForMessageWithId:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setContentRequestedByUser:", 1);
          -[NNMKDeviceSyncRegistry addOrUpdateSyncedMessage:](self->_pairedDeviceRegistry, "addOrUpdateSyncedMessage:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v27);
    }

    -[NNMKDeviceSyncRegistry endUpdates](self->_pairedDeviceRegistry, "endUpdates");
    v31 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      objc_msgSend(v47, "messageIdsForRequestingContentDownload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134217984;
      v58 = v34;
      _os_log_impl(&dword_22E161000, v32, OS_LOG_TYPE_DEFAULT, "Requesting message body for %lu most recent headers for #BATCHED_RESPONSE.", buf, 0xCu);

    }
    objc_msgSend(v47, "messageIdsForRequestingContentDownload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider _requestDelegateForContentForMessageIds:highPriority:](self, "_requestDelegateForContentForMessageIds:highPriority:", v35, 1);

  }
  objc_msgSend(v4, "missingMessageHeaderIds");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    v38 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      objc_msgSend(v4, "missingMessageHeaderIds");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 134217984;
      v58 = v41;
      _os_log_impl(&dword_22E161000, v39, OS_LOG_TYPE_DEFAULT, "Requesting message headers from MobileMail to respond for #BATCHED_RESPONSE. %li", buf, 0xCu);

    }
    objc_msgSend(v4, "missingMessageHeaderIds");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider _requestDelegateForMessagesToSendAsFetchResponseForMessageIds:](self, "_requestDelegateForMessagesToSendAsFetchResponseForMessageIds:", v42);

  }
  objc_msgSend(v4, "mailboxesToTriggerFullSync");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    v45 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v45, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync because we exceeded attempts for requesting missing headers for #BATCHED_RESPONSE.", buf, 2u);
    }
    objc_msgSend(v4, "mailboxesToTriggerFullSync");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncProvider _triggerFullSyncForMailboxes:](self, "_triggerFullSyncForMailboxes:", v46);

  }
}

- (void)_handleDidFailSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[NNMKSyncProvider initialSyncProgressTracker](self, "initialSyncProgressTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncFailedWithError:", CFSTR("IDS failed sending messages."));

  -[NNMKSyncProvider resendScheduler](self, "resendScheduler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleIDSMessageFailedWithId:errorCode:", v6, a4);

}

- (void)_notifyDelegateThatMessagesStatusWereUpdated:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didUpdateMessagesStatus:", self, v5);

}

- (void)_requestDelegateForAccounts
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncProviderDidRequestAccounts:", self);

}

- (void)_requestDelegateForVIPList:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NNMKSyncProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NNMKSyncProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncProvider:didRequestVIPSenderListWithRequestContext:", self, v7);

  }
}

- (void)_requestDelegateForMoreMessagesWithMailbox:(id)a3 beforeDate:(id)a4 messagesForspecialMailboxFilterType:(unint64_t)a5
{
  id v8;
  id v9;
  NNMKRequestContext *v10;
  void *v11;
  id WeakRetained;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(NNMKRequestContext);
  -[NNMKRequestContext setBeforeDate:](v10, "setBeforeDate:", v8);

  -[NNMKRequestContext setCount:](v10, "setCount:", 20);
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKRequestContext setMailboxes:](v10, "setMailboxes:", v11);
  -[NNMKRequestContext setMessagesForSpecialMailbox:](v10, "setMessagesForSpecialMailbox:", a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestMessagesWithContext:", self, v10);

}

- (void)_requestDelegateForMoreMessagesBeforeDateReceived:(id)a3 forConversationWithId:(id)a4 mailbox:(id)a5
{
  id v8;
  id v9;
  id v10;
  NNMKRequestContext *v11;
  void *v12;
  id WeakRetained;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = objc_alloc_init(NNMKRequestContext);
    -[NNMKRequestContext setBeforeDate:](v11, "setBeforeDate:", v8);
    -[NNMKRequestContext setCount:](v11, "setCount:", 20);
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKRequestContext setMailboxes:](v11, "setMailboxes:", v12);

    -[NNMKRequestContext setConversationId:](v11, "setConversationId:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncProvider:didRequestMessagesWithContext:", self, v11);

  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:].cold.1();
  }

}

- (void)_requestDelegateForFirstMessagesForMailboxes:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncProvider _requestDelegateForFirstMessagesForMailboxes:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestFirstMessages:mailboxes:", self, 20, v4);

}

- (void)_requestDelegateForContentForMessageIds:(id)a3 highPriority:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138543362;
    v14 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          v20 = v12;
          _os_log_debug_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEBUG, "Requesting content for message: %{public}@.", buf, 0xCu);
        }
        -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v12, v4, v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }

}

- (void)_requestDelegateForContentForMessageWithId:(id)a3 highPriority:(BOOL)a4
{
  _BOOL8 v4;
  NNMKSyncProviderDelegate **p_delegate;
  id v7;
  id WeakRetained;

  v4 = a4;
  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestContentForMessageWithId:highPriority:", self, v7, v4);

}

- (void)_requestDelegateToStopDownloadingMessageElementsForMessageWithId:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestStopDownloadingMessageElementsForMessageWithId:", self, v5);

}

- (void)_requestDelegateToStopDownloadingAllMessageElements
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncProviderDidRequestStopDownloadingAllMessageElements:", self);

}

- (void)_requestDelegateForFetchForMailboxes:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NNMKSyncProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NNMKSyncProvider delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncProvider:didRequestFetchForMailboxes:", self, v4);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "syncProviderDidRequestFetch:forConversationId:mailbox:", self, 0, v12, (_QWORD)v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }

}

- (void)_requestDelegateToSendComposedMessage:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestSendComposedMessage:", self, v5);

}

- (void)_requestDelegateForResendingMessagesWithIds:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestResendMessagesWithIds:", self, v5);

}

- (void)_requestDelegateForResendingAccountWithId:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestResendAccountWithId:", self, v5);

}

- (void)trackerDidFinishSendingInitialSyncContentToPairedDevice:(id)a3
{
  NNMKProtoInitialContentSyncCompletedNotification *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(NNMKProtoInitialContentSyncCompletedNotification);
  -[NNMKProtoInitialContentSyncCompletedNotification setFullSyncVersion:](v4, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
  -[NNMKMessageContentSyncServiceServer notifyInitialContentSyncCompleted:](self->_contentSyncService, "notifyInitialContentSyncCompleted:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client that all content has been sync'ed (IDS Identifier: %{public}@)...", (uint8_t *)&v7, 0xCu);
  }

}

- (id)syncServiceEndpoints
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", self->_messagesSyncService, self->_contentSyncService, self->_accountsSyncService, self->_fetchesSyncService, self->_protectedSyncService, self->_protectedContentSyncService, 0);
}

- (void)_requestDelegateForMessagesToSendAsFetchResponseForMessageIds:(id)a3
{
  NNMKSyncProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncProvider:didRequestMessagesToSendAsFetchResponseForMessageIds:", self, v5);

}

- (void)_setPairedDeviceSupportsMultipleMailboxes:(BOOL)a3
{
  self->_pairedDeviceSupportsMultipleMailboxes = a3;
}

- (BOOL)_pairedDeviceSupportsMultipleMailboxes
{
  return self->_pairedDeviceSupportsMultipleMailboxes
      || -[NNMKSyncStateManager pairedDeviceSupportsMultipleMailboxes](self->_syncStateManager, "pairedDeviceSupportsMultipleMailboxes");
}

- (BOOL)pairedDeviceSupportsStandaloneMode
{
  return -[NNMKSyncStateManager pairedDeviceSupportsStandaloneMode](self->_syncStateManager, "pairedDeviceSupportsStandaloneMode");
}

- (NNMKSyncProviderDelegate)delegate
{
  return (NNMKSyncProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

- (void)setProviderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_providerQueue, a3);
}

- (NNMKSyncStateManager)syncStateManager
{
  return self->_syncStateManager;
}

- (void)setSyncStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateManager, a3);
}

- (NNMKDeviceSyncRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, a3);
}

- (BOOL)fullSyncRecoveredInThisSession
{
  return self->_fullSyncRecoveredInThisSession;
}

- (void)setFullSyncRecoveredInThisSession:(BOOL)a3
{
  self->_fullSyncRecoveredInThisSession = a3;
}

- (void)setPersistenceHandler:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceHandler, a3);
}

- (NNMKMessagesSyncServiceServer)messagesSyncService
{
  return self->_messagesSyncService;
}

- (void)setMessagesSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_messagesSyncService, a3);
}

- (NNMKMessageContentSyncServiceServer)contentSyncService
{
  return self->_contentSyncService;
}

- (void)setContentSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_contentSyncService, a3);
}

- (void)setAccountsSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_accountsSyncService, a3);
}

- (NNMKFetchesSyncServiceServer)fetchesSyncService
{
  return self->_fetchesSyncService;
}

- (void)setFetchesSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_fetchesSyncService, a3);
}

- (NNMKProtectedSyncServiceServer)protectedSyncService
{
  return self->_protectedSyncService;
}

- (void)setProtectedSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_protectedSyncService, a3);
}

- (NNMKProtectedContentSyncServiceServer)protectedContentSyncService
{
  return self->_protectedContentSyncService;
}

- (void)setProtectedContentSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_protectedContentSyncService, a3);
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (NNMKSyncSessionController)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_sessionController, a3);
}

- (NNMKDirectoryProvider)directoryProvider
{
  return self->_directoryProvider;
}

- (void)setDirectoryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_directoryProvider, a3);
}

- (void)setResendScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_resendScheduler, a3);
}

- (NNMKInitialSyncProgressTracker)initialSyncProgressTracker
{
  return self->_initialSyncProgressTracker;
}

- (void)setInitialSyncProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncProgressTracker, a3);
}

- (NNMKBatchRequestHandler)batchRequestHandler
{
  return self->_batchRequestHandler;
}

- (void)setBatchRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_batchRequestHandler, a3);
}

- (BOOL)triggeredInitialSyncToRecoverFromSyncVersionMismatch
{
  return self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch;
}

- (void)setTriggeredInitialSyncToRecoverFromSyncVersionMismatch:(BOOL)a3
{
  self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchRequestHandler, 0);
  objc_storeStrong((id *)&self->_initialSyncProgressTracker, 0);
  objc_storeStrong((id *)&self->_resendScheduler, 0);
  objc_storeStrong((id *)&self->_directoryProvider, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_protectedContentSyncService, 0);
  objc_storeStrong((id *)&self->_protectedSyncService, 0);
  objc_storeStrong((id *)&self->_fetchesSyncService, 0);
  objc_storeStrong((id *)&self->_accountsSyncService, 0);
  objc_storeStrong((id *)&self->_contentSyncService, 0);
  objc_storeStrong((id *)&self->_messagesSyncService, 0);
  objc_storeStrong((id *)&self->_persistenceHandler, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_syncStateManager, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_triggerFullSyncForMailbox:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Mailbox should not be empty for a #full-sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_triggerFullSyncForMailboxes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "No mailbox for triggering a #full-sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "No mailbox for default id. Since paired device does not support multiple mailboxes, we should have default mailbox.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_addMessages:(uint64_t)a3 mailbox:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v5 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "mailboxId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nnmk_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_22E161000, v5, OS_LOG_TYPE_ERROR, "Dropping messages to add because mailbox is not active. (Mailbox: %{public}@ - Messages: %{public}@)", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)_updateMessagesStatus:(uint64_t)a3 mailbox:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "mailboxId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "syncRequested");
  objc_msgSend(a2, "syncRequestedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nnmk_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138544130;
  v12 = v6;
  v13 = 2048;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  v17 = 2114;
  v18 = v10;
  _os_log_error_impl(&dword_22E161000, v5, OS_LOG_TYPE_ERROR, "Dropping messages to update because mailbox is not active. (Mailbox: %{public}@ - Sync Requested: %lu - Request Date - %{public}@ - Messages: %{public}@)", (uint8_t *)&v11, 0x2Au);

}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "No messages to mark as NOT notify in database for conversation id %{public}@", v2);
  OUTLINED_FUNCTION_15();
}

void __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "No messages to mark as notify in database for conversation id %{public}@", v2);
  OUTLINED_FUNCTION_15();
}

void __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v2, v5, "Could not find mailbox with Id %{public}@", v6);

  OUTLINED_FUNCTION_1();
}

- (void)_addMessageContent:forMessage:loadedProtected:mailbox:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Received Message Content with nil messageId, ignoring it.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "Ignoring \"organized by thread\" flag changed because no accounts are synced yet. %lu", v2);
  OUTLINED_FUNCTION_15();
}

- (void)messagesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_22E161000, v0, v1, "Messages sent successfully by IDS (IDS Identifier: %{public}@).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)messagesSyncServiceServer:didRequestSendMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Composed Message SENT from Client with too many NULL fields. Ignoring...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)messagesSyncServiceServer:(void *)a1 didRequestCompactMessages:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9_0(&dword_22E161000, v5, v6, "Ignoring compact request. Mailbox: %{public}@ (exists: %d)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)messageContentSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_22E161000, v0, v1, "Content sent successfully by IDS (IDS Identifier: %{public}@).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)accountsSyncServiceServer:(void *)a1 didChangeAccountSourceType:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "fullSyncVersion");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v1, v2, "Account Source type ignored. Full sync version mismatch %lu", v3);

  OUTLINED_FUNCTION_1();
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "No account for watch account. Standalone state will be dropped. %{public}@", v2);
  OUTLINED_FUNCTION_15();
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_69_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "emailAddressToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109120;
  v5[1] = v4 != 0;
  _os_log_error_impl(&dword_22E161000, v2, OS_LOG_TYPE_ERROR, "#cloud-notifications Failed to update local account properties (hasToken: %d)", (uint8_t *)v5, 8u);

  OUTLINED_FUNCTION_15();
}

- (void)_handleFetchRequest:(void *)a1 shouldResumeSync:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v1, v3, "Dropping #FETCH request for mailbox because we do not have this mailbox anymore. %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)fetchesSyncServiceServer:didRequestMoreMessagesInBatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Ignoring #LOAD_MORE_MESSAGES request because #sync-version is wrong.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)fetchesSyncServiceServer:(void *)a1 didRequestMoreMessages:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9_0(&dword_22E161000, v5, v6, "Ignoring #LOAD_MORE_MESSAGES request. Mailbox: %{public}@ (exists: %d)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)fetchesSyncServiceServer:(void *)a1 didRequestMoreMessagesForConversation:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v1, v3, "Ignoring #LOAD_MORE_MESSAGES conversation request. Mailbox %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)setupPairedDeviceRegistry
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "#PAIRING_STATE PairedSync asked us to do a #full-sync, but NanoRegistry returned no devices. Replying to PairedSync with an error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_verifyPairingForcingSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "#PAIRING_STATE Please file a radar. Pairing verification determined we're paired and PairedSync already ran. However, PairedSync never told Mail to start syncing. Will force syncing...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_verifyPairingForcingSync:(char)a1 .cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_22E161000, a2, OS_LOG_TYPE_DEBUG, "Verifying pairing (forceSyncIfPaired: %d)...", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_19();
}

- (void)resendScheduler:didRequestRetrySendingAccountIdentifier:resendInterval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "Attempting to retry sending account identity but information is not available anymore. %{public}@", v2);
  OUTLINED_FUNCTION_15();
}

- (void)_shouldHandleForwardForNotification:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "#BulletinDistributor missing messageId from notification. Ignoring bulletin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_shouldHandleForwardForNotification:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but they had told us that message was NOT going to generate a notification. Bumping message to Notification priority and potentially re-requesting content... (Message Id: %{public}@)", v2);
  OUTLINED_FUNCTION_15();
}

- (void)_fastForwardToFullSyncVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v0, v1, "Requested to Fast Forward #sync-version, but we're not yet paired. Ignoring... (#sync-version requested: %lu).", v2);
  OUTLINED_FUNCTION_15();
}

- (void)_checkConnectivityBasedSuspensionTimer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11_0(&dword_22E161000, v0, v1, "Is now connected.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Requesting more message without mailbox.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)_requestDelegateForFirstMessagesForMailboxes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11_0(&dword_22E161000, v0, v1, "Requesting first messages from delegate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

@end
