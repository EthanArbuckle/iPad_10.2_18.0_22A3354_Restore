@implementation _MDExtensionManager

- (_MDExtensionManager)initWithQueueName:(const char *)a3
{
  _MDExtensionManager *v4;
  dispatch_queue_t v5;
  NSCondition *v6;
  NSCondition *extensionsCondition;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *extensionManagerQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *fileTypeToExtensionMapping;
  NSMutableSet *v13;
  NSMutableSet *fileTypeNegativeCache;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_MDExtensionManager;
  v4 = -[_MDExtensionManager init](&v17, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create(a3, 0);
    -[_MDExtensionManager setQueue:](v4, "setQueue:", v5);

    v6 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    extensionsCondition = v4->_extensionsCondition;
    v4->_extensionsCondition = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.corespotlight.extensionManager", v8);
    extensionManagerQueue = v4->_extensionManagerQueue;
    v4->_extensionManagerQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileTypeToExtensionMapping = v4->_fileTypeToExtensionMapping;
    v4->_fileTypeToExtensionMapping = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    fileTypeNegativeCache = v4->_fileTypeNegativeCache;
    v4->_fileTypeNegativeCache = v13;

    +[CSFileProviderDomainMonitor sharedInstance](CSFileProviderDomainMonitor, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v4->_fileProviderMoniter, v15);

  }
  return v4;
}

- (void)findExtensionsWithCompletionBlock:(id)a3
{
  id v4;
  _MDExtensionLoader *extensionLoader;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  extensionLoader = self->_extensionLoader;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57___MDExtensionManager_findExtensionsWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E24051B8;
  v8 = v4;
  v6 = v4;
  -[_MDExtensionLoader findExtensionsWithCompletionBlock:](extensionLoader, "findExtensionsWithCompletionBlock:", v7);

}

- (void)_notifyForLoadedExtensions
{
  OS_dispatch_queue *notifyQueue;
  NSObject *v3;
  qos_class_t v4;
  dispatch_block_t v5;
  qos_class_t v6;
  dispatch_block_t v7;
  dispatch_block_t block;

  notifyQueue = self->_notifyQueue;
  if (notifyQueue)
  {
    v3 = notifyQueue;
    v4 = qos_class_self();
    if (v4 < 0x1A)
      v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_31);
    else
      v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, &__block_literal_global_31);
    block = v5;
    dispatch_async(v3, v5);

  }
  else
  {
    v6 = qos_class_self();
    if (v6 < 0x1A)
      v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_31);
    else
      v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, &__block_literal_global_31);
    block = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }

}

- (void)_waitForLoadLocked
{
  id v3;

  if (!self->_loaderCallbackCount)
  {
    -[_MDExtensionManager loadExtensions](self, "loadExtensions");
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 60.0);
    -[NSCondition waitUntilDate:](self->_extensionsCondition, "waitUntilDate:", v3);

  }
}

- (BOOL)extensionExistsForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_MDExtensionManager indexExtensionsByBundleID](self, "indexExtensionsByBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (NSDictionary)indexExtensionsByBundleID
{
  NSObject *v3;
  NSDictionary *indexExtensionsByBundleID;
  NSDictionary *v5;
  NSDictionary *v6;
  int v8;
  NSDictionary *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    indexExtensionsByBundleID = self->_indexExtensionsByBundleID;
    v8 = 134217984;
    v9 = indexExtensionsByBundleID;
    _os_log_impl(&dword_18C42F000, v3, OS_LOG_TYPE_INFO, "indexExtensionsByBundleID %p", (uint8_t *)&v8, 0xCu);
  }

  -[NSCondition lock](self->_extensionsCondition, "lock");
  v5 = self->_indexExtensionsByBundleID;
  if (!v5)
  {
    -[_MDExtensionManager _waitForLoadLocked](self, "_waitForLoadLocked");
    v5 = self->_indexExtensionsByBundleID;
  }
  v6 = v5;
  -[NSCondition unlock](self->_extensionsCondition, "unlock");
  return v6;
}

- (NSDictionary)fileProviderBundleMap
{
  NSDictionary *fileProviderBundleMap;
  NSDictionary *v4;

  -[NSCondition lock](self->_extensionsCondition, "lock");
  fileProviderBundleMap = self->_fileProviderBundleMap;
  if (!fileProviderBundleMap)
  {
    -[_MDExtensionManager _waitForLoadLocked](self, "_waitForLoadLocked");
    fileProviderBundleMap = self->_fileProviderBundleMap;
  }
  v4 = fileProviderBundleMap;
  -[NSCondition unlock](self->_extensionsCondition, "unlock");
  return v4;
}

