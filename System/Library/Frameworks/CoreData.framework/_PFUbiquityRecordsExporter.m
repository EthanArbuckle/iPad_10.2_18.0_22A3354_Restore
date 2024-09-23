@implementation _PFUbiquityRecordsExporter

- (_PFUbiquityRecordsExporter)init
{
  return 0;
}

- (_QWORD)initWithLocalPeerID:(void *)a3 forStoreName:(void *)a4 ubiquityRootLocation:(void *)a5 localRootLocation:(NSObject *)a6 andProcessingQueue:
{
  _QWORD *v11;
  SEL v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  char v16;
  objc_super v18;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)_PFUbiquityRecordsExporter;
  v11 = objc_msgSendSuper2(&v18, sel_init);
  if (v11)
  {
    v11[6] = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v11[1] = objc_msgSend(a2, "copy");
    v11[3] = a4;
    v11[4] = a5;
    v11[5] = a3;
    objc_setProperty_atomic(v11, v12, 0, 16);
    v11[7] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_BYTE *)v11 + 64) = 0;
    v13 = v11[3];
    v14 = v13 == 0;
    v15 = v13 != 0;
    v16 = v14;
    *((_BYTE *)v11 + 66) = v16;
    *((_BYTE *)v11 + 65) = v15;
    v11[9] = a6;
    dispatch_retain(a6);
  }
  return v11;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_ubiquityRootLocation = 0;

  self->_localRootLocation = 0;
  self->_transactionLock = 0;

  self->_storeName = 0;
  objc_setProperty_atomic(self, v3, 0, 16);
  dispatch_release((dispatch_object_t)self->_processingQueue);
  self->_processingQueue = 0;

  self->_pendingTransactionsToStoreNameAndTransactionNumber = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordsExporter;
  -[_PFUbiquityRecordsExporter dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  id v5;
  NSString *localPeerID;
  PFUbiquityLocation *ubiquityRootLocation;
  id Property;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_PFUbiquityRecordsExporter;
  v5 = -[_PFUbiquityRecordsExporter description](&v10, sel_description);
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootLocation = self->_ubiquityRootLocation;
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    ubiquityRootLocation = 0;
    localPeerID = 0;
    Property = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tlocalPeerID: %@\n\tubiquityRootLocation: %@\n\tlastTransactionDate: %@\n"), v5, localPeerID, ubiquityRootLocation, Property);
}

