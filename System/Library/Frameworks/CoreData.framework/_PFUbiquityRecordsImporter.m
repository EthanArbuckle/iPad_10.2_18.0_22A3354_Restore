@implementation _PFUbiquityRecordsImporter

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    _ubiquityRootQueue = (uint64_t)dispatch_queue_create("com.apple.coredata.ubiquity.monitorqueue.root", 0);
    _registeredCoords = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
}

- (_PFUbiquityRecordsImporter)init
{
  return 0;
}

- (_PFUbiquityRecordsImporter)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4
{
  _PFUbiquityRecordsImporter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordsImporter;
  v6 = -[_PFUbiquityRecordsImporter init](&v8, sel_init);
  if (v6)
  {
    v6->_localPeerID = (NSString *)objc_msgSend(a3, "copy");
    v6->_importQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_importQueue, "setMaxConcurrentOperationCount:", 1);
    v6->_privateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.importer.privateQueue", 0);
    v6->_isMonitoring = 0;
    v6->_ubiquityRootLocation = (PFUbiquityLocation *)a4;
    v6->_logRestartTimer = 0;
    v6->_schedulingLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    *(_WORD *)&v6->_importOnlyActiveStores = 1;
    v6->_numPendingNotifications = 0;
    v6->_allowBaselineRoll = 0;
    v6->_schedulingContext = objc_alloc_init(PFUbiquityRecordsImporterSchedulingContext);
    v6->_sideLoadCacheWrapper = 0;
  }
  return v6;
}

- (_QWORD)initWithLocalPeerID:(uint64_t)a3 ubiquityRootLocation:(void *)a4 storeName:(void *)a5 andPrivateStore:
{
  _QWORD *v7;
  id v8;

  if (!a1)
    return 0;
  v7 = (_QWORD *)objc_msgSend(a1, "initWithLocalPeerID:andUbiquityRootLocation:", a2, a3);
  if (v7)
  {
    v7[6] = a4;
    v7[9] = a5;
    v8 = (id)objc_msgSend(a5, "persistentStoreCoordinator");
    v7[8] = v8;
    v7[7] = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)objc_msgSend(v8, "managedObjectModel"));
  }
  return v7;
}

- (void)dealloc
{
  NSObject *logRestartTimer;
  objc_super v4;

  -[_PFUbiquityRecordsImporter tearDown]((uint64_t)self);

  self->_ubiquityRootLocation = 0;
  -[NSOperationQueue cancelAllOperations](self->_importQueue, "cancelAllOperations");
  -[NSOperationQueue setSuspended:](self->_importQueue, "setSuspended:", 0);
  dispatch_release((dispatch_object_t)self->_privateQueue);
  self->_privateQueue = 0;

  self->_importQueue = 0;
  self->_localPeerID = 0;

  self->_schedulingLock = 0;
  logRestartTimer = self->_logRestartTimer;
  if (logRestartTimer)
  {
    dispatch_source_cancel(logRestartTimer);
    self->_logRestartTimer = 0;
  }
  self->_privateStore = 0;

  self->_privatePSC = 0;
  self->_storeName = 0;

  self->_modelVersionHash = 0;
  self->_schedulingContext = 0;

  self->_sideLoadCacheWrapper = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordsImporter;
  -[_PFUbiquityRecordsImporter dealloc](&v4, sel_dealloc);
}

- (uint64_t)tearDown
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 24))
    {
      *(_BYTE *)(result + 24) = 0;
      *(_BYTE *)(result + 128) = 0;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", result);
      objc_msgSend(*(id *)(v1 + 8), "setSuspended:", 1);
      return objc_msgSend(*(id *)(v1 + 8), "cancelAllOperations");
    }
  }
  return result;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  PFUbiquityLocation *ubiquityRootLocation;
  NSString *localPeerID;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordsImporter;
  v4 = -[_PFUbiquityRecordsImporter description](&v8, sel_description);
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootLocation = self->_ubiquityRootLocation;
  }
  else
  {
    ubiquityRootLocation = 0;
    localPeerID = 0;
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n\tubiquityRootLocation: %@\n\tlocalPeerID: %@\n"), v4, ubiquityRootLocation, localPeerID);
}

- (id)createSortedOperationsArrayWithMetadata:(id)a3 isFirstImport:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PFUbiquityRecordsImporterSchedulingContext *schedulingContext;
  NSMutableSet *pendingLogLocations;
  PFUbiquitySwitchboardCacheWrapper *sideLoadCacheWrapper;
  PFUbiquitySwitchboardCacheWrapper *Property;
  const char *v12;
  NSPersistentStoreCoordinator *privatePSC;
  PFUbiquityKnowledgeVector *v14;
  uint64_t v15;
  void *transactionLogCache;
  PFUbiquityTransactionLogCache *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  PFUbiquityTransactionLog *v23;
  PFUbiquityTransactionLog *v24;
  PFUbiquityLocation *transactionLogLocation;
  NSString *exportingPeerID;
  uint64_t v27;
  void *v28;
  NSString *storeName;
  PFUbiquitySaveSnapshot *saveSnapshot;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  uint64_t v35;
  NSOperationQueue *importQueue;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSOperationQueue *v40;
  NSEnumerator *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char v52;
  uint64_t v53;
  unsigned __int8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  PFUbiquitySwitchboardCacheWrapper *v68;
  id *v69;
  void *v70;
  id obj;
  id v72;
  uint64_t v73;
  _PFUbiquityRecordsImporter *v74;
  uint64_t v75;
  PFUbiquityTransactionLogCache *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[6];
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  uint64_t v102;
  uint64_t v103;

  v4 = a4;
  v103 = *MEMORY[0x1E0C80C00];
  v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(0, "count"));
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(0, "count"));
  v90 = 0;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  schedulingContext = self->_schedulingContext;
  if (schedulingContext)
    pendingLogLocations = schedulingContext->_pendingLogLocations;
  else
    pendingLogLocations = 0;
  obj = (id)objc_msgSend(v7, "initWithSet:copyItems:", pendingLogLocations, 0);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Log locations: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 199, obj);
  sideLoadCacheWrapper = self->_sideLoadCacheWrapper;
  if (!sideLoadCacheWrapper)
  {
    if (a3)
      sideLoadCacheWrapper = (PFUbiquitySwitchboardCacheWrapper *)*((_QWORD *)a3 + 11);
    else
      sideLoadCacheWrapper = 0;
  }
  Property = sideLoadCacheWrapper;
  v68 = Property;
  if (Property)
    Property = (PFUbiquitySwitchboardCacheWrapper *)objc_getProperty(Property, v12, 64, 1);
  v69 = Property;
  if (!v69)
  {
    v97 = 0;
    v98 = &v97;
    v99 = 0x3052000000;
    v100 = __Block_byref_object_copy__38;
    v101 = __Block_byref_object_dispose__38;
    v102 = 0;
    privatePSC = self->_privatePSC;
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __84___PFUbiquityRecordsImporter_createSortedOperationsArrayWithMetadata_isFirstImport___block_invoke;
    v89[3] = &unk_1E1EDD618;
    v89[4] = self;
    v89[5] = &v97;
    -[NSPersistentStoreCoordinator performBlockAndWait:](privatePSC, "performBlockAndWait:", v89);
    v14 = [PFUbiquityKnowledgeVector alloc];
    v15 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v14, "initWithStoreKnowledgeVectorDictionary:", v98[5]);

    v69 = (id *)v15;
    _Block_object_dispose(&v97, 8);
  }
  transactionLogCache = v68;
  if (v68)
    transactionLogCache = v68->_transactionLogCache;
  v17 = transactionLogCache;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  if (!v18)
  {
    v76 = v17;
    goto LABEL_76;
  }
  v19 = *(_QWORD *)v86;
  v78 = *MEMORY[0x1E0CB28A8];
  v76 = v17;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v86 != v19)
        objc_enumerationMutation(obj);
      v21 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v20);
      if (!v21 || !*(_QWORD *)(v21 + 40))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping (storeName): %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 226, v21);
        goto LABEL_68;
      }
      if ((objc_msgSend(*(id *)(v21 + 48), "isEqualToString:", self->_modelVersionHash) & 1) == 0)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping (model version hash): %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 231, v21);
        goto LABEL_68;
      }
      if (v76)
      {
        if (v4)
          goto LABEL_24;
      }
      else
      {
        v76 = -[PFUbiquityTransactionLogCache initWithLocalPeerID:andGlobalIDCache:]([PFUbiquityTransactionLogCache alloc], "initWithLocalPeerID:andGlobalIDCache:", self->_localPeerID, 0);
        if (v4)
        {
LABEL_24:
          v22 = objc_msgSend(*(id *)(v21 + 32), "isEqualToString:", self->_localPeerID);
          goto LABEL_31;
        }
      }
      v22 = 0;
