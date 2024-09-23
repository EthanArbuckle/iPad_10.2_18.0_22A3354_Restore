@implementation GEOMapDataSubscriptionRemotePersistence

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOMapSubscriptionsFetchRequest *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[GEOMapSubscriptionsFetchRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionsFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionsFetchRequest setIdentifiersFilter:](v10, "setIdentifiersFilter:", v9);

  -[GEOMapSubscriptionsFetchRequest setFetchExpired:](v10, "setFetchExpired:", 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__GEOMapDataSubscriptionRemotePersistence_fetchSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E1C0B0A8;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", 0, v12, v13);

}

void __109__GEOMapDataSubscriptionRemotePersistence_fetchSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  objc_msgSend(a2, "subscriptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOMapSubscriptionsFetchRequest *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[GEOMapSubscriptionsFetchRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionsFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionsFetchRequest setIdentifiersFilter:](v10, "setIdentifiersFilter:", v9);

  -[GEOMapSubscriptionsFetchRequest setFetchExpired:](v10, "setFetchExpired:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __116__GEOMapDataSubscriptionRemotePersistence_fetchExpiredSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E1C0B0A8;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", 0, v12, v13);

}

void __116__GEOMapDataSubscriptionRemotePersistence_fetchExpiredSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  objc_msgSend(a2, "subscriptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  GEOMapSubscriptionAddRequest *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  GEOMapDataSubscriptionRemotePersistence *v29;
  id v30;
  id v31;
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = -[GEOMapSubscriptionAddRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionAddRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, v17, 0);
  -[GEOMapSubscriptionAddRequest setIdentifier:](v23, "setIdentifier:", v16);
  -[GEOMapSubscriptionAddRequest setDataTypes:](v23, "setDataTypes:", a5);
  -[GEOMapSubscriptionAddRequest setPolicy:](v23, "setPolicy:", a6);
  -[GEOMapSubscriptionAddRequest setRegion:](v23, "setRegion:", v18);
  -[GEOMapSubscriptionAddRequest setDisplayName:](v23, "setDisplayName:", v19);
  -[GEOMapSubscriptionAddRequest setExpirationDate:](v23, "setExpirationDate:", v20);
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __167__GEOMapDataSubscriptionRemotePersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
  v27[3] = &unk_1E1C0B0D0;
  v24 = v21;
  v28 = v24;
  v25 = v22;
  v30 = v25;
  objc_copyWeak(&v31, &location);
  v29 = self;
  -[GEOXPCRequest send:withReply:handler:](v23, "send:withReply:handler:", 0, v24, v27);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
}

void __167__GEOMapDataSubscriptionRemotePersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id *WeakRetained;
  id *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a3;
  objc_msgSend(v14, "subscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  objc_msgSend(v14, "subscription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    v10 = WeakRetained;
    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained(WeakRetained + 1);
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "subscription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subscriptionPersistence:didAddSubscription:", v12, v13);

    }
  }

}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOMapSubscriptionRemoveRequest *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[GEOMapSubscriptionRemoveRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionRemoveRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMapSubscriptionRemoveRequest setIdentifier:](v10, "setIdentifier:", v9);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__GEOMapDataSubscriptionRemotePersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E1C0B0F8;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[GEOXPCRequest send:withReply:handler:](v10, "send:withReply:handler:", 0, v12, v13);

}

uint64_t __108__GEOMapDataSubscriptionRemotePersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 != 0);
}

- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  GEOMapSubscriptionTotalOfflineDataSizeRequest *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOMapSubscriptionTotalOfflineDataSizeRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionTotalOfflineDataSizeRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__GEOMapDataSubscriptionRemotePersistence_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue_completionHandler___block_invoke;
  v9[3] = &unk_1E1C0B120;
  v10 = v5;
  v8 = v5;
  -[GEOXPCRequest send:withReply:handler:](v7, "send:withReply:handler:", 0, v6, v9);

}

void __119__GEOMapDataSubscriptionRemotePersistence_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "sizeInBytes"), v5);

}

- (void)pruneShiftEntries
{
  GEOLocationShiftingPruneCacheRequest *v2;

  v2 = -[GEOLocationShiftingPruneCacheRequest initWithTraits:auditToken:throttleToken:]([GEOLocationShiftingPruneCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOXPCRequest send:](v2, "send:", 0);

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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
