@implementation ACNotifyAccountCache

- (void)cacheAccounts:(id)a3
{
  id v4;
  os_unfair_lock_s *p_notifyAccountCacheLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  ACNotifyAccountCache *v12;

  v4 = a3;
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __38__ACNotifyAccountCache_cacheAccounts___block_invoke;
  v10 = &unk_1E48925B8;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v7 = v8;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);

}

- (ACNotifyAccountCache)initWithKey:(id)a3
{
  id v4;
  ACNotifyReader *v5;
  ACNotifyAccountCache *v6;

  v4 = a3;
  v5 = -[ACNotifyReader initWithKey:updateQueue:updateBlock:]([ACNotifyReader alloc], "initWithKey:updateQueue:updateBlock:", v4, 0, 0);
  v6 = -[ACNotifyAccountCache initWithKey:reader:](self, "initWithKey:reader:", v4, v5);

  return v6;
}

- (ACNotifyAccountCache)initWithKey:(id)a3 reader:(id)a4
{
  id v6;
  id v7;
  ACNotifyAccountCache *v8;
  ACNotifyAccountCache *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACNotifyAccountCache;
  v8 = -[ACNotifyAccountCache init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ACNotifyAccountCache setKey:](v8, "setKey:", v6);
    -[ACNotifyAccountCache setReader:](v9, "setReader:", v7);
    v9->_notifyAccountCacheLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)setReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

+ (id)suffixForAccountsForAccountType:(id)a3 fetchOptions:(unint64_t)a4
{
  const __CFString *v4;

  v4 = CFSTR("all");
  if ((a4 & 1) == 0)
    v4 = CFSTR("active");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("account-type.%@.%@"), a3, v4);
}

+ (id)cacheKeyForSuffix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E4894AE8) & 1) == 0)
  {
    v7 = __testCachePrefix;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend(a1, "_getUID");
    if (v7)
      v10 = CFSTR("com.apple.accounts.notify-generation.unit-tests.%u.%@");
    else
      v10 = CFSTR("com.apple.accounts.notify-generation.%u.%@");
    objc_msgSend(v8, "stringWithFormat:", v10, v9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cachedAccounts
{
  os_unfair_lock_s *p_notifyAccountCacheLock;
  _QWORD *v5;
  void *v6;
  _QWORD v7[2];
  id (*v8)(uint64_t);
  void *v9;
  ACNotifyAccountCache *v10;

  if ((ACIsAccountsd() & 1) != 0)
    return 0;
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __38__ACNotifyAccountCache_cachedAccounts__block_invoke;
  v9 = &unk_1E4894288;
  v10 = self;
  v5 = v7;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v8((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_notifyAccountCacheLock);

  return v6;
}

void __38__ACNotifyAccountCache_cacheAccounts___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[ACNotifyAccountCache generationForAccounts:](ACNotifyAccountCache, "generationForAccounts:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "reader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentValue");

  if (v4 == v2)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", *(_QWORD *)(a1 + 32), 1);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v13, "_clearCachedCredentials", (_QWORD)v14);
          objc_msgSend(v13, "_clearCachedChildAccounts");
          objc_msgSend(v13, "_clearCachedTrackedSets");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_lock_clearCcachedAccounts");
  }
}

id __38__ACNotifyAccountCache_cachedAccounts__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v2 = +[ACNotifyAccountCache generationForAccounts:](ACNotifyAccountCache, "generationForAccounts:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "reader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentValue");

  if (!v4)
  {
    v5 = *(_QWORD **)(a1 + 32);
LABEL_9:
    objc_msgSend(v5, "_lock_clearCcachedAccounts");
    v7 = 0;
    return v7;
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[2];
  if (v4 != 1)
  {
    if (v6)
      v8 = v2 == v4;
    else
      v8 = 0;
    if (v8)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1);
      return v7;
    }
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
  v5[2] = MEMORY[0x1E0C9AA60];

  return v7;
}

- (ACNotifyReading)reader
{
  return (ACNotifyReading *)objc_getProperty(self, a2, 24, 1);
}

+ (unint64_t)generationForAccounts:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  v5 = 0;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v5 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "notifyGenerationID", (_QWORD)v12);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (void)_lock_clearCcachedAccounts
{
  NSArray *cachedAccounts;

  cachedAccounts = self->_cachedAccounts;
  self->_cachedAccounts = 0;

}

+ (unsigned)_getUID
{
  if (_getUID_onceToken != -1)
    dispatch_once(&_getUID_onceToken, &__block_literal_global_7);
  return _getUID__uid;
}

void __31__ACNotifyAccountCache__getUID__block_invoke()
{
  id v0;

  _getUID__uid = geteuid();
  if ((ACIsAccountsd() & 1) == 0 && !_getUID__uid)
  {
    +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _getUID__uid = objc_msgSend(v0, "_uidOfAccountsd");

  }
}

+ (void)__enableTestCacheID
{
  __testCachePrefix = 1;
}

- (unint64_t)generation
{
  os_unfair_lock_s *p_notifyAccountCacheLock;
  _QWORD *v3;
  unint64_t v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  ACNotifyAccountCache *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __34__ACNotifyAccountCache_generation__block_invoke;
  v8 = &unk_1E4894260;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __34__ACNotifyAccountCache_generation__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = +[ACNotifyAccountCache generationForAccounts:](ACNotifyAccountCache, "generationForAccounts:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "reader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "currentValue");

  if (v2 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

  }
}

- (void)clearCachedAccounts
{
  os_unfair_lock_s *p_notifyAccountCacheLock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  ACNotifyAccountCache *v7;

  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __43__ACNotifyAccountCache_clearCachedAccounts__block_invoke;
  v6 = &unk_1E4892AD8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);

}

uint64_t __43__ACNotifyAccountCache_clearCachedAccounts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_clearCcachedAccounts");
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
}

@end
