@implementation AIDAAccountManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)accounts
{
  os_unfair_lock_s *p_accountManagerLock;
  NSDictionary *accounts;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  void *v8;

  p_accountManagerLock = &self->_accountManagerLock;
  os_unfair_lock_lock(&self->_accountManagerLock);
  accounts = self->_accounts;
  if (!accounts)
  {
    -[AIDAAccountManager _delegate_accountsForAccountManager](self, "_delegate_accountsForAccountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSDictionary *)objc_msgSend(v5, "copy");
    v7 = self->_accounts;
    self->_accounts = v6;

    accounts = self->_accounts;
  }
  v8 = (void *)-[NSDictionary copy](accounts, "copy");
  os_unfair_lock_unlock(p_accountManagerLock);
  return (NSDictionary *)v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AIDAAccountManager;
  -[AIDAAccountManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_handlerByObserver, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
}

- (AIDAAccountManager)initWithAccountStore:(id)a3
{
  id v5;
  AIDAAccountManager *v6;
  AIDAAccountManager *v7;
  AIDAServiceOwnersManager *v8;
  AIDAServiceOwnerProtocol *serviceOwnersManager;
  uint64_t v10;
  NSMutableDictionary *handlerByObserver;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AIDAAccountManager;
  v6 = -[AIDAAccountManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = -[AIDAServiceOwnersManager initWithAccountStore:]([AIDAServiceOwnersManager alloc], "initWithAccountStore:", v5);
    serviceOwnersManager = v7->_serviceOwnersManager;
    v7->_serviceOwnersManager = (AIDAServiceOwnerProtocol *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    handlerByObserver = v7->_handlerByObserver;
    v7->_handlerByObserver = (NSMutableDictionary *)v10;

    v7->_accountManagerLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F010], 0);

  }
  return v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (id)_delegate_accountsForAccountManager
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[AIDAAccountManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AIDAAccountManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountsForAccountManager:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AIDALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AIDAAccountManager _delegate_accountsForAccountManager].cold.1(self, v7);

    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v6;
}

- (AIDAAccountManagerDelegate)delegate
{
  return (AIDAAccountManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AIDAAccountManager)init
{
  -[AIDAAccountManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)setAccounts:(id)a3
{
  NSDictionary *v4;
  NSDictionary *accounts;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_accountManagerLock);
  accounts = self->_accounts;
  self->_accounts = v4;

  os_unfair_lock_unlock(&self->_accountManagerLock);
}

- (id)aidaAccountForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AIDAAccountManager accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AIDAServiceOwnerProtocol altDSIDForAccount:service:](self->_serviceOwnersManager, "altDSIDForAccount:service:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AIDAAccountManager accountStore](self, "accountStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aida_accountForAltDSID:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_accountStoreDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  +[AIDAAccountManager _accountStoreChangeQueue](AIDAAccountManager, "_accountStoreChangeQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AIDAAccountManager__accountStoreDidChange___block_invoke;
  block[3] = &unk_1E985B638;
  block[4] = self;
  dispatch_async(v4, block);

}

void __45__AIDAAccountManager__accountStoreDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAccounts:", 0);
  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    v9 = MEMORY[0x1E0C80D38];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __45__AIDAAccountManager__accountStoreDidChange___block_invoke_2;
        block[3] = &unk_1E985B610;
        v15 = v11;
        v13 = v2;
        v14 = v3;
        dispatch_async(v9, block);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

uint64_t __45__AIDAAccountManager__accountStoreDidChange___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addAccountChangeObserver:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AIDAAccountManager _accountStoreChangeQueue](AIDAAccountManager, "_accountStoreChangeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AIDAAccountManager_addAccountChangeObserver_handler___block_invoke;
  block[3] = &unk_1E985B660;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __55__AIDAAccountManager_addAccountChangeObserver_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 24);
  v3 = (id)MEMORY[0x1D826560C](a1[6]);
  objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);

}

- (void)removeAccountChangeObserver:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AIDAAccountManager _accountStoreChangeQueue](AIDAAccountManager, "_accountStoreChangeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AIDAAccountManager_removeAccountChangeObserver___block_invoke;
  v7[3] = &unk_1E985B688;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__AIDAAccountManager_removeAccountChangeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

+ (id)_accountStoreChangeQueue
{
  if (_accountStoreChangeQueue_onceToken != -1)
    dispatch_once(&_accountStoreChangeQueue_onceToken, &__block_literal_global);
  return (id)_accountStoreChangeQueue__accountStoreChangeQueue;
}

void __46__AIDAAccountManager__accountStoreChangeQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("AIDAAccountChangeQueue", v2);
  v1 = (void *)_accountStoreChangeQueue__accountStoreChangeQueue;
  _accountStoreChangeQueue__accountStoreChangeQueue = (uint64_t)v0;

}

- (void)_delegate_accountsForAccountManager
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D4C1F000, a2, OS_LOG_TYPE_ERROR, "Delegate %{public}@ failed respond to -accountsForAccountManager: !", (uint8_t *)&v4, 0xCu);

}

@end
