@implementation PFUbiquityBaselineRollOperation

- (PFUbiquityBaselineRollOperation)init
{
  PFUbiquityBaselineRollOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  result = -[PFUbiquityImportOperation init](&v3, sel_init);
  if (result)
    result->_heuristics = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_heuristics = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  -[PFUbiquityBaselineOperation dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  -[PFUbiquityImportOperation setDelegate:](&v3, sel_setDelegate_, a3);
}

- (PFUbiquityBaselineRollOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  return (PFUbiquityBaselineRollOperationDelegate *)-[PFUbiquityImportOperation delegate](&v3, sel_delegate);
}

- (id)retainedDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  return -[PFUbiquityImportOperation retainedDelegate](&v3, sel_retainedDelegate);
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  int v6;
  NSString *storeName;
  uint64_t v8;
  PFUbiquityLocation *ubiquityRootLocation;
  uint64_t v10;
  NSManagedObjectModel *model;
  uint64_t v12;
  NSPersistentStore *store;
  uint64_t v14;
  char v15;
  objc_super v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PFUbiquityBaselineRollOperation;
    LOBYTE(v6) = -[PFUbiquityBaselineRollOperation isEqual:](&v17, sel_isEqual_, a3);
    return v6;
  }
  if (a3)
  {
    v5 = (void *)*((_QWORD *)a3 + 31);
    if (self)
    {
LABEL_4:
      v6 = objc_msgSend(v5, "isEqualToString:", self->super.super._localPeerID);
      if (!v6)
        return v6;
      storeName = self->super.super._storeName;
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
    if (self)
      goto LABEL_4;
  }
  v15 = objc_msgSend(v5, "isEqualToString:", 0);
  storeName = 0;
  if ((v15 & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
LABEL_6:
  if (a3)
    v8 = *((_QWORD *)a3 + 32);
  else
    v8 = 0;
  v6 = -[NSString isEqual:](storeName, "isEqual:", v8);
  if (v6)
  {
    if (self)
    {
      ubiquityRootLocation = self->super.super._ubiquityRootLocation;
      if (a3)
      {
LABEL_11:
        v10 = *((_QWORD *)a3 + 34);
        goto LABEL_12;
      }
    }
    else
    {
      ubiquityRootLocation = 0;
      if (a3)
        goto LABEL_11;
    }
    v10 = 0;
LABEL_12:
    v6 = -[PFUbiquityLocation isEqual:](ubiquityRootLocation, "isEqual:", v10);
    if (!v6)
      return v6;
    if (self)
    {
      model = self->super._model;
      if (a3)
      {
LABEL_15:
        v12 = *((_QWORD *)a3 + 39);
        goto LABEL_16;
      }
    }
    else
    {
      model = 0;
      if (a3)
        goto LABEL_15;
    }
    v12 = 0;
LABEL_16:
    v6 = -[NSManagedObjectModel isEqual:](model, "isEqual:", v12);
    if (!v6)
      return v6;
    if (self)
    {
      store = self->super.super._store;
      if (a3)
      {
LABEL_19:
        v14 = *((_QWORD *)a3 + 33);
LABEL_20:
        LOBYTE(v6) = -[NSPersistentStore isEqual:](store, "isEqual:", v14);
        return v6;
      }
    }
    else
    {
      store = 0;
      if (a3)
        goto LABEL_19;
    }
    v14 = 0;
    goto LABEL_20;
  }
  return v6;
}

- (uint64_t)rollBaselineWithError:(uint64_t)a1
{
  char v4;
  void *v5;
  PFUbiquityBaseline *v6;
  _BOOL4 v7;
  PFUbiquityBaselineMetadata *v8;
  PFUbiquityBaselineMetadata *v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PFUbiquityTransactionLog *v19;
  id *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  id *p_isa;
  const char *v25;
  PFUbiquityBaselineMetadata *metadata;
  PFUbiquityKnowledgeVector *kv;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v38;
  _QWORD *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  BOOL v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v4 = 0;
    return v4 & 1;
  }
  v54 = 0;
  if ((objc_msgSend((id)a1, "isCancelled") & 1) != 0)
  {
    v4 = 1;
    return v4 & 1;
  }
  v39 = a2;
  if (!-[PFUbiquityBaselineHeuristics canRollBaseline:](*(uint64_t **)(a1 + 320), &v54))
  {
    obj = 0;
    v6 = 0;
    v7 = v54 == 0;
    goto LABEL_10;
  }
  if (!v54)
    goto LABEL_50;
  if (objc_msgSend(v54, "code") == 134325)
  {
    v5 = (void *)objc_msgSend(v54, "domain");
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      obj = (id)objc_msgSend((id)objc_msgSend(v54, "userInfo"), "objectForKey:", CFSTR("offendingPeers"));
      v54 = 0;
      goto LABEL_51;
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot an unknown error back from canRollBaseline: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 164, a1, v54);
    obj = 0;
  }
  else
  {
LABEL_50:
    obj = 0;
  }
LABEL_51:
  v6 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 312));
  v7 = -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]((_BOOL8)v6, *(void **)(a1 + 264), *(_QWORD *)(a1 + 248), &v54);
  v23 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 304), *(void **)(a1 + 272));
  if (v6)
    p_isa = (id *)&v6->_metadata->super.isa;
  else
    p_isa = 0;
  -[PFUbiquityBaselineMetadata setPreviousKnowledgeVectorFromCurrentMetadata:](p_isa, v23);
  if ((objc_msgSend((id)a1, "isCancelled") & 1) == 0)
  {
    if (!v7)
      goto LABEL_67;
    v7 = 1;
    if (!-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]((uint64_t)v6, &v54))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ Error encountered trying to roll baseline: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 212, a1, *(_QWORD *)(a1 + 320), v54, objc_msgSend(v54, "userInfo"));
      goto LABEL_11;
    }
    if (!-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v6, 0, 1, &v54))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ encountered an error trying to write the baseline archive to disk: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 209, a1, v54, objc_msgSend(v54, "userInfo"));
      goto LABEL_11;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ successfully rolled baseline: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 184, a1, v6);
    if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v6, &v54))
    {
      if (v6 && (metadata = v6->_metadata) != 0)
        kv = metadata->_kv;
      else
        kv = 0;
      v28 = *(void **)(a1 + 320);
      if (v28)
        objc_setProperty_nonatomic(v28, v25, kv, 80);
      v7 = -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v6, objc_msgSend(*(id *)(a1 + 264), "identifier", kv));
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ successfully rolled baseline but encountered an error trying to make it the current baseline: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 191, a1, v54, objc_msgSend(v54, "userInfo"));
    }
    if ((objc_msgSend((id)a1, "isCancelled") & 1) == 0)
    {
      if (v6)
        v38 = (uint64_t)v6->_metadata;
      else
        v38 = 0;
      +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, v38, *(void **)(a1 + 248), *(void **)(a1 + 272));
      if (-[PFUbiquityBaseline removeUnusedExternalDataReferences:]((uint64_t)v6, &v54))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRemoved unused external data references"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 202, a1);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing unused external data references: %@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 204, a1, v54);
      }
    }
