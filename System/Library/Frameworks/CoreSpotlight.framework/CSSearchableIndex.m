@implementation CSSearchableIndex

+ (id)mainBundleID
{
  if (mainBundleID_onceToken != -1)
    dispatch_once(&mainBundleID_onceToken, &__block_literal_global_127);
  return (id)mainBundleID_sMainBundleID;
}

+ (id)codedIdentifiers:(id)a3
{
  id v3;
  CSCoder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(CSCoder);
    -[CSCoder beginArray](v4, "beginArray");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[CSCoder encodeObject:](v4, "encodeObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[CSCoder endArray](v4, "endArray");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    sCSSearchableIndexAvailableRequestCount = 4;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    v3 = (void *)sIndexMap;
    sIndexMap = v2;

  }
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("fetch-last-client-state"));
  location = 0;
  objc_initWeak(&location, v2);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_2;
  v7[3] = &unk_1E24024A8;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_copyWeak(&v11, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_4;
  v5[3] = &unk_1E2402408;
  v6 = *(id *)(a1 + 64);
  -[CSSearchableIndexRequest setCompletionDataBlock:](v2, "setCompletionDataBlock:", v5);
  -[CSSearchableIndexRequest start](v2, "start");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

+ (id)mainBundleLocalizedString
{
  if (mainBundleLocalizedString_onceToken != -1)
    dispatch_once(&mainBundleLocalizedString_onceToken, &__block_literal_global_129);
  return (id)mainBundleLocalizedString_sMainBundleLocalizedString;
}

void __46__CSSearchableIndex_mainBundleLocalizedString__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CSLocalizedString *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v10[0] = *MEMORY[0x1E0C9AD08];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v1, "resourceValuesForKeys:error:", v2, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (!v4 && objc_msgSend(v2, "count"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
      {
        v7 = -[CSLocalizedString initWithLocalizedStrings:]([CSLocalizedString alloc], "initWithLocalizedStrings:", v6);
        v8 = (void *)mainBundleLocalizedString_sMainBundleLocalizedString;
        mainBundleLocalizedString_sMainBundleLocalizedString = (uint64_t)v7;

      }
    }

  }
}

void __39__CSSearchableIndex__standardizeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(v4 + 8) + 25) & 1) == 0)
  {
    v5 = objc_msgSend(v3, "isUpdate");
    v4 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) |= 0x100uLL;
      v4 = *(_QWORD *)(a1 + 40);
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(v4 + 8) + 25) & 0x80) == 0 && (objc_msgSend(v10, "isAppEntity") & 1) == 0)
  {
    objc_msgSend(v10, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appEntityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v10, "setIsAppEntity:", 1);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x8000uLL;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectionClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "standardizeAttributesForBundle:protectionClass:", v8, v9);

}

- (id)_validateOperationWithItems:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  char *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isIndexingAvailable") & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.6();

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -1005;
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x8000)
  {
    logForCSLogCategoryIndex();
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.1(v6, v8);
LABEL_11:

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -1001;
LABEL_12:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x10000)
  {
    logForCSLogCategoryIndex();
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.2(v7, v8);
    goto LABEL_11;
  }
  v14 = self->_protectionClass;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
LABEL_16:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
      objc_msgSend(v19, "protection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = !v20 || v14 == 0;
      if (!v22 && (objc_msgSend(v20, "isEqualToString:", v14) & 1) == 0)
        break;
      objc_msgSend(v19, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend(v23, "length")
        || (unint64_t)objc_msgSend(v23, "length") >= 0x1000)
      {
        logForCSLogCategoryIndex();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.4();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1001, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:

LABEL_46:
        goto LABEL_50;
      }
      objc_msgSend(v19, "domainIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          logForCSLogCategoryIndex();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v24;
            _os_log_error_impl(&dword_18C42F000, v32, OS_LOG_TYPE_ERROR, "Domain identifier %@ isn't a string", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1001, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_45;
        }
      }

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v16)
          goto LABEL_16;
        goto LABEL_31;
      }
    }
    logForCSLogCategoryIndex();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.5();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1001, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
LABEL_31:

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || !objc_msgSend(v29, "length")
          || (unint64_t)objc_msgSend(v29, "length") >= 0x1000)
        {
          logForCSLogCategoryIndex();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.3();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1001, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v26)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_50:

LABEL_13:
  return v12;
}

+ (BOOL)isIndexingAvailable
{
  return 1;
}

- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6
{
  return -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:disableBatching:](self, "_initWithName:protectionClass:bundleIdentifier:options:disableBatching:", a3, a4, a5, a6, 0);
}

- (CSSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", a3, a4, a5, 0);
}

- (void)fetchLastClientStateWithCompletionHandler:(void *)completionHandler
{
  -[CSSearchableIndex fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:](self, "fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:", self->_protectionClass, self->_bundleIdentifier, self->_name, self->_options, completionHandler);
}

- (CSSearchableIndex)initWithName:(NSString *)name protectionClass:(NSFileProtectionType)protectionClass
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", name, protectionClass, 0, 0);
}

void __43__CSSearchableIndex_defaultSearchableIndex__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:disableBatching:]([CSSearchableIndex alloc], "_initWithName:protectionClass:bundleIdentifier:options:disableBatching:", CFSTR("CSSearchableIndexShared"), 0, 0, 0, 1);
  v1 = (void *)defaultSearchableIndex_sDefaultInstance;
  defaultSearchableIndex_sDefaultInstance = (uint64_t)v0;

}

- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6 disableBatching:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  CSSearchableIndex *v15;
  CSSearchableIndex *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *bundleIdentifier;
  uint64_t v21;
  NSString *protectionClass;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CSSearchableIndex;
  v15 = -[CSSearchableIndex init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    if (v12)
    {
      v17 = objc_msgSend(v12, "copy");
      name = v16->_name;
      v16->_name = (NSString *)v17;
    }
    else
    {
      name = v15->_name;
      v15->_name = (NSString *)&stru_1E2406B38;
    }

    v19 = objc_msgSend(v14, "copy");
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v19;

    if (v13)
    {
      CSSanitizeProtectionClass(v13);
      v21 = objc_claimAutoreleasedReturnValue();
      protectionClass = v16->_protectionClass;
      v16->_protectionClass = (NSString *)v21;

    }
    v16->_options = a6;
    v16->_noBatching = a7;
    -[CSSearchableIndex _commonInit](v16, "_commonInit");
  }

  return v16;
}

- (void)_commonInit
{
  unsigned int v3;
  NSNumber *v4;
  NSNumber *indexID;
  id obj;

  self->_batchOpen = 0;
  do
    v3 = __ldaxr((unsigned int *)&_commonInit_sCSSearchableIndexID);
  while (__stlxr(v3 + 1, (unsigned int *)&_commonInit_sCSSearchableIndexID));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  indexID = self->_indexID;
  self->_indexID = v4;

  obj = (id)sIndexMap;
  objc_sync_enter(obj);
  objc_msgSend((id)sIndexMap, "setObject:forKey:", self, self->_indexID);
  objc_sync_exit(obj);

}

void __34__CSSearchableIndex_throttleQueue__block_invoke(uint64_t a1)
{
  CSRequestQueue *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [CSRequestQueue alloc];
  objc_msgSend(*(id *)(a1 + 32), "requestQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CSRequestQueue initWithLabel:target:startBlock:](v2, "initWithLabel:target:startBlock:", "com.apple.spotlight.CoreSpotlight.throttle", v5, &__block_literal_global_70);
  v4 = (void *)throttleQueue_sCSSearchableIndexThrottleQueue;
  throttleQueue_sCSSearchableIndexThrottleQueue = v3;

}

void __33__CSSearchableIndex_requestQueue__block_invoke()
{
  CSRequestQueue *v0;
  void *v1;

  v0 = -[CSRequestQueue initWithLabel:target:startBlock:]([CSRequestQueue alloc], "initWithLabel:target:startBlock:", "com.apple.spotlight.CoreSpotlight.request", 0, &__block_literal_global_68);
  v1 = (void *)requestQueue_sCSSearchableIndexRequestQueue;
  requestQueue_sCSSearchableIndexRequestQueue = (uint64_t)v0;

}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v5, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v6, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v10, v11);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v11);
    }

  }
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "client-state-key", "client-state-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  NSString *v13;
  id v14;
  id v15;
  NSString *bundleIdentifier;
  NSString *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  NSString *v22;
  _QWORD activity_block[5];
  NSString *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (NSString *)a4;
  v14 = a5;
  v15 = a7;
  bundleIdentifier = v13;
  if (!v13)
    bundleIdentifier = self->_bundleIdentifier;
  v17 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v17;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v12;
    v34 = 2048;
    v35 = a6;
    _os_log_debug_impl(&dword_18C42F000, v18, OS_LOG_TYPE_DEBUG, "(%@) fetchLastClientStateWithProtectionClass, clientStateName:%@, protectionClass:%@, options:0x%lx", buf, 0x2Au);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke;
  activity_block[3] = &unk_1E24024D0;
  activity_block[4] = self;
  v24 = v13;
  v25 = v12;
  v26 = v14;
  v27 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v12;
  v22 = v13;
  _os_activity_initiate(&dword_18C42F000, "fetch-last-client-state", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)sIndexMap;
  objc_sync_enter(v3);
  objc_msgSend((id)sIndexMap, "removeObjectForKey:", self->_indexID);
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CSSearchableIndex;
  -[CSSearchableIndex dealloc](&v4, sel_dealloc);
}

- (id)throttleQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CSSearchableIndex_throttleQueue__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  if (throttleQueue_onceToken != -1)
    dispatch_once(&throttleQueue_onceToken, block);
  return (id)throttleQueue_sCSSearchableIndexThrottleQueue;
}

void __34__CSSearchableIndex_throttleQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_throttleIfNecessary");
  objc_msgSend(v2, "_perform");

}

- (void)throttle
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "throttleQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a2, v4, "Suspended \"%s\", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)unthrottle
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "throttleQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a2, v4, "Resumed \"%s\", v5);

  OUTLINED_FUNCTION_2_0();
}

- (id)requestQueue
{
  if (requestQueue_onceToken != -1)
    dispatch_once(&requestQueue_onceToken, &__block_literal_global_66);
  return (id)requestQueue_sCSSearchableIndexRequestQueue;
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "fetch-client-state", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  v6 = *(void **)(a1 + 56);
  if (v6)
    xpc_dictionary_set_string(v3, "client-state-name", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_3;
  v7[3] = &unk_1E2402278;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v7);
  objc_destroyWeak(&v8);

}

- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4
{
  xpc_object_t v6;
  NSString *name;
  NSString *protectionClass;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command-type", "index-type");
  xpc_dictionary_set_string(v6, "command", a3);
  xpc_dictionary_set_uint64(v6, "id", -[NSNumber integerValue](self->_indexID, "integerValue"));
  name = self->_name;
  if (name)
    xpc_dictionary_set_string(v6, "n", -[NSString UTF8String](name, "UTF8String"));
  protectionClass = self->_protectionClass;
  if (protectionClass)
    xpc_dictionary_set_string(v6, "ipc", -[NSString UTF8String](protectionClass, "UTF8String"));
  xpc_dictionary_set_uint64(v6, "iopt", self->_options);
  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CSIndexConnection)connection
{
  return (CSIndexConnection *)+[CSIndexConnection sharedConnectionForUser:](CSIndexConnection, "sharedConnectionForUser:", self->_user);
}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_all_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  xpc_object_t v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "donate_relevant_actions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v5, "encodedData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = xpc_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  xpc_dictionary_set_value(v3, "data", v7);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_3;
  v8[3] = &unk_1E2402278;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v8);
  objc_destroyWeak(&v9);

}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_all_activities", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_3;
  v5[3] = &unk_1E2402278;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v5);
  objc_destroyWeak(&v6);

}

- (void)_issueNonLaunchingCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[CSIndexDelegateConnection sharedConnectionForUser:](CSIndexDelegateConnection, "sharedConnectionForUser:", self->_user);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[CSSearchableIndex xpc_dictionary_for_command:requiresInitialization:](self, "xpc_dictionary_for_command:requiresInitialization:", "issue", objc_msgSend(v4, "previouslyInitialized") ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v6, "request", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    objc_msgSend(v5, "sendMessageAsync:", v6);

  }
}