LABEL_31:
      v23 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:]((uint64_t)v76, v21, v22, &v90);
      v24 = v23;
      if (v23)
      {
        if (!v23->_transactionLogType)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSkipping log because it is of unknown type: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 261, self, v21);
          goto LABEL_61;
        }
        transactionLogLocation = v23->_transactionLogLocation;
        if (transactionLogLocation)
          exportingPeerID = transactionLogLocation->_exportingPeerID;
        else
          exportingPeerID = 0;
        if (v69)
        {
          v27 = objc_msgSend(v69[1], "objectForKey:", exportingPeerID);
          transactionLogLocation = v24->_transactionLogLocation;
        }
        else
        {
          v27 = 0;
        }
        if (v27)
          v28 = (void *)v27;
        else
          v28 = &unk_1E1F4B720;
        if (transactionLogLocation)
          storeName = transactionLogLocation->_storeName;
        else
          storeName = 0;
        saveSnapshot = v24->_saveSnapshot;
        if (!saveSnapshot
          || (v31 = -[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", storeName)) == 0|| !*(_QWORD *)(v31 + 120))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Couldn't find transaction number in log at URL: %@\nLog Contents: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 286, v21, v24);
          goto LABEL_61;
        }
        if (objc_msgSend(v28, "compare:") != -1)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSkipping log because it has already been imported into the local store: %@\nstoreKV: %@\nlogKV: %@\n"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 277, self, v21, v69, v24->_knowledgeVector);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquityLocationWasImportedNotification"), v24->_transactionLogLocation);
LABEL_61:
          -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasIgnored:]((uint64_t)self->_schedulingContext, v21);

          goto LABEL_68;
        }
        v32 = (void *)-[_PFUbiquityRecordImportOperation initWithTransactionLog:persistentStore:andLocalPeerID:]([_PFUbiquityRecordImportOperation alloc], v24, (uint64_t)self->_privateStore, (uint64_t)self->_localPeerID);
        v34 = -[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:]((uint64_t)v24->_knowledgeVector, (uint64_t)v69);
        if (v32)
          objc_setProperty_nonatomic(v32, v33, v34, 360);

        objc_msgSend(v32, "setDelegate:", self);
        objc_msgSend(v72, "addObject:", v32);

      }
      else if (v90)
      {
        if (objc_msgSend(v90, "code") == 4
          && objc_msgSend((id)objc_msgSend(v90, "domain"), "isEqualToString:", v78))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log went missing: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 247, 0);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error loading comparison metadata for transaction log: %@\nError: %@\n User Info: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 249, 0, v90, objc_msgSend(v90, "userInfo"));
        }
        -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocation:failedToOpenWithError:]((uint64_t)self->_schedulingContext, v21, v90);
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log was ignored because it could not be opened, there was no error, so this probably means it was unreadable by the local peer (a different type than this peer accepts). %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 255, v21);
        -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasIgnored:]((uint64_t)self->_schedulingContext, v21);
      }
LABEL_68:
      ++v20;
    }
    while (v18 != v20);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    v18 = v35;
  }
  while (v35);
LABEL_76:
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Created operations: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 304, v72);
  objc_msgSend(v72, "sortUsingComparator:", &__block_literal_global_26);
  if (self)
    importQueue = self->_importQueue;
  else
    importQueue = 0;
  v37 = -[NSArray count](-[NSOperationQueue operations](importQueue, "operations"), "count");
  v38 = (uint64_t)v69;
  v39 = (uint64_t)v69;
  if (v37)
  {
    if (self)
      v40 = self->_importQueue;
    else
      v40 = 0;
    v41 = -[NSArray reverseObjectEnumerator](-[NSOperationQueue operations](v40, "operations"), "reverseObjectEnumerator");
    while (1)
    {
      v42 = -[NSEnumerator nextObject](v41, "nextObject");
      if (!v42)
      {
        v38 = (uint64_t)v69;
        v39 = (uint64_t)v69;
        goto LABEL_96;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = *(_QWORD *)(v42 + 320);
        if (v43 && (v44 = *(_QWORD *)(v43 + 24)) != 0)
          v45 = *(void **)(v44 + 40);
        else
          v45 = 0;
        if ((objc_msgSend(v45, "isEqualToString:", self->_storeName) & 1) != 0)
          break;
      }
    }
    v46 = *(_QWORD *)(v42 + 320);
    if (v46)
      v39 = *(_QWORD *)(v46 + 64);
    else
      v39 = 0;
    v38 = (uint64_t)v69;
  }
