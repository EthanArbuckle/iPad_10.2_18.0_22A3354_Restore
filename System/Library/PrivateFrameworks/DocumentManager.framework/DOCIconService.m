@implementation DOCIconService

+ (DOCIconService)shared
{
  if (shared_onceToken_1 != -1)
    dispatch_once(&shared_onceToken_1, &__block_literal_global_10);
  return (DOCIconService *)(id)shared__shared;
}

void __24__DOCIconService_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared__shared;
  shared__shared = v0;

}

- (DOCIconService)init
{
  DOCIconService *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *ioQueue;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *cacheFolderURL;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *documentSourceIconCache;
  NSDictionary *v17;
  uint64_t v18;
  NSMutableSet *updatedProviderDomains;
  uint64_t v20;
  NSMutableSet *providersToPersist;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DOCIconService;
  v2 = -[DOCIconService init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.DocumentManager.DOCIconService.ioQueue", v4);
    ioQueue = v2->_ioQueue;
    v2->_ioQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.DocumentManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("IconService"));
    v9 = objc_claimAutoreleasedReturnValue();
    cacheFolderURL = v2->_cacheFolderURL;
    v2->_cacheFolderURL = (NSURL *)v9;

    v11 = (NSDictionary *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, v13);

    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v15);

    documentSourceIconCache = v2->_documentSourceIconCache;
    v2->_documentSourceIconCache = v11;
    v17 = v11;

    v18 = objc_opt_new();
    updatedProviderDomains = v2->_updatedProviderDomains;
    v2->_updatedProviderDomains = (NSMutableSet *)v18;

    v20 = objc_opt_new();
    providersToPersist = v2->_providersToPersist;
    v2->_providersToPersist = (NSMutableSet *)v20;

  }
  return v2;
}

+ (id)_symbolImageDefaultConfiguration
{
  return (id)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
}

+ (id)DOCLocalProviderIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_symbolImageDefaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doc_symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_systemImageNamed:withConfiguration:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)SFSymbolImageProviderIcon:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SFSymbolImageProviderIcon__onceToken != -1)
    dispatch_once(&SFSymbolImageProviderIcon__onceToken, &__block_literal_global_12);
  v5 = (id)SFSymbolImageProviderIcon__cachedImageByDomainID;
  objc_sync_enter(v5);
  objc_msgSend((id)SFSymbolImageProviderIcon__cachedImageByDomainID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    objc_msgSend(v3, "extensionBundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Info.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKeyPath:", CFSTR("CFBundleIcons.CFBundlePrimaryIcon.CFBundleSymbolName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v8;
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v11, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }
    v12 = (id)SFSymbolImageProviderIcon__cachedImageByDomainID;
    objc_sync_enter(v12);
    v13 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)SFSymbolImageProviderIcon__cachedImageByDomainID, "setObject:forKeyedSubscript:", v13, v4);
    if (!v6)

    objc_sync_exit(v12);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v6;
  else
    v14 = 0;

  return v14;
}

void __44__DOCIconService_SFSymbolImageProviderIcon___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFSymbolImageProviderIcon__cachedImageByDomainID;
  SFSymbolImageProviderIcon__cachedImageByDomainID = v0;

}