- (uint64_t)beginWatchingForChangesFromStore:(uint64_t)result
{
  if (result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", result, sel_managedObjectContextDidSave_, CFSTR("_NSSQLCoreTransactionStateChangeNotification"), a2);
  return result;
}

- (uint64_t)stopWatchingForChanges
{
  if (result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", result, CFSTR("_NSSQLCoreTransactionStateChangeNotification"), 0);
  return result;
}

- (void)managedObjectContextDidSave:(id)a3
{
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  PFUbiquityKnowledgeVector *v25;
  PFUbiquityKnowledgeVector *v26;
  NSDictionary *kv;
  unint64_t hash;
  uint64_t v29;
  PFUbiquityKnowledgeVector *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id *v35;
  id v36;
  PFUbiquityPeerState *v37;
  PFUbiquityPeerState *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  PFUbiquityKnowledgeVector *v42;
  PFUbiquityPeerReceipt *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  PFUbiquityPeerReceipt *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  const char *v52;
  _QWORD *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  _PFUbiquityRecordsExporter *v66;
  const char *v67;
  id v68;
  PFUbiquityExportContext *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  id v74;
  id v75;
  PFUbiquitySaveSnapshot *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  PFUbiquityFileCoordinator *v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  PFUbiquityTransactionLog *v113;
  PFUbiquityTransactionLog *v114;
  void *v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  id v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id obj;
  uint64_t v139;
  _BOOL4 v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  id *p_isa;
  _QWORD *v145;
  void *v146;
  id v148;
  PFUbiquitySaveSnapshot *v149;
  _PFUbiquityRecordsExporter *selfa;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  id v163;
  _QWORD v164[6];
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t);
  void (*v169)(uint64_t);
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  id v178[18];

  v178[16] = *(id *)MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreTransactionType")), "intValue");
  selfa = self;
  if (v4 == 5)
    goto LABEL_5;
  v5 = v4;
  if (v4 != 2)
  {
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    if (!-[NSString isEqualToString:](self->_storeName, "isEqualToString:", v20))
      return;
    v21 = -[NSMutableDictionary objectForKey:](self->_pendingTransactionsToStoreNameAndTransactionNumber, "objectForKey:", v20);
    if (!v21)
      return;
    v22 = (void *)v21;
    v23 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreTransientSequenceNumber"));
    v148 = (id)objc_msgSend(v22, "objectForKey:", v23);
    if (!v148)
      return;
    if (v5 == 3)
    {
      v40 = objc_msgSend(v148, "objectForKey:", CFSTR("transactionLog"));
      v178[0] = 0;
      if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v40, v178))
      {
        v41 = (void *)objc_msgSend(a3, "object");
        v42 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithStoreKnowledgeVectorDictionary:", -[NSSQLCore fetchUbiquityKnowledgeVector](v41));
        v43 = [PFUbiquityPeerReceipt alloc];
        if (v40 && (v44 = *(_QWORD *)(v40 + 24)) != 0)
        {
          v45 = *(_QWORD *)(v44 + 40);
          v46 = *(_QWORD *)(v44 + 48);
        }
        else
        {
          v45 = 0;
          v46 = 0;
        }
        v47 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:](v43, "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", self->_localPeerID, v42, self->_localPeerID, v45, v46, self->_ubiquityRootLocation);
        objc_opt_self();
        v48 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
        v49 = v48;
        if (v48)
        {
          v50 = (_QWORD *)v48[11];
          if (v50)
            v50 = (_QWORD *)v50[11];
        }
        else
        {
          v50 = 0;
        }
        v51 = v50;
        v53 = v51;
        if (v51)
          objc_setProperty_atomic(v51, v52, v42, 64);
        -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:]((uint64_t)v53, v47);
        if (v49)
        {
          v55 = v49[11];
          if (v55)
          {
            v56 = *(void **)(v55 + 120);
            if (v56)
              objc_setProperty_nonatomic(v56, v54, v42, 88);
          }
        }
        if (v53)
          v57 = v53[6];
        else
          v57 = 0;
        -[PFUbiquityTransactionLogCache cacheExportedLog:](v57, v40);
        v58 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)v42);
        if (v49 && (v59 = v49[11]) != 0)
          v60 = *(_QWORD *)(v59 + 72);
        else
          v60 = 0;
        -[_PFUbiquityRecordsImporter requestBaselineRollForStore:](v60, (uint64_t)v41);

        v61 = objc_alloc(MEMORY[0x1E0C99D20]);
        if (v40)
          v62 = *(_QWORD *)(v40 + 24);
        else
          v62 = 0;
        v63 = (void *)objc_msgSend(v61, "initWithObjects:", v62, 0);
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v63, CFSTR("PFLogLocationsKey"), v58, CFSTR("debug.kvStr"), self->_localPeerID, CFSTR("exportingPeerID"), 0);

        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("PFUbiquityLocationWasExportedNotification"), self->_ubiquityRootLocation, v64);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v65);

      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError moving log to permanent location: %@\nError: %@\n User Info: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 345, self, v40, v178[0], objc_msgSend(v178[0], "userInfo"));
      }
      goto LABEL_129;
    }
    if (v5 != 4)
    {
LABEL_129:
      objc_msgSend(v22, "removeObjectForKey:", v23);

      return;
    }
    v24 = (void *)objc_msgSend(v148, "objectForKey:", CFSTR("storeName"));
    v25 = (PFUbiquityKnowledgeVector *)objc_msgSend(v148, "objectForKey:", CFSTR("transactionLog"));
    v26 = v25;
    if (v25)
    {
      kv = v25[2]._kv;
      hash = v25->_hash;
      if (hash)
      {
        v29 = *(_QWORD *)(hash + 40);
        if (kv)
        {
LABEL_37:
          v25 = (PFUbiquityKnowledgeVector *)-[objc_class objectForKey:](kv[5].super.isa, "objectForKey:", v29);
          goto LABEL_38;
        }
      }
      else
      {
        v29 = 0;
        if (kv)
          goto LABEL_37;
      }
      v25 = 0;
    }
