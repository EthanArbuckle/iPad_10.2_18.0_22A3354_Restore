@implementation CSFileProviderDomainMonitor

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 224));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 <= 3 && v3 == 0)
  {
    pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 224));
  }
  else
  {
    v5 = v2 >> 1;
    if (v2 - (v2 >> 1) > 5)
      v5 = v2 - 5;
    if (v5 <= v3)
      v6 = *(_QWORD *)(a1 + 40);
    else
      v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subarrayWithRange:", 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 224));
    objc_msgSend(*(id *)(a1 + 32), "domainCleaner");
    v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, void *))v9)[2](v9, v8);

    if (v10)
    {
      pthread_rwlock_wrlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 224));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "removeObjectsInArray:", v8);
      pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 224));
      logForCSLogCategoryIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEFAULT, "Cleaned up removed domains: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
}

- (unint64_t)loadSavedDomains:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableOrderedSet *removedDomains;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v23;
  _opaque_pthread_rwlock_t *p_removedDomainsLock;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((loadSavedDomains__loaded & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[CSFileProviderDomainMonitor fileProviderDomainURL](self, "fileProviderDomainURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    loadSavedDomains__loaded = 1;
    if (v8)
    {
      p_removedDomainsLock = &self->_removedDomainsLock;
      pthread_rwlock_wrlock(&self->_removedDomainsLock);
      removedDomains = self->_removedDomains;
      if (!removedDomains)
      {
        v10 = (NSMutableOrderedSet *)objc_opt_new();
        v11 = self->_removedDomains;
        self->_removedDomains = v10;

        removedDomains = self->_removedDomains;
      }
      v23 = -[NSMutableOrderedSet count](removedDomains, "count");
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v8;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((unint64_t)objc_msgSend(v17, "count") > 2)
            {
              objc_msgSend(v4, "objectForKey:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
                continue;
              -[NSMutableOrderedSet addObject:](self->_removedDomains, "addObject:", v17);
              logForCSLogCategoryIndex();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v17;
                v19 = v18;
                v20 = "Found removed FP domain in saved domains: %@";
                goto LABEL_17;
              }
            }
            else
            {
              logForCSLogCategoryIndex();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v17;
                v19 = v18;
                v20 = "*warn* Skipping incomplete saved domain: %@";
LABEL_17:
                _os_log_impl(&dword_18C42F000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v14);
      }

      v5 = -[NSMutableOrderedSet count](self->_removedDomains, "count") - v23;
      pthread_rwlock_unlock(p_removedDomainsLock);
      v8 = v25;
    }
    else
    {
      v5 = 0;
    }

    goto LABEL_24;
  }
  v5 = 0;
LABEL_24:

  return v5;
}

- (void)updateRemovedDomains:(id)a3
{
  id v4;
  void *v5;
  _opaque_pthread_rwlock_t *p_activeDomainsLock;
  NSDictionary *activeDomains;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSMutableOrderedSet *removedDomains;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *v18;
  _opaque_pthread_rwlock_t *v19;
  CSFileProviderDomainMonitor *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  p_activeDomainsLock = &self->_activeDomainsLock;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  activeDomains = self->_activeDomains;
  if (activeDomains && -[NSDictionary count](activeDomains, "count"))
  {
    v19 = &self->_activeDomainsLock;
    v20 = self;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_activeDomains;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v13, v19, v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(v5, "addObject:", v13);
            logForCSLogCategoryIndex();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v13;
              _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_DEFAULT, "Found removed FP domain: %@", buf, 0xCu);
            }

          }
        }
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v10);
    }

    p_activeDomainsLock = v19;
    self = v20;
  }
  pthread_rwlock_unlock(p_activeDomainsLock);
  pthread_rwlock_wrlock(&self->_removedDomainsLock);
  removedDomains = self->_removedDomains;
  if (!removedDomains)
  {
    v17 = (NSMutableOrderedSet *)objc_opt_new();
    v18 = self->_removedDomains;
    self->_removedDomains = v17;

    removedDomains = self->_removedDomains;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](removedDomains, "addObjectsFromArray:", v5, v19, v20);
  pthread_rwlock_unlock(&self->_removedDomainsLock);

}

