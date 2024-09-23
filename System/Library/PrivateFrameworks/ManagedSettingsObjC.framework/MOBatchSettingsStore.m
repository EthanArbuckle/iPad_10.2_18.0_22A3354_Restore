@implementation MOBatchSettingsStore

- (MOBatchSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4
{
  NSString *v6;
  NSString *v7;
  MOBatchSettingsStore *v8;
  NSString *name;
  NSString *v10;
  NSString *container;
  NSString *v12;
  NSUUID *persistenceRecordIdentifier;
  uint64_t v14;
  NSMutableDictionary *updatedSettings;
  uint64_t v16;
  NSMutableSet *removedSettings;
  uint64_t v18;
  NSMutableDictionary *updatedProperties;
  uint64_t v20;
  NSObject *settingsLock;
  NSXPCConnection *currentConnection;
  uint64_t v23;
  NSObject *connectionLock;
  objc_super v26;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v26.receiver = self;
  v26.super_class = (Class)MOBatchSettingsStore;
  v8 = -[MOSettingsStore initStore](&v26, sel_initStore);
  name = v8->_name;
  v8->_name = v6;
  v10 = v6;

  container = v8->_container;
  v8->_container = v7;
  v12 = v7;

  persistenceRecordIdentifier = v8->_persistenceRecordIdentifier;
  v8->_persistenceRecordIdentifier = 0;

  v14 = objc_opt_new();
  updatedSettings = v8->_updatedSettings;
  v8->_updatedSettings = (NSMutableDictionary *)v14;

  v16 = objc_opt_new();
  removedSettings = v8->_removedSettings;
  v8->_removedSettings = (NSMutableSet *)v16;

  v18 = objc_opt_new();
  updatedProperties = v8->_updatedProperties;
  v8->_updatedProperties = (NSMutableDictionary *)v18;

  v20 = objc_opt_new();
  settingsLock = v8->_settingsLock;
  v8->_settingsLock = v20;

  v8->_fullReplacement = 0;
  currentConnection = v8->_currentConnection;
  v8->_currentConnection = 0;

  v23 = objc_opt_new();
  connectionLock = v8->_connectionLock;
  v8->_connectionLock = v23;

  return v8;
}

+ (id)storeWithName:(id)a3 sharedContainer:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:sharedContainer:", v6, v5);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MOBatchSettingsStore clearCurrentConnectionAndInvalidate:](self, "clearCurrentConnectionAndInvalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MOBatchSettingsStore;
  -[MOBatchSettingsStore dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection **p_currentConnection;
  NSXPCConnection *currentConnection;
  id v6;
  uint64_t v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    v6 = +[MOManagedSettingsAgentConnection newConnection](MOManagedSettingsAgentConnection, "newConnection");
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__MOBatchSettingsStore_xpcConnection__block_invoke;
    v12[3] = &unk_1E675E388;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __37__MOBatchSettingsStore_xpcConnection__block_invoke_2;
    v10[3] = &unk_1E675E388;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    objc_storeStrong((id *)p_currentConnection, v6);
    objc_msgSend(v6, "activate");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  v8 = currentConnection;
  objc_sync_exit(v3);

  return v8;
}

void __37__MOBatchSettingsStore_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 1);

}

