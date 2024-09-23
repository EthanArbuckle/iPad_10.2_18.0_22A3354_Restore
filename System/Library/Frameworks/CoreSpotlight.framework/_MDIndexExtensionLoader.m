@implementation _MDIndexExtensionLoader

+ (id)_matchDictionary
{
  if (_matchDictionary_onceToken != -1)
    dispatch_once(&_matchDictionary_onceToken, &__block_literal_global_19);
  return (id)_matchDictionary_sMatchDictionary;
}

- (_MDIndexExtensionLoader)init
{
  _MDIndexExtensionLoader *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MDIndexExtensionLoader;
  v2 = -[_MDExtensionLoader init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.corespotlight.IndexExtensionLoader", 0);
    -[_MDExtensionLoader setQueue:](v2, "setQueue:", v3);

  }
  return v2;
}

- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  _MDIndexExtension *v27;
  _MDIndexExtension *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  id v35;
  id *v37;
  id v39;
  id v40;
  _MDIndexExtension *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  char *v55;
  _BYTE v56[128];
  uint64_t v57;

  v37 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_MDExtensionLoader queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v39 = (id)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (!v9)
  {
    v11 = 0;
    v41 = 0;
    goto LABEL_37;
  }
  v10 = v9;
  v11 = 0;
  v41 = 0;
  v45 = *(_QWORD *)v47;
  v40 = v8;
  do
  {
    v12 = 0;
    v43 = v10;
    do
    {
      if (*(_QWORD *)v47 != v45)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
      objc_msgSend(v13, "identifier", v37);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extensionPointIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.spotlight.index")) & 1) != 0)
      {
        objc_msgSend(v13, "_plugIn");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "userElection");

        if ((objc_msgSend(v13, "optedIn") & 1) == 0 && v17 >= 2uLL)
        {
          logForCSLogCategoryIndex();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v51 = v14;
            v52 = 2080;
            v53 = "NO";
            v54 = 2048;
            v55 = (char *)v17;
            _os_log_impl(&dword_18C42F000, v18, OS_LOG_TYPE_DEFAULT, "Skipping index extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
          goto LABEL_26;
        }
        v44 = v11;
        objc_msgSend(v13, "_plugIn");
        v18 = objc_claimAutoreleasedReturnValue();
        -[NSObject entitlements](v18, "entitlements");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("com.apple.private.corespotlight.bundleid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = 0;
          goto LABEL_20;
        }
        -[NSObject containingUrl](v18, "containingUrl");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "path");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        if (v24
          && (objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForURL:", v23),
              v30 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v30, "bundleIdentifier"),
              v31 = objc_claimAutoreleasedReturnValue(),
              v30,
              v31))
        {

          v23 = (void *)v31;
LABEL_20:
          objc_msgSend(CFSTR("com.apple.corespotlight.extension."), "stringByAppendingString:", v23);
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v26 = dispatch_queue_create((const char *)-[NSObject UTF8String](v25, "UTF8String"), 0);
          v27 = -[_MDIndexExtension initWithExtension:queue:containerPath:containerID:]([_MDIndexExtension alloc], "initWithExtension:queue:containerPath:containerID:", v13, v26, v24, v23);
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.FileProvider.FPSpotlightIndexer")))
          {
            v28 = v27;

            v41 = v28;
          }
          logForCSLogCategoryIndex();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v51 = v14;
            v52 = 2112;
            v53 = (const char *)v23;
            v54 = 2112;
            v55 = v24;
            _os_log_debug_impl(&dword_18C42F000, v29, OS_LOG_TYPE_DEBUG, "Found index extension:%@, containerId:%@, containerPath:%@", buf, 0x20u);
          }

          objc_msgSend(v42, "setObject:forKeyedSubscript:", v27, v23);
          v8 = v40;
        }
        else
        {
          logForCSLogCategoryIndex();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v51 = v14;
            v52 = 2112;
            v53 = v24;
            _os_log_impl(&dword_18C42F000, v25, OS_LOG_TYPE_DEFAULT, "Couldn't get the bundleId for the index extension:%@ at %@", buf, 0x16u);
          }
        }

        v10 = v43;
        v11 = v44;
        goto LABEL_26;
      }
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")))
        goto LABEL_27;
      if (!v11)
        v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "addObject:", v14);
      objc_msgSend(v13, "_plugIn");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "containingUrl");
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForURL:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(v39, "setObject:forKey:", v14, v21);

      }
LABEL_26:

LABEL_27:
      ++v12;
    }
    while (v10 != v12);
    v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    v10 = v32;
  }
  while (v32);
LABEL_37:

  logForCSLogCategoryIndex();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[_MDIndexExtensionLoader _filterIndexExtensions:outFileProviderBundleMap:outFileProviderBundleIDs:].cold.1(v42, v33);

  if (objc_msgSend(v11, "count"))
  {
    v34 = (void *)objc_msgSend(v11, "copy");
    -[_MDIndexExtension setIdentifiers:](v41, "setIdentifiers:", v34);

    if (v37)
      *v37 = objc_retainAutorelease(v11);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v39);
  v35 = v42;

  return v35;
}

- (void)_filterIndexExtensions:(void *)a1 outFileProviderBundleMap:(NSObject *)a2 outFileProviderBundleIDs:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "Found %lu index extensions", (uint8_t *)&v3, 0xCu);
}

@end
