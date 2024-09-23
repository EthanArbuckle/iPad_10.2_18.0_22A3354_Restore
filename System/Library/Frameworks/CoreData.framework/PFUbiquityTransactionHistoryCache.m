@implementation PFUbiquityTransactionHistoryCache

- (PFUbiquityTransactionHistoryCache)init
{
  PFUbiquityTransactionHistoryCache *v2;
  PFUbiquityTransactionHistoryCache *v3;
  NSRecursiveLock *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityTransactionHistoryCache;
  v2 = -[PFUbiquityTransactionHistoryCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_peerIDToHistoryArray = 0;
    v4 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v3->_globalIDToHistoryArray = 0;
    v3->_peerIDToHistoryArrayLock = v4;
    *(_OWORD *)&v3->_localPeerID = 0u;
    *(_OWORD *)&v3->_storeName = 0u;
    v3->_privatePSC = 0;
    v3->_entriesToWrite = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_cacheKV = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", &stru_1E1EE23F0);
    v3->_minCacheKV = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", &stru_1E1EE23F0);
    v3->_globalIDCache = 0;
    v3->_hasScheduledWriteBlock = 0;
  }
  return v3;
}

- (_QWORD)initWithLocalPeerID:(void *)a3 storeName:(void *)a4 privateStore:(void *)a5 andUbiquityRootLocation:
{
  _QWORD *v9;
  id v10;

  if (!a1)
    return 0;
  v9 = (_QWORD *)objc_msgSend(a1, "init");
  if (v9)
  {
    v9[1] = a2;
    v9[2] = a5;
    v9[3] = a3;
    v10 = (id)objc_msgSend(a4, "persistentStoreCoordinator");
    v9[4] = a4;
    v9[5] = v10;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_globalIDCache = 0;
  self->_peerIDToHistoryArray = 0;

  self->_peerIDToHistoryArrayLock = 0;
  self->_localPeerID = 0;

  self->_rootLocation = 0;
  self->_storeName = 0;

  self->_privateStore = 0;
  self->_privatePSC = 0;

  self->_globalIDToHistoryArray = 0;
  self->_entriesToWrite = 0;

  self->_cacheKV = 0;
  self->_minCacheKV = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionHistoryCache;
  -[PFUbiquityTransactionHistoryCache dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionHistoryCache;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tlocalPeerID: %@\n\tstoreName: %@\n\tcacheKV: %@\n\tminCacheKV: %@\n"), -[PFUbiquityTransactionHistoryCache description](&v3, sel_description), self->_localPeerID, self->_storeName, self->_cacheKV, self->_minCacheKV);
}

- (uint64_t)cacheTransactionHistory:(uint64_t)a1
{
  id v4;
  NSFetchRequest *v5;
  id *v6;
  int v7;
  char v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  char v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  char v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v33 = 0;
    return v33 & 1;
  }
  v39 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(*(id *)(a1 + 64), "lock");
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 1;
    v40 = 1;
    goto LABEL_27;
  }
  *(_QWORD *)(a1 + 48) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(a1 + 56) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(*(id *)(a1 + 72), "count") && !-[PFUbiquityTransactionHistoryCache writePendingEntries:](a1, &v39))
    goto LABEL_25;
  objc_opt_self();
  v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 8), *(void **)(a1 + 24), *(void **)(a1 + 16), &v39);
  if (!v9)
  {
    if (v39)
    {
      if (a2)
      {
        v5 = 0;
        v6 = 0;
        v8 = 0;
        *a2 = v39;
LABEL_26:
        v7 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        v44 = 1024;
        v45 = 135;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
LABEL_25:
    v5 = 0;
    v6 = 0;
    v8 = 0;
    goto LABEL_26;
  }
  v5 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", CFSTR("PFUbiquityTransactionEntry"));
  v10 = (void *)objc_msgSend(v9[1], "executeFetchRequest:error:", v5, &v39);
  v11 = v10;
  if (v10)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (!v12)
    {
      v7 = 1;
LABEL_22:
      v6 = v9;
      v8 = 1;
      goto LABEL_27;
    }
    v13 = *(_QWORD *)v36;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v13)
        objc_enumerationMutation(v11);
      if ((objc_msgSend((id)a1, "addTransactionEntry:error:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14), &v39) & 1) == 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        v7 = 1;
        if (v12)
          goto LABEL_10;
        goto LABEL_22;
      }
    }
  }
  v8 = 0;
  v7 = 1;
  v6 = v9;
LABEL_27:
  objc_msgSend(*(id *)(a1 + 64), "unlock");
  if (v39)
    v23 = v39;

  objc_msgSend(v4, "drain");
  if ((v8 & 1) == 0)
  {
    v24 = v39;
    if (v39)
    {
      if (a2)
        *a2 = v39;
    }
    else
    {
      v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v32 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        v44 = 1024;
        v45 = 178;
        _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v33 = v40;
  if (v7)
    v33 = v8;
  return v33 & 1;
}

- (BOOL)writePendingEntries:(uint64_t)a1
{
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PFUbiquityStoreMetadata *v12;
  uint64_t v13;
  uint64_t v14;
  PFUbiquityStoreMetadata *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id obj;
  uint64_t v59;
  id v60;
  _QWORD v61[9];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 1;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3052000000;
  v69 = __Block_byref_object_copy__69;
  v70 = __Block_byref_object_dispose__69;
  v71 = 0;
  objc_msgSend(*(id *)(a1 + 64), "lock");
  v3 = *(id *)(a1 + 72);

  obj = v3;
  *(_QWORD *)(a1 + 72) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_BYTE *)(a1 + 104) = 0;
  objc_msgSend(*(id *)(a1 + 64), "unlock");
  objc_opt_self();
  v4 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 8), *(void **)(a1 + 24), *(void **)(a1 + 16), v67 + 5);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v6)
    {
      v59 = *(_QWORD *)v63;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v63 != v59)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v7);
          if (v8)
            v9 = *(_QWORD *)(v8 + 32);
          else
            v9 = 0;
          v10 = (void *)objc_msgSend(v5, "objectForKey:", v9);
          if (!v10)
          {
            if (v8)
              v11 = *(void **)(v8 + 32);
            else
              v11 = 0;
            v10 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v11, v4[1]);
            if (!v10)
            {
              v12 = [PFUbiquityStoreMetadata alloc];
              if (v8)
              {
                v13 = *(_QWORD *)(v8 + 32);
                v14 = *(_QWORD *)(v8 + 48);
                if (v14 && *(_DWORD *)(v14 + 24) != 1)
                  v14 = *(_QWORD *)(v14 + 8);
              }
              else
              {
                v13 = 0;
                v14 = 0;
              }
              v15 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v12, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", v13, v14, v4[1]);
              v10 = v15;
              if (v8 && (v16 = *(_QWORD *)(v8 + 48)) != 0)
                v17 = *(_QWORD *)(v16 + 48);
              else
                v17 = 0;
              -[PFUbiquityStoreMetadata setModelVersionHashString:](v15, "setModelVersionHashString:", v17);

            }
            if (v8)
              v18 = *(_QWORD *)(v8 + 32);
            else
              v18 = 0;
            objc_msgSend(v5, "setObject:forKey:", v10, v18);
          }
          if (v8)
            v19 = *(_QWORD *)(v8 + 24);
          else
            v19 = 0;
          v20 = objc_msgSend(v60, "objectForKey:", v19);
          if (!v20)
          {
            if (v8)
              v21 = *(void **)(v8 + 24);
            else
              v21 = 0;
            v20 = +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v21, v4[1], 1);
            if (v8)
              v22 = *(_QWORD *)(v8 + 24);
            else
              v22 = 0;
            objc_msgSend(v60, "setObject:forKey:", v20, v22);
          }
          v23 = -[PFUbiquityTransactionEntry initAndInsertIntoManagedObjectContext:]([PFUbiquityTransactionEntry alloc], "initAndInsertIntoManagedObjectContext:", v4[1]);
          objc_msgSend(v23, "setActingPeer:", v20);
          objc_msgSend(v23, "setStoreMetadata:", v10);
          if (v8)
            v24 = *(_QWORD **)(v8 + 8);
          else
            v24 = 0;
          v25 = -[PFUbiquityGlobalObjectID createGlobalIDString](v24);
          objc_msgSend(v23, "setGlobalIDStr:", v25);

          if (v8)
            v26 = *(unsigned int *)(v8 + 16);
          else
            v26 = 0;
          -[PFUbiquityTransactionEntry setTransactionType:](v23, v26);
          if (v8 && (v27 = *(_QWORD *)(v8 + 48)) != 0)
            v28 = *(_QWORD *)(v27 + 56);
          else
            v28 = 0;
          objc_msgSend(v23, "setTransactionLogFilename:", v28);
          objc_msgSend(v23, "setTransactionDate:", objc_msgSend((id)v8, "transactionDate"));
          objc_msgSend(v23, "setTransactionNumber:", objc_msgSend((id)v8, "transactionNumber"));
          if (v8 && (v29 = *(_QWORD *)(v8 + 8)) != 0)
            v30 = *(void **)(v29 + 48);
          else
            v30 = 0;
          objc_msgSend(v23, "setLocalIDStr:", objc_msgSend((id)objc_msgSend(v30, "URIRepresentation"), "absoluteString"));
          if (v8)
            v31 = *(_QWORD *)(v8 + 56);
          else
            v31 = 0;
          v32 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v31);
          objc_msgSend(v23, "setKnowledgeVectorString:", v32);

          ++v7;
        }
        while (v6 != v7);
        v33 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
        v6 = v33;
      }
      while (v33);
    }
    v34 = (id)objc_msgSend(v4[1], "persistentStoreCoordinator");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __57__PFUbiquityTransactionHistoryCache_writePendingEntries___block_invoke;
    v61[3] = &unk_1E1EDE810;
    v61[8] = &v66;
    v61[4] = v34;
    v61[5] = v4;
    v61[7] = &v72;
    v61[6] = a1;
    objc_msgSend(v34, "performBlockAndWait:", v61);
    v35 = (id)v67[5];

    goto LABEL_68;
  }
  *((_BYTE *)v73 + 24) = 0;
  v36 = v67[5];
  if (!v36)
  {
    v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
    v44 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m";
      v79 = 1024;
      v80 = 319;
      _os_log_fault_impl(&dword_18A253000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_67;
  }
  if (!a2)
  {
LABEL_67:
    v5 = 0;
    v60 = 0;
    v4 = 0;
    goto LABEL_68;
  }
  v5 = 0;
  v60 = 0;
  v4 = 0;
  *a2 = v36;
LABEL_68:

  if (!*((_BYTE *)v73 + 24))
  {
    v47 = v67[5];
    if (v47)
    {
      if (a2)
        *a2 = v47;
    }
    else
    {
      v48 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v55 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        v79 = 1024;
        v80 = 405;
        _os_log_fault_impl(&dword_18A253000, v55, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  if (!*((_BYTE *)v73 + 24))
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");
    objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", obj);
    objc_msgSend(*(id *)(a1 + 64), "unlock");
  }

  v45 = *((_BYTE *)v73 + 24) != 0;
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  return v45;
}

- (BOOL)addTransactionEntry:(id)a3 error:(id *)a4
{
  PFUbiquityTransactionEntryLight *v5;

  v5 = -[PFUbiquityTransactionEntryLight initWithTransactionEntry:ubiquityRootLocation:andGlobalIDCache:]([PFUbiquityTransactionEntryLight alloc], "initWithTransactionEntry:ubiquityRootLocation:andGlobalIDCache:", a3, self->_rootLocation, self->_globalIDCache);
  LOBYTE(self) = -[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:]((uint64_t)self, v5, 0);

  return (char)self;
}

- (BOOL)addTransactionEntryLight:(uint64_t)a1 needsWrite:(_QWORD *)a2 error:(int)a3
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSTemporaryObjectID *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");
    if (a2)
      v6 = a2[1];
    else
      v6 = 0;
    v7 = (id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v6);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v8 = a2[1];
      else
        v8 = 0;
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v7, v8);
    }
    objc_msgSend(v7, "addObject:", a2);
    if (a2)
      v9 = (const __CFString *)a2[3];
    else
      v9 = 0;
    if (v9)
      v10 = v9;
    else
      v10 = CFSTR("baseline");
    v11 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v10);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:");
    }
    v12 = objc_msgSend((id)objc_msgSend(a2, "transactionNumber"), "unsignedIntegerValue");
    if (v12 >= objc_msgSend(v11, "count"))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v11, "addObject:", v13);
    }
    else
    {
      v13 = (id)objc_msgSend(v11, "objectAtIndex:", objc_msgSend((id)objc_msgSend(a2, "transactionNumber"), "unsignedIntegerValue"));
    }
    if (a2)
      v14 = a2[1];
    else
      v14 = 0;
    objc_msgSend(v13, "setObject:forKey:", a2, v14);
    if (a2)
      v15 = a2[7];
    else
      v15 = 0;
    -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:](*(_QWORD *)(a1 + 80), v15);
    if (a2)
      v16 = a2[7];
    else
      v16 = 0;
    -[PFUbiquityKnowledgeVector decrementToMinimumWithKnowledgeVector:](*(_QWORD *)(a1 + 88), v16);
    if (a2)
    {
      v18 = a2[1];
      if (v18)
      {
        v19 = *(void **)(v18 + 48);
        if (v19)
        {
          if (objc_msgSend(v19, "persistentStore") != *(_QWORD *)(a1 + 32))
          {
            v20 = a2[1];
            v21 = v20 ? *(void **)(v20 + 48) : 0;
            v17 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](*(void **)(a1 + 40), (CFURLRef)objc_msgSend(v21, "URIRepresentation"), 0);
            v23 = (void *)a2[1];
            if (v23)
              objc_setProperty_nonatomic(v23, v22, v17, 48);
          }
        }
      }
    }
    if (a3)
      objc_msgSend(*(id *)(a1 + 72), "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 64), "unlock", v17);

  }
  return a1 != 0;
}