LABEL_38:
    v30 = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v25);
    v31 = (void *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByDecrementingPeerWithID:]((uint64_t)v30, (uint64_t)self->_localPeerID);
    objc_opt_self();
    v145 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
    if (v145)
    {
      v33 = v145[11];
      if (v33)
      {
        v34 = *(void **)(v33 + 88);
        if (v34)
          objc_setProperty_atomic(v34, v32, v31, 64);
      }
    }

    objc_opt_self();
    v35 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->_localPeerID, self->_storeName, self->_ubiquityRootLocation, 0);
    if (v35)
      v36 = v35[1];
    else
      v36 = 0;
    v143 = v23;
    v37 = +[PFUbiquityPeerState peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeerState, v24, self->_localPeerID, v36, 0);
    if (v37)
    {
      v38 = v37;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v26), "unsignedIntegerValue") - 1);
      -[PFUbiquityPeerState setTransactionNumber:](v38, "setTransactionNumber:", v39);

    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't find peer state for local peer ID: %@ after transacation rolled back: %@"), "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 210, self->_localPeerID, v26);
    }
    if (v35)
      v84 = v35[1];
    else
      v84 = 0;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v141 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v24, v84);
    v85 = (void *)objc_msgSend(v141, "transactionEntries");
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v171, v178, 16);
    if (v86)
    {
      v87 = *(_QWORD *)v172;
      do
      {
        v88 = 0;
        do
        {
          if (*(_QWORD *)v172 != v87)
            objc_enumerationMutation(v85);
          v89 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v88);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "actingPeer"), "peerKey"), "isEqualToString:", self->_localPeerID)&& objc_msgSend((id)objc_msgSend(v89, "transactionNumber"), "isEqualToNumber:", -[PFUbiquityTransactionLog transactionNumber](v26)))
          {
            if (v35)
              v90 = v35[1];
            else
              v90 = 0;
            objc_msgSend(v90, "deleteObject:", v89);
          }
          ++v88;
        }
        while (v86 != v88);
        v91 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v171, v178, 16);
        v86 = v91;
      }
      while (v91);
    }
    v92 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->_ubiquityRootLocation, (uint64_t)self->_localPeerID);
    if (v26)
      v93 = v26->_hash;
    else
      v93 = 0;
    v94 = (void *)-[PFUbiquityLocation createFullURL](v93);
    v165 = 0;
    v166 = &v165;
    v167 = 0x3052000000;
    v168 = __Block_byref_object_copy__37;
    v169 = __Block_byref_object_dispose__37;
    v170 = 0;
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __87___PFUbiquityRecordsExporter_cleanUpFromRolledbackPendingTransaction_withNotification___block_invoke;
    v164[3] = &unk_1E1EE0A48;
    v164[5] = &v165;
    v164[4] = self;
    -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v92, "coordinateWritingItemAtURL:options:error:byAccessor:", v94, 1, &v170, v164);

    if (v166[5]
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error deleting invalidated log file at url: %@\nError: %@\n User Info: %@"), "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 246, v26, v166[5], objc_msgSend((id)v166[5], "userInfo"));
    }
    v163 = 0;
    v23 = v143;
    if (v35)
      v95 = v35[1];
    else
      v95 = 0;
    objc_msgSend(v95, "save:", &v163);
    if (v163)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error trying to recover store metadata from rolled back transaction: %@\n User Info: %@\nStore Metadata: %@\nTransaction log: %@"), "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 252, v163, objc_msgSend(v163, "userInfo"), v141, v26);
      if (v145 && (v96 = v145[11]) != 0)
        v97 = *(_QWORD *)(v96 + 72);
      else
        v97 = 0;
      -[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:](v97, objc_msgSend(a3, "object"));
    }

    _Block_object_dispose(&v165, 8);
    goto LABEL_129;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got notification that store is about to commit: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 269, a3);
