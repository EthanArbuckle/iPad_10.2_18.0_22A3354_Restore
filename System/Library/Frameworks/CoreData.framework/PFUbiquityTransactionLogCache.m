@implementation PFUbiquityTransactionLogCache

- (PFUbiquityTransactionLogCache)init
{
  PFUbiquityTransactionLogCache *v2;
  PFUbiquityTransactionLogCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityTransactionLogCache;
  v2 = -[PFUbiquityTransactionLogCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_localPeerID = 0;
    v2->_transactionLogCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_transactionLogCacheLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v3->_gidCache = 0;
  }
  return v3;
}

- (PFUbiquityTransactionLogCache)initWithLocalPeerID:(id)a3 andGlobalIDCache:(id)a4
{
  PFUbiquityTransactionLogCache *v6;

  v6 = -[PFUbiquityTransactionLogCache init](self, "init");
  if (v6)
  {
    v6->_localPeerID = (NSString *)a3;
    v6->_gidCache = (PFUbiquityGlobalObjectIDCache *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  self->_transactionLogCache = 0;

  self->_transactionLogCacheLock = 0;
  self->_gidCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLogCache;
  -[PFUbiquityTransactionLogCache dealloc](&v3, sel_dealloc);
}

- (PFUbiquityTransactionLog)retainedCachedLogForLocation:(BOOL)a3 loadWithRetry:(_QWORD *)a4 error:
{
  id v8;
  PFUbiquityTransactionLog *v9;
  PFUbiquityTransactionLog *v10;
  PFUbiquitySaveSnapshot *saveSnapshot;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29 = 0;
  objc_msgSend(*(id *)(a1 + 24), "lock");
  v8 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
  objc_msgSend(*(id *)(a1 + 24), "unlock");
  if (!v8)
  {
    if (!-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a2, *(_QWORD *)(a1 + 8), &v29))
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = (void *)MEMORY[0x1E0C99D80];
      if (!a2)
        a2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = objc_msgSend(v17, "dictionaryWithObject:forKey:", a2, CFSTR("logLocation"));
      v19 = (id)objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v18);
      v29 = v19;
      if (!v19)
        goto LABEL_22;
      goto LABEL_16;
    }
    v9 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", a2, *(_QWORD *)(a1 + 8));
    v10 = v9;
    if (!v9)
    {
LABEL_21:
      v19 = v29;
      if (!v29)
      {
LABEL_22:
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLogCache.m");
        v27 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiqui"
                "tyTransactionLogCache.m";
          v32 = 1024;
          v33 = 105;
          _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        return 0;
      }
LABEL_16:
      if (a4)
        *a4 = v19;
      return 0;
    }
    if (!v9->_transactionLogType)
      return v10;
    saveSnapshot = v9->_saveSnapshot;
    transactionLogLocation = v9->_transactionLogLocation;
    if (transactionLogLocation)
    {
      storeName = transactionLogLocation->_storeName;
      if (saveSnapshot)
        goto LABEL_8;
    }
    else
    {
      storeName = 0;
      if (saveSnapshot)
      {
LABEL_8:
        v14 = (void *)-[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", storeName);
        if (v14)
          objc_setProperty_nonatomic(v14, v15, *(id *)(a1 + 32), 168);
      }
    }
    v10->_loadUsingRetry = a3;
    if (-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v10, &v29))
    {
      -[PFUbiquityTransactionLog releaseContents:]((uint64_t)v10);
      objc_msgSend(*(id *)(a1 + 24), "lock");
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v10, a2);
      objc_msgSend(*(id *)(a1 + 24), "unlock");
      return v10;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Error loading transaction log: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:]", 90, a1, v10, v29, objc_msgSend(v29, "userInfo"));

    goto LABEL_21;
  }
  return (PFUbiquityTransactionLog *)v8;
}

- (uint64_t)cacheExportedLog:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 24), "lock");
    if (a2)
      v4 = *(_QWORD *)(a2 + 24);
    else
      v4 = 0;
    objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v4);
    if (a2)
      v5 = *(_QWORD *)(a2 + 32);
    else
      v5 = 0;
    objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v5);
    if (a2)
      v6 = *(_QWORD *)(a2 + 24);
    else
      v6 = 0;
    objc_msgSend(*(id *)(v3 + 16), "setObject:forKey:", a2, v6);
    if (a2)
      v7 = *(_QWORD *)(a2 + 32);
    else
      v7 = 0;
    objc_msgSend(*(id *)(v3 + 16), "setObject:forKey:", a2, v7);
    return objc_msgSend(*(id *)(v3 + 24), "unlock");
  }
  return result;
}

- (uint64_t)removeLogsCachedForStoreNamed:(uint64_t)a3 withUbiquityRootLocation:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 24), "lock");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(v5 + 16), "allKeys", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          if (v10)
          {
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
            if (*(_DWORD *)(v10 + 24) != 1)
              v11 = *(void **)(v10 + 8);
          }
          else
          {
            v11 = 0;
          }
          if (objc_msgSend(v11, "isEqual:", a3))
          {
            if (v10)
              v12 = *(void **)(v10 + 40);
            else
              v12 = 0;
            if (objc_msgSend(v12, "isEqualToString:", a2))
              objc_msgSend(*(id *)(v5 + 16), "removeObjectForKey:", v10);
          }
          ++v9;
        }
        while (v7 != v9);
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v7 = v13;
      }
      while (v13);
    }
    return objc_msgSend(*(id *)(v5 + 24), "unlock");
  }
  return result;
}

@end