- (id)_urlForCacheSize:(int64_t)a3 providerBundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[DOCIconService _urlForCacheSize:](self, "_urlForCacheSize:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_urlForCacheSize:(int64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v8;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCIconService.m"), 159, CFSTR("[DOCIconServcie _urlForCacheSize:] received invalid or unknown DOCDocumentSourceIconSize value: %d"), 2);

    v6 = 0;
  }
  else
  {
    v4 = CFSTR("small");
    if (a3)
      v4 = 0;
    if (a3 == 1)
      v5 = CFSTR("large");
    else
      v5 = v4;
    -[NSURL URLByAppendingPathComponent:](self->_cacheFolderURL, "URLByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_loadIconsFromDiskForSize:(int64_t)a3 fileManager:(id)a4
{
  void *v7;
  DOCIconService *v8;
  id v9;
  NSDictionary *documentSourceIconCache;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  DOCIconService *v36;
  NSDictionary *v37;
  void *v38;
  void *v39;
  NSObject **v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  DOCIconService *v49;
  id v50;
  void *v51;
  void *v52;
  int64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v50 = a4;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCIconService.m"), 168, CFSTR("Invalid cache size provided: %ld"), a3);

  }
  v53 = a3;
  -[DOCIconService _urlForCacheSize:](self, "_urlForCacheSize:", a3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v50, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v51, 0, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_opt_new();
    v8 = self;
    objc_sync_enter(v8);
    v9 = objc_alloc(MEMORY[0x24BDBCF20]);
    documentSourceIconCache = v8->_documentSourceIconCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](documentSourceIconCache, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithArray:", v13);

    objc_sync_exit(v8);
    v49 = v8;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v7;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v56 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x20BD0CD4C]();
          objc_msgSend(v18, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "containsObject:", v20) & 1) != 0)
          {
            v21 = *MEMORY[0x24BE2DFF0];
            if (!*MEMORY[0x24BE2DFF0])
            {
              DOCInitLogging();
              v21 = *MEMORY[0x24BE2DFF0];
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)MEMORY[0x24BDD17C8];
              v23 = (void *)MEMORY[0x24BDD16E0];
              v24 = v21;
              objc_msgSend(v23, "numberWithInteger:", v53);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithFormat:", CFSTR("[Load-All-Disk] skipping: (%@, size: %@)"), v20, v25);
              v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v27 = objc_msgSend(v26, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v60 = v27;
              _os_log_impl(&dword_209052000, v24, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = *MEMORY[0x24BE2DFF0];
            if (!*MEMORY[0x24BE2DFF0])
            {
              DOCInitLogging();
              v29 = *MEMORY[0x24BE2DFF0];
            }
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = (void *)MEMORY[0x24BDD17C8];
              v31 = (void *)MEMORY[0x24BDD16E0];
              v32 = v29;
              objc_msgSend(v31, "numberWithInteger:", v53);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringWithFormat:", CFSTR("[Load-All-Disk] loading: (%@, size: %@)"), v20, v33);
              v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v35 = objc_msgSend(v34, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v60 = v35;
              _os_log_impl(&dword_209052000, v32, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

            }
            if (v28 && objc_msgSend(v28, "length"))
              objc_msgSend(v52, "setObject:forKeyedSubscript:", v28, v20);

          }
          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v15);
    }

    v36 = v49;
    objc_sync_enter(v36);
    v37 = v49->_documentSourceIconCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v53);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addEntriesFromDictionary:", v52);

    objc_sync_exit(v36);
  }
  else
  {
    v40 = (NSObject **)MEMORY[0x24BE2DF90];
    v41 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v41 = *v40;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[DOCIconService _loadIconsFromDiskForSize:fileManager:].cold.1(a3, v41, v42, v43, v44, v45, v46, v47);
  }

}

- (void)loadIconsFromDiskIfNeeded
{
  NSObject *ioQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  ioQueue = self->_ioQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__DOCIconService_loadIconsFromDiskIfNeeded__block_invoke;
  v4[3] = &unk_24C0F0FB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(ioQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__DOCIconService_loadIconsFromDiskIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  unsigned __int8 *v2;
  int v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (unsigned __int8 *)WeakRetained;
    objc_sync_enter(v2);
    v3 = v2[48];
    v2[48] = 1;
    objc_sync_exit(v2);

    WeakRetained = v5;
    if (!v3)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(v2, "_loadIconsFromDiskForSize:fileManager:", 0, v4);
      objc_msgSend(v2, "_loadIconsFromDiskForSize:fileManager:", 1, v4);

      WeakRetained = v5;
    }
  }

}

