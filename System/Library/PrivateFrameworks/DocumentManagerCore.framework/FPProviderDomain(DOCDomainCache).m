@implementation FPProviderDomain(DOCDomainCache)

+ (void)setDomainCache:()DOCDomainCache
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = a1;
  objc_sync_enter(v22);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    obj = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "storageURLs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count") == 0;

        if (v12)
        {
          v18 = (void *)docEnumerationLogHandle;
          if (!docEnumerationLogHandle)
          {
            DOCInitLogging();
            v18 = (void *)docEnumerationLogHandle;
          }
          v14 = v18;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "providerDisplayName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[FPProviderDomain(DOCDomainCache) setDomainCache:].cold.1(v19, v29, &v30, v14);
          }
        }
        else
        {
          objc_msgSend(v10, "storageURLs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = objc_claimAutoreleasedReturnValue();

          -[NSObject URLByStandardizingPath](v14, "URLByStandardizingPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingString:", CFSTR("/"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, v9);
        }

      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

  v20 = objc_msgSend(v24, "copy");
  v21 = (void *)_domainPathCache;
  _domainPathCache = v20;

  objc_sync_exit(v22);
}

+ (id)domainPathCache
{
  id v1;
  id v2;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = (id)_domainPathCache;
  objc_sync_exit(v1);

  return v2;
}

+ (id)allowedFileProviderBundleIdentifiersFiltered:()DOCDomainCache
{
  id v3;
  double Current;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  id v19;

  v3 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)MEMORY[0x24BDC82F8];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke;
  v16[3] = &unk_24C0FE7E8;
  v8 = v3;
  v19 = v8;
  v9 = v5;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  objc_msgSend(v7, "beginMonitoringProviderDomainChangesWithHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDC82F8], "endMonitoringProviderDomainChanges:", v11);
  v12 = CFAbsoluteTimeGetCurrent() - Current;
  if (v12 > 0.2)
  {
    v13 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging();
      v13 = docUILogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[FPProviderDomain(DOCDomainCache) allowedFileProviderBundleIdentifiersFiltered:].cold.1(v13, v12);
  }
  if (objc_msgSend(v9, "count"))
    v14 = (void *)objc_msgSend(v9, "copy");
  else
    v14 = 0;

  return v14;
}

+ (void)setDomainCache:()DOCDomainCache .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2090A2000, a4, (uint64_t)a3, "Could not set domain cache for domain %@ because storageURLs is empty", a2);

}

+ (void)allowedFileProviderBundleIdentifiersFiltered:()DOCDomainCache .cold.1(void *a1, double a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithDouble:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_0_1(&dword_2090A2000, v4, v6, "Monitoring the File Providers took a long time (%@)", (uint8_t *)&v7);

}

@end
