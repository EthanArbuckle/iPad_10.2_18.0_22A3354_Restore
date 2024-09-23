@implementation ACDAccountCache

id __42__ACDAccountCache_cachedAccountTypeForID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountTypesByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSMutableDictionary)cachedAccountTypesByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)cachedAccountIDsByType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (id)_keyForType:(id)a3 justActive:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("all");
  if (a4)
    v4 = CFSTR("active");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a3, v4);
}

- (NSMutableDictionary)cachedAccountsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4
{
  return -[ACDAccountCache cachedAccountsOfType:justActive:fetchBlock:](self, "cachedAccountsOfType:justActive:fetchBlock:", a3, a4, 0);
}

- (id)cachedAccountTypeForID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachesLock;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__ACDAccountCache_cachedAccountTypeForID___block_invoke;
  v9[3] = &unk_24C7E21D0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  ac_unfair_lock_perform_with_result(p_cachesLock, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __46__ACDAccountCache_cachedAccountForIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_lock_nonCopyOfAccountWithIdentifier:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_3(uint64_t a1)
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
    v7 = __36__ACDAccountCache_cacheAccountType___block_invoke_4;
    v8 = &unk_24C7E2180;
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

void __36__ACDAccountCache_cacheAccountType___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __36__ACDAccountCache_cacheAccountType___block_invoke_4_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "cachedAccountTypesByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

}

uint64_t __32__ACDAccountCache_cacheAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheAccount:", *(_QWORD *)(a1 + 40));
}

- (void)cacheAccountType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  os_unfair_lock_s *p_expirersLock;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  ACDAccountCache *v18;
  id v19;
  id v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  ACDAccountCache *v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _expirerIdentifierForAccountTypeID:](self, "_expirerIdentifierForAccountTypeID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v22 = __36__ACDAccountCache_cacheAccountType___block_invoke;
  v23 = &unk_24C7E2180;
  v24 = self;
  v9 = v5;
  v25 = v9;
  v10 = v21;
  os_unfair_lock_lock(&self->_cachesLock);
  v22((uint64_t)v10);
  os_unfair_lock_unlock(&self->_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v15[0] = v8;
  v15[1] = 3221225472;
  v16 = __36__ACDAccountCache_cacheAccountType___block_invoke_2;
  v17 = &unk_24C7E2248;
  v18 = self;
  v12 = v7;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v14 = v15;
  os_unfair_lock_lock(p_expirersLock);
  v16((uint64_t)v14);
  os_unfair_lock_unlock(p_expirersLock);

}

void __36__ACDAccountCache_cacheAccountType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cachedAccountTypesByID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

- (id)_expirerIdentifierForAccountTypeID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("account-type.%@"), a3);
}

- (void)cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_cachesLock;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  ACDAccountCache *v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v15 = __52__ACDAccountCache_cacheAccounts_forType_justActive___block_invoke;
  v16 = &unk_24C7E21F8;
  v17 = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v20 = a5;
  v13 = v14;
  os_unfair_lock_lock(p_cachesLock);
  v15((uint64_t)v13);
  os_unfair_lock_unlock(p_cachesLock);

}

uint64_t __52__ACDAccountCache_cacheAccounts_forType_justActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_caches_lock_cacheAccounts:forType:justActive:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_cachesLock;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t);
  void *v14;
  ACDAccountCache *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  p_cachesLock = &self->_cachesLock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = __58__ACDAccountCache_cacheGenerationForAccounts_cacheSuffix___block_invoke;
  v14 = &unk_24C7E2248;
  v15 = self;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v11 = v12;
  os_unfair_lock_lock(p_cachesLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_cachesLock);

}

uint64_t __58__ACDAccountCache_cacheGenerationForAccounts_cacheSuffix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheGenerationForAccounts:cacheSuffix:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_lock_cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDB43D8];
  v7 = a3;
  objc_msgSend(v6, "cacheKeyForSuffix:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _lock_writerForKey:](self, "_lock_writerForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x24BDB43D8], "generationForAccounts:", v7);

  objc_msgSend(v8, "write:", v9);
}

