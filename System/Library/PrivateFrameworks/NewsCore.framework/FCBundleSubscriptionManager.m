@implementation FCBundleSubscriptionManager

- (FCBundleSubscription)cachedSubscription
{
  FCBundleSubscriptionManager *v2;
  FCBundleSubscription *v3;

  v2 = self;
  if (self)
    self = (FCBundleSubscriptionManager *)self->_accessLock;
  -[FCBundleSubscriptionManager lock](self, "lock");
  v3 = v2->_cachedSubscription;
  -[NFMutexLock unlock](v2->_accessLock, "unlock");
  return v3;
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t (**v10)(void);
  BOOL v12;
  FCAsyncSerialQueue *refreshQueue;
  _QWORD v14[5];
  uint64_t (**v15)(void);
  id v16;
  unint64_t v17;
  BOOL v18;
  BOOL v19;
  _QWORD v20[6];
  _QWORD aBlock[6];

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke;
  aBlock[3] = &unk_1E463E420;
  aBlock[4] = self;
  aBlock[5] = a3;
  v10 = (uint64_t (**)(void))_Block_copy(aBlock);
  if ((v10[2]() & 1) != 0)
  {
    v12 = a3 == 3 || a3 == 0;
    if (self)
      refreshQueue = self->_refreshQueue;
    else
      refreshQueue = 0;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_3;
    v14[3] = &unk_1E463E498;
    v15 = v10;
    v16 = v8;
    v17 = a3;
    v14[4] = self;
    v18 = v12;
    v19 = a4;
    -[FCAsyncSerialQueue enqueueBlock:](refreshQueue, "enqueueBlock:", v14);

  }
  else
  {
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_57;
    v20[3] = &unk_1E463B2D0;
    v20[4] = self;
    v20[5] = v8;
    __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_57((uint64_t)v20);
  }

}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  _QWORD v9[6];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.stocks")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news")) & 1) == 0
    && !NSClassFromString(CFSTR("XCTest")))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2;
    v9[3] = &unk_1E463ABB8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v9[5] = v3;
    __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2((uint64_t)v9);
LABEL_11:
    v7 = 0;
    goto LABEL_9;
  }
  if ((NFStoreDemoMode() & 1) == 0 && *(_QWORD *)(a1 + 40) <= 1uLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedSubscription");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[FCBundleSubscriptionManager hasRunEntitlementOnce](*(_QWORD *)(a1 + 32));

      if (v6)
        goto LABEL_11;
    }
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (uint64_t)updateHasRunEntitlementOnce:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 56), "lock");
    *(_BYTE *)(v1 + 8) = 1;
    return objc_msgSend(*(id *)(v1 + 56), "unlock");
  }
  return result;
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  char v24;
  _QWORD *v25;
  id v26;
  _QWORD v27[4];
  void *v28;
  id v29;
  id v30;
  _QWORD v31[7];
  id location;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  NSObject *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  __int128 buf;
  void (*v52)(uint64_t);
  void *v53;
  id *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  id v60;
  char v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = v5;
      FCStringFromBundleSubscriptionCachePolicy(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Will refresh bundle subscription with cache policy=%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v9 = *(id **)(a1 + 32);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v24 = *(_BYTE *)(a1 + 65);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_59;
    v27[3] = &unk_1E463E470;
    v28 = v4;
    v29 = v3;
    v30 = *(id *)(a1 + 48);
    v26 = v4;
    v25 = v27;
    if (v9)
    {
      if (!-[FCBundleSubscriptionManager hasRunEntitlementOnce]((uint64_t)v9))
      {
        v11 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Fetching entitlements now because the entitlements check has not run at least once", (uint8_t *)&buf, 2u);
        }
      }
      v12 = dispatch_group_create();
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = __Block_byref_object_copy__17;
      v49[4] = __Block_byref_object_dispose__17;
      v50 = 0;
      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = __Block_byref_object_copy__17;
      v47[4] = __Block_byref_object_dispose__17;
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);
      v14 = v9[8];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke;
      v42[3] = &unk_1E463E4C0;
      v45 = v49;
      v46 = v47;
      v42[4] = v9;
      v23 = v13;
      v43 = v23;
      v15 = v12;
      v44 = v15;
      objc_msgSend(v14, "loadInitialBundleChannelIDsWithCompletion:", v42);

      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x3032000000;
      v40[3] = __Block_byref_object_copy__17;
      v40[4] = __Block_byref_object_dispose__17;
      v41 = 0;
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy__17;
      v38[4] = __Block_byref_object_dispose__17;
      v39 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v15);
      v17 = v9[2];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_63;
      v33[3] = &unk_1E463E4E8;
      v36 = v40;
      v37 = v38;
      v18 = v16;
      v34 = v18;
      v19 = v15;
      v35 = v19;
      objc_msgSend(v17, "fetchEntitlementsWithIgnoreCache:completion:", v10 != 0, v33);

      objc_initWeak(&location, v9);
      if (FCDispatchGroupIsEmpty(v19))
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v52 = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_65;
        v53 = &unk_1E463E538;
        objc_copyWeak(&v60, &location);
        v56 = v40;
        v54 = v9;
        v57 = v49;
        v58 = v47;
        v61 = v24;
        v59 = v38;
        v55 = v25;
        v52((uint64_t)&buf);
      }
      else
      {
        dispatch_get_global_queue(25, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v52 = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_68;
        v53 = &unk_1E463E538;
        objc_copyWeak(&v60, &location);
        v56 = v40;
        v54 = v9;
        v57 = v49;
        v58 = v47;
        v61 = v24;
        v59 = v38;
        v55 = v25;
        dispatch_group_notify(v19, v22, &buf);

      }
      objc_destroyWeak(&v60);
      objc_destroyWeak(&location);

      _Block_object_dispose(v38, 8);
      _Block_object_dispose(v40, 8);

      _Block_object_dispose(v47, 8);
      _Block_object_dispose(v49, 8);

    }
    v21 = v28;
  }
  else
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4;
    v31[3] = &unk_1E463E448;
    v20 = *(void **)(a1 + 48);
    v31[5] = v3;
    v31[6] = v20;
    v31[4] = *(_QWORD *)(a1 + 32);
    v21 = v20;
    v26 = v3;
    __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4((uint64_t)v31);
  }

}

