@implementation ACDKeychainCache

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "cachesByUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "cachesByUsername");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setCachesByUsername:", v11);

  }
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "nonSyncableItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    goto LABEL_8;
  }
  if (v12 == 1)
  {
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "syncableItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v12)
    return;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "nonSyncableItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = v13;
  objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

id __54__ACDKeychainCache_dataForService_username_syncState___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "cachesByUsername");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 56);
  switch(v5)
  {
    case 2:
      objc_msgSend(v4, "nonSyncableItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "syncableItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v11)
      {

      }
      else
      {
        v12 = (void *)v11;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v13)
        {
          if (v8)
            v14 = v8;
          else
            v14 = v10;
          v15 = v14;
          goto LABEL_11;
        }
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v16)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v17)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
          v1 = v15;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {

      }
      v1 = 0;
      goto LABEL_19;
    case 1:
      objc_msgSend(v4, "syncableItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0:
      objc_msgSend(v4, "nonSyncableItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v8 = v6;
      objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 48));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      break;
  }

  return v1;
}

- (NSDictionary)cachesByUsername
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)dataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_cachesLock;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD v16[2];
  id (*v17)(uint64_t);
  void *v18;
  ACDKeychainCache *v19;
  id v20;
  id v21;
  unint64_t v22;

  v8 = a3;
  v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v17 = __54__ACDKeychainCache_dataForService_username_syncState___block_invoke;
  v18 = &unk_24C7E2108;
  v19 = self;
  v11 = v9;
  v20 = v11;
  v22 = a5;
  v12 = v8;
  v21 = v12;
  v13 = v16;
  os_unfair_lock_lock(p_cachesLock);
  v17((uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_cachesLock);

  return v14;
}

- (void)cacheData:(id)a3 forService:(id)a4 username:(id)a5 syncState:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  os_unfair_lock_s *p_expirersLock;
  id v19;
  _QWORD *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  ACDKeychainCache *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[2];
  void (*v28)(uint64_t);
  void *v29;
  ACDKeychainCache *v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD v36[5];
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__0;
  v36[4] = __Block_byref_object_dispose__0;
  v37 = 0;
  v13 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v28 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke;
  v29 = &unk_24C7E2068;
  v34 = v36;
  v30 = self;
  v14 = v12;
  v31 = v14;
  v35 = a6;
  v15 = v10;
  v32 = v15;
  v16 = v11;
  v33 = v16;
  v17 = v27;
  os_unfair_lock_lock(&self->_cachesLock);
  v28((uint64_t)v17);
  os_unfair_lock_unlock(&self->_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v21[0] = v13;
  v21[1] = 3221225472;
  v22 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_2;
  v23 = &unk_24C7E20E0;
  v24 = self;
  v19 = v14;
  v25 = v19;
  v26 = v36;
  v20 = v21;
  os_unfair_lock_lock(p_expirersLock);
  v22((uint64_t)v20);
  os_unfair_lock_unlock(p_expirersLock);

  _Block_object_dispose(v36, 8);
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "expirersByUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDB4408], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirersByUsername");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_3;
  v7[3] = &unk_24C7E20B8;
  objc_copyWeak(&v10, &location);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "scheduleExpiration:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSMutableDictionary)expirersByUsername
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (ACDKeychainCache)initWithValidityDuration:(unsigned int)a3
{
  ACDKeychainCache *v4;
  uint64_t v5;
  NSDictionary *cachesByUsername;
  uint64_t v7;
  NSMutableDictionary *expirersByUsername;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACDKeychainCache;
  v4 = -[ACDKeychainCache init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cachesByUsername = v4->_cachesByUsername;
    v4->_cachesByUsername = (NSDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v7 = objc_claimAutoreleasedReturnValue();
    expirersByUsername = v4->_expirersByUsername;
    v4->_expirersByUsername = (NSMutableDictionary *)v7;

    *(_QWORD *)&v4->_cachesLock._os_unfair_lock_opaque = 0;
    v4->_cacheValidityDuration = a3;
  }
  return v4;
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t v10;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v7 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4;
    v8 = &unk_24C7E2090;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v10 = v4;
    v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);

  }
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4_cold_1(a1, v2);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "nonSyncableItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "syncableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)clearDataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_cachesLock;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  ACDKeychainCache *v17;
  id v18;
  id v19;
  unint64_t v20;

  v8 = a3;
  v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v15 = __59__ACDKeychainCache_clearDataForService_username_syncState___block_invoke;
  v16 = &unk_24C7E1FC8;
  v17 = self;
  v11 = v9;
  v18 = v11;
  v20 = a5;
  v12 = v8;
  v19 = v12;
  v13 = v14;
  os_unfair_lock_lock(p_cachesLock);
  v15((uint64_t)v13);
  os_unfair_lock_unlock(p_cachesLock);

}

void __59__ACDKeychainCache_clearDataForService_username_syncState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "cachesByUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 56);
  switch(v3)
  {
    case 2:
      objc_msgSend(v9, "nonSyncableItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v6 = (_QWORD *)(a1 + 48);
      objc_msgSend(v5, "removeObjectForKey:", v7);

      objc_msgSend(v9, "syncableItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      objc_msgSend(v8, "removeObjectForKey:", *v6);

      break;
    case 1:
      objc_msgSend(v9, "syncableItems");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(v9, "nonSyncableItems");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v4;
      v6 = (_QWORD *)(a1 + 48);
      goto LABEL_8;
  }

}

- (void)clearCacheForSyncState:(unint64_t)a3
{
  os_unfair_lock_s *p_cachesLock;
  uint64_t v5;
  _QWORD *v6;
  os_unfair_lock_s *p_expirersLock;
  _QWORD *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  ACDKeychainCache *v12;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  ACDKeychainCache *v16;
  unint64_t v17;

  p_cachesLock = &self->_cachesLock;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = __43__ACDKeychainCache_clearCacheForSyncState___block_invoke;
  v15 = &unk_24C7E1ED8;
  v16 = self;
  v17 = a3;
  v6 = v13;
  os_unfair_lock_lock(p_cachesLock);
  v14((uint64_t)v6);
  os_unfair_lock_unlock(p_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v9[0] = v5;
  v9[1] = 3221225472;
  v10 = __43__ACDKeychainCache_clearCacheForSyncState___block_invoke_2;
  v11 = &unk_24C7E2130;
  v12 = self;
  v8 = v9;
  os_unfair_lock_lock(p_expirersLock);
  v10((uint64_t)v8);
  os_unfair_lock_unlock(p_expirersLock);

}

void __43__ACDKeychainCache_clearCacheForSyncState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cachesByUsername", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 40);
        if (v9 == 2)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "nonSyncableItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeAllObjects");

LABEL_11:
          objc_msgSend(v8, "syncableItems");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        if (v9 == 1)
          goto LABEL_11;
        if (v9)
          goto LABEL_13;
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "nonSyncableItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v12 = v10;
        objc_msgSend(v10, "removeAllObjects");

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

void __43__ACDKeychainCache_clearCacheForSyncState___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "expirersByUsername");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (unsigned)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(unsigned int)a3
{
  self->_cacheValidityDuration = a3;
}

- (void)setCachesByUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setExpirersByUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirersByUsername, 0);
  objc_storeStrong((id *)&self->_cachesByUsername, 0);
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "@\"Clearing keychain cache for %@\", (uint8_t *)&v3, 0xCu);
}

@end