void __38__CSSearchableIndex__delegateCheckIn___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __38__CSSearchableIndex__delegateCheckIn___block_invoke_cold_1(a1, v2);

  +[CSIndexDelegateConnection sharedConnectionForUser:](CSIndexDelegateConnection, "sharedConnectionForUser:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "xpc_dictionary_for_command:requiresInitialization:", "check-in", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v5)
    xpc_dictionary_set_string(v4, "r", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  objc_msgSend(v3, "sendMessageAsync:", v4);

}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteAllInteractionsWithCompletionHandler:(id)a3
{
  -[CSSearchableIndex deleteAllInteractionsWithBundleID:protectionClass:completionHandler:](self, "deleteAllInteractionsWithBundleID:protectionClass:completionHandler:", self->_bundleIdentifier, self->_protectionClass, a3);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(NSArray *)domainIdentifiers completionHandler:(void *)completionHandler
{
  -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:](self, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:", domainIdentifiers, self->_protectionClass, self->_bundleIdentifier, self->_options, 0, completionHandler);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, a6, self->_name, a7, a8, a9, 0, a10);
}

- (void)deleteAllUserActivities:(id)bundleIdentifier completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD activity_block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v7 = bundleIdentifier;
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_INFO, "(%@) deleteAllUserActivities", buf, 0xCu);
  }

  +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flush");

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2401660;
  activity_block[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  _os_activity_initiate(&dword_18C42F000, "delete-all-activities", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:](self, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, a6, 0, a7);
}

+ (CSSearchableIndex)defaultSearchableIndex
{
  if (defaultSearchableIndex_onceToken != -1)
    dispatch_once(&defaultSearchableIndex_onceToken, &__block_literal_global_11);
  return (CSSearchableIndex *)(id)defaultSearchableIndex_sDefaultInstance;
}

void __39__CSSearchableIndex_indexUserActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CSUserActivityTuple *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[CSSearchableItem searchableItemFromUserActivity:bundleID:](CSSearchableItem, "searchableItemFromUserActivity:bundleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSUserAction actionFromUserActivity:searchableItem:](CSUserAction, "actionFromUserActivity:searchableItem:", *(_QWORD *)(a1 + 32), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = *(void **)(a1 + 48);
    v13[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_validateOperationWithItems:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_9;
    v7 = *(void **)(a1 + 48);
    v12 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_standardizeItems:", v8);

  }
  logForCSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __39__CSSearchableIndex_indexUserActivity___block_invoke_cold_1();

  if (v2 && v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "activityQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CSUserActivityTuple initWithAction:item:]([CSUserActivityTuple alloc], "initWithAction:item:", v3, v2);
    objc_msgSend(v10, "queueItem:", v11);

  }
LABEL_9:

}

- (void)indexSearchableItems:(NSArray *)items completionHandler:(void *)completionHandler
{
  NSArray *v6;
  void (**v7)(void *, void *);
  void *v8;
  NSObject *v9;
  char *v10;
  CSSearchableIndex *v11;
  NSMutableArray *v12;

  v6 = items;
  v7 = completionHandler;
  if (self->_batchOpen)
  {
    -[CSSearchableIndex _validateOperationWithItems:](self, "_validateOperationWithItems:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryIndex();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (char *)v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CSSearchableIndex indexSearchableItems:completionHandler:].cold.2(v6, v10);

      if (v7)
        v7[2](v7, v8);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CSSearchableIndex indexSearchableItems:completionHandler:].cold.1(v6, v10);

      v11 = self;
      objc_sync_enter(v11);
      v12 = v11->_batchedItemsToIndex;
      if (!v12)
      {
        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_storeStrong((id *)&v11->_batchedItemsToIndex, v12);
      }
      objc_sync_exit(v11);

      -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v6);
      if (v7)
        v7[2](v7, 0);

    }
  }
  else
  {
    -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:", v6, MEMORY[0x1E0C9AA60], 0, 0, v7);
  }

}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, self->_name, a6, a7, a8, 0, a9);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, 0, a6, a7, a8, a9, 0, a10);
}

- (int64_t)_standardizeItems:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CSSearchableIndex__standardizeItems___block_invoke;
  v7[3] = &unk_1E24022C8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 1, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (void)_setLastUpdateTime
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  sCSSearchableIndexLastUpdateTime = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(obj);

}

- (id)_validateClientState:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "length") >= 0x401)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CSSearchableIndex _validateClientState:].cold.1(v4, v5);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1002, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CSIndexingQueue)activityQueue
{
  CSSearchableIndex *v2;
  CSIndexingQueue *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityQueue;
  objc_sync_exit(v2);

  return v3;
}

- (id)_validateOperationWithItems:(id)a3
{
  return -[CSSearchableIndex _validateOperationWithItems:identifiers:](self, "_validateOperationWithItems:identifiers:", a3, 0);
}

- (void)indexUserActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  CSSearchableIndex *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend((id)objc_opt_class(), "mainBundleID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEligibleForSearch");
  objc_msgSend(v4, "contentAttributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "length") || (objc_msgSend(v7, "isEqualToString:", v10) & 1) != 0)
    goto LABEL_5;
  if ((hasInternalCSEntitlement() & 1) != 0)
  {
    v11 = v10;

    v7 = v11;
LABEL_5:
    v12 = objc_msgSend((id)objc_opt_class(), "activityShouldBeIndexed:bundleID:", v4, v7);
    logForCSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("YES");
      if (v6)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v24 = v15;
      if (v8)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      if (!v12)
        v14 = CFSTR("NO");
      v28 = v14;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_18C42F000, v13, OS_LOG_TYPE_INFO, "Indexing UA, hasUserInfo:%@, eligibleForSearch:%@, shouldBeIndexed:%@, bundleID:%@,", buf, 0x2Au);
    }

    -[CSSearchableIndex _makeActivityQueueIfNecessary](self, "_makeActivityQueueIfNecessary");
    -[CSSearchableIndex throttleQueue](self, "throttleQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__CSSearchableIndex_indexUserActivity___block_invoke;
    v19[3] = &unk_1E2401ED0;
    v20 = v4;
    v7 = v7;
    v21 = v7;
    v22 = self;
    objc_msgSend(v17, "async:", v19);

    v18 = v20;
    goto LABEL_16;
  }
  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[CSSearchableIndex indexUserActivity:].cold.1();
LABEL_16:

}

+ (BOOL)activityShouldBeIndexed:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "_suggestedActionType") == 1)
  {
    if ((objc_msgSend(v5, "isEligibleForSearch") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEligibleForPrediction");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_makeActivityQueueIfNecessary
{
  CSSearchableIndex *v2;
  void *v3;
  _BOOL4 v4;
  CSIndexingQueue *v5;
  double v6;
  uint64_t v7;
  CSIndexingQueue *activityQueue;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activityQueue)
  {
    location = 0;
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __50__CSSearchableIndex__makeActivityQueueIfNecessary__block_invoke;
    v12 = &unk_1E24020D0;
    objc_copyWeak(&v13, &location);
    v3 = (void *)objc_msgSend(&v9, "copy");
    v4 = +[CoreSpotlightUtils fastUserActivites](CoreSpotlightUtils, "fastUserActivites", v9, v10, v11, v12);
    v5 = [CSIndexingQueue alloc];
    v6 = 30.0;
    if (v4)
      v6 = 1.0;
    v7 = -[CSIndexingQueue initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:](v5, "initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:", 60, 2, v3, v6);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (CSIndexingQueue *)v7;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

- (id)_validateOperationWithIdentifiers:(id)a3
{
  return -[CSSearchableIndex _validateOperationWithItems:identifiers:](self, "_validateOperationWithItems:identifiers:", 0, a3);
}

+ (id)codedUniqueIdentifiers:(id)a3
{
  id v3;
  void *v4;
  CSCoder *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
    v5 = objc_alloc_init(CSCoder);
    -[CSCoder beginArray](v5, "beginArray");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[CSCoder encodeObject:](v5, "encodeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[CSCoder endArray](v5, "endArray");
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }

  return v5;
}

- (CSSearchableIndex)initWithName:(id)a3 bundleIdentifier:(id)a4
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", a3, 0, a4, 0);
}

- (void)endIndexBatchWithClientState:(NSData *)clientState completionHandler:(void *)completionHandler
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", 0, clientState, 0, 0, completionHandler);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexID, 0);
  objc_storeStrong((id *)&self->_batchedItemIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_batchedItemsToIndex, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_indexDelegate);
  objc_storeStrong((id *)&self->_activityQueue, 0);
}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7
{
  -[CSSearchableIndex slowFetchAttributes:protectionClass:bundleID:identifiers:options:completionHandler:](self, "slowFetchAttributes:protectionClass:bundleID:identifiers:options:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)setIndexDelegate:(id)indexDelegate
{
  CSSearchableIndex *v4;
  id WeakRetained;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *delegateQueue;
  id obj;

  obj = indexDelegate;
  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_indexDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&v4->_indexDelegate, obj);
    if (obj)
    {
      if (!v4->_delegateQueue)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = dispatch_queue_create("com.apple.spotlight.CoreSpotlight.delegate", v6);
        delegateQueue = v4->_delegateQueue;
        v4->_delegateQueue = (OS_dispatch_queue *)v7;

      }
      -[CSSearchableIndex _delegateCheckIn:](v4, "_delegateCheckIn:", CFSTR("set-index-delegate"));
    }
  }
  objc_sync_exit(v4);

}

- (void)_delegateCheckIn:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned int user;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v9;
  CSSearchableIndex *v10;
  unsigned int v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexDelegate);

  if (WeakRetained)
  {
    user = self->_user;
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CSSearchableIndex__delegateCheckIn___block_invoke;
    block[3] = &unk_1E24020F8;
    v9 = v4;
    v10 = self;
    v11 = user;
    dispatch_async(delegateQueue, block);

  }
}

void __33__CSSearchableIndex_mainBundleID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mainBundleID_sMainBundleID;
  mainBundleID_sMainBundleID = v1;

  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __33__CSSearchableIndex_mainBundleID__block_invoke_cold_1(v3, v4, v5);

}

- (id)indexDelegate
{
  CSSearchableIndex *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_indexDelegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)beginIndexBatch
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, v0, v1, "Opening an index batch for index:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke(_QWORD *a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", a1[4], CFSTR("delete-all-activities"));
  location = 0;
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_2;
  v7 = &unk_1E24023E0;
  v3 = (void *)a1[5];
  v8 = a1[4];
  v9 = v3;
  objc_copyWeak(&v10, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", a1[6], v4, v5, v6, v7, v8);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-all-interactions"));
  location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402458;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56));
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("donate-relevant-actions"));
  location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402458;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56));
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v10 = bundleIdentifier;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v10;
    v21 = 2048;
    v22 = v8;
    _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "(%@) donateRelevantActions: %p, ", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke;
  v15[3] = &unk_1E2402480;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  _os_activity_initiate(&dword_18C42F000, "donate-relevant-actions", OS_ACTIVITY_FLAG_DEFAULT, v15);

}

- (void)deleteAllInteractionsWithBundleID:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *protectionClass;
  NSString *v12;
  NSObject *v13;
  id v14;
  NSString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  NSString *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v9 = bundleIdentifier;
  v10 = (NSString *)a4;
  protectionClass = v10;
  if (!v10)
    protectionClass = self->_protectionClass;
  v12 = protectionClass;

  logForCSLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_18C42F000, v13, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllInteractionsWithBundleID, protectionClass:%@", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke;
  v17[3] = &unk_1E2402480;
  v17[4] = self;
  v18 = v9;
  v19 = v12;
  v20 = v8;
  v14 = v8;
  v15 = v12;
  v16 = v9;
  _os_activity_initiate(&dword_18C42F000, "delete-all-interactions", OS_ACTIVITY_FLAG_DEFAULT, v17);

}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", a3, a4, a5, 0, a6);
}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "add_interaction", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_string(v3, "icn", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", *(_QWORD *)(a1 + 64), *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v6, "encodedData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_data(v3, "data", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_3;
  v8[3] = &unk_1E2402278;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v8);
  objc_destroyWeak(&v9);

}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("add-interaction"));
  location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402690;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_copyWeak(&v9, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 72));
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)addInteraction:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *protectionClass;
  NSString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  NSString *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v12 = bundleIdentifier;
  v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13)
    protectionClass = self->_protectionClass;
  v15 = protectionClass;

  v16 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "performSelector:", sel_intent);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        logForCSLogCategoryDefault();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v30 = v12;
          v31 = 2048;
          v32 = v16;
          v33 = 2112;
          v34 = v15;
          v35 = 2112;
          v36 = v20;
          _os_log_debug_impl(&dword_18C42F000, v21, OS_LOG_TYPE_DEBUG, "(%@) addInteraction, interaction:%p, protectionClass:%@ intent:%@", buf, 0x2Au);
        }

        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke;
        v23[3] = &unk_1E24026B8;
        v23[4] = self;
        v24 = v12;
        v25 = v15;
        v26 = v20;
        v27 = v16;
        v28 = v11;
        v22 = v20;
        _os_activity_initiate(&dword_18C42F000, "add-interaction", OS_ACTIVITY_FLAG_DEFAULT, v23);

      }
    }
  }

}