LABEL_5:
  if (self)
  {
    v6 = (void *)objc_msgSend(a3, "object");
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Exporter considering response to save: %@\nStore: %@\nOptions: %@\n"), "-[_PFUbiquityRecordsExporter shouldRespondToSaveNotification:]", 137, self, v6, objc_msgSend(v6, "options"));
    v7 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreActiveSavingContext"));
    if (v7)
    {
      if ((*(_BYTE *)(v7 + 42) & 0x10) != 0)
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "options"), "objectForKey:", CFSTR("PFSetupLocalPeerIDOverride"));
        if (!v8 || objc_msgSend(v8, "isEqualToString:", self->_localPeerID))
        {
          if (-[NSString isEqualToString:](self->_storeName, "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))))
          {
            v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreActiveSaveRequest"));
            v10 = objc_msgSend(v6, "persistentStoreCoordinator");
            if (v10)
            {
              if ((*(_BYTE *)(v10 + 24) & 1) != 0)
              {
                v11 = (void *)objc_msgSend(v9, "insertedObjects");
                v12 = objc_msgSend(v9, "updatedObjects");
                v13 = (void *)objc_msgSend(v9, "deletedObjects");
                if (v11)
                  v11 = (void *)objc_msgSend(v11, "count");
                if (v12)
                {
                  v12 = objc_msgSend((id)v12, "count");
                  if (v12 >= 1)
                  {
                    v14 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
                    v171 = 0u;
                    v172 = 0u;
                    v173 = 0u;
                    v174 = 0u;
                    v15 = (void *)objc_msgSend(v9, "updatedObjects");
                    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v171, v178, 16);
                    if (v16)
                    {
                      v17 = *(_QWORD *)v172;
                      do
                      {
                        for (i = 0; i != v16; ++i)
                        {
                          if (*(_QWORD *)v172 != v17)
                            objc_enumerationMutation(v15);
                          v12 -= objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "hasPersistentChangedValues") ^ 1;
                        }
                        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v171, v178, 16);
                      }
                      while (v16);
                    }
                    objc_msgSend(v14, "drain");
                  }
                }
                v19 = !v13 || objc_msgSend(v13, "count") == 0;
                if (v11 || v12 || !v19)
                {
                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Exporter: %@\nWill respond."), "-[_PFUbiquityRecordsExporter shouldRespondToSaveNotification:]", 188, selfa);
                  }
                  v66 = selfa;
                  v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v129 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  v68 = objc_alloc_init(MEMORY[0x1E0C99D68]);
                  v140 = !selfa->_useLocalStorage
                      && selfa->_allowTempLogStorage
                      && objc_getProperty(selfa, v67, 16, 1)
                      && (objc_msgSend(v68, "timeIntervalSinceDate:", objc_getProperty(selfa, v67, 16, 1)), v73 < 1.0)
                      && !selfa->_pendingTempLogMove;
                  objc_setProperty_atomic(selfa, v67, v68, 16);

                  -[NSLock lock](selfa->_transactionLock, "lock");
                  v69 = -[PFUbiquityExportContext initWithLocalPeerID:andUbiquityRootLocation:]([PFUbiquityExportContext alloc], "initWithLocalPeerID:andUbiquityRootLocation:", selfa->_localPeerID, selfa->_ubiquityRootLocation);
                  if (v69)
                    v69->_useLocalStorage = selfa->_useLocalStorage;
                  p_isa = (id *)&v69->super.isa;
                  v149 = -[PFUbiquitySaveSnapshot initWithSaveNotification:withLocalPeerID:]([PFUbiquitySaveSnapshot alloc], "initWithSaveNotification:withLocalPeerID:", a3, selfa->_localPeerID);
                  v133 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v134 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v135 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v136 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  if (objc_msgSend(v137, "count"))
                  {
                    v70 = 0;
                    v71 = 0;
                    v72 = 0;
                    v146 = 0;
LABEL_228:
                    if (objc_msgSend(v137, "count"))
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                      {
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Export of save notification encountered the following errors: %@, \nSave Notification: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 571, v137, a3);
                      }
                    }
                    -[NSLock unlock](selfa->_transactionLock, "unlock");

                    return;
                  }
                  v74 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 0, (uint64_t)p_isa, (uint64_t)v149);
                  v75 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 1u, (uint64_t)p_isa, (uint64_t)v149);
                  v130 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 2u, (uint64_t)p_isa, (uint64_t)v149);
                  v131 = v75;
                  v132 = v74;
                  v76 = v149;
                  v77 = v74;
                  v78 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreTransactionExternalDataReferencesToDelete")), "allObjects"), "mutableCopy");
                  if (objc_msgSend(v78, "count"))
                  {
                    v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v161 = 0u;
                    v162 = 0u;
                    v159 = 0u;
                    v160 = 0u;
                    v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
                    if (v80)
                    {
                      v81 = *(_QWORD *)v160;
                      do
                      {
                        for (j = 0; j != v80; ++j)
                        {
                          if (*(_QWORD *)v160 != v81)
                            objc_enumerationMutation(v78);
                          v83 = objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * j), "UUID");
                          if (v83)
                            objc_msgSend(v79, "addObject:", v83);
                        }
                        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
                      }
                      while (v80);
                      v146 = v79;
                      v76 = v149;
                      v77 = v132;
                    }
                    else
                    {
                      v146 = v79;
                    }
                  }
                  else
                  {
                    v146 = 0;
                  }

                  v157 = 0u;
                  v158 = 0u;
                  v155 = 0u;
                  v156 = 0u;
                  if (v76)
                  {
                    obj = (id)-[NSMutableDictionary allKeys](v76->_storeNameToStoreSaveSnapshots, "allKeys");
                    v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
                  }
                  else
                  {
                    obj = 0;
                    v98 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
                  }
                  v142 = v98;
                  if (!v98)
                  {
                    v70 = v77;
LABEL_227:
                    v72 = v130;
                    v71 = v131;
                    goto LABEL_228;
                  }
                  v139 = *(_QWORD *)v156;
                  v128 = *MEMORY[0x1E0C99768];
