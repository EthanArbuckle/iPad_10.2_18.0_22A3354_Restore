@implementation AMSEngagementClientData

void __48__AMSEngagementClientData_destinationsForEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  AMSEngagementDestination *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v13 = a3;
  objc_msgSend(v13, "eventFilters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "matchesEvent:", *(_QWORD *)(a1 + 32)))
        {
          if (!v9)
          {
            v9 = -[AMSEngagementDestination initWithIdentifier:]([AMSEngagementDestination alloc], "initWithIdentifier:", v5);
            -[AMSEngagementDestination setAllowsResponse:](v9, "setAllowsResponse:", 0);
            -[AMSEngagementDestination setComponents:](v9, "setComponents:", 0);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
          }
          -[AMSEngagementDestination setAllowsResponse:](v9, "setAllowsResponse:", objc_msgSend(v12, "allowsResponse") | -[AMSEngagementDestination allowsResponse](v9, "allowsResponse"));
          -[AMSEngagementDestination setComponents:](v9, "setComponents:", -[AMSEngagementDestination components](v9, "components") | objc_msgSend(v12, "components"));
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

}

void __51__AMSEngagementClientData__enumerateAppsWithBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "apps");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)apps
{
  return self->_apps;
}

void __54__AMSEngagementClientData_cachedResponseDataForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "cachedResponses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "matchesEvent:", *(_QWORD *)(a1 + 32)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
          *a4 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __39__AMSEngagementClientData_loadFromDisk__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  AMSEngagementClientData *v7;
  void *v8;

  v2 = (void *)kSharedInstance;
  if (!kSharedInstance)
  {
    objc_msgSend(*(id *)(a1 + 40), "_fetchClientData");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA70];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

    v7 = -[AMSEngagementClientData initWithCacheObject:]([AMSEngagementClientData alloc], "initWithCacheObject:", v6);
    v8 = (void *)kSharedInstance;
    kSharedInstance = (uint64_t)v7;

    v2 = (void *)kSharedInstance;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2);
}

void __47__AMSEngagementClientData_initWithCacheObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  AMSEngagementAppData *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v12 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v12;
  else
    v7 = 0;

  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = objc_msgSend(v7, "length");
  if (v9 && v10)
  {
    v11 = -[AMSEngagementAppData initWithIdentifier:cacheObject:]([AMSEngagementAppData alloc], "initWithIdentifier:cacheObject:", v7, v9);
    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

  }
}

- (AMSEngagementClientData)initWithCacheObject:(id)a3
{
  id v4;
  AMSEngagementClientData *v5;
  void *v6;
  NSString *v7;
  NSString *lastSyncedBuild;
  void *v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *apps;
  NSMutableDictionary *v14;
  _QWORD v16[4];
  NSMutableDictionary *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSEngagementClientData;
  v5 = -[AMSEngagementClientData init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastSyncedBuild"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    lastSyncedBuild = v5->_lastSyncedBuild;
    v5->_lastSyncedBuild = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__AMSEngagementClientData_initWithCacheObject___block_invoke;
    v16[3] = &unk_1E253FA48;
    v12 = (NSMutableDictionary *)v11;
    v17 = v12;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);
    apps = v5->_apps;
    v5->_apps = v12;
    v14 = v12;

    +[AMSEngagementClientData _registerNotifications](AMSEngagementClientData, "_registerNotifications");
  }

  return v5;
}

+ (void)_registerNotifications
{
  _QWORD block[5];

  if (!+[AMSEngagementClientData _isDaemon](AMSEngagementClientData, "_isDaemon"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AMSEngagementClientData__registerNotifications__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_registerNotifications_onceToken != -1)
      dispatch_once(&_registerNotifications_onceToken, block);
  }
}

+ (BOOL)_isDaemon
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("amsengagementd"));

  return v4;
}