- (void)_persistCacheForSize:(int64_t)a3 bundles:(id)a4 fileManager:(id)a5
{
  DOCIconService *v9;
  NSDictionary *documentSourceIconCache;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject **v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  int64_t v43;
  id obj;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v41 = a4;
  v42 = a5;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCIconService.m"), 233, CFSTR("Invalid cache size provided: %ld"), a3);

  }
  v9 = self;
  objc_sync_enter(v9);
  documentSourceIconCache = v9->_documentSourceIconCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](documentSourceIconCache, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v12, "copy");

  objc_sync_exit(v9);
  v43 = a3;
  -[DOCIconService _urlForCacheSize:](v9, "_urlForCacheSize:", a3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  LOBYTE(v11) = objc_msgSend(v42, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v46, 1, 0, &v53);
  v13 = v53;
  if ((v11 & 1) != 0)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v41;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (!v14)
      goto LABEL_33;
    v15 = *(_QWORD *)v50;
    while (1)
    {
      v16 = 0;
      v17 = v13;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v16);
        v19 = (void *)MEMORY[0x20BD0CD4C]();
        v20 = *MEMORY[0x24BE2DFF0];
        if (!*MEMORY[0x24BE2DFF0])
        {
          DOCInitLogging();
          v20 = *MEMORY[0x24BE2DFF0];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)MEMORY[0x24BDD17C8];
          v22 = (void *)MEMORY[0x24BDD16E0];
          v23 = v20;
          objc_msgSend(v22, "numberWithInteger:", v43);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("[SaveToDisk] saving (%@, size: %@)"), v18, v24);
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v26 = objc_msgSend(v25, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v55 = v26;
          _os_log_impl(&dword_209052000, v23, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

        }
        objc_msgSend(v45, "objectForKeyedSubscript:", v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "URLByAppendingPathComponent:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "length"))
        {
          v48 = v17;
          v29 = objc_msgSend(v27, "writeToURL:options:error:", v28, 0, &v48);
          v13 = v48;

          if ((v29 & 1) != 0)
          {
            v47 = 66565;
            v30 = fsctl((const char *)objc_msgSend(objc_retainAutorelease(v28), "fileSystemRepresentation"), 0xC0084A44uLL, &v47, 0);
            if (v30)
            {
              v31 = *MEMORY[0x24BE2DF90];
              if (!*MEMORY[0x24BE2DF90])
              {
                DOCInitLogging();
                v31 = *MEMORY[0x24BE2DF90];
              }
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v55 = (uint64_t)v46;
                v56 = 1024;
                LODWORD(v57) = v30;
                v32 = v31;
                v33 = "Unable to make '%@' purgeable: %d";
                v34 = 18;
LABEL_31:
                _os_log_error_impl(&dword_209052000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
              }
            }
          }
          else
          {
            v36 = *MEMORY[0x24BE2DF90];
            if (!*MEMORY[0x24BE2DF90])
            {
              DOCInitLogging();
              v36 = *MEMORY[0x24BE2DF90];
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v55 = (uint64_t)v28;
              v56 = 2112;
              v57 = v13;
              v32 = v36;
              v33 = "Unable to cache '%@': %@";
              v34 = 22;
              goto LABEL_31;
            }
          }
        }
        else
        {
          v35 = *MEMORY[0x24BE2DF90];
          if (!*MEMORY[0x24BE2DF90])
          {
            DOCInitLogging();
            v35 = *MEMORY[0x24BE2DF90];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v55 = (uint64_t)v28;
            v56 = 2112;
            v57 = v17;
            _os_log_error_impl(&dword_209052000, v35, OS_LOG_TYPE_ERROR, "Skipping (data length is 0) write to disk cache '%@': %@", buf, 0x16u);
          }
          v13 = v17;
        }

        objc_autoreleasePoolPop(v19);
        ++v16;
        v17 = v13;
      }
      while (v14 != v16);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      v14 = v37;
      if (!v37)
      {
LABEL_33:

        goto LABEL_38;
      }
    }
  }
  v38 = (NSObject **)MEMORY[0x24BE2DF90];
  v39 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v39 = *v38;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    -[DOCIconService _persistCacheForSize:bundles:fileManager:].cold.1((uint64_t)v46, (uint64_t)v13, v39);
LABEL_38:

}

- (void)_persistIconsOnDisk
{
  NSObject *ioQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  ioQueue = self->_ioQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DOCIconService__persistIconsOnDisk__block_invoke;
  v4[3] = &unk_24C0F0FB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(ioQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__DOCIconService__persistIconsOnDisk__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v2 = (id *)WeakRetained;
    objc_sync_enter(v2);
    v3 = (void *)objc_msgSend(v2[7], "copy");
    objc_msgSend(v2[7], "removeAllObjects");
    objc_sync_exit(v2);

    v4 = (void *)objc_opt_new();
    v5 = (void *)MEMORY[0x20BD0CD4C]();
    objc_msgSend(v2, "_persistCacheForSize:bundles:fileManager:", 0, v3, v4);
    objc_autoreleasePoolPop(v5);
    v6 = (void *)MEMORY[0x20BD0CD4C]();
    objc_msgSend(v2, "_persistCacheForSize:bundles:fileManager:", 1, v3, v4);
    objc_autoreleasePoolPop(v6);

    WeakRetained = v7;
  }

}

