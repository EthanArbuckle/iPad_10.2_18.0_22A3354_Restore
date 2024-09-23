@implementation _PFUbiquityRecordImportOperation

- (_PFUbiquityRecordImportOperation)init
{
  _PFUbiquityRecordImportOperation *v2;
  _PFUbiquityRecordImportOperation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PFUbiquityRecordImportOperation;
  v2 = -[PFUbiquityImportOperation init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_moc = 0;
    v2->_psc = 0;
    v2->_insertedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->_updatedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->_deletedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->_resolvedConflicts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_relationshipsToObjectIDsToCheck = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_lockedExistingCoord = 0;
    v3->_logScore = 0;
    v3->_initialStoreKnowledgeVector = 0;
    v3->_importContext = 0;
    v3->_updatedStoreKnowledgeVector = 0;
    v3->_transactionDidRollback = 0;
    v3->_operationError = 0;
    v3->_wroteKV = 0;
    v3->_success = 0;
  }
  return v3;
}

- (uint64_t)initWithTransactionLog:(uint64_t)a3 persistentStore:(uint64_t)a4 andLocalPeerID:
{
  uint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  if (a2)
  {
    v5 = a2[3];
    if (v5 && *(_DWORD *)(v5 + 24) != 1)
      v5 = *(_QWORD *)(v5 + 8);
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(a1, "initWithPersistentStore:localPeerID:andUbiquityRootLocation:", a3, a4, v5);
  if (v6)
    *(_QWORD *)(v6 + 320) = a2;
  return v6;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  -[_PFUbiquityRecordImportOperation setDelegate:](self, "setDelegate:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_transactionLog = 0;
  self->_insertedObjectIDs = 0;

  self->_updatedObjectIDs = 0;
  self->_deletedObjectIDs = 0;

  self->_resolvedConflicts = 0;
  self->_relationshipsToObjectIDsToCheck = 0;

  self->_importContext = 0;
  self->_operationError = 0;
  objc_setProperty_nonatomic(self, v3, 0, 360);
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordImportOperation;
  -[PFUbiquityImportOperation dealloc](&v4, sel_dealloc);
}

- (id)copy
{
  return (id)-[_PFUbiquityRecordImportOperation initWithTransactionLog:persistentStore:andLocalPeerID:]([_PFUbiquityRecordImportOperation alloc], &self->_transactionLog->super.isa, (uint64_t)self->super._store, (uint64_t)self->super._localPeerID);
}

- (void)cancel
{
  PFUbiquityTransactionLog *transactionLog;
  id v4;
  PFUbiquityTransactionLog *v5;
  PFUbiquityLocation *transactionLogLocation;
  void *v7;
  void *v8;
  PFUbiquityLocation *ubiquityRootLocation;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_PFUbiquityRecordImportOperation;
  -[PFUbiquityImportOperation cancel](&v10, sel_cancel);
  transactionLog = self->_transactionLog;
  if (transactionLog && transactionLog->_transactionLogLocation)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D20]);
    v5 = self->_transactionLog;
    if (v5)
      transactionLogLocation = v5->_transactionLogLocation;
    else
      transactionLogLocation = 0;
    v7 = (void *)objc_msgSend(v4, "initWithObjects:", transactionLogLocation, 0);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    ubiquityRootLocation = self->super._ubiquityRootLocation;
    v11 = CFSTR("PFLogLocationsKey");
    v12[0] = v7;
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PFUbiquityLocationImportCancelledNotification"), ubiquityRootLocation, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));

  }
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  -[PFUbiquityImportOperation setDelegate:](&v3, sel_setDelegate_, a3);
}

- (_PFUbiquityRecordImportOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  return (_PFUbiquityRecordImportOperationDelegate *)-[PFUbiquityImportOperation delegate](&v3, sel_delegate);
}

- (id)retainedDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  return -[PFUbiquityImportOperation retainedDelegate](&v3, sel_retainedDelegate);
}

- (void)notifyDelegateOfError:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    v4 = (void *)objc_msgSend(a1, "retainedDelegate");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "operation:failedWithError:", a1, a2);
      v4 = v5;
    }

  }
}

- (uint64_t)applyChangesFromStoreSaveSnapshot:(_QWORD *)a3 withImportContext:(_QWORD *)a4 withError:
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  if (a3 && (v8 = a3[11]) != 0)
    v9 = *(_QWORD *)(v8 + 40);
  else
    v9 = 0;
  v10 = 1;
  if (!-[PFUbiquityPeerRangeCache cachePeerRanges:](v9))
    goto LABEL_19;
  if (!*(_QWORD *)(a1 + 304))
  {
    *(_QWORD *)(a1 + 304) = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
    objc_msgSend(*(id *)(a1 + 304), "setMergePolicy:", NSMergeByPropertyStoreTrumpMergePolicy);
    objc_msgSend(*(id *)(a1 + 304), "setPersistentStoreCoordinator:", *(_QWORD *)(a1 + 312));
    v11 = *(_QWORD *)(a1 + 304);
    if (v11)
    {
      *(_QWORD *)(v11 + 40) &= ~0x100000uLL;
      v12 = *(void **)(a1 + 304);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v12, "_setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 304), "setUndoManager:", 0);
  }
  if (v9)
  {
    if (a2)
      v13 = a2[3];
    else
      v13 = 0;
    v15 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](v9, v13, 0, &v29);
    if (v15)
    {
      if (a3)
        objc_setProperty_nonatomic(a3, v14, v15, 72);
      if (-[PFUbiquityImportContext prefetchManagedObjectsInContext:error:]((uint64_t)a3, *(void **)(a1 + 304), &v29))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully prefetched managed objects."), "-[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]", 201, a1);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Error pre-fetching managed objects: %@\n User Info: %@\nThe operation will attempt to continue, but may fail if it cannot talk to the database."), "-[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]", 203, a1, v29, objc_msgSend(v29, "userInfo"));
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
LABEL_19:
    v10 = 0;
    v15 = 0;
  }

  if (v10
    && (objc_msgSend((id)a1, "isCancelled") & 1) == 0
    && -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](*(_QWORD *)(a1 + 320), &v29)
    && (objc_msgSend((id)a1, "isCancelled") & 1) == 0)
  {
    v16 = a2 ? (void *)a2[11] : 0;
    if (-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v16, 0, a3, &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0&& -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:](*(_QWORD *)(a1 + 320), &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0)
    {
      v17 = a2 ? (void *)a2[12] : 0;
      if (-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v17, 1, a3, &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0&& -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:](*(_QWORD *)(a1 + 320), &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0)
      {
        if (a2)
          v18 = (void *)a2[13];
        else
          v18 = 0;
        -[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v18, 2, a3, &v29);
      }
    }
  }
  if (!-[PFUbiquityTransactionLog releaseContents:](*(_QWORD *)(a1 + 320)))
  {
    if (v29)
    {
      if (a4)
      {
        v19 = 0;
        *a4 = v29;
        goto LABEL_50;
      }
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m";
        v32 = 1024;
        v33 = 241;
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v19 = 0;
    goto LABEL_50;
  }
  v19 = 1;
LABEL_50:

  return v19;
}

- (uint64_t)processObjects:(uint64_t)a3 withState:(_QWORD *)a4 andImportContext:(_QWORD *)a5 outError:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  PFUbiquityTransactionEntryLight *v32;
  const char *v33;
  PFUbiquityTransactionEntryLight *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  SEL v38;
  PFUbiquityGlobalObjectID *globalID;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  PFUbiquityRecordImportConflict *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  SEL v61;
  void *v62;
  void *v63;
  _QWORD *v64;
  const char *v65;
  SEL v66;
  void *v67;
  SEL v68;
  const char *v69;
  id v70;
  uint64_t v71;
  void *v72;
  NSArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  id v82;
  NSArray *v83;
  uint64_t v84;
  uint64_t j;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  int v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v151;
  id obj;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *newValue;
  id newValuea;
  void *v163;
  uint64_t v164;
  void *v165;
  NSArray *v166;
  id v167;
  id v168;
  uint64_t v169;
  void *v170;
  NSManagedObject *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[5];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  id v193;
  char v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  const __CFString *v210;
  uint64_t v211;
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE buf[12];
  __int16 v216;
  int v217;
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a2 || !objc_msgSend(a2, "count"))
  {

    v129 = 1;
    return v129 & 1;
  }
  v193 = 0;
  v168 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = *(_QWORD *)(a1 + 320);
  v151 = a2;
  if (v8)
  {
    v9 = *(_QWORD *)(v8 + 72);
    v10 = *(_QWORD *)(v8 + 24);
    if (v10)
    {
      v11 = *(_QWORD *)(v10 + 40);
      if (v9)
      {
LABEL_6:
        v158 = objc_msgSend(*(id *)(v9 + 40), "objectForKey:", v11);
        goto LABEL_7;
      }
    }
    else
    {
      v11 = 0;
      if (v9)
        goto LABEL_6;
    }
  }
  v158 = 0;
LABEL_7:
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  obj = (id)objc_msgSend(a2, "allKeys");
  v156 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
  if (!v156)
    goto LABEL_199;
  v154 = *(_QWORD *)v190;
LABEL_9:
  v164 = 0;