LABEL_96:
  v80 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:](v39, v38);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v47 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
  if (!v47)
    goto LABEL_143;
  v74 = self;
  v75 = *(_QWORD *)v82;
  while (2)
  {
    v48 = 0;
    v73 = v47;
    while (2)
    {
      if (*(_QWORD *)v82 != v75)
        objc_enumerationMutation(v72);
      v49 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v48);
      if (!v49)
      {
        if (self)
        {
          v50 = 0;
          v51 = 0;
          v93 = 0u;
          v94 = 0u;
          v52 = 1;
          v91 = 0u;
          v92 = 0u;
          goto LABEL_105;
        }
        goto LABEL_133;
      }
      if (!self)
      {
LABEL_133:
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSkipping incompatible operation (%@): %@\n"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 345, self, v80, v49);
        goto LABEL_135;
      }
      v50 = *(_QWORD *)(v49 + 360);
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      if (v50)
      {
        v51 = (void *)objc_msgSend(*(id *)(v50 + 8), "allKeys");
        v52 = 0;
      }
      else
      {
        v51 = 0;
        v52 = 1;
      }
LABEL_105:
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, &v97, 16);
      if (v53)
      {
        v54 = 0;
        v55 = *(_QWORD *)v92;
        v77 = v49;
        v79 = v48;
        while (2)
        {
          v56 = 0;
          do
          {
            if (*(_QWORD *)v92 != v55)
              objc_enumerationMutation(v51);
            v57 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v56);
            if ((v52 & 1) != 0)
              v58 = 0;
            else
              v58 = (void *)objc_msgSend(*(id *)(v50 + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v56));
            v59 = objc_msgSend(v58, "integerValue");
            if (v80)
            {
              v60 = (void *)objc_msgSend(v80[1], "objectForKey:", v57);
              if ((objc_msgSend(v60, "integerValue") & 0x8000000000000000) == 0)
              {
                v61 = objc_msgSend(v58, "integerValue");
                v59 = v61 - objc_msgSend(v60, "integerValue");
              }
            }
            if (v59 >= 2)
            {
              v47 = v73;
              self = v74;
              v49 = v77;
              v48 = v79;
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCan't process log with score: %@ after log with score: %@\n It is ahead of the local peer."), "-[_PFUbiquityRecordsImporter canProcessTransactionLogWithScore:afterLogWithScore:]", 431, v74, v50, v80);
              }
              goto LABEL_133;
            }
            if (((v59 == 1) & v54) == 1)
            {
              v47 = v73;
              self = v74;
              v49 = v77;
              v48 = v79;
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCannot process log with score: %@ after log with score: %@\nIt will attempt to increment two peers simultaneously."), "-[_PFUbiquityRecordsImporter canProcessTransactionLogWithScore:afterLogWithScore:]", 438, v74, v50, v80);
              }
              goto LABEL_133;
            }
            v54 |= v59 == 1;
            ++v56;
          }
          while (v53 != v56);
          v62 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, &v97, 16);
          v53 = v62;
          v47 = v73;
          v49 = v77;
          v48 = v79;
          if (v62)
            continue;
          break;
        }
      }
      self = v74;
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ will process operation: %@"), "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 336, v74, v49);
      objc_msgSend(v70, "addObject:", v49);
      if (v49)
        v63 = *(_QWORD *)(v49 + 360);
      else
        v63 = 0;
      -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:]((uint64_t)v80, v63);
      if (v49 && (v64 = *(_QWORD *)(v49 + 320)) != 0)
        v65 = *(_QWORD *)(v64 + 24);
      else
        v65 = 0;
      -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasScheduled:]((uint64_t)v74->_schedulingContext, v65);
LABEL_135:
      if (++v48 != v47)
        continue;
      break;
    }
    v66 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
    v47 = v66;
    if (v66)
      continue;
    break;
  }
LABEL_143:

  if ((_DWORD)v47)
    objc_exception_rethrow();
  return v70;
}

- (uint64_t)schedulePendingLogs:(_QWORD *)a3 error:
{
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  PFUbiquityImportContext *v55;
  const char *v56;
  PFUbiquityImportContext *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _BOOL4 v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  _QWORD *v98;
  id *v100;
  id v101;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  unsigned __int8 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  const __CFString *v112;
  uint64_t v113;
  uint8_t v114[128];
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  int v118;
  _QWORD v119[2];
  _QWORD v120[2];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t v125[32];
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(_QWORD *)(a1 + 80);
  if (v4)
    v5 = *(void **)(v4 + 16);
  else
    v5 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v98 = a3;
    objc_opt_self();
    v6 = (id *)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    if (!v6)
    {
      v43 = 0;
      v100 = 0;
      v101 = 0;
      v45 = 0;
      v44 = 1;
LABEL_163:
      v87 = v43;

      v88 = v43;
      if ((v44 & 1) == 0)
      {
        if (v43)
        {
          if (v98)
            *v98 = v43;
        }
        else
        {
          v89 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v89, v90, v91, v92, v93, v94, v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
          v96 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v116 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
            v117 = 1024;
            v118 = 734;
            _os_log_fault_impl(&dword_18A253000, v96, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }

      if ((v45 | 2) != 2)
        return v107;
      return v44;
    }
    v100 = v6;
    v101 = v6[11];
    objc_msgSend(*(id *)(a1 + 104), "lock");
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v7 = (void *)objc_msgSend(*(id *)(a1 + 8), "operations");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v104;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v104 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD **)(*((_QWORD *)&v103 + 1) + 8 * v10);
          if ((objc_msgSend(v11, "isCancelled") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                if (v11)
                {
                  v12 = v11[40];
                  if (v12)
                    v12 = *(_QWORD *)(v12 + 24);
                }
                else
                {
                  v12 = 0;
                }
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Ignoring pending log (exisitng op): %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 636, v12);
              }
              if (v11 && (v13 = v11[40]) != 0)
                v14 = *(_QWORD *)(v13 + 24);
              else
                v14 = 0;
              -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasScheduled:](*(_QWORD *)(a1 + 80), v14);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
        v8 = v15;
      }
      while (v15);
    }
    v16 = *(_QWORD *)(a1 + 80);
    if (v16)
      v17 = *(void **)(v16 + 16);
    else
      v17 = 0;
    if (!objc_msgSend(v17, "count"))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nNo more logs to schedule"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 643, a1);
      v43 = 0;
      v44 = 1;
      v107 = 1;
      v45 = 1;