+ (void)setConnectionName:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".index"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sConnectionName;
  sConnectionName = v4;

  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".delegate"));
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)sDelegateConnectionName;
  sDelegateConnectionName = v6;

  sPrivateDaemon = 1;
}

- (void)_setUser:(unsigned int)a3
{
  self->_user = a3;
}

+ (id)codedNSUAPersistentIdentifiers:(id)a3
{
  id v3;
  CSCoder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(CSCoder);
    -[CSCoder beginArray](v4, "beginArray");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (_QWORD)v13))
          {
            objc_msgSend(CFSTR("NSUA:"), "stringByAppendingString:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSCoder encodeObject:](v4, "encodeObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    -[CSCoder endArray](v4, "endArray");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)criticalQueue
{
  if (criticalQueue_onceToken != -1)
    dispatch_once(&criticalQueue_onceToken, &__block_literal_global_61);
  return (id)criticalQueue_sCSSearchableIndexCriticalQueue;
}

void __34__CSSearchableIndex_criticalQueue__block_invoke()
{
  CSRequestQueue *v0;
  void *v1;

  v0 = -[CSRequestQueue initWithLabel:target:critical:startBlock:]([CSRequestQueue alloc], "initWithLabel:target:critical:startBlock:", "com.apple.spotlight.CoreSpotlight.critical", 0, 1, &__block_literal_global_65);
  v1 = (void *)criticalQueue_sCSSearchableIndexCriticalQueue;
  criticalQueue_sCSSearchableIndexCriticalQueue = (uint64_t)v0;

}

uint64_t __34__CSSearchableIndex_criticalQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_perform");
}

uint64_t __33__CSSearchableIndex_requestQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_perform");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *protectionClass;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  if (self->_name)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("name=\"%@\"), self->_name);
    objc_msgSend(v3, "addObject:", v4);

  }
  if (self->_bundleIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bundleID=%@"), self->_bundleIdentifier);
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_options)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("options=0x%lx"), self->_options);
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CSSearchableIndex indexDelegate](self, "indexDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("delegate=%p"), v7);
    objc_msgSend(v3, "addObject:", v8);

  }
  if (-[NSString isEqualToString:](self->_protectionClass, "isEqualToString:", CFSTR("Priority")))
  {
    objc_msgSend(v3, "addObject:", CFSTR("priority=1"));
  }
  else
  {
    protectionClass = self->_protectionClass;
    if (protectionClass && !-[NSString isEqualToString:](protectionClass, "isEqualToString:", *MEMORY[0x1E0CB2AC0]))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("dataclass=%@"), self->_protectionClass);
      objc_msgSend(v3, "addObject:", v10);

    }
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("<%@:%p; %@>"), v12, self, v13);

  return v14;
}

- (CSSearchableIndex)initWithName:(NSString *)name
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", name, 0, 0, 0);
}

- (CSSearchableIndex)initWithName:(id)a3 options:(int64_t)a4
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", a3, 0, 0, a4);
}

- (CSSearchableIndex)init
{
  return (CSSearchableIndex *)-[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](self, "_initWithName:protectionClass:bundleIdentifier:options:", &stru_1E2406B38, 0, 0, 0);
}

void __50__CSSearchableIndex__makeActivityQueueIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = CFSTR("NO");
    if ((_DWORD)a3)
      v9 = CFSTR("YES");
    v11 = 134218242;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_INFO, "Flushing UA queue, count:%lu, flush:%@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_indexActivities:flush:", v5, a3);

  objc_autoreleasePoolPop(v6);
}

+ (void)notifyIndexDelegates
{
  notify_post("com.apple.spotlight.IndexAgent.awake");
}

+ (double)lastUpdateTime
{
  id v2;
  double v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = *(double *)&sCSSearchableIndexLastUpdateTime;
  objc_sync_exit(v2);

  return v3;
}

+ (void)volumeMountedAtURL:(id)a3 withOptions:(id)a4
{
  CSLiveFSVolumeMountedAtURL(a3, 0);
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  CSSearchableIndex *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  NSMutableArray *batchedItemsToIndex;
  NSMutableArray *batchedItemIdentifiersToDelete;
  id v21;
  id v22;
  id v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  _QWORD v26[5];
  NSMutableArray *v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  BOOL v33;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!self->_batchOpen)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("No open batch"), CFSTR("There is no batch open"));
  logForCSLogCategoryIndex();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:].cold.1();

  v16 = self;
  objc_sync_enter(v16);
  v17 = v16->_batchedItemsToIndex;
  v18 = v16->_batchedItemIdentifiersToDelete;
  batchedItemsToIndex = v16->_batchedItemsToIndex;
  v16->_batchedItemsToIndex = 0;

  batchedItemIdentifiersToDelete = v16->_batchedItemIdentifiersToDelete;
  v16->_batchedItemIdentifiersToDelete = 0;

  objc_sync_exit(v16);
  self->_batchOpen = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke;
  v26[3] = &unk_1E2402148;
  v26[4] = v16;
  v27 = v17;
  v28 = v18;
  v29 = v13;
  v33 = a5;
  v31 = v14;
  v32 = a6;
  v30 = v12;
  v21 = v14;
  v22 = v12;
  v23 = v13;
  v24 = v18;
  v25 = v17;
  _os_activity_initiate(&dword_18C42F000, "end-index-batch", OS_ACTIVITY_FLAG_DEFAULT, v26);

}

void __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v1[6];
  v6 = v1[7];
  v7 = v1[10] | (32 * *(unsigned __int8 *)(a1 + 88));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke_2;
  v10[3] = &unk_1E2402120;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 80);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v1, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:protectionClass:forBundleID:options:reason:completionHandler:", v2, v3, v4, v8, v5, v6, v7, v9, v10);

}

uint64_t __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", 0, a3, a4, a5, a6);
}

- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 completionHandler:(id)a5
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", 0, a3, a4, 0, a5);
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", a3, a4, 0, a5, a6);
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 completionHandler:(id)a5
{
  -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:](self, "endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:", a3, a4, 0, 0, a5);
}

- (void)indexSearchableItems:(id)a3 returningItemsSanitizedForSpotlightTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[CSSearchableIndex _itemsBySanitizingItemsForSpotlight:](self, "_itemsBySanitizingItemsForSpotlight:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__CSSearchableIndex_indexSearchableItems_returningItemsSanitizedForSpotlightTo___block_invoke;
  v11[3] = &unk_1E2402170;
  v12 = v8;
  v13 = v6;
  v9 = v8;
  v10 = v6;
  -[CSSearchableIndex indexSearchableItems:completionHandler:](self, "indexSearchableItems:completionHandler:", v7, v11);

}

uint64_t __80__CSSearchableIndex_indexSearchableItems_returningItemsSanitizedForSpotlightTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2);
  return result;
}

- (id)_itemsBySanitizingItemsForSpotlight:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  CSSearchableItemAttributeSet *v12;
  void *v13;
  CSSearchableItemAttributeSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "copy", (_QWORD)v16);
        v12 = [CSSearchableItemAttributeSet alloc];
        objc_msgSend(v10, "filteredSpotlightAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CSSearchableItemAttributeSet initWithAttributes:](v12, "initWithAttributes:", v13);
        objc_msgSend(v11, "setAttributeSet:", v14);

        objc_msgSend(v4, "addObject:", v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, self->_protectionClass, self->_bundleIdentifier, self->_options, a6, a7);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, a6, self->_name, a7, a8, a9, a10, a11);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 reason:(int64_t)a9 completionHandler:(id)a10
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, self->_name, a6, a7, a8, 0, a10);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11
{
  -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:reason:completionHandler:", a3, a4, a5, 0, a6, a7, a8, a9, a10, a11);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 reason:(int64_t)a11 completionHandler:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  void (**v24)(id, void *);
  NSString *bundleIdentifier;
  NSString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  int64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  char v43;
  id v44;
  void *v45;
  id v46;
  _QWORD activity_block[5];
  id v48;
  int64_t v49;
  _QWORD aBlock[4];
  NSString *v51;
  CSSearchableIndex *v52;
  id v53;
  id v54;
  NSString *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void (**v60)(id, void *);
  int64_t v61;
  int64_t v62;
  char v63;
  uint8_t buf[4];
  NSString *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  __int16 v80;
  int64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v46 = a8;
  v23 = (NSString *)a9;
  v24 = (void (**)(id, void *))a12;
  objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
  bundleIdentifier = v23;
  if (!v23)
    bundleIdentifier = self->_bundleIdentifier;
  v26 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414338;
    v65 = v26;
    v66 = 2112;
    v67 = v22;
    v68 = 2048;
    v69 = objc_msgSend(v20, "length");
    v70 = 2112;
    v71 = v46;
    v72 = 2048;
    v73 = objc_msgSend(v18, "count");
    v74 = 2112;
    v75 = v18;
    v76 = 2048;
    v77 = objc_msgSend(v19, "count");
    v78 = 2112;
    v79 = v19;
    v80 = 2048;
    v81 = a10;
    _os_log_debug_impl(&dword_18C42F000, v27, OS_LOG_TYPE_DEBUG, "(%@) indexSearchableItems, clientState:%@/%lu, protectionClass:%@, items/%ld:%@, deleteIdentifiers/%ld:%@, options:0x%lx", buf, 0x5Cu);
  }

  -[CSSearchableIndex _validateOperationWithItems:identifiers:](self, "_validateOperationWithItems:identifiers:", v18, v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28
    || (-[CSSearchableIndex _validateClientState:](self, "_validateClientState:", v20),
        (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v24)
      v24[2](v24, v28);
  }
  else if (objc_msgSend(v18, "count") || (v40 = objc_msgSend(v19, "count"), v20) || v40)
  {
    v44 = v22;
    if (objc_msgSend(v19, "count"))
    {
      +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "activityQueue");
      v30 = v21;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "flush");

      v21 = v30;
    }
    CS_simplifyItemArray(v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)sConnectionName, "isEqualToString:", CFSTR("com.apple.spotlight.IndexAgent")))
      -[CSSearchableIndex _setMailMessageAttributes:](self, "_setMailMessageAttributes:", v32);
    v45 = v21;
    -[CSSearchableIndex _setFPAttributes:](self, "_setFPAttributes:", v32);
    objc_opt_class();
    v43 = objc_opt_isKindOfClass() & 1;
    if (v43)
    {
      v33 = -[CSSearchableIndex _standardizeItems:](self, "_standardizeItems:", v32, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "currentPersona");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v35, "copyCurrentPersonaContextWithError:", 0);

      v33 = -[CSSearchableIndex _standardizeItems:](self, "_standardizeItems:", v32, v42);
    }
    v36 = v33 | a10;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke;
    aBlock[3] = &unk_1E2402228;
    v51 = v26;
    v52 = self;
    v61 = a11;
    v18 = v32;
    v53 = v18;
    v54 = v19;
    v62 = v36;
    v55 = v23;
    v56 = v46;
    v57 = v20;
    v63 = v43;
    v58 = v45;
    v59 = v41;
    v60 = v24;
    v37 = v41;
    v38 = _Block_copy(aBlock);
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2_158;
    activity_block[3] = &unk_1E2402250;
    v48 = v38;
    v49 = v36;
    activity_block[4] = self;
    v39 = v38;
    _os_activity_initiate(&dword_18C42F000, "index-items", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    v21 = v45;
    v28 = 0;
    v22 = v44;
  }
  else
  {
    if (v24)
      v24[2](v24, 0);
    v28 = 0;
  }

}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CSCoder *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CSCoder *v14;
  CSCoder *v15;
  void *v16;
  void *v17;
  void *v18;
  CSCoder *v19;
  CSCoder *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  CSCoder *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CSSearchableIndexRequest *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  CSCoder *v42;
  void *v43;
  void *v44;
  id v45;
  CSCoder *v47;
  id obj;
  CSCoder *v49;
  CSCoder *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64[7];
  char v65;
  id location;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  void *v74;
  void **v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v1 = a1;
  v79 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v45 = v2;
LABEL_4:
    v3 = *(_QWORD *)(v1 + 112);
    +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logWithBundleID:indexOperation:itemCount:code:", v45, 1, objc_msgSend(*(id *)(a1 + 48), "count"), v3);

    +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = a1;
    objc_msgSend(v5, "logWithBundleID:indexOperation:itemCount:code:", v45, 2, objc_msgSend(*(id *)(a1 + 56), "count"), v3);

    goto LABEL_5;
  }
  objc_msgSend((id)objc_opt_class(), "mainBundleID");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v1 = a1;
  if (v45)
    goto LABEL_4;
  v45 = 0;