LABEL_10:
  if (*(_QWORD *)v190 != v154)
    objc_enumerationMutation(obj);
  v12 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v164);
  v13 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v158, v12);
  v14 = (void *)v13;
  if (!v13 || (v15 = *(void **)(v13 + 48)) == 0)
  {
    if (a4)
      v16 = (void *)a4[9];
    else
      v16 = 0;
    v17 = (void *)objc_msgSend(v16, "objectForKey:", v14);
    if (!v17)
    {
      v146 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: Ubiquity: Could not find local URI for global ID index: %@"), v12);
      v147 = (void *)MEMORY[0x1E0C99DA0];
      v210 = CFSTR("PFUbiquitySetupDoFork");
      v211 = MEMORY[0x1E0C9AAB0];
      v148 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
      objc_exception_throw((id)objc_msgSend(v147, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v146, v148));
    }
    v15 = (void *)objc_msgSend(*(id *)(a1 + 312), "managedObjectIDFromUTF8String:length:", objc_msgSend(v17, "UTF8String"), objc_msgSend(v17, "lengthOfBytesUsingEncoding:", 4));
    if (v14)
      objc_setProperty_nonatomic(v14, v18, v15, 48);
  }
  if (a4 && (v19 = a4[11]) != 0)
    v20 = *(_QWORD *)(v19 + 56);
  else
    v20 = 0;
  v21 = (void *)-[PFUbiquityTransactionHistoryCache cachedTransactionHistoryForGlobalID:](v20, (uint64_t)v14);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    v22 = *(_QWORD *)(a1 + 400);
    if (v22)
      v22 = *(_QWORD *)(v22 + 32);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot transaction history: %@\nFor object: %@\nObject ID: %@\nInitial KV: %@\nImport Context: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 825, a1, v21, v14, v15, *(_QWORD *)(a1 + 384), v22);
  }
  newValue = v14;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v21, 0);
  objc_msgSend(v23, "sortUsingComparator:", &__block_literal_global_24);
  v188[0] = MEMORY[0x1E0C809B0];
  v188[1] = 3221225472;
  v188[2] = __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke_2;
  v188[3] = &unk_1E1EE0A00;
  v188[4] = a4;
  objc_msgSend(v23, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v188));
  v24 = objc_msgSend(v23, "count");
  LODWORD(v25) = a3;
  if (v24)
  {
    v26 = objc_msgSend(v23, "lastObject");
    buf[0] = 0;
    v25 = +[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]((uint64_t)PFUbiquityRecordImportConflict, a3, v26, buf);
    if (buf[0])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSkipping object: %@\nResolved type: %d / %d"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 843, a1, v26, v25, a3);

      goto LABEL_31;
    }
  }

  if ((_DWORD)v25)
  {
    if (v25 > 2)
    {
      v171 = 0;
    }
    else
    {
      if (a4)
        v27 = (void *)a4[10];
      else
        v27 = 0;
      v171 = (NSManagedObject *)objc_msgSend(v27, "objectForKey:", newValue);
      if (!v171)
      {
        v171 = (NSManagedObject *)objc_msgSend(*(id *)(a1 + 304), "existingObjectWithID:error:", v15, &v193);
        if (!v171)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Unable to locate updated or deleted object with ID: %@, translated from global ID: %@, error: %@\n User Info: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 883, *(_QWORD *)(a1 + 320), newValue, v12, v193, objc_msgSend(v193, "userInfo"));
          if ((_DWORD)v25 == 2)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nObject (%@): %@ was resolved to a delete and will not be processed."), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 887, a1, obj, newValue);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log: %@ appears an updated object: %@ was deleted."), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 889, a1, newValue);
          }
          v171 = 0;
          LODWORD(v25) = 2;
        }
      }
    }
  }
  else
  {
    if (newValue)
      v28 = newValue[2];
    else
      v28 = 0;
    v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 312), "managedObjectModel"), "entitiesByName"), "objectForKey:", v28);
    if (!v29)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Can't find entity for name: %@ in model: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 856, *(_QWORD *)(a1 + 320), v28, objc_msgSend(*(id *)(a1 + 312), "managedObjectModel"));
      goto LABEL_31;
    }
    v171 = (NSManagedObject *)objc_msgSend(*(id *)(a1 + 304), "objectRegisteredForID:", v15);
    if (v171)
    {
      objc_msgSend(*(id *)(a1 + 304), "insertObject:");
    }
    else
    {
      v171 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", v29, *(_QWORD *)(a1 + 304));
      v30 = *(_QWORD **)(a1 + 304);
      v31 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v171);

    }
    LODWORD(v25) = 0;
  }
  if (!objc_msgSend((id)a1, "isCancelled"))
  {
    v153 = v15;
    v32 = objc_alloc_init(PFUbiquityTransactionEntryLight);
    v34 = v32;
    v35 = *(_QWORD *)(a1 + 320);
    if (v35 && (v36 = *(_QWORD *)(v35 + 24)) != 0)
    {
      v37 = *(void **)(v36 + 32);
      if (!v32)
        goto LABEL_60;
    }
    else
    {
      v37 = 0;
      if (!v32)
        goto LABEL_60;
    }
    objc_setProperty_nonatomic(v32, v33, v37, 24);
    objc_setProperty_nonatomic(v34, v38, newValue, 8);
    globalID = v34->_globalID;
    if (globalID)
      objc_setProperty_nonatomic(globalID, v33, v153, 48);
LABEL_60:
    v40 = *(_QWORD *)(a1 + 320);
    if (v40)
    {
      v41 = *(void **)(v40 + 24);
      if (!v34)
      {
LABEL_63:
        if (a4 && (v42 = a4[8]) != 0)
          v43 = *(_QWORD *)(v42 + 120);
        else
          v43 = 0;
        -[PFUbiquityTransactionEntryLight setTransactionNumber:](v34, "setTransactionNumber:", v43);
        if (a4)
        {
          v45 = (void *)a4[4];
          if (!v34)
          {
LABEL_69:
            v46 = *(_QWORD *)(a1 + 320);
            if (v46 && (v47 = *(_QWORD *)(v46 + 72)) != 0)
              v48 = *(_QWORD *)(v47 + 8);
            else
              v48 = 0;
            -[PFUbiquityTransactionEntryLight setTransactionDate:](v34, "setTransactionDate:", v48);
            v50 = *(_QWORD *)(a1 + 320);
            if (v50 && (v51 = *(_QWORD *)(v50 + 24)) != 0)
            {
              v52 = *(void **)(v51 + 40);
              if (!v34)
                goto LABEL_76;
            }
            else
            {
              v52 = 0;
              if (!v34)
              {
LABEL_76:
                if (a4 && (v53 = a4[11]) != 0)
                  v54 = *(_QWORD *)(v53 + 56);
                else
                  v54 = 0;
                -[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:](v54, v34, 1);

                if (!v171)
                {
                  if ((_DWORD)v25 == 2)
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Object (%d): %@ which resolved to a delete but appears to already have been deleted from the local store."), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 917, v24 != 0, newValue);
                    }
                    goto LABEL_31;
                  }
                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Transaction log: %@\n Error creating object to work with (with state: %d), skipping %@, globalID: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 921, *(_QWORD *)(a1 + 320), a3, newValue, v12);
                  }
                  if (v193)
                  {
                    if (a5)
                      *a5 = v193;
                  }
                  else
                  {
                    v130 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                    _NSCoreDataLog(17, v130, v131, v132, v133, v134, v135, v136, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
                    v137 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquit"
                                           "y/_PFUbiquityRecordImportOperation.m";
                      v216 = 1024;
                      v217 = 922;
                      _os_log_fault_impl(&dword_18A253000, v137, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                    }
                  }
LABEL_274:
                  v194 = 0;
                  if (v193)
                  {
                    if (a5)
                    {
                      v127 = 0;
                      v128 = 0;
                      *a5 = v193;
                      goto LABEL_283;
                    }
                  }
                  else
                  {
                    v138 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                    _NSCoreDataLog(17, v138, v139, v140, v141, v142, v143, v144, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
                    v145 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquit"
                                           "y/_PFUbiquityRecordImportOperation.m";
                      v216 = 1024;
                      v217 = 1075;
                      _os_log_fault_impl(&dword_18A253000, v145, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                    }
                  }
                  v127 = 0;
                  v128 = 0;
                  goto LABEL_283;
                }
                if (v25 > 1)
                {
                  if ((_DWORD)v25 == 2)
                  {
                    if ((objc_msgSend(*(id *)(a1 + 352), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)objc_msgSend(*(id *)(a1 + 352), "addObject:", -[NSManagedObject objectID](v171, "objectID"));
                    objc_msgSend(*(id *)(a1 + 304), "deleteObject:", v171);
                  }
                  goto LABEL_31;
                }
                v173 = (void *)objc_msgSend(v151, "objectForKey:", v12);
                if (!v173
                  && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot nil content for comprssed globalID Index: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 934, a1, v12);
                }
                if (v24)
                {
                  v55 = objc_alloc_init(PFUbiquityRecordImportConflict);
                  v57 = (uint64_t)v55;
                  v58 = *(_QWORD *)(a1 + 320);
                  if (v58 && (v59 = *(_QWORD *)(v58 + 72)) != 0)
                  {
                    v60 = *(void **)(v59 + 8);
                    if (v55)
                      goto LABEL_88;
                  }
                  else
                  {
                    v60 = 0;
                    if (v55)
                    {
LABEL_88:
                      objc_setProperty_nonatomic(v55, v56, v60, 56);
                      objc_setProperty_nonatomic((id)v57, v61, v171, 16);
                      *(_DWORD *)(v57 + 48) = a3;
                    }
                  }
                  if (a4)
                  {
                    v62 = (void *)a4[4];
                    if (v57)
                      goto LABEL_91;
                  }
                  else
                  {
                    v62 = 0;
                    if (v57)
LABEL_91:
                      objc_setProperty_nonatomic((id)v57, v56, v62, 32);
                  }
                  if (a4)
                  {
                    v63 = (void *)a4[5];
                    if (v57)
                      goto LABEL_94;
                  }
                  else
                  {
                    v63 = 0;
                    if (v57)
LABEL_94:
                      objc_setProperty_nonatomic((id)v57, v56, v63, 40);
                  }
                  v64 = -[PFUbiquityTransactionLog transactionNumber](*(_QWORD **)(a1 + 320));
                  if (v57)
                  {
                    objc_setProperty_nonatomic((id)v57, v65, v64, 64);
                    objc_setProperty_nonatomic((id)v57, v66, v21, 72);
                  }
                  if (a4)
                  {
                    v67 = (void *)a4[9];
                    if (v57)
                      goto LABEL_99;
                  }
                  else
                  {
                    v67 = 0;
                    if (v57)
                    {
LABEL_99:
                      objc_setProperty_nonatomic((id)v57, v65, v67, 80);
                      objc_setProperty_nonatomic((id)v57, v68, a4, 88);
                    }
                  }
                  v70 = -[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:](v57, v173, *(_QWORD *)(a1 + 320));
                  if (v57)
                    objc_setProperty_nonatomic((id)v57, v69, v70, 24);

                  *(_QWORD *)buf = 0;
                  if (-[PFUbiquityRecordImportConflict resolveConflict:](v57, buf))
                  {
                    if (v57)
                      v71 = *(_QWORD *)(v57 + 96);
                    else
                      v71 = 0;
                    objc_msgSend(*(id *)(a1 + 424), "addEntriesFromDictionary:", v71);

                    goto LABEL_106;
                  }
                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered trying to resolve conflict: %@, error: %@\n User Info: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 959, v57, *(_QWORD *)buf, objc_msgSend(*(id *)buf, "userInfo"));
                  }
                  v193 = *(id *)buf;

                  goto LABEL_274;
                }
                v203 = 0u;
                v204 = 0u;
                v205 = 0u;
                v206 = 0u;
                v73 = -[NSDictionary allValues](-[NSEntityDescription attributesByName](-[NSManagedObject entity](v171, "entity"), "attributesByName"), "allValues");
                v74 = -[NSArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v203, buf, 16);
                if (!v74)
                  goto LABEL_137;
                v75 = *(_QWORD *)v204;
                while (1)
                {
                  for (i = 0; i != v74; ++i)
                  {
                    if (*(_QWORD *)v204 != v75)
                      objc_enumerationMutation(v73);
                    v77 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
                    v78 = objc_msgSend(v77, "name");
                    v79 = (void *)objc_msgSend(v173, "valueForKey:", v78);
                    v80 = v79;
                    if (v79)
                    {
                      if (objc_msgSend(v77, "attributeType") == 1800)
                      {

                        v80 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v79, v77);
                      }
                      if (objc_msgSend(v77, "attributeType") == 1000
                        && objc_msgSend(v77, "allowsExternalBinaryDataStorage")
                        && (v81 = -[NSManagedObjectID persistentStore](-[NSManagedObject objectID](v171, "objectID"), "persistentStore"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {

                        v82 = -[_PFExternalReferenceData initForUbiquityDictionary:store:]([_PFExternalReferenceData alloc], "initForUbiquityDictionary:store:", v79, v81);
                        v80 = v82;
                      }
                      else
                      {
                        v82 = v80;
                      }
                    }
                    else
                    {
                      if ((objc_msgSend(v77, "isTransient") & 1) != 0)
                        goto LABEL_135;
                      v82 = 0;
                    }
                    -[NSManagedObject setValue:forKey:](v171, "setValue:forKey:", v82, v78);
LABEL_135:

                  }
                  v74 = -[NSArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v203, buf, 16);
                  if (!v74)
                  {
LABEL_137:
                    v201 = 0u;
                    v202 = 0u;
                    v199 = 0u;
                    v200 = 0u;
                    v83 = -[NSDictionary allValues](-[NSEntityDescription relationshipsByName](-[NSManagedObject entity](v171, "entity"), "relationshipsByName"), "allValues");
                    v84 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v199, v214, 16);
                    if (v84)
                    {
                      v169 = *(_QWORD *)v200;
                      v166 = v83;
                      do
                      {
                        for (j = 0; j != v84; ++j)
                        {
                          if (*(_QWORD *)v200 != v169)
                            objc_enumerationMutation(v166);
                          v86 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * j);
                          v87 = objc_msgSend(v86, "name");
                          v88 = (void *)objc_msgSend(v173, "valueForKey:", v87);
                          if (v88)
                          {
                            v89 = (id)objc_msgSend(v168, "objectForKey:", newValue);
                            if (!v89)
                            {
                              v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                              objc_msgSend(v168, "setObject:forKey:", v89, newValue);

                            }
                            v90 = (id)objc_msgSend(v89, "objectForKey:", v87);
                            if (!v90)
                            {
                              v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                              objc_msgSend(v89, "setObject:forKey:", v90, v87);

                            }
                            if (objc_msgSend(v86, "isToMany"))
                              v91 = v88;
                            else
                              v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v88, 0);
                            v92 = v91;
                            v197 = 0u;
                            v198 = 0u;
                            v195 = 0u;
                            v196 = 0u;
                            v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v195, v213, 16);
                            if (v93)
                            {
                              v94 = *(_QWORD *)v196;
                              do
                              {
                                v95 = 0;
                                do
                                {
                                  if (*(_QWORD *)v196 != v94)
                                    objc_enumerationMutation(v92);
                                  if (a4)
                                    v96 = a4[8];
                                  else
                                    v96 = 0;
                                  objc_msgSend(v90, "addObject:", -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v96, *(void **)(*((_QWORD *)&v195 + 1) + 8 * v95++)));
                                }
                                while (v93 != v95);
                                v97 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v195, v213, 16);
                                v93 = v97;
                              }
                              while (v97);
                            }

                          }
                          else if ((objc_msgSend(v86, "isTransient") & 1) == 0)
                          {
                            -[NSManagedObject setValue:forKey:](v171, "setValue:forKey:", 0, v87);
                          }
                        }
                        v84 = -[NSArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v199, v214, 16);
                      }
                      while (v84);
                    }
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ successfully applied changes for object with global id: %@\nObject ID: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 970, a1, newValue, v153);
                    }