- (BOOL)hasRunEntitlementOnce
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 56), "lock");
  v2 = *(_BYTE *)(a1 + 8) != 0;
  objc_msgSend(*(id *)(a1 + 56), "unlock");
  return v2;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__FCBundleSubscriptionManager_prepareForUseWithCompletion___block_invoke;
  v6[3] = &unk_1E463E560;
  v7 = v4;
  v5 = v4;
  -[FCBundleSubscriptionManager refreshBundleSubscriptionWithCachePolicy:completion:](self, "refreshBundleSubscriptionWithCachePolicy:completion:", 1, v6);

}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  -[FCBundleSubscriptionManager refreshBundleSubscriptionWithCachePolicy:hideBundleDetectionUI:completion:](self, "refreshBundleSubscriptionWithCachePolicy:hideBundleDetectionUI:completion:", a3, 0, a4);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    if (-[NSHashTable containsObject:](observers, "containsObject:", v4)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCBundleSubscriptionManager addObserver:]";
      v11 = 2080;
      v12 = "FCBundleSubscriptionManager.m";
      v13 = 1024;
      v14 = 606;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self)
        goto LABEL_7;
    }
    else if (self)
    {
LABEL_7:
      v6 = self->_observers;
LABEL_8:
      -[NSHashTable addObject:](v6, "addObject:", v4);
      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCBundleSubscriptionManager addObserver:]";
    v11 = 2080;
    v12 = "FCBundleSubscriptionManager.m";
    v13 = 1024;
    v14 = 602;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:

}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = v2;
  objc_msgSend(v3, "bundleChannelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[8];
  v9 = v8;
  objc_msgSend(v9, "bundleChannelIDsVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 40);
    v16 = v14;
    v17 = 134217984;
    v18 = objc_msgSend(v15, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Spent %llums fetching channel IDs for bundle subscription", (uint8_t *)&v17, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __59__FCBundleSubscriptionManager_prepareForUseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  if (self)
    self = (FCBundleSubscriptionManager *)self->_bundleEntitlementsProvider;
  -[FCBundleSubscriptionManager setEntitlementsOverrideProvider:](self, "setEntitlementsOverrideProvider:", a3);
}

- (FCBundleSubscription)validatedCachedSubscription
{
  FCBundleSubscriptionManager *v2;
  FCBundleSubscription *cachedSubscription;
  FCBundleSubscription *v4;

  v2 = self;
  if (self)
    self = (FCBundleSubscriptionManager *)self->_accessLock;
  -[FCBundleSubscriptionManager lock](self, "lock");
  if (v2->_hasRunEntitlementOnce)
    cachedSubscription = v2->_cachedSubscription;
  else
    cachedSubscription = 0;
  v4 = cachedSubscription;
  -[NFMutexLock unlock](v2->_accessLock, "unlock");
  return v4;
}

void __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription is initialized as 'not subscribed' state", (uint8_t *)&v14, 2u);
  }
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[8];
  v4 = v3;
  objc_msgSend(v4, "bundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 3, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 116);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -116 - v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject((id)v6, (const void *)(v6 + 1), v7, (void *)1);
  objc_setAssociatedObject((id)v6, (const void *)(-117 - v6), v8, (void *)1);

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](*(_QWORD *)(a1 + 32), (void *)v6);
  v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "cachedSubscription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription is set up: %{public}@", (uint8_t *)&v14, 0xCu);

  }
}

- (void)updateCachedSubscriptionWithSubscription:(uint64_t)a1
{
  char *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "lock");
    objc_storeStrong((id *)(a1 + 88), a2);
    v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "updateCachedSubscriptionWithSubscription  bundleSubscription= %@", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 56), "unlock");
    NewsCoreUserDefaults();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    objc_getAssociatedObject(v9, v4 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    v12 = v11;
    objc_getAssociatedObject(v9, (const void *)~v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = ((objc_msgSend(v13, "unsignedIntegerValue") + 1) ^ (v12 + 1)) & 1;
    objc_msgSend(v8, "setBool:forKey:", v14, CFSTR("news_url_resolution_subscription_status"));

  }
}

