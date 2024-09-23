@implementation _MDImportExtensionLoader

+ (id)_matchDictionary
{
  if (_matchDictionary_onceToken_19 != -1)
    dispatch_once(&_matchDictionary_onceToken_19, &__block_literal_global_20);
  return (id)_matchDictionary_sMatchDictionary_18;
}

- (_MDImportExtensionLoader)init
{
  _MDImportExtensionLoader *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MDImportExtensionLoader;
  v2 = -[_MDExtensionLoader init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.corespotlight.ImportExtensionLoader", 0);
    -[_MDExtensionLoader setQueue:](v2, "setQueue:", v3);

  }
  return v2;
}

- (id)_filterIndexExtensions:(id)a3 outFileProviderBundleMap:(id *)a4 outFileProviderBundleIDs:(id *)a5
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _MDIndexExtension *v30;
  void *v31;
  _MDIndexExtension *v32;
  _MDIndexExtension *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v43;
  id v44;
  _MDImportExtensionLoader *v45;
  _MDIndexExtension *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  char *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v45 = self;
  -[_MDExtensionLoader queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v43 = (id)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v8 = v6;
  v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  v9 = 0;
  if (!v57)
  {
    v46 = 0;
    goto LABEL_38;
  }
  v46 = 0;
  v56 = *(_QWORD *)v59;
  v44 = v8;
  do
  {
    for (i = 0; i != v57; ++i)
    {
      if (*(_QWORD *)v59 != v56)
        objc_enumerationMutation(v8);
      v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "extensionPointIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.spotlight.import")) & 1) != 0)
      {
        objc_msgSend(v11, "_plugIn");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "userElection");

        if ((objc_msgSend(v11, "optedIn") & 1) != 0 || v15 < 2uLL)
        {
          objc_msgSend(v11, "_plugIn");
          v16 = objc_claimAutoreleasedReturnValue();
          v20 = v12;
          v55 = (uint64_t)v20;
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "UUIDString");
            v55 = objc_claimAutoreleasedReturnValue();

          }
          -[NSObject url](v16, "url");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v23 = (char *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "attributes");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKey:", CFSTR("CSSupportedContentTypes"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
          {
            v52 = v23;
            -[NSObject bundleInfoDictionary](v16, "bundleInfoDictionary");
            v49 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKey:](v49, "objectForKey:", CFSTR("CSExtensionLabel"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MDExtensionLoader extensionsByBundleId](v45, "extensionsByBundleId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v55);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = v9;
            v48 = v25;
            if (v25)
            {
              objc_msgSend(v25, "queue");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(CFSTR("com.apple.corespotlight.extension."), "stringByAppendingString:", v55);
              v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v26 = dispatch_queue_create((const char *)objc_msgSend(v29, "UTF8String"), 0);

            }
            v30 = [_MDIndexExtension alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[_MDIndexExtension initWithExtension:queue:containerPath:containerID:supportedFileTypes:extensionLabel:isAppleCodeSigned:](v30, "initWithExtension:queue:containerPath:containerID:supportedFileTypes:extensionLabel:isAppleCodeSigned:", v11, v26, v52, v55, v54, v51, v31);

            if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.FileProvider.FPSpotlightIndexer")))
            {
              v33 = v32;

              v46 = v33;
            }
            v9 = v50;
            logForCSLogCategoryDefault();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v63 = (uint64_t)v20;
              v64 = 2112;
              v65 = (const char *)v55;
              _os_log_impl(&dword_18C42F000, v34, OS_LOG_TYPE_DEFAULT, "Found import extension: %@, containerId: %@", buf, 0x16u);
            }

            v28 = (void *)v55;
            objc_msgSend(v47, "setObject:forKeyedSubscript:", v32, v55);

            v8 = v44;
            v23 = v52;
            v27 = v49;
          }
          else
          {
            logForCSLogCategoryDefault();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v63 = (uint64_t)v20;
              v64 = 2112;
              v65 = v23;
              _os_log_impl(&dword_18C42F000, v27, OS_LOG_TYPE_DEFAULT, "Couldn't get the supportedContentTypes for the import extension:%@ at %@", buf, 0x16u);
            }
            v28 = (void *)v55;
          }

        }
        else
        {
          logForCSLogCategoryDefault();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v63 = (uint64_t)v12;
            v64 = 2080;
            v65 = "NO";
            v66 = 2048;
            v67 = v15;
            _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "Skipping import extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
        }
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")))
          goto LABEL_34;
        if (!v9)
          v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "addObject:", v12);
        objc_msgSend(v11, "_plugIn");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "containingUrl");
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForURL:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v43, "setObject:forKey:", v12, v19);

        }
      }

LABEL_34:
    }
    v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  }
  while (v57);
LABEL_38:

  logForCSLogCategoryDefault();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = objc_msgSend(v47, "count");
    *(_DWORD *)buf = 134217984;
    v63 = v36;
    _os_log_impl(&dword_18C42F000, v35, OS_LOG_TYPE_DEFAULT, "Found %lu import extensions", buf, 0xCu);
  }

  if (objc_msgSend(v9, "count"))
  {
    v37 = (void *)objc_msgSend(v9, "copy");
    -[_MDIndexExtension setIdentifiers:](v46, "setIdentifiers:", v37);

    if (a5)
      *a5 = (id)objc_msgSend(v9, "copy");
  }
  if (a4)
    *a4 = objc_retainAutorelease(v43);
  logForCSLogCategoryDefault();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = (uint64_t)v47;
    _os_log_impl(&dword_18C42F000, v38, OS_LOG_TYPE_DEFAULT, "~~~ _MDImportExtensionLoader returning: %@", buf, 0xCu);
  }

  v39 = v47;
  return v39;
}

@end