LABEL_5:
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", *(_QWORD *)(v1 + 56));
  objc_msgSend(v52, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSSearchableIndex codedIdentifiers:](CSSearchableIndex, "codedIdentifiers:", v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (CSCoder *)objc_msgSend(*(id *)(a1 + 48), "count");
  v42 = v7;
  if (v7)
  {
    v47 = objc_alloc_init(CSCoder);
    -[CSCoder beginArray](v47, "beginArray");
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = *(id *)(a1 + 48);
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v53)
    {
      v49 = 0;
      v50 = 0;
      v51 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v70 != v51)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v9, "uniqueIdentifier", v42);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v52, "containsObject:", v10) & 1) == 0)
          {
            objc_msgSend(v9, "attributeSet");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "HTMLContentData");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v9, "attributeSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setAttribute:forKey:", 0, CFSTR("kMDItemHTMLContentData"));

              if (objc_msgSend(v12, "length"))
              {
                v14 = v50;
                if (!v50)
                {
                  v15 = objc_alloc_init(CSCoder);
                  -[CSCoder beginArray](v15, "beginArray");
                  -[CSCoder encodeObject:](v15, "encodeObject:", CFSTR("contentHTML"));
                  -[CSCoder beginDictionary](v15, "beginDictionary");
                  v14 = v15;
                }
                v50 = v14;
                -[CSCoder encodeObject:](v14, "encodeObject:", v10);
                -[CSCoder encodeObject:](v50, "encodeObject:", v12);
              }
            }
            objc_msgSend(v9, "attributeSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "textContent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v9, "attributeSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setAttribute:forKey:", 0, CFSTR("kMDItemTextContent"));

              if (objc_msgSend(v17, "length"))
              {
                v19 = v49;
                if (!v49)
                {
                  v20 = objc_alloc_init(CSCoder);
                  -[CSCoder beginArray](v20, "beginArray");
                  -[CSCoder encodeObject:](v20, "encodeObject:", CFSTR("contentText"));
                  -[CSCoder beginDictionary](v20, "beginDictionary");
                  v19 = v20;
                }
                v49 = v19;
                -[CSCoder encodeObject:](v19, "encodeObject:", v10);
                -[CSCoder encodeObject:](v49, "encodeObject:", v17);
                objc_msgSend(v9, "attributeSet");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)MEMORY[0x1E0CB37E8];
                v23 = v17;
                v74 = 0;
                v75 = &v74;
                v76 = 0x2020000000;
                v77 = 0;
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                v26 = objc_msgSend(v25, "length");
                v73[0] = MEMORY[0x1E0C809B0];
                v73[1] = 3221225472;
                v73[2] = __stringComposedLengthForEmbeddingCheck_block_invoke;
                v73[3] = &unk_1E24014B0;
                v73[4] = &v74;
                objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", 0, v26, 2, v73);
                v27 = v75[3];
                _Block_object_dispose(&v74, 8);

                objc_msgSend(v22, "numberWithUnsignedInteger:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setAttribute:forKey:", v28, CFSTR("_kMDItemTextContentEmbedCheckLen"));

              }
            }
            objc_msgSend(v9, "attributeSet");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSCoder encodeObject:](v47, "encodeObject:", v29);

          }
        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v53);
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }

    -[CSCoder endArray](v47, "endArray");
    -[CSCoder endDictionary](v50, "endDictionary");
    -[CSCoder endArray](v50, "endArray");
    -[CSCoder endDictionary](v49, "endDictionary");
    -[CSCoder endArray](v49, "endArray");
    v7 = v47;
  }
  else
  {
    v49 = 0;
    v50 = 0;
  }
  v73[0] = 0;
  v30 = v7;
  -[CSCoder plistContainer](v7, "plistContainer", v42);
  v31 = (void *)_MDPlistContainerCopyDispatchData();
  v74 = 0;
  -[CSCoder plistContainer](v49, "plistContainer");
  v32 = (void *)_MDPlistContainerCopyDispatchData();
  v68 = 0;
  -[CSCoder plistContainer](v50, "plistContainer");
  v33 = (void *)_MDPlistContainerCopyDispatchData();
  v67 = 0;
  objc_msgSend(v44, "plistContainer");
  v34 = (void *)_MDPlistContainerCopyDispatchData();
  v35 = -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:critical:", *(_QWORD *)(a1 + 40), CFSTR("index-items"), (*(_QWORD *)(a1 + 120) >> 5) & 1);
  location = 0;
  objc_initWeak(&location, v35);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  v54[3] = &unk_1E2402200;
  v54[4] = *(_QWORD *)(a1 + 40);
  v55 = *(id *)(a1 + 64);
  v36 = *(id *)(a1 + 72);
  v37 = *(void **)(a1 + 120);
  v56 = v36;
  v64[1] = v37;
  v38 = v31;
  v57 = v38;
  v64[2] = (id)v73[0];
  v39 = v32;
  v58 = v39;
  v64[3] = v74;
  v40 = v33;
  v59 = v40;
  v64[4] = v68;
  v41 = v34;
  v60 = v41;
  v64[5] = v67;
  v61 = *(id *)(a1 + 80);
  v62 = *(id *)(a1 + 88);
  v64[6] = v43;
  v65 = *(_BYTE *)(a1 + 128);
  v63 = *(id *)(a1 + 96);
  objc_copyWeak(v64, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v35, "setPerformBlock:", v54);
  -[CSSearchableIndexRequest setCompletionBlock:](v35, "setCompletionBlock:", *(_QWORD *)(a1 + 104));
  -[CSSearchableIndexRequest start](v35, "start");
  objc_destroyWeak(v64);

  objc_destroyWeak(&location);
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "xpc_dictionary_for_command:requiresInitialization:", "process-index-data", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  if (v5)
    xpc_dictionary_set_string(v4, "b", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  v6 = *(void **)(a1 + 48);
  if (v6)
    xpc_dictionary_set_string(v4, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  xpc_dictionary_set_uint64(v4, "opt", *(_QWORD *)(a1 + 120));
  add_dispatch_data_to_xpc_dict(v4, "items", *(NSObject **)(a1 + 56), "items-size", *(_QWORD *)(a1 + 128));
  add_dispatch_data_to_xpc_dict(v4, "textdata", *(NSObject **)(a1 + 64), "text-data-size", *(_QWORD *)(a1 + 136));
  add_dispatch_data_to_xpc_dict(v4, "htmldata", *(NSObject **)(a1 + 72), "html-data-size", *(_QWORD *)(a1 + 144));
  add_dispatch_data_to_xpc_dict(v4, "ids", *(NSObject **)(a1 + 80), "ids-size", *(_QWORD *)(a1 + 152));
  v7 = *(void **)(a1 + 88);
  if (v7)
    xpc_dictionary_set_data(v4, "client-state-key", (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), objc_msgSend(*(id *)(a1 + 88), "length"));
  v8 = *(void **)(a1 + 96);
  if (v8)
    xpc_dictionary_set_data(v4, "expected-client-state-key", (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), objc_msgSend(*(id *)(a1 + 96), "length"));
  logForCSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v20 = *(_QWORD *)(a1 + 160);
    v21 = *(_QWORD *)(a1 + 136) + *(_QWORD *)(a1 + 128) + *(_QWORD *)(a1 + 144);
    *(_DWORD *)buf = 134218240;
    v29 = v20;
    v30 = 2048;
    v31 = v21;
    _os_log_debug_impl(&dword_18C42F000, v9, OS_LOG_TYPE_DEBUG, "index items: %ld, bytes: %ld", buf, 0x16u);
  }

  if (*(_BYTE *)(a1 + 168))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPersona");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "copyCurrentPersonaContextWithError:", 0);

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "restorePersonaWithSavedPersonaContext:", *(_QWORD *)(a1 + 104));

  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_157;
  v25 = &unk_1E24021D8;
  v16 = v4;
  v26 = v16;
  objc_copyWeak(&v27, (id *)(a1 + 112));
  objc_msgSend(v3, "sendMessageAsync:completion:", v16, &v22);
  if (!*(_BYTE *)(a1 + 168))
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", v22, v23, v24, v25, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPersona");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "restorePersonaWithSavedPersonaContext:", v10);

  }
  objc_destroyWeak(&v27);

}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = a2;
  v4 = (id)objc_opt_self();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v5);
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2_158(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if ((*(_BYTE *)(a1 + 48) & 0x20) != 0)
  {
    objc_msgSend(v2, "criticalQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "async:critical:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    objc_msgSend(v2, "throttleQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "async:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_validateOperation
{
  return -[CSSearchableIndex _validateOperationWithItems:](self, "_validateOperationWithItems:", 0);
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:](self, "willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:", a3, self->_protectionClass, self->_bundleIdentifier, self->_options, a4);
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSString *v14;
  void (**v15)(id, void *);
  NSString *bundleIdentifier;
  NSString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  CSSearchableIndexRequest *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  NSString *v25;
  id v26;
  id v27;
  id v28[3];
  id location;
  _BYTE buf[12];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (NSString *)a5;
  v15 = (void (**)(id, void *))a7;
  bundleIdentifier = v14;
  if (!v14)
    bundleIdentifier = self->_bundleIdentifier;
  v17 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v17;
    v31 = 2048;
    v32 = objc_msgSend(v12, "count");
    v33 = 2112;
    v34 = v12;
    v35 = 2048;
    v36 = a6;
    _os_log_debug_impl(&dword_18C42F000, v18, OS_LOG_TYPE_DEBUG, "(%@) willModifySearchableItemsWithIdentifiers, identifiers/%ld:%@, options:0x%lx", buf, 0x2Au);
  }

  -[CSSearchableIndex _validateOperationWithIdentifiers:](self, "_validateOperationWithIdentifiers:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 || !objc_msgSend(v12, "count"))
  {
    if (v15)
      v15[2](v15, v19);
  }
  else
  {
    +[CSSearchableIndex codedUniqueIdentifiers:](CSSearchableIndex, "codedUniqueIdentifiers:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v23, "plistContainer");
    v20 = (void *)_MDPlistContainerCopyDispatchData();
    v21 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("will-modify-items"));
    location = 0;
    objc_initWeak(&location, v21);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke;
    v24[3] = &unk_1E24022A0;
    v24[4] = self;
    v25 = v14;
    v26 = v13;
    v28[1] = (id)a6;
    v22 = v20;
    v27 = v22;
    v28[2] = *(id *)buf;
    objc_copyWeak(v28, &location);
    -[CSSearchableIndexRequest setPerformBlock:](v21, "setPerformBlock:", v24);
    -[CSSearchableIndexRequest setCompletionBlock:](v21, "setCompletionBlock:", v15);
    -[CSSearchableIndexRequest start](v21, "start");
    objc_destroyWeak(v28);

    objc_destroyWeak(&location);
  }

}

void __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "will-modify", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_uint64(v3, "opt", *(_QWORD *)(a1 + 72));
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 56), "ids-size", *(_QWORD *)(a1 + 80));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, char *);
  char *v10;
  NSObject *v11;
  NSObject *v12;
  CSSearchableIndex *v13;
  NSMutableArray *v14;

  v8 = a3;
  v9 = (void (**)(id, char *))a5;
  if (self->_batchOpen)
  {
    -[CSSearchableIndex _validateOperationWithIdentifiers:](self, "_validateOperationWithIdentifiers:", v8);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryIndex();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CSSearchableIndex deleteSearchableItemsWithIdentifiers:reason:completionHandler:].cold.2(v8, v10, v12);

      if (v9)
        v9[2](v9, v10);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CSSearchableIndex deleteSearchableItemsWithIdentifiers:reason:completionHandler:].cold.1(v8, (char *)v12);

      v13 = self;
      objc_sync_enter(v13);
      v14 = v13->_batchedItemIdentifiersToDelete;
      if (!v14)
      {
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_storeStrong((id *)&v13->_batchedItemIdentifiersToDelete, v14);
      }
      objc_sync_exit(v13);

      -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v8);
      if (v9)
        v9[2](v9, 0);

    }
  }
  else
  {
    -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:reason:completionHandler:", MEMORY[0x1E0C9AA60], v8, 0, a4, v9);
  }

}