void __37__MOBatchSettingsStore_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 0);

}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  _BOOL4 v3;
  NSXPCConnection *currentConnection;
  NSObject *obj;

  v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_currentConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_currentConnection, "invalidate");
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (BOOL)active
{
  NSObject *v3;
  NSMutableDictionary **p_updatedProperties;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = self->_settingsLock;
  objc_sync_enter(v3);
  p_updatedProperties = &self->_updatedProperties;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_updatedProperties, "objectForKeyedSubscript:", CFSTR("active"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[MOBatchSettingsStore getCurrentStoreProperties](self, "getCurrentStoreProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (v9)
    {
      objc_msgSend(v9, "addEntriesFromDictionary:", *p_updatedProperties);
      objc_storeStrong((id *)p_updatedProperties, v9);
      -[NSMutableDictionary objectForKeyedSubscript:](*p_updatedProperties, "objectForKeyedSubscript:", CFSTR("active"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v10)
      {
        v7 = objc_msgSend(v10, "BOOLValue");
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 1;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_9:

  objc_sync_exit(v3);
  return v7;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *obj;

  v3 = a3;
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedProperties, "setObject:forKeyedSubscript:", v5, CFSTR("active"));

  objc_sync_exit(obj);
}

- (BOOL)syncToWatch
{
  NSObject *v3;
  NSMutableDictionary **p_updatedProperties;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = self->_settingsLock;
  objc_sync_enter(v3);
  p_updatedProperties = &self->_updatedProperties;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_updatedProperties, "objectForKeyedSubscript:", CFSTR("syncToWatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[MOBatchSettingsStore getCurrentStoreProperties](self, "getCurrentStoreProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (v9)
    {
      objc_msgSend(v9, "addEntriesFromDictionary:", *p_updatedProperties);
      objc_storeStrong((id *)p_updatedProperties, v9);
      -[NSMutableDictionary objectForKeyedSubscript:](*p_updatedProperties, "objectForKeyedSubscript:", CFSTR("syncToWatch"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v10)
      {
        v7 = objc_msgSend(v10, "BOOLValue");
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_9:

  objc_sync_exit(v3);
  return v7;
}

- (void)setSyncToWatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *obj;

  v3 = a3;
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedProperties, "setObject:forKeyedSubscript:", v5, CFSTR("syncToWatch"));

  objc_sync_exit(obj);
}

- (void)clearAllSettings
{
  NSObject *obj;

  obj = self->_settingsLock;
  objc_sync_enter(obj);
  if (!self->_fullReplacement)
  {
    self->_fullReplacement = 1;
    -[NSMutableSet removeAllObjects](self->_removedSettings, "removeAllObjects");
  }
  -[NSMutableDictionary removeAllObjects](self->_updatedSettings, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)deleteStore
{
  NSObject *obj;

  obj = self->_settingsLock;
  objc_sync_enter(obj);
  if (!self->_fullReplacement)
  {
    self->_fullReplacement = 1;
    -[NSMutableSet removeAllObjects](self->_removedSettings, "removeAllObjects");
  }
  -[NSMutableDictionary removeAllObjects](self->_updatedSettings, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedProperties, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("active"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedProperties, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("syncToWatch"));
  objc_sync_exit(obj);

}

- (id)getCurrentStoreProperties
{
  void *v3;
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
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[MOBatchSettingsStore xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke;
  v6[3] = &unk_1E675E5F8;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v3, 1, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Getting current store properties from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "persistenceRecordIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9;
    v19[3] = &unk_1E675E5D0;
    v20 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "getStorePropertiesForRecordIdentifier:storeContainer:storeName:replyHandler:", v8, v11, v12, v19);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v13, v14, v15, v16, v17, v18);
  }

}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_2();
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got current store properties from store with container “%{public}@” and name “%{public}@”. Value: %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_1(a1);
  }

}

- (id)getCurrentSettings
{
  void *v3;
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
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[MOBatchSettingsStore xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MOBatchSettingsStore_getCurrentSettings__block_invoke;
  v6[3] = &unk_1E675E5F8;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v3, 1, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Gettting current settings for store with container “%{public}@” and name “%{public}@”", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "persistenceRecordIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12;
    v19[3] = &unk_1E675E5D0;
    v20 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "getAllSettingsForRecordIdentifier:storeContainer:storeName:replyHandler:", v8, v11, v12, v19);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v13, v14, v15, v16, v17, v18);
  }

}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_2();
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got current settings for store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_1(a1);
  }

}

- (void)commitChanges
{
  void *v3;
  _QWORD v4[5];

  -[MOBatchSettingsStore xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MOBatchSettingsStore_commitChanges__block_invoke;
  v4[3] = &unk_1E675E648;
  v4[4] = self;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v3, 1, v4);

}

void __37__MOBatchSettingsStore_commitChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v9;
      v40 = 2114;
      v41 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Updating store with container “%{public}@” and name “%{public}@”", buf, 0x16u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "updatedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hasSensitiveDataInSettings:", v12);

    +[MOLogger store](MOLogger, "store");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "updatedSettings");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v16;
        v17 = "NewSettings: %@";
