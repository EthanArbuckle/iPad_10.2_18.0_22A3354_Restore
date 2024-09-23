@implementation PFUbiquityStoreMetadataMedic

- (PFUbiquityStoreMetadataMedic)initWithStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  PFUbiquityStoreMetadataMedic *v8;

  v8 = -[PFUbiquityStoreMetadataMedic init](self, "init");
  if (v8)
  {
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
    v8->_store = (NSPersistentStore *)a3;
    v8->_localPeerID = (NSString *)a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_store = 0;
  self->_ubiquityRootLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityStoreMetadataMedic;
  -[PFUbiquityStoreMetadataMedic dealloc](&v3, sel_dealloc);
}

- (uint64_t)recoverMetadataWithError:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  PFUbiquityStoreMetadata *v6;
  id v7;
  id v8;
  PFUbiquityKnowledgeVector *v9;
  PFUbiquityKnowledgeVector *v10;
  const char *v11;
  PFUbiquitySwitchboardCacheWrapper *v12;
  SEL v13;
  PFUbiquitySwitchboardCacheWrapper *cacheWrapper;
  uint64_t peerRangeCache;
  PFUbiquityBaseline *v16;
  PFUbiquityBaseline *v17;
  NSPersistentStoreCoordinator *v18;
  NSPersistentStoreCoordinator *v19;
  NSManagedObjectContext *v20;
  id v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSFetchRequest *v30;
  NSArray *v31;
  PFUbiquitySwitchboardCacheWrapper *v32;
  uint64_t v33;
  _PFUbiquityStack *stack;
  NSManagedObjectContext *metadataMOC;
  uint64_t kv;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  PFUbiquityTransactionEntry *v44;
  _PFUbiquityStack *v45;
  NSManagedObjectContext *v46;
  id v47;
  void *v48;
  PFUbiquityStoreMetadata *storeMetadata;
  void *v50;
  id v51;
  uint64_t v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  int v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  int v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  BOOL v82;
  int v83;
  BOOL v84;
  PFUbiquityStoreMetadata *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  int v94;
  BOOL v95;
  PFUbiquitySwitchboardCacheWrapper *v96;
  uint64_t transactionLogCache;
  PFUbiquityTransactionLog *v98;
  const char *v99;
  id *p_isa;
  uint64_t v101;
  PFUbiquityKnowledgeVector *v102;
  PFUbiquityKnowledgeVector *v103;
  PFUbiquitySaveSnapshot *saveSnapshot;
  void *v105;
  void *v106;
  _PFUbiquityStack *v107;
  NSManagedObjectContext *v108;
  PFUbiquitySwitchboardCacheWrapper *v109;
  uint64_t v110;
  PFUbiquityStoreSaveSnapshot *storeSaveSnapshot;
  NSMutableArray *globalObjectIDs;
  NSMutableArray *v113;
  const char *v114;
  BOOL v115;
  PFUbiquityStoreSaveSnapshot *v116;
  NSMutableDictionary *insertedObjects;
  PFUbiquityStoreSaveSnapshot *v118;
  NSMutableDictionary *updatedObjects;
  PFUbiquityStoreSaveSnapshot *v120;
  NSMutableDictionary *deletedObjects;
  int v122;
  PFUbiquityKnowledgeVector *v123;
  uint64_t v124;
  void *v125;
  PFUbiquityTransactionLog *transactionLog;
  PFUbiquityKnowledgeVector *knowledgeVector;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  SEL v138;
  SEL v139;
  uint64_t v140;
  char v141;
  char v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  char v151;
  id v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSObject *v162;
  PFUbiquityBaseline *v163;
  NSManagedObjectContext *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD *v168;
  NSFetchRequest *v169;
  _QWORD *v170;
  uint64_t v171;
  void *v172;
  id *v173;
  void *v174;
  void *v175;
  id v176;
  id v177;
  PFUbiquityImportContext *self;
  _QWORD v180[6];
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  void (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  uint64_t v186;
  id v187;
  char v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  id v201;
  id v202;
  _BYTE v203[128];
  uint8_t v204[128];
  uint8_t v205[4];
  const char *v206;
  __int16 v207;
  int v208;
  uint8_t buf[4];
  const char *v210;
  __int16 v211;
  int v212;
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v151 = 0;
    return v151 & 1;
  }
  v187 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Beginning metadata recovery for store: %@"), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 90, a1[4]);
  v168 = a2;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Metadata recovery for store: %@\nCreating new store metadata."), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 105, a1[4]);
  objc_opt_self();
  v173 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a1[1], a1[3], a1[2], &v187);
  if (!v173 || !objc_msgSend(v173[1], "persistentStoreCoordinator"))
  {
    v62 = 0;
    v170 = 0;
    v63 = 0;
    self = 0;
    v188 = 0;
    goto LABEL_259;
  }
  if (!-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:]((uint64_t)v173, &v187))
  {
    v170 = 0;
LABEL_99:
    v165 = 0;
    self = 0;
    goto LABEL_254;
  }
  objc_opt_self();
  v170 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)a1[3], (uint64_t)a1[1]);
  if (v170)
  {
    v3 = v170[11];
    if (v3 && (v4 = *(_QWORD *)(v3 + 88)) != 0)
      v5 = *(_QWORD *)(v4 + 56);
    else
      v5 = 0;
    if (!-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v5, 0))
      goto LABEL_99;
  }
  v6 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:]([PFUbiquityStoreMetadata alloc], "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", a1[3], a1[2], v173[1]);
  -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v6, a1[4], (uint64_t)a1[2]);

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nCreated new store metadata: %@\nMoving on to recreating the peer ranges."), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 125, a1, a1[4], v6);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFinished creating new peer ranges, moving to knowledge vector, peer states, and transaction entries."), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 127, a1, a1[4]);
  v7 = (id)objc_msgSend(a1[4], "persistentStoreCoordinator");
  v181 = 0;
  v182 = &v181;
  v183 = 0x3052000000;
  v184 = __Block_byref_object_copy__62;
  v185 = __Block_byref_object_dispose__62;
  v186 = 0;
  v180[0] = MEMORY[0x1E0C809B0];
  v180[1] = 3221225472;
  v180[2] = __57__PFUbiquityStoreMetadataMedic_recoverMetadataWithError___block_invoke;
  v180[3] = &unk_1E1EDD618;
  v180[5] = &v181;
  v180[4] = a1;
  v165 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v180);
  v8 = (id)v182[5];
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFetched knowledge vector: %@"), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 137, a1, a1[4], v182[5]);
  v9 = [PFUbiquityKnowledgeVector alloc];
  v10 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v9, "initWithStoreKnowledgeVectorDictionary:", v182[5]);
  -[PFUbiquityStoreMetadata updatePeerStatesToMatchKnowledgeVector:](v6, (uint64_t)v10);
  self = -[PFUbiquityImportContext initWithStack:andStoreMetadata:]([PFUbiquityImportContext alloc], "initWithStack:andStoreMetadata:", v173, v6);
  v12 = -[PFUbiquitySwitchboardCacheWrapper initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:]([PFUbiquitySwitchboardCacheWrapper alloc], "initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:", a1[3], a1[4], a1[1], a1[2]);
  if (self)
  {
    objc_setProperty_nonatomic(self, v11, v12, 88);
    objc_setProperty_nonatomic(self, v13, v10, 32);
  }

  if (self && (cacheWrapper = self->_cacheWrapper) != 0)
    peerRangeCache = (uint64_t)cacheWrapper->_peerRangeCache;
  else
    peerRangeCache = 0;
  if (!-[PFUbiquityPeerRangeCache cachePeerRanges:](peerRangeCache))
  {
LABEL_253:
    _Block_object_dispose(&v181, 8);
    goto LABEL_254;
  }
  v202 = 0;
  v16 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", a1[1], a1[2], a1[3], objc_msgSend((id)objc_msgSend(a1[4], "persistentStoreCoordinator"), "managedObjectModel"));
  v17 = v16;
  if (!v16
    || (v18 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](v16, 1, &v202)) == 0)
  {
    v53 = v202 == 0;
    goto LABEL_103;
  }
  v19 = v18;
  v20 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v20, "setPersistentStoreCoordinator:", v19);
  -[NSManagedObjectContext setUndoManager:](v20, "setUndoManager:", 0);
  -[NSManagedObjectContext _setDelegate:](v20, "_setDelegate:", a1);
  -[NSManagedObjectContext setMergePolicy:](v20, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v164 = v20;
  v22 = -[NSManagedObjectModel entities](-[NSPersistentStoreCoordinator managedObjectModel](v19, "managedObjectModel"), "entities");
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v198;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v198 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * v25);
        if (v26)
        {
          if ((*(_BYTE *)(v26 + 120) & 4) != 0)
          {
            v27 = *(_QWORD *)(v26 + 72);
          }
          else
          {
            do
            {
              v27 = v26;
              v26 = objc_msgSend((id)v26, "superentity");
            }
            while (v26);
          }
        }
        else
        {
          v27 = 0;
        }
        objc_msgSend(v21, "addObject:", v27);
        ++v25;
      }
      while (v25 != v23);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
      v23 = v28;
    }
    while (v28);
  }

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
  if (!v29)
  {
    v53 = 1;
    goto LABEL_102;
  }
  v163 = v17;
  v167 = *(_QWORD *)v194;
  do
  {
    v171 = 0;
    v166 = v29;
    do
    {
      if (*(_QWORD *)v194 != v167)
        objc_enumerationMutation(v21);
      v30 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend(*(id *)(*((_QWORD *)&v193 + 1) + 8 * v171), "name"));
      -[NSFetchRequest setResultType:](v30, "setResultType:", 1);
      -[NSFetchRequest setIncludesPropertyValues:](v30, "setIncludesPropertyValues:", 0);
      v31 = -[NSManagedObjectContext executeFetchRequest:error:](v20, "executeFetchRequest:error:", v30, &v202);
      v169 = v30;
      if (!v31)
      {
        v53 = 0;
        goto LABEL_87;
      }
      if (self)
      {
        v32 = self->_cacheWrapper;
        if (v32)
          v33 = (uint64_t)v32->_peerRangeCache;
        else
          v33 = 0;
        stack = self->_stack;
        if (stack)
        {
          metadataMOC = stack->_metadataMOC;
          goto LABEL_53;
        }
      }
      else
      {
        v33 = 0;
      }
      metadataMOC = 0;
LABEL_53:
      if (!-[NSManagedObjectContext persistentStoreCoordinator](metadataMOC, "persistentStoreCoordinator"))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  addTransactionHistoryEntriesForObjectIDs: lost its stack"), "-[PFUbiquityStoreMetadataMedic addTransactionHistoryEntriesForObjectIDs:withImportContext:error:]", 310);
        v174 = 0;
        v176 = 0;
        v38 = 0;
LABEL_83:
        v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
        v61 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
          v211 = 1024;
          v212 = 315;
          _os_log_fault_impl(&dword_18A253000, v61, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        v53 = 0;
        goto LABEL_86;
      }
      if (self)
        kv = (uint64_t)self->_kv;
      else
        kv = 0;
      v176 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](kv);
      v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", 0.0);
      v191 = 0u;
      v192 = 0u;
      v189 = 0u;
      v190 = 0u;
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
      if (v37)
      {
        v38 = 0;
        v39 = *(_QWORD *)v190;
LABEL_58:
        v40 = 0;
        v41 = v38;
        while (1)
        {
          if (*(_QWORD *)v190 != v39)
            objc_enumerationMutation(v31);
          v42 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v40);
          if (v41)
            objc_msgSend(v41, "drain");
          v38 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v43 = (_QWORD *)-[PFUbiquityPeerRangeCache createGlobalObjectIDForManagedObjectID:](v33, v42);
          if (!v43)
            break;
          v44 = [PFUbiquityTransactionEntry alloc];
          if (self && (v45 = self->_stack) != 0)
            v46 = v45->_metadataMOC;
          else
            v46 = 0;
          v47 = -[PFUbiquityTransactionEntry initAndInsertIntoManagedObjectContext:](v44, "initAndInsertIntoManagedObjectContext:", v46);
          v48 = v47;
          if (self)
            storeMetadata = self->_storeMetadata;
          else
            storeMetadata = 0;
          objc_msgSend(v47, "setStoreMetadata:", storeMetadata);
          objc_msgSend(v48, "setTransactionDate:", v174);
          -[PFUbiquityTransactionEntry setTransactionType:](v48, 3);
          objc_msgSend(v48, "setKnowledgeVectorString:", v176);
          v50 = (void *)objc_msgSend(v42, "_retainedURIString");
          objc_msgSend(v48, "setLocalIDStr:", v50);

          v51 = -[PFUbiquityGlobalObjectID createGlobalIDString](v43);
          objc_msgSend(v48, "setGlobalIDStr:", v51);

          ++v40;
          v41 = v38;
          if (v37 == v40)
          {
            v52 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
            v37 = v52;
            v53 = 1;
            if (!v52)
            {
              v20 = v164;
              goto LABEL_86;
            }
            goto LABEL_58;
          }
        }
        v20 = v164;
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nNo global ID for managed object ID: %@"), "-[PFUbiquityStoreMetadataMedic addTransactionHistoryEntriesForObjectIDs:withImportContext:error:]", 302, a1, v42);
        goto LABEL_83;
      }
      v38 = 0;
      v53 = 1;