LABEL_106:
                    if ((_DWORD)a3 == 1)
                    {
                      if ((objc_msgSend(*(id *)(a1 + 344), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)objc_msgSend(*(id *)(a1 + 344), "addObject:", -[NSManagedObject objectID](v171, "objectID"));
                    }
                    else if (!(_DWORD)a3
                           && (objc_msgSend(*(id *)(a1 + 336), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)
                    {
                      objc_msgSend(*(id *)(a1 + 336), "addObject:", -[NSManagedObject objectID](v171, "objectID"));
                      if (a4)
                        v72 = (void *)a4[10];
                      else
                        v72 = 0;
                      objc_msgSend(v72, "setObject:forKey:", v171, newValue);
                    }
LABEL_31:
                    if (++v164 == v156)
                    {
                      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
                      v156 = v98;
                      if (!v98)
                      {
LABEL_199:
                        v186 = 0u;
                        v187 = 0u;
                        v184 = 0u;
                        v185 = 0u;
                        v99 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v184, v209, 16);
                        if (!v99)
                        {
                          v127 = 1;
                          v128 = 1;
                          goto LABEL_283;
                        }
                        v155 = v99;
                        v157 = *(_QWORD *)v185;
                        while (2)
                        {
                          v159 = 0;
LABEL_202:
                          if (*(_QWORD *)v185 != v157)
                            objc_enumerationMutation(v168);
                          if (a4)
                            v100 = (void *)a4[10];
                          else
                            v100 = 0;
                          v101 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v159);
                          v102 = (void *)objc_msgSend(v100, "objectForKey:", v101);
                          if (v102)
                          {
LABEL_207:
                            v103 = (void *)objc_msgSend(v168, "objectForKey:", v101);
                            v182 = 0u;
                            v183 = 0u;
                            v180 = 0u;
                            v181 = 0u;
                            v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v180, v208, 16);
                            if (v104)
                            {
                              v105 = *(id *)v181;
                              v163 = v103;
                              v165 = v102;
                              newValuea = *(id *)v181;
                              do
                              {
                                v172 = 0;
                                v167 = (id)v104;
                                do
                                {
                                  if (*(id *)v181 != v105)
                                    objc_enumerationMutation(v103);
                                  v174 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * v172);
                                  v106 = (void *)objc_msgSend(v103, "valueForKey:");
                                  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "entity"), "relationshipsByName"), "objectForKey:", v174), "isToMany"))
                                  {
                                    v170 = (void *)objc_msgSend(v102, "valueForKey:", v174);
                                    v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v106, "count"));
                                    v178 = 0u;
                                    v179 = 0u;
                                    v176 = 0u;
                                    v177 = 0u;
                                    v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v176, v207, 16);
                                    if (v108)
                                    {
                                      v109 = *(_QWORD *)v177;
                                      do
                                      {
                                        v110 = 0;
                                        do
                                        {
                                          if (*(_QWORD *)v177 != v109)
                                            objc_enumerationMutation(v106);
                                          if (a4)
                                            v111 = (void *)a4[10];
                                          else
                                            v111 = 0;
                                          v112 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * v110);
                                          v113 = objc_msgSend(v111, "objectForKey:", v112);
                                          if (v113)
                                          {
                                            objc_msgSend(v107, "addObject:", v113);
                                          }
                                          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:"))
                                          {
                                            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Unable to find relationship destination object: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1038, a1, v112);
                                          }
                                          ++v110;
                                        }
                                        while (v108 != v110);
                                        v114 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v176, v207, 16);
                                        v108 = v114;
                                      }
                                      while (v114);
                                    }
                                    v102 = v165;
                                    -[NSManagedObject _updateToManyRelationship:from:to:with:](v165, v174, v170, v107, v170);
                                    v105 = newValuea;
                                    v103 = v163;
                                    v104 = (uint64_t)v167;

                                  }
                                  else
                                  {
                                    v115 = objc_msgSend(v106, "lastObject");
                                    if (a4)
                                      v116 = (void *)a4[10];
                                    else
                                      v116 = 0;
                                    v117 = objc_msgSend(v116, "objectForKey:", v115);
                                    if (!v117)
                                    {
                                      if (a4 && (v118 = a4[11]) != 0)
                                        v119 = *(_QWORD *)(v118 + 56);
                                      else
                                        v119 = 0;
                                      v120 = objc_msgSend((id)-[PFUbiquityTransactionHistoryCache cachedTransactionHistoryForGlobalID:](v119, v115), "lastObject");
                                      if (v120)
                                      {
                                        if (*(_DWORD *)(v120 + 16) == 2)
                                        {
                                          v121 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "entity"), "relationshipsByName"), "objectForKey:", v174);
                                          if (objc_msgSend((id)objc_msgSend(v121, "inverseRelationship"), "deleteRule") == 2
                                            || (objc_msgSend(v121, "isOptional") & 1) == 0)
                                          {
                                            objc_msgSend(*(id *)(a1 + 304), "deleteObject:", v102);
                                          }
                                        }
                                      }
                                    }
                                    objc_msgSend(v102, "setValue:forKey:", v117, v174);
                                  }
                                  ++v172;
                                }
                                while (v172 != v104);
                                v122 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v180, v208, 16);
                                v104 = v122;
                              }
                              while (v122);
                            }
                          }
                          else
                          {
                            if (a4)
                              v123 = (void *)a4[9];
                            else
                              v123 = 0;
                            v124 = (void *)objc_msgSend(v123, "objectForKey:", v101);
                            if (v124)
                            {
                              v125 = objc_msgSend(*(id *)(a1 + 312), "managedObjectIDFromUTF8String:length:", objc_msgSend(v124, "UTF8String"), objc_msgSend(v124, "lengthOfBytesUsingEncoding:", 4));
                              *(_QWORD *)buf = 0;
                              v102 = (void *)objc_msgSend(*(id *)(a1 + 304), "existingObjectWithID:error:", v125, buf);
                              if (v102)
                                goto LABEL_207;
                              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                              {
                                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Couldn't find missing object for objectID: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1012, *(_QWORD *)(a1 + 320), v125);
                              }
                            }
                            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                            {
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Couldn't find missing object for objectID string: %@"), "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1004, *(_QWORD *)(a1 + 320), 0);
                            }
                          }
                          if (++v159 == v155)
                          {
                            v126 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v184, v209, 16);
                            v127 = 1;
                            v128 = 1;
                            v155 = v126;
                            if (!v126)
                              goto LABEL_283;
                            continue;
                          }
                          goto LABEL_202;
                        }
                      }
                      goto LABEL_9;
                    }
                    goto LABEL_10;
                  }
                }
              }
            }
            objc_setProperty_nonatomic(v34, v49, v52, 32);
            v34->_transactionType = v25;
            goto LABEL_76;
          }
        }
        else
        {
          v45 = 0;
          if (!v34)
            goto LABEL_69;
        }
        objc_setProperty_nonatomic(v34, v44, v45, 56);
        goto LABEL_69;
      }
    }
    else
    {
      v41 = 0;
      if (!v34)
        goto LABEL_63;
    }
    objc_setProperty_nonatomic(v34, v33, v41, 48);
    goto LABEL_63;
  }
  v128 = 0;
  v127 = 1;
  v194 = 1;
