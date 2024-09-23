@implementation IKJSITunesStore

- (id)asPrivateIKJSITunesStore
{
  IKJSITunesStore *v3;

  if (-[IKJSITunesStore conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01EB1F8))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (void)setITunesStoreHeaders:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  if (MGGetSInt32Answer() == 4)
  {
    objc_msgSend(v17, "HTTPHeaders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("X-Apple-TV-Resolution"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;

      if (v7 == 1080.0)
        v8 = CFSTR("1080");
      else
        v8 = CFSTR("720");
      objc_msgSend(v17, "setValue:forHTTPHeaderField:", v8, CFSTR("X-Apple-TV-Resolution"));
    }
    objc_msgSend(v17, "HTTPHeaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("X-Apple-TV-Version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "infoDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-TV-Version"));

    }
    objc_msgSend(v17, "HTTPHeaders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0DAFA60];
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0DAFA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("ATV"), v15);
  }

}

+ (void)setHeadersForURL:(id)a3 inRequestProperties:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  v5 = a3;
  +[IKURLBagCache sharedCache](IKURLBagCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrustedURL:", v5);

  if (v7)
    objc_msgSend((id)objc_opt_class(), "setITunesStoreHeaders:", v8);

}

- (IKJSITunesStore)initWithAppContext:(id)a3
{
  return -[IKJSITunesStore initWithAppContext:urlBagCache:](self, "initWithAppContext:urlBagCache:", a3, 0);
}

- (IKJSITunesStore)initWithAppContext:(id)a3 urlBagCache:(id)a4
{
  id v6;
  id v7;
  IKJSITunesStore *v8;
  SSMetricsController *v9;
  SSMetricsController *metricsController;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *lastAccountDSID;
  void *v15;
  void *v16;
  IKURLBagCache *bagCache;
  uint64_t v18;
  uint64_t v19;
  id urlBagCacheUpdateToken;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id ssAccountStoreChangedToken;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id subscriptionStatusDidChangeToken;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)IKJSITunesStore;
  v8 = -[IKJSObject initWithAppContext:](&v39, sel_initWithAppContext_, v6);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = (SSMetricsController *)objc_alloc_init(MEMORY[0x1E0DAF570]);
    metricsController = v8->_metricsController;
    v8->_metricsController = v9;

    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    lastAccountDSID = v8->_lastAccountDSID;
    v8->_lastAccountDSID = (NSNumber *)v13;

    v15 = v7;
    if (!v7)
    {
      +[IKURLBagCache sharedCache](IKURLBagCache, "sharedCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_bagCache, v15);
    if (!v7)

    -[IKJSITunesStore _bagCacheUpdated](v8, "_bagCacheUpdated");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    bagCache = v8->_bagCache;
    v18 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke;
    v36[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", CFSTR("IKURLBagCacheUpdatedNotification"), bagCache, 0, v36);
    v19 = objc_claimAutoreleasedReturnValue();
    urlBagCacheUpdateToken = v8->_urlBagCacheUpdateToken;
    v8->_urlBagCacheUpdateToken = (id)v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0DAF718];
    v34[0] = v18;
    v34[1] = 3221225472;
    v34[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_3;
    v34[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", v23, v22, 0, v34);
    v24 = objc_claimAutoreleasedReturnValue();
    ssAccountStoreChangedToken = v8->_ssAccountStoreChangedToken;
    v8->_ssAccountStoreChangedToken = (id)v24;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0DAFD88];
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_5;
    v32[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", v28, v27, 0, v32);
    v29 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusDidChangeToken = v8->_subscriptionStatusDidChangeToken;
    v8->_subscriptionStatusDidChangeToken = (id)v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_2;
    v8[3] = &unk_1E9F4BE58;
    objc_copyWeak(&v9, v4);
    objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

    objc_destroyWeak(&v9);
  }

}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_bagCacheUpdated");
    WeakRetained = v2;
  }

}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_4;
    v8[3] = &unk_1E9F4BE58;
    objc_copyWeak(&v9, v4);
    objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

    objc_destroyWeak(&v9);
  }

}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_accountStoreChanged");
    WeakRetained = v2;
  }

}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_6;
    v8[3] = &unk_1E9F4CB00;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

    objc_destroyWeak(&v10);
  }

}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastKnownStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_subscriptionStatusDidChanged:", v3);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_urlBagCacheUpdateToken);
  objc_msgSend(v3, "removeObserver:", self->_ssAccountStoreChangedToken);
  objc_msgSend(v3, "removeObserver:", self->_subscriptionStatusDidChangeToken);

  v4.receiver = self;
  v4.super_class = (Class)IKJSITunesStore;
  -[IKJSITunesStore dealloc](&v4, sel_dealloc);
}

