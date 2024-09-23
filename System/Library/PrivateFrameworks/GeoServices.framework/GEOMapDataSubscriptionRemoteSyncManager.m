@implementation GEOMapDataSubscriptionRemoteSyncManager

- (GEOMapDataSubscriptionRemoteSyncManager)init
{
  GEOMapDataSubscriptionRemoteSyncManager *v2;
  GEOMapDataSubscriptionRemoteSyncManager *v3;
  uint64_t v4;
  OS_dispatch_queue *incomingMessageQueue;
  uint64_t v6;
  geo_isolater *statesLock;
  NSObject *global_queue;
  GEOMapDataSubscriptionRemoteSyncManager *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOMapDataSubscriptionRemoteSyncManager;
  v2 = -[GEOMapDataSubscriptionRemoteSyncManager init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_configuredConnection.lock._os_unfair_lock_opaque = 0;
    v2->_configuredConnection.didRun = 0;
    geo_dispatch_queue_create_with_workloop_qos();
    v4 = objc_claimAutoreleasedReturnValue();
    incomingMessageQueue = v3->_incomingMessageQueue;
    v3->_incomingMessageQueue = (OS_dispatch_queue *)v4;

    v6 = geo_isolater_create();
    statesLock = v3->_statesLock;
    v3->_statesLock = (geo_isolater *)v6;

    objc_initWeak(&location, v3);
    global_queue = geo_get_global_queue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__GEOMapDataSubscriptionRemoteSyncManager_init__block_invoke;
    v11[3] = &unk_1E1C05280;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v3->_geodLaunchedNotifyToken, global_queue, v11);

    v9 = v3;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __47__GEOMapDataSubscriptionRemoteSyncManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reconnectIfNecessary");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_geodLaunchedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapDataSubscriptionRemoteSyncManager;
  -[GEOMapDataSubscriptionRemoteSyncManager dealloc](&v3, sel_dealloc);
}

- (id)_connection
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke;
  v4[3] = &unk_1E1BFF6F8;
  v4[4] = self;
  GEOOnce((uint64_t)&self->_configuredConnection, v4);
  return self->_connection;
}

void __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke_2;
  v6[3] = &unk_1E1C07998;
  objc_copyWeak(&v7, &location);
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:eventHandler:", 14, CFSTR("MapDataSubscriptionSyncManager"), v2, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

- (void)_handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *string;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  GEOMapDataSubscriptionRemoteSyncManager *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x18D765A14]();
  if (v5 == MEMORY[0x1E0C81310])
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__92;
    v29 = __Block_byref_object_dispose__92;
    v30 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __56__GEOMapDataSubscriptionRemoteSyncManager__handleEvent___block_invoke;
    v22 = &unk_1E1C00760;
    v23 = self;
    v24 = &v25;
    geo_isolate_sync_data();
    if (objc_msgSend((id)v26[5], "count"))
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      v8 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "GEOErrorWithCode:reason:", -15, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = (id)v26[5];
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v31, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v11);
            -[GEOMapDataSubscriptionState _handleXPCError:](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v10);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v31, 16);
        }
        while (v12);
      }

    }
    _Block_object_dispose(&v25, 8);

  }
  else if (v5 == MEMORY[0x1E0C812F8])
  {
    v6 = xpc_dictionary_get_string(v4, "message");
    if (!strcmp(v6, "subscription_state_did_change"))
      -[GEOMapDataSubscriptionRemoteSyncManager _receivedStateUpdate:](self, "_receivedStateUpdate:", v4);
  }

}

void __56__GEOMapDataSubscriptionRemoteSyncManager__handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest setDeviceIdentifier:](v11, "setDeviceIdentifier:", v10);

  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __122__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E1C15A38;
  v15 = v8;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", v12, v9, v14);

}

