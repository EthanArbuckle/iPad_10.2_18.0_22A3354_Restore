@implementation NSError(DigitalSeparation)

+ (id)ds_errorFromIgnorableError:()DigitalSeparation sourceName:
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "shouldIgnoreError:", v5))
    {
      if (DSLogNSError_onceToken != -1)
        dispatch_once(&DSLogNSError_onceToken, &__block_literal_global_3);
      v7 = DSLogNSError_log;
      if (os_log_type_enabled((os_log_t)DSLogNSError_log, OS_LOG_TYPE_INFO))
      {
        v10 = 138543362;
        v11 = v5;
        _os_log_impl(&dword_227D24000, v7, OS_LOG_TYPE_INFO, "Ignoring returned error %{public}@", (uint8_t *)&v10, 0xCu);
      }
      v8 = 0;
    }
    else
    {
      v8 = v5;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)ds_underlyingErrorsBySource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DSErrorKeySourceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", a1, v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v11, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DSErrorKeySourceName"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v4);
        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)ds_localizedAppNames
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ds_underlyingErrorsBySource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedAppName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ds_localizedPermissionNames
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DSErrorKeyServiceName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          +[DSAppPermissionsDescriptor localizedNameForPermission:](DSAppPermissionsDescriptor, "localizedNameForPermission:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          DSLocStringForKey(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v11);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

@end