LABEL_283:

  v129 = v194;
  if (v128)
    v129 = v127;
  return v129 & 1;
}

- (void)main
{
  PFUbiquityTransactionLog *transactionLog;
  PFUbiquityLocation *transactionLogLocation;
  uint64_t storeName;
  PFUbiquitySwitchboardEntry *v6;
  char v7;
  PFUbiquityTransactionLog *v8;
  PFUbiquityLocation *v9;
  NSString *v10;
  id *v11;
  PFUbiquityTransactionLog *v12;
  PFUbiquityLocation *v13;
  NSString *v14;
  id v15;
  const char *v16;
  PFUbiquityImportContext *importContext;
  const char *v18;
  PFUbiquityImportContext *v19;
  PFUbiquityImportContext *v20;
  const char *v21;
  PFUbiquitySwitchboardEntry *entry;
  PFUbiquitySwitchboardEntryMetadata *v23;
  PFUbiquityBaselineHeuristics *baselineHeuristics;
  PFUbiquitySwitchboardEntryMetadata *metadata;
  PFUbiquitySwitchboardCacheWrapper *v26;
  PFUbiquityImportContext *v27;
  PFUbiquityTransactionLog *v28;
  PFUbiquityLocation *v29;
  NSString *exportingPeerID;
  const char *v31;
  PFUbiquityTransactionLog *v32;
  PFUbiquityLocation *v33;
  PFUbiquitySaveSnapshot *saveSnapshot;
  PFUbiquitySwitchboardCacheWrapper *cacheWrapper;
  uint64_t transactionHistoryCache;
  int v37;
  const char *v38;
  PFUbiquityTransactionLog *v39;
  PFUbiquityKnowledgeVector *v40;
  PFUbiquityImportContext *v41;
  NSPersistentStoreCoordinator *psc;
  const char *v43;
  PFUbiquityKnowledgeVector *initialStoreKnowledgeVector;
  PFUbiquityTransactionLog *v45;
  PFUbiquityLocation *v46;
  NSString *v47;
  id v48;
  id v49;
  void *v50;
  PFUbiquityKnowledgeVector *v51;
  PFUbiquityTransactionLog *v52;
  uint64_t knowledgeVector;
  PFUbiquityImportContext *v54;
  PFUbiquitySwitchboardCacheWrapper *v55;
  PFUbiquityTransactionHistoryCache *v56;
  char v57;
  PFUbiquityKnowledgeVector *cacheKV;
  const char *v59;
  int v60;
  PFUbiquityTransactionHistoryCache *v61;
  PFUbiquityKnowledgeVector *minCacheKV;
  PFUbiquityImportContext *v63;
  PFUbiquitySwitchboardCacheWrapper *v64;
  id Property;
  void *v66;
  _BOOL4 v67;
  PFUbiquityTransactionHistoryCache *v68;
  _PFUbiquityStack *v69;
  NSManagedObjectContext *v70;
  int v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  NSManagedObject *v80;
  NSManagedObject *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  PFUbiquityKnowledgeVector *v85;
  PFUbiquityKnowledgeVector *v86;
  unsigned int v87;
  const char *v88;
  SEL v89;
  PFUbiquityStoreMetadataMedic *v90;
  PFUbiquityTransactionLog *v91;
  PFUbiquityLocation *v92;
  NSString *v93;
  id *v94;
  PFUbiquityTransactionLog *v95;
  PFUbiquityLocation *v96;
  NSString *v97;
  id v98;
  const char *v99;
  SEL v100;
  uint64_t v101;
  int v102;
  PFUbiquityTransactionLog *v103;
  PFUbiquityLocation *v104;
  NSString *v105;
  _PFUbiquityStack *stack;
  NSManagedObjectContext *metadataMOC;
  PFUbiquityPeerState *v108;
  PFUbiquityPeerState *v109;
  NSNumber *transactionNumber;
  PFUbiquityTransactionLog *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  PFUbiquityKnowledgeVector *updatedStoreKnowledgeVector;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  PFUbiquityKnowledgeVector *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  PFUbiquityTransactionLog *v131;
  PFUbiquityLocation *v132;
  NSString *v133;
  void *v134;
  PFUbiquityKnowledgeVector *v135;
  uint64_t v136;
  PFUbiquityRemotePeerState *v137;
  uint64_t v138;
  _PFUbiquityStack *v139;
  NSManagedObjectContext *v140;
  PFUbiquityRemotePeerState *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  _BOOL4 v146;
  void *v147;
  uint64_t v148;
  _PFUbiquityStack *v149;
  NSManagedObjectContext *v150;
  PFUbiquityTransactionLog *v151;
  PFUbiquityLocation *v152;
  NSString *v153;
  id v154;
  id v155;
  NSMutableSet *insertedObjectIDs;
  uint64_t v157;
  uint64_t v158;
  uint64_t j;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t k;
  void *v166;
  PFUbiquitySwitchboardEntry *v167;
  PFUbiquitySwitchboardEntryMetadata *v168;
  uint64_t importer;
  id v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  NSPersistentStoreCoordinator *v175;
  id v176;
  uint64_t v177;
  id v178;
  id v179;
  id v180;
  _PFUbiquityStack *v181;
  NSManagedObjectContext *v182;
  _PFUbiquityStack *v183;
  NSManagedObjectContext *v184;
  uint64_t v185;
  _PFUbiquityStack *v186;
  NSManagedObjectContext *v187;
  uint64_t v188;
  _PFUbiquityStack *v189;
  NSManagedObjectContext *v190;
  _PFUbiquityStack *v191;
  NSManagedObjectContext *v192;
  _BOOL4 v193;
  PFUbiquitySwitchboardCacheWrapper *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  id obj;
  uint64_t v199;
  uint64_t v200;
  PFUbiquityStoreSaveSnapshot *storeSaveSnapshot;
  uint64_t v202;
  id v203;
  id newValue;
  void *v205;
  PFUbiquityImportContext *selfa;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  _QWORD v215[5];
  id v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _QWORD v233[5];
  id v234;
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  uint64_t v241;

  v241 = *MEMORY[0x1E0C80C00];
  v203 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  self->_success = 1;
  v234 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@: Beginning parse of log file: %@"), "-[_PFUbiquityRecordImportOperation main]", 257, self, self->_transactionLog);
  if (-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Aborting cancelled operation: %@"), "-[_PFUbiquityRecordImportOperation main]", 259, self);
    return;
  }
  objc_opt_self();
  transactionLog = self->_transactionLog;
  if (transactionLog && (transactionLogLocation = transactionLog->_transactionLogLocation) != 0)
    storeName = (uint64_t)transactionLogLocation->_storeName;
  else
    storeName = 0;
  v6 = (PFUbiquitySwitchboardEntry *)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, storeName, (uint64_t)self->super._localPeerID);
  self->_entry = v6;
  if (!v6)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Cancelling due to missing switchboard entry"), "-[_PFUbiquityRecordImportOperation main]", 275, self);
    -[_PFUbiquityRecordImportOperation cancel](self, "cancel");
    v205 = 0;
    goto LABEL_304;
  }
  if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v205 = 0;
    goto LABEL_304;
  }
  self->_psc = -[NSPersistentStore persistentStoreCoordinator](self->super._store, "persistentStoreCoordinator");
  v7 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)self->_transactionLog, &v234);
  self->_success = v7;
  if ((v7 & 1) != 0)
  {
    v205 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    objc_opt_self();
    v8 = self->_transactionLog;
    if (v8)
    {
      v9 = v8->_transactionLogLocation;
      if (v9)
      {
        v10 = v9->_storeName;
        if (v9->_ubiquityLocationType != 1)
          v9 = v9->_ubiquityRootLocation;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    v11 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->super._localPeerID, v10, v9, &v234);
    v12 = self->_transactionLog;
    if (v12 && (v13 = v12->_transactionLogLocation) != 0)
    {
      v14 = v13->_storeName;
      if (v11)
      {
LABEL_23:
        v15 = v11[1];
        goto LABEL_24;
      }
    }
    else
    {
      v14 = 0;
      if (v11)
        goto LABEL_23;
    }
    v15 = 0;
LABEL_24:
    newValue = (id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v14, v15);
    importContext = self->_importContext;
    if (importContext)
    {
      objc_setProperty_nonatomic(importContext, v16, v11, 8);
      v19 = self->_importContext;
      if (v19)
        objc_setProperty_nonatomic(v19, v18, newValue, 16);
LABEL_40:

      selfa = self->_importContext;
      v28 = self->_transactionLog;
      if (v28 && (v29 = v28->_transactionLogLocation) != 0)
        exportingPeerID = v29->_exportingPeerID;
      else
        exportingPeerID = 0;
      -[PFUbiquityImportContext setExportingPeerID:](selfa, exportingPeerID);
      v32 = self->_transactionLog;
      if (selfa)
      {
        objc_setProperty_nonatomic(selfa, v31, v32, 56);
        v32 = self->_transactionLog;
      }
      if (v32)
      {
        v33 = v32->_transactionLogLocation;
        if (v33)
          v33 = (PFUbiquityLocation *)v33->_storeName;
        saveSnapshot = v32->_saveSnapshot;
        if (saveSnapshot)
          v32 = (PFUbiquityTransactionLog *)-[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", v33);
        else
          v32 = 0;
      }
      if (selfa)
      {
        objc_setProperty_nonatomic(selfa, v31, v32, 64);
        storeSaveSnapshot = selfa->_storeSaveSnapshot;
      }
      else
      {
        storeSaveSnapshot = 0;
      }
      if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        if (selfa && (cacheWrapper = selfa->_cacheWrapper) != 0)
          transactionHistoryCache = (uint64_t)cacheWrapper->_transactionHistoryCache;
        else
          transactionHistoryCache = 0;
        v37 = -[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](transactionHistoryCache, &v234);
        self->_success = v37;
        if (v37)
        {
          self->_success = -[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)self->_transactionLog, &v234);
          v39 = self->_transactionLog;
          v40 = v39 ? v39->_knowledgeVector : 0;
          v41 = self->_importContext;
          if (v41)
            objc_setProperty_nonatomic(v41, v38, v40, 32);
        }
      }
      goto LABEL_61;
    }
    v20 = -[PFUbiquityImportContext initWithStack:andStoreMetadata:]([PFUbiquityImportContext alloc], "initWithStack:andStoreMetadata:", v11, newValue);
    self->_importContext = v20;
    entry = self->_entry;
    if (entry && (v23 = entry->_metadata) != 0)
    {
      baselineHeuristics = v23->_baselineHeuristics;
      if (!v20)
      {
LABEL_35:
        if (entry && (metadata = entry->_metadata) != 0)
          v26 = metadata->_cacheWrapper;
        else
          v26 = 0;
        v27 = self->_importContext;
        if (v27)
          objc_setProperty_nonatomic(v27, v21, v26, 88);
        goto LABEL_40;
      }
    }
    else
    {
      baselineHeuristics = 0;
      if (!v20)
        goto LABEL_35;
    }
    objc_setProperty_nonatomic(v20, v21, baselineHeuristics, 96);
    entry = self->_entry;
    goto LABEL_35;
  }
  v205 = 0;
  selfa = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error loading comparison metadata for transaction log: %@"), "-[_PFUbiquityRecordImportOperation main]", 291, self->_transactionLog);
  newValue = 0;
  v11 = 0;
  storeSaveSnapshot = 0;
