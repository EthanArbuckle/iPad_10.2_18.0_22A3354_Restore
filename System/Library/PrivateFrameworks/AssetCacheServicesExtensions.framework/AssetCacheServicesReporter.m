@implementation AssetCacheServicesReporter

- (AssetCacheServicesReporter)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  AssetCacheServicesReporter *v8;
  AssetCacheServicesReporter *v9;
  os_log_t v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AssetCacheServicesReporter;
  v8 = -[AssetCacheServicesReporter init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AssetCacheServicesReporter setWeakDelegate:](v8, "setWeakDelegate:", v6);
    -[AssetCacheServicesReporter setWeakDelegateQueue:](v9, "setWeakDelegateQueue:", v7);
    v10 = os_log_create("com.apple.AssetCacheServices", "Extensions");
    -[AssetCacheServicesReporter setLogHandle:](v9, "setLogHandle:", v10);

  }
  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter setResults:](self, "setResults:", v3);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter setAllServerHostPorts:](self, "setAllServerHostPorts:", v4);

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__AssetCacheServicesReporter_start__block_invoke;
  block[3] = &unk_24F0801B8;
  block[4] = self;
  dispatch_async(v5, block);

}

void __35__AssetCacheServicesReporter_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reportPublicIPAddress");
  objc_msgSend(*(id *)(a1 + 32), "reportMightHaveWithKeyPath:", &stru_24F0805C0);
  objc_msgSend(*(id *)(a1 + 32), "reportCachedServersWithKeyPath:", &stru_24F0805C0);
  objc_msgSend(*(id *)(a1 + 32), "reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:", &stru_24F0805C0);
  objc_msgSend(*(id *)(a1 + 32), "reportFreshServersWithKeyPath:", &stru_24F0805C0);
  objc_msgSend(*(id *)(a1 + 32), "reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:", &stru_24F0805C0);
  objc_msgSend(*(id *)(a1 + 32), "reportReachability");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "results");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishWithResults:", v3);

}

- (id)prettyRanges:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v22)
  {
    v5 = CFSTR("first");
    v21 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v23 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v24 = v7;
        v8 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v24);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKey:", v5);
              v13 = objc_claimAutoreleasedReturnValue();
              if (v13)
                v14 = (__CFString *)v13;
              else
                v14 = CFSTR("unknown");
              objc_msgSend(v12, "objectForKey:", CFSTR("last"));
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
                v16 = (__CFString *)v15;
              else
                v16 = CFSTR("unknown");
              if (-[__CFString isEqualToString:](v14, "isEqualToString:", v16))
              {
                objc_msgSend(v4, "addObject:", v14);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v14, v16);
                v17 = v5;
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v18);

                v5 = v17;
              }

            }
            v9 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

        v6 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v22);
  }

  return v4;
}