- (id)_lock_writerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    -[ACDAccountCache generationWritersByKey](self, "generationWritersByKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43E0]), "initWithKey:", v4);
      -[ACDAccountCache generationWritersByKey](self, "generationWritersByKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v4);

    }
    -[ACDAccountCache generationWritersByKey](self, "generationWritersByKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)generationWritersByKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_2(uint64_t a1)
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

  objc_msgSend(*(id *)(a1 + 32), "expirersByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDB4408], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirersByID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ACDAccountCache_cacheAccountType___block_invoke_3;
  v7[3] = &unk_24C7E2220;
  objc_copyWeak(&v10, &location);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "scheduleExpiration:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSMutableDictionary)expirersByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)cacheAccount:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachesLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  ACDAccountCache *v11;
  id v12;

  v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = __32__ACDAccountCache_cacheAccount___block_invoke;
  v10 = &unk_24C7E2180;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_cachesLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_cachesLock);

}

- (id)cachedAccountForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachesLock;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__ACDAccountCache_cachedAccountForIdentifier___block_invoke;
  v9[3] = &unk_24C7E21D0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  ac_unfair_lock_perform_with_result(p_cachesLock, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ACDAccountCache)initWithValidityDuration:(unsigned int)a3
{
  ACDAccountCache *v4;
  uint64_t v5;
  NSMutableDictionary *cachedAccountsByID;
  uint64_t v7;
  NSMutableDictionary *cachedAccountIDsByType;
  uint64_t v9;
  NSMutableDictionary *cachedAccountTypesByID;
  uint64_t v11;
  NSMutableDictionary *expirersByID;
  uint64_t v13;
  NSMutableDictionary *generationWritersByKey;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ACDAccountCache;
  v4 = -[ACDAccountCache init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 20);
    v5 = objc_claimAutoreleasedReturnValue();
    cachedAccountsByID = v4->_cachedAccountsByID;
    v4->_cachedAccountsByID = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v7 = objc_claimAutoreleasedReturnValue();
    cachedAccountIDsByType = v4->_cachedAccountIDsByType;
    v4->_cachedAccountIDsByType = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 20);
    v9 = objc_claimAutoreleasedReturnValue();
    cachedAccountTypesByID = v4->_cachedAccountTypesByID;
    v4->_cachedAccountTypesByID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v11 = objc_claimAutoreleasedReturnValue();
    expirersByID = v4->_expirersByID;
    v4->_expirersByID = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v13 = objc_claimAutoreleasedReturnValue();
    generationWritersByKey = v4->_generationWritersByKey;
    v4->_generationWritersByKey = (NSMutableDictionary *)v13;

    *(_QWORD *)&v4->_cachesLock._os_unfair_lock_opaque = 0;
    v4->_cacheValidityDuration = a3;
  }
  return v4;
}

- (void)_lock_cacheAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "parentAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDAccountCache _lock_cacheParent:](self, "_lock_cacheParent:", v7);

    }
    -[ACDAccountCache _lock_cacheAccountCopy:](self, "_lock_cacheAccountCopy:", v4);
  }
  else
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACDAccountCache _lock_cacheAccount:].cold.1((uint64_t)v4, v8);

  }
}

- (void)_expirerScheduleForAccountIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_expirersLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  ACDAccountCache *v11;
  id v12;

  v4 = a3;
  p_expirersLock = &self->_expirersLock;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke;
  v10 = &unk_24C7E2180;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_expirersLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_expirersLock);

}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "expirersByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDB4408], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirersByID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_2;
  v5[3] = &unk_24C7E21A8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "scheduleExpiration:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  os_unfair_lock_s *v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v5 = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3;
    v6 = &unk_24C7E2180;
    v7 = *(id *)(a1 + 32);
    v8 = WeakRetained;
    v3 = v4;
    os_unfair_lock_lock(WeakRetained + 2);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(WeakRetained + 2);

  }
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3_cold_1(a1, v2, v3);

  objc_msgSend(*(id *)(a1 + 40), "cachedAccountsByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)_lock_cacheParent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ACDAccountCache cachedAccountsByID](self, "cachedAccountsByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, v5);

  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _expirerScheduleForAccountIdentifier:](self, "_expirerScheduleForAccountIdentifier:", v6);

  objc_msgSend(v9, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "parentAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDAccountCache _lock_cacheParent:](self, "_lock_cacheParent:", v8);

  }
}