LABEL_86:

      objc_msgSend(v38, "drain");
LABEL_87:

      if (!v53)
        goto LABEL_96;
      ++v171;
    }
    while (v171 != v166);
    v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
  }
  while (v29);
  v53 = 1;
LABEL_96:
  v17 = v163;
LABEL_102:

LABEL_103:
  if (v53)
  {
    v64 = 1;
  }
  else if (v202)
  {
    v64 = 0;
    v187 = v202;
  }
  else
  {
    v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
    v72 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
      v211 = 1024;
      v212 = 247;
      _os_log_fault_impl(&dword_18A253000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    v64 = 0;
  }

  if (!v64)
    goto LABEL_253;
  v201 = 0;
  v73 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a1[1], a1[2]);
  v74 = +[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v73, &v201);
  v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  if (!v74)
  {
    v76 = 0;
    goto LABEL_269;
  }
  v75 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)a1[2], (uint64_t)&v201);
  v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v75)
  {
LABEL_269:
    v177 = 0;
    v87 = 0;
    v98 = 0;
    v90 = 0;
    goto LABEL_273;
  }
  v172 = v73;
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v198;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v198 != v78)
          objc_enumerationMutation(v75);
        v80 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * v79);
        if (v80)
        {
          v81 = *(_DWORD *)(v80 + 24);
          v82 = v81 > 0x1A;
          v83 = (1 << v81) & 0x4600000;
          v84 = v82 || v83 == 0;
          if (!v84 && objc_msgSend(*(id *)(v80 + 40), "isEqualToString:", a1[3]))
          {
            v85 = self ? self->_storeMetadata : 0;
            if (objc_msgSend(*(id *)(v80 + 48), "isEqualToString:", -[PFUbiquityStoreMetadata modelVersionHashString](v85, "modelVersionHashString")))objc_msgSend(v76, "addObject:", v80);
          }
        }
        ++v79;
      }
      while (v77 != v79);
      v86 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
      v77 = v86;
    }
    while (v86);
  }

  v177 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v87 = 0;
  v88 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
  if (!v88)
  {
    v98 = 0;
    v90 = 1;
    goto LABEL_273;
  }
  v89 = *(_QWORD *)v194;
  v90 = 1;
  while (2)
  {
    v91 = 0;
LABEL_135:
    if (*(_QWORD *)v194 != v89)
      objc_enumerationMutation(v76);
    v92 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * v91);
    if (v87)
      objc_msgSend(v87, "drain");
    v87 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (!v92
      || ((v93 = *(_DWORD *)(v92 + 24), v82 = v93 > 0x1A, v94 = (1 << v93) & 0x4600000, !v82)
        ? (v95 = v94 == 0)
        : (v95 = 1),
          v95))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ skipping non-transaction log location returned from sub locations: %@"), "-[PFUbiquityStoreMetadataMedic recoverTransactionLogMetadataWithImportContext:error:]", 383, a1, v92);