LABEL_61:
  if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_304;
  if (!self->_success)
    goto LABEL_229;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    psc = self->_psc;
    v233[0] = MEMORY[0x1E0C809B0];
    v233[1] = 3221225472;
    v233[2] = __40___PFUbiquityRecordImportOperation_main__block_invoke;
    v233[3] = &unk_1E1EDD520;
    v233[4] = self;
    -[NSPersistentStoreCoordinator performBlockAndWait:](psc, "performBlockAndWait:", v233);
    initialStoreKnowledgeVector = self->_initialStoreKnowledgeVector;
    v45 = self->_transactionLog;
    if (v45 && (v46 = v45->_transactionLogLocation) != 0)
    {
      v47 = v46->_exportingPeerID;
      if (!initialStoreKnowledgeVector)
        goto LABEL_82;
    }
    else
    {
      v47 = 0;
      if (!initialStoreKnowledgeVector)
        goto LABEL_82;
    }
    v48 = -[NSDictionary objectForKey:](initialStoreKnowledgeVector->_kv, "objectForKey:", v47);
    if (v48
      && objc_msgSend(v48, "compare:", -[PFUbiquityTransactionLog transactionNumber](&self->_transactionLog->super.isa)) != -1)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Ignoring log: %@\nThe local database has already seen this transaction log: %@"), "-[_PFUbiquityRecordImportOperation main]", 370, self->_transactionLog, self->_initialStoreKnowledgeVector);
      v49 = -[_PFUbiquityRecordImportOperation retainedDelegate](self, "retainedDelegate");
      v50 = v49;
      if (v49)
        objc_msgSend(v49, "operationDidFinish:", self);

      goto LABEL_304;
    }
