@implementation EMAccountRepository

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23E288);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_accountsAdded_, 0, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_accountsRemoved_, 0, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_accountsChanged_, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25F8C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_registerObserver_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23EB98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_registerObserver_completionHandler_, 1, 1);

  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_registerObserver_completionHandler_, 0, 0);
  return v8;
}

- (EMAccountRepository)initWithRemoteConnection:(id)a3
{
  id v4;
  EMAccountRepository *v5;
  EMAccountRepository *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  EFScheduler *recoveryHandlerScheduler;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMAccountRepository;
  v5 = -[EMRepository initWithRemoteConnection:](&v19, sel_initWithRemoteConnection_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.recoveryHandler"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialDispatchQueueSchedulerWithName:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    recoveryHandlerScheduler = v6->_recoveryHandlerScheduler;
    v6->_recoveryHandlerScheduler = (EFScheduler *)v9;

    v20[0] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMQuery addValidSortDescriptorKeyPaths:forTargetClass:](EMQuery, "addValidSortDescriptorKeyPaths:forTargetClass:", v11, objc_opt_class());

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke;
    v16[3] = &unk_1E70F1F78;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v4, "addResetHandler:", v16);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke_2;
    v14[3] = &unk_1E70F1F78;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "addRecoveryHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)requestAccounts
{
  EFScheduler *recoveryHandlerScheduler;
  _QWORD v3[5];

  recoveryHandlerScheduler = self->_recoveryHandlerScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__EMAccountRepository_requestAccounts__block_invoke;
  v3[3] = &unk_1E70F1FA0;
  v3[4] = self;
  -[EFScheduler performBlock:](recoveryHandlerScheduler, "performBlock:", v3);
}

- (void)_fetchAccountsAndObserveChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[EMRepository connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository observerScheduler](self, "observerScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMAccountRepository ef_onScheduler:](self, "ef_onScheduler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_79;
  v7[3] = &unk_1E70F1FE8;
  v7[4] = self;
  objc_msgSend(v4, "registerObserver:completionHandler:", v6, v7);

}

id __38__EMAccountRepository_requestAccounts__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_currentAccountsByObjectIDMap");
}

- (id)accountForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[EMAccountRepository _currentAccountsByObjectIDMap](self, "_currentAccountsByObjectIDMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_currentAccountsByObjectIDMap
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_accounts && self->_cancelable)
  {
    +[EMAccountRepository log](EMAccountRepository, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[EMAccountRepository _currentAccountsByObjectIDMap].cold.2((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    +[EMAccountRepository log](EMAccountRepository, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[EMAccountRepository _currentAccountsByObjectIDMap].cold.1((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);

    -[EMAccountRepository _fetchAccountsAndObserveChanges](self, "_fetchAccountsAndObserveChanges");
  }
  v18 = (void *)-[NSMutableDictionary copy](self->_accounts, "copy");
  os_unfair_lock_unlock(p_lock);
  return v18;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EMAccountRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __26__EMAccountRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[6];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke_3;
    v4[3] = &unk_1E70F1FA0;
    v5 = WeakRetained;
    objc_msgSend(v3, "performBlock:", v4);

  }
}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 32);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(a1 + 32), "_fetchAccountsAndObserveChanges");
  os_unfair_lock_unlock(v2);
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_cancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EMAccountRepository;
  -[EMAccountRepository dealloc](&v3, sel_dealloc);
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMAccountRepository log](EMAccountRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_cold_1((uint64_t)v2, v3);

}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_79(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[EMAccountRepository log](EMAccountRepository, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_79_cold_1(v11, v12, (uint8_t *)&v21, v10);
    }
  }
  else
  {
    +[EMAccountRepository log](EMAccountRepository, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = v7;
      _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "Initialized with accounts: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:", v7, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(_QWORD *)(a1 + 32);
    v20 = v8;
    v10 = *(NSObject **)(v19 + 56);
    *(_QWORD *)(v19 + 56) = v20;
  }

}

- (NSArray)allAccounts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[EMAccountRepository _currentAccountsByObjectIDMap](self, "_currentAccountsByObjectIDMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[EMAccount sortDescriptorForNameAscending:](EMAccount, "sortDescriptorForNameAscending:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)receivingAccounts
{
  void *v2;
  EMQuery *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  EMQuery *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[EMAccountRepository allAccounts](self, "allAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [EMQuery alloc];
  v4 = objc_opt_class();
  +[EMAccount predicateForReceivingAccounts](EMAccount, "predicateForReceivingAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMAccount sortDescriptorForNameAscending:](EMAccount, "sortDescriptorForNameAscending:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:](v3, "initWithTargetClass:predicate:sortDescriptors:", v4, v5, v7);

  -[EMQuery predicate](v8, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ef_map:", &__block_literal_global_85);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

id __40__EMAccountRepository_receivingAccounts__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (NSArray)deliveryAccounts
{
  void *v2;
  void *v3;

  -[EMAccountRepository receivingAccounts](self, "receivingAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_87);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __39__EMAccountRepository_deliveryAccounts__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "deliveryAccount");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accountForAccountIdentifier:(id)a3
{
  id v4;
  EMObjectID *v5;
  void *v6;

  v4 = a3;
  v5 = -[EMObjectID initWithRepresentedObjectID:]([EMObjectID alloc], "initWithRepresentedObjectID:", v4);
  -[EMAccountRepository accountForIdentifier:](self, "accountForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)accountsAdded:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *accounts;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMAccountRepository log](EMAccountRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Processing added accounts: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accounts = self->_accounts;
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](accounts, "addEntriesFromDictionary:", v9);

  os_unfair_lock_unlock(&self->_lock);
  -[EMAccountRepository _postAccountChangedNotification](self, "_postAccountChangedNotification");

}

- (void)accountsRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *accounts;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMAccountRepository log](EMAccountRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Processing removed accounts: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accounts = self->_accounts;
  objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](accounts, "removeObjectsForKeys:", v7);

  os_unfair_lock_unlock(&self->_lock);
  -[EMAccountRepository _postAccountChangedNotification](self, "_postAccountChangedNotification");

}

- (void)accountsChanged:(id)a3
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *accounts;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  +[EMAccountRepository log](EMAccountRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v12;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Processing changed accounts: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v12;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        accounts = self->_accounts;
        objc_msgSend(v9, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](accounts, "setObject:forKeyedSubscript:", v9, v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  -[EMAccountRepository _postAccountChangedNotification](self, "_postAccountChangedNotification");

}

- (void)_postAccountChangedNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("EMAccountsChangedNotification"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_recoveryHandlerScheduler, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch accounts %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_79_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "EMAccountRepository<%p> Registering observer for account changes failed with error: %{public}@", buf, 0x16u);

}

- (void)_currentAccountsByObjectIDMap
{
  OUTLINED_FUNCTION_0(&dword_1B99BB000, a2, a3, "EMAccountRepository<%p> already observing account changes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
