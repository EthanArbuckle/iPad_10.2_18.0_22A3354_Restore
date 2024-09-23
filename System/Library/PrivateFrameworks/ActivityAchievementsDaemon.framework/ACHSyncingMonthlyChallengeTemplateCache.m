@implementation ACHSyncingMonthlyChallengeTemplateCache

- (ACHSyncingMonthlyChallengeTemplateCache)initWithHealthStore:(id)a3
{
  id v5;
  ACHSyncingMonthlyChallengeTemplateCache *v6;
  ACHSyncingMonthlyChallengeTemplateCache *v7;
  uint64_t v8;
  NSCalendar *gregorianCalendar;
  uint64_t v10;
  HKKeyValueDomain *kvDomain;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHSyncingMonthlyChallengeTemplateCache;
  v6 = -[ACHSyncingMonthlyChallengeTemplateCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v8 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v7->_gregorianCalendar;
    v7->_gregorianCalendar = (NSCalendar *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3C98]), "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.ActivityAchievements.MonthlyChallengeTemplateCache"), v5);
    kvDomain = v7->_kvDomain;
    v7->_kvDomain = (HKKeyValueDomain *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (ACHSyncingMonthlyChallengeTemplateCache)initWithProfile:(id)a3
{
  id v4;
  ACHSyncingMonthlyChallengeTemplateCache *v5;
  ACHSyncingMonthlyChallengeTemplateCache *v6;
  uint64_t v7;
  NSCalendar *gregorianCalendar;
  id v9;
  id WeakRetained;
  uint64_t v11;
  HDKeyValueDomain *keyValueDomain;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACHSyncingMonthlyChallengeTemplateCache;
  v5 = -[ACHSyncingMonthlyChallengeTemplateCache init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v7 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;

    v9 = objc_alloc(MEMORY[0x24BE40AD0]);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = objc_msgSend(v9, "initWithCategory:domainName:profile:", 105, CFSTR("com.apple.ActivityAchievements.MonthlyChallengeTemplateCache"), WeakRetained);
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = (HDKeyValueDomain *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)cacheTemplate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  -[ACHSyncingMonthlyChallengeTemplateCache healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[ACHSyncingMonthlyChallengeTemplateCache _store_cacheTemplate:error:](self, "_store_cacheTemplate:error:", v6, a4);
  else
    v8 = -[ACHSyncingMonthlyChallengeTemplateCache _daemon_cacheTemplate:error:](self, "_daemon_cacheTemplate:error:", v6, a4);
  v9 = v8;

  return v9;
}

- (BOOL)_store_cacheTemplate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  char v14;
  NSObject *v15;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _ACHMonthlyChallengeKeyFromTemplate(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACHMonthlyChallengeCacheValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[ACHSyncingMonthlyChallengeTemplateCache kvDomain](self, "kvDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringForKey:error:", v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (*a4)
    {
      ACHLogMonthlyChallenges();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *a4;
        v18 = 138412290;
        v19 = v13;
        _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Unable to access values in key-value domain for cache: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    else
    {
      if (!v11)
      {
        os_unfair_lock_lock(&self->_lock);
        -[ACHSyncingMonthlyChallengeTemplateCache kvDomain](self, "kvDomain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v17, "setString:forKey:error:", v8, v7, a4);

        os_unfair_lock_unlock(p_lock);
        goto LABEL_12;
      }
      ACHLogMonthlyChallenges();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412802;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Monthly challenge already cached for %@; ignoring template %@ in favor of %@",
          (uint8_t *)&v18,
          0x20u);
      }

    }
    v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_daemon_cacheTemplate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  NSObject *v16;
  void *v18;
  os_unfair_lock_t lock;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v6 = a3;
  _ACHMonthlyChallengeKeyFromTemplate(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACHMonthlyChallengeCacheValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[ACHSyncingMonthlyChallengeTemplateCache keyValueDomain](self, "keyValueDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BE40B88];
    -[ACHSyncingMonthlyChallengeTemplateCache profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHSyncingMonthlyChallengeTemplateCache databaseContext](self, "databaseContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke;
    v24[3] = &unk_24D13B558;
    v25 = v9;
    v26 = v7;
    v27 = v8;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_204;
    v20[3] = &unk_24D13B648;
    v14 = v25;
    v21 = v14;
    v22 = v27;
    v23 = v26;
    v15 = objc_msgSend(v18, "performWriteTransactionWithHealthDatabase:context:error:block:inaccessibilityHandler:", v11, v12, a4, v24, v20);

    os_unfair_lock_unlock(lock);
    if (*a4)
    {
      ACHLogMonthlyChallenges();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ACHSyncingMonthlyChallengeTemplateCache _daemon_cacheTemplate:error:].cold.1();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

_QWORD *__71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stringForKey:error:", *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!v3 || !*v3)
    {
      v3 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "setString:forKey:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
      goto LABEL_13;
    }
    ACHLogMonthlyChallenges();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_cold_1(v5, v3, v12);

    goto LABEL_11;
  }
  ACHLogMonthlyChallenges();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Monthly challenge already cached for %@; ignoring template %@ in favor of %@",
      buf,
      0x20u);
  }

  if (v3)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Monthly challenge already cached for requested month/year combination.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 42, v11);
    *v3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v3 = 0;
  }
LABEL_13:

  return v3;
}

uint64_t __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setString:forKey:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (id)allCachedTemplatesWithError:(id *)a3
{
  void *v5;

  -[ACHSyncingMonthlyChallengeTemplateCache healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[ACHSyncingMonthlyChallengeTemplateCache _store_allCachedTemplatesWithError:](self, "_store_allCachedTemplatesWithError:", a3);
  else
    -[ACHSyncingMonthlyChallengeTemplateCache _daemon_allCachedTemplatesWithError:](self, "_daemon_allCachedTemplatesWithError:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_store_allCachedTemplatesWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  dispatch_semaphore_t v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  dispatch_semaphore_t dsema;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  dispatch_semaphore_t v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = dispatch_semaphore_create(0);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__8;
  v35[4] = __Block_byref_object_dispose__8;
  v36 = 0;
  -[ACHSyncingMonthlyChallengeTemplateCache kvDomain](self, "kvDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __78__ACHSyncingMonthlyChallengeTemplateCache__store_allCachedTemplatesWithError___block_invoke;
  v31[3] = &unk_24D13B810;
  v33 = &v37;
  v34 = v35;
  dsema = v6;
  v32 = dsema;
  objc_msgSend(v7, "allValuesWithCompletion:", v31);

  os_unfair_lock_unlock(p_lock);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(dsema, v8))
  {
    ACHLogMonthlyChallenges();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetch of cached monthly challenge templates.", buf, 2u);
    }
    v10 = 0;
  }
  else
  {
    if (*a3)
    {
      ACHLogMonthlyChallenges();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ACHSyncingMonthlyChallengeTemplateCache _store_allCachedTemplatesWithError:].cold.1((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);

    }
    if (!objc_msgSend((id)v38[5], "count"))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend((id)v38[5], "allValues");
    v9 = objc_claimAutoreleasedReturnValue();
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[ACHSyncingMonthlyChallengeTemplateCache gregorianCalendar](self, "gregorianCalendar");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          ACHMonthlyChallengeTemplateFromCacheValue(v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v10, "addObject:", v24);
          }
          else
          {
            ACHLogMonthlyChallenges();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v22;
              _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "Failed to deserialize template from cache value %@", buf, 0xCu);
            }

          }
        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
      }
      while (v19);
    }
  }