- (NSString)userAgent
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DAF4A0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)networkConnectionType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionTypeHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storefront
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SSVStoreFrontIdentifierForAccount();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setStorefront:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DAF4A0];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoreFrontIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setStoreFrontIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveAccount:error:", v7, 0);

}

- (id)eligibilityForService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastKnownStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IKJSITunesStore _subscriptionStatusDictionaryWithStatus:isFinal:](self, "_subscriptionStatusDictionaryWithStatus:isFinal:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getServiceEligibility:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  IKJSITunesStore *v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)v8;
  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "objectForKey:", CFSTR("ignoreCache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v12, "BOOLValue"))
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAFD90]);
  objc_msgSend(v6, "objectForKey:", CFSTR("reason"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "isEqualToString:", CFSTR("deepLink")))
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0DAFDA0], *MEMORY[0x1E0DAFD98]);
  objc_msgSend(v6, "objectForKey:", CFSTR("partialResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v14, "BOOLValue");
  else
    v15 = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __42__IKJSITunesStore_getServiceEligibility::__block_invoke;
  v22[3] = &unk_1E9F4CB50;
  objc_copyWeak(&v27, &location);
  v17 = v12;
  v28 = v15;
  v23 = v17;
  v24 = self;
  v18 = v21;
  v25 = v18;
  v19 = v10;
  v26 = v19;
  objc_msgSend(v16, "getStatusWithOptions:statusBlock:", v11, v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __42__IKJSITunesStore_getServiceEligibility::__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28[2];
  char v29;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v8 && !*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastKnownStatus");
      v21 = objc_claimAutoreleasedReturnValue();

      v10 = 1;
      v7 = (id)v21;
      if (v21)
        goto LABEL_9;
      goto LABEL_26;
    }
    if ((a3 & 1) != 0)
    {
      v10 = 1;
      if (!v7)
        goto LABEL_26;
LABEL_9:
      v11 = objc_msgSend(v7, "accountStatus");
      v12 = objc_msgSend(v7, "carrierBundlingStatus");
      v14 = v11 != 2 || v12 != 2;
      v16 = v12 == 4 || v12 == 1 || v11 == 3;
      v17 = v14 << 63 >> 63;
      if (v16)
        v18 = 1;
      else
        v18 = v17;
      objc_msgSend(*(id *)(a1 + 40), "_subscriptionStatusDictionaryWithStatus:isFinal:", v7, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (*(_BYTE *)(a1 + 72))
    {
      v10 = 0;
      if (v7)
        goto LABEL_9;
LABEL_26:
      v19 = 0;
      v18 = -1;
LABEL_27:
      objc_msgSend(WeakRetained, "appContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __42__IKJSITunesStore_getServiceEligibility::__block_invoke_2;
      v24[3] = &unk_1E9F4CB28;
      objc_copyWeak(v28, (id *)(a1 + 64));
      v25 = *(id *)(a1 + 48);
      v28[1] = (id)v18;
      v23 = v19;
      v26 = v23;
      v29 = v10;
      v27 = *(id *)(a1 + 56);
      objc_msgSend(v22, "evaluate:completionBlock:", v24, 0);

      objc_destroyWeak(v28);
    }
  }

}

void __42__IKJSITunesStore_getServiceEligibility::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v5 = *(void **)(a1 + 40);
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "callWithArguments:", v7);

    if (!v5)
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
  }

}

- (id)makeStoreXMLHttpRequest
{
  IKJSXMLHTTPRequest *v3;
  void *v4;
  IKJSXMLHTTPRequest *v5;

  v3 = [IKJSXMLHTTPRequest alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSXMLHTTPRequest initWithAppContext:jingleRequest:](v3, "initWithAppContext:jingleRequest:", v4, 1);

  return v5;
}