- (void)updateActiveDomains:(id)a3
{
  NSDictionary *v4;
  NSDictionary *activeDomains;

  v4 = (NSDictionary *)a3;
  pthread_rwlock_wrlock(&self->_activeDomainsLock);
  activeDomains = self->_activeDomains;
  self->_activeDomains = v4;

  pthread_rwlock_unlock(&self->_activeDomainsLock);
}

- (void)saveAllDomains:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *activeDomains;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        activeDomains = self->_activeDomains;
        if (!activeDomains
          || (-[NSDictionary objectForKey:](activeDomains, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9), (_QWORD)v17), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
        {

          pthread_rwlock_unlock(&self->_activeDomainsLock);
          pthread_rwlock_rdlock(&self->_removedDomainsLock);
          v12 = (void *)MEMORY[0x1E0C99DE8];
          -[NSMutableOrderedSet array](self->_removedDomains, "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "arrayWithArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          pthread_rwlock_unlock(&self->_removedDomainsLock);
          objc_msgSend(v5, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectsFromArray:", v15);

          -[CSFileProviderDomainMonitor fileProviderDomainURL](self, "fileProviderDomainURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "writeToURL:error:", v16, 0);

          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  pthread_rwlock_unlock(&self->_activeDomainsLock);
LABEL_12:

}

- (id)removedDomainFilterQueries
{
  CSFileProviderDomainMonitor *v2;
  _opaque_pthread_rwlock_t *p_removedDomainsLock;
  NSMutableOrderedSet *removedDomains;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  pthread_rwlock_t *p_activeDomainsLock;
  NSDictionary *activeDomains;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _opaque_pthread_rwlock_t *v32;
  CSFileProviderDomainMonitor *v33;
  NSMutableOrderedSet *obj;
  id v35;
  NSDictionary *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v2 = self;
  v47 = *MEMORY[0x1E0C80C00];
  p_removedDomainsLock = &self->_removedDomainsLock;
  pthread_rwlock_rdlock(&self->_removedDomainsLock);
  removedDomains = v2->_removedDomains;
  if (removedDomains && -[NSMutableOrderedSet count](removedDomains, "count"))
  {
    v32 = p_removedDomainsLock;
    v35 = (id)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = v2;
    obj = v2->_removedDomains;
    v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v42 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("(!((%@==\"%@\")&&(%@==\"%@\")&&(%@==\"%@\")))"), CFSTR("_kMDItemBundleID"), v11, CFSTR("kMDItemFileProviderID"), v12, CFSTR("_kMDItemDomainIdentifier"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v14);

        }
        v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v6);
    }

    p_removedDomainsLock = v32;
    v2 = v33;
    v15 = v35;
  }
  else
  {
    v15 = 0;
  }
  pthread_rwlock_unlock(p_removedDomainsLock);
  p_activeDomainsLock = &v2->_activeDomainsLock;
  pthread_rwlock_rdlock(&v2->_activeDomainsLock);
  activeDomains = v2->_activeDomains;
  if (activeDomains && -[NSDictionary count](activeDomains, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = v2->_activeDomains;
    v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v36);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          -[NSDictionary objectForKeyedSubscript:](v2->_activeDomains, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if ((v24 & 1) == 0)
          {
            if (!v15)
              v15 = (void *)objc_opt_new();
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
            v27 = v15;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("(!((%@==\"%@\")&&(%@==\"%@\")&&(%@==\"%@\")))"), CFSTR("_kMDItemBundleID"), v26, CFSTR("kMDItemFileProviderID"), v28, CFSTR("_kMDItemDomainIdentifier"), v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v30);

            v15 = v27;
          }
        }
        v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v19);
    }

    p_activeDomainsLock = &v2->_activeDomainsLock;
  }
  pthread_rwlock_unlock(p_activeDomainsLock);
  return v15;
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v6, v7);
  }
  else if (v5)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 664);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_12;
    v11[3] = &unk_1E24013B8;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, v11);
    v7 = v12;
  }
  else
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "Null providerDomainsByID from beginMonitoringProviderDomainChangesWithHandler.", buf, 2u);
    }
  }

}

- (id)domainCleaner
{
  return objc_getProperty(self, a2, 640, 1);
}