LABEL_227:
      if (v88 == ++v91)
      {
        v140 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
        v88 = v140;
        if (!v140)
        {
          v98 = 0;
          goto LABEL_271;
        }
        continue;
      }
      goto LABEL_135;
    }
    break;
  }
  if (self && (v96 = self->_cacheWrapper) != 0)
    transactionLogCache = (uint64_t)v96->_transactionLogCache;
  else
    transactionLogCache = 0;
  v98 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](transactionLogCache, v92, 1, &v201);
  if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v98, &v201))
  {
    v90 = 0;
    goto LABEL_224;
  }
  if (v98)
    p_isa = (id *)&v98->_knowledgeVector->super.isa;
  else
    p_isa = 0;
  if (self)
    v101 = (uint64_t)self->_kv;
  else
    v101 = 0;
  v90 = 1;
  if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, v101) & 1) == 0)
  {
    v102 = v98 ? v98->_knowledgeVector : 0;
    v103 = self ? self->_kv : 0;
    if (!-[PFUbiquityKnowledgeVector isEqual:](v102, "isEqual:", v103))
    {
LABEL_224:
      if (self)
      {
        objc_setProperty_nonatomic(self, v99, 0, 56);
        objc_setProperty_nonatomic(self, v138, 0, 64);
      }

      goto LABEL_227;
    }
  }
  if (self)
    objc_setProperty_nonatomic(self, v99, v98, 56);
  if (v98 && (saveSnapshot = v98->_saveSnapshot) != 0)
    v105 = (void *)-[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", a1[3]);
  else
    v105 = 0;
  if (self)
    objc_setProperty_nonatomic(self, v99, v105, 64);
  v106 = (void *)objc_msgSend(v177, "objectForKey:", *(_QWORD *)(v92 + 32));
  if (!v106)
  {
    if (self && (v107 = self->_stack) != 0)
      v108 = v107->_metadataMOC;
    else
      v108 = 0;
    v106 = (void *)+[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, *(void **)(v92 + 32), v108, 1);
    objc_msgSend(v177, "setObject:forKey:", v106, *(_QWORD *)(v92 + 32));
  }
  -[PFUbiquityImportContext setActingPeer:](self, v106);
  if (self && (v109 = self->_cacheWrapper) != 0)
    v110 = (uint64_t)v109->_peerRangeCache;
  else
    v110 = 0;
  if (-[PFUbiquityPeerRangeCache cachePeerRanges:](v110))
  {
    if (self)
    {
      if (v110)
      {
        storeSaveSnapshot = self->_storeSaveSnapshot;
        if (storeSaveSnapshot)
          globalObjectIDs = storeSaveSnapshot->_globalObjectIDs;
        else
          globalObjectIDs = 0;
        goto LABEL_178;
      }
      globalObjectIDs = 0;
LABEL_242:
      v115 = 1;
    }
    else
    {
      globalObjectIDs = 0;
      if (!v110)
        goto LABEL_242;
LABEL_178:
      v113 = (NSMutableArray *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](v110, (uint64_t)globalObjectIDs, 0, &v201);
      globalObjectIDs = v113;
      v115 = v113 == 0;
      if (self && v113)
      {
        objc_setProperty_nonatomic(self, v114, v113, 72);
        v115 = 0;
      }
    }

    if (!v115)
    {
      if (self)
      {
        v123 = self->_kv;
        v124 = v123 ? (uint64_t)-[NSDictionary objectForKey:](v123->_kv, "objectForKey:", *(_QWORD *)(v92 + 32)) : 0;
        v125 = v124 ? (void *)v124 : v175;
        transactionLog = self->_transactionLog;
        if (transactionLog && (knowledgeVector = transactionLog->_knowledgeVector) != 0)
          v128 = -[NSDictionary objectForKey:](knowledgeVector->_kv, "objectForKey:", *(_QWORD *)(v92 + 32));
        else
          v128 = 0;
      }
      else
      {
        v128 = 0;
        v125 = v175;
      }
      if (objc_msgSend(v125, "compare:", v128) == -1)
      {
        if (self)
        {
          objc_setProperty_nonatomic(self, v129, 0, 56);
          objc_setProperty_nonatomic(self, v139, 0, 64);
        }

        v90 = 1;
        goto LABEL_227;
      }
    }
  }
  v202 = 0;
  if (-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v98, &v202))
  {
    if (self && (v116 = self->_storeSaveSnapshot) != 0)
      insertedObjects = v116->_insertedObjects;
    else
      insertedObjects = 0;

    if (-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v98, &v202))
    {
      if (self && (v118 = self->_storeSaveSnapshot) != 0)
        updatedObjects = v118->_updatedObjects;
      else
        updatedObjects = 0;

      if (-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v98, &v202))
      {
        if (self && (v120 = self->_storeSaveSnapshot) != 0)
          deletedObjects = v120->_deletedObjects;
        else
          deletedObjects = 0;

        v122 = 1;
        goto LABEL_220;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the deleted objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now."), "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 515, a1, v98, v202, objc_msgSend(v202, "userInfo"));
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the updated objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now."), "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 518, a1, v98, v202, objc_msgSend(v202, "userInfo"));
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the inserted objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now."), "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 521, a1, v98, v202, objc_msgSend(v202, "userInfo"));
  }
  if (v202)
  {
    v122 = 0;
    v201 = v202;
  }
  else
  {
    v130 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v130, v131, v132, v133, v134, v135, v136, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
    v137 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
      v211 = 1024;
      v212 = 525;
      _os_log_fault_impl(&dword_18A253000, v137, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    v122 = 0;
  }
LABEL_220:

  if (v122)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully rebuilt metadata for log: %@"), "-[PFUbiquityStoreMetadataMedic recoverTransactionLogMetadataWithImportContext:error:]", 435, v98);
    v90 = 1;
    goto LABEL_224;
  }
  v90 = 0;