LABEL_136:
                  v99 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v156 != v139)
                      objc_enumerationMutation(obj);
                    v100 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v99);
                    if (p_isa)
                      v101 = objc_msgSend(p_isa[1], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v99));
                    else
                      v101 = 0;
                    if (v149)
                    {
                      v102 = (_QWORD *)-[NSMutableDictionary objectForKey:](v149->_storeNameToStoreSaveSnapshots, "objectForKey:", v100);
                      if (v101)
                        goto LABEL_143;
                    }
                    else
                    {
                      v102 = 0;
                      if (v101)
                      {
LABEL_143:
                        v103 = *(_QWORD *)(v101 + 40);
                        goto LABEL_144;
                      }
                    }
                    v103 = 0;
LABEL_144:
                    if (v146 && objc_msgSend(a3, "object") == v103)
                      -[PFUbiquityStoreSaveSnapshot _setFilesDeletedInTransaction:]((uint64_t)v102, v146);
                    -[PFUbiquityStoreSaveSnapshot reserveTransactionNumberWithStoreExportContext:](v102, v101);
                    -[PFUbiquityStoreSaveSnapshot generatePeerStates]((uint64_t)v102);
                    v153 = 0u;
                    v154 = 0u;
                    v151 = 0u;
                    v152 = 0u;
                    if (v101)
                      v104 = *(void **)(v101 + 32);
                    else
                      v104 = 0;
                    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
                    if (v105)
                    {
                      v106 = *(_QWORD *)v152;
                      do
                      {
                        v107 = 0;
                        do
                        {
                          if (*(_QWORD *)v152 != v106)
                            objc_enumerationMutation(v104);
                          if (v102)
                            v108 = v102[15];
                          else
                            v108 = 0;
                          objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * v107++), "setTransactionNumber:", v108);
                        }
                        while (v105 != v107);
                        v109 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
                        v105 = v109;
                      }
                      while (v109);
                    }
                    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquityExporterWillUpdateKnowledgeVectorNotification"), selfa);
                    if (selfa->_throwOptimisticLockingException)
                    {
                      v111 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v128, 134304, (uint64_t)CFSTR("Just testing"), 0);
                      objc_exception_throw(v111);
                    }
                    if (v102)
                      v110 = v102[15];
                    else
                      v110 = 0;
                    -[NSSQLCore updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](v103, (uint64_t)selfa->_localPeerID, v110);
                    if (v140)
                      -[_PFUbiquityRecordsExporter scheduleTempLogMove]((uint64_t)selfa);
                    v112 = 32;
                    if (!selfa->_useLocalStorage)
                      v112 = 24;
                    v113 = -[PFUbiquityTransactionLog initWithStoreName:andSaveSnapshot:andRootLocation:]([PFUbiquityTransactionLog alloc], "initWithStoreName:andSaveSnapshot:andRootLocation:", v100, v149, *(Class *)((char *)&selfa->super.isa + v112));
                    v114 = v113;
                    if (v113)
                      v113->_useTemporaryLogLocation = selfa->_pendingTempLogMove;
                    v178[0] = 0;
                    if (v101)
                      v115 = *(void **)(v101 + 32);
                    else
                      v115 = 0;
                    if (-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]((uint64_t)v113, v178, v115))
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                      {
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ Successfully wrote transaction log: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 516, selfa, v114);
                      }
                      if (selfa->_useLocalStorage)
                      {
                        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                        {
                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSkipping transaction history caching, using local storage."), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 522, selfa);
                        }
                      }
                      else
                      {
                        objc_opt_self();
                        v116 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)selfa->_storeName, (uint64_t)selfa->_localPeerID);
                        *(_QWORD *)&v171 = 0;
                        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                        {
                          if (v101)
                            v117 = *(_QWORD *)(v101 + 32);
                          else
                            v117 = 0;
                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nTransaction Entries: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 528, selfa, v117);
                        }
                        if (v116
                          && (v118 = v116[11]) != 0
                          && (v119 = *(_QWORD *)(v118 + 88)) != 0
                          && (v120 = *(_QWORD *)(v119 + 56)) != 0)
                        {
                          if (v101)
                            v121 = *(void **)(v101 + 32);
                          else
                            v121 = 0;
                          if (-[PFUbiquityTransactionHistoryCache addTransactionEntryLights:error:](v120, (void *)objc_msgSend(v121, "allObjects")))
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                            {
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Added transaction entries to cache"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 533);
                            }
                          }
                          else
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                            {
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error caching transaction entries after export: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 535, (_QWORD)v171);
                            }
                            if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](*(_QWORD *)(v119 + 56), 1))
                            {
                              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                              {
                                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Wrote pending entries to disk and purged cache, it will be rebuilt"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 537);
                              }
                            }
                            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                            {
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error purging cache for transaction entries: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 539, (_QWORD)v171);
                            }
                          }
                        }
                        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                        {
                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  No transaction history cache found for store: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 543, v114);
                        }

                      }
                      v122 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreTransientSequenceNumber"));
                      v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v100, CFSTR("storeName"), -[PFUbiquityTransactionLog transactionNumber](v114), CFSTR("transactionNumber"), v114, CFSTR("transactionLog"), 0);
                      if (v114 && (transactionLogLocation = v114->_transactionLogLocation) != 0)
                        storeName = transactionLogLocation->_storeName;
                      else
                        storeName = 0;
                      v126 = (id)-[NSMutableDictionary objectForKey:](selfa->_pendingTransactionsToStoreNameAndTransactionNumber, "objectForKey:", storeName);
                      if (!v126)
                      {
                        v126 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        -[NSMutableDictionary setObject:forKey:](selfa->_pendingTransactionsToStoreNameAndTransactionNumber, "setObject:forKey:", v126, v100);

                      }
                      objc_msgSend(v126, "setObject:forKey:", v123, v122);

                    }
                    else
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                      {
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error writing transaction log: %@.\nError: %@\n User Info: %@"), "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 561, v114, v178[0], objc_msgSend(v178[0], "userInfo"));
                      }
                      if (v178[0])
                        objc_msgSend(v137, "addObject:");
                    }

                    if (++v99 == v142)
                    {
                      v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
                      v142 = v127;
                      if (!v127)
                      {
                        v70 = v132;
                        goto LABEL_227;
                      }
                      goto LABEL_136;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)createDictionaryForObjectsInSaveNotification:(unsigned int)a3 forTransactionOfType:(uint64_t)a4 withExportContext:(uint64_t)a5 andSaveSnapshot:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PFUbiquityStoreExportContext *v18;
  id *p_isa;
  void *v20;
  _QWORD *v21;
  PFUbiquityTransactionEntryLight *v22;
  PFUbiquityTransactionEntryLight *v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  PFUbiquityFileCoordinator *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("_NSSQLCoreActiveSaveRequest"));
  v10 = (void *)objc_msgSend(a2, "object");
  if (a3 == 2)
  {
    v11 = (void *)objc_msgSend(v9, "deletedObjects");
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ exporting deleted objects: %@"), "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 627, a1, v11);
  }
  else if (a3 == 1)
  {
    v11 = (void *)objc_msgSend(v9, "updatedObjects");
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ exporting updated objects: %@"), "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 623, a1, v11);
  }
  else if (a3)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "insertedObjects");
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ exporting inserted objects: %@"), "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 619, a1, v11);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v13)
  {
    v14 = v13;
    v36 = v12;
    v38 = a4;
    v39 = a5;
    v15 = *(_QWORD *)v48;
    do
    {
      v16 = 0;
      v40 = v14;
      do
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
        v18 = -[PFUbiquityExportContext storeExportContextForStore:](a4, v10);
        if (v18)
        {
          p_isa = (id *)&v18->super.isa;
          if (a3 != 1 || objc_msgSend(v17, "hasPersistentChangedValues"))
          {
            v20 = v11;
            v21 = -[PFUbiquitySaveSnapshot storeSaveSnapshotForStore:](v39, v10);
            v46 = 0;
            v37 = v17;
            v22 = -[PFUbiquityStoreSaveSnapshot addManagedObject:withTransactionType:andStoreExportContext:withError:]((uint64_t)v21, v17, a3, p_isa, (uint64_t *)&v46);
            v23 = 0;
            if (!*(_BYTE *)(a1 + 66))
            {
              v23 = v22;
              if (!v22)
              {
                if (v21)
                  v27 = (void *)v21[18];
                else
                  v27 = 0;
                if (objc_msgSend(v27, "count"))
                {
                  v28 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, objc_msgSend(v27, "lastObject"));
                  v42 = 0u;
                  v43 = 0u;
                  v44 = 0u;
                  v45 = 0u;
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = *(_QWORD *)v43;
                    do
                    {
                      for (i = 0; i != v30; ++i)
                      {
                        if (*(_QWORD *)v43 != v31)
                          objc_enumerationMutation(v27);
                        v33 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
                        -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v28, "coordinateWritingItemAtURL:options:error:byAccessor:", v33, 1, 0, &__block_literal_global_25);

                      }
                      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
                    }
                    while (v30);
                  }

                }
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error adding object to save snapshot: %@\n User Info: %@\n Object: %@"), "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 688, v46, objc_msgSend(v46, "userInfo"), v37);
                }
                v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v35 = v34;
                if (v37)
                  objc_msgSend(v34, "setObject:forKey:", v37, CFSTR("offendingObject"));
                if (v46)
                  objc_msgSend(v35, "setObject:forKey:", v46, *MEMORY[0x1E0CB3388]);
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("CoreData: Ubiquity: Unable to export content for managed object."), v35));
              }
            }
            if (v39)
              v24 = *(_QWORD *)(v39 + 8);
            else
              v24 = 0;
            v11 = v20;
            -[PFUbiquityTransactionEntryLight setTransactionDate:](v23, "setTransactionDate:", v24);
            a4 = v38;
            v14 = v40;
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping object from a store that this exporter is not responsible for. Object ID: %@, exporter: %@"), "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 651, v17, a1);
        }
        ++v16;
      }
      while (v14 != v16);
      v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      v14 = v25;
    }
    while (v25);
    return v36;
  }
  return v12;
}