- (FCBundleSubscriptionManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCBundleSubscriptionManager init]";
    v9 = 2080;
    v10 = "FCBundleSubscriptionManager.m";
    v11 = 1024;
    v12 = 68;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCBundleSubscriptionManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCBundleSubscriptionManager)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4 cloudContext:(id)a5 contentContext:(id)a6 appActivityMonitor:(id)a7 entitlementsProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FCBundleSubscriptionManager *v20;
  FCBundleSubscriptionManager *v21;
  uint64_t v22;
  NSHashTable *observers;
  NFMutexLock *v24;
  NFMutexLock *accessLock;
  FCKeyValueStore *v26;
  FCKeyValueStore *localStore;
  FCBundleSubscriptionLookUpEntryManager *v28;
  FCBundleSubscriptionLookUpEntryManager *bundleSubscriptionLookupEntryManager;
  id *v30;
  FCBundleChannelProviderType *bundleChannelProvider;
  FCAsyncSerialQueue *v32;
  FCAsyncSerialQueue *refreshQueue;
  void *v34;
  void *v35;
  uint64_t v36;
  FCBundleChannelProviderType *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;
  _BYTE buf[24];
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v63 = v19;
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataDirectory != nil");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCBundleSubscriptionManager initWithPrivateDataDirectory:configurationManager:cloudContext:co"
                         "ntentContext:appActivityMonitor:entitlementsProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCBundleSubscriptionManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v67) = 78;
    WORD2(v67) = 2114;
    *(_QWORD *)((char *)&v67 + 6) = v57;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v19 = v63;
    if (v63)
      goto LABEL_6;
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v64 = v19;
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "entitlementsProvider != nil");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCBundleSubscriptionManager initWithPrivateDataDirectory:configurationManager:cloudContext:co"
                         "ntentContext:appActivityMonitor:entitlementsProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCBundleSubscriptionManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v67) = 79;
    WORD2(v67) = 2114;
    *(_QWORD *)((char *)&v67 + 6) = v58;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v19 = v64;
  }
LABEL_6:
  v65.receiver = self;
  v65.super_class = (Class)FCBundleSubscriptionManager;
  v20 = -[FCBundleSubscriptionManager init](&v65, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_configurationManager, a4);
    objc_storeStrong((id *)&v21->_bundleEntitlementsProvider, a8);
    objc_storeStrong((id *)&v21->_contentContext, a6);
    v21->_hasRunEntitlementOnce = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v22 = objc_claimAutoreleasedReturnValue();
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v22;

    v24 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E0D60AE0]);
    accessLock = v21->_accessLock;
    v21->_accessLock = v24;

    v26 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:]([FCKeyValueStore alloc], "initWithName:directory:version:options:classRegistry:", CFSTR("BundleSubscription"), v14, 1, 0, 0);
    localStore = v21->_localStore;
    v21->_localStore = v26;

    v28 = -[FCBundleSubscriptionLookUpEntryManager initWithLocalStore:]([FCBundleSubscriptionLookUpEntryManager alloc], "initWithLocalStore:", v21->_localStore);
    bundleSubscriptionLookupEntryManager = v21->_bundleSubscriptionLookupEntryManager;
    v21->_bundleSubscriptionLookupEntryManager = v28;

    v30 = -[FCBundleChannelProvider initWithLocalStore:appActivityMonitor:configurationManager:contentContext:]([FCBundleChannelProvider alloc], v21->_localStore, v18, v15, v17);
    bundleChannelProvider = v21->_bundleChannelProvider;
    v21->_bundleChannelProvider = (FCBundleChannelProviderType *)v30;

    -[FCBundleChannelProviderType setDelegate:](v21->_bundleChannelProvider, "setDelegate:", v21);
    v32 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
    refreshQueue = v21->_refreshQueue;
    v21->_refreshQueue = v32;

    -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](v21->_bundleSubscriptionLookupEntryManager, "bundleSubscriptionLookUpEntry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v62 = v19;
    if (!v34)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke;
      *(_QWORD *)&v67 = &unk_1E463AB18;
      *((_QWORD *)&v67 + 1) = v21;
      __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke((uint64_t)buf);
LABEL_20:

      objc_msgSend(v16, "networkReachability");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObserver:", v21);

      objc_msgSend(v18, "addObserver:", v21);
      v19 = v62;
      goto LABEL_21;
    }
    if (!objc_msgSend(v34, "purchaseValidationState"))
    {
      objc_msgSend(v35, "bundleSubscription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, v47);
      v48 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        -[FCBundleSubscriptionManager cachedSubscription](v21, "cachedSubscription");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "debugDescription");
        v61 = v17;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v51;
        _os_log_impl(&dword_1A1B90000, v49, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription state valid: %{public}@", buf, 0xCu);

        v17 = v61;
      }

      goto LABEL_20;
    }
    v59 = v15;
    v60 = v17;
    v36 = objc_msgSend(v35, "purchaseValidationState");
    v37 = v21->_bundleChannelProvider;
    -[FCBundleChannelProviderType bundleChannelIDs](v37, "bundleChannelIDs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 == 1)
    {
      +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 2, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39 + 132);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -132 - v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject((id)v39, (const void *)(v39 + 1), v40, (void *)1);
      objc_setAssociatedObject((id)v39, (const void *)(-133 - v39), v41, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, (void *)v39);
      v42 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        -[FCBundleSubscriptionManager cachedSubscription](v21, "cachedSubscription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "debugDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v45;
        v46 = "Cache bundle subscription state expired: %{public}@";
LABEL_18:
        _os_log_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

      }
    }
    else
    {
      +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 3, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39 + 139);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -139 - v39);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject((id)v39, (const void *)(v39 + 1), v52, (void *)1);
      objc_setAssociatedObject((id)v39, (const void *)(-140 - v39), v53, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, (void *)v39);
      v54 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v54;
        -[FCBundleSubscriptionManager cachedSubscription](v21, "cachedSubscription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "debugDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v45;
        v46 = "Cache bundle subscription state not subscribed: %{public}@";
        goto LABEL_18;
      }
    }

    v15 = v59;
    v17 = v60;
    goto LABEL_20;
  }