LABEL_10:
    if (v7)
    {
LABEL_11:
      if (objc_msgSend(obj, "count"))
      {
        if (v6)
        {
          v8 = v6->_metadata;
          if (v8)
            v8 = (PFUbiquityBaselineMetadata *)v8->_kv;
        }
        else
        {
          v8 = 0;
        }
        v9 = v8;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v10)
        {
          p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
          v41 = *(_QWORD *)v51;
          do
          {
            v12 = 0;
            v42 = v10;
            do
            {
              if (*(_QWORD *)v51 != v41)
                objc_enumerationMutation(obj);
              v44 = v12;
              v45 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v12);
              v43 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_superclass + 314), v45, *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 304), *(void **)(a1 + 272));
              v13 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)(p_superclass + 314), (uint64_t)v43, (uint64_t)&v54);
              v14 = v13;
              if (v13)
              {
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                if (v15)
                {
                  v16 = *(_QWORD *)v47;
                  do
                  {
                    v17 = 0;
                    do
                    {
                      if (*(_QWORD *)v47 != v16)
                        objc_enumerationMutation(v14);
                      v18 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v17);
                      if (v18
                        && *(_DWORD *)(v18 + 24) == 22
                        && -[PFUbiquityLocation fileAtLocationIsDownloaded:](*(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v17), (uint64_t)&v54))
                      {
                        v19 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v18, *(_QWORD *)(a1 + 248));
                        if (-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v19, &v54))
                        {
                          v20 = v19 ? (id *)v19->_knowledgeVector : 0;
                          if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v20, (uint64_t)v9)
                            && !-[PFUbiquityLocation removeFileAtLocation:error:](v18, *(_QWORD *)(a1 + 248), &v54)
                            && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                          {
                            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to delete transaction log for peer: %@\n%@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 239, v45, v54);
                          }
                        }

                      }
                      ++v17;
                    }
                    while (v15 != v17);
                    v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                    v15 = v21;
                  }
                  while (v21);
                }
              }
              else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to remove logs from peer: %@\n%@"), "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 253, a1, v45, v54);
              }

              v12 = v44 + 1;
              p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
            }
            while (v44 + 1 != v42);
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          }
          while (v10);
        }

      }
      LOBYTE(v7) = 1;
      v22 = 1;
      goto LABEL_68;
    }
