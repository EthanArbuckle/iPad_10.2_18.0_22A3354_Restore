@implementation GEOMapDataSubscriptionLocalPersistence

- (GEOMapDataSubscriptionLocalPersistence)init
{
  GEOMapDataSubscriptionLocalPersistence *result;

  result = (GEOMapDataSubscriptionLocalPersistence *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapDataSubscriptionLocalPersistence)initWithTileDB:(id)a3 offlineDataConfiguration:(id)a4
{
  id v7;
  id v8;
  GEOMapDataSubscriptionLocalPersistence *v9;
  uint64_t v10;
  geo_isolater *isolation;
  GEOTileDB *db;
  void *global_queue;
  void *v14;
  GEOMapDataSubscriptionLocalPersistence *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapDataSubscriptionLocalPersistence;
  v9 = -[GEOMapDataSubscriptionLocalPersistence init](&v17, sel_init);
  if (v9)
  {
    v10 = geo_isolater_create();
    isolation = v9->_isolation;
    v9->_isolation = (geo_isolater *)v10;

    objc_storeStrong((id *)&v9->_db, a3);
    db = v9->_db;
    global_queue = (void *)geo_get_global_queue();
    -[GEOTileDB registerObserver:queue:](db, "registerObserver:queue:", v9, global_queue);

    objc_storeStrong((id *)&v9->_offlineDataConfiguration, a4);
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addDataDidBecomeAvailableAfterFirstUnlockObserver:", v9);

    v15 = v9;
  }

  return v9;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
  notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
}

- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  GEOMapDataSubscription *v22;
  void *v23;
  GEOMapDataSubscription *v24;
  GEOTileDB *db;
  GEOMapDataSubscription *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  GEOMapDataSubscription *v30;
  id v31;
  id v32;
  id location;
  _QWORD block[4];
  id v35;

  v27 = a3;
  v28 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if ((a5 & 0x400) != 0 && a6 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: !isNonUserInitiatedOfflineSubscription", (uint8_t *)&location, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v35 = v21;
    dispatch_async(v20, block);

  }
  else
  {
    objc_initWeak(&location, self);
    v22 = [GEOMapDataSubscription alloc];
    objc_msgSend(v28, "bundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:](v22, "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:", v27, v23, a5, a6, v19, v17, v18);

    db = self->_db;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke_2;
    v29[3] = &unk_1E1C20A40;
    v31 = v21;
    v26 = v24;
    v30 = v26;
    objc_copyWeak(&v32, &location);
    -[GEOTileDB addSubscription:queue:callback:](db, "addSubscription:queue:callback:", v26, v20, v29);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

}

void __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("Non-user-initiated offline subscriptions are not supported"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id *WeakRetained;
  id *v8;
  id v9;
  __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("subscription");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", 0x1E1CA61B0, 0, v6);

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v9, "subscriptionPersistence:didAddSubscription:", v8, *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOTileDB fetchSubscriptionsMatchingIdentifiers:queue:callback:](self->_db, "fetchSubscriptionsMatchingIdentifiers:queue:callback:", a3, a4, a5);
}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOTileDB fetchExpiredSubscriptionsMatchingIdentifiers:queue:callback:](self->_db, "fetchExpiredSubscriptionsMatchingIdentifiers:queue:callback:", a3, a4, a5);
}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOTileDB *db;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  db = self->_db;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__GEOMapDataSubscriptionLocalPersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E1C20A40;
  v12 = v10;
  v16 = v12;
  objc_copyWeak(&v17, &location);
  v13 = v8;
  v15 = v13;
  -[GEOTileDB removeSubscriptionWithIdentifier:queue:callback:](db, "removeSubscriptionWithIdentifier:queue:callback:", v13, v9, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __107__GEOMapDataSubscriptionLocalPersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v6, "subscriptionPersistence:didRemoveSubscriptionWithIdentifier:", v5, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("subscriptionIdentifier");
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", 0x1E1CA61D0, 0, v9);

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);

  }
}

- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOTileDB calculateSizeOfAllOfflineDataWithCallbackQueue:callback:](self->_db, "calculateSizeOfAllOfflineDataWithCallbackQueue:callback:", a3, a4);
}

- (void)pruneShiftEntries
{
  -[GEOTileDB pruneShiftEntries](self->_db, "pruneShiftEntries");
}

- (void)tileDB:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4
{
  GEOMapDataSubscriptionPersistenceDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "subscriptionPersistence:didUpdateSubscriptionWithIdentifier:", self, v6);

}

- (GEOMapDataSubscriptionPersistenceDelegate)delegate
{
  return (GEOMapDataSubscriptionPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