LABEL_21:

  return v21;
}

- (void)activityObservingApplicationDidEnterBackground
{
  FCBundleSubscriptionManager *v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  -[FCBundleSubscriptionManager cleanupStaleExpiredEntry](self, "cleanupStaleExpiredEntry");
  if (NFInternalBuild())
  {
    if (v2)
    {
      FCPersistenceQueue();
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke;
      block[3] = &unk_1E463AB18;
      block[4] = v2;
      dispatch_async(v3, block);

    }
  }
}

void __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  uint8_t buf[4];
  id v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2;
  v32[3] = &unk_1E463ADC8;
  v32[4] = *(_QWORD *)(a1 + 32);
  __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2((uint64_t)v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v3;
  v35[0] = CFSTR("state");
  v35[1] = CFSTR("bundleChannels");
  objc_msgSend(*(id *)(a1 + 32), "bundleSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v6;
  v35[2] = CFSTR("lastUpdated");
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%f"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 1, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  v14 = v13;
  if (v12)
  {
    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v17 = *(void **)(v16 + 32);
    else
      v17 = 0;
    objc_msgSend(v17, "storeDirectory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("bundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathExtension:", CFSTR("json"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v14;
      v23 = objc_msgSend(v12, "writeToFile:options:error:", v22, 1, &v29);
      v24 = v29;

      v25 = FCPersonalizationLog;
      if (v23)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
        {
          v26 = v25;
          objc_msgSend(v21, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v27;
          _os_log_debug_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_DEBUG, "Successfully saved readable bundle data at %@.", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_error_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_ERROR, "Error when saving readable bundle data: %@", buf, 0xCu);
      }
      v14 = v24;
    }
    else
    {
      v28 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable bundle data", buf, 2u);
      }
    }

  }
  else
  {
    v30[0] = v2;
    v30[1] = 3221225472;
    v30[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3;
    v30[3] = &unk_1E463AB18;
    v30[4] = v13;
    __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3((uint64_t)v30);
  }

}

const __CFString *__54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "bundleSubscription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unprotectedSubscriptionState");

  if (v2 > 2)
    return CFSTR("unsubscribed");
  else
    return off_1E463E580[v2];
}