- (void)recordEvent:(id)a3 :(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0DAF578];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setTopic:", v8);

  objc_msgSend(v9, "addPropertiesWithDictionary:", v7);
  -[SSMetricsController insertEvent:withCompletionHandler:](self->_metricsController, "insertEvent:withCompletionHandler:", v9, 0);

}

- (void)flushUnreportedEvents
{
  dispatch_semaphore_t v3;
  SSMetricsController *metricsController;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  metricsController = self->_metricsController;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__IKJSITunesStore_flushUnreportedEvents__block_invoke;
  v6[3] = &unk_1E9F4CB78;
  v7 = v3;
  v5 = v3;
  -[SSMetricsController flushUnreportedEventsWithCompletionHandler:](metricsController, "flushUnreportedEventsWithCompletionHandler:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __40__IKJSITunesStore_flushUnreportedEvents__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setCookieURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id *p_cookieURL;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CBE0F0], "currentArguments", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "count");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_cookieURL = (id *)&self->_cookieURL;
    v8 = *p_cookieURL;
    *p_cookieURL = 0;

    if (objc_msgSend(v6, "isString"))
    {
      objc_msgSend(v6, "toString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_storeStrong(p_cookieURL, v9);

      }
    }

    v5 = v11;
  }

}

- (id)cookie
{
  __CFString *cookieURL;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[NSString length](self->_cookieURL, "length"))
    cookieURL = (__CFString *)self->_cookieURL;
  else
    cookieURL = CFSTR("http://www.apple.com/");
  v4 = cookieURL;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsFoundation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCookieForURL:useSSCookieStorage:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCookie:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsFoundation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCookie:useSSCookieStorage:", v4, 1);

}

- (void)clearCookies
{
  void *v2;
  id v3;

  -[IKJSObject appContext](self, "appContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsFoundation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearCookies");

}

- (void)loadStoreContent:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = v9;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DAF6B0]);
    objc_msgSend(v11, "setStoreFrontSuffix:", self->_storeFrontSuffix);
    objc_msgSend(v11, "setItemIdentifiers:", v10);
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke;
    v25[3] = &unk_1E9F4CBA0;
    v13 = v11;
    v26 = v13;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v14);
    }
    else
    {
      v14 = 0;
    }
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_2;
    v22[3] = &unk_1E9F4CBF0;
    objc_copyWeak(&v24, &location);
    v17 = v14;
    v23 = v17;
    objc_msgSend(v13, "setResponseBlock:", v22);
    objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v13);

    objc_destroyWeak(&v24);
  }
  else if (v7)
  {
    -[IKJSObject appContext](self, "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[IKJSObject appContext](self, "appContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_4;
      v19[3] = &unk_1E9F4CB00;
      objc_copyWeak(&v21, &location);
      v20 = v7;
      objc_msgSend(v16, "evaluate:completionBlock:", v19, 0);

      objc_destroyWeak(&v21);
    }
  }
  objc_destroyWeak(&location);

}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v5, "length")
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("id")) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setValue:forRequestParameter:", v5, v6);
      }
    }
  }

}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v17 = v6;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = *MEMORY[0x1E0DAFB20];
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0DAFB20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, v9);
    v11 = *MEMORY[0x1E0DAFB80];
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0DAFB80], v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "setObject:forKey:", v12, v11);
    v13 = *MEMORY[0x1E0DAFBC0];
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0DAFBC0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v8, "setObject:forKey:", v14, v13);
    objc_msgSend(WeakRetained, "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_3;
    v19[3] = &unk_1E9F4CBC8;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    v20 = *(id *)(a1 + 32);
    v16 = v8;
    v21 = v16;
    objc_msgSend(v15, "evaluate:completionBlock:", v19, 0);

    objc_destroyWeak(&v22);
    v6 = v18;
  }

}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "callWithArguments:", v6);

    objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
  }

}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setException:withErrorMessage:", 0, CFSTR("loadStoreContent: Dictionary is missing required property 'id'."));

    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", &unk_1E9F8C368);
    WeakRetained = v5;
  }

}