LABEL_162:
      objc_msgSend(*(id *)(a1 + 104), "unlock");
      goto LABEL_163;
    }
    v18 = (void *)objc_msgSend((id)a1, "createSortedOperationsArrayWithMetadata:isFirstImport:", v101, a2);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCreated sorted operations (%d): %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 647, a1, a2, v18);
    if (!a2)
      goto LABEL_97;
    v19 = *(_QWORD *)(a1 + 80);
    v20 = v19 ? *(void **)(v19 + 24) : 0;
    if (!objc_msgSend(v20, "count"))
      goto LABEL_97;
    v21 = *(_QWORD *)(a1 + 80);
    memset(v125, 0, sizeof(v125));
    v126 = 0u;
    v127 = 0u;
    if (v21)
      v22 = *(void **)(v21 + 40);
    else
      v22 = 0;
    v23 = (void *)objc_msgSend(v22, "allKeys");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v125, v128, 16);
    if (v24)
    {
      v25 = **(_QWORD **)&v125[16];
      v26 = *MEMORY[0x1E0CB28A8];
      while (2)
      {
        v27 = 0;
        do
        {
          if (**(_QWORD **)&v125[16] != v25)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*(_QWORD *)&v125[8] + 8 * v27);
          if (v28)
            v29 = *(void **)(v28 + 32);
          else
            v29 = 0;
          if (objc_msgSend(v29, "isEqualToString:", *(_QWORD *)(a1 + 32)))
          {
            v30 = v21 ? *(void **)(v21 + 40) : 0;
            v31 = (void *)objc_msgSend(v30, "objectForKey:", v28);
            if ((objc_msgSend(v31, "code") != 4
               || (objc_msgSend((id)objc_msgSend(v31, "domain"), "isEqualToString:", v26) & 1) == 0)
              && objc_msgSend(v31, "code") != 134320
              && objc_msgSend(v31, "code") != 134323
              && objc_msgSend(v31, "code") != 134324)
            {
              if (v21)
                v46 = *(void **)(v21 + 40);
              else
                v46 = 0;
              v43 = (void *)objc_msgSend(v46, "objectForKey:", v28);
              v36 = v18;
              v38 = 0;
              goto LABEL_95;
            }
          }
          ++v27;
        }
        while (v24 != v27);
        v32 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v125, v128, 16);
        v24 = v32;
        if (v32)
          continue;
        break;
      }
    }
    if (v21)
      v33 = *(void **)(v21 + 16);
    else
      v33 = 0;
    if (objc_msgSend(v33, "count"))
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      if (v21)
        v34 = *(void **)(v21 + 16);
      else
        v34 = 0;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v108, &v121, 16);
      v36 = v18;
      if (v35)
      {
        v37 = *(_QWORD *)v109;
        v38 = 1;
        while (2)
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v109 != v37)
              objc_enumerationMutation(v34);
            v40 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v39);
            if (v40)
              v41 = *(void **)(v40 + 32);
            else
              v41 = 0;
            if (objc_msgSend(v41, "isEqualToString:", *(_QWORD *)(a1 + 32)))
            {
              v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nUnable to import logs because of failed requisit foreign peer logs."), a1);
              v48 = (void *)MEMORY[0x1E0CB35C8];
              v119[0] = *MEMORY[0x1E0CB2D50];
              v119[1] = CFSTR("schedulingContext");
              v120[0] = v47;
              if (!v21)
                v21 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v120[1] = v21;
              v49 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
              v43 = (void *)objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v49);
              v38 = 0;
              goto LABEL_95;
            }
            ++v39;
          }
          while (v35 != v39);
          v42 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v108, &v121, 16);
          v35 = v42;
          v43 = 0;
          if (v42)
            continue;
          goto LABEL_95;
        }
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
        if (v21)
          v50 = *(_QWORD *)(v21 + 40);
        else
          v50 = 0;
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered errors trying to download logs, but can continue import: %@"), "-[_PFUbiquityRecordsImporter checkSchedulingContextForMissingLocalPeerOperations:error:]", 487, a1, v50);
      }
      v36 = v18;
    }
    v43 = 0;
    v38 = 1;
LABEL_95:
    if ((v38 & 1) == 0)
    {
      v18 = v36;
      if (!v43)
      {
        v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
        v74 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v116 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
          v117 = 1024;
          v118 = 503;
          _os_log_fault_impl(&dword_18A253000, v74, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v44 = 0;
LABEL_142:
      if (v43)
        v80 = v43;

      if (v43)
        v81 = v43;
      v86 = 0;
      if ((_DWORD)v44)
      {
        v82 = *(_QWORD *)(a1 + 80);
        v83 = v82 ? *(void **)(v82 + 16) : 0;
        if (objc_msgSend(v83, "count")
          || ((v84 = *(_QWORD *)(a1 + 80)) == 0 ? (v85 = 0) : (v85 = *(void **)(v84 + 24)), objc_msgSend(v85, "count")))
        {
          v86 = 1;
        }
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nFinished scheduling logs with context: %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 679, a1, *(_QWORD *)(a1 + 80));
      if (v86)
      {
        objc_msgSend(*(id *)(a1 + 104), "unlock");
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nWill reschedule pending logs: %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 687, a1, *(_QWORD *)(a1 + 80));
        v45 = 0;
        goto LABEL_163;
      }
      v45 = 0;
      goto LABEL_162;
    }
    v18 = v36;
LABEL_97:
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nScheduling operations (%d): %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 653, a1, a2, v18);
    objc_msgSend(v18, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, a1);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ importing operations: \n%@\n"), "-[_PFUbiquityRecordsImporter scheduleTransactionLogOperations:synchronous:error:]", 515, a1, v18);
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(*(id *)(a1 + 104), "lock");
      *(_QWORD *)(a1 + 136) += objc_msgSend(v18, "count");
      objc_msgSend(*(id *)(a1 + 104), "unlock");
      if (a2)
      {
        objc_msgSend(*(id *)(a1 + 8), "setSuspended:", 1);
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v51 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
        if (v51)
        {
          v52 = *(_QWORD *)v122;
          while (2)
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v122 != v52)
                objc_enumerationMutation(v18);
              v54 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
              objc_msgSend((id)v54, "setDelegate:", 0);
              if (*(_QWORD *)(a1 + 88))
              {
                v55 = objc_alloc_init(PFUbiquityImportContext);
                v57 = v55;
                if (v55)
                  objc_setProperty_nonatomic(v55, v56, *(id *)(a1 + 88), 88);
                if (v54)
                  objc_setProperty_nonatomic((id)v54, v56, v57, 400);

              }
              objc_msgSend((id)v54, "start");
              if (!v54)
                goto LABEL_122;
              if (!*(_BYTE *)(v54 + 408))
              {
                v43 = *(void **)(v54 + 416);
                if (!v43)
                {
LABEL_122:
                  v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                  _NSCoreDataLog(17, v58, v59, v60, v61, v62, v63, v64, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
                  v65 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v125 = 136315394;
                    *(_QWORD *)&v125[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity"
                                          "/_PFUbiquityRecordsImporter.m";
                    *(_WORD *)&v125[12] = 1024;
                    *(_DWORD *)&v125[14] = 550;
                    _os_log_fault_impl(&dword_18A253000, v65, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v125, 0x12u);
                  }
                  v43 = 0;
                }
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                {
                  if (v54)
                    v66 = *(void **)(v54 + 416);
                  else
                    v66 = 0;
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation failed while synchronously restoring logs, aborting: %@\nError: %@\n User Info: %@\nOperations: %@"), "-[_PFUbiquityRecordsImporter scheduleTransactionLogOperations:synchronous:error:]", 551, v54, v66, objc_msgSend(v66, "userInfo"), v18);
                }
                v44 = 0;
                goto LABEL_135;
              }
            }
            v51 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
            if (v51)
              continue;
            break;
          }
          v43 = 0;
          v44 = 1;
        }
        else
        {
          v43 = 0;
          v44 = 1;
        }