void __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable bundle data: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bundleChannelProvider:(id)a3 bundleChannelIDsDidChangeWithChannelIDs:(id)a4 version:(id)a5
{
  id v7;
  id v8;
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
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "bundleChannelIDsDidChangeWithChannelIDs  bundleSubscription= %@", (uint8_t *)&v19, 0xCu);

  }
  -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = (void *)MEMORY[0x1E0C99E40];
  v16 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v15, "orderedSetWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleChannelIDs:", v17);

  v18 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v14, "setBundleChannelIDsVersion:", v18);

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, v14);
}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%@ ignoring bundle entitlement check for bundleID=%{public}@", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_57(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2_58;
  v3[3] = &unk_1E463B2D0;
  v2 = *(id *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  FCPerformBlockOnMainThread(v3);

}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2_58(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedSubscription");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_5;
  v3[3] = &unk_1E463B2D0;
  v2 = *(id *)(a1 + 48);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  FCPerformBlockOnMainThread(v3);

}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedSubscription");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v5, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "Did refresh bundle subscription with duration=%llums", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_60;
  v9[3] = &unk_1E463B2D0;
  v7 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  FCPerformBlockOnMainThread(v9);

}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_60(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v8 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    v11 = 134217984;
    v12 = objc_msgSend(v9, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Spent %llums fetching entitlements for bundle subscription", (uint8_t *)&v11, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_65(uint64_t a1)
{
  id WeakRetained;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2;
  v5[3] = &unk_1E463E510;
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 88);
  v4 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v3 = (id)v4;
  v6 = v4;
  FCPerformIfNonNil(WeakRetained, v5);

}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cachedSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", FCEntitlementsNotFoundErrorDateDate);

    v7 = *(_QWORD *)(a1 + 32);
    v72 = (uint64_t)v3;
    if (v7)
      v8 = *(void **)(v7 + 72);
    else
      v8 = 0;
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paidBundleViaOfferConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vendorAdHocOfferIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "vendorAdHocOfferID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v11;
    v71 = v5;
    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "vendorAdHocOfferID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "containsObject:", v13);

    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundlePurchaseID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod");
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "initialPurchaseTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    FCBundleSubscriptionMakeInline(v21, v22, v23, v24, v25, v26, v27, v14, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      objc_msgSend(v29, "debugDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v32;
      _os_log_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription bundleSubscription= %@", buf, 0xCu);

    }
    v5 = v71;
    v33 = (id)v71;
    objc_getAssociatedObject(v33, (const void *)(v71 + 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
    v36 = v35;
    objc_getAssociatedObject(v33, (const void *)~v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (objc_msgSend(v37, "unsignedIntegerValue") + 1) ^ (v36 + 1);
    if ((v38 & 1) != 0)
    {
      v50 = v70;
      if ((objc_msgSend(v33, "isEqual:", v29) & 1) == 0)
      {
        v51 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          objc_msgSend(v33, "debugDescription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "debugDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v53;
          v75 = 2114;
          v76 = v54;
          _os_log_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_DEFAULT, "Checked cachedSubscription: %{public}@ is not equal to bundleSubscription: %{public}@", buf, 0x16u);

        }
        if (v72)
          v55 = *(void **)(v72 + 40);
        else
          v55 = 0;
        objc_msgSend(v55, "bundleSubscriptionLookUpEntry");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v56, "mutableCopy");

        if (v57)
        {
          objc_msgSend(v57, "setBundleChannelIDs:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          objc_msgSend(v57, "setBundleChannelIDsVersion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundlePurchaseID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setPurchaseID:", v58);

          objc_msgSend(v57, "setInTrialPeriod:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod"));
          objc_msgSend(v57, "setIsPurchaser:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser"));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setServicesBundlePurchaseID:", v59);

          objc_msgSend(v57, "setIsAmplifyUser:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser"));
          objc_msgSend(v57, "setIsPaidBundleViaOfferActivated:", v14);
          if (v72)
            v60 = *(void **)(v72 + 40);
          else
            v60 = 0;
          objc_msgSend(v60, "updateEntry:", v57);
        }
        v61 = (void *)objc_msgSend(v29, "copy");
        v62 = (void *)objc_msgSend(v33, "copy");
        -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v29);
        -[FCBundleSubscriptionManager notifyObserversForChangeStateWithNewSubscription:previousBundleSubscription:](v72, v61, v62);

      }
    }
    else
    {
      v39 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_INFO, "Bundle subscription did subscribe", buf, 2u);
      }
      v68 = v29;
      v69 = v14;
      if (v72)
        v40 = *(void **)(v72 + 40);
      else
        v40 = 0;
      v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v43 = v40;
      objc_msgSend(v42, "bundlePurchaseID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod");
      v46 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "initialPurchaseTimestamp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v66) = v69;
      LOBYTE(v65) = v48;
      objc_msgSend(v43, "addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", v67, v41, v44, v45, v46, v47, v65, v49, v66);

      v29 = v68;
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v68);
      -[FCBundleSubscriptionManager notifyObserversForSubscribedStateWithSubscription:hideBundleDetectionUI:](v72, v68, *(_BYTE *)(a1 + 80));
      v50 = v70;
      v5 = v71;
    }

    v3 = (id)v72;
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code") != 5002)
      goto LABEL_41;
    v15 = (id)v5;
    objc_getAssociatedObject(v15, (const void *)(v5 + 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    v18 = v17;
    objc_getAssociatedObject(v15, (const void *)~v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v15) = objc_msgSend(v19, "unsignedIntegerValue") ^ v18;
    if ((v15 & 1) != 0)
    {
      -[FCBundleSubscriptionManager expireBundleSubscription]((id *)v3);
    }
    else
    {
LABEL_41:
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code") == 3001)
      {
        v20 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription failed with timeout error. Maintaining the same state as before", buf, 2u);
        }
      }
    }
  }
  -[FCBundleSubscriptionManager updateHasRunEntitlementOnce:]((uint64_t)v3);
  v63 = *(_QWORD *)(a1 + 40);
  if (v63)
  {
    objc_msgSend(v3, "cachedSubscription");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v64);

  }
}

- (void)notifyObserversForSubscribedStateWithSubscription:(char)a3 hideBundleDetectionUI:
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __103__FCBundleSubscriptionManager_notifyObserversForSubscribedStateWithSubscription_hideBundleDetectionUI___block_invoke;
    v7[3] = &unk_1E463B200;
    v7[4] = a1;
    v8 = v5;
    v9 = a3;
    FCPerformBlockOnMainThread(v7);

  }
}

- (void)notifyObserversForChangeStateWithNewSubscription:(void *)a3 previousBundleSubscription:
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __107__FCBundleSubscriptionManager_notifyObserversForChangeStateWithNewSubscription_previousBundleSubscription___block_invoke;
    v7[3] = &unk_1E463B228;
    v7[4] = a1;
    v8 = v5;
    v9 = v6;
    FCPerformBlockOnMainThread(v7);

  }
}