- (NSSet)fileProviderBundleIDs
{
  NSSet *fileProviderBundleIDs;
  NSSet *v4;

  -[NSCondition lock](self->_extensionsCondition, "lock");
  fileProviderBundleIDs = self->_fileProviderBundleIDs;
  if (!fileProviderBundleIDs)
  {
    -[_MDExtensionManager _waitForLoadLocked](self, "_waitForLoadLocked");
    fileProviderBundleIDs = self->_fileProviderBundleIDs;
  }
  v4 = fileProviderBundleIDs;
  -[NSCondition unlock](self->_extensionsCondition, "unlock");
  return v4;
}

- (id)allExtensionsWithBlock:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = (unsigned int (**)(id, void *))a3;
  -[_MDExtensionManager indexExtensionsByBundleID](self, "indexExtensionsByBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        if (v4[2](v4, v10))
          objc_msgSend(v7, "addObject:", v10);
        objc_msgSend(v8, "nextObject");
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
      while (v11);
    }

  }
  else
  {
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)anyExtensionWithBlock:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (unsigned int (**)(id, void *))a3;
  -[_MDExtensionManager indexExtensionsByBundleID](self, "indexExtensionsByBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  while (1)
  {
    v8 = v7;
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    if (!v4 || v4[2](v4, v7))
    {
      v9 = v7;
      break;
    }
  }

  return v7;
}

- (id)extensionForFileType:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *fileTypeToExtensionMapping;
  NSMutableSet *v7;
  NSMutableSet *fileTypeNegativeCache;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  if (self->_lastLoadCount != self->_loaderCallbackCount)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileTypeToExtensionMapping = self->_fileTypeToExtensionMapping;
    self->_fileTypeToExtensionMapping = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    fileTypeNegativeCache = self->_fileTypeNegativeCache;
    self->_fileTypeNegativeCache = v7;

    self->_lastLoadCount = self->_loaderCallbackCount;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("dyn.")))
  {
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_MDExtensionManager extensionForFileType:].cold.1(v9);
LABEL_6:
    v10 = 0;
    goto LABEL_21;
  }
  -[NSMutableDictionary objectForKey:](self->_fileTypeToExtensionMapping, "objectForKey:", v4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10 = (void *)v11;
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_MDExtensionManager extensionForFileType:].cold.5();
  }
  else
  {
    if (-[NSMutableSet containsObject:](self->_fileTypeNegativeCache, "containsObject:", v4))
    {
      logForCSLogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_MDExtensionManager extensionForFileType:].cold.2();
      goto LABEL_6;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44___MDExtensionManager_extensionForFileType___block_invoke;
    v17[3] = &unk_1E24051E0;
    v12 = v4;
    v18 = v12;
    -[_MDExtensionManager anyExtensionWithBlock:](self, "anyExtensionWithBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v15)
        -[_MDExtensionManager extensionForFileType:].cold.4();

      -[NSMutableDictionary setObject:forKey:](self->_fileTypeToExtensionMapping, "setObject:forKey:", v13, v12);
    }
    else
    {
      if (v15)
        -[_MDExtensionManager extensionForFileType:].cold.3();

      -[NSMutableSet addObject:](self->_fileTypeNegativeCache, "addObject:", v12);
    }
    v9 = v13;

    v10 = v9;
  }
LABEL_21:

  return v10;
}

- (id)extensions
{
  return -[_MDExtensionManager allExtensionsWithBlock:](self, "allExtensionsWithBlock:", 0);
}

- (void)_willRunJobWithBundleID:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)_didRetryJobWithBundleID:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)_performJob:(id)a3 extensions:(id)a4 count:(unint64_t)a5 throttle:(id)a6 perExtensionCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  qos_class_t v22;
  dispatch_block_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _MDExtensionManager *v28;
  id v29;
  id v30;
  unint64_t v31;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  queue = self->_queue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke;
  v25[3] = &unk_1E2402390;
  v26 = v13;
  v27 = v12;
  v28 = self;
  v29 = v14;
  v30 = v15;
  v31 = a5;
  v17 = queue;
  v18 = v15;
  v19 = v14;
  v20 = v12;
  v21 = v13;
  v22 = qos_class_self();
  if (v22 < 0x1A)
    v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v25);
  else
    v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v22, 0, v25);
  v24 = v23;
  dispatch_async(v17, v23);

}