LABEL_135:
        objc_msgSend(*(id *)(a1 + 8), "setSuspended:", 0);
      }
      else
      {
        v43 = 0;
        objc_msgSend(*(id *)(a1 + 8), "addOperations:waitUntilFinished:", v18, 0);
        v44 = 1;
      }
    }
    else
    {
      v43 = 0;
      v44 = 1;
    }
    v75 = *(_QWORD *)(a1 + 80);
    if (v75)
      v76 = *(void **)(v75 + 8);
    else
      v76 = 0;
    if (objc_msgSend(v76, "count"))
    {
      v77 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v78 = *(_QWORD *)(a1 + 40);
      v112 = CFSTR("PFLogLocationsKey");
      v79 = *(_QWORD *)(a1 + 80);
      if (v79)
        v79 = *(_QWORD *)(v79 + 8);
      v113 = v79;
      objc_msgSend(v77, "postNotificationName:object:userInfo:", CFSTR("PFUbiquityLocationsWereScheduledNotification"), v78, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
    }
    goto LABEL_142;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAsked to schedule but nothing to schedule in the context: %@"), "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 609, a1, *(_QWORD *)(a1 + 80));
  return 1;
}

- (BOOL)discoverAndImportAllAvailableLogs:(id *)a3 error:
{
  id v5;
  PFUbiquityFileCoordinator *v6;
  PFUbiquityFileCoordinator *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *global_queue;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD block[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  const __CFString *v48;
  uint8_t v49[128];
  _BYTE buf[24];
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting scan of location: %@"), "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]", 747, a1[5]);
  v46 = 0;
  v6 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1[5], a1[4]);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v51 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v9 = a1[5];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke;
    v45[3] = &unk_1E1EE0A98;
    v45[4] = buf;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v6, v9, 1, 1, &v46, (uint64_t)v45);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v10 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a1[5], (uint64_t)&v46);
      v11 = v10;
      if (v10)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v11);
              v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              if (v15
                && *(_DWORD *)(v15 + 24) == 22
                && objc_msgSend(*(id *)(v15 + 40), "isEqualToString:", a1[6])
                && objc_msgSend(*(id *)(v15 + 48), "isEqualToString:", a1[7]))
              {
                -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocation:](a1[10], v15);
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v12);
        }
        v16 = a1[10];
        if (v16)
          v17 = *(void **)(v16 + 16);
        else
          v17 = 0;
        v18 = 1;
        if (objc_msgSend(v17, "count"))
        {
          v19 = objc_alloc(MEMORY[0x1E0C99E60]);
          v20 = a1[10];
          if (v20)
            v21 = *(_QWORD *)(v20 + 16);
          else
            v21 = 0;
          v22 = (void *)objc_msgSend(v19, "initWithSet:copyItems:", v21, 0);
          global_queue = dispatch_get_global_queue(0, 0);
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke_2;
          block[3] = &unk_1E1EDD430;
          block[4] = v22;
          block[5] = a1;
          dispatch_async(global_queue, block);

          v18 = -[_PFUbiquityRecordsImporter schedulePendingLogs:error:]((uint64_t)a1, a2, &v46);
        }
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D68];
    v48 = CFSTR("Importer aborted scanning for logs because it failed to acquire a file coordinator.");
    v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v18 = 0;
    v46 = (id)objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v25);
  }
  v26 = v18 != 0;
  v27 = v46;
  objc_msgSend(v5, "drain");
  v28 = v46;
  v29 = 0;
  if (!v18)
  {
    if (v46)
    {
      if (a3)
        *a3 = v46;
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityR"
                             "ecordsImporter.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 815;
        _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v26;
}

- (uint64_t)createNewSetOfObjectIDsForCoordinator:(void *)a3 fromObjectIDs:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSTemporaryObjectID *v11;
  NSTemporaryObjectID *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = *(NSTemporaryObjectID **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](a2, (CFURLRef)-[NSTemporaryObjectID URIRepresentation](v11, "URIRepresentation"), 0);
        if (v12)
        {
          v13 = (void *)v6;
        }
        else
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:"))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nDidn't get an object ID back for the application's coordinator: %@\n%@"), "-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:]", 904, a1, a2, v11);
          v13 = (void *)v6;
          v12 = v11;
        }
        objc_msgSend(v13, "addObject:", v12);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)postImportNotificationForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 withUserInfo:
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = (uint64_t)result;
    v22 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a4);
    objc_opt_self();
    v9 = -[PFUbiquitySwitchboard createSetOfCoordinatorsForPersistentStoreName:andLocalPeerID:atUbiquityRootLocation:](_sharedSwitchboard, a2, a3);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot set of persistent store coordinators for store named: %@\nCoordinators: %@"), "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]", 928, v7, a2, v9);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v9;
    v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v10 = 0;
    if (v25)
    {
      v24 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
          v13 = (id)objc_msgSend(a4, "objectForKey:", CFSTR("inserted"));
          v14 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v13);
          objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("inserted"));

          v15 = (id)objc_msgSend(a4, "objectForKey:", CFSTR("updated"));
          v16 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v15);
          objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("updated"));

          v17 = (id)objc_msgSend(a4, "objectForKey:", CFSTR("deleted"));
          v18 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v17);
          objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("deleted"));

          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.importer.didfinishimport"), v12, v8);
          if (!(_BYTE)dword_1ECD8DE18
            && (NSClassFromString((NSString *)CFSTR("NSApplication"))
             || NSClassFromString((NSString *)CFSTR("UIApplication")))
            && !(_BYTE)dword_1ECD8DE18)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __93___PFUbiquityRecordsImporter_postImportNotificationForStoreName_andLocalPeerID_withUserInfo___block_invoke;
            block[3] = &unk_1E1EDE568;
            block[4] = v10;
            block[5] = v12;
            dispatch_async(MEMORY[0x1E0C80D38], block);
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Posting import notification: %@\nFor coordinator: %p\n"), "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]", 968, v10, v12);
            }
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v10);
          }
          v8 = 0;
          ++v11;
        }
        while (v25 != v11);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v8 = 0;
        v25 = v19;
      }
      while (v19);
      v20 = obj;
      v21 = 0;
    }
    else
    {
      v20 = obj;
      v21 = v8;
    }

    objc_msgSend(v22, "drain");
    return 0;
  }
  return result;
}