- (id)_fetchIconFromDiskCacheForProviderID:(id)a3 size:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  DOCIconService *v17;
  NSDictionary *documentSourceIconCache;
  void *v19;
  void *v20;
  NSObject **v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject **v28;
  NSObject *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DOCIconService _urlForCacheSize:providerBundleID:](self, "_urlForCacheSize:providerBundleID:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v21 = (NSObject **)MEMORY[0x24BE2DFF0];
    v22 = *MEMORY[0x24BE2DFF0];
    if (!*MEMORY[0x24BE2DFF0])
    {
      DOCInitLogging();
      v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = (void *)MEMORY[0x24BDD16E0];
      v25 = v22;
      objc_msgSend(v24, "numberWithInteger:", a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("[Load-One-DISK] did not find in disk cache: (%@, size: %@)"), v6, v26);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v33 = objc_msgSend(v27, "UTF8String");
      _os_log_impl(&dword_209052000, v25, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v8, "length"))
  {

    v28 = (NSObject **)MEMORY[0x24BE2DFF0];
    v29 = *MEMORY[0x24BE2DFF0];
    if (!*MEMORY[0x24BE2DFF0])
    {
      DOCInitLogging();
      v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[DOCIconService _fetchIconFromDiskCacheForProviderID:size:].cold.1(v29, a4, (uint64_t)v6);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeItemAtURL:error:", v7, 0);

LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v10 = (NSObject **)MEMORY[0x24BE2DFF0];
  v11 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v11;
    objc_msgSend(v13, "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[Load-One-DISK] loaded from disk cache: (%@, size: %@)"), v6, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v33 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_209052000, v14, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

  }
  v17 = self;
  objc_sync_enter(v17);
  documentSourceIconCache = v17->_documentSourceIconCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](documentSourceIconCache, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, v6);

  objc_sync_exit(v17);
LABEL_18:

  return v9;
}

- (id)_fetchIconFromIconService:(id)a3 size:(int64_t)a4 triggerDiskUpdate:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject **v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  DOCIconService *v19;
  NSDictionary *documentSourceIconCache;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  DOCIconService *v24;
  NSObject *ioTimer;
  OS_dispatch_source *v26;
  dispatch_source_t v27;
  OS_dispatch_source *v28;
  NSObject *v29;
  void *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  _QWORD handler[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v32 = a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCIconService.m"), 322, CFSTR("Invalid cache size provided: %ld"), a4);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v8);
  if (v9)
  {
    if (a4)
      goto LABEL_5;
LABEL_9:
    v11 = (_QWORD *)MEMORY[0x24BE51AF0];
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE51A90], "genericApplicationIcon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_9;
LABEL_5:
  v10 = 0;
  if (a4 == 2)
  {
    v34 = 0;
    goto LABEL_21;
  }
  if (a4 == 1)
  {
    v11 = (_QWORD *)MEMORY[0x24BE51AC8];
LABEL_10:
    objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setDrawBorder:", 1);
  objc_msgSend(v9, "prepareImageForDescriptor:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bitmapData");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (NSObject **)MEMORY[0x24BE2DFF0];
  v13 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = v13;
    objc_msgSend(v15, "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("[Load-One-XPC] loading: (%@, size: %@)"), v8, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v38 = objc_msgSend(v18, "UTF8String");
    _os_log_impl(&dword_209052000, v16, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

  }
  v19 = self;
  objc_sync_enter(v19);
  documentSourceIconCache = v19->_documentSourceIconCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](documentSourceIconCache, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, v8);

  objc_sync_exit(v19);
  if (v32)
  {
    v23 = dispatch_time(0, 60000000000);
    v24 = v19;
    objc_sync_enter(v24);
    ioTimer = v24->_ioTimer;
    if (ioTimer)
    {
      dispatch_source_cancel(ioTimer);
      v26 = v24->_ioTimer;
      v24->_ioTimer = 0;

    }
    -[NSMutableSet addObject:](v24->_providersToPersist, "addObject:", v8);
    v27 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v24->_ioQueue);
    v28 = v24->_ioTimer;
    v24->_ioTimer = (OS_dispatch_source *)v27;

    objc_sync_exit(v24);
    objc_initWeak((id *)buf, v24);
    v29 = v24->_ioTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __67__DOCIconService__fetchIconFromIconService_size_triggerDiskUpdate___block_invoke;
    handler[3] = &unk_24C0F0FB0;
    objc_copyWeak(&v36, (id *)buf);
    dispatch_source_set_event_handler(v29, handler);
    dispatch_source_set_timer((dispatch_source_t)v24->_ioTimer, v23, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
    dispatch_resume((dispatch_object_t)v24->_ioTimer);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

LABEL_21:
  return v34;
}

void __67__DOCIconService__fetchIconFromIconService_size_triggerDiskUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  dispatch_source_t *v2;
  dispatch_source_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = (dispatch_source_t *)WeakRetained;
    objc_sync_enter(v2);
    dispatch_source_cancel(v2[4]);
    v3 = v2[4];
    v2[4] = 0;

    objc_sync_exit(v2);
    -[dispatch_source_t _persistIconsOnDisk](v2, "_persistIconsOnDisk");
    WeakRetained = v4;
  }

}