LABEL_82:
    if (selfa)
      objc_setProperty_nonatomic(selfa, v43, self->_initialStoreKnowledgeVector, 40);
    v51 = (PFUbiquityKnowledgeVector *)-[PFUbiquityKnowledgeVector copy](self->_initialStoreKnowledgeVector, "copy", v47);
    self->_updatedStoreKnowledgeVector = v51;
    v52 = self->_transactionLog;
    if (v52)
      knowledgeVector = (uint64_t)v52->_knowledgeVector;
    else
      knowledgeVector = 0;
    -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:]((uint64_t)v51, knowledgeVector);
    v54 = self->_importContext;
    if (v54)
    {
      v55 = v54->_cacheWrapper;
      if (v55)
      {
        v56 = v55->_transactionHistoryCache;
        v57 = 0;
        if (v56)
          cacheKV = v56->_cacheKV;
        else
          cacheKV = 0;
LABEL_90:
        v60 = -[PFUbiquityKnowledgeVector isEqual:](cacheKV, "isEqual:", self->_initialStoreKnowledgeVector);
        if ((v57 & 1) != 0 || (v61 = v55->_transactionHistoryCache) == 0)
          minCacheKV = 0;
        else
          minCacheKV = v61->_minCacheKV;
        v63 = self->_importContext;
        if (v63 && (v64 = v63->_cacheWrapper) != 0)
        {
          Property = objc_getProperty(v64, v59, 72, 1);
          v66 = Property;
          v67 = Property == 0;
          if (v60 && Property && (-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)Property) & 1) == 0)
            v60 = objc_msgSend(v66, "isEqual:", minCacheKV);
          if (v60)
            goto LABEL_100;
        }
        else
        {
          if ((v60 & 1) != 0)
          {
LABEL_100:
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              if ((v57 & 1) != 0)
              {
                v68 = 0;
              }
              else
              {
                v68 = v55->_transactionHistoryCache;
                if (v68)
                  v68 = (PFUbiquityTransactionHistoryCache *)v68->_cacheKV;
              }
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ - Cache KV: %@ matches initial KV: %@"), "-[_PFUbiquityRecordImportOperation main]", 402, self, v68, self->_initialStoreKnowledgeVector);
            }
            goto LABEL_105;
          }
          v66 = 0;
          v67 = 1;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ - Knowledge Vector mismatch, reloading cache"), "-[_PFUbiquityRecordImportOperation main]", 404, self);
        if ((v57 & 1) != 0)
          v84 = 0;
        else
          v84 = (uint64_t)v55->_transactionHistoryCache;
        -[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v84, 0);
        v85 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:]((uint64_t)v11, (uint64_t *)&v234);
        v86 = -[_PFUbiquityStack createMinMetadataStoreKnowledgeVector:]((uint64_t)v11, (uint64_t *)&v234);
        if (v85)
        {
          v87 = -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)&v85->super.isa, (uint64_t)self->_initialStoreKnowledgeVector);
          if (((v87 | v67) & 1) != 0 || (-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)v66) & 1) != 0)
          {
            if (!v87)
              goto LABEL_173;
          }
          else if ((objc_msgSend(v66, "isEqual:", v86) & 1) != 0)
          {
            goto LABEL_173;
          }
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMetadata store doesn't match local store: (%@:%@)\n"), "-[_PFUbiquityRecordImportOperation main]", 426, self, v85, self->_initialStoreKnowledgeVector);
        if (selfa)
        {
          objc_setProperty_nonatomic(selfa, v88, 0, 8);
          objc_setProperty_nonatomic(selfa, v89, 0, 16);
        }
        v90 = -[PFUbiquityStoreMetadataMedic initWithStore:localPeerID:andUbiquityRootLocation:]([PFUbiquityStoreMetadataMedic alloc], "initWithStore:localPeerID:andUbiquityRootLocation:", self->super._store, self->super._localPeerID, self->super._ubiquityRootLocation);
        self->_success = -[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v90->super.isa, &v234);

        if (!self->_success)
        {
LABEL_173:

          if ((v57 & 1) != 0)
            v101 = 0;
          else
            v101 = (uint64_t)v55->_transactionHistoryCache;
          v102 = -[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](v101, &v234);
          self->_success = v102;
          if (v102)
            goto LABEL_106;
LABEL_176:
          if (self->_success && (-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Changes applied for transaction log content, managed object context changes: \n\tinserted: %@\n\tupdated: %@\n\tdeleted: %@."), "-[_PFUbiquityRecordImportOperation main]", 491, -[NSManagedObjectContext insertedObjects](self->_moc, "insertedObjects"), -[NSManagedObjectContext updatedObjects](self->_moc, "updatedObjects"), -[NSManagedObjectContext deletedObjects](self->_moc, "deletedObjects"));
            }
            v103 = self->_transactionLog;
            if (v103 && (v104 = v103->_transactionLogLocation) != 0)
              v105 = v104->_exportingPeerID;
            else
              v105 = 0;
            if (selfa && (stack = selfa->_stack) != 0)
              metadataMOC = stack->_metadataMOC;
            else
              metadataMOC = 0;
            v108 = +[PFUbiquityPeerState peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeerState, self->super._storeName, v105, metadataMOC, 1);
            v109 = v108;
            if (v108)
            {
              if (storeSaveSnapshot)
                transactionNumber = storeSaveSnapshot->_transactionNumber;
              else
                transactionNumber = 0;
              -[PFUbiquityPeerState setTransactionNumber:](v108, "setTransactionNumber:", transactionNumber);
              v111 = self->_transactionLog;
              if (v111)
                v112 = (uint64_t)v111->_transactionLogLocation;
              else
                v112 = 0;
              v113 = (void *)-[PFUbiquityLocation createFullURL](v112);
              -[PFUbiquityPeerState setLastProcessedTransactionLogURL:](v109, "setLastProcessedTransactionLogURL:", objc_msgSend(v113, "absoluteString"));

              v114 = (void *)-[PFUbiquityPeerState peer](v109, "peer");
              v115 = (void *)MEMORY[0x1E0C99DE8];
              updatedStoreKnowledgeVector = self->_updatedStoreKnowledgeVector;
              if (updatedStoreKnowledgeVector)
                v117 = -[NSDictionary allKeys](updatedStoreKnowledgeVector->_kv, "allKeys");
              else
                v117 = 0;
              v118 = (void *)objc_msgSend(v115, "arrayWithArray:", v117);
              v223 = 0u;
              v224 = 0u;
              v221 = 0u;
              v222 = 0u;
              v119 = (void *)objc_msgSend(v114, "remoteStates");
              v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v221, v238, 16);
              if (v120)
              {
                v121 = *(_QWORD *)v222;
                do
                {
                  v122 = 0;
                  do
                  {
                    if (*(_QWORD *)v222 != v121)
                      objc_enumerationMutation(v119);
                    v123 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * v122);
                    objc_msgSend(v118, "removeObject:", objc_msgSend(v123, "peerID"));
                    v124 = self->_updatedStoreKnowledgeVector;
                    v125 = objc_msgSend(v114, "peerKey");
                    if (!v124 || (v126 = -[NSDictionary objectForKey:](v124->_kv, "objectForKey:", v125)) == 0)
                    {
                      if (storeSaveSnapshot)
                        v126 = (uint64_t)storeSaveSnapshot->_transactionNumber;
                      else
                        v126 = 0;
                    }
                    objc_msgSend(v123, "setTransactionNumber:", v126);
                    ++v122;
                  }
                  while (v120 != v122);
                  v127 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v221, v238, 16);
                  v120 = v127;
                }
                while (v127);
              }
              v219 = 0u;
              v220 = 0u;
              v217 = 0u;
              v218 = 0u;
              v128 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v217, v237, 16);
              if (v128)
              {
                v129 = *(_QWORD *)v218;
                do
                {
                  v130 = 0;
                  do
                  {
                    if (*(_QWORD *)v218 != v129)
                      objc_enumerationMutation(v118);
                    v131 = self->_transactionLog;
                    if (v131 && (v132 = v131->_transactionLogLocation) != 0)
                      v133 = v132->_exportingPeerID;
                    else
                      v133 = 0;
                    v134 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * v130);
                    if ((objc_msgSend(v134, "isEqualToString:", v133) & 1) == 0)
                    {
                      v135 = self->_updatedStoreKnowledgeVector;
                      if (v135)
                        v136 = -[NSDictionary objectForKey:](v135->_kv, "objectForKey:", v134);
                      else
                        v136 = 0;
                      v137 = [PFUbiquityRemotePeerState alloc];
                      v138 = objc_msgSend(newValue, "ubiquityName");
                      if (selfa && (v139 = selfa->_stack) != 0)
                        v140 = v139->_metadataMOC;
                      else
                        v140 = 0;
                      v141 = -[PFUbiquityRemotePeerState initWithStoreName:andRemotePeerID:insertIntoManagedObjectContext:](v137, "initWithStoreName:andRemotePeerID:insertIntoManagedObjectContext:", v138, v134, v140);
                      -[PFUbiquityRemotePeerState setTransactionNumber:](v141, "setTransactionNumber:", v136);
                      -[PFUbiquityRemotePeerState setPeer:](v141, "setPeer:", v114);
                      -[PFUbiquityRemotePeerState setStoreName:](v141, "setStoreName:", objc_msgSend(newValue, "ubiquityName"));

                    }
                    ++v130;
                  }
                  while (v128 != v130);
                  v142 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v217, v237, 16);
                  v128 = v142;
                }
                while (v142);
              }
            }
            else
            {
              self->_success = 0;
              v143 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encountered while importing transaction log at URL: %@, an error occurred saving changes to the persistent store mutated during the import process."), self->_transactionLog);
              v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v145 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v143, CFSTR("reason"), 0);
              v234 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v145);
            }
          }
          goto LABEL_229;
        }
        objc_opt_self();
        v91 = self->_transactionLog;
        if (v91)
        {
          v92 = v91->_transactionLogLocation;
          if (v92)
          {
            v93 = v92->_storeName;
            if (v92->_ubiquityLocationType != 1)
              v92 = v92->_ubiquityRootLocation;
          }
          else
          {
            v93 = 0;
          }
        }
        else
        {
          v93 = 0;
          v92 = 0;
        }
        v94 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->super._localPeerID, v93, v92, &v234);
        v95 = self->_transactionLog;
        if (v95 && (v96 = v95->_transactionLogLocation) != 0)
        {
          v97 = v96->_storeName;
          if (v94)
          {
LABEL_169:
            v98 = v94[1];
LABEL_170:
            newValue = (id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v97, v98);
            if (selfa)
            {
              objc_setProperty_nonatomic(selfa, v99, v94, 8);
              objc_setProperty_nonatomic(selfa, v100, newValue, 16);
            }

            goto LABEL_173;
          }
        }
        else
        {
          v97 = 0;
          if (v94)
            goto LABEL_169;
        }
        v98 = 0;
        goto LABEL_170;
      }
    }
    else
    {
      v55 = 0;
    }
    cacheKV = 0;
    v57 = 1;
    goto LABEL_90;
  }
LABEL_105:
  if (!self->_success)
    goto LABEL_176;