LABEL_271:
  v73 = v172;
LABEL_273:
  if ((v90 & 1) == 0 && v201)
    v153 = v201;
  objc_msgSend(v87, "drain");
  if ((v90 & 1) == 0)
  {
    v154 = v201;
    if (v201)
    {
      v187 = v201;
    }
    else
    {
      v155 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v155, v156, v157, v158, v159, v160, v161, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
      v162 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
        v211 = 1024;
        v212 = 466;
        _os_log_fault_impl(&dword_18A253000, v162, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  _Block_object_dispose(&v181, 8);
  if ((v90 & 1) == 0)
  {
LABEL_254:
    v141 = 0;
    goto LABEL_255;
  }
  v141 = objc_msgSend(v173[1], "save:", &v187);
LABEL_255:
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFinished."), "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 166, a1, a1[4]);
  v62 = 1;
  v63 = v165;
  if ((v141 & 1) == 0)
  {
LABEL_259:
    if (v187)
    {
      if (v168)
      {
        v142 = 0;
        *v168 = v187;
        goto LABEL_265;
      }
    }
    else
    {
      v143 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v143, v144, v145, v146, v147, v148, v149, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
      v150 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v205 = 136315394;
        v206 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
        v207 = 1024;
        v208 = 169;
        _os_log_fault_impl(&dword_18A253000, v150, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v205, 0x12u);
      }
    }
    v142 = 0;
    goto LABEL_265;
  }
  v142 = 1;
LABEL_265:

  v151 = v188;
  if (v62)
    v151 = v142;
  return v151 & 1;
}

id __57__PFUbiquityStoreMetadataMedic_recoverMetadataWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

@end