- (void)expireBundleSubscription
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  if (a1)
  {
    v2 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_INFO, "Bundle subscription did expire", v14, 2u);
    }
    objc_msgSend(a1[5], "bundleSubscriptionLookUpEntry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDateOfExpiration:", v5);

      objc_msgSend(v4, "setPurchaseValidationState:", 1);
      objc_msgSend(a1[5], "updateEntry:", v4);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", FCEntitlementsCacheExpiredErrorDateDate);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", FCEntitlementsNotFoundErrorDateDate);

    v8 = a1[8];
    objc_msgSend(v8, "bundleChannelIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 2, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + 452);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -452 - v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject((id)v10, (const void *)(v10 + 1), v11, (void *)1);
    objc_setAssociatedObject((id)v10, (const void *)(-453 - v10), v12, (void *)1);

    -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)a1, (void *)v10);
    objc_msgSend(a1, "cachedSubscription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)a1, v13);

  }
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_68(uint64_t a1)
{
  id WeakRetained;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2_69;
  v5[3] = &unk_1E463E510;
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 88);
  v4 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v3 = (id)v4;
  v6 = v4;
  FCPerformIfNonNil(WeakRetained, v5);

}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cachedSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", FCEntitlementsNotFoundErrorDateDate);

    v7 = *(_QWORD *)(a1 + 32);
    v72 = (uint64_t)v3;
    if (v7)
      v8 = *(void **)(v7 + 72);
    else
      v8 = 0;
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paidBundleViaOfferConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vendorAdHocOfferIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "vendorAdHocOfferID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v11;
    v71 = v5;
    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "vendorAdHocOfferID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "containsObject:", v13);

    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundlePurchaseID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod");
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "initialPurchaseTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    FCBundleSubscriptionMakeInline(v21, v22, v23, v24, v25, v26, v27, v14, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      objc_msgSend(v29, "debugDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v32;
      _os_log_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription bundleSubscription= %@", buf, 0xCu);

    }
    v5 = v71;
    v33 = (id)v71;
    objc_getAssociatedObject(v33, (const void *)(v71 + 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
    v36 = v35;
    objc_getAssociatedObject(v33, (const void *)~v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (objc_msgSend(v37, "unsignedIntegerValue") + 1) ^ (v36 + 1);
    if ((v38 & 1) != 0)
    {
      v50 = v70;
      if ((objc_msgSend(v33, "isEqual:", v29) & 1) == 0)
      {
        v51 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          objc_msgSend(v33, "debugDescription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "debugDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v53;
          v75 = 2114;
          v76 = v54;
          _os_log_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_DEFAULT, "Checked cachedSubscription: %{public}@ is not equal to bundleSubscription: %{public}@", buf, 0x16u);

        }
        if (v72)
          v55 = *(void **)(v72 + 40);
        else
          v55 = 0;
        objc_msgSend(v55, "bundleSubscriptionLookUpEntry");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v56, "mutableCopy");

        if (v57)
        {
          objc_msgSend(v57, "setBundleChannelIDs:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          objc_msgSend(v57, "setBundleChannelIDsVersion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundlePurchaseID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setPurchaseID:", v58);

          objc_msgSend(v57, "setInTrialPeriod:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod"));
          objc_msgSend(v57, "setIsPurchaser:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser"));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setServicesBundlePurchaseID:", v59);

          objc_msgSend(v57, "setIsAmplifyUser:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser"));
          objc_msgSend(v57, "setIsPaidBundleViaOfferActivated:", v14);
          if (v72)
            v60 = *(void **)(v72 + 40);
          else
            v60 = 0;
          objc_msgSend(v60, "updateEntry:", v57);
        }
        v61 = (void *)objc_msgSend(v29, "copy");
        v62 = (void *)objc_msgSend(v33, "copy");
        -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v29);
        -[FCBundleSubscriptionManager notifyObserversForChangeStateWithNewSubscription:previousBundleSubscription:](v72, v61, v62);

      }
    }
    else
    {
      v39 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_INFO, "Bundle subscription did subscribe", buf, 2u);
      }
      v68 = v29;
      v69 = v14;
      if (v72)
        v40 = *(void **)(v72 + 40);
      else
        v40 = 0;
      v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v43 = v40;
      objc_msgSend(v42, "bundlePurchaseID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "inTrialPeriod");
      v46 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isPurchaser");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "servicesBundlePurchaseID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isAmplifyUser");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "initialPurchaseTimestamp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v66) = v69;
      LOBYTE(v65) = v48;
      objc_msgSend(v43, "addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", v67, v41, v44, v45, v46, v47, v65, v49, v66);

      v29 = v68;
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v68);
      -[FCBundleSubscriptionManager notifyObserversForSubscribedStateWithSubscription:hideBundleDetectionUI:](v72, v68, *(_BYTE *)(a1 + 80));
      v50 = v70;
      v5 = v71;
    }

    v3 = (id)v72;
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code") != 5002)
      goto LABEL_41;
    v15 = (id)v5;
    objc_getAssociatedObject(v15, (const void *)(v5 + 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    v18 = v17;
    objc_getAssociatedObject(v15, (const void *)~v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v15) = objc_msgSend(v19, "unsignedIntegerValue") ^ v18;
    if ((v15 & 1) != 0)
    {
      -[FCBundleSubscriptionManager expireBundleSubscription]((id *)v3);
    }
    else
    {
LABEL_41:
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code") == 3001)
      {
        v20 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription failed with timeout error. Maintaining the same state as before", buf, 2u);
        }
      }
    }
  }
  -[FCBundleSubscriptionManager updateHasRunEntitlementOnce:]((uint64_t)v3);
  v63 = *(_QWORD *)(a1 + 40);
  if (v63)
  {
    objc_msgSend(v3, "cachedSubscription");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v64);

  }
}