LABEL_106:
  if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) != 0
    || (!selfa || (v69 = selfa->_stack) == 0 ? (v70 = 0) : (v70 = v69->_metadataMOC),
        -[NSManagedObjectContext persistentStoreCoordinator](v70, "persistentStoreCoordinator")))
  {
    if (!self->_success)
      goto LABEL_229;
    if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_176;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  About to apply changes from log contents."), "-[_PFUbiquityRecordImportOperation main]", 467);
    v71 = -[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]((uint64_t)self, storeSaveSnapshot, selfa, &v234);
    self->_success = v71;
    if (v71)
    {
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v72 = (void *)-[NSMutableDictionary allKeys](self->_relationshipsToObjectIDsToCheck, "allKeys");
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v229, v240, 16);
      if (v73)
      {
        obj = v72;
        v199 = *(_QWORD *)v230;
        do
        {
          v74 = 0;
          v200 = v73;
          do
          {
            if (*(_QWORD *)v230 != v199)
              objc_enumerationMutation(obj);
            v75 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * v74);
            v76 = (void *)-[NSMutableDictionary objectForKey:](self->_relationshipsToObjectIDsToCheck, "objectForKey:", v75);
            v202 = v74;
            v227 = 0u;
            v228 = 0u;
            v225 = 0u;
            v226 = 0u;
            v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v225, v239, 16);
            if (v77)
            {
              v78 = *(_QWORD *)v226;
              do
              {
                for (i = 0; i != v77; ++i)
                {
                  if (*(_QWORD *)v226 != v78)
                    objc_enumerationMutation(v76);
                  v80 = -[NSManagedObjectContext objectRegisteredForID:](self->_moc, "objectRegisteredForID:", *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * i));
                  v81 = v80;
                  if (v80
                    && !-[NSManagedObject isDeleted](v80, "isDeleted")
                    && !-[NSManagedObject valueForKey:](v81, "valueForKey:", v75))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nDeleting conflict loser because it was orphaned (%@): %@"), "-[_PFUbiquityRecordImportOperation main]", 481, self, v75, v81);
                    }
                    -[NSManagedObjectContext deleteObject:](self->_moc, "deleteObject:", v81);
                  }
                }
                v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v225, v239, 16);
              }
              while (v77);
            }
            v74 = v202 + 1;
          }
          while (v202 + 1 != v200);
          v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v240, 16);
        }
        while (v73);
      }
      goto LABEL_176;
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext"), "-[_PFUbiquityRecordImportOperation main]", 460);
    v82 = (void *)MEMORY[0x1E0CB35C8];
    v83 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("import operation's context lost its stack"), CFSTR("reason"));
    v234 = (id)objc_msgSend(v82, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v83);
    self->_success = 0;
  }
LABEL_229:
  if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (!self->_success)
      goto LABEL_240;
    if (!-[NSArray count](-[NSPersistentStoreCoordinator persistentStores](-[NSManagedObjectContext persistentStoreCoordinator](self->_moc, "persistentStoreCoordinator"), "persistentStores"), "count"))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext"), "-[_PFUbiquityRecordImportOperation main]", 553);
      goto LABEL_239;
    }
    if (!self->_success)
      goto LABEL_240;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_respondToStoreTransactionStateChangeNotification_, CFSTR("_NSSQLCoreTransactionStateChangeNotification"), self->super._store);
    if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      v216 = 0;
      v146 = -[NSManagedObjectContext save:](self->_moc, "save:", &v216);
      self->_success = v146;
      if (v146)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote changes."), "-[_PFUbiquityRecordImportOperation main]", 574, self);
      }
      else if (objc_msgSend(v216, "code") == 134304)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import operation: %@\nWas beat to the database, rolling back and retrying later."), "-[_PFUbiquityRecordImportOperation main]", 577, self);
        v234 = v216;
        self->_transactionDidRollback = 1;
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error saving managed object context changes for transaction log: %@\nError: %@\n User Info: %@\n Managed Object Context Changes, inserted: %@\nupdated: %@\ndeleted: %@"), "-[_PFUbiquityRecordImportOperation main]", 581, self->_transactionLog, v216, objc_msgSend(v216, "userInfo"), -[NSManagedObjectContext insertedObjects](self->_moc, "insertedObjects"), -[NSManagedObjectContext updatedObjects](self->_moc, "updatedObjects"), -[NSManagedObjectContext deletedObjects](self->_moc, "deletedObjects"));
        v172 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encountered while importing transaction log at URL: %@, an error occurred saving changes to the persistent store mutated during the import process."), self->_transactionLog);
        if (objc_msgSend(v216, "code") == 19
          && (v173 = (void *)objc_msgSend(v216, "domain"),
              (objc_msgSend(v173, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
          || objc_msgSend(v216, "code") == 1555
          && (v174 = (void *)objc_msgSend(v216, "domain"),
              objc_msgSend(v174, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
        {
          v175 = -[NSPersistentStore persistentStoreCoordinator](self->super._store, "persistentStoreCoordinator");
          v215[0] = MEMORY[0x1E0C809B0];
          v215[1] = 3221225472;
          v215[2] = __40___PFUbiquityRecordImportOperation_main__block_invoke_2;
          v215[3] = &unk_1E1EDD520;
          v215[4] = self;
          -[NSPersistentStoreCoordinator performBlockAndWait:](v175, "performBlockAndWait:", v215);
        }
        if (v216)
        {
          v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v177 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v216, *MEMORY[0x1E0CB3388], v172, CFSTR("reason"), 0);
        }
        else
        {
          v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v177 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, CFSTR("reason"), 0);
        }
        v234 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v177);
      }
      if (!self->_success)
        goto LABEL_240;
      if (selfa && (v181 = selfa->_stack) != 0)
        v182 = v181->_metadataMOC;
      else
        v182 = 0;
      if (-[NSArray count](-[NSPersistentStoreCoordinator persistentStores](-[NSManagedObjectContext persistentStoreCoordinator](v182, "persistentStoreCoordinator"), "persistentStores"), "count"))
      {
        if (self->_success)
        {
          v216 = 0;
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          {
            if (selfa && (v183 = selfa->_stack) != 0)
              v184 = v183->_metadataMOC;
            else
              v184 = 0;
            v185 = -[NSManagedObjectContext insertedObjects](v184, "insertedObjects");
            if (selfa && (v186 = selfa->_stack) != 0)
              v187 = v186->_metadataMOC;
            else
              v187 = 0;
            v188 = -[NSManagedObjectContext updatedObjects](v187, "updatedObjects");
            if (selfa && (v189 = selfa->_stack) != 0)
              v190 = v189->_metadataMOC;
            else
              v190 = 0;
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  About to save stack updates, metadata moc changes: \n\tinserted: %@\n\tupdated: %@\n\tdeleted: %@."), "-[_PFUbiquityRecordImportOperation main]", 620, v185, v188, -[NSManagedObjectContext deletedObjects](v190, "deletedObjects"));
          }
          if (selfa && (v191 = selfa->_stack) != 0)
            v192 = v191->_metadataMOC;
          else
            v192 = 0;
          v193 = -[NSManagedObjectContext save:](v192, "save:", &v216);
          self->_success = v193;
          if (v193)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote metadata changes."), "-[_PFUbiquityRecordImportOperation main]", 623, self);
            }
            if (selfa && (v194 = selfa->_cacheWrapper) != 0)
              v195 = (uint64_t)v194->_transactionHistoryCache;
            else
              v195 = 0;
            if (!-[PFUbiquityTransactionHistoryCache writePendingEntries:](v195, &v216)
              && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError writing pending entries: %@"), "-[_PFUbiquityRecordImportOperation main]", 628, self, v216);
            }
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error updating peer metadata during import of log file: %@ error: %@\n User Info: %@\n"), "-[_PFUbiquityRecordImportOperation main]", 632, self->_transactionLog, v216, objc_msgSend(v216, "userInfo"));
            }
            v196 = (void *)MEMORY[0x1E0CB35C8];
            if (v216)
              v197 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB3388], 0);
            else
              v197 = 0;
            v234 = (id)objc_msgSend(v196, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134321, v197);
          }
LABEL_247:
          if (self->_success)
          {
            v151 = self->_transactionLog;
            if (v151 && (v152 = v151->_transactionLogLocation) != 0)
              v153 = v152->_exportingPeerID;
            else
              v153 = 0;
            if (-[NSString isEqualToString:](v153, "isEqualToString:", self->super._localPeerID))
            {
              v154 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v155 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v213 = 0u;
              v214 = 0u;
              v211 = 0u;
              v212 = 0u;
              insertedObjectIDs = self->_insertedObjectIDs;
              v157 = -[NSMutableSet countByEnumeratingWithState:objects:count:](insertedObjectIDs, "countByEnumeratingWithState:objects:count:", &v211, v236, 16);
              if (v157)
              {
                v158 = *(_QWORD *)v212;
                do
                {
                  for (j = 0; j != v157; ++j)
                  {
                    if (*(_QWORD *)v212 != v158)
                      objc_enumerationMutation(insertedObjectIDs);
                    v160 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * j);
                    v161 = objc_msgSend(v160, "entity");
                    if ((objc_msgSend(v154, "containsObject:", v161) & 1) == 0)
                      objc_msgSend(v154, "addObject:", v161);
                    v162 = objc_msgSend(v160, "persistentStore");
                    if ((objc_msgSend(v155, "containsObject:", v162) & 1) == 0)
                      objc_msgSend(v155, "addObject:", v162);
                  }
                  v157 = -[NSMutableSet countByEnumeratingWithState:objects:count:](insertedObjectIDs, "countByEnumeratingWithState:objects:count:", &v211, v236, 16);
                }
                while (v157);
              }
              v209 = 0u;
              v210 = 0u;
              v207 = 0u;
              v208 = 0u;
              v163 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v207, v235, 16);
              if (v163)
              {
                v164 = *(_QWORD *)v208;
                do
                {
                  for (k = 0; k != v163; ++k)
                  {
                    if (*(_QWORD *)v208 != v164)
                      objc_enumerationMutation(v155);
                    v166 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * k);
                    if (objc_msgSend((id)objc_msgSend(v166, "type"), "isEqualToString:", CFSTR("SQLite")))
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                      {
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Executing SQL hack to fix primary key issue in SQLite database in import operation: %@"), "-[_PFUbiquityRecordImportOperation main]", 667, self);
                      }
                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                      {
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  About to issue update command to primary key table for store: %@"), "-[_PFUbiquityRecordImportOperation main]", 668, v166);
                      }
                      -[NSSQLCore recomputePrimaryKeyMaxForEntities:](v166, v154);
                    }
                  }
                  v163 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v207, v235, 16);
                }
                while (v163);
              }

            }
          }
          if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
          {
            if (self->_success)
            {
              v167 = self->_entry;
              if (v167 && (v168 = v167->_metadata) != 0)
                importer = (uint64_t)v168->_importer;
              else
                importer = 0;
              -[_PFUbiquityRecordsImporter requestBaselineRollForStore:](importer, (uint64_t)self->super._store);
            }
            if ((-[_PFUbiquityRecordImportOperation isCancelled](self, "isCancelled") & 1) == 0)
            {
              v170 = -[_PFUbiquityRecordImportOperation retainedDelegate](self, "retainedDelegate");
              v171 = v170;
              if (v170)
              {
                if (self->_success)
                {
                  objc_msgSend(v170, "operationDidFinish:", self);
                }
                else if (self->_transactionDidRollback)
                {
                  objc_msgSend(v170, "operationWasInterruptedDuringImport:", self);
                }
                else
                {
                  -[_PFUbiquityRecordImportOperation notifyDelegateOfError:](self, (uint64_t)v234);
                }
              }

            }
          }
          goto LABEL_304;
        }