- (BOOL)doRanges:(id)a3 containAddress:(id)a4
{
  id v5;
  id v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  BOOL v24;
  _BOOL4 v25;
  _BOOL4 v26;
  unsigned int v27;
  unsigned int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  unsigned int v31;
  unsigned int v32;
  _BOOL4 v33;
  int v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  unint64_t v65;
  unsigned int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v66 = 0;
  v64 = 0;
  v65 = 0;
  v6 = objc_retainAutorelease(a4);
  v7 = inet_pton(2, (const char *)objc_msgSend(v6, "UTF8String"), &v66);
  if (v7 == 1 || inet_pton(30, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), &v64) == 1)
  {
    v46 = v6;
    v47 = v5;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v5;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    v8 = 0;
    if (!v50)
      goto LABEL_67;
    v49 = *(_QWORD *)v61;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v49)
        objc_enumerationMutation(obj);
      v51 = v9;
      v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v9);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v57 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKey:", CFSTR("first"), v46, v47);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
              v18 = (__CFString *)v17;
            else
              v18 = CFSTR("unknown");
            objc_msgSend(v16, "objectForKey:", CFSTR("last"));
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
              v20 = (__CFString *)v19;
            else
              v20 = CFSTR("unknown");
            v21 = -[__CFString rangeOfString:](v18, "rangeOfString:", CFSTR(":"));
            if (v7 == 1 && v21 == 0x7FFFFFFFFFFFFFFFLL)
            {
              LODWORD(v54) = 0;
              LODWORD(v52) = 0;
              if (inet_pton(2, (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String"), &v54) == 1
                && inet_pton(2, (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String"), &v52) == 1)
              {
                v22 = bswap32(v54);
                v23 = bswap32(v52);
                v24 = v22 >= v23;
                v25 = v22 > v23;
                v26 = !v24;
                if (v25 - v26 <= 0)
                {
                  v27 = bswap32(v54);
                  v28 = bswap32(v66);
                  v24 = v27 >= v28;
                  v29 = v27 > v28;
                  v30 = !v24;
                  if (v29 - v30 <= 0)
                  {
                    v31 = bswap32(v66);
                    v32 = bswap32(v52);
                    v24 = v31 >= v32;
                    v33 = v31 > v32;
                    v34 = !v24;
                    v35 = v33 - v34;
LABEL_59:
                    if (v35 < 1)
                      v8 = 1;
                  }
                }
              }
            }
            else if (v7 != 1 && v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v54 = 0;
              v55 = 0;
              v52 = 0;
              v53 = 0;
              if (inet_pton(30, (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String"), &v54) == 1&& inet_pton(30, (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String"), &v52) == 1)
              {
                v36 = bswap64(v54);
                v37 = bswap64(v52);
                if (v36 == v37 && (v36 = bswap64(v55), v37 = bswap64(v53), v36 == v37))
                  v38 = 0;
                else
                  v38 = v36 < v37 ? -1 : 1;
                if (v38 <= 0)
                {
                  v39 = bswap64(v54);
                  v40 = bswap64(v64);
                  if (v39 == v40 && (v39 = bswap64(v55), v40 = bswap64(v65), v39 == v40))
                    v41 = 0;
                  else
                    v41 = v39 < v40 ? -1 : 1;
                  if (v41 <= 0)
                  {
                    v42 = bswap64(v64);
                    v43 = bswap64(v52);
                    if (v42 == v43 && (v42 = bswap64(v65), v43 = bswap64(v53), v42 == v43))
                    {
                      v35 = 0;
                    }
                    else if (v42 < v43)
                    {
                      v35 = -1;
                    }
                    else
                    {
                      v35 = 1;
                    }
                    goto LABEL_59;
                  }
                }
              }
            }

            if ((v8 & 1) != 0)
              goto LABEL_64;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        }
        while (v13);
      }
LABEL_64:

      if ((v8 & 1) != 0)
        break;
      v9 = v51 + 1;
      if (v51 + 1 == v50)
      {
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (!v50)
        {
LABEL_67:

          v44 = v8 & 1;
          goto LABEL_69;
        }
        goto LABEL_5;
      }
    }

    v44 = 1;
LABEL_69:
    v6 = v46;
    v5 = v47;
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)sortedHostPorts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[AssetCacheServicesReporter serverSortInfoForHostPort:rank:](self, "serverSortInfoForHostPort:rank:", v11, 0, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[AssetCacheServicesReporter sortedHostPorts:usingSortInfo:](self, "sortedHostPorts:usingSortInfo:", v6, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)reportPublicIPAddress
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("https://serverstatus.apple.com/services/internetaccess/v1/my_external_ip");
  OUTLINED_FUNCTION_0(&dword_227D1D000, a1, a3, "sending GET to %@", (uint8_t *)&v3);
}

void __51__AssetCacheServicesReporter_reportPublicIPAddress__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v31 = CFSTR("https://serverstatus.apple.com/services/internetaccess/v1/my_external_ip");
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v7;
    _os_log_debug_impl(&dword_227D1D000, v10, OS_LOG_TYPE_DEBUG, "response from %@: %@; error=%@; data=%@", buf, 0x2Au);
  }

  if (v9)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = v9;
    v13 = *(id *)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v8;
    v18 = objc_msgSend(v13, "statusCode");
    if (!v7 || v18 != 200 || (unint64_t)objc_msgSend(v7, "length") > 0x400)
      goto LABEL_5;
    v29 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v29;
    v21 = v20;
    if (v20)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = v20;
      v24 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v23;
    }
    else
    {
      if (!v19)
        goto LABEL_20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_20;
      objc_msgSend(v19, "objectForKey:", CFSTR("status"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqual:", CFSTR("Success"));

      if (!v26)
        goto LABEL_20;
      objc_msgSend(v19, "objectForKey:", CFSTR("ip"));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v24 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;
    }

LABEL_20:
    goto LABEL_5;
  }
LABEL_6:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("url"));
    if (v7)
      objc_msgSend(v14, "setObject:forKey:", v7, CFSTR("data"));
    if (v8)
      objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("response"));
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1011, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "invalidateAndCancel");

}