- (void)operationDidFinish:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t pendingImportOperationsCount;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  self->_numPendingNotifications = 0;
  if (a3 && (v5 = *((_QWORD *)a3 + 40)) != 0 && *(_QWORD *)(v5 + 24))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = *((_QWORD *)a3 + 40);
    if (v7)
      v8 = *(_QWORD *)(v7 + 24);
    else
      v8 = 0;
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PFUbiquityLocationWasImportedNotification"), v8);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nOperation missing transaction log location: %@"), "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1002, self, a3);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (!a3)
    {
      v15 = 0;
      v16 = 0;
      goto LABEL_20;
    }
  }
  v10 = *((_QWORD *)a3 + 42);
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("inserted"));
  v11 = *((_QWORD *)a3 + 43);
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("updated"));
  v12 = *((_QWORD *)a3 + 44);
  if (v12)
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("deleted"));
  v13 = *((_QWORD *)a3 + 40);
  if (v13 && (v14 = *(_QWORD *)(v13 + 24)) != 0)
    v15 = *(_QWORD *)(v14 + 40);
  else
    v15 = 0;
  v16 = *((_QWORD *)a3 + 31);
LABEL_20:
  -[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:](self, v15, v16, v9);
  -[NSRecursiveLock lock](self->_schedulingLock, "lock");
  pendingImportOperationsCount = self->_pendingImportOperationsCount;
  if (pendingImportOperationsCount)
  {
    v18 = pendingImportOperationsCount - 1;
    self->_pendingImportOperationsCount = v18;
    if (v18)
    {
      v19 = 0;
      goto LABEL_37;
    }
  }
  objc_opt_self();
  v20 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  v19 = v20;
  if (v20 && (v21 = *((_QWORD *)v20 + 11)) != 0)
  {
    v22 = *(_QWORD *)(v21 + 88);
    if (v22)
    {
      v23 = 0;
      v24 = *(_QWORD *)(v22 + 48);
      if (!a3)
        goto LABEL_40;
      goto LABEL_27;
    }
  }
  else
  {
    v22 = 0;
  }
  v24 = 0;
  v23 = 1;
  if (!a3)
    goto LABEL_40;
LABEL_27:
  v25 = *((_QWORD *)a3 + 40);
  if (v25)
  {
    v26 = *(_QWORD *)(v25 + 24);
    if (v26)
    {
      v27 = *(_QWORD *)(v26 + 40);
      goto LABEL_30;
    }
  }
LABEL_40:
  v27 = 0;
LABEL_30:
  -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v24, v27, (uint64_t)self->_ubiquityRootLocation);
  if ((v23 & 1) != 0)
    v28 = 0;
  else
    v28 = *(_QWORD *)(v22 + 56);
  if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v28, 1))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nWrote pending entries to disk after imports finished."), "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1043, self);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to write pending transaction history to disk: %@\nUser Info: %@"), "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1045, self, 0, objc_msgSend(0, "userInfo"));
  }
LABEL_37:

  -[NSRecursiveLock unlock](self->_schedulingLock, "unlock");
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PFUbiquityLocation *ubiquityRootLocation;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "code");
  if (v7 <= 134304)
  {
    if (v7 == 134302)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        v11 = objc_msgSend(a4, "userInfo");
        if (a3)
          v12 = *((_QWORD *)a3 + 40);
        else
          v12 = 0;
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation encountered had trouble importing log file, %@\n User Info: %@\n The log file is at: %@.\nOperation: %@"), "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1064, a4, v11, v12, a3);
      }
    }
    else
    {
      if (v7 != 134304)
      {
LABEL_22:
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          v13 = objc_msgSend(a4, "userInfo");
          if (a3)
            v14 = *((_QWORD *)a3 + 40);
          else
            v14 = 0;
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation encountered an error: %@\nuserInfo: %@. While trying to import the log file at the URL: %@"), "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1084, a4, v13, v14);
        }
        goto LABEL_26;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation was beat into the data store: %@"), "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1068, self);
    }
  }
  else
  {
    if (v7 != 134305)
    {
      if (v7 == 134321)
      {
        if (a3)
          v10 = *((_QWORD *)a3 + 33);
        else
          v10 = 0;
        -[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]((uint64_t)self, v10);
        goto LABEL_26;
      }
      if (v7 == 134327)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          v8 = objc_msgSend(a4, "userInfo");
          if (a3)
            v9 = *((_QWORD *)a3 + 40);
          else
            v9 = 0;
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation had trouble with the fileystem, %@\n User Info: %@\n The log file is at: %@.\nOperation: %@"), "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1072, a4, v8, v9, a3);
        }
        goto LABEL_26;
      }
      goto LABEL_22;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation had trouble with conflict resolution: %@\nuserInfo: %@\n It appears that the operation was beat to the database."), "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1076, a4, objc_msgSend(a4, "userInfo"));
  }
LABEL_26:
  if (a3)
  {
    v15 = *((_QWORD *)a3 + 40);
    if (v15)
    {
      v16 = *(_QWORD *)(v15 + 24);
      if (v16)
      {
        v17 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        ubiquityRootLocation = self->_ubiquityRootLocation;
        v19 = v16;
        v20 = CFSTR("PFLogLocationsKey");
        v21[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PFUbiquityLocationImportCancelledNotification"), ubiquityRootLocation, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1));
      }
    }
  }
  -[_PFUbiquityRecordsImporter scheduleRecoveryTimer](self, "scheduleRecoveryTimer");
}

