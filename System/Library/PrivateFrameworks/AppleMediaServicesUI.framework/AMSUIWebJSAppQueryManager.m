@implementation AMSUIWebJSAppQueryManager

- (AMSUIWebJSAppQueryManager)initWithDelegate:(id)a3
{
  id v4;
  AMSUIWebJSAppQueryManager *v5;
  AMSUIWebJSAppQueryManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *observingQueries;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebJSAppQueryManager;
  v5 = -[AMSUIWebJSAppQueryManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    observingQueries = v6->_observingQueries;
    v6->_observingQueries = v7;

  }
  return v6;
}

- (void)invalidate
{
  AMSUIWebJSAppQueryManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[AMSUIWebJSAppQueryManager observingQueries](v2, "observingQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(v2);
  -[AMSUIWebJSAppQueryManager setDelegate:](v2, "setDelegate:", 0);
}

- (id)queryAppsWithBundleIDs:(id)a3 startObserving:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  AMSUIWebJSAppQueryManager *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(getASDAppQueryClass(), "queryForBundleIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setObserver:", self);
    v9 = self;
    objc_sync_enter(v9);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
          -[AMSUIWebJSAppQueryManager observingQueries](v9, "observingQueries", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v8, v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v11);
    }

    objc_sync_exit(v9);
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", (_QWORD)v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2114;
    v29 = v19;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Executing app query for bundle identifiers %{public}@", buf, 0x20u);

  }
  -[AMSUIWebJSAppQueryManager _executeAppQuery:](self, "_executeAppQuery:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)queryAppsWithStoreItemIDs:(id)a3 startObserving:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  AMSUIWebJSAppQueryManager *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(getASDAppQueryClass(), "queryForStoreItemIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setObserver:", self);
    v9 = self;
    objc_sync_enter(v9);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
          -[AMSUIWebJSAppQueryManager observingQueries](v9, "observingQueries", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v8, v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v11);
    }

    objc_sync_exit(v9);
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", (_QWORD)v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2114;
    v29 = v19;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Executing app query for store item identifiers %{public}@", buf, 0x20u);

  }
  -[AMSUIWebJSAppQueryManager _executeAppQuery:](self, "_executeAppQuery:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)stopObservingAllApps
{
  void *v2;
  AMSUIWebJSAppQueryManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[AMSUIWebJSAppQueryManager observingQueries](obj, "observingQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (void)stopObservingAppsWithBundleIDs:(id)a3
{
  id v4;
  AMSUIWebJSAppQueryManager *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[AMSUIWebJSAppQueryManager observingQueries](v5, "observingQueries", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)stopObservingAppsWithStoreItemIDs:(id)a3
{
  id v4;
  AMSUIWebJSAppQueryManager *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[AMSUIWebJSAppQueryManager observingQueries](v5, "observingQueries", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  -[AMSUIWebJSAppQueryManager _postMediaQueryResultsChangeEventWithApps:](self, "_postMediaQueryResultsChangeEventWithApps:", a4);
}

- (id)_encodeApp:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, CFSTR("bundleID"), 0);

  objc_msgSend(v3, "bundleShortVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("bundleShortVersion"));

  objc_msgSend(v3, "bundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("bundleVersion"));

  objc_msgSend(v3, "installError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("installError"));

  objc_msgSend(v3, "installID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("installID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isInstalled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("isInstalled"));

  objc_msgSend(v3, "progress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v14, "fractionCompleted");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("progress"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "storeItemID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("storeItemID"));

  objc_msgSend(v3, "storeFront");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("storeFront"));

  return v6;
}

- (id)_executeAppQuery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE08078]);
  objc_initWeak(&location, self);
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__AMSUIWebJSAppQueryManager__executeAppQuery___block_invoke;
  v12[3] = &unk_24CB515F8;
  objc_copyWeak(&v15, &location);
  v7 = v6;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v4, "executeQueryWithResultHandler:", v12);
  v9 = v14;
  v10 = v8;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

void __46__AMSUIWebJSAppQueryManager__executeAppQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (id)AMSSetLogKey();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App query succeeded.", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(WeakRetained, "_postMediaQueryResultsChangeEventWithApps:", v5);
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] App query failed %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }

}

- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[AMSUIWebJSAppQueryManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__AMSUIWebJSAppQueryManager__postMediaQueryResultsChangeEventWithApps___block_invoke;
  v7[3] = &unk_24CB51620;
  v7[4] = self;
  objc_msgSend(v4, "ams_mapWithTransform:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appQueryManager:didReceiveApps:", self, v6);
}

uint64_t __71__AMSUIWebJSAppQueryManager__postMediaQueryResultsChangeEventWithApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_encodeApp:", a2);
}

- (AMSUIWebJSAppQueryManagerDelegate)delegate
{
  return (AMSUIWebJSAppQueryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)observingQueries
{
  return self->_observingQueries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingQueries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
