@implementation EDAccountRepository

void __26__EDAccountRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (EDAccountRepository)initWithAccountsProvider:(id)a3 hookRegistry:(id)a4
{
  id v7;
  id v8;
  EDAccountRepository *v9;
  EDAccountECAccountTransformer *v10;
  EDAccountECAccountTransformer *transformer;
  NSMutableSet *v12;
  NSMutableSet *observers;
  id WeakRetained;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDAccountRepository;
  v9 = -[EDAccountRepository init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(EDAccountECAccountTransformer);
    transformer = v9->_transformer;
    v9->_transformer = v10;

    objc_storeStrong((id *)&v9->_accountsProvider, a3);
    objc_storeWeak((id *)&v9->_hookRegistry, v8);
    v9->_lock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v9->_observers;
    v9->_observers = v12;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_hookRegistry);
    objc_msgSend(WeakRetained, "registerAccountChangeHookResponder:", v9);

    v15 = (void *)MEMORY[0x1E0D1E2C0];
    v19[0] = *MEMORY[0x1E0D1DFA0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addValidSortDescriptorKeyPaths:forTargetClass:", v16, objc_opt_class());

  }
  return v9;
}

id __41__EDAccountRepository_transformAccounts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EDAccountECAccountTransformer)transformer
{
  return self->_transformer;
}

uint64_t __41__EDAccountRepository_transformAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EFCFBCE8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isLocalAccount") ^ 1;
  else
    v6 = 1;

  return v6;
}

- (void)registerObserver:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id, _QWORD))a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_observers, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  v8 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__EDAccountRepository_registerObserver_completionHandler___block_invoke;
  v13[3] = &unk_1E949AD60;
  objc_copyWeak(&v15, &location);
  v9 = v6;
  v14 = v9;
  objc_msgSend(v8, "addCancelationBlock:", v13);
  -[EDAccountRepository allAccounts](self, "allAccounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAccountRepository log](EDAccountRepository, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134218498;
    v18 = v9;
    v19 = 2048;
    v20 = v12;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_INFO, "Registered EMAccountRepositoryObserver<%p> - Current observing accounts: Count: %lu\n %@ ", buf, 0x20u);
  }

  v7[2](v7, v10, v8, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)allAccounts
{
  void *v3;
  void *v4;
  void *v5;

  -[EDAccountRepository accountsProvider](self, "accountsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDAccountRepository transformAccounts:](self, "transformAccounts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transformAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "ef_filter:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__EDAccountRepository_transformAccounts___block_invoke_2;
  v8[3] = &unk_1E949ADA8;
  v8[4] = self;
  objc_msgSend(v5, "ef_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EDAccountRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __58__EDAccountRepository_registerObserver_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  id *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 4;
    v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    objc_msgSend(v4[1], "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3);
    WeakRetained = (os_unfair_lock_s *)v4;
  }

}

- (void)allAccountsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[EDAccountRepository allAccounts](self, "allAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAccountRepository log](EDAccountRepository, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "Returning %lu accounts", (uint8_t *)&v7, 0xCu);
  }

  v4[2](v4, v5, 0);
}

- (void)accountsAdded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDAccountRepository log](EDAccountRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "Handling accounts added: %@", buf, 0xCu);
  }

  -[EDAccountRepository transformAccounts:](self, "transformAccounts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)-[NSMutableSet copy](self->_observers, "copy");
    os_unfair_lock_unlock(p_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "accountsAdded:", v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)accountsRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDAccountRepository log](EDAccountRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "Handling accounts removed: %@", buf, 0xCu);
  }

  -[EDAccountRepository transformAccounts:](self, "transformAccounts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)-[NSMutableSet copy](self->_observers, "copy");
    os_unfair_lock_unlock(p_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "accountsRemoved:", v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)accountsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDAccountRepository log](EDAccountRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "Handling accounts changed: %@", buf, 0xCu);
  }

  -[EDAccountRepository transformAccounts:](self, "transformAccounts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)-[NSMutableSet copy](self->_observers, "copy");
    os_unfair_lock_unlock(p_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "accountsChanged:", v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return (EDPersistenceHookRegistry *)objc_loadWeakRetained((id *)&self->_hookRegistry);
}

- (void)setHookRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_hookRegistry, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hookRegistry);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