+ (BOOL)_isSupported:(id)a3 extension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((unint64_t)(objc_msgSend(v5, "jobType") - 1) >= 3)
  {
    objc_msgSend(v6, "containerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v18 = 1;
    goto LABEL_23;
  }
  objc_msgSend(v5, "protectionClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x1E0CB2AC0];
      v20 = v7;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("Default")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
          {
            v15 = 1;
            v7 = v20;
            goto LABEL_18;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v15 = 0;
        v7 = v20;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_18:

  }
  else
  {
    v15 = 1;
  }

  objc_msgSend(v6, "containerID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v17;
  if ((v15 & 1) != 0 || (objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    goto LABEL_22;
  v18 = 0;
LABEL_23:

  return v18;
}

- (void)_performJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_group_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  CSExtensionJobThrottle *v35;
  NSObject *extensionManagerQueue;
  id v37;
  id v38;
  id v39;
  _MDExtensionManager *v40;
  void *v41;
  NSObject *group;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  uint64_t v47;
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v39 = a6;
  v13 = dispatch_group_create();
  v14 = objc_msgSend(v11, "count");
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
  objc_msgSend(v10, "excludedBundleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = self;
  v41 = v12;
  group = v13;
  v43 = (void *)v15;
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v10, "excludedBundleIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);

  }
  else
  {
    v19 = 0;
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v25, "containerID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && ((objc_msgSend(v19, "containsObject:", v26) & 1) != 0
           || (objc_msgSend(v25, "identifiers"),
               v27 = (void *)objc_claimAutoreleasedReturnValue(),
               v28 = objc_msgSend(v27, "intersectsSet:", v19),
               v27,
               v28)))
        {
          logForCSLogCategoryIndex();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v56 = v10;
            v57 = 2112;
            v58 = v25;
            v30 = v29;
            v31 = "Skipping job:%@ for extension:%@ since it was excluded";
LABEL_22:
            _os_log_debug_impl(&dword_18C42F000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0x16u);
          }
        }
        else if (objc_msgSend(v10, "jobType") == 3 && objc_msgSend(v25, "dontRunDuringMigration"))
        {
          logForCSLogCategoryIndex();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v56 = v10;
            v57 = 2112;
            v58 = v25;
            v30 = v29;
            v31 = "Skipping job:%@ for extension:%@ since it doesn't do migration";
            goto LABEL_22;
          }
        }
        else
        {
          if (+[_MDExtensionManager _isSupported:extension:](_MDExtensionManager, "_isSupported:extension:", v10, v25))
          {
            objc_msgSend(v43, "addObject:", v25);
            dispatch_group_enter(group);
            goto LABEL_24;
          }
          logForCSLogCategoryIndex();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v56 = v10;
            v57 = 2112;
            v58 = v25;
            v30 = v29;
            v31 = "Skipping job:%@ for extension:%@ since it was not supported";
            goto LABEL_22;
          }
        }

LABEL_24:
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v22);
  }

  v32 = objc_msgSend(v43, "count");
  logForCSLogCategoryIndex();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[_MDExtensionManager _performJob:extensions:perExtensionCompletionHandler:completionHandler:].cold.1();

  v34 = MEMORY[0x1E0C809B0];
  if (v32)
  {
    v35 = -[CSExtensionJobThrottle initWithDictionary:]([CSExtensionJobThrottle alloc], "initWithDictionary:", &unk_1E24302D8);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke;
    v48[3] = &unk_1E2405280;
    v50 = v41;
    v49 = group;
    -[_MDExtensionManager _performJob:extensions:count:throttle:perExtensionCompletionHandler:](v40, "_performJob:extensions:count:throttle:perExtensionCompletionHandler:", v10, v43, v32, v35, v48);

    v34 = MEMORY[0x1E0C809B0];
  }
  extensionManagerQueue = v40->_extensionManagerQueue;
  block[0] = v34;
  block[1] = 3221225472;
  block[2] = __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E2402250;
  v45 = v10;
  v46 = v39;
  v47 = v32;
  v37 = v39;
  v38 = v10;
  dispatch_group_notify(group, extensionManagerQueue, block);

}