void __122__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "subscriptionsInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  GEOMapSubscriptionSetPairedDeviceSyncRequest *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[GEOMapSubscriptionSetPairedDeviceSyncRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionSetPairedDeviceSyncRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionSetPairedDeviceSyncRequest setIdentifier:](v13, "setIdentifier:", v10);
  -[GEOMapSubscriptionSetPairedDeviceSyncRequest setShouldSync:](v13, "setShouldSync:", v8);
  objc_initWeak(&location, self);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E1C15A60;
  v21 = v8;
  objc_copyWeak(&v20, &location);
  v17[4] = self;
  v15 = v10;
  v18 = v15;
  v16 = v12;
  v19 = v16;
  -[GEOXPCRequest send:withReply:handler:](v13, "send:withReply:handler:", v14, v11, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a2;
  v6 = a3;
  if (!v6 && !*(_BYTE *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      v8 = *(id *)(a1 + 40);
      geo_isolate_sync_data();
      if (*((_BYTE *)v10 + 24))
        objc_msgSend(*(id *)(a1 + 32), "_stopObservingStateForIdentifier:", *(_QWORD *)(a1 + 40));

      _Block_object_dispose(&v9, 8);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

  return objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  GEOMapSubscriptionStartDownloadRequest *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v6 = -[GEOMapSubscriptionStartDownloadRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionStartDownloadRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
    -[GEOMapSubscriptionStartDownloadRequest setIdentifiers:](v6, "setIdentifiers:", v8);
    -[GEOMapSubscriptionStartDownloadRequest setDownloadMode:](v6, "setDownloadMode:", a4);
    -[GEOMapSubscriptionStartDownloadRequest setOnPairedDevice:](v6, "setOnPairedDevice:", 1);
    -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOXPCRequest send:](v6, "send:", v7);

  }
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
  GEOMapSubscriptionCancelDownloadRequest *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[GEOMapSubscriptionCancelDownloadRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionCancelDownloadRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
    -[GEOMapSubscriptionCancelDownloadRequest setIdentifiers:](v4, "setIdentifiers:", v6);
    -[GEOMapSubscriptionCancelDownloadRequest setOnPairedDevice:](v4, "setOnPairedDevice:", 1);
    -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOXPCRequest send:](v4, "send:", v5);

  }
}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapSubscriptionFetchLastUpdatedDateRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[GEOMapSubscriptionFetchLastUpdatedDateRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionFetchLastUpdatedDateRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionFetchLastUpdatedDateRequest setOnPairedDevice:](v8, "setOnPairedDevice:", 1);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __126__GEOMapDataSubscriptionRemoteSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C07920;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", v9, v7, v11);

}

void __126__GEOMapDataSubscriptionRemoteSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "timestamp");
  v7 = *(_QWORD *)(a1 + 32);
  if (v5 || v6 <= 0.0)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v10, "timestamp");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v9, 0);

  }
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __129__GEOMapDataSubscriptionRemoteSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C15A88;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", v9, v7, v11);

}

void __129__GEOMapDataSubscriptionRemoteSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
    v6 = objc_msgSend(a2, "availableBytes");
  else
    v6 = -1;
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __119__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C15AB0;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", v9, v7, v11);

}

void __119__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "identifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  GEOMapSubscriptionStateRequest *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  GEOMapDataSubscriptionRemoteSyncManager *v17;
  id v18;
  id v19;
  _QWORD block[4];
  GEOMapSubscriptionStateRequest *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  GEOMapDataSubscriptionRemoteSyncManager *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__92;
  v34 = __Block_byref_object_dispose__92;
  v35 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v26 = &unk_1E1C041E8;
  v29 = &v30;
  v27 = self;
  v12 = v8;
  v28 = v12;
  geo_isolate_sync_data();
  if (v31[5])
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E1C03F50;
    v21 = (GEOMapSubscriptionStateRequest *)v10;
    v22 = &v30;
    dispatch_async(v9, block);
    v13 = v21;
  }
  else
  {
    v13 = -[GEOMapSubscriptionStateRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionStateRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
    -[GEOMapSubscriptionStateRequest setIdentifier:](v13, "setIdentifier:", v12);
    -[GEOMapSubscriptionStateRequest setFromPairedDevice:](v13, "setFromPairedDevice:", 1);
    -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v15[3] = &unk_1E1C07970;
    v16 = v9;
    v17 = self;
    v18 = v12;
    v19 = v10;
    -[GEOXPCRequest send:withReply:handler:](v13, "send:withReply:handler:", v14, v16, v15);

  }
  _Block_object_dispose(&v30, 8);

}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v5 = a2;
  v6 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__92;
  v12 = __Block_byref_object_dispose__92;
  objc_msgSend(v5, "state");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v9[5])
  {
    v7 = *(id *)(a1 + 48);
    geo_isolate_sync_data();
    objc_msgSend(*(id *)(a1 + 40), "_startObservingStateForIdentifier:", *(_QWORD *)(a1 + 48));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(&v8, 8);

}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1[4] + 56);
  if (v2)
  {
    objc_msgSend(v3, "objectForKey:", a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    if (!v3)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 5);
      v8 = a1[4];
      v9 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = v7;

      v3 = *(void **)(a1[4] + 56);
    }
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __138__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C15AD8;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", v9, v7, v11);

}

void __138__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "serializedReply");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest setSerializedState:](v11, "setSerializedState:", v10);

  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__GEOMapDataSubscriptionRemoteSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E1C15B00;
  v15 = v8;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", v12, v9, v14);

}

uint64_t __115__GEOMapDataSubscriptionRemoteSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest setSerializedSummary:](v11, "setSerializedSummary:", v10);

  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __121__GEOMapDataSubscriptionRemoteSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E1C15B28;
  v15 = v8;
  v13 = v8;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", v12, v9, v14);

}