- (void)deleteSearchableItemsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler
{
  -[CSSearchableIndex deleteSearchableItemsWithIdentifiers:reason:completionHandler:](self, "deleteSearchableItemsWithIdentifiers:reason:completionHandler:", identifiers, 0, completionHandler);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:](self, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:", a3, self->_protectionClass, self->_bundleIdentifier, self->_options, a4, a5);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 reason:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  NSString *v16;
  void (**v17)(id, void *);
  NSString *bundleIdentifier;
  NSString *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int64_t v28;
  void *v29;
  _QWORD activity_block[5];
  NSString *v31;
  id v32;
  id v33;
  void (**v34)(id, void *);
  int64_t v35;
  uint64_t v36;
  _BYTE buf[12];
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (NSString *)a5;
  v17 = (void (**)(id, void *))a8;
  objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
  bundleIdentifier = v16;
  if (!v16)
    bundleIdentifier = self->_bundleIdentifier;
  v19 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v19;
    v38 = 2112;
    v39 = v15;
    v40 = 2048;
    v41 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_18C42F000, v20, OS_LOG_TYPE_DEFAULT, "(%@) deleteSearchableItemsWithDomainIdentifiers, protectionClass:%@, domainIdentifiers number:%ld", buf, 0x20u);
  }

  logForCSLogCategoryIndex();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:].cold.1();

  +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logWithBundleID:indexOperation:itemCount:code:", v19, 2, objc_msgSend(v14, "count"), a7);

  -[CSSearchableIndex _validateOperationWithIdentifiers:](self, "_validateOperationWithIdentifiers:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 || !objc_msgSend(v14, "count"))
  {
    if (v17)
      v17[2](v17, v23);
  }
  else
  {
    v28 = a6;
    +[CSSearchableIndex codedUniqueIdentifiers:](CSSearchableIndex, "codedUniqueIdentifiers:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v29, "plistContainer");
    v24 = (void *)_MDPlistContainerCopyDispatchData();
    +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activityQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "flush");

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke;
    activity_block[3] = &unk_1E24022F0;
    activity_block[4] = self;
    v31 = v16;
    v32 = v15;
    v33 = v24;
    v35 = v28;
    v36 = *(_QWORD *)buf;
    v34 = v17;
    v27 = v24;
    _os_activity_initiate(&dword_18C42F000, "delete-domains", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16[3];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-domains"));
  location = 0;
  objc_initWeak(&location, v2);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  v11 = &unk_1E24022A0;
  v3 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 72);
  v14 = v4;
  v16[1] = v5;
  v6 = *(id *)(a1 + 56);
  v7 = *(void **)(a1 + 80);
  v15 = v6;
  v16[2] = v7;
  objc_copyWeak(v16, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v8);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 64), v8, v9, v10, v11, v12);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-domains", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_uint64(v3, "opt", *(_QWORD *)(a1 + 72));
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 56), "ids-size", *(_QWORD *)(a1 + 80));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteAllSearchableItemsWithReason:(int64_t)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex deleteAllSearchableItemsWithProtectionClass:forBundleID:options:reason:completionHandler:](self, "deleteAllSearchableItemsWithProtectionClass:forBundleID:options:reason:completionHandler:", self->_protectionClass, self->_bundleIdentifier, self->_options, a3, a4);
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(void *)completionHandler
{
  -[CSSearchableIndex deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:](self, "deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:", self->_protectionClass, self->_bundleIdentifier, self->_options, completionHandler);
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:](self, "deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:", self->_protectionClass, a3, self->_options, a4);
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex deleteAllSearchableItemsWithProtectionClass:forBundleID:options:reason:completionHandler:](self, "deleteAllSearchableItemsWithProtectionClass:forBundleID:options:reason:completionHandler:", a3, a4, self->_options, 0, a6);
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  NSString *v13;
  void (**v14)(id, void *);
  NSString *bundleIdentifier;
  NSString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[5];
  NSString *v24;
  id v25;
  void (**v26)(id, void *);
  int64_t v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (NSString *)a4;
  v14 = (void (**)(id, void *))a7;
  objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
  bundleIdentifier = v13;
  if (!v13)
    bundleIdentifier = self->_bundleIdentifier;
  v16 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v16;
    v30 = 2112;
    v31 = v12;
    v32 = 2048;
    v33 = a5;
    v34 = 2048;
    v35 = qos_class_self();
    _os_log_debug_impl(&dword_18C42F000, v17, OS_LOG_TYPE_DEBUG, "(%@) deleteAllSearchableItemsWithProtectionClass, protectionClass:%@, options:0x%lx, qos:0x%lx", buf, 0x2Au);
  }

  if (v16)
  {
    +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logWithBundleID:indexOperation:itemCount:code:", v16, 9, 1, a6);

  }
  -[CSSearchableIndex _validateOperation](self, "_validateOperation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v14)
      v14[2](v14, v19);
  }
  else
  {
    +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activityQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "flush");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke;
    aBlock[3] = &unk_1E2402340;
    aBlock[4] = self;
    v24 = v13;
    v25 = v12;
    v27 = a5;
    v26 = v14;
    v22 = _Block_copy(aBlock);
    _os_activity_initiate(&dword_18C42F000, "delete-all-items", OS_ACTIVITY_FLAG_DEFAULT, v22);

  }
}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-all-items"));
  location = 0;
  objc_initWeak(&location, v2);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  v9 = &unk_1E2402318;
  v3 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 64);
  v12 = v4;
  v13[1] = v5;
  objc_copyWeak(v13, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v6);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56), v6, v7, v8, v9, v10);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v13);

  objc_destroyWeak(&location);
}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-bundle", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_uint64(v3, "opt", *(_QWORD *)(a1 + 64));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteSearchableItemsSinceDate:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:](self, "deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:", a3, self->_protectionClass, self->_bundleIdentifier, self->_options, a4);
}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSString *v14;
  void (**v15)(id, void *);
  NSString *bundleIdentifier;
  NSString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  NSString *v23;
  id v24;
  id v25;
  void (**v26)(id, void *);
  int64_t v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (NSString *)a5;
  v15 = (void (**)(id, void *))a7;
  objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
  bundleIdentifier = v14;
  if (!v14)
    bundleIdentifier = self->_bundleIdentifier;
  v17 = bundleIdentifier;
  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v17;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v12;
    v34 = 2048;
    v35 = a6;
    _os_log_debug_impl(&dword_18C42F000, v18, OS_LOG_TYPE_DEBUG, "(%@) deleteSearchableItemsSinceDate, bundleID:%@, startDate:%@, options:0x%lx", buf, 0x2Au);
  }

  -[CSSearchableIndex _validateOperation](self, "_validateOperation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v15)
      v15[2](v15, v19);
  }
  else
  {
    +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activityQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "flush");

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke;
    v22[3] = &unk_1E2402390;
    v22[4] = self;
    v23 = v14;
    v24 = v13;
    v27 = a6;
    v25 = v12;
    v26 = v15;
    _os_activity_initiate(&dword_18C42F000, "delete-all-items-since-date", OS_ACTIVITY_FLAG_DEFAULT, v22);

  }
}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-all-items-since-date"));
  location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2402368;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 72);
  v8 = v4;
  v10[1] = v5;
  v9 = *(id *)(a1 + 56);
  objc_copyWeak(v10, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v6);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 64));
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-from-date", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_uint64(v3, "opt", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v3, "time", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_3;
  v7[3] = &unk_1E2402278;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v7);
  objc_destroyWeak(&v8);

}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)fetchDataForBundleIdentifier:(NSString *)bundleIdentifier itemIdentifier:(NSString *)itemIdentifier contentType:(UTType *)contentType completionHandler:(void *)completionHandler
{
  void *v10;
  NSString *v11;
  NSString *v12;
  id v13;

  v10 = completionHandler;
  v11 = itemIdentifier;
  v12 = bundleIdentifier;
  -[UTType identifier](contentType, "identifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableIndex provideDataForBundle:identifier:type:completionHandler:](self, "provideDataForBundle:identifier:type:completionHandler:", v12, v11, v13, v10);

}

- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex provideDataForBundle:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideDataForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  -[CSSearchableIndex provideFileURLForBundle:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideFileURLForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 completionHandler:(id)a7
{
  -[CSSearchableIndex provideDataForBundle:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideDataForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, a6, a7);
}

- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 completionHandler:(id)a8
{
  uint64_t v8;

  v8 = 2;
  if (!a6)
    v8 = 0;
  -[CSSearchableIndex provideFileURLForBundle:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideFileURLForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, v8 | a7, a8);
}

- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v12 = a7;
  if (a6)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provide:data1:%ld:%@:%@:%@"), a6, a5, a3, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provide:data:%@:%@:%@"), a5, a3, a4, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__CSSearchableIndex_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E24023B8;
  v17 = v12;
  v14 = v12;
  -[CSSearchableIndex _issueCommand:completionHandler:](self, "_issueCommand:completionHandler:", v13, v16);

}

uint64_t __98__CSSearchableIndex_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v12 = a7;
  if (a6)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provide:url1:%ld:%@:%@:%@"), a6, a5, a3, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provide:url:%@:%@:%@"), a5, a3, a4, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__CSSearchableIndex_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E24023B8;
  v17 = v12;
  v14 = v12;
  -[CSSearchableIndex _issueCommand:completionHandler:](self, "_issueCommand:completionHandler:", v13, v16);

}

void __101__CSSearchableIndex_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  +[CSDecoder decodeURLPreservingSecurityScope:](CSDecoder, "decodeURLPreservingSecurityScope:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)provideFileURLsForBundle:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(";"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provide:urls:%ld:%@:%@:%@"), a6, v14, v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
    v22[3] = &unk_1E2401638;
    v23 = v13;
    v24 = v15;
    -[CSSearchableIndex _issueCommand:completionHandler:](self, "_issueCommand:completionHandler:", v17, v22);

  }
  else
  {
    logForCSLogCategoryIndex();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CSSearchableIndex provideFileURLsForBundle:itemIdentifiers:typeIdentifier:options:completionHandler:].cold.1();

    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2FE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("itemIdentifiers may not be nil."), *MEMORY[0x1E0CB2D50]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 22, v21);

    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v16);
  }

}

void __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v13, v5, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v14, *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      logForCSLogCategoryIndex();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_cold_1();

      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
    v15 = v6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_photosLibraryDeleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndexRequest *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("command"));
  location = 0;
  objc_initWeak(&location, v8);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke;
  v14[3] = &unk_1E24023E0;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  objc_copyWeak(&v16, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v8, "setPerformBlock:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2402408;
  v11 = v7;
  v13 = v11;
  -[CSSearchableIndexRequest setCompletionDataBlock:](v8, "setCompletionDataBlock:", v12);
  -[CSSearchableIndexRequest start](v8, "start");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a1[4], "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "xpc_dictionary_for_command:requiresInitialization:", "photoslibrary-deleted", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v3, "path", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, a1 + 6);
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    objc_msgSend(a3, "data");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)_openJournalFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndexRequest *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("command"));
  location = 0;
  objc_initWeak(&location, v8);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke;
  v14[3] = &unk_1E24023E0;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  objc_copyWeak(&v16, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v8, "setPerformBlock:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2402408;
  v11 = v7;
  v13 = v11;
  -[CSSearchableIndexRequest setCompletionDataBlock:](v8, "setCompletionDataBlock:", v12);
  -[CSSearchableIndexRequest start](v8, "start");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "open-journal", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "journal-name", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_2;
  v5[3] = &unk_1E2402278;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v5);
  objc_destroyWeak(&v6);

}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  CSDataWrapper *v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);

  }
  else
  {
    v9 = xpc_dictionary_dup_fd(v3, "journal-fd");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CSDataWrapper initWithData:]([CSDataWrapper alloc], "initWithData:", v6);
    v8 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v8, "retryIfNecessaryWithError:dataWrapper:", 0, v7);

  }
}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a2;
  v8 = 0;
  objc_msgSend(a3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getBytes:length:", &v8, 8);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, v8, v5);

}