- (void)reportMightHaveWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  intptr_t (*v22)(uint64_t, int, CFTypeRef);
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("might have"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v5);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = *MEMORY[0x24BE08A80];
  v35[0] = *MEMORY[0x24BE08A48];
  v35[1] = v7;
  v8 = *MEMORY[0x24BDBD270];
  v36[0] = *MEMORY[0x24BDBD268];
  v36[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke;
  v23 = &unk_24F080208;
  v11 = v6;
  v24 = v11;
  ACSMightCurrentNetworkHaveCachingServer();

  v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0, v20, 3221225472, __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke, &unk_24F080208, v11, &v31, &v25);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)v26[5];
    if (v14)
    {
      objc_msgSend(v14, "domain", v20, 3221225472, __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke, &unk_24F080208, v11, &v31, &v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD1128]) & 1) != 0)
      {
        v16 = objc_msgSend((id)v26[5], "code") == 60;

        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    v17 = (void *)v26[5];
    if (v17)
    {
      v13 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v32 + 24));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_11:
  v18 = v13;
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v13, v5, v20, v21, v22, v23);
  -[AssetCacheServicesReporter results](self, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKeyPath:", v18, v5);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

intptr_t __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  if (cf)
  {
    CFRetain(cf);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = cf;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reportCachedServersWithKeyPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", a3, CFSTR("saved servers"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v5, v6);

  -[AssetCacheServicesReporter reportServersWithKeyPath:generateOptions:](self, "reportServersWithKeyPath:generateOptions:", v6, &__block_literal_global);
}

id __61__AssetCacheServicesReporter_reportCachedServersWithKeyPath___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08A80];
  v3[0] = *MEMORY[0x24BE08A48];
  v3[1] = v0;
  v1 = *MEMORY[0x24BDBD270];
  v4[0] = *MEMORY[0x24BDBD268];
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportFreshServersWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[3];
  char v10;

  v4 = a3;
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("refreshed servers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v7, v5);

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__AssetCacheServicesReporter_reportFreshServersWithKeyPath___block_invoke;
  v8[3] = &unk_24F080270;
  v8[4] = v9;
  -[AssetCacheServicesReporter reportServersWithKeyPath:generateOptions:](self, "reportServersWithKeyPath:generateOptions:", v5, v8);
  _Block_object_dispose(v9, 8);

}

id __60__AssetCacheServicesReporter_reportFreshServersWithKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 0;
    v4 = *MEMORY[0x24BE08A50];
    v5[0] = *MEMORY[0x24BDBD270];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v2;
}