- (uint64_t)addTransactionEntryLights:(uint64_t)a1 error:(void *)a2
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "lock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(a2);
        if (!-[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:](a1, *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * i), 1))
        {
          v7 = 0;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 64), "unlock");
  if ((v7 & 1) == 0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
    v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m";
      v23 = 1024;
      v24 = 284;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v7;
}

id __57__PFUbiquityTransactionHistoryCache_writePendingEntries___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStores"), "count"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      v3 = *(void **)(v2 + 8);
    else
      v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "save:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (v4)
        v5 = *(void **)(v4 + 8);
      else
        v5 = 0;
      objc_msgSend(v5, "reset");
      -[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](*(_QWORD *)(a1 + 48), 0);
      -[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:](*(_QWORD *)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
}

- (BOOL)purgeCacheAndWritePendingEntries:(uint64_t)a1 error:(int)a2
{
  void *v4;
  _BOOL4 v5;
  id v6;
  _QWORD v8[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");

    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 48) = 0;

    *(_QWORD *)(a1 + 80) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", &stru_1E1EE23F0);
    *(_QWORD *)(a1 + 88) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", &stru_1E1EE23F0);
    v4 = *(void **)(a1 + 72);
    if (a2)
    {
      if (objc_msgSend(v4, "count"))
        v5 = *(_BYTE *)(a1 + 104) == 0;
      else
        v5 = 0;
    }
    else
    {

      v5 = 0;
      *(_QWORD *)(a1 + 72) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    objc_msgSend(*(id *)(a1 + 64), "unlock");
    if (v5)
    {
      objc_opt_self();
      v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 8));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __76__PFUbiquityTransactionHistoryCache_purgeCacheAndWritePendingEntries_error___block_invoke;
      v8[3] = &unk_1E1EDD520;
      v8[4] = a1;
      -[PFUbiquitySwitchboardEntry executeBlockOnPrivateQueue:]((uint64_t)v6, (uint64_t)v8);
    }
    else
    {
      v6 = 0;
    }

  }
  return a1 != 0;
}

void __76__PFUbiquityTransactionHistoryCache_purgeCacheAndWritePendingEntries_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = 0;
  if (!-[PFUbiquityTransactionHistoryCache writePendingEntries:](*(_QWORD *)(a1 + 32), &v2))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError while writing pending transaction history entries to disk: %@\nuserInfo: %@"), "-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:]_block_invoke", 460, *(_QWORD *)(a1 + 32), v2, objc_msgSend(v2, "userInfo"));
  }
}

- (uint64_t)cachedTransactionHistoryForGlobalID:(uint64_t)a1
{
  uint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "lock");
  v4 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", a2);
  objc_msgSend(*(id *)(a1 + 64), "unlock");
  return v4;
}

@end