LABEL_6:
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v10;
}

void __78__ACHSyncingMonthlyChallengeTemplateCache__store_allCachedTemplatesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_daemon_allCachedTemplatesWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0;
  -[ACHSyncingMonthlyChallengeTemplateCache keyValueDomain](self, "keyValueDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE40B88];
  -[ACHSyncingMonthlyChallengeTemplateCache profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHSyncingMonthlyChallengeTemplateCache databaseContext](self, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __79__ACHSyncingMonthlyChallengeTemplateCache__daemon_allCachedTemplatesWithError___block_invoke;
  v33[3] = &unk_24D13B838;
  v35 = &v36;
  v28 = v6;
  v34 = v28;
  objc_msgSend(v7, "performReadTransactionWithHealthDatabase:context:error:block:", v9, v10, a3, v33);

  os_unfair_lock_unlock(p_lock);
  if (*a3)
  {
    ACHLogMonthlyChallenges();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACHSyncingMonthlyChallengeTemplateCache _store_allCachedTemplatesWithError:].cold.1((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);

  }
  if (objc_msgSend((id)v37[5], "count"))
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend((id)v37[5], "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[ACHSyncingMonthlyChallengeTemplateCache gregorianCalendar](self, "gregorianCalendar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ACHMonthlyChallengeTemplateFromCacheValue(v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v18, "addObject:", v25);
          }
          else
          {
            ACHLogMonthlyChallenges();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v23;
              _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Failed to deserialize template from cache value %@", buf, 0xCu);
            }

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
      }
      while (v20);
    }

  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v36, 8);
  return v18;
}