- (void)reportServersWithKeyPath:(id)a3 generateOptions:(id)a4
{
  id v6;
  void (**v7)(id);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void (**v81)(id);
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _QWORD v112[2];
  _QWORD v113[2];
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id))a4;
  v83 = v6;
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v6, CFSTR("personal caching"));
  v8 = objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v8);
  v7[2](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v118 = *MEMORY[0x24BE08A68];
  v11 = v118;
  v116 = *MEMORY[0x24BE08A78];
  v12 = v116;
  v117 = *MEMORY[0x24BDBD270];
  v13 = v117;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v15);

  -[AssetCacheServicesReporter locateServersWithOptions:](self, "locateServersWithOptions:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v16, v8);
  -[AssetCacheServicesReporter results](self, "results");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v8;
  objc_msgSend(v17, "setValue:forKeyPath:", v16, v8);

  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v6, CFSTR("personal caching and import"));
  v18 = objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v18);
  v7[2](v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  v114 = v11;
  v112[0] = *MEMORY[0x24BE08A70];
  v112[1] = v12;
  v113[0] = v13;
  v113[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v22);

  v78 = v20;
  -[AssetCacheServicesReporter locateServersWithOptions:](self, "locateServersWithOptions:", v20);
  v23 = objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v23, v18);
  -[AssetCacheServicesReporter results](self, "results");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v23;
  v79 = (void *)v18;
  objc_msgSend(v24, "setValue:forKeyPath:", v23, v18);

  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v83, CFSTR("shared caching"));
  v25 = objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v25);
  v81 = v7;
  v7[2](v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter locateServersWithOptions:](self, "locateServersWithOptions:", v26);
  v27 = objc_claimAutoreleasedReturnValue();

  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v27, v25);
  -[AssetCacheServicesReporter results](self, "results");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)v27;
  v77 = (void *)v25;
  objc_msgSend(v28, "setValue:forKeyPath:", v27, v25);

  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v83, CFSTR("all servers"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v82 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v30 = v16;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v104;
      v34 = *MEMORY[0x24BE08A58];
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v104 != v33)
            objc_enumerationMutation(v30);
          v36 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_msgSend(v36, "objectForKey:", v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v36, v37);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
      }
      while (v32);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v38 = v85;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v100;
      v42 = *MEMORY[0x24BE08A58];
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v100 != v41)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
          objc_msgSend(v44, "objectForKey:", v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v44, v45);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
      }
      while (v40);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v46 = v84;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v96;
      v50 = *MEMORY[0x24BE08A58];
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v96 != v49)
            objc_enumerationMutation(v46);
          v52 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
          objc_msgSend(v52, "objectForKey:", v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v52, v53);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
      }
      while (v48);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v29, "allKeys");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v92;
    v58 = *MEMORY[0x24BE08A60];
    do
    {
      for (m = 0; m != v56; ++m)
      {
        if (*(_QWORD *)v92 != v57)
          objc_enumerationMutation(v54);
        v60 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m);
        objc_msgSend(v29, "objectForKey:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKey:", v58);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[AssetCacheServicesReporter serverSortInfoForHostPort:rank:](self, "serverSortInfoForHostPort:rank:", v60, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
          objc_msgSend(v86, "setObject:forKey:", v63, v60);

      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
    }
    while (v56);
  }

  objc_msgSend(v29, "allKeys");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter sortedHostPorts:usingSortInfo:](self, "sortedHostPorts:usingSortInfo:", v64, v86);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v67 = v65;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v88;
    do
    {
      for (n = 0; n != v69; ++n)
      {
        if (*(_QWORD *)v88 != v70)
          objc_enumerationMutation(v67);
        v72 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * n);
        objc_msgSend(v29, "objectForKey:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "addObject:", v73);

        -[AssetCacheServicesReporter allServerHostPorts](self, "allServerHostPorts");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v72);

      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
    }
    while (v69);
  }

  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v66, v76);
  -[AssetCacheServicesReporter results](self, "results");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setValue:forKeyPath:", v66, v76);

}

- (id)locateServersWithOptions:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)MEMORY[0x24BDBD1A8];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v4 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  _ACSLocateAllCachingServers();

  v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v25[5];
    v25[5] = v8;
LABEL_11:

    goto LABEL_12;
  }
  v10 = (void *)v19[5];
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1128]) & 1) != 0)
    {
      v12 = objc_msgSend((id)v19[5], "code");

      if (v12 == 60)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
    else
    {

    }
  }
  v13 = (void *)v19[5];
  if (v13)
  {
    v14 = v25;
    v15 = v13;
    v9 = (void *)v14[5];
    v14[5] = (uint64_t)v15;
    goto LABEL_11;
  }
LABEL_12:
  v16 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