- (void)evaluateScripts:(id)a3 :(id)a4
{
  id v6;
  id v7;
  IKScriptsEvaluator *v8;
  void *v9;
  IKScriptsEvaluator *v10;

  v6 = a4;
  v7 = a3;
  v8 = [IKScriptsEvaluator alloc];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IKScriptsEvaluator initWithScripts:withContext:callback:jingleRequest:](v8, "initWithScripts:withContext:callback:jingleRequest:", v7, v9, v6, 1);

  -[IKScriptsEvaluator evaluate](v10, "evaluate");
}

- (void)updateServiceEligibility:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("carrierBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__IKJSITunesStore_updateServiceEligibility___block_invoke;
    v5[3] = &unk_1E9F4CC18;
    v6 = v3;
    objc_msgSend(v4, "modifyLastKnownStatusUsingBlock:", v5);

  }
}

void __44__IKJSITunesStore_updateServiceEligibility___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("eligible")) & 1) != 0)
  {
    v3 = 1;
LABEL_9:
    v4 = v7;
    goto LABEL_10;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("needsVerification")) & 1) != 0)
  {
    v3 = 3;
    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("notEligible")) & 1) != 0)
  {
    v3 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v3 = 0;
    goto LABEL_9;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("unlinked"));
  v5 = v7;
  if (!v6)
    goto LABEL_11;
  v3 = 4;
  v4 = v7;
LABEL_10:
  objc_msgSend(v4, "setCarrierBundlingStatus:", v3);
  v5 = v7;
LABEL_11:

}

- (void)fetchMarketingItem:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;

  v28 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[IKJSITunesStore bagCache](self, "bagCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDB20], "bagKeySet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profileVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerBagKeySet:forProfile:profileVersion:", v18, v19, v20);

  v27 = v12;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB20]), "initWithBag:clientIdentifier:clientVersion:placement:serviceType:", v16, v28, v12, v13, v14);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ams_activeiTunesAccount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccount:", v23);

  objc_initWeak(&location, self);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v15, v24);
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v21, "perform");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke;
  v30[3] = &unk_1E9F4CC68;
  objc_copyWeak(&v32, &location);
  v26 = v24;
  v31 = v26;
  objc_msgSend(v25, "addFinishBlock:", v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke_2;
    v10[3] = &unk_1E9F4CC40;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    v13 = v5;
    objc_msgSend(v9, "evaluate:completionBlock:", v10, 0);

    objc_destroyWeak(&v14);
  }

}

void __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[2];
  const __CFString *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v12 = CFSTR("message");
      objc_msgSend(*(id *)(a1 + 40), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v4, "callWithArguments:", v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "rawValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v4, "callWithArguments:", v7);
    }

    objc_msgSend(v3, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
  }

}

- (void)openMarketingItem:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v10, v13);
    }
    else
    {
      v13 = 0;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke;
    v16[3] = &unk_1E9F4CCB8;
    v14 = v11;
    v17 = v14;
    v18 = v8;
    v19 = v9;
    objc_copyWeak(&v21, &location);
    v15 = v13;
    v20 = v15;
    objc_msgSend(v14, "evaluateDelegateBlockSync:", v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke_2;
    v10[3] = &unk_1E9F4CC90;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "appContext:openMarketingItem:metricsOverlay:completion:", v7, v8, v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke_3;
    v10[3] = &unk_1E9F4CC40;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    v13 = v5;
    objc_msgSend(v9, "evaluate:completionBlock:", v10, 0);

    objc_destroyWeak(&v14);
  }

}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[2];
  const __CFString *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v12 = CFSTR("message");
      objc_msgSend(*(id *)(a1 + 40), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v4, "callWithArguments:", v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "rawResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v4, "callWithArguments:", v7);
    }

    objc_msgSend(v3, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
  }

}