- (void)metadataInconsistencyDetectedForStore:(uint64_t)a1
{
  NSObject *v4;
  _QWORD v5[6];
  _QWORD block[5];

  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      objc_msgSend(*(id *)(a1 + 8), "setSuspended:", 1);
      objc_msgSend(*(id *)(a1 + 8), "cancelAllOperations");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __68___PFUbiquityRecordsImporter_metadataInconsistencyDetectedForStore___block_invoke;
      v5[3] = &unk_1E1EDD430;
      v5[4] = a2;
      v5[5] = a1;
      v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke;
      block[3] = &unk_1E1EDFF40;
      block[4] = v5;
      dispatch_async(v4, block);
    }
  }
}

- (void)operationWasInterruptedDuringImport:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PFUbiquityLocation *ubiquityRootLocation;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Operation was interrutped by import: %@"), "-[_PFUbiquityRecordsImporter operationWasInterruptedDuringImport:]", 1098, a3);
  if (a3)
  {
    v5 = *((_QWORD *)a3 + 40);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 24);
      if (v6)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        ubiquityRootLocation = self->_ubiquityRootLocation;
        v9 = v6;
        v10 = CFSTR("PFLogLocationsKey");
        v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
        objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PFUbiquityLocationImportCancelledNotification"), ubiquityRootLocation, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
      }
    }
  }
  -[_PFUbiquityRecordsImporter scheduleRecoveryTimer](self, "scheduleRecoveryTimer");
}

- (void)scheduleRecoveryTimer
{
  NSOperationQueue *importQueue;
  dispatch_source_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD handler[4];
  id v10;
  id location;

  if (self)
  {
    -[NSOperationQueue cancelAllOperations](self->_importQueue, "cancelAllOperations");
    importQueue = self->_importQueue;
  }
  else
  {
    objc_msgSend(0, "cancelAllOperations");
    importQueue = 0;
  }
  -[NSOperationQueue setSuspended:](importQueue, "setSuspended:", 1);
  if (!self->_logRestartTimer)
  {
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)_ubiquityRootQueue);
    if (v4)
    {
      v5 = v4;
      objc_initWeak(&location, self);
      v6 = dispatch_walltime(0, 30000000000);
      dispatch_source_set_timer(v5, v6, 0, 0x3B9ACA00uLL);
      v7 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke;
      handler[3] = &unk_1E1EDE1A0;
      objc_copyWeak(&v10, &location);
      dispatch_source_set_event_handler(v5, handler);
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke_2;
      v8[3] = &unk_1E1EDD520;
      v8[4] = v5;
      dispatch_source_set_cancel_handler(v5, v8);
      self->_logRestartTimer = (OS_dispatch_source *)v5;
      dispatch_resume(v5);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

- (void)requestBaselineRollForStore:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD block[5];

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __58___PFUbiquityRecordsImporter_requestBaselineRollForStore___block_invoke;
      v3[3] = &unk_1E1EDD430;
      v3[4] = a1;
      v3[5] = a2;
      v2 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke;
      block[3] = &unk_1E1EDFF40;
      block[4] = v3;
      dispatch_async(v2, block);
    }
  }
}

- (void)scheduleBaselineRollResponseOperationForBaselineAtLocation:(uint64_t)a1
{
  id v4;
  void *active;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PFUbiquityBaselineRollResponseOperation *v20;
  id v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Scheduling response to baseline: %@\n"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1220, a2);
    if (*(_BYTE *)(a1 + 128))
    {
      objc_opt_self();
      v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      active = (void *)-[PFUbiquitySwitchboardEntry createSetOfActiveStoreNames]((uint64_t)v4);
      v6 = active;
      if (*(_BYTE *)(a1 + 24))
      {
        if (a2)
          v7 = *(_QWORD *)(a2 + 40);
        else
          v7 = 0;
        if (objc_msgSend(active, "containsObject:", v7))
        {
          if (a2)
            v8 = *(_QWORD *)(a2 + 40);
          else
            v8 = 0;
          v9 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v4, v8);
          v22 = v4;
          v23 = v6;
          v21 = v9;
          v10 = (void *)objc_msgSend(v9, "anyObject");
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Registered coordinators: %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1232, v9);
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v11 = (void *)objc_msgSend(v10, "persistentStores");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v25;
LABEL_15:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                if (a2)
                  v16 = *(_QWORD *)(a2 + 40);
                else
                  v16 = 0;
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  store name: %@ - %@\n%@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1237, v16, objc_msgSend(v15, "options"), v15);
              }
              v17 = a2 ? *(void **)(a2 + 40) : 0;
              if ((objc_msgSend(v17, "isEqualToString:", objc_msgSend((id)objc_msgSend(v15, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))) & 1) != 0)break;
              if (v12 == ++v14)
              {
                v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
                v12 = v18;
                if (v18)
                  goto LABEL_15;
                goto LABEL_30;
              }
            }
          }
          else
          {
LABEL_30:
            v15 = 0;
          }
          v4 = v22;
          v6 = v23;
          v19 = v21;
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Store: %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1244, v15);
          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 104), "lock");
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Adding operation"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1253);
            }
            v20 = -[PFUbiquityBaselineOperation initWithPersistentStore:localPeerID:andUbiquityRootLocation:]([PFUbiquityBaselineRollResponseOperation alloc], "initWithPersistentStore:localPeerID:andUbiquityRootLocation:", v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
            -[PFUbiquityBaselineRollResponseOperation setDelegate:](v20, "setDelegate:", a1);
            objc_msgSend(*(id *)(a1 + 8), "addOperation:", v20);
            objc_msgSend(*(id *)(a1 + 104), "unlock");
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule baseline roll response operation for location (store active but not found): %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1246, a1, a2);
            }
            v20 = 0;
          }
          goto LABEL_43;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule roll response operation for location (store not active): %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1261, a1, a2);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule roll response operation for location (monitoring): %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1264, a1, a2);
      }
      v20 = 0;
      v19 = 0;
    }
    else
    {
      v20 = 0;
      v19 = 0;
      v6 = 0;
      v4 = 0;
    }
LABEL_43:

  }
}