- (void)_issueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndexRequest *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("command"));
  location = 0;
  objc_initWeak(&location, v8);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke;
  v14[3] = &unk_1E24023E0;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  objc_copyWeak(&v16, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v8, "setPerformBlock:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2402408;
  v11 = v7;
  v13 = v11;
  -[CSSearchableIndexRequest setCompletionDataBlock:](v8, "setCompletionDataBlock:", v12);
  -[CSSearchableIndexRequest start](v8, "start");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a1[4], "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "xpc_dictionary_for_command:requiresInitialization:", "issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v3, "request", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  xpc_dictionary_set_fd(v3, "fd", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, a1 + 6);
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    objc_msgSend(a3, "data");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  CSSearchableIndexRequest *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  int v16;
  BOOL v17;
  id location;

  v8 = a5;
  v9 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("command"));
  location = 0;
  objc_initWeak(&location, v9);
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke;
  v14[3] = &unk_1E2402430;
  v14[4] = self;
  v17 = a4;
  v16 = a3;
  objc_copyWeak(&v15, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v9, "setPerformBlock:", v14);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2402408;
  v11 = v8;
  v13 = v11;
  -[CSSearchableIndexRequest setCompletionDataBlock:](v9, "setCompletionDataBlock:", v12);
  -[CSSearchableIndexRequest start](v9, "start");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;
  int v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 52))
    v5 = "diagnosemd_q";
  else
    v5 = "diagnosemd";
  xpc_dictionary_set_string(v3, "request", v5);
  v6 = *(_DWORD *)(a1 + 48);
  if ((v6 & 0x80000000) == 0)
    xpc_dictionary_set_fd(v4, "fd", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_2;
  v7[3] = &unk_1E2402278;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  objc_msgSend(v2, "sendMessageAsync:completion:", v4, v7);
  objc_destroyWeak(&v8);

}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    objc_msgSend(a3, "data");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)prepareIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSString *v12;
  NSString *protectionClass;
  NSString *v14;
  NSObject *v15;
  id v16;
  NSString *v17;
  id v18;
  _QWORD activity_block[5];
  id v20;
  NSString *v21;
  id v22;
  double v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v11 = bundleIdentifier;
  v12 = (NSString *)a4;
  protectionClass = v12;
  if (!v12)
    protectionClass = self->_protectionClass;
  v14 = protectionClass;

  logForCSLogCategoryIndex();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v11;
    v26 = 2112;
    v27 = v14;
    v28 = 2048;
    v29 = (unint64_t)a5;
    _os_log_debug_impl(&dword_18C42F000, v15, OS_LOG_TYPE_DEBUG, "(%@) prepareIndexingWhileLocked: %@, %lu", buf, 0x20u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2402340;
  activity_block[4] = self;
  v20 = v11;
  v23 = a5;
  v21 = v14;
  v22 = v10;
  v16 = v10;
  v17 = v14;
  v18 = v11;
  _os_activity_initiate(&dword_18C42F000, "prepare-indexing-while-locked", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("prepare-indexing-while-locked"));
  location = 0;
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_2;
  v7 = &unk_1E2402318;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11[1] = *(id *)(a1 + 64);
  objc_copyWeak(v11, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56), v4, v5, v6, v7, v8);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "prepare-indexing-locked", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_double(v3, "time", *(double *)(a1 + 64));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)finishIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *protectionClass;
  NSString *v12;
  NSObject *v13;
  id v14;
  NSString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  NSString *v19;
  id v20;

  v8 = a5;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v9 = bundleIdentifier;
  v10 = (NSString *)a4;
  protectionClass = v10;
  if (!v10)
    protectionClass = self->_protectionClass;
  v12 = protectionClass;

  logForCSLogCategoryIndex();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex finishIndexingWhileLocked:protectionClass:completionHandler:].cold.1();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke;
  v17[3] = &unk_1E2402480;
  v17[4] = self;
  v18 = v9;
  v19 = v12;
  v20 = v8;
  v14 = v8;
  v15 = v12;
  v16 = v9;
  _os_activity_initiate(&dword_18C42F000, "finish-indexing-while-locked", OS_ACTIVITY_FLAG_DEFAULT, v17);

}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("finish-indexing-while-locked"));
  location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E2402458;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56));
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "finish-indexing-locked", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSString *bundleIdentifier;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint64_t v16;
  _BYTE buf[12];
  __int16 v18;
  int64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = bundleIdentifier;
    v18 = 2048;
    v19 = a4;
    v20 = 2048;
    v21 = objc_msgSend(v6, "count");
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEBUG, "(%@) changeStateOfSearchableItemsWithUIDs, state:%ld, identifiers/%lu:%@", buf, 0x2Au);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
    +[CSSearchableIndex codedUniqueIdentifiers:](CSSearchableIndex, "codedUniqueIdentifiers:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v8, "plistContainer");
    v9 = (void *)_MDPlistContainerCopyDispatchData();
    -[CSSearchableIndex throttleQueue](self, "throttleQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CSSearchableIndex_changeStateOfSearchableItemsWithUIDs_toState___block_invoke;
    v13[3] = &unk_1E2402538;
    v13[4] = self;
    v14 = v9;
    v15 = a4;
    v16 = *(_QWORD *)buf;
    v11 = v9;
    objc_msgSend(v10, "async:", v13);

  }
}

void __66__CSSearchableIndex_changeStateOfSearchableItemsWithUIDs_toState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "change-state", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v2, "modify-state", *(_QWORD *)(a1 + 48));
  add_dispatch_data_to_xpc_dict(v2, "ids", *(NSObject **)(a1 + 40), "ids-size", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "sendMessageAsync:completion:", v2, &__block_literal_global_222);

}

- (void)_changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forUser:(unsigned int)a5 forBundleID:(id)a6 forUTIType:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSString *bundleIdentifier;
  _QWORD v19[5];
  id v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  unsigned int v24;
  _BYTE buf[12];
  __int16 v26;
  int64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  logForCSLogCategoryIndex();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = bundleIdentifier;
    v26 = 2048;
    v27 = a4;
    v28 = 2048;
    v29 = objc_msgSend(v11, "count");
    v30 = 2112;
    v31 = v11;
    _os_log_debug_impl(&dword_18C42F000, v13, OS_LOG_TYPE_DEBUG, "(%@) changeStateOfSearchableItemsWithUIDs, state:%ld, identifiers/%lu:%@", buf, 0x2Au);
  }

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_setLastUpdateTime");
    +[CSSearchableIndex codedUniqueIdentifiers:](CSSearchableIndex, "codedUniqueIdentifiers:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v14, "plistContainer");
    v15 = (void *)_MDPlistContainerCopyDispatchData();
    -[CSSearchableIndex throttleQueue](self, "throttleQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__CSSearchableIndex__changeStateOfSearchableItemsWithUIDs_toState_forUser_forBundleID_forUTIType___block_invoke;
    v19[3] = &unk_1E2402580;
    v19[4] = self;
    v20 = v15;
    v22 = a4;
    v23 = *(_QWORD *)buf;
    v24 = a5;
    v21 = v12;
    v17 = v15;
    objc_msgSend(v16, "async:", v19);

  }
}

void __98__CSSearchableIndex__changeStateOfSearchableItemsWithUIDs_toState_forUser_forBundleID_forUTIType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "change-state", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v2, "modify-state", *(_QWORD *)(a1 + 56));
  add_dispatch_data_to_xpc_dict(v2, "ids", *(NSObject **)(a1 + 40), "ids-size", *(_QWORD *)(a1 + 64));
  xpc_dictionary_set_uint64(v2, "user-id", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_string(v2, "ct", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
  objc_msgSend(v3, "sendMessageAsync:completion:", v2, &__block_literal_global_225);

}

- (void)_indexActivities:(id)a3 flush:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CSSearchableIndex *v11;
  BOOL v12;

  v6 = a3;
  -[CSSearchableIndex throttleQueue](self, "throttleQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CSSearchableIndex__indexActivities_flush___block_invoke;
  v9[3] = &unk_1E24025C8;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "async:", v9);

}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("action"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("item"));
          objc_msgSend(v2, "addObject:", v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v13, "encodeObject:forKey:", v2, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v13, "encodedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v14, "length") || *(_BYTE *)(v18 + 48))
  {
    objc_msgSend(*(id *)(v18 + 40), "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v18 + 40), "xpc_dictionary_for_command:requiresInitialization:", "activities", objc_msgSend(v15, "previouslyInitialized") ^ 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v17 = objc_retainAutorelease(v14);
      xpc_dictionary_set_data(v16, "data", (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
    }
    xpc_dictionary_set_BOOL(v16, "flush", *(_BYTE *)(v18 + 48));
    objc_msgSend(v15, "sendMessageAsync:completion:", v16, &__block_literal_global_237);

  }
}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;

  csindex_xpc_dictionary_decode_status_with_error(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__CSSearchableIndex__indexActivities_flush___block_invoke_2_cold_1();

  }
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD activity_block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _BYTE buf[12];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v10 = bundleIdentifier;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    v23 = 1024;
    v24 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "(%@) deleteActivities, count:%d", buf, 0x12u);
  }

  if (objc_msgSend(v8, "count"))
  {
    +[CSSearchableIndex defaultSearchableIndex](CSSearchableIndex, "defaultSearchableIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activityQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flush");

    +[CSSearchableIndex codedNSUAPersistentIdentifiers:](CSSearchableIndex, "codedNSUAPersistentIdentifiers:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v14, "plistContainer");
    v15 = (void *)_MDPlistContainerCopyDispatchData();
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke;
    activity_block[3] = &unk_1E2402340;
    activity_block[4] = self;
    v18 = v10;
    v19 = v15;
    v21 = *(_QWORD *)buf;
    v20 = v9;
    v16 = v15;
    _os_activity_initiate(&dword_18C42F000, "delete-activities", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-activities"));
  location = 0;
  objc_initWeak(&location, v2);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_2;
  v9 = &unk_1E2402318;
  v3 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 64);
  v12 = v4;
  v13[1] = v5;
  objc_copyWeak(v13, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v6);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 56), v6, v7, v8, v9, v10);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v13);

  objc_destroyWeak(&location);
}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_activities", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 48), "ids-size", *(_QWORD *)(a1 + 64));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_3;
  v6[3] = &unk_1E24021D8;
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  objc_msgSend(v2, "sendMessageAsync:completion:", v5, v6);
  objc_destroyWeak(&v8);

}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = a2;
  v4 = (id)objc_opt_self();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v5);
}

- (void)flushUserActivities
{
  void *v3;
  _QWORD v4[5];

  -[CSSearchableIndex throttleQueue](self, "throttleQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CSSearchableIndex_flushUserActivities__block_invoke;
  v4[3] = &unk_1E2401238;
  v4[4] = self;
  objc_msgSend(v3, "sync:", v4);

}

void __40__CSSearchableIndex_flushUserActivities__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flush");

}