intptr_t __55__AssetCacheServicesReporter_locateServersWithOptions___block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (cf)
  {
    CFRetain(cf);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = cf;

  }
  if (a3)
  {
    CFRetain(a3);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = a3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("saved public IP address ranges"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("saved favored server ranges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AssetCacheServicesReporter reportPublicIPAddressRangesWithKeyPath:andFavoredServerRangesWithKeyPath:generateOptions:](self, "reportPublicIPAddressRangesWithKeyPath:andFavoredServerRangesWithKeyPath:generateOptions:", v6, v5, &__block_literal_global_78);
}

uint64_t __97__AssetCacheServicesReporter_reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath___block_invoke()
{
  return MEMORY[0x24BDBD1B8];
}

- (void)reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("refreshed public IP address ranges"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter keyPath:byAppendingKey:](self, "keyPath:byAppendingKey:", v4, CFSTR("refreshed favored server ranges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AssetCacheServicesReporter reportPublicIPAddressRangesWithKeyPath:andFavoredServerRangesWithKeyPath:generateOptions:](self, "reportPublicIPAddressRangesWithKeyPath:andFavoredServerRangesWithKeyPath:generateOptions:", v6, v5, &__block_literal_global_79);
}

uint64_t __96__AssetCacheServicesReporter_reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath___block_invoke()
{
  return MEMORY[0x24BDBD1B8];
}

- (void)reportPublicIPAddressRangesWithKeyPath:(id)a3 andFavoredServerRangesWithKeyPath:(id)a4 generateOptions:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v8);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v11 = dispatch_semaphore_create(0);
  v10[2](v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  _ACSIntrospect();

  v15 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v14, v15))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
  }
  else
  {
    v18 = (void *)v24[5];
    if (v18)
    {
      v17 = v18;
      v19 = v24;
    }
    else
    {
      v17 = (id)v36[5];
      v19 = v30;
    }
    v16 = (void *)v19[5];
  }
  v20 = v16;
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v17, v8);
  -[AssetCacheServicesReporter results](self, "results");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forKeyPath:", v17, v8);

  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:", v9);
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v20, v9);
  -[AssetCacheServicesReporter results](self, "results");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKeyPath:", v20, v9);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

intptr_t __119__AssetCacheServicesReporter_reportPublicIPAddressRangesWithKeyPath_andFavoredServerRangesWithKeyPath_generateOptions___block_invoke(uint64_t a1, CFDictionaryRef theDict, CFTypeRef cf)
{
  const void *Value;
  const void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE08A40]);
    if (Value)
    {
      v7 = Value;
      CFRetain(Value);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    v10 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE08A38]);
    if (v10)
    {
      v11 = v10;
      CFRetain(v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }
  if (cf)
  {
    CFRetain(cf);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = cf;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reportReachability
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allServerHostPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_0(&dword_227D1D000, a2, v4, "checking reachability of %ld server(s)", (uint8_t *)&v5);

}

void __48__AssetCacheServicesReporter_reportReachability__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138413058;
    v13 = v11;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_227D1D000, v10, OS_LOG_TYPE_DEBUG, "response from %@: %@; error=%@; data=%@",
      (uint8_t *)&v12,
      0x2Au);
  }

  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") == 200)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

- (id)keyPath:(id)a3 byAppendingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = objc_msgSend(v6, "length");

  if (v8)
    objc_msgSend(v7, "appendString:", CFSTR("."));
  objc_msgSend(v7, "appendString:", v5);

  return v7;
}

- (void)willStartGatheringResultsForKeyPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  AssetCacheServicesReporter *v10;
  id v11;

  v4 = a3;
  -[AssetCacheServicesReporter weakDelegate](self, "weakDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter weakDelegateQueue](self, "weakDelegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__AssetCacheServicesReporter_willStartGatheringResultsForKeyPath___block_invoke;
    block[3] = &unk_24F080350;
    v9 = v5;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __66__AssetCacheServicesReporter_willStartGatheringResultsForKeyPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reporter:willStartGatheringResultsForKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didGatherResults:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  AssetCacheServicesReporter *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[AssetCacheServicesReporter weakDelegate](self, "weakDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter weakDelegateQueue](self, "weakDelegateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__AssetCacheServicesReporter_didGatherResults_forKeyPath___block_invoke;
    v11[3] = &unk_24F080378;
    v12 = v8;
    v13 = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v10, v11);

  }
}

