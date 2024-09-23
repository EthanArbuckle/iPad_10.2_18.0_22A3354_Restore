@implementation CNManagedAccountsCache

void __37__CNManagedAccountsCache_sharedCache__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCache_cn_once_object_2;
  sharedCache_cn_once_object_2 = (uint64_t)v1;

}

- (CNManagedAccountsCache)init
{
  CNManagedAccountsCache *v2;
  uint64_t v3;
  CNCache *accountsCache;
  ACAccountStore *v5;
  ACAccountStore *accountStore;
  CNManagedAccountsCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNManagedAccountsCache;
  v2 = -[CNManagedAccountsCache init](&v9, sel_init);
  if (v2)
  {
    +[CNCache atomicCache](CNCache, "atomicCache");
    v3 = objc_claimAutoreleasedReturnValue();
    accountsCache = v2->_accountsCache;
    v2->_accountsCache = (CNCache *)v3;

    v5 = (ACAccountStore *)objc_alloc_init(getACAccountStoreClass());
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    v7 = v2;
  }

  return v2;
}

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CNManagedAccountsCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_cn_once_token_2 != -1)
    dispatch_once(&sharedCache_cn_once_token_2, block);
  return (id)sharedCache_cn_once_object_2;
}

- (id)accountForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CNManagedAccountsCache accountsCache](self, "accountsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__CNManagedAccountsCache_accountForIdentifier___block_invoke;
  v9[3] = &unk_1E29B97A8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectForKey:onCacheMiss:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __47__CNManagedAccountsCache_accountForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountsForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CNManagedAccountsCache accountForIdentifier:](self, "accountForIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)clearCache
{
  id v2;

  -[CNManagedAccountsCache accountsCache](self, "accountsCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (CNCache)accountsCache
{
  return self->_accountsCache;
}

- (void)setAccountsCache:(id)a3
{
  objc_storeStrong((id *)&self->_accountsCache, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountsCache, 0);
}

@end