- (void)openDynamicUIURL:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[IKJSObject appContext](self, "appContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v10, v15);
      }
      else
      {
        v15 = 0;
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke;
      v19[3] = &unk_1E9F4CCB8;
      v16 = v13;
      v20 = v16;
      v17 = v12;
      v21 = v17;
      v22 = v9;
      objc_copyWeak(&v24, &location);
      v18 = v15;
      v23 = v18;
      objc_msgSend(v16, "evaluateDelegateBlockSync:", v19);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }

}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_2;
    v10[3] = &unk_1E9F4CC90;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "appContext:openDynamicUIURL:metricsOverlay:completion:", v7, v8, v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_3;
    v10[3] = &unk_1E9F4CC40;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    v13 = v5;
    objc_msgSend(v9, "evaluate:completionBlock:", v10, 0);

    objc_destroyWeak(&v14);
  }

}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[2];
  const __CFString *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v12 = CFSTR("message");
      objc_msgSend(*(id *)(a1 + 40), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v4, "callWithArguments:", v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "rawResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v4, "callWithArguments:", v7);
    }

    objc_msgSend(v3, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
  }

}

- (NSString)DSID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isManagedAppleID
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  return v4;
}

- (NSDictionary)accountInfo
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
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 7);
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_22;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("DSID"));
  objc_msgSend(v4, "accountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "accountName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("appleId"));

  }
  objc_msgSend(v4, "storeFrontIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "storeFrontIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("storefront"));

  }
  objc_msgSend(v4, "creditsString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "creditsString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("creditString"));

  }
  if (!objc_msgSend(v4, "accountScope"))
  {
    v13 = CFSTR("production");
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "accountScope") == 1)
  {
    v13 = CFSTR("sandbox");
LABEL_14:
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("scope"));
  }
  if (objc_msgSend(v4, "isManagedAppleID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isManagedAppleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v14, CFSTR("managedAppleId"));

  }
  objc_msgSend(v4, "firstName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("firstName"));
  objc_msgSend(v4, "lastName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v2, "setObject:forKey:", v16, CFSTR("lastName"));

LABEL_22:
  return (NSDictionary *)v2;
}

- (void)authenticate:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C0]), "initWithAccount:", v9);
    objc_msgSend(v10, "setPromptStyle:", 1);
    objc_msgSend(v10, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAF5C0], "contextForSignIn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setReasonDescription:", v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF488]), "initWithAuthenticationContext:", v10);
  objc_initWeak(&location, self);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v13);
  }
  else
  {
    v13 = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__IKJSITunesStore_authenticate::__block_invoke;
  v15[3] = &unk_1E9F4CCE0;
  objc_copyWeak(&v17, &location);
  v14 = v13;
  v16 = v14;
  objc_msgSend(v12, "startWithAuthenticateResponseBlock:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __33__IKJSITunesStore_authenticate::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__IKJSITunesStore_authenticate::__block_invoke_2;
    v10[3] = &unk_1E9F4CBC8;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v11 = v5;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v9, "evaluate:completionBlock:", v10, 0);

    objc_destroyWeak(&v13);
  }

}

void __33__IKJSITunesStore_authenticate::__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType") == 4;
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "jsValueForProperty:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "callWithArguments:", v8);

    objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 40));
  }

}

- (void)signOut
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isManagedAppleID") & 1) == 0)
  {
    objc_msgSend(v4, "setActive:", 0);
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveAccount:error:", v4, 0);

  }
}

- (void)_accountStoreChanged
{
  void *v3;
  void *v4;
  NSNumber *v5;
  NSNumber *lastAccountDSID;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSNumber *obj;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  obj = (NSNumber *)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  lastAccountDSID = self->_lastAccountDSID;
  if (lastAccountDSID != obj)
  {
    v7 = -[NSNumber isEqual:](lastAccountDSID, "isEqual:", obj);
    v5 = obj;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastAccountDSID, obj);
      v8 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onAccountChange"), 0);
      objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastKnownStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSITunesStore _subscriptionStatusDidChanged:](self, "_subscriptionStatusDidChanged:", v10);

      v5 = obj;
    }
  }

}