+ (id)_fetchClientData
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "clientDataURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No client data", buf, 0x16u);

    }
    goto LABEL_24;
  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 0, &v22);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v7)
  {
    v8 = v7;
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup client data. %{public}@", buf, 0x20u);

    }
    v13 = 0;
    goto LABEL_8;
  }
  if (!v6)
  {
    v8 = 0;
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  v9 = v16;
  objc_opt_class();
  v13 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v9;

  if (!v8)
    goto LABEL_9;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v10, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v18;
    v25 = 2114;
    v26 = v19;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode client data. %{public}@", buf, 0x20u);

  }
LABEL_8:

LABEL_9:
LABEL_25:

  return v13;
}

+ (NSURL)clientDataURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "ams_engagementDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("clientData.txt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)destinationsForEvent:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__AMSEngagementClientData_destinationsForEvent___block_invoke;
  v11[3] = &unk_1E2541930;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[AMSEngagementClientData _enumerateAppsWithBlock:](self, "_enumerateAppsWithBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (NSString)lastSyncedBuild
{
  return self->_lastSyncedBuild;
}

+ (id)loadFromDisk
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  objc_msgSend(a1, "_sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__AMSEngagementClientData_loadFromDisk__block_invoke;
  v6[3] = &unk_1E2540228;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_enumerateAppsWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AMSEngagementClientData__enumerateAppsWithBlock___block_invoke;
  block[3] = &unk_1E253DC28;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (id)_sharedQueue
{
  if (_MergedGlobals_102 != -1)
    dispatch_once(&_MergedGlobals_102, &__block_literal_global_46);
  return (id)qword_1ECEAD198;
}

- (id)cachedResponseDataForEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__AMSEngagementClientData_cachedResponseDataForEvent___block_invoke;
  v11 = &unk_1E25418E0;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  -[AMSEngagementClientData _enumerateAppsWithBlock:](self, "_enumerateAppsWithBlock:", &v8);
  objc_msgSend((id)v15[5], "responseData", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __49__AMSEngagementClientData__registerNotifications__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleClearCachesNotification, CFSTR("AMSEngagementClientDataChanged"), 0, CFNotificationSuspensionBehaviorDrop);
}

void __39__AMSEngagementClientData__sharedQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagementClientData", 0, v2);
  v1 = (void *)qword_1ECEAD198;
  qword_1ECEAD198 = (uint64_t)v0;

}

- (void)addCachedResponseData:(id)a3 cacheInfo:(id)a4 appIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  AMSEngagementAppData *v11;
  AMSEngagementAppResponseModel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  v8 = a4;
  v9 = a3;
  +[AMSEngagementClientData _assertEngagementd](AMSEngagementClientData, "_assertEngagementd");
  -[AMSEngagementClientData _appForIdentifier:](self, "_appForIdentifier:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (AMSEngagementAppData *)objc_msgSend(v10, "copy");

  if (!v11)
    v11 = -[AMSEngagementAppData initWithIdentifier:cacheObject:]([AMSEngagementAppData alloc], "initWithIdentifier:cacheObject:", v15, 0);
  v12 = -[AMSEngagementAppResponseModel initWithData:cacheInfo:]([AMSEngagementAppResponseModel alloc], "initWithData:cacheInfo:", v9, v8);

  if (v12)
  {
    -[AMSEngagementAppData cachedResponses](v11, "cachedResponses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementAppData setCachedResponses:](v11, "setCachedResponses:", v14);

  }
  -[AMSEngagementClientData _setApp:forIdentifier:](self, "_setApp:forIdentifier:", v11, v15);

}

- (void)setAllowedEvents:(id)a3 appIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSEngagementAppData *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AMSEngagementAppEventFilterModel *v17;
  AMSEngagementAppEventFilterModel *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSEngagementClientData _assertEngagementd](AMSEngagementClientData, "_assertEngagementd");
  -[AMSEngagementClientData _appForIdentifier:](self, "_appForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (AMSEngagementAppData *)objc_msgSend(v8, "copy");

  if (!v9)
    v9 = -[AMSEngagementAppData initWithIdentifier:cacheObject:]([AMSEngagementAppData alloc], "initWithIdentifier:cacheObject:", v7, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = [AMSEngagementAppEventFilterModel alloc];
        v18 = -[AMSEngagementAppEventFilterModel initWithDefinition:](v17, "initWithDefinition:", v16, (_QWORD)v19);
        if (v18)
          objc_msgSend(v10, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[AMSEngagementAppData setEventFilters:](v9, "setEventFilters:", v10);
  -[AMSEngagementClientData _setApp:forIdentifier:](self, "_setApp:forIdentifier:", v9, v7);

}

- (BOOL)destination:(id)a3 allowsEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__AMSEngagementClientData_destination_allowsEvent___block_invoke;
  v12[3] = &unk_1E2541908;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

void __51__AMSEngagementClientData_destination_allowsEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "apps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "eventFilters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "matchesEvent:", *(_QWORD *)(a1 + 48)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (void)erase
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientDataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v13);
  v6 = v13;

  if ((v5 & 1) == 0)
  {
    if ((objc_msgSend(v6, "code") & 0xFFFFFFFFFFFFFEFFLL) != 4
      || (objc_msgSend(v6, "domain"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB28A8]),
          v7,
          (v8 & 1) == 0))
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_opt_class();
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        v18 = 2114;
        v19 = v6;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to erase client data: %{public}@", buf, 0x20u);

      }
    }
  }

}