BOOL __79__ACHSyncingMonthlyChallengeTemplateCache__daemon_allCachedTemplatesWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "allValuesWithError:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ACHSyncingMonthlyChallengeTemplateCache healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[ACHSyncingMonthlyChallengeTemplateCache _store_templateForDateComponents:error:](self, "_store_templateForDateComponents:error:", v6, a4);
  else
    -[ACHSyncingMonthlyChallengeTemplateCache _daemon_templateForDateComponents:error:](self, "_daemon_templateForDateComponents:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_store_templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v6 = a3;
  _ACHMonthlyChallengeKeyFromDateComponents(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[ACHSyncingMonthlyChallengeTemplateCache kvDomain](self, "kvDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (*a4)
  {
    ACHLogMonthlyChallenges();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHSyncingMonthlyChallengeTemplateCache _store_templateForDateComponents:error:].cold.1();

  }
  if (v9)
  {
    -[ACHSyncingMonthlyChallengeTemplateCache gregorianCalendar](self, "gregorianCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTemplateFromCacheValue(v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_daemon_templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  _ACHMonthlyChallengeKeyFromDateComponents(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  -[ACHSyncingMonthlyChallengeTemplateCache keyValueDomain](self, "keyValueDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE40B88];
  -[ACHSyncingMonthlyChallengeTemplateCache profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHSyncingMonthlyChallengeTemplateCache databaseContext](self, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __83__ACHSyncingMonthlyChallengeTemplateCache__daemon_templateForDateComponents_error___block_invoke;
  v20[3] = &unk_24D13A4F0;
  v23 = &v24;
  v13 = v8;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  objc_msgSend(v9, "performReadTransactionWithHealthDatabase:context:error:block:", v11, v12, a4, v20);

  os_unfair_lock_unlock(&self->_lock);
  if (*a4)
  {
    ACHLogMonthlyChallenges();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACHSyncingMonthlyChallengeTemplateCache _store_templateForDateComponents:error:].cold.1();

  }
  v16 = (void *)v25[5];
  if (v16)
  {
    -[ACHSyncingMonthlyChallengeTemplateCache gregorianCalendar](self, "gregorianCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTemplateFromCacheValue(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __83__ACHSyncingMonthlyChallengeTemplateCache__daemon_templateForDateComponents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "stringForKey:error:", *(_QWORD *)(a1 + 40), a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (void)setDatabaseContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKKeyValueDomain)kvDomain
{
  return self->_kvDomain;
}

- (void)setKvDomain:(id)a3
{
  objc_storeStrong((id *)&self->_kvDomain, a3);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_kvDomain, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

- (void)_daemon_cacheTemplate:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_21407B000, v0, OS_LOG_TYPE_DEBUG, "Error caching monthly challenge template %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_0(&dword_21407B000, (uint64_t)a2, a3, "Error retrieving existing value for %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_store_allCachedTemplatesWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error pulling monthly challenge cache: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_store_templateForDateComponents:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error pulling cached value for date components %@: %@");
  OUTLINED_FUNCTION_1();
}

@end
