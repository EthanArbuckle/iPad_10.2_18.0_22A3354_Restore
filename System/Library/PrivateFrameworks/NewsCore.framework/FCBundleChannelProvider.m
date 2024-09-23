@implementation FCBundleChannelProvider

void __69__FCBundleChannelProvider_fetchBundleTagIDsForPurchaseID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "fetchedObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)loadInitialBundleChannelIDsWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[FCBundleChannelProvider bundleChannelIDs](self, "bundleChannelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (v5)
      v5[2]();
  }
  else
  {
    -[FCBundleChannelProvider refreshBundleChannelIDsWithCompletion:]((id *)&self->super.isa, v5);
  }

}

- (NSArray)bundleChannelIDs
{
  FCBundleChannelProvider *v2;
  NSArray *v3;

  v2 = self;
  if (self)
    self = (FCBundleChannelProvider *)self->_accessLock;
  -[FCBundleChannelProvider lock](self, "lock");
  v3 = v2->_bundleChannelIDs;
  -[NFUnfairLock unlock](v2->_accessLock, "unlock");
  return v3;
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  id v15;
  FCPurchaseLookupFetchOperation *v16;
  void *v17;
  FCPurchaseLookupFetchOperation *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "paidBundleConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offeredBundlePurchaseIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentStoreFrontID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_10;
    v20[3] = &unk_1E4644B58;
    v21 = v11;
    v22 = v4;
    v23 = *(id *)(a1 + 40);
    v13 = v11;
    v14 = v20;
    if (v4)
    {
      v15 = v13;
      v16 = [FCPurchaseLookupFetchOperation alloc];
      v27[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[FCPurchaseLookupFetchOperation initWithPurchaseIDs:contentContext:](v16, "initWithPurchaseIDs:contentContext:", v17, v4[5]);

      -[FCOperation setQualityOfService:](v18, "setQualityOfService:", 25);
      -[FCOperation setRelativePriority:](v18, "setRelativePriority:", 1);
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __69__FCBundleChannelProvider_fetchBundleTagIDsForPurchaseID_completion___block_invoke;
      v25[3] = &unk_1E463B608;
      v26 = v14;
      -[FCFetchOperation setFetchCompletionBlock:](v18, "setFetchCompletionBlock:", v25);
      objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addOperation:", v18);

    }
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3;
    v24[3] = &unk_1E463B598;
    v24[4] = *(_QWORD *)(a1 + 40);
    __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3((uint64_t)v24);
  }

}

- (void)activityObservingApplicationWindowWillBecomeForeground
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__FCBundleChannelProvider_activityObservingApplicationWindowWillBecomeForeground__block_invoke;
  v2[3] = &unk_1E463AB18;
  v2[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v2);
}

- (NSString)bundleChannelIDsVersion
{
  FCBundleChannelProvider *v2;
  NSString *v3;

  v2 = self;
  if (self)
    self = (FCBundleChannelProvider *)self->_accessLock;
  -[FCBundleChannelProvider lock](self, "lock");
  v3 = v2->_bundleChannelIDsVersion;
  -[NFUnfairLock unlock](v2->_accessLock, "unlock");
  return v3;
}

void __81__FCBundleChannelProvider_activityObservingApplicationWindowWillBecomeForeground__block_invoke(uint64_t a1)
{
  -[FCBundleChannelProvider refreshBundleChannelIDsWithCompletion:](*(id **)(a1 + 32), 0);
}

- (void)refreshBundleChannelIDsWithCompletion:(id *)a1
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = a1[4];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke;
    v5[3] = &unk_1E4644BA8;
    objc_copyWeak(&v7, &location);
    v6 = v3;
    FCCoreConfigurationFetch(v4, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (id)initWithLocalStore:(void *)a3 appActivityMonitor:(void *)a4 configurationManager:(void *)a5 contentContext:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1
    && (v41.receiver = a1,
        v41.super_class = (Class)FCBundleChannelProvider,
        (v14 = (id *)objc_msgSendSuper2(&v41, sel_init)) != 0))
  {
    v15 = v14;
    v37 = v13;
    v38 = v12;
    v40 = v10;
    objc_storeStrong(v14 + 2, a2);
    objc_storeStrong(v15 + 4, a4);
    objc_storeStrong(v15 + 5, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    v17 = v15[3];
    v15[3] = (id)v16;

    v39 = v11;
    objc_msgSend(v11, "addObserver:", v15);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBundleChannelIDs:", v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBundleChannelIDsVersion:", v19);

    v20 = v15;
    v21 = v15[2];
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v21, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_opt_class();
          objc_msgSend(v21, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
          }
          else
          {
            v29 = 0;
          }
          v30 = v29;

          if (v30 && objc_msgSend(v27, "isEqualToString:", CFSTR("bundleChannelIDs")))
          {
            v31 = (void *)objc_msgSend(v30, "copy");
            objc_msgSend(v20, "setBundleChannelIDs:", v31);

          }
          objc_opt_class();
          objc_msgSend(v21, "objectForKey:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
          }
          else
          {
            v33 = 0;
          }
          v34 = v33;

          if (v34 && objc_msgSend(v27, "isEqualToString:", CFSTR("bundleChannelIDsVersion")))
          {
            v35 = (void *)objc_msgSend(v34, "copy");
            objc_msgSend(v20, "setBundleChannelIDsVersion:", v35);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v24);
    }

    v11 = v39;
    v10 = v40;
    v13 = v37;
    v12 = v38;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setBundleChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4644B80;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

}

uint64_t __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "BundleChannelProvider couldn't find bundle purchaseID from configuration", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  if (v19)
  {
    objc_msgSend(v19, "bundleChannelIDsByPurchaseID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "bundleChannelIDsVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "bundleChannelIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      objc_msgSend(*(id *)(a1 + 40), "bundleChannelIDsVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      if (!objc_msgSend(v7, "isEqualToArray:", v4) || (objc_msgSend(v9, "isEqualToString:", v5) & 1) == 0)
      {
        v10 = *(id **)(a1 + 40);
        v11 = v4;
        v12 = v5;
        if (v10)
        {
          objc_msgSend(v10[3], "lock");
          objc_storeStrong(v10 + 6, v4);
          objc_storeStrong(v10 + 7, v5);
          objc_msgSend(v10[3], "unlock");
        }

        v13 = *(_QWORD *)(a1 + 40);
        if (v13)
          v14 = *(void **)(v13 + 16);
        else
          v14 = 0;
        objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("bundleChannelIDs"));
        v15 = *(_QWORD *)(a1 + 40);
        if (v15)
          v16 = *(void **)(v15 + 16);
        else
          v16 = 0;
        objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("bundleChannelIDsVersion"));
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleChannelProvider:bundleChannelIDsDidChangeWithChannelIDs:version:", *(_QWORD *)(a1 + 40), v11, v12);

      }
    }

  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

- (FCBundleChannelProviderDelegate)delegate
{
  return (FCBundleChannelProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