- (void)notifyObserversForExpiredStateWithSubscription:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__FCBundleSubscriptionManager_notifyObserversForExpiredStateWithSubscription___block_invoke;
    v5[3] = &unk_1E463AD10;
    v5[4] = a1;
    v6 = v3;
    FCPerformBlockOnMainThread(v5);

  }
}

- (void)clearBundleSubscription
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  char v12;
  FCBundleSubscriptionLookUpEntryManager *bundleSubscriptionLookupEntryManager;
  void *v14;
  void *v15;
  void *v16;
  FCBundleSubscriptionLookUpEntryManager *v17;
  FCBundleChannelProviderType *bundleChannelProvider;
  FCBundleChannelProviderType *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "clearBundleSubscription cachedSubscription=%@", (uint8_t *)&v25, 0xCu);

  }
  -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v7, (const void *)(v7 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = v9;
  objc_getAssociatedObject((id)v7, (const void *)~v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue") ^ v10;

  if ((v12 & 1) != 0)
  {
    if (self)
      bundleSubscriptionLookupEntryManager = self->_bundleSubscriptionLookupEntryManager;
    else
      bundleSubscriptionLookupEntryManager = 0;
    -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](bundleSubscriptionLookupEntryManager, "bundleSubscriptionLookUpEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDateOfExpiration:", v16);

      objc_msgSend(v15, "setPurchaseValidationState:", 1);
      objc_msgSend(v15, "setHasShownRenewalNotice:", 1);
      if (self)
        v17 = self->_bundleSubscriptionLookupEntryManager;
      else
        v17 = 0;
      -[FCBundleSubscriptionLookUpEntryManager updateEntry:](v17, "updateEntry:", v15);
    }
    if (self)
      bundleChannelProvider = self->_bundleChannelProvider;
    else
      bundleChannelProvider = 0;
    v19 = bundleChannelProvider;
    -[FCBundleChannelProviderType bundleChannelIDs](v19, "bundleChannelIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 2, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21 + 474);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -474 - v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject((id)v21, (const void *)(v21 + 1), v22, (void *)1);
    objc_setAssociatedObject((id)v21, (const void *)(-475 - v21), v23, (void *)1);

    -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, (void *)v21);
    -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)self, v24);

  }
}

- (id)bundleSubscriptionLookupEntry
{
  if (self)
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  return (id)-[FCBundleSubscriptionManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry");
}

- (void)renewalNoticeShownWithPurchaseID:(id)a3
{
  FCBundleSubscriptionManager *v3;
  void *v4;
  void *v5;
  FCBundleSubscriptionLookUpEntryManager *bundleSubscriptionLookupEntryManager;
  id v7;

  v3 = self;
  if (self)
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  -[FCBundleSubscriptionManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setHasShownRenewalNotice:", 1);
    if (v3)
      bundleSubscriptionLookupEntryManager = v3->_bundleSubscriptionLookupEntryManager;
    else
      bundleSubscriptionLookupEntryManager = 0;
    -[FCBundleSubscriptionLookUpEntryManager updateEntry:](bundleSubscriptionLookupEntryManager, "updateEntry:", v7);
    v5 = v7;
  }

}

- (void)prewarmBundleTagIDsWithPurchaseID:(id)a3
{
  id v4;
  FCPurchaseLookupFetchOperation *v5;
  void *v6;
  FCContentContext *contentContext;
  FCPurchaseLookupFetchOperation *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [FCPurchaseLookupFetchOperation alloc];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    contentContext = self->_contentContext;
  else
    contentContext = 0;
  v8 = -[FCPurchaseLookupFetchOperation initWithPurchaseIDs:contentContext:](v5, "initWithPurchaseIDs:contentContext:", v6, contentContext);

  -[FCOperation setQualityOfService:](v8, "setQualityOfService:", 25);
  -[FCOperation setRelativePriority:](v8, "setRelativePriority:", 1);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v8);

}