uint64_t __121__GEOMapDataSubscriptionRemoteSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reconnectIfNecessary
{
  NSObject *v3;
  GEOMapSubscriptionStateStartObservingRequest *v4;
  void *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  GEOMapDataSubscriptionRemoteSyncManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__92;
  v17 = __Block_byref_object_dispose__92;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__GEOMapDataSubscriptionRemoteSyncManager__reconnectIfNecessary__block_invoke;
  v10 = &unk_1E1C00760;
  v11 = self;
  v12 = &v13;
  geo_isolate_sync_data();
  if (objc_msgSend((id)v14[5], "count"))
  {
    GEOGetSubscriptionsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[PairedDevice] geod has launched. Reconnecting to refresh paired device states", v6, 2u);
    }

    v4 = -[GEOMapSubscriptionStateStartObservingRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionStateStartObservingRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
    -[GEOMapSubscriptionStateStartObservingRequest setPairedDeviceIdentifiers:](v4, "setPairedDeviceIdentifiers:", v14[5]);
    -[GEOMapSubscriptionStateStartObservingRequest setSendInitialUpdate:](v4, "setSendInitialUpdate:", 1);
    -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOXPCRequest send:](v4, "send:", v5);

  }
  _Block_object_dispose(&v13, 8);

}

void __64__GEOMapDataSubscriptionRemoteSyncManager__reconnectIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "keyEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_startObservingStateForIdentifier:(id)a3
{
  id v4;
  GEOMapSubscriptionStateStartObservingRequest *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[GEOMapSubscriptionStateStartObservingRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionStateStartObservingRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOMapSubscriptionStateStartObservingRequest setPairedDeviceIdentifiers:](v5, "setPairedDeviceIdentifiers:", v6);
  -[GEOMapSubscriptionStateStartObservingRequest setSendInitialUpdate:](v5, "setSendInitialUpdate:", 1);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v5, "send:", v7);

}

- (void)_stopObservingStateForIdentifier:(id)a3
{
  id v4;
  GEOMapSubscriptionStateStopObservingRequest *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[GEOMapSubscriptionStateStopObservingRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionStateStopObservingRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOMapSubscriptionStateStopObservingRequest setPairedDeviceIdentifiers:](v5, "setPairedDeviceIdentifiers:", v6);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v5, "send:", v7);

}

- (void)_receivedStateUpdate:(id)a3
{
  id v4;
  const char *string;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  _QWORD block[4];
  id v12;
  GEOMapDataSubscriptionRemoteSyncManager *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (MEMORY[0x18D765A14]() != MEMORY[0x1E0C812F8])
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: xpc_get_type(message) == (&_xpc_type_dictionary)";
LABEL_14:
    _os_log_fault_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, v10, buf, 2u);
    goto LABEL_7;
  }
  if (!xpc_dictionary_get_BOOL(v4, "paired_device"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: xpc_dictionary_get_BOOL(message, \"paired_device\")";
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v4, "id");
  if (!string)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: rawIdentifier != ((void *)0)";
    goto LABEL_14;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  if (v6)
  {
    xpc_dictionary_get_dictionary(v4, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke;
    block[3] = &unk_1E1C01790;
    v12 = v6;
    v13 = self;
    v14 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", buf, 2u);
  }

LABEL_7:
}

void __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  _BYTE buf[24];
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOGetSubscriptionsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 141558275;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for subscription '%{private, mask.hash}@'", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v8 = __Block_byref_object_copy__92;
  v9 = __Block_byref_object_dispose__92;
  v10 = 0;
  v6 = a1[4];
  geo_isolate_sync_data();
  v4 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v4)
  {
    -[GEOMapDataSubscriptionState _updateWithXPCDictionary:](v4, a1[6]);
    WeakRetained = objc_loadWeakRetained((id *)a1[5] + 1);
    objc_msgSend(WeakRetained, "syncManager:didUpdatePairedDeviceState:forIdentifier:", a1[5], *(_QWORD *)(*(_QWORD *)&buf[8] + 40), a1[4]);

  }
  else
  {
    objc_msgSend(a1[5], "_stopObservingStateForIdentifier:", a1[4]);
  }

  _Block_object_dispose(buf, 8);
}

void __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke_40(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapDataSubscriptionRemoteSyncManager _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __126__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E1C15B50;
  v12 = v6;
  v10 = v6;
  -[GEOXPCRequest send:withReply:handler:](v8, "send:withReply:handler:", v9, v7, v11);

}

void __126__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "serializedSummary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (GEOMapDataSubscriptionSyncManagerDelegate)delegate
{
  return (GEOMapDataSubscriptionSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_statesLock, 0);
  objc_storeStrong((id *)&self->_incomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