- (void)saveToDisk
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[AMSEngagementClientData _assertEngagementd](AMSEngagementClientData, "_assertEngagementd");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSEngagementClientData lastSyncedBuild](self, "lastSyncedBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("lastSyncedBuild"));

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __37__AMSEngagementClientData_saveToDisk__block_invoke;
  v30[3] = &unk_1E2541958;
  v6 = v5;
  v31 = v6;
  -[AMSEngagementClientData _enumerateAppsWithBlock:](self, "_enumerateAppsWithBlock:", v30);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("apps"));
  +[AMSEngagementClientData clientDataURL](AMSEngagementClientData, "clientDataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v29);
    v14 = v29;

    if (v14 || (v13 & 1) == 0)
    {
      +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v15, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v22 = objc_opt_class();
      AMSLogKey();
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v22;
      v34 = 2114;
      v35 = v18;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating directory. %{public}@", buf, 0x20u);
      goto LABEL_18;
    }
  }
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3) & 1) != 0)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v28);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = v28;
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v19;
        v34 = 2114;
        v35 = v20;
        v36 = 2114;
        v37 = v14;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing to serialize client data. %{public}@", buf, 0x20u);

      }
LABEL_18:

      goto LABEL_19;
    }
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v17, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overwriting client data.", buf, 0x16u);

    }
    objc_msgSend(v7, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject writeToFile:atomically:](v15, "writeToFile:atomically:", v26, 1);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AMSEngagementClientDataChanged"), 0, 0, 1u);
    v14 = 0;
  }
  else
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      AMSLogKey();
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v21;
      v34 = 2114;
      v35 = v17;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing to validate client data, invalid format.", buf, 0x16u);
LABEL_19:

    }
  }

}

void __37__AMSEngagementClientData_saveToDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "exportObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)_appForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AMSEngagementClientData__appForIdentifier___block_invoke;
  block[3] = &unk_1E2541980;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__AMSEngagementClientData__appForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "apps");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setApp:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_sharedQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AMSEngagementClientData__setApp_forIdentifier___block_invoke;
  block[3] = &unk_1E25414B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __49__AMSEngagementClientData__setApp_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "apps");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)setLastSyncedBuild:(id)a3
{
  objc_storeStrong((id *)&self->_lastSyncedBuild, a3);
}

- (void)setApps:(id)a3
{
  objc_storeStrong((id *)&self->_apps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_lastSyncedBuild, 0);
}

@end