- (BOOL)updateActiveProviders:(id)a3
{
  id v5;
  _opaque_pthread_rwlock_t *p_activeProvidersLock;
  BOOL v7;

  v5 = a3;
  p_activeProvidersLock = &self->_activeProvidersLock;
  pthread_rwlock_wrlock(&self->_activeProvidersLock);
  if ((-[NSDictionary isEqual:](self->_activeProvidersMap, "isEqual:", v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_activeProvidersMap, a3);
    v7 = self->_providerMonitor != 0;
  }
  pthread_rwlock_unlock(p_activeProvidersLock);

  return v7;
}

- (void)notifyActiveProviderChanged
{
  NSObject *providerMonitorQueue;
  _QWORD block[5];

  providerMonitorQueue = self->_providerMonitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSFileProviderDomainMonitor_notifyActiveProviderChanged__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  dispatch_async(providerMonitorQueue, block);
}

void __58__CSFileProviderDomainMonitor_notifyActiveProviderChanged__block_invoke(uint64_t a1)
{
  void (**v2)(void *, void *);
  void *v3;
  BOOL v4;
  NSObject *v5;
  uint8_t v6[16];

  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 432));
  v2 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 632));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "copy");
  pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 432));
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_DEFAULT, "List of active FileProviders has changed.", v6, 2u);
    }

    v2[2](v2, v3);
  }

}

- (void)setProviderMonitor:(id)a3
{
  _opaque_pthread_rwlock_t *p_activeProvidersLock;
  id v5;
  void *v6;
  id providerMonitor;
  NSDictionary *activeProvidersMap;

  p_activeProvidersLock = &self->_activeProvidersLock;
  v5 = a3;
  pthread_rwlock_wrlock(p_activeProvidersLock);
  v6 = _Block_copy(v5);

  providerMonitor = self->_providerMonitor;
  self->_providerMonitor = v6;

  if (v5)
  {
    activeProvidersMap = self->_activeProvidersMap;
    pthread_rwlock_unlock(p_activeProvidersLock);
    if (activeProvidersMap)
      -[CSFileProviderDomainMonitor notifyActiveProviderChanged](self, "notifyActiveProviderChanged");
  }
  else
  {
    pthread_rwlock_unlock(p_activeProvidersLock);
  }
}

- (id)providerMonitor
{
  _opaque_pthread_rwlock_t *p_activeProvidersLock;
  void *v4;
  void *v5;

  p_activeProvidersLock = &self->_activeProvidersLock;
  pthread_rwlock_rdlock(&self->_activeProvidersLock);
  v4 = _Block_copy(self->_providerMonitor);
  pthread_rwlock_unlock(p_activeProvidersLock);
  v5 = _Block_copy(v4);

  return v5;
}

- (NSURL)fileProviderDomainURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, CFSTR("Library/Spotlight/FileProviderDomains.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v5);

  return (NSURL *)v6;
}

- (void)startMonitoring
{
  void *v3;
  id fileProviderDelegate;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke;
  v5[3] = &unk_1E24019E0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CAACA8], "beginMonitoringProviderDomainChangesWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fileProviderDelegate = self->_fileProviderDelegate;
  self->_fileProviderDelegate = v3;

}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_12(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  _QWORD block[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = v2;
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "FPDomainItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_msgSend(v9, "isHidden") & 1) != 0 || (objc_msgSend(v9, "isHiddenByUser") & 1) != 0)
          {
            v11 = 0;
          }
          else
          {
            objc_msgSend(v9, "domain");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v12, "userEnabled");

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  v14 = *(id *)(a1 + 32);
  v15 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v14, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v21, "providerID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "topLevelBundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  objc_msgSend(*(id *)(a1 + 40), "domainCleaner");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v24 = (void *)objc_msgSend(*(id *)(a1 + 40), "loadSavedDomains:", v3);
    objc_msgSend(*(id *)(a1 + 40), "updateRemovedDomains:", v3);
    objc_msgSend(*(id *)(a1 + 40), "saveAllDomains:", v3);
  }
  objc_msgSend(*(id *)(a1 + 40), "updateActiveDomains:", v3);
  if (objc_msgSend(*(id *)(a1 + 40), "updateActiveProviders:", v15))
    objc_msgSend(*(id *)(a1 + 40), "notifyActiveProviderChanged");
  objc_msgSend(*(id *)(a1 + 40), "domainCleaner");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v27 = *(NSObject **)(v26 + 656);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_2;
    block[3] = &unk_1E24019B8;
    block[4] = v26;
    block[5] = v24;
    dispatch_async(v27, block);
  }

}