- (BOOL)scheduleBaselineRecoveryOperationWithActiveBaselineOperation:(_BOOL8)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  PFUbiquityBaselineRecoveryOperation *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PFUbiquityBaselineRecoveryOperation *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nScheduling baseline recovery operation on behalf of: %@"), "-[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]", 1280, v3, a2);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (void *)objc_msgSend(*(id *)(v3 + 8), "operations");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (v9 != a2)
            objc_msgSend(v9, "cancel");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    v10 = [PFUbiquityBaselineRecoveryOperation alloc];
    if (a2)
    {
      v11 = a2[33];
      v12 = a2[31];
      v13 = a2[34];
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v13 = 0;
    }
    v14 = -[PFUbiquityBaselineOperation initWithPersistentStore:localPeerID:andUbiquityRootLocation:](v10, "initWithPersistentStore:localPeerID:andUbiquityRootLocation:", v11, v12, v13);
    -[PFUbiquityBaselineRecoveryOperation setDelegate:](v14, "setDelegate:", v3);
    objc_msgSend(*(id *)(v3 + 8), "addOperation:", v14);

    return -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)v3, 0, 0);
  }
  return result;
}

- (void)baselineRollOperationEncounteredAnInconsistentBaselineState:(id)a3
{
  -[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]((_BOOL8)self, a3);
}

- (void)baselineRollOperationWasUnableToLockPersistentStore:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = *((_QWORD *)a3 + 33);
  else
    v3 = 0;
  -[_PFUbiquityRecordsImporter requestBaselineRollForStore:]((uint64_t)self, v3);
}

- (void)recoveryOperation:(id)a3 didReplaceLocalStoreFileWithBaseline:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_opt_self();
  v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  v7 = v6;
  if (v6)
  {
    v8 = *((_QWORD *)v6 + 11);
    if (v8)
    {
      v9 = *(_QWORD *)(v8 + 88);
      if (v9)
      {
        if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](*(_QWORD *)(v9 + 40)))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache after baseline roll."), "-[_PFUbiquityRecordsImporter recoveryOperation:didReplaceLocalStoreFileWithBaseline:]", 1316, self);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to refresh peer range cache: %@"), "-[_PFUbiquityRecordsImporter recoveryOperation:didReplaceLocalStoreFileWithBaseline:]", 1318, self, 0);
        }
      }
    }
    -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)self, 0, 0);
  }

  if (a3)
  {
    v10 = *((_QWORD *)a3 + 32);
    a3 = (id)*((_QWORD *)a3 + 31);
  }
  else
  {
    v10 = 0;
  }
  -[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:](self, v10, (uint64_t)a3, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "set"), CFSTR("invalidatedAll")));
}

- (void)rollResponseOperation:(id)a3 successfullyAdoptedBaseline:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully adopted baseline: %@"), "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1333, a3, a4);
  -[NSOperationQueue cancelAllOperations](self->_importQueue, "cancelAllOperations");
  objc_opt_self();
  v7 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  v8 = v7;
  if (v7)
  {
    v9 = *((_QWORD *)v7 + 11);
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 88);
      if (v10)
      {
        if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](*(_QWORD *)(v10 + 40)))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Refreshed peer range cache"), "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1345);
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache after baseline roll."), "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1346, self, v11);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to refresh peer range cache: %@"), "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1348, self, 0);
        }
      }
    }
    if (self->_isMonitoring)
      -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)self, 0, 0);
  }

}

- (void)rollResponseOperation:(id)a3 encounteredAnError:(id)a4 whileTryingToAdoptBaseline:(id)a5
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered an error while trying to respond to the roll of baseline: %@\nError: %@\nuserInfo: %@"), "-[_PFUbiquityRecordsImporter rollResponseOperation:encounteredAnError:whileTryingToAdoptBaseline:]", 1363, a3, a5, a4, objc_msgSend(a4, "userInfo"));
  -[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]((_BOOL8)self, a3);
}

- (void)recoveryOperation:(id)a3 encounteredAnError:(id)a4 duringRecoveryOfBaseline:(id)a5
{
  -[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]((_BOOL8)self, a3);
}

+ (NSPersistentStoreCoordinator)createPrivateCoordinatorForStore:(uint64_t)a1 error:(void *)a2
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSPersistentStoreCoordinator *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel"), "mutableCopy");
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "initWithUTF8String:", class_getName(v5));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_msgSend(v3, "entities");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setManagedObjectClassName:", v6);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  if (v3)
  {
    v11 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v3);

  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
    v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
      v27 = 1024;
      v28 = 1464;
      _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

+ (uint64_t)addPrivateStore:(void *)a3 toCoordinator:(uint64_t)a4 atURL:(uint64_t *)a5 error:
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v21 = 0;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a2, "options"), "mutableCopy");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("NSUbiquityImporterPrivateStoreKey"));

  if (a4 || (a4 = objc_msgSend(a2, "URL")) != 0)
  {
    v11 = objc_msgSend(a3, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a2, "type"), objc_msgSend(a2, "configurationName"), a4, v9, &v21);
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator as store URL is nil."), "+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]", 1501);
    v11 = 0;
  }

  if (!v11)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator: %@"), "+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]", 1506, v21);
    if (v21)
    {
      if (a5)
        *a5 = v21;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
        v24 = 1024;
        v25 = 1510;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v11;
}

+ (NSPersistentStoreCoordinator)createPrivateCoordinatorAndStoreForStore:(uint64_t)a3 atURL:(_QWORD *)a4 error:
{
  NSPersistentStoreCoordinator *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v17 = 0;
  v7 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorForStore:error:]((uint64_t)_PFUbiquityRecordsImporter, a2);
  if (!v7)
    goto LABEL_6;
  if (!+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, v7, a3, &v17))
  {
    if (v17)
    {
      if (a4)
        *a4 = v17;
LABEL_8:

      return 0;
    }
LABEL_6:
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
    v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
      v20 = 1024;
      v21 = 1543;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_8;
  }
  return v7;
}

+ (void)executeBlockOnRootQueue:(uint64_t)a1
{
  _QWORD block[5];

  objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___PFUbiquityRecordsImporter_executeBlockOnRootQueue___block_invoke;
  block[3] = &unk_1E1EDFF40;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)_ubiquityRootQueue, block);
}

+ (void)afterDelay:(uint64_t)a3 executeBlockOnRootQueue:
{
  dispatch_time_t v5;
  _QWORD block[5];

  objc_opt_self();
  v5 = dispatch_time(0, 1000000000 * (uint64_t)a1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___PFUbiquityRecordsImporter_afterDelay_executeBlockOnRootQueue___block_invoke;
  block[3] = &unk_1E1EDFF40;
  block[4] = a3;
  dispatch_after(v5, (dispatch_queue_t)_ubiquityRootQueue, block);
}

@end