uint64_t __58__AssetCacheServicesReporter_didGatherResults_forKeyPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reporter:didGatherResults:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)didFinishWithResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  AssetCacheServicesReporter *v10;
  id v11;

  v4 = a3;
  -[AssetCacheServicesReporter weakDelegate](self, "weakDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssetCacheServicesReporter weakDelegateQueue](self, "weakDelegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__AssetCacheServicesReporter_didFinishWithResults___block_invoke;
    block[3] = &unk_24F080350;
    v9 = v5;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __51__AssetCacheServicesReporter_didFinishWithResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reporter:didFinishWithResults:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)serverSortInfoForHostPort:(id)a3 rank:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  _QWORD v28[2];
  int v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "rangeOfString:options:", CFSTR(":"), 4);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v8;
    v13 = v9;
    objc_msgSend(v6, "substringToIndex:", v8);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", v12 + v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v28[0] = 0;
    v28[1] = 0;
    if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("localhost")))
    {

      v14 = CFSTR("127.0.0.1");
    }
    v10 = objc_retainAutorelease(v14);
    if (inet_pton(2, (const char *)-[NSObject UTF8String](v10, "UTF8String"), &v29) == 1)
    {
      v16 = (void *)MEMORY[0x24BDBCE50];
      v17 = &v29;
      v18 = 4;
    }
    else
    {
      if (!-[NSObject hasPrefix:](v10, "hasPrefix:", CFSTR("["))
        || !-[NSObject hasSuffix:](v10, "hasSuffix:", CFSTR("]"))
        || (-[NSObject substringWithRange:](v10, "substringWithRange:", 1, -[NSObject length](v10, "length") - 2),
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
            v26 = inet_pton(30, (const char *)objc_msgSend(v25, "UTF8String"), v28),
            v25,
            v26 != 1))
      {
        -[AssetCacheServicesReporter logHandle](self, "logHandle");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v6;
          v34 = 2112;
          v35 = v10;
          _os_log_impl(&dword_227D1D000, v19, OS_LOG_TYPE_DEFAULT, "Server \"%@\" has bad address: %@", buf, 0x16u);
        }
        v11 = 0;
        goto LABEL_20;
      }
      v16 = (void *)MEMORY[0x24BDBCE50];
      v17 = (int *)v28;
      v18 = 16;
    }
    objc_msgSend(v16, "dataWithBytes:length:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v11 = 0;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)objc_msgSend(v15, "intValue"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &unk_24F080D40;
    if (v7)
      v22 = v7;
    v30[0] = CFSTR("rank");
    v30[1] = CFSTR("host");
    v31[0] = v22;
    v31[1] = v19;
    v30[2] = CFSTR("port");
    v31[2] = v20;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = v22;
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_22:

    goto LABEL_23;
  }
  -[AssetCacheServicesReporter logHandle](self, "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_227D1D000, v10, OS_LOG_TYPE_DEFAULT, "Server \"%@\" in bad format", buf, 0xCu);
  }
  v11 = 0;
LABEL_23:

  return v11;
}

- (id)sortedHostPorts:(id)a3 usingSortInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__AssetCacheServicesReporter_sortedHostPorts_usingSortInfo___block_invoke;
  v9[3] = &unk_24F0803A0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__AssetCacheServicesReporter_sortedHostPorts_usingSortInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  int v17;
  void *v19;
  void *v20;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("rank"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("rank"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);
  if (!v11)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("host"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("host"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "length");
    if (v14 < objc_msgSend(v13, "length"))
    {
LABEL_3:
      v11 = -1;
LABEL_8:

      goto LABEL_9;
    }
    v15 = objc_msgSend(v12, "length");
    if (v15 <= objc_msgSend(v13, "length"))
    {
      v16 = objc_retainAutorelease(v12);
      v17 = memcmp((const void *)objc_msgSend(v16, "bytes"), (const void *)objc_msgSend(objc_retainAutorelease(v13), "bytes"), objc_msgSend(v16, "length"));
      if (v17 < 0)
        goto LABEL_3;
      if (!v17)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("port"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("port"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v19, "compare:", v20);

        goto LABEL_8;
      }
    }
    v11 = 1;
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (AssetCacheServicesReporterDelegate)weakDelegate
{
  return (AssetCacheServicesReporterDelegate *)objc_loadWeakRetained((id *)&self->_weakDelegate);
}

- (void)setWeakDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_weakDelegate, a3);
}

- (OS_dispatch_queue)weakDelegateQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_weakDelegateQueue);
}

- (void)setWeakDelegateQueue:(id)a3
{
  objc_storeWeak((id *)&self->_weakDelegateQueue, a3);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)allServerHostPorts
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllServerHostPorts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allServerHostPorts, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_weakDelegateQueue);
  objc_destroyWeak((id *)&self->_weakDelegate);
}

@end