- (void)performDataMigrationWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD activity_block[5];
  id v9;
  double v10;

  v6 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2402250;
  v10 = a3;
  activity_block[4] = self;
  v9 = v6;
  v7 = v6;
  _os_activity_initiate(&dword_18C42F000, "data-migration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  id v8[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("data-migration"));
  location = 0;
  objc_initWeak(&location, v2);
  -[CSSearchableIndexRequest setShouldThrottle:](v2, "setShouldThrottle:", 0);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_2;
  v6 = &unk_1E24025F0;
  v7 = *(_QWORD *)(a1 + 32);
  v8[1] = *(id *)(a1 + 48);
  objc_copyWeak(v8, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v3);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 40), v3, v4, v5, v6, v7);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "data-migration", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_double(v3, "timeout", *(double *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_3;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSString *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  NSString *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  CSSearchableIndex *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (!v9)
    v9 = self->_protectionClass;
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] CSSearchableIndex#performIndexJob Received job:%@, index:%@", buf, 0x16u);
  }

  -[CSSearchableIndex delegateQueue](self, "delegateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
  v16[3] = &unk_1E2402480;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  if (objc_msgSend(*(id *)(a1 + 40), "jobOptions"))
    v3 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:]([CSSearchableIndex alloc], "_initWithName:protectionClass:bundleIdentifier:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(*(id *)(a1 + 40), "jobOptions"));
  else
    v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_msgSend(*(id *)(a1 + 32), "indexDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  if (v7 && v6)
  {
    switch(objc_msgSend(v7, "jobType"))
    {
      case 1:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_14;
        logForCSLogCategoryIndex();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v29 = v10;
          v30 = 2112;
          v31 = v4;
          _os_log_impl(&dword_18C42F000, v9, OS_LOG_TYPE_DEFAULT, "reindexSearchableItemsWithIdentifiers, job:%@, index:%@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "identifiersToReindex");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v8;
        v26[1] = 3221225472;
        v26[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_250;
        v26[3] = &unk_1E2401238;
        v27 = v5;
        objc_msgSend(v6, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v4, v11, v26);

        v12 = v27;
        goto LABEL_13;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_14;
        v24[0] = v8;
        v24[1] = 3221225472;
        v24[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2;
        v24[3] = &unk_1E2401238;
        v25 = v5;
        objc_msgSend(v6, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:", v4, v24);
        v12 = v25;
LABEL_13:

        goto LABEL_20;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "searchableIndexDidThrottle:", v4);
        break;
      case 5:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "searchableIndexDidFinishThrottle:", v4);
        break;
      default:
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_leave(v5);
        goto LABEL_21;
    }
  }
  dispatch_group_leave(v5);
LABEL_20:
  v13 = 0;
LABEL_21:
  dispatch_get_global_queue(9, 2uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3;
  block[3] = &unk_1E24024D0;
  v19 = *(id *)(a1 + 40);
  v20 = v4;
  v15 = *(_QWORD *)(a1 + 32);
  v21 = v13;
  v22 = v15;
  v23 = *(id *)(a1 + 56);
  v16 = v13;
  v17 = v4;
  dispatch_group_notify(v5, v14, block);

}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_250(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3_cold_1((_QWORD *)a1, v3, v4);

  objc_msgSend(*(id *)(a1 + 56), "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v5);

  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (void)transferDeletionJournalsForProtectionClass:(id)a3 toDirectory:(id)a4 completionHandler:(id)a5
{
  id v8;
  int v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  int v14;

  v10 = a3;
  v8 = a5;
  v9 = open((const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation"), 1081600);
  if ((v9 & 0x80000000) == 0)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke;
    activity_block[3] = &unk_1E2402668;
    activity_block[4] = self;
    v14 = v9;
    v12 = v10;
    v13 = v8;
    _os_activity_initiate(&dword_18C42F000, "delete-journal-transfer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  int v7;
  _QWORD v8[5];
  id v9;
  id v10;
  int v11;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("journal-transfer"));
  location = 0;
  objc_initWeak(&location, v2);
  -[CSSearchableIndexRequest setShouldThrottle:](v2, "setShouldThrottle:", 0);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_2;
  v8[3] = &unk_1E2402618;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_DWORD *)(a1 + 56);
  v9 = v4;
  objc_copyWeak(&v10, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v8);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_4;
  v5[3] = &unk_1E2402640;
  v7 = *(_DWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", v5);
  -[CSSearchableIndexRequest start](v2, "start");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-journal-transfer", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_fd(v3, "fd", *(_DWORD *)(a1 + 56));
  xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_3;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = a2;
  close(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addInteraction:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex addInteraction:bundleID:protectionClass:completionHandler:](self, "addInteraction:bundleID:protectionClass:completionHandler:", a3, self->_bundleIdentifier, self->_protectionClass, a4);
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  NSString *v13;
  NSString *protectionClass;
  NSString *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD activity_block[5];
  id v20;
  NSString *v21;
  id v22;
  void (**v23)(id, void *);
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v12 = bundleIdentifier;
  v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13)
    protectionClass = self->_protectionClass;
  v15 = protectionClass;

  logForCSLogCategoryDefault();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v15;
    v28 = 2048;
    v29 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithIdentifiers, protectionClass:%@, identifiers number:%lu", buf, 0x20u);
  }

  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:].cold.1();

  if (objc_msgSend(v10, "count"))
  {
    -[CSSearchableIndex _validateOperationWithIdentifiers:](self, "_validateOperationWithIdentifiers:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v11)
        v11[2](v11, v18);
    }
    else
    {
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 3221225472;
      activity_block[2] = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
      activity_block[3] = &unk_1E24024D0;
      activity_block[4] = self;
      v20 = v12;
      v21 = v15;
      v22 = v10;
      v23 = v11;
      _os_activity_initiate(&dword_18C42F000, "delete-interactions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }

}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-interactions"));
  location = 0;
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2;
  v7 = &unk_1E24024A8;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 64), v4, v5, v6, v7, v8);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, *(_QWORD *)(a1 + 56), "identifiers");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:](self, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:", a3, self->_bundleIdentifier, self->_protectionClass, a4);
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  NSString *v13;
  NSString *protectionClass;
  NSString *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD activity_block[5];
  id v20;
  NSString *v21;
  id v22;
  void (**v23)(id, void *);
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v12 = bundleIdentifier;
  v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13)
    protectionClass = self->_protectionClass;
  v15 = protectionClass;

  logForCSLogCategoryDefault();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v15;
    v28 = 2048;
    v29 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithGroupIdentifiers, protectionClass:%@, identifiers number:%lu", buf, 0x20u);
  }

  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:].cold.1();

  if (objc_msgSend(v10, "count"))
  {
    -[CSSearchableIndex _validateOperationWithIdentifiers:](self, "_validateOperationWithIdentifiers:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v11)
        v11[2](v11, v18);
    }
    else
    {
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 3221225472;
      activity_block[2] = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
      activity_block[3] = &unk_1E24024D0;
      activity_block[4] = self;
      v20 = v12;
      v21 = v15;
      v22 = v10;
      v23 = v11;
      _os_activity_initiate(&dword_18C42F000, "delete-interactions-with-group-identifiers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }

}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-interactions-with-group-identifiers"));
  location = 0;
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2;
  v7 = &unk_1E24024A8;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 64), v4, v5, v6, v7, v8);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_group_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, *(_QWORD *)(a1 + 56), "identifiers");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E2402278;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v6);
  objc_destroyWeak(&v7);

}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:](self, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:", a3, self->_bundleIdentifier, self->_protectionClass, a4);
}

- (void)_deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD activity_block[5];
  id v10;
  double v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v13 = (unint64_t)a3;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_INFO, "_deleteActionsBeforeTime: %lu, ", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2402250;
  v11 = a3;
  activity_block[4] = self;
  v10 = v6;
  v8 = v6;
  _os_activity_initiate(&dword_18C42F000, "delete-actions-before-time", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  id v8[2];
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("delete-actions-before-time"));
  location = 0;
  objc_initWeak(&location, v2);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_2;
  v6 = &unk_1E24025F0;
  v7 = *(_QWORD *)(a1 + 32);
  v8[1] = *(id *)(a1 + 48);
  objc_copyWeak(v8, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v3);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(_QWORD *)(a1 + 40), v3, v4, v5, v6, v7);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-actions-before-time", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_double(v3, "time", *(double *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_3;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)_deleleActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_INFO, "_deleleActionsWithIdentifiers count: %lu, ", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2401660;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_18C42F000, "delete-actions-with-identifiers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke(_QWORD *a1)
{
  CSSearchableIndexRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", a1[4], CFSTR("delete-actions-with-identifiers"));
  location = 0;
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_2;
  v7 = &unk_1E24023E0;
  v3 = (void *)a1[5];
  v8 = a1[4];
  v9 = v3;
  objc_copyWeak(&v10, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", &v4);
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", a1[6], v4, v5, v6, v7, v8);
  -[CSSearchableIndexRequest start](v2, "start");
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-actions-with-identifiers", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, *(_QWORD *)(a1 + 40), "identifiers");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_3;
  v4[3] = &unk_1E2402278;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  csindex_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
}

- (void)_fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)bundleIdentifier items:(id)a6 includeParents:(BOOL)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSString *v17;
  NSString *protectionClass;
  NSString *v19;
  int64_t options;
  uint64_t v21;
  void *v22;
  char isKindOfClass;
  char v24;
  int64_t v25;
  NSObject *v26;
  qos_class_t v28;
  _QWORD activity_block[5];
  id v31;
  NSString *v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;
  qos_class_t v37;
  BOOL v38;
  char v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  qos_class_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a9;
  if (!bundleIdentifier)
    bundleIdentifier = self->_bundleIdentifier;
  v16 = bundleIdentifier;
  v17 = (NSString *)a4;
  protectionClass = v17;
  if (!v17)
    protectionClass = self->_protectionClass;
  v19 = protectionClass;

  options = self->_options;
  v21 = objc_msgSend(v13, "count");
  objc_msgSend(v14, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v21
    && ((v24 = isKindOfClass & 1, (isKindOfClass & 1) != 0)
     || v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v25 = options | a8;
    v28 = qos_class_self();
    logForCSLogCategoryDefault();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v16;
      v42 = 2112;
      v43 = v19;
      v44 = 1024;
      v45 = v28;
      _os_log_debug_impl(&dword_18C42F000, v26, OS_LOG_TYPE_DEBUG, "(%@) fetchAttributes, protectionClass:%@, QOS:%d", buf, 0x1Cu);
    }

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke;
    activity_block[3] = &unk_1E2402708;
    activity_block[4] = self;
    v36 = v25;
    v31 = v16;
    v32 = v19;
    v38 = a7;
    v37 = v28;
    v33 = v13;
    v39 = v24;
    v34 = v14;
    v35 = v15;
    _os_activity_initiate(&dword_18C42F000, "fetch-attributes", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  char v14;
  char v15;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:critical:", *(_QWORD *)(a1 + 32), CFSTR("fetch-attributes"), 1);
  location = 0;
  objc_initWeak(&location, v2);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_2;
  v7[3] = &unk_1E24026E0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 92);
  v13 = *(_DWORD *)(a1 + 88);
  v10 = *(id *)(a1 + 56);
  v15 = *(_BYTE *)(a1 + 93);
  v11 = *(id *)(a1 + 64);
  objc_copyWeak(&v12, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_4;
  v5[3] = &unk_1E2402408;
  v6 = *(id *)(a1 + 72);
  -[CSSearchableIndexRequest setCompletionDataBlock:](v2, "setCompletionDataBlock:", v5);
  -[CSSearchableIndexRequest start](v2, "start");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "fetch_attributes", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5 = *(void **)(a1 + 48);
  if (v5)
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  if (*(_BYTE *)(a1 + 84))
    xpc_dictionary_set_BOOL(v3, "fpa", 1);
  xpc_dictionary_set_int64(v3, "qos", *(unsigned int *)(a1 + 80));
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, *(_QWORD *)(a1 + 56), "fa");
  if (*(_BYTE *)(a1 + 85))
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "count");
    v7 = malloc_type_malloc(8 * v6 + 8, 0xD413F6CEuLL);
    *v7 = 0;
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7[i + 1] = objc_msgSend(v9, "longLongValue");

      }
    }
    xpc_dictionary_set_data(v3, "data", v7, 8 * v6 + 8);
    free(v7);
  }
  else
  {
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, *(_QWORD *)(a1 + 64), "identifiers");
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_3;
  v10[3] = &unk_1E2402278;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v10);
  objc_destroyWeak(&v11);

}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "fetch-data-key", "fetch-data-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(v5, "dataSize");
    if (v6)
    {
      objc_msgSend(v7, "dataPtr");
      v6 = (void *)_MDPlistBytesCreate();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_msgSend(v15, "count");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__CSSearchableIndex_slowFetchAttributes_protectionClass_bundleID_identifiers_options_completionHandler___block_invoke;
  v21[3] = &unk_1E2402730;
  v22 = v14;
  v23 = v19;
  v20 = v14;
  -[CSSearchableIndex _fetchAttributes:protectionClass:bundleID:items:includeParents:options:completionHandler:](self, "_fetchAttributes:protectionClass:bundleID:items:includeParents:options:completionHandler:", v18, v17, v16, v15, 0, a7, v21);

}

void __104__CSSearchableIndex_slowFetchAttributes_protectionClass_bundleID_identifiers_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a2)
  {
    v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = objc_msgSend(v3, "count");
      if (v6 && v6 == *(_QWORD *)(a1 + 40) + 1)
      {
        objc_msgSend(v3, "subarrayWithRange:", 1);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
    v7 = (id)v5;

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)bulkFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 objects:(id)a6 attributeKeyIndex:(int64_t)a7 includeParents:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  CSSearchableIndex *v32;
  id v33;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  unint64_t v39;
  uint64_t v40;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = objc_msgSend(v14, "count");
  v35 = v18;
  v36 = v17;
  if (!v19)
  {
    v26 = (void *)objc_msgSend(v14, "mutableCopy");
    v22 = -1;
    v27 = a7;
LABEL_23:
    objc_msgSend(v26, "addObject:", CFSTR("_kMDItemOID"));
    v23 = v19++;
    if (!v9)
      goto LABEL_26;
    goto LABEL_24;
  }
  v32 = self;
  v33 = v16;
  v20 = 0;
  if (v9)
    v21 = 2;
  else
    v21 = 1;
  v22 = -1;
  v23 = -1;
  while (1)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 == -1 && objc_msgSend(v24, "isEqualToString:", CFSTR("_kMDItemOID")))
    {
      --v21;
      if (!v9 || v22 != -1)
      {
        v23 = v20;
        goto LABEL_29;
      }
      v23 = v20;
      goto LABEL_17;
    }
    if (v9 && v22 == -1)
      break;
LABEL_17:

    if (v19 == ++v20)
    {
      if (v21)
        goto LABEL_19;
LABEL_30:
      v26 = v14;
      v16 = v33;
      self = v32;
      v28 = v17;
      v27 = a7;
      goto LABEL_31;
    }
  }
  if (!objc_msgSend(v25, "isEqualToString:", CFSTR("_kMDItemOIDParent")))
  {
    v22 = -1;
    goto LABEL_17;
  }
  --v21;
  if (v23 == -1)
  {
    v22 = v20;
    goto LABEL_17;
  }
  v22 = v20;
LABEL_29:

  if (!v21)
    goto LABEL_30;
LABEL_19:
  v26 = (void *)objc_msgSend(v14, "mutableCopy");
  v16 = v33;
  self = v32;
  v27 = a7;
  if (v23 == -1)
    goto LABEL_23;
  if (v9)
  {
LABEL_24:
    if (v22 == -1)
    {
      objc_msgSend(v26, "addObject:", CFSTR("_kMDItemOIDParent"));
      ++v19;
    }
  }