- (void)scheduleTempLogMove
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (a1 && !*(_BYTE *)(a1 + 64))
  {
    *(_BYTE *)(a1 + 64) = 1;
    if (*(_QWORD *)(a1 + 72))
    {
      v2 = dispatch_time(0, 5000000000);
      v3 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49___PFUbiquityRecordsExporter_scheduleTempLogMove__block_invoke;
      block[3] = &unk_1E1EDD520;
      block[4] = a1;
      dispatch_after(v2, v3, block);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAsked to schedule a temporary log move without a queue"), "-[_PFUbiquityRecordsExporter scheduleTempLogMove]", 785, a1);
    }
  }
}

- (void)moveLogsFromTempDirectory
{
  int v2;
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    v7 = 0;
    objc_msgSend(*(id *)(a1 + 48), "lock");
    v2 = *(unsigned __int8 *)(a1 + 64);
    if (*(_BYTE *)(a1 + 64))
      *(_BYTE *)(a1 + 64) = 0;
    objc_msgSend(*(id *)(a1 + 48), "unlock");
    if (v2)
    {
      objc_opt_self();
      v3 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 8));
      if (v3)
      {
        v4 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 8), *(void **)(a1 + 24));
        v5 = +[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v4, &v7);
        v6 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 8), *(void **)(a1 + 32));
        if ((+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v6, &v7) & v5 & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered an error while trying to move logs out of the temporary directory: %@\n Rescheduling move timer."), "-[_PFUbiquityRecordsExporter moveLogsFromTempDirectory]", 759, a1, v7);
          -[_PFUbiquityRecordsExporter scheduleTempLogMove](a1);
        }
        goto LABEL_12;
      }
    }
    else
    {
      v3 = 0;
    }
    v6 = 0;
    v4 = 0;
LABEL_12:

  }
}

@end
