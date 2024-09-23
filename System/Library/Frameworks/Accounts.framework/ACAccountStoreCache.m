@implementation ACAccountStoreCache

- (void)cacheAccounts:(id)a3 forSuffix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_accountNotifyCachesLock;
  _QWORD *v11;
  _QWORD v12[2];
  void (*v13)(_QWORD *);
  void *v14;
  ACAccountStoreCache *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if ((ACIsAccountsd() & 1) == 0)
  {
    +[ACNotifyAccountCache cacheKeyForSuffix:](ACNotifyAccountCache, "cacheKeyForSuffix:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v13 = __47__ACAccountStoreCache_cacheAccounts_forSuffix___block_invoke;
      v14 = &unk_1E48949E0;
      v15 = self;
      v16 = v8;
      v17 = v6;
      v11 = v12;
      os_unfair_lock_lock(p_accountNotifyCachesLock);
      v13(v11);
      os_unfair_lock_unlock(p_accountNotifyCachesLock);

    }
  }

}

void __47__ACAccountStoreCache_cacheAccounts_forSuffix___block_invoke(_QWORD *a1)
{
  void *v2;
  ACNotifyAccountCache *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = -[ACNotifyAccountCache initWithKey:]([ACNotifyAccountCache alloc], "initWithKey:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v3, a1[5]);

  }
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheAccounts:", a1[6]);

}

- (void)cacheAccountType:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accountTypeCacheLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  ACAccountStoreCache *v11;
  id v12;

  v4 = a3;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __40__ACAccountStoreCache_cacheAccountType___block_invoke;
  v10 = &unk_1E48925B8;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_accountTypeCacheLock);

}

uint64_t __40__ACAccountStoreCache_cacheAccountType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheAccountType:", *(_QWORD *)(a1 + 40));
}

- (void)_lock_cacheAccountType:(id)a3
{
  void *v4;
  NSMutableDictionary *accountTypeCache;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    accountTypeCache = self->_accountTypeCache;
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](accountTypeCache, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (id)cachedAccountTypeWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accountTypeCacheLock;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ACAccountStoreCache_cachedAccountTypeWithIdentifier___block_invoke;
  v9[3] = &unk_1E4894A08;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  ac_unfair_lock_perform_with_result_1(p_accountTypeCacheLock, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_15);
  return (id)sharedCache__sharedCache;
}

- (id)cachedAccountsForSuffix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if ((ACIsAccountsd() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[ACNotifyAccountCache cacheKeyForSuffix:](ACNotifyAccountCache, "cacheKeyForSuffix:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__ACAccountStoreCache_cachedAccountsForSuffix___block_invoke;
      v9[3] = &unk_1E48949B8;
      v9[4] = self;
      v10 = v6;
      ac_unfair_lock_perform_with_result_1(&self->_accountNotifyCachesLock, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

id __47__ACAccountStoreCache_cachedAccountsForSuffix___block_invoke(uint64_t a1)
{
  void *v2;
  ACNotifyAccountCache *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = -[ACNotifyAccountCache initWithKey:]([ACNotifyAccountCache alloc], "initWithKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__ACAccountStoreCache_cachedAccountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

void __34__ACAccountStoreCache_sharedCache__block_invoke()
{
  ACAccountStoreCache *v0;
  void *v1;

  v0 = objc_alloc_init(ACAccountStoreCache);
  v1 = (void *)sharedCache__sharedCache;
  sharedCache__sharedCache = (uint64_t)v0;

}

- (ACAccountStoreCache)init
{
  ACAccountStoreCache *v2;
  ACAccountStoreCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *accountNotifyCaches;
  uint64_t v6;
  NSMutableDictionary *accountTypeCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACAccountStoreCache;
  v2 = -[ACAccountStoreCache init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accountNotifyCachesLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accountNotifyCaches = v3->_accountNotifyCaches;
    v3->_accountNotifyCaches = v4;

    v3->_accountTypeCacheLock._os_unfair_lock_opaque = 0;
    v3->_allAccountTypeCached = 0;
    v6 = objc_opt_new();
    accountTypeCache = v3->_accountTypeCache;
    v3->_accountTypeCache = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (unint64_t)generationForCacheSuffix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_accountNotifyCachesLock;
  _QWORD *v8;
  unint64_t v9;
  _QWORD v11[2];
  void (*v12)(_QWORD *);
  void *v13;
  ACAccountStoreCache *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  +[ACNotifyAccountCache cacheKeyForSuffix:](ACNotifyAccountCache, "cacheKeyForSuffix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (v5)
  {
    p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v12 = __48__ACAccountStoreCache_generationForCacheSuffix___block_invoke;
    v13 = &unk_1E48943E8;
    v14 = self;
    v15 = v5;
    v16 = &v17;
    v8 = v11;
    os_unfair_lock_lock(p_accountNotifyCachesLock);
    v12(v8);
    os_unfair_lock_unlock(p_accountNotifyCachesLock);

    v9 = v18[3];
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __48__ACAccountStoreCache_generationForCacheSuffix___block_invoke(_QWORD *a1)
{
  void *v2;
  ACNotifyAccountCache *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = -[ACNotifyAccountCache initWithKey:]([ACNotifyAccountCache alloc], "initWithKey:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v3, a1[5]);

  }
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "generation");

}

- (void)cacheAllAccountTypes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accountTypeCacheLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  ACAccountStoreCache *v12;

  v4 = a3;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __44__ACAccountStoreCache_cacheAllAccountTypes___block_invoke;
  v10 = &unk_1E48925B8;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v7 = v8;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_accountTypeCacheLock);

}

void __44__ACAccountStoreCache_cacheAllAccountTypes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_lock_cacheAccountType:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
}

- (id)cachedAllAccountTypes
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__ACAccountStoreCache_cachedAllAccountTypes__block_invoke;
  v3[3] = &unk_1E4894288;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_1(&self->_accountTypeCacheLock, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__ACAccountStoreCache_cachedAllAccountTypes__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithArray:copyItems:", v3, 1);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_clearAllCaches
{
  uint64_t v3;
  os_unfair_lock_s *p_accountTypeCacheLock;
  _QWORD *v5;
  os_unfair_lock_s *p_accountNotifyCachesLock;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  ACAccountStoreCache *v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t);
  void *v14;
  ACAccountStoreCache *v15;

  v3 = MEMORY[0x1E0C809B0];
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __38__ACAccountStoreCache__clearAllCaches__block_invoke;
  v14 = &unk_1E4892AD8;
  v15 = self;
  v5 = v12;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v13((uint64_t)v5);
  os_unfair_lock_unlock(p_accountTypeCacheLock);

  p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
  v8[0] = v3;
  v8[1] = 3221225472;
  v9 = __38__ACAccountStoreCache__clearAllCaches__block_invoke_2;
  v10 = &unk_1E4892AD8;
  v11 = self;
  v7 = v8;
  os_unfair_lock_lock(p_accountNotifyCachesLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_accountNotifyCachesLock);

}

uint64_t __38__ACAccountStoreCache__clearAllCaches__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

uint64_t __38__ACAccountStoreCache__clearAllCaches__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNotifyCaches, 0);
  objc_storeStrong((id *)&self->_accountTypeCache, 0);
}

@end