- (void)_updateFileProvidersIcon:(id)a3 skipSize:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *ioQueue;
  id obj;
  _QWORD block[5];
  id v17[2];
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x24BE2DE30];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v9);

      if ((v13 & 1) != 0)
        break;
      objc_initWeak(&location, self);
      ioQueue = self->_ioQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__DOCIconService__updateFileProvidersIcon_skipSize___block_invoke;
      block[3] = &unk_24C0F1DC8;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a4;
      block[4] = v11;
      dispatch_async(ioQueue, block);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __52__DOCIconService__updateFileProvidersIcon_skipSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v4 = v3;
      if (*(_QWORD *)(a1 + 48) != v2)
      {
        objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (id)objc_msgSend(WeakRetained, "_fetchIconFromIconService:size:triggerDiskUpdate:", v5, v2, 1);

      }
      v3 = 0;
      v2 = 1;
    }
    while ((v4 & 1) != 0);
    v7 = WeakRetained;
    objc_sync_enter(v7);
    v8 = (void *)v7[5];
    objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_sync_exit(v7);
  }

}

- (void)updateFileProvidersIcon:(id)a3
{
  -[DOCIconService _updateFileProvidersIcon:skipSize:](self, "_updateFileProvidersIcon:skipSize:", a3, 2);
}

- (id)iconForFileProvider:(id)a3 size:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject **v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  DOCIconService *v21;
  NSDictionary *documentSourceIconCache;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DOCIconService loadIconsFromDiskIfNeeded](self, "loadIconsFromDiskIfNeeded");
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2DE30]);

  if (v8)
  {
    +[DOCIconService DOCLocalProviderIcon](DOCIconService, "DOCLocalProviderIcon");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[DOCIconService SFSymbolImageProviderIcon:](DOCIconService, "SFSymbolImageProviderIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_symbolImageDefaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithConfiguration:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (a4 < 2)
      {
        objc_msgSend(v6, "extensionBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = self;
        objc_sync_enter(v21);
        documentSourceIconCache = v21->_documentSourceIconCache;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](documentSourceIconCache, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = -[NSMutableSet containsObject:](v21->_updatedProviderDomains, "containsObject:", v20);
        if ((v26 & 1) == 0)
          -[NSMutableSet addObject:](v21->_updatedProviderDomains, "addObject:", v20);
        objc_sync_exit(v21);

        if (v25
          || (-[DOCIconService _fetchIconFromDiskCacheForProviderID:size:](v21, "_fetchIconFromDiskCacheForProviderID:size:", v20, a4), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v27 = 0;
          a4 = 2;
        }
        else
        {
          -[DOCIconService _fetchIconFromIconService:size:triggerDiskUpdate:](v21, "_fetchIconFromIconService:size:triggerDiskUpdate:", v20, a4, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 1;
        }
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A80]), "initWithData:uuid:", v25, 0);
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "traitCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "displayScale");
        v32 = v31;

        objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", objc_msgSend(v28, "CGImage"), 0, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v27 | v26 ^ 1) == 1)
        {
          v36[0] = v6;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[DOCIconService _updateFileProvidersIcon:skipSize:](v21, "_updateFileProvidersIcon:skipSize:", v34, a4);

        }
        v9 = v33;

      }
      else
      {
        v12 = (NSObject **)MEMORY[0x24BE2DF90];
        v13 = *MEMORY[0x24BE2DF90];
        if (!*MEMORY[0x24BE2DF90])
        {
          DOCInitLogging();
          v13 = *v12;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[DOCIconService iconForFileProvider:size:].cold.1(a4, v13, v14, v15, v16, v17, v18, v19);
        v9 = 0;
      }
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providersToPersist, 0);
  objc_storeStrong((id *)&self->_updatedProviderDomains, 0);
  objc_storeStrong((id *)&self->_ioTimer, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_cacheFolderURL, 0);
  objc_storeStrong((id *)&self->_documentSourceIconCache, 0);
}

- (void)_loadIconsFromDiskForSize:(uint64_t)a3 fileManager:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Could not get url for cache size: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_persistCacheForSize:(uint64_t)a1 bundles:(uint64_t)a2 fileManager:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_209052000, log, OS_LOG_TYPE_ERROR, "Unable to create cache folder '%@': %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_fetchIconFromDiskCacheForProviderID:(uint64_t)a3 size:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a1;
  objc_msgSend(v6, "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[Load-One-DISK] encountered bad disk cache data (length = 0), deleting... (%@, size: %@)"), a3, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136315138;
  v11 = objc_msgSend(v9, "UTF8String");
  _os_log_fault_impl(&dword_209052000, v7, OS_LOG_TYPE_FAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);

}

- (void)iconForFileProvider:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Invalid size was requested for icon: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