- (void)_lock_cacheAccountCopy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  ACDAccountCache *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACDAccountCache cachedAccountsByID](self, "cachedAccountsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _expirerScheduleForAccountIdentifier:](self, "_expirerScheduleForAccountIdentifier:", v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = self;
  -[ACDAccountCache cachedAccountsByID](self, "cachedAccountsByID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "parentAccount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (v18)
        {
          objc_msgSend(v14, "_resetParentAccount:", v4);
          -[ACDAccountCache _lock_cacheAccountCopy:](v19, "_lock_cacheAccountCopy:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

}

- (id)_lock_nonCopyOfAccountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACDAccountCache cachedAccountsByID](self, "cachedAccountsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_caches_lock_cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_unfair_lock_s *p_expirersLock;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[2];
  void (*v23)(uint64_t);
  void *v24;
  ACDAccountCache *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v8, 1);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        -[ACDAccountCache _lock_cacheAccount:](self, "_lock_cacheAccount:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDB43D8], "suffixForAccountsForAccountType:fetchOptions:", v9, v5 ^ 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _lock_cacheGenerationForAccounts:cacheSuffix:](self, "_lock_cacheGenerationForAccounts:cacheSuffix:", v8, v14);

  -[ACDAccountCache _keyForType:justActive:](self, "_keyForType:justActive:", v9, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache cachedAccountIDsByType](self, "cachedAccountIDsByType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v15);

  p_expirersLock = &self->_expirersLock;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v23 = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke;
  v24 = &unk_24C7E2248;
  v25 = self;
  v19 = v9;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  v21 = v22;
  os_unfair_lock_lock(p_expirersLock);
  v23((uint64_t)v21);
  os_unfair_lock_unlock(p_expirersLock);

}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(a1 + 32), "expirersByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDB4408], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirersByID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_2;
  v7[3] = &unk_24C7E2220;
  objc_copyWeak(&v10, &location);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "scheduleExpiration:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_2(uint64_t a1)
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
    v7 = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3;
    v8 = &unk_24C7E2180;
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

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3_cold_1(a1, v2, v3);

  objc_msgSend(*(id *)(a1 + 40), "cachedAccountIDsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4 fetchBlock:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_cachesLock;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  p_cachesLock = &self->_cachesLock;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__ACDAccountCache_cachedAccountsOfType_justActive_fetchBlock___block_invoke;
  v15[3] = &unk_24C7E2270;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  ac_unfair_lock_perform_with_result(p_cachesLock, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __62__ACDAccountCache_cachedAccountsOfType_justActive_fetchBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_keyForType:justActive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedAccountIDsByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        objc_msgSend(v5, "addObject:", v13);

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    v14 = objc_msgSend(v5, "count");
    if (v14 == objc_msgSend(v6, "count"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v5, 1);

      if (v15)
        goto LABEL_17;
    }
    else
    {

    }
  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    (*(void (**)(void))(v16 + 16))();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_caches_lock_cacheAccounts:forType:justActive:", v17, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v17, 1);

  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

- (void)_lock_removeAccountsForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ACDAccountCache cachedAccountIDsByType](self, "cachedAccountIDsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _keyForType:justActive:](self, "_keyForType:justActive:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  -[ACDAccountCache cachedAccountIDsByType](self, "cachedAccountIDsByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountCache _keyForType:justActive:](self, "_keyForType:justActive:", v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  -[ACDAccountCache _lock_resetGenerationForType:](self, "_lock_resetGenerationForType:", v8);
}

- (void)removeAccountType:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachesLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  ACDAccountCache *v11;
  id v12;

  v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = __37__ACDAccountCache_removeAccountType___block_invoke;
  v10 = &unk_24C7E2180;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_cachesLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_cachesLock);

}

uint64_t __37__ACDAccountCache_removeAccountType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountTypesByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lock_removeAccountsForType:", v5);

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_lock_resetAllAccountTypeIdentifiers");
}

- (void)removeAccount:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_cachesLock;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  ACDAccountCache *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  p_cachesLock = &self->_cachesLock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = __39__ACDAccountCache_removeAccount_store___block_invoke;
  v14 = &unk_24C7E2248;
  v15 = self;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v11 = v12;
  os_unfair_lock_lock(p_cachesLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_cachesLock);

}

void __39__ACDAccountCache_removeAccount_store___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "parentAccount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v16);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_lock_removeAccountsForType:", v19);

  v20 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_childAccountsForAccountWithID:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_lock_resetCacheGenerationsForChildren:recurseDepth:store:", v22, 1, *(_QWORD *)(a1 + 48));
}