- (id)_subscriptionStatusDictionaryWithStatus:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("accountId"));
  objc_msgSend(v5, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("sessionId"));
  v9 = objc_msgSend(v5, "accountStatus");
  v10 = CFSTR("subscribed");
  v11 = CFSTR("unknown");
  if (v9 == 2)
    v11 = CFSTR("notSubscribed");
  if (v9 == 3)
  {
    v12 = 1;
  }
  else
  {
    v10 = v11;
    v12 = 0;
  }
  if (v9 == 1)
    v13 = CFSTR("needsAuthentication");
  else
    v13 = v10;
  if (v9 == 1)
    v14 = 0;
  else
    v14 = v12;
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("accountStatus"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("subscribed"));

  v16 = objc_msgSend(v5, "carrierBundlingStatus");
  if (v16 <= 4)
    objc_msgSend(v6, "setObject:forKey:", off_1E9F4CD00[v16], CFSTR("carrierBundle"));
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DAF6A0], "sharedCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isCurrentUserAdmin");

  if (v19)
  {
    objc_msgSend(v17, "addObject:", CFSTR("post"));
    objc_msgSend(v17, "addObject:", CFSTR("admin"));
    objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("permissions"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isDiscoveryModeEligible"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v20, CFSTR("discoveryMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isFamilyOrganizer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("familyOrganizer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isFamilySubscription"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("familySubscription"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "hasFamily"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("hasFamily"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "hasFamilyMembers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("hasFamilyMembers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isSubscriptionPurchaser"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v25, CFSTR("isSubscriptionPurchaser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v26, CFSTR("isFinal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "acceptedStoreTermsVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v27, CFSTR("acceptedStoreTermsVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "latestStoreTermsVersion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v28, CFSTR("latestStoreTermsVersion"));

  objc_msgSend(v5, "subscriptionExpirationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v5, "subscriptionExpirationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("subscriptionExpirationDate"));

  }
  objc_msgSend(v5, "rawResponseData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v6, "setObject:forKey:", v31, CFSTR("rawResponseData"));

  return v6;
}

- (void)_subscriptionStatusDidChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[IKJSITunesStore _subscriptionStatusDictionaryWithStatus:isFinal:](self, "_subscriptionStatusDictionaryWithStatus:isFinal:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToDictionary:", self->_lastKnownStatusDictionary) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKnownStatusDictionary, v4);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onSubscriptionStatusDidChange"), v5);

  }
}

- (id)getBag
{
  void *v3;
  void *v4;

  -[IKJSObject jsValueForProperty:](self, "jsValueForProperty:", CFSTR("StoreURLBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSITunesStore bagCache](self, "bagCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_loadWithNotification:completion:", 1, 0);

  return v3;
}

- (void)invalidateBag
{
  id v2;

  -[IKJSITunesStore bagCache](self, "bagCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithInvalidation:", 1);

}

- (void)_bagCacheUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *storeFrontSuffix;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  -[IKJSITunesStore bagCache](self, "bagCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0DAFCB8]);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF568]), "initWithGlobalConfiguration:", v14);
    objc_msgSend(v4, "setDisableEventDecoration:", objc_msgSend(v4, "_decorateITMLEvents") ^ 1);
    -[SSMetricsController setGlobalConfiguration:](self->_metricsController, "setGlobalConfiguration:", v4);
    -[SSMetricsController setFlushTimerEnabled:](self->_metricsController, "setFlushTimerEnabled:", 1);

  }
  -[IKJSITunesStore bagCache](self, "bagCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("storefront-header-suffix"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    storeFrontSuffix = self->_storeFrontSuffix;
    self->_storeFrontSuffix = v7;

    v9 = (void *)MEMORY[0x1E0CBE108];
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueWithObject:inContext:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v12, CFSTR("StoreURLBag"));
    v13 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onBagChange"), 0);

  }
}

- (NSString)cookieURL
{
  return self->_cookieURL;
}

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (void)setBagCache:(id)a3
{
  objc_storeStrong((id *)&self->_bagCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_cookieURL, 0);
  objc_storeStrong(&self->_urlBagCacheUpdateToken, 0);
  objc_storeStrong(&self->_subscriptionStatusDidChangeToken, 0);
  objc_storeStrong(&self->_ssAccountStoreChangedToken, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_lastKnownStatusDictionary, 0);
  objc_storeStrong((id *)&self->_lastAccountDSID, 0);
}

@end
