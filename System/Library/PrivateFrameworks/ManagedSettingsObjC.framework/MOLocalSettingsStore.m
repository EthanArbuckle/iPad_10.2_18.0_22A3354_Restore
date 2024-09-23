@implementation MOLocalSettingsStore

- (MOLocalSettingsStore)init
{
  MOLocalSettingsStore *v2;
  NSString *name;
  void *v4;
  uint64_t v5;
  NSString *container;
  NSUUID *persistenceRecordIdentifier;
  NSXPCConnection *currentConnection;
  uint64_t v9;
  NSObject *connectionLock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOLocalSettingsStore;
  v2 = -[MOSettingsStore initStore](&v12, sel_initStore);
  name = v2->_name;
  v2->_name = (NSString *)CFSTR("Default");

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = objc_claimAutoreleasedReturnValue();
  container = v2->_container;
  v2->_container = (NSString *)v5;

  persistenceRecordIdentifier = v2->_persistenceRecordIdentifier;
  v2->_persistenceRecordIdentifier = 0;

  currentConnection = v2->_currentConnection;
  v2->_currentConnection = 0;

  v9 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v9;

  return v2;
}

- (MOLocalSettingsStore)initWithName:(id)a3
{
  NSString *v4;
  MOLocalSettingsStore *v5;
  NSString *name;

  v4 = (NSString *)a3;
  v5 = -[MOLocalSettingsStore init](self, "init");
  name = v5->_name;
  v5->_name = v4;

  return v5;
}

- (MOLocalSettingsStore)initWithSharedContainer:(id)a3
{
  NSString *v4;
  MOLocalSettingsStore *v5;
  NSString *container;

  v4 = (NSString *)a3;
  v5 = -[MOLocalSettingsStore init](self, "init");
  container = v5->_container;
  v5->_container = v4;

  return v5;
}

- (MOLocalSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4
{
  NSString *v6;
  NSString *v7;
  MOLocalSettingsStore *v8;
  NSString *name;
  NSString *v10;
  NSString *container;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v8 = -[MOLocalSettingsStore init](self, "init");
  name = v8->_name;
  v8->_name = v6;
  v10 = v6;

  container = v8->_container;
  v8->_container = v7;

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MOLocalSettingsStore clearCurrentConnectionAndInvalidate:](self, "clearCurrentConnectionAndInvalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MOLocalSettingsStore;
  -[MOLocalSettingsStore dealloc](&v3, sel_dealloc);
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
    v12[2] = __37__MOLocalSettingsStore_xpcConnection__block_invoke;
    v12[3] = &unk_1E675E388;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __37__MOLocalSettingsStore_xpcConnection__block_invoke_2;
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

void __37__MOLocalSettingsStore_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 1);

}

void __37__MOLocalSettingsStore_xpcConnection__block_invoke_2(uint64_t a1)
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
  void *v2;
  void *v3;
  char v4;

  -[MOLocalSettingsStore getStoreProperties](self, "getStoreProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("active"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("active");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore updateStoreProperties:](self, "updateStoreProperties:", v5);

}

- (BOOL)syncToWatch
{
  void *v2;
  void *v3;
  char v4;

  -[MOLocalSettingsStore getStoreProperties](self, "getStoreProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("syncToWatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setSyncToWatch:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("syncToWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore updateStoreProperties:](self, "updateStoreProperties:", v5);

}

- (id)getStoreProperties
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
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = (id)MEMORY[0x1E0C9AA70];
  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MOLocalSettingsStore_getStoreProperties__block_invoke;
  v6[3] = &unk_1E675E5F8;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v3, 1, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Getting store properties from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "persistenceRecordIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10;
    v13[3] = &unk_1E675E5D0;
    v14 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "getStorePropertiesForRecordIdentifier:storeContainer:storeName:replyHandler:", v8, v11, v12, v13);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_2();
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
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got store properties from store with container “%{public}@” and name “%{public}@”. Value: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_1(a1, v8);
  }

}

- (void)updateStoreProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MOLocalSettingsStore *v9;

  v4 = a3;
  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MOLocalSettingsStore_updateStoreProperties___block_invoke;
  v7[3] = &unk_1E675E9D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v5, 1, v7);

}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Updating store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”", buf, 0x20u);

    }
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "persistenceRecordIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "container");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13;
    v18[3] = &unk_1E675E9A8;
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = v16;
    v20 = v17;
    objc_msgSend(v5, "updateStoreProperties:recordIdentifier:storeContainer:storeName:replyHandler:", v12, v13, v14, v15, v18);

    v8 = v19;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setPersistenceRecordIdentifier:", a2);
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (void)clearAllSettings
{
  void *v3;
  _QWORD v4[5];

  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MOLocalSettingsStore_clearAllSettings__block_invoke;
  v4[3] = &unk_1E675E648;
  v4[4] = self;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v3, 1, v4);

}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
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
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Clearing all settings from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "persistenceRecordIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15;
    v13[3] = &unk_1E675E620;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "clearAllSettingsForRecordIdentifier:storeContainer:storeName:replyHandler:", v8, v11, v12, v13);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
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
      __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15_cold_1();
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
      _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, "Sucessfully cleared all settings from store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)deleteStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[MOLocalSettingsStore name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore persistenceRecordIdentifier](self, "persistenceRecordIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteStoresWithStoreNames:sharedContainer:recordIdentifier:", v7, v8, v9);

}