LABEL_26:
  v28 = v36;

LABEL_31:
  v29 = v19 <= v27 || v27 <= -1;
  v37[0] = MEMORY[0x1E0C809B0];
  if (v29)
    v30 = v23;
  else
    v30 = v27;
  v37[1] = 3221225472;
  v37[2] = __125__CSSearchableIndex_bulkFetchAttributes_protectionClass_bundleID_objects_attributeKeyIndex_includeParents_completionHandler___block_invoke;
  v37[3] = &unk_1E2402758;
  v39 = v19;
  v40 = v30;
  v38 = v35;
  v31 = v35;
  -[CSSearchableIndex _fetchAttributes:protectionClass:bundleID:items:includeParents:options:completionHandler:](self, "_fetchAttributes:protectionClass:bundleID:items:includeParents:options:completionHandler:", v26, v15, v16, v28, v9, 0, v37);

}

void __125__CSSearchableIndex_bulkFetchAttributes_protectionClass_bundleID_objects_attributeKeyIndex_includeParents_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (a2)
  {
    v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = objc_msgSend(v3, "count");
      if (v6 < 2)
      {
        v5 = 0;
      }
      else
      {
        v7 = v6;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6 - 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)*MEMORY[0x1E0C9B0D0];
        for (i = 1; i != v7; ++i)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "count") == a1[5])
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", a1[6]);
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = v8;
            if (v8 != (void *)v11)
            {
              v13 = (void *)v11;
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v11);
              v12 = v13;
            }

          }
        }
        v5 = v14;
      }
    }
    v15 = v5;

  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(a1[4] + 16))();

}

+ (id)partialPathAttributes
{
  return &unk_1E242F940;
}

+ (id)computePartialPathWithOID:(id)a3 pathKeyIdx:(unint64_t)a4 pathDictionary:(id)a5 attributeValues:(id)a6 depth:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a7 <= 511 && (objc_msgSend(v12, "integerValue") & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = 0;
    if (v16)
    {
      v19 = (void *)*MEMORY[0x1E0C9B0D0];
      if (v16 != *MEMORY[0x1E0C9B0D0])
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == v19)
        {
          v18 = 0;
        }
        else
        {
          v30 = v20;
          if ((objc_msgSend(v20, "integerValue") & 0xFFFFFFFFFFFFFFFDLL) != 0)
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == v19;
            v23 = v21;
            if (v22
              || !objc_msgSend(v21, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
            {
              objc_msgSend(a1, "computePartialPathWithOID:pathKeyIdx:pathDictionary:attributeValues:depth:", v30, a4, v13, v14, a7 + 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              if (v25)
              {
                objc_msgSend(v25, "stringByAppendingPathComponent:", v17);
                v18 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v27);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v24);

              v18 = v17;
            }

          }
          else
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v28);

            v18 = v17;
          }
          v20 = v30;
        }

      }
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_bulkFetchPartialPathsForObjects:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = 0;
  else
    v15 = 4;

  +[CSSearchableIndex partialPathAttributes](CSSearchableIndex, "partialPathAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__CSSearchableIndex__bulkFetchPartialPathsForObjects_protectionClass_bundleID_completionHandler___block_invoke;
  v18[3] = &unk_1E2402780;
  v19 = v10;
  v20 = v15;
  v17 = v10;
  -[CSSearchableIndex bulkFetchAttributes:protectionClass:bundleID:objects:attributeKeyIndex:includeParents:completionHandler:](self, "bulkFetchAttributes:protectionClass:bundleID:objects:attributeKeyIndex:includeParents:completionHandler:", v16, v12, v11, v13, 0, 1, v18);

}

void __97__CSSearchableIndex__bulkFetchPartialPathsForObjects_protectionClass_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_opt_new();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = +[CSSearchableIndex computePartialPathWithOID:pathKeyIdx:pathDictionary:attributeValues:depth:](CSSearchableIndex, "computePartialPathWithOID:pathKeyIdx:pathDictionary:attributeValues:depth:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), *(_QWORD *)(a1 + 40), v5, v6, 0, (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = v4;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)updateCorrectionsWithFilePath:(id)a3 completionHandler:(id)a4
{
  -[CSSearchableIndex updateCorrectionsWithFilePath:options:completionHandler:](self, "updateCorrectionsWithFilePath:options:completionHandler:", a3, self->_options, a4);
}

- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  logForCSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndex updateCorrectionsWithFilePath:options:completionHandler:].cold.1();

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke;
  activity_block[3] = &unk_1E2401660;
  activity_block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  _os_activity_initiate(&dword_18C42F000, "update-corrections", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke(uint64_t a1)
{
  CSSearchableIndexRequest *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v2 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", *(_QWORD *)(a1 + 32), CFSTR("update-corrections"));
  location = 0;
  objc_initWeak(&location, v2);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_2;
  v7[3] = &unk_1E24023E0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  objc_copyWeak(&v9, &location);
  -[CSSearchableIndexRequest setPerformBlock:](v2, "setPerformBlock:", v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_4;
  v5[3] = &unk_1E2402408;
  v6 = *(id *)(a1 + 48);
  -[CSSearchableIndexRequest setCompletionDataBlock:](v2, "setCompletionDataBlock:", v5);
  -[CSSearchableIndexRequest start](v2, "start");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "update-corrections", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_string(v3, "filepath", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_3;
  v5[3] = &unk_1E2402278;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v5);
  objc_destroyWeak(&v6);

}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v3);
  }
  else
  {
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "filepath", "filepath-size", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

uint64_t __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isEmbeddingVersionCurrent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v6 = (void *)getSKGEmbeddingVersionManagerClass_softClass;
  v20 = getSKGEmbeddingVersionManagerClass_softClass;
  if (!getSKGEmbeddingVersionManagerClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getSKGEmbeddingVersionManagerClass_block_invoke;
    v16[3] = &unk_1E2401140;
    v16[4] = &v17;
    __getSKGEmbeddingVersionManagerClass_block_invoke((uint64_t)v16);
    v6 = (void *)v18[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v17, 8);
  if (v7)
  {
    v15 = 0;
    objc_msgSend(v7, "currentEmbeddingVersionDataReturningError:", &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v9;
    if (a4 && v9)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB3388];
      v22[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -2003, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v8)
    {
      v13 = objc_msgSend(v8, "isEqual:", v5);
      if (((a4 != 0) & (v13 ^ 1)) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -2004, MEMORY[0x1E0C9AA70]);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)batchedItemsToIndex
{
  return self->_batchedItemsToIndex;
}

- (void)setBatchedItemsToIndex:(id)a3
{
  objc_storeStrong((id *)&self->_batchedItemsToIndex, a3);
}

- (NSMutableArray)batchedItemIdentifiersToDelete
{
  return self->_batchedItemIdentifiersToDelete;
}

- (void)setBatchedItemIdentifiersToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_batchedItemIdentifiersToDelete, a3);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (BOOL)batchOpen
{
  return self->_batchOpen;
}

- (void)setBatchOpen:(BOOL)a3
{
  self->_batchOpen = a3;
}

- (BOOL)noBatching
{
  return self->_noBatching;
}

- (void)setNoBatching:(BOOL)a3
{
  self->_noBatching = a3;
}

- (NSNumber)indexID
{
  return self->_indexID;
}

+ (NSArray)allSupportedProtectionClasses
{
  if (allSupportedProtectionClasses_once != -1)
    dispatch_once(&allSupportedProtectionClasses_once, &__block_literal_global_560);
  return (NSArray *)(id)allSupportedProtectionClasses_allProtectionClasses;
}

void __63__CSSearchableIndex_InternalSPI__allSupportedProtectionClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x18D782104]();
  v1 = *MEMORY[0x1E0CB2AB8];
  v5[0] = *MEMORY[0x1E0CB2AB0];
  v5[1] = v1;
  v2 = *MEMORY[0x1E0CB2AC0];
  v5[2] = *MEMORY[0x1E0CB2AD0];
  v5[3] = v2;
  v5[4] = priorityIndexName;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allSupportedProtectionClasses_allProtectionClasses;
  allSupportedProtectionClasses_allProtectionClasses = v3;

  objc_autoreleasePoolPop(v0);
}

- (void)issueCacheCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndexRequest *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CSSearchableIndexRequest initWithSearchableIndex:label:]([CSSearchableIndexRequest alloc], "initWithSearchableIndex:label:", self, CFSTR("command"));
  location = 0;
  objc_initWeak(&location, v8);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  v9 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke;
  v15[3] = &unk_1E24027F0;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_copyWeak(&v18, &location);
  v17 = v19;
  -[CSSearchableIndexRequest setPerformBlock:](v8, "setPerformBlock:", v15);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2402818;
  v11 = v7;
  v13 = v11;
  v14 = v19;
  -[CSSearchableIndexRequest setCompletionDataBlock:](v8, "setCompletionDataBlock:", v12);
  -[CSSearchableIndexRequest start](v8, "start");

  objc_destroyWeak(&v18);
  _Block_object_dispose(v19, 8);

  objc_destroyWeak(&location);
}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "cache-command-issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v3, "cache-request", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_2;
  v4[3] = &unk_1E24027C8;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "sendMessageAsync:completion:", v3, v4);
  objc_destroyWeak(&v5);

}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *WeakRetained;
  id v6;
  id v7;

  v7 = a2;
  csindex_xpc_dictionary_decode_status_with_error(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "retryIfNecessaryWithError:", v4);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "cache-data-key", "cache-data-size", v7);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "retryIfNecessaryWithError:dataWrapper:", 0, WeakRetained);

  }
}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v6 = a2;
    objc_msgSend(a3, "data");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD, id))(v3 + 16))(v3, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

  }
}

void __38__CSSearchableIndex__delegateCheckIn___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  v6 = *(_QWORD *)(a1 + 40);
  v8 = 138412802;
  v9 = v4;
  v10 = 2112;
  v11 = WeakRetained;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_16(&dword_18C42F000, a2, v7, "Checking in with the index agent for reason:\"%@\", delegate:%@, index:%@", (uint8_t *)&v8);

}

- (void)endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "Finishing index batch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)indexSearchableItems:(void *)a1 completionHandler:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a2, v3, "Batching %ld items", v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)indexSearchableItems:(void *)a1 completionHandler:(char *)a2 .cold.2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, v3, "Failed to batch indexing for %ld items", v4);
  OUTLINED_FUNCTION_2_0();
}

void __33__CSSearchableIndex_mainBundleID__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = mainBundleID_sMainBundleID;
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a1, a3, "mainBundleID:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_validateClientState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = 1024;
  v6 = 2048;
  v7 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, a2, v3, "Provided clientState was larger than %lu bytes (was %lu bytes)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateOperationWithItems:(void *)a1 identifiers:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_0(&dword_18C42F000, v2, v3, "Item count %lu exceeded limit %u", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateOperationWithItems:(void *)a1 identifiers:(const char *)a2 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_0(&dword_18C42F000, v2, v3, "delete identifiers count %lu exceeded limit %u", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateOperationWithItems:identifiers:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "Invalid identifier %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_validateOperationWithItems:identifiers:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "Invalid item identifier %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_validateOperationWithItems:identifiers:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, v0, (uint64_t)v0, "Item's protection class (%@) doesn't match %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_validateOperationWithItems:identifiers:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "Indexing is not available on this device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)deleteSearchableItemsWithIdentifiers:(void *)a1 reason:(char *)a2 completionHandler:.cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a2, v3, "Batching deletes for %ld identifiers", v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)deleteSearchableItemsWithIdentifiers:(void *)a1 reason:(const char *)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;

  v6 = 134218242;
  v7 = OUTLINED_FUNCTION_10_0(a1, a2);
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, a3, v5, "Failed to batch deletes for %ld identifiers, error:%@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "domainIdentifiers:%@, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

- (void)provideFileURLsForBundle:itemIdentifiers:typeIdentifier:options:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "itemIdentifiers may not be nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "error unarchiving data: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)finishIndexingWhileLocked:protectionClass:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "(%@) finishIndexingWhileLocked: %@");
  OUTLINED_FUNCTION_1();
}

- (void)indexUserActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "Missing entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __39__CSSearchableIndex_indexUserActivity___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "Serialized UA, action:%@, item:%@");
  OUTLINED_FUNCTION_1();
}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "activities not processed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3_cold_1(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  OUTLINED_FUNCTION_16(&dword_18C42F000, a2, a3, "Completed index job:%@, index:%@, error:%@", (uint8_t *)&v6);
}

- (void)deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, v0, v1, "identifiers:%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)updateCorrectionsWithFilePath:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "updateCorrectionsFileWithFilePath, filePath:%@, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

@end