- (id)getProviderIDForBundle:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_activeDomainsLock;
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_activeDomainsLock = &self->_activeDomainsLock;
  pthread_rwlock_rdlock(&self->_activeDomainsLock);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_activeDomains;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithString:", v14);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  pthread_rwlock_unlock(p_activeDomainsLock);
  return v7;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSFileProviderDomainMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __45__CSFileProviderDomainMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (CSFileProviderDomainMonitor)init
{
  CSFileProviderDomainMonitor *v2;
  CSFileProviderDomainMonitor *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *domainUpdateQueue;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *domainDeleteQueue;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *providerMonitorQueue;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CSFileProviderDomainMonitor;
  v2 = -[CSFileProviderDomainMonitor init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_activeDomainsLock, 0);
    pthread_rwlock_init(&v3->_removedDomainsLock, 0);
    pthread_rwlock_init(&v3->_activeProvidersLock, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.domainUpdate", v5);
    domainUpdateQueue = v3->_domainUpdateQueue;
    v3->_domainUpdateQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.domainDelete", v9);
    domainDeleteQueue = v3->_domainDeleteQueue;
    v3->_domainDeleteQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.corespotlight.fileProviderDomainMonitor.providerMonitor", v13);
    providerMonitorQueue = v3->_providerMonitorQueue;
    v3->_providerMonitorQueue = (OS_dispatch_queue *)v14;

    -[CSFileProviderDomainMonitor startMonitoring](v3, "startMonitoring");
  }
  return v3;
}

- (void)dealloc
{
  id fileProviderDelegate;
  objc_super v4;

  if (self->_fileProviderDelegate)
  {
    objc_msgSend(MEMORY[0x1E0CAACA8], "endMonitoringProviderDomainChanges:");
    fileProviderDelegate = self->_fileProviderDelegate;
    self->_fileProviderDelegate = 0;

  }
  pthread_rwlock_destroy(&self->_activeDomainsLock);
  pthread_rwlock_destroy(&self->_removedDomainsLock);
  pthread_rwlock_destroy(&self->_activeProvidersLock);
  v4.receiver = self;
  v4.super_class = (Class)CSFileProviderDomainMonitor;
  -[CSFileProviderDomainMonitor dealloc](&v4, sel_dealloc);
}

- (void)setDomainCleaner:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 640);
}

- (id)fileProviderDelegate
{
  return self->_fileProviderDelegate;
}

- (void)setFileProviderDelegate:(id)a3
{
  objc_storeStrong(&self->_fileProviderDelegate, a3);
}

- (OS_dispatch_queue)domainDeleteQueue
{
  return self->_domainDeleteQueue;
}

- (void)setDomainDeleteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_domainDeleteQueue, a3);
}

- (OS_dispatch_queue)domainUpdateQueue
{
  return self->_domainUpdateQueue;
}

- (void)setDomainUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_domainUpdateQueue, a3);
}

- (OS_dispatch_queue)providerMonitorQueue
{
  return self->_providerMonitorQueue;
}

- (void)setProviderMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_providerMonitorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMonitorQueue, 0);
  objc_storeStrong((id *)&self->_domainUpdateQueue, 0);
  objc_storeStrong((id *)&self->_domainDeleteQueue, 0);
  objc_storeStrong(&self->_fileProviderDelegate, 0);
  objc_storeStrong(&self->_domainCleaner, 0);
  objc_storeStrong(&self->_providerMonitor, 0);
  objc_storeStrong((id *)&self->_activeProvidersMap, 0);
  objc_storeStrong((id *)&self->_removedDomains, 0);
  objc_storeStrong((id *)&self->_activeDomains, 0);
}

void __46__CSFileProviderDomainMonitor_startMonitoring__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "Error from beginMonitoringProviderDomainChangesWithHandler: %@", (uint8_t *)&v2, 0xCu);
}

@end