+ (void)deleteStoresWithStoreNames:(id)a3
{
  objc_msgSend(a1, "deleteStoresWithStoreNames:sharedContainer:recordIdentifier:", a3, 0, 0);
}

+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4
{
  objc_msgSend(a1, "deleteStoresWithStoreNames:sharedContainer:recordIdentifier:", a3, a4, 0);
}

+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4 recordIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[MOManagedSettingsAgentConnection oneTimeConnection](MOManagedSettingsAgentConnection, "oneTimeConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke;
  v15[3] = &unk_1E675EA20;
  v16 = v8;
  v17 = v7;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v11, 1, v15);

}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "processName");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[MOLogger store](MOLogger, "store");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1B4020000, v11, OS_LOG_TYPE_DEFAULT, "Deleting stores “%{public}@” from container “%{public}@”", buf, 0x16u);
    }

    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18;
    v15[3] = &unk_1E675E9F8;
    v16 = v13;
    v17 = v8;
    v18 = *(id *)(a1 + 56);
    v9 = v8;
    objc_msgSend(v5, "deleteStores:recordIdentifier:storeContainer:replyHandler:", v16, v14, v9, v15);

  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MOLogger store](MOLogger, "store");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, "Sucessfully deleted stores “%{public}@” from container “%{public}@”", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)batchUpdate:(id)a3
{
  NSString *name;
  NSString *container;
  void (**v5)(id, id);
  id v6;

  name = self->_name;
  container = self->_container;
  v5 = (void (**)(id, id))a3;
  +[MOBatchSettingsStore storeWithName:sharedContainer:](MOBatchSettingsStore, "storeWithName:sharedContainer:", name, container);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

  objc_msgSend(v6, "commitChanges");
}

+ (NSSet)stores
{
  return (NSSet *)objc_msgSend(a1, "storesForSharedContainer:", 0);
}

+ (id)storesForSharedContainer:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  +[MOManagedSettingsAgentConnection oneTimeConnection](MOManagedSettingsAgentConnection, "oneTimeConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke;
  v9[3] = &unk_1E675E518;
  v5 = v3;
  v10 = v5;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v6, 1, v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "processName");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[MOLogger store](MOLogger, "store");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1B4020000, v11, OS_LOG_TYPE_DEFAULT, "Getting stores for container “%{public}@”", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20;
    v14[3] = &unk_1E675E4F0;
    v15 = v8;
    v13 = *(_OWORD *)(a1 + 40);
    v12 = (id)v13;
    v16 = v13;
    v9 = v8;
    objc_msgSend(v5, "storeNamesForRecordIdentifier:storeContainer:replyHandler:", 0, v9, v14);

  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Sucessfully got stores “%{public}@” from container “%{public}@”", (uint8_t *)&v12, 0x16u);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v8 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  MOLocalSettingsStore *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke;
  v13[3] = &unk_1E675EA70;
  v10 = v8;
  v14 = v10;
  v15 = self;
  v16 = &v17;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v9, 1, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
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
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Getting “%{public}@” from store with container “%{public}@” and name “%{public}@”", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "persistenceRecordIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "container");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22;
    v16[3] = &unk_1E675EA48;
    v17 = *(id *)(a1 + 32);
    v18 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "getValuesForSettingNames:recordIdentifier:storeContainer:storeName:replyHandler:", v12, v13, v14, v15, v16);

    v8 = v17;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 40), "metadataForSettingKey:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPrivacySensitive");

    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v12)
        goto LABEL_10;
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20 = 138544130;
      v21 = v13;
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v17 = "Successfully got “%{public}@” from store with container “%{public}@” and name “%{public}@.” Value: %@";
    }
    else
    {
      if (!v12)
        goto LABEL_10;
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20 = 138544130;
      v21 = v18;
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = v19;
      v17 = "Successfully got “%{public}@” from store with container “%{public}@” and name “%{public}@.” Value: %{public}@";
    }
    _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, 0x2Au);

    goto LABEL_10;
  }
  +[MOLogger store](MOLogger, "store");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22_cold_1();
LABEL_10:

}

- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke;
  v13[3] = &unk_1E675EAC0;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v10, 1, v13);

}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  char v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(a1[4], "metadataForSettingKey:", a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPrivacySensitive");

    +[MOLogger store](MOLogger, "store");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v12 = a1[5];
        v11 = a1[6];
        objc_msgSend(a1[4], "container");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v12;
        v35 = 2112;
        v36 = v11;
        v37 = 2114;
        v38 = v13;
        v39 = 2114;
        v40 = v14;
        v15 = "Setting “%{public}@” to “%@” from store with container “%{public}@” and name “%{public}@”";
LABEL_9:
        _os_log_impl(&dword_1B4020000, v9, OS_LOG_TYPE_DEFAULT, v15, buf, 0x2Au);

      }
    }
    else if (v10)
    {
      v18 = a1[5];
      v17 = a1[6];
      objc_msgSend(a1[4], "container");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v18;
      v35 = 2114;
      v36 = v17;
      v37 = 2114;
      v38 = v13;
      v39 = 2114;
      v40 = v14;
      v15 = "Setting “%{public}@” to “%{public}@” from store with container “%{public}@” and name “%{public}@”";
      goto LABEL_9;
    }

    v19 = a1[6];
    v31 = a1[5];
    v32 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "persistenceRecordIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "container");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23;
    v26[3] = &unk_1E675EA98;
    v24 = a1[5];
    v25 = a1[4];
    v27 = v24;
    v28 = v25;
    v30 = v8;
    v29 = a1[6];
    objc_msgSend(v5, "setValues:recordIdentifier:storeContainer:storeName:replyHandler:", v20, v21, v22, v23, v26);

    v16 = v27;
    goto LABEL_11;
  }
  +[MOLogger store](MOLogger, "store");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
LABEL_11:

}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setPersistenceRecordIdentifier:", a2);
    v7 = *(unsigned __int8 *)(a1 + 56);
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v8)
        goto LABEL_10;
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v10;
      v18 = 2112;
      v19 = v9;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      v13 = "Successfully set “%{public}@” to “%@” from store with container “%{public}@” and name “%{public}@”";
    }
    else
    {
      if (!v8)
        goto LABEL_10;
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v15;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      v13 = "Successfully set “%{public}@” to “%{public}@” from store with container “%{public}@” and name “%{public}@”";
    }
    _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x2Au);

    goto LABEL_10;
  }
  +[MOLogger store](MOLogger, "store");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23_cold_1();
LABEL_10:

}

- (void)removeValueForSetting:(id)a3 inGroup:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MOLocalSettingsStore *v10;

  -[MOSettingsStore settingKeyFromSetting:group:](self, "settingKeyFromSetting:group:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOLocalSettingsStore xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke;
  v8[3] = &unk_1E675E9D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v6, 1, v8);

}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MOLogger store](MOLogger, "store");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Deleting “%{public}@” from store with container “%{public}@” and name “%{public}@”", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "persistenceRecordIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "container");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24;
    v18[3] = &unk_1E675E9A8;
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = v16;
    v20 = v17;
    objc_msgSend(v5, "removeValuesForSettingNames:recordIdentifier:storeContainer:storeName:replyHandler:", v12, v13, v14, v15, v18);

    v8 = v19;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }

}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setPersistenceRecordIdentifier:", a2);
    +[MOLogger store](MOLogger, "store");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "container");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B4020000, v6, OS_LOG_TYPE_DEFAULT, "Successfully deleted “%{public}@” from store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v10, 0x20u);

    }
  }

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
  objc_storeStrong((id *)&self->_persistenceRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_1B4020000, v0, v1, "Unable to obtain remote object proxy. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_11(&dword_1B4020000, a2, v6, "Unable to get store properties from store with container “%{public}@” and name “%{public}@”. Error: Unknown", (uint8_t *)&v7);

}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  OUTLINED_FUNCTION_6();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8_0(&dword_1B4020000, v0, v5, "Unable to get store properties from store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v1), "container");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B4020000, v3, v4, "Unable to update store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  OUTLINED_FUNCTION_6();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8_0(&dword_1B4020000, v0, v5, "Unable to clear all settings from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  OUTLINED_FUNCTION_8_0(&dword_1B4020000, v3, (uint64_t)v3, "Unable to delete stores “%{public}@” from container “%{public}@.” Error: %{public}@", v4);
}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  v3 = v0;
  OUTLINED_FUNCTION_11(&dword_1B4020000, v1, (uint64_t)v1, "Unable to get stores for container “%{public}@.” Error: %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v1), "container");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B4020000, v3, v4, "Unable to get “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v1), "container");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B4020000, v3, v4, "Unable to set “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v1), "container");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B4020000, v3, v4, "Unable to delete “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

@end