LABEL_240:
        if (self->_transactionDidRollback
          && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Rolling back metadata changes due to rolled back transaction: %@"), "-[_PFUbiquityRecordImportOperation main]", 637, self);
        }
        if (selfa && (v149 = selfa->_stack) != 0)
          v150 = v149->_metadataMOC;
        else
          v150 = 0;
        -[NSManagedObjectContext rollback](v150, "rollback");
        goto LABEL_247;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext"), "-[_PFUbiquityRecordImportOperation main]", 610);
LABEL_239:
      v147 = (void *)MEMORY[0x1E0CB35C8];
      v148 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("import operation's context lost its stack"), CFSTR("reason"));
      v234 = (id)objc_msgSend(v147, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v148);
      self->_success = 0;
      goto LABEL_240;
    }
  }
LABEL_304:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_entry = 0;
  self->_transactionDidRollback = 0;

  self->_initialStoreKnowledgeVector = 0;
  self->_updatedStoreKnowledgeVector = 0;

  self->_psc = 0;
  self->_moc = 0;

  self->_importContext = 0;
  v178 = v234;
  objc_msgSend(v203, "drain");
  v179 = v234;
  v180 = 0;
  if (!self->_success)
    self->_operationError = (NSError *)v234;
}

- (void)respondToStoreTransactionStateChangeNotification:(id)a3
{
  uint64_t v5;
  NSManagedObjectContext *moc;
  PFUbiquityKnowledgeVector *updatedStoreKnowledgeVector;
  void *v8;
  const char *v9;
  PFUbiquityImportContext *importContext;
  PFUbiquityKnowledgeVector *v11;
  PFUbiquitySwitchboardCacheWrapper *cacheWrapper;
  PFUbiquityBaselineHeuristics *heuristics;
  uint64_t v14;
  PFUbiquityPeerReceipt *v15;
  NSString *localPeerID;
  PFUbiquityKnowledgeVector *v17;
  PFUbiquityTransactionLog *transactionLog;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  NSString *modelVersionHash;
  PFUbiquityPeerReceipt *v22;
  PFUbiquityImportContext *v23;
  uint64_t v24;
  const char *v25;
  PFUbiquityKnowledgeVector *kv;
  PFUbiquityImportContext *v27;
  PFUbiquityBaselineHeuristics *v28;
  void *v29;
  PFUbiquityPeerReceipt *v30;
  PFUbiquityTransactionLog *v31;
  PFUbiquityLocation *v32;
  NSString *v33;
  NSString *v34;
  PFUbiquityPeerReceipt *v35;
  PFUbiquityImportContext *v36;
  uint64_t v37;
  const char *v38;
  PFUbiquityImportContext *v39;
  PFUbiquityKnowledgeVector *v40;
  PFUbiquitySwitchboardCacheWrapper *v41;
  PFUbiquityBaselineHeuristics *v42;
  PFUbiquityPeerReceipt *v43;

  v5 = objc_msgSend(a3, "object");
  if (self)
    moc = self->_moc;
  else
    moc = 0;
  if (!-[NSManagedObjectContext isEqual:](moc, "isEqual:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreActiveSavingContext"))))return;
  switch(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreTransactionType")), "intValue"))
  {
    case 2u:
      if (self)
        updatedStoreKnowledgeVector = self->_updatedStoreKnowledgeVector;
      else
        updatedStoreKnowledgeVector = 0;
      v8 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary]((uint64_t)updatedStoreKnowledgeVector);
      -[NSSQLCore updateUbiquityKnowledgeVector:](v5, (uint64_t)v8);

      importContext = self->_importContext;
      if (!importContext)
        goto LABEL_13;
      v11 = self->_updatedStoreKnowledgeVector;
      cacheWrapper = importContext->_cacheWrapper;
      if (!cacheWrapper)
        goto LABEL_11;
      objc_setProperty_atomic(cacheWrapper, v9, v11, 64);
      importContext = self->_importContext;
      if (importContext)
      {
        v11 = self->_updatedStoreKnowledgeVector;
LABEL_11:
        heuristics = importContext->_heuristics;
        if (heuristics)
          objc_setProperty_nonatomic(heuristics, v9, v11, 88);
      }
LABEL_13:
      v14 = 410;
      goto LABEL_28;
    case 3u:
      v15 = [PFUbiquityPeerReceipt alloc];
      if (!self)
      {
        localPeerID = 0;
        modelVersionHash = 0;
        v17 = 0;
LABEL_48:
        storeName = 0;
        transactionLogLocation = 0;
        goto LABEL_19;
      }
      localPeerID = self->super._localPeerID;
      v17 = self->_updatedStoreKnowledgeVector;
      transactionLog = self->_transactionLog;
      if (!transactionLog)
      {
        modelVersionHash = 0;
        goto LABEL_48;
      }
      transactionLogLocation = transactionLog->_transactionLogLocation;
      if (transactionLogLocation)
      {
        storeName = transactionLogLocation->_storeName;
        modelVersionHash = transactionLogLocation->_modelVersionHash;
        if (transactionLogLocation->_ubiquityLocationType != 1)
          transactionLogLocation = transactionLogLocation->_ubiquityRootLocation;
      }
      else
      {
        modelVersionHash = 0;
        storeName = 0;
      }
LABEL_19:
      v22 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:](v15, "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", localPeerID, v17, localPeerID, storeName, modelVersionHash, transactionLogLocation);
      v23 = self->_importContext;
      if (v23)
        v24 = (uint64_t)v23->_cacheWrapper;
      else
        v24 = 0;
      v43 = v22;
      -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:](v24, v22);
      if (v43)
        kv = v43->_kv;
      else
        kv = 0;
      v27 = self->_importContext;
      if (v27)
      {
        v28 = v27->_heuristics;
        if (v28)
          objc_setProperty_nonatomic(v28, v25, kv, 88);
      }

      return;
    case 4u:
      v14 = 409;
LABEL_28:
      *((_BYTE *)&self->super.super.super.isa + v14) = 1;
      return;
    case 5u:
      if (self->_wroteKV)
        return;
      v29 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary]((uint64_t)self->_updatedStoreKnowledgeVector);
      -[NSSQLCore updateUbiquityKnowledgeVector:](v5, (uint64_t)v29);

      v30 = [PFUbiquityPeerReceipt alloc];
      v31 = self->_transactionLog;
      if (v31)
      {
        v32 = v31->_transactionLogLocation;
        if (v32)
        {
          v33 = v32->_storeName;
          v34 = v32->_modelVersionHash;
          if (v32->_ubiquityLocationType != 1)
            v32 = v32->_ubiquityRootLocation;
        }
        else
        {
          v33 = 0;
          v34 = 0;
        }
      }
      else
      {
        v33 = 0;
        v34 = 0;
        v32 = 0;
      }
      v35 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:](v30, "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", self->super._localPeerID, self->_updatedStoreKnowledgeVector, self->super._localPeerID, v33, v34, v32);
      v36 = self->_importContext;
      if (v36)
        v37 = (uint64_t)v36->_cacheWrapper;
      else
        v37 = 0;
      -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:](v37, v35);
      v39 = self->_importContext;
      if (!v39)
        goto LABEL_42;
      v40 = self->_updatedStoreKnowledgeVector;
      v41 = v39->_cacheWrapper;
      if (!v41)
        goto LABEL_40;
      objc_setProperty_atomic(v41, v38, v40, 64);
      v39 = self->_importContext;
      if (v39)
      {
        v40 = self->_updatedStoreKnowledgeVector;
LABEL_40:
        v42 = v39->_heuristics;
        if (v42)
          objc_setProperty_nonatomic(v42, v38, v40, 88);
      }
LABEL_42:

      self->_wroteKV = 1;
      return;
    default:
      return;
  }
}

- (NSString)description
{
  id v3;
  NSString *localPeerID;
  PFUbiquityKnowledgeVector *logScore;
  PFUbiquityTransactionLog *transactionLog;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordImportOperation;
  v3 = -[PFUbiquityImportOperation description](&v8, sel_description);
  if (self)
  {
    localPeerID = self->super._localPeerID;
    logScore = self->_logScore;
    transactionLog = self->_transactionLog;
  }
  else
  {
    localPeerID = 0;
    logScore = 0;
    transactionLog = 0;
  }
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\n\tlocalPeerID: %@\n\tlogScore: %@\n\ttransactionLog: %@\n"), v3, localPeerID, logScore, transactionLog);
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

@end