- (void)indexRequestsPerformJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *extensionManagerQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  qos_class_t v16;
  dispatch_block_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _MDExtensionManager *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke;
  v19[3] = &unk_1E2402480;
  v20 = v8;
  v21 = self;
  v22 = v9;
  v23 = v10;
  v12 = extensionManagerQueue;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = qos_class_self();
  if (v16 < 0x1A)
    v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  else
    v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  v18 = v17;
  dispatch_async(v12, v17);

}

- (void)indexRequestsPerformJob:(id)a3 perExtensionCompletionHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *extensionManagerQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  qos_class_t v16;
  dispatch_block_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E24052A8;
  v19[4] = self;
  v20 = v8;
  v21 = v10;
  v22 = v9;
  v12 = extensionManagerQueue;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  v16 = qos_class_self();
  if (v16 < 0x1A)
    v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  else
    v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  v18 = v17;
  dispatch_async(v12, v17);

}

- (void)indexRequestsPerformJob:(id)a3 forBundles:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *extensionManagerQueue;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  qos_class_t v20;
  dispatch_block_t v21;
  void *v22;
  _QWORD block[4];
  id v24;
  _MDExtensionManager *v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  extensionManagerQueue = self->_extensionManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_1E24052D0;
  v24 = v10;
  v25 = self;
  v26 = v11;
  v27 = v13;
  v28 = v12;
  v15 = extensionManagerQueue;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  v19 = v10;
  v20 = qos_class_self();
  if (v20 < 0x1A)
    v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
  v22 = v21;
  dispatch_async(v15, v21);

}

- (void)indexRequestsPerformJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *extensionManagerQueue;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  qos_class_t v20;
  dispatch_block_t v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  extensionManagerQueue = self->_extensionManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106___MDExtensionManager_indexRequestsPerformJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_1E24052D0;
  block[4] = self;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v15 = extensionManagerQueue;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = qos_class_self();
  if (v20 < 0x1A)
    v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
  v22 = v21;
  dispatch_async(v15, v21);

}

- (void)indexRequestsPerformDataJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *extensionManagerQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  qos_class_t v16;
  dispatch_block_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "fileType");

  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke;
  v19[3] = &unk_1E2402480;
  v19[4] = self;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v12 = extensionManagerQueue;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  v16 = qos_class_self();
  if (v16 < 0x1A)
    v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  else
    v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  v18 = v17;
  dispatch_async(v12, v17);

}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (void)setFileProviderBundleMap:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderBundleMap, a3);
}

- (void)setFileProviderBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, a3);
}

- (void)setIndexExtensionsByBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_indexExtensionsByBundleID, a3);
}

- (_MDExtensionLoader)extensionLoader
{
  return self->_extensionLoader;
}

- (void)setExtensionLoader:(id)a3
{
  objc_storeStrong((id *)&self->_extensionLoader, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSCondition)extensionsCondition
{
  return self->_extensionsCondition;
}

- (void)setExtensionsCondition:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsCondition, a3);
}

- (OS_dispatch_queue)extensionManagerQueue
{
  return self->_extensionManagerQueue;
}

- (void)setExtensionManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManagerQueue, a3);
}

- (int64_t)loaderCallbackCount
{
  return self->_loaderCallbackCount;
}

- (void)setLoaderCallbackCount:(int64_t)a3
{
  self->_loaderCallbackCount = a3;
}

- (CSFileProviderDomainMonitor)fileProviderMoniter
{
  return (CSFileProviderDomainMonitor *)objc_loadWeakRetained((id *)&self->_fileProviderMoniter);
}

- (void)setFileProviderMoniter:(id)a3
{
  objc_storeWeak((id *)&self->_fileProviderMoniter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileProviderMoniter);
  objc_storeStrong((id *)&self->_extensionManagerQueue, 0);
  objc_storeStrong((id *)&self->_extensionsCondition, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensionLoader, 0);
  objc_storeStrong((id *)&self->_indexExtensionsByBundleID, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleMap, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fileTypeNegativeCache, 0);
  objc_storeStrong((id *)&self->_fileTypeToExtensionMapping, 0);
}

- (void)extensionForFileType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "Skipping dyn type", v1, 2u);
}

- (void)extensionForFileType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "Found cached negative for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionForFileType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "Caching negative for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionForFileType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "Caching extension for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionForFileType:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "Returning cached extension for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performJob:extensions:perExtensionCompletionHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v1, (uint64_t)v1, "Performing job:%@ with %ld indexing extensions", v2);
  OUTLINED_FUNCTION_1();
}

@end