- (void)forceExpireBundleSubscriptionBasedOnInternalSettings
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  FCBundleSubscriptionLookUpEntryManager *bundleSubscriptionLookupEntryManager;
  void *v10;
  void *v11;
  void *v12;
  FCBundleSubscriptionLookUpEntryManager *v13;
  FCBundleChannelProviderType *bundleChannelProvider;
  FCBundleChannelProviderType *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (NFInternalBuild())
  {
    v3 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "forceExpireBundleSubscriptionBasedOnInternalSettings  cachedSubscription=%@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("newssubscription.bundle_subscriptions.force_expire_bundle_subscriptions"));

    if (v8)
    {
      if (self)
        bundleSubscriptionLookupEntryManager = self->_bundleSubscriptionLookupEntryManager;
      else
        bundleSubscriptionLookupEntryManager = 0;
      -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](bundleSubscriptionLookupEntryManager, "bundleSubscriptionLookUpEntry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDateOfExpiration:", v12);

        objc_msgSend(v11, "setPurchaseValidationState:", 1);
        if (self)
          v13 = self->_bundleSubscriptionLookupEntryManager;
        else
          v13 = 0;
        -[FCBundleSubscriptionLookUpEntryManager updateEntry:](v13, "updateEntry:", v11);
      }
      if (self)
        bundleChannelProvider = self->_bundleChannelProvider;
      else
        bundleChannelProvider = 0;
      v15 = bundleChannelProvider;
      -[FCBundleChannelProviderType bundleChannelIDs](v15, "bundleChannelIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 2, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 569);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -569 - v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject((id)v17, (const void *)(v17 + 1), v18, (void *)1);
      objc_setAssociatedObject((id)v17, (const void *)(-570 - v17), v19, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, (void *)v17);
      -[FCBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)self, v20);

    }
  }
}

- (void)silentExpireBundleSubscription
{
  FCBundleSubscriptionManager *v2;
  void *v3;
  void *v4;
  FCBundleSubscriptionLookUpEntryManager *bundleSubscriptionLookupEntryManager;
  FCBundleChannelProviderType *bundleChannelProvider;
  FCBundleChannelProviderType *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = self;
  if (self)
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  -[FCBundleSubscriptionManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "mutableCopy");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDateOfExpiration:", v4);

    objc_msgSend(v13, "setPurchaseValidationState:", 1);
    objc_msgSend(v13, "setHasShownRenewalNotice:", 1);
    if (v2)
      bundleSubscriptionLookupEntryManager = v2->_bundleSubscriptionLookupEntryManager;
    else
      bundleSubscriptionLookupEntryManager = 0;
    -[FCBundleSubscriptionLookUpEntryManager updateEntry:](bundleSubscriptionLookupEntryManager, "updateEntry:", v13);
  }
  if (v2)
    bundleChannelProvider = v2->_bundleChannelProvider;
  else
    bundleChannelProvider = 0;
  v7 = bundleChannelProvider;
  -[FCBundleChannelProviderType bundleChannelIDs](v7, "bundleChannelIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 2, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 + 586);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -586 - v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject((id)v9, (const void *)(v9 + 1), v10, (void *)1);
  objc_setAssociatedObject((id)v9, (const void *)(-587 - v9), v11, (void *)1);

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v2, (void *)v9);
  -[FCBundleSubscriptionManager cachedSubscription](v2, "cachedSubscription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)v2, v12);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    -[NSHashTable removeObject:](observers, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCBundleSubscriptionManager removeObserver:]";
    v9 = 2080;
    v10 = "FCBundleSubscriptionManager.m";
    v11 = 1024;
    v12 = 615;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

void __103__FCBundleSubscriptionManager_notifyObserversForSubscribedStateWithSubscription_hideBundleDetectionUI___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "bundleSubscriptionDidSubscribe:", *(_QWORD *)(a1 + 40), (_QWORD)v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "bundleSubscriptionDidSubscribe:hideBundleDetectionUI:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __78__FCBundleSubscriptionManager_notifyObserversForExpiredStateWithSubscription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "bundleSubscriptionDidExpire:", *(_QWORD *)(a1 + 40), (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __107__FCBundleSubscriptionManager_notifyObserversForChangeStateWithNewSubscription_previousBundleSubscription___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "bundleSubscriptionDidChange:previousBundleSubscription:", a1[5], a1[6], (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)networkReachabilityDidChange:(id)a3
{
  FCBundleChannelProviderType *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  FCBundleChannelProviderType *bundleChannelProvider;
  uint8_t v9[16];

  if (objc_msgSend(a3, "isNetworkReachable"))
  {
    v4 = self ? self->_bundleChannelProvider : 0;
    -[FCBundleChannelProviderType bundleChannelIDs](v4, "bundleChannelIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v7 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "bundleChannelIDs list found empty.Initiating download for bundle channelIds list", v9, 2u);
      }
      if (self)
        bundleChannelProvider = self->_bundleChannelProvider;
      else
        bundleChannelProvider = 0;
      -[FCBundleChannelProviderType loadInitialBundleChannelIDsWithCompletion:](bundleChannelProvider, "loadInitialBundleChannelIDsWithCompletion:", &__block_literal_global_90_0);
    }
  }
}

void __60__FCBundleSubscriptionManager_networkReachabilityDidChange___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A1B90000, v0, OS_LOG_TYPE_DEFAULT, "Successfully downloaded bundleChannelIDs list", v1, 2u);
  }
}

- (void)setCachedSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSubscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscription, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleChannelProvider, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionLookupEntryManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_bundleEntitlementsProvider, 0);
}

@end