- (void)clearCache
{
  os_unfair_lock_s *p_cachesLock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  ACDAccountCache *v7;

  p_cachesLock = &self->_cachesLock;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v5 = __29__ACDAccountCache_clearCache__block_invoke;
  v6 = &unk_24C7E2130;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_cachesLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_cachesLock);

}

uint64_t __29__ACDAccountCache_clearCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountIDsByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "cachedAccountTypesByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_lock_resetAllAccountTypeIdentifiers");
}

- (void)_resetParentAccountForCachedAccountIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACDAccountCache cachedAccountsByID](self, "cachedAccountsByID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v9, "_resetParentAccount:", v8);

  }
}

- (void)_lock_resetCacheGenerationsForChildren:(id)a3 recurseDepth:(unint64_t)a4 store:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (a4 <= 0xA)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v13 = a4 + 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v15, "accountType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountCache _lock_resetGenerationForType:](self, "_lock_resetGenerationForType:", v17);

          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_childAccountsForAccountWithID:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count"))
            -[ACDAccountCache _lock_resetCacheGenerationsForChildren:recurseDepth:store:](self, "_lock_resetCacheGenerationsForChildren:recurseDepth:store:", v19, v13, v9);

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
  }

}

- (void)_lock_resetAllAccountTypeIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ACDAccountCache _lock_resetGenerationForType:](self, "_lock_resetGenerationForType:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_lock_resetGenerationForType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDB43D8];
  v5 = a3;
  objc_msgSend(v4, "suffixForAccountsForAccountType:fetchOptions:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheKeyForSuffix:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[ACDAccountCache _lock_writerForKey:](self, "_lock_writerForKey:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "write:", objc_msgSend(MEMORY[0x24BDB43D8], "generationForAccounts:", 0));

  v8 = (void *)MEMORY[0x24BDB43D8];
  objc_msgSend(MEMORY[0x24BDB43D8], "suffixForAccountsForAccountType:fetchOptions:", v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cacheKeyForSuffix:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDAccountCache _lock_writerForKey:](self, "_lock_writerForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "write:", objc_msgSend(MEMORY[0x24BDB43D8], "generationForAccounts:", 0));

}

- (void)setCacheValidityDuration:(unsigned int)a3
{
  self->_cacheValidityDuration = a3;
}

- (void)setCachedAccountsByID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setCachedAccountIDsByType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setCachedAccountTypesByID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setExpirersByID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setGenerationWritersByKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationWritersByKey, 0);
  objc_storeStrong((id *)&self->_expirersByID, 0);
  objc_storeStrong((id *)&self->_cachedAccountTypesByID, 0);
  objc_storeStrong((id *)&self->_cachedAccountIDsByType, 0);
  objc_storeStrong((id *)&self->_cachedAccountsByID, 0);
}

- (void)_lock_cacheAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_ERROR, "\"ACDAccountCache just ran into an account (%@) missing an identifier, not caching it\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, a3, "@\"Clearing account cache for %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, a3, "@\"Clearing accounts cached for type: %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v4, "@\"Clearing type cached for %@\", (uint8_t *)&v5);

}

@end