LABEL_11:
        _os_log_impl(&dword_1B4020000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

      }
    }
    else if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "updatedSettings");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      v17 = "NewSettings: %{public}@";
      goto LABEL_11;
    }

    +[MOLogger store](MOLogger, "store");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "removedSettings");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_impl(&dword_1B4020000, v24, OS_LOG_TYPE_DEFAULT, "RemovedSettings: %{public}@", buf, 0xCu);

    }
    +[MOLogger store](MOLogger, "store");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "updatedProperties");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v27;
      _os_log_impl(&dword_1B4020000, v26, OS_LOG_TYPE_DEFAULT, "NewProperties: %{public}@", buf, 0xCu);

    }
    +[MOLogger store](MOLogger, "store");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(*(id *)(a1 + 32), "fullReplacement");
      v30 = CFSTR("No");
      if (v29)
        v30 = CFSTR("Yes");
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_1B4020000, v28, OS_LOG_TYPE_DEFAULT, "FullReplacement: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "updatedSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removedSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updatedProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(*(id *)(a1 + 32), "fullReplacement");
    objc_msgSend(*(id *)(a1 + 32), "persistenceRecordIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __37__MOBatchSettingsStore_commitChanges__block_invoke_16;
    v37[3] = &unk_1E675E620;
    v37[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "updateStoreWithNewSettings:removedSettings:newProperties:fullReplacement:recordIdentifier:storeContainer:storeName:replyHandler:", v8, v31, v32, v33, v34, v35, v36, v37);

    goto LABEL_21;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v18, v19, v20, v21, v22, v23);
LABEL_21:

}

void __37__MOBatchSettingsStore_commitChanges__block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __37__MOBatchSettingsStore_commitChanges__block_invoke_16_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPersistenceRecordIdentifier:", a2);
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary **p_updatedSettings;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_settingsLock;
  objc_sync_enter(v9);
  p_updatedSettings = &self->_updatedSettings;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_updatedSettings, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else if (self->_fullReplacement)
  {
    v13 = 0;
  }
  else
  {
    -[MOBatchSettingsStore getCurrentSettings](self, "getCurrentSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v15)
    {
      objc_msgSend(v15, "addEntriesFromDictionary:", *p_updatedSettings);
      objc_storeStrong((id *)&self->_updatedSettings, v15);
      self->_fullReplacement = 1;
      -[NSMutableDictionary objectForKeyedSubscript:](*p_updatedSettings, "objectForKeyedSubscript:", v8);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  objc_sync_exit(v9);

  return v13;
}

- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_settingsLock;
  objc_sync_enter(v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedSettings, "setObject:forKeyedSubscript:", v12, v10);
  if (!self->_fullReplacement)
    -[NSMutableSet removeObject:](self->_removedSettings, "removeObject:", v10);
  objc_sync_exit(v11);

}

- (void)removeValueForSetting:(id)a3 inGroup:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_settingsLock;
  objc_sync_enter(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedSettings, "setObject:forKeyedSubscript:", 0, v7);
  if (!self->_fullReplacement)
    -[NSMutableSet addObject:](self->_removedSettings, "addObject:", v7);
  objc_sync_exit(v8);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSUUID)persistenceRecordIdentifier
{
  return self->_persistenceRecordIdentifier;
}

- (void)setPersistenceRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceRecordIdentifier, a3);
}

- (NSMutableDictionary)updatedSettings
{
  return self->_updatedSettings;
}

- (void)setUpdatedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_updatedSettings, a3);
}

- (NSMutableSet)removedSettings
{
  return self->_removedSettings;
}

- (void)setRemovedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_removedSettings, a3);
}

- (NSMutableDictionary)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_updatedProperties, a3);
}

- (NSObject)settingsLock
{
  return self->_settingsLock;
}

- (BOOL)fullReplacement
{
  return self->_fullReplacement;
}

- (void)setFullReplacement:(BOOL)a3
{
  self->_fullReplacement = a3;
}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_currentConnection, a3);
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_settingsLock, 0);
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_removedSettings, 0);
  objc_storeStrong((id *)&self->_updatedSettings, 0);
  objc_storeStrong((id *)&self->_persistenceRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B4020000, a2, a3, "Unable to obtain remote object proxy. Error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4020000, v4, v5, "Unable to get current store properties from store with container “%{public}@” and name “%{public}@”. Error: Unknown", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  objc_msgSend(*(id *)(v1 + 32), "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B4020000, v4, v5, "Unable to get current store properties from store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4020000, v4, v5, "Unable to get current settings from store with container “%{public}@” and name “%{public}@”. Error: Unknown", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  objc_msgSend(*(id *)(v1 + 32), "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B4020000, v4, v5, "Unable to get current settings for store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __37__MOBatchSettingsStore_commitChanges__block_invoke_16_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  objc_msgSend(*(id *)(v1 + 32), "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B4020000, v4, v5, "Unable to update store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