LABEL_67:
    v22 = 1;
    goto LABEL_68;
  }
  v22 = 0;
  v55 = v7;
LABEL_68:

  if (!v7)
  {
    if (v54)
    {
      if (v39)
        *v39 = v54;
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollOperation.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollOperation.m";
        v58 = 1024;
        v59 = 266;
        _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v4 = v55;
  if (v22)
    v4 = v7;
  return v4 & 1;
}

- (void)main
{
  NSPersistentStoreCoordinator *v3;
  _QWORD *v4;
  NSPersistentStore *store;
  NSString *storeName;
  NSString *localPeerID;
  void *v8;
  _QWORD *v9;
  PFUbiquityBaselineHeuristics *v10;
  PFUbiquityBaseline *v11;
  char v12;
  int v13;
  uint64_t v14;
  PFUbiquityBaselineMetadata *metadata;
  void *v16;
  PFUbiquityKnowledgeVector *kv;
  char v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  char v24;

  v22 = 0;
  if ((-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if ((-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v3 = 0;
      v4 = 0;
LABEL_11:
      v8 = 0;
LABEL_21:

      return;
    }
    if (self)
      store = self->super.super._store;
    else
      store = 0;
    v3 = -[NSPersistentStore persistentStoreCoordinator](store, "persistentStoreCoordinator");
    if (!v3)
    {
      -[PFUbiquityImportOperation cancel](self, "cancel");
      v4 = 0;
      v8 = 0;
      goto LABEL_21;
    }
    objc_opt_self();
    if (self)
    {
      storeName = self->super.super._storeName;
      localPeerID = self->super.super._localPeerID;
    }
    else
    {
      storeName = 0;
      localPeerID = 0;
    }
    v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
    if (!v4)
      goto LABEL_20;
    if ((-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_11;
    v9 = (_QWORD *)v4[11];
    if (v9)
      v9 = (_QWORD *)v9[15];
    v10 = v9;
    self->_heuristics = v10;
    if (!v10)
    {
LABEL_20:
      -[PFUbiquityImportOperation cancel](self, "cancel");
      v8 = 0;
      goto LABEL_21;
    }
    -[PFUbiquityBaselineHeuristics updateHeuristics]((uint64_t *)v10);
    v23 = 0;
    v11 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", self->super.super._localPeerID, self->super.super._ubiquityRootLocation, self->super.super._storeName, self->super._model);
    if (-[PFUbiquitySafeSaveFile existsInCloud](v11))
    {
      if (-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled"))
      {
LABEL_19:
        v12 = 0;
        v24 = 0;
        v13 = 1;
        goto LABEL_44;
      }
      if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v11, 0, (uint64_t *)&v23))
      {
        if (v11
          && -[PFUbiquityBaseline loadFileFromLocation:error:](v11, "loadFileFromLocation:error:", v11->super._currentLocation, &v23))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully initialized baseline: %@"), "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 98, v11);
          if (-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled"))
            goto LABEL_19;
          v14 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, self->super.super._ubiquityRootLocation);
          if (v14)
          {
            metadata = v11->_metadata;
            v16 = *(void **)(v14 + 48);
            if (metadata)
              kv = metadata->_kv;
            else
              kv = 0;
            v12 = objc_msgSend(v16, "isEqual:", kv);
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil metadata for current baseline in operation: %@"), "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 117, self);
            }
            v12 = 0;
          }
          v13 = 0;
LABEL_44:

          if (v13)
            v18 = v24;
          else
            v18 = v12;
          if ((v18 & 1) != 0)
          {
            if ((-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled") & 1) == 0)
            {
              if (-[PFUbiquityBaselineRollOperation rollBaselineWithError:]((uint64_t)self, &v22))
              {
                v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.baseline.roll"), self->super.super._store, 0);
                objc_msgSend(v19, "postNotification:", v20);

              }
            }
          }
          else if ((-[PFUbiquityBaselineRollOperation isCancelled](self, "isCancelled") & 1) == 0)
          {
            v21 = -[PFUbiquityBaselineRollOperation retainedDelegate](self, "retainedDelegate");
            v8 = v21;
            if (v21)
              objc_msgSend(v21, "baselineRollOperationEncounteredAnInconsistentBaselineState:", self);
            goto LABEL_21;
          }
          goto LABEL_11;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error attempting to initialize baseline: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 100, v11, v23, objc_msgSend(v23, "userInfo"));
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't download latest version: %@"), "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 103, v23);
      }
    }
    v13 = 0;
    v12 = 1;
    goto LABEL_44;
  }
}

@end
