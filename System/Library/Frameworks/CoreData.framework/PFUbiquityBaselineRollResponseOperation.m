@implementation PFUbiquityBaselineRollResponseOperation

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  -[PFUbiquityBaselineRollOperation setDelegate:](&v3, sel_setDelegate_, a3);
}

- (PFUbiquityBaselineRollResponseOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  return -[PFUbiquityBaselineRollOperation delegate](&v3, sel_delegate);
}

- (id)retainedDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  return -[PFUbiquityBaselineRollOperation retainedDelegate](&v3, sel_retainedDelegate);
}

id __106__PFUbiquityBaselineRollResponseOperation_canAdoptBaseline_byReplacingLocalStoreFile_withStack_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 264);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

- (void)main
{
  id v3;
  NSString *storeName;
  NSString *localPeerID;
  PFUbiquityBaseline *v6;
  NSString *v7;
  PFUbiquityLocation *ubiquityRootLocation;
  NSString *v9;
  NSManagedObjectModel *model;
  uint64_t v11;
  NSPersistentStore *store;
  _QWORD *v13;
  NSPersistentStoreCoordinator *v14;
  int v15;
  void *v16;
  PFUbiquityKnowledgeVector *v17;
  uint64_t v18;
  id v19;
  PFUbiquityKnowledgeVector *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  uint64_t v27;
  PFUbiquityLocation *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  PFUbiquityKnowledgeVector *v36;
  id *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSString *v52;
  NSString *v53;
  PFUbiquityLocation *v54;
  id *v55;
  NSPersistentStore *v56;
  uint64_t v57;
  NSPersistentStore *v58;
  uint64_t v59;
  NSPersistentStore *v60;
  uint64_t v61;
  NSString *v62;
  NSPersistentStore *v63;
  NSString *v64;
  PFUbiquityStoreMetadataMedic *v65;
  NSPersistentStore *v66;
  NSString *v67;
  PFUbiquityLocation *v68;
  void **v69;
  int v70;
  id v71;
  void *v72;
  _BOOL4 v73;
  unsigned int v74;
  NSPersistentStore *v75;
  uint64_t v76;
  NSString *v77;
  PFUbiquityLocation *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  NSPersistentStoreCoordinator *v84;
  _QWORD v85[6];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  uint64_t v91;
  id v92;
  _QWORD v93[6];
  _BYTE buf[24];
  void (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v91 = 0;
  v92 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3052000000;
  v89 = __Block_byref_object_copy__64;
  v90 = __Block_byref_object_dispose__64;
  if ((-[PFUbiquityBaselineRollResponseOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v3 = 0;
LABEL_15:
    v13 = 0;
    v16 = 0;
    v17 = 0;
    v14 = 0;
    goto LABEL_47;
  }
  objc_opt_self();
  if (self)
  {
    storeName = self->super.super.super._storeName;
    localPeerID = self->super.super.super._localPeerID;
  }
  else
  {
    storeName = 0;
    localPeerID = 0;
  }
  v3 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
  if (!v3)
    goto LABEL_15;
  v6 = [PFUbiquityBaseline alloc];
  if (self)
  {
    v7 = self->super.super.super._localPeerID;
    ubiquityRootLocation = self->super.super.super._ubiquityRootLocation;
    v9 = self->super.super.super._storeName;
    model = self->super.super._model;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    ubiquityRootLocation = 0;
    model = 0;
  }
  v11 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:](v6, "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", v7, ubiquityRootLocation, v9, model);
  if (self)
    store = self->super.super.super._store;
  else
    store = 0;
  v13 = (_QWORD *)v11;
  v14 = -[NSPersistentStore persistentStoreCoordinator](store, "persistentStoreCoordinator");
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Responding to baseline: %@"), "-[PFUbiquityBaselineRollResponseOperation main]", 128, v13);
  if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v13, 1, (uint64_t *)&v92))
  {
    if (v13)
    {
      v15 = objc_msgSend(v13, "loadFileFromLocation:error:", v13[3], &v92);
      goto LABEL_19;
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't get latest version: %@"), "-[PFUbiquityBaselineRollResponseOperation main]", 134, v92);
  }
  v15 = 0;
LABEL_19:
  if ((-[PFUbiquityBaselineRollResponseOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v16 = 0;
LABEL_46:
    v17 = 0;
    goto LABEL_47;
  }
  if (!v15)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError while attempting to load the baseline in response to a baseline roll: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRollResponseOperation main]", 213, self, v92, objc_msgSend(v92, "userInfo"));
    LODWORD(v31) = 0;
    goto LABEL_43;
  }
  v18 = MEMORY[0x1E0C809B0];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __47__PFUbiquityBaselineRollResponseOperation_main__block_invoke;
  v85[3] = &unk_1E1EDD618;
  v85[4] = self;
  v85[5] = &v86;
  -[NSPersistentStoreCoordinator performBlockAndWait:](v14, "performBlockAndWait:", v85);
  v19 = (id)v87[5];
  v20 = [PFUbiquityKnowledgeVector alloc];
  v17 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v20, "initWithStoreKnowledgeVectorDictionary:", v87[5]);
  if (v13 && (v21 = v13[12]) != 0)
    v22 = *(id **)(v21 + 48);
  else
    v22 = 0;
  if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v22, (uint64_t)v17) & 1) != 0
    || (!v13 || (v23 = v13[12]) == 0 ? (v24 = 0) : (v24 = *(void **)(v23 + 48)),
        objc_msgSend(v24, "isEqual:", v87[5])))
  {
    if (self)
    {
      v25 = self->super.super.super._storeName;
      v26 = self->super.super.super._localPeerID;
      if (v13)
        goto LABEL_32;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      if (v13)
      {
LABEL_32:
        v27 = v13[16];
        if (self)
        {
LABEL_33:
          v28 = self->super.super.super._ubiquityRootLocation;
LABEL_34:
          v29 = (void *)+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, (uint64_t)v25, (uint64_t)v26, v27, v28);
          if (!v29)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError trying to load the current metadata: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRollResponseOperation main]", 157, self, v92, objc_msgSend(v92, "userInfo"));
            }
            goto LABEL_58;
          }
          if (v13)
            v30 = v13[12];
          else
            v30 = 0;
          if (objc_msgSend(v29, "isEqual:", v30))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCurrent baseline matches the baseline archive, returning."), "-[PFUbiquityBaselineRollResponseOperation main]", 161, self);
            }
LABEL_58:
            v16 = 0;
            goto LABEL_47;
          }
          goto LABEL_48;
        }
LABEL_119:
        v28 = 0;
        goto LABEL_34;
      }
    }
    v27 = 0;
    if (self)
      goto LABEL_33;
    goto LABEL_119;
  }
LABEL_48:

  if (self)
  {
    v84 = -[NSPersistentStore persistentStoreCoordinator](self->super.super.super._store, "persistentStoreCoordinator");
    if (v13 && (v33 = v13[12]) != 0)
      v34 = *(_QWORD *)(v33 + 48);
    else
      v34 = 0;
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v95 = __Block_byref_object_copy__64;
    v96 = __Block_byref_object_dispose__64;
    v97 = 0;
    v93[0] = v18;
    v93[1] = 3221225472;
    v93[2] = __106__PFUbiquityBaselineRollResponseOperation_canAdoptBaseline_byReplacingLocalStoreFile_withStack_withError___block_invoke;
    v93[3] = &unk_1E1EDD618;
    v93[4] = self;
    v93[5] = buf;
    -[NSPersistentStoreCoordinator performBlockAndWait:](v84, "performBlockAndWait:", v93);
    v35 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v36 = [PFUbiquityKnowledgeVector alloc];
    v37 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v36, "initWithStoreKnowledgeVectorDictionary:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v82 = -[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:](v13, v37);
    if ((v82 & 1) != 0
      || (-[PFUbiquityKnowledgeVector isDescendantOfKnowledgeVector:](v37, v34) & 1) != 0)
    {
      v38 = 0;
      v31 = 1;
    }
    else
    {
      v81 = (void *)MEMORY[0x1E0CB35C8];
      v39 = (void *)MEMORY[0x1E0C99D80];
      v40 = (uint64_t)v37;
      if (!v37)
      {
        v79 = (void *)MEMORY[0x1E0C99D80];
        v40 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v39 = v79;
      }
      v41 = (uint64_t)v13;
      if (!v13)
      {
        v80 = v39;
        v41 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v39 = v80;
      }
      v42 = objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v40, CFSTR("localStoreKV"), v41, CFSTR("baseline"), 0);
      v31 = 0;
      v38 = (void *)objc_msgSend(v81, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134310, v42);
    }
    _Block_object_dispose(buf, 8);

    if ((v31 & 1) == 0)
    {
      if (v38)
      {
        v92 = v38;
      }
      else
      {
        v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollResponseOperation.m");
        v50 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/P"
                               "FUbiquityBaselineRollResponseOperation.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 96;
          _os_log_fault_impl(&dword_18A253000, v50, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }

  }
  else
  {
    v82 = 0;
    v31 = 0;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    if (v13)
    {
      v51 = v13[12];
      if (v51)
        v51 = *(_QWORD *)(v51 + 48);
    }
    else
    {
      v51 = 0;
    }
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Can adopt: %d replace: %d\nkv: %@"), "-[PFUbiquityBaselineRollResponseOperation main]", 170, v31, v82, v51);
  }
  if ((_DWORD)v31)
  {
    objc_opt_self();
    if (self)
    {
      v52 = self->super.super.super._localPeerID;
      v53 = self->super.super.super._storeName;
      v54 = self->super.super.super._ubiquityRootLocation;
    }
    else
    {
      v53 = 0;
      v52 = 0;
      v54 = 0;
    }
    v55 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, v52, v53, v54, 0);
    if ((_DWORD)v82)
    {
      if (self)
        v56 = self->super.super.super._store;
      else
        v56 = 0;
      v57 = -[NSPersistentStore URL](v56, "URL");
      if (self)
        v58 = self->super.super.super._store;
      else
        v58 = 0;
      v59 = -[NSPersistentStore type](v58, "type");
      if (self)
        v60 = self->super.super.super._store;
      else
        v60 = 0;
      v61 = -[NSPersistentStore options](v60, "options");
      if (self)
        v62 = self->super.super.super._localPeerID;
      else
        v62 = 0;
      if (!-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]((uint64_t)v13, v57, v59, v61, (uint64_t)v62, (uint64_t)v55, v14, &v92))goto LABEL_97;
      if (self)
      {
        v63 = self->super.super.super._store;
        v64 = self->super.super.super._localPeerID;
      }
      else
      {
        v63 = 0;
        v64 = 0;
      }
      if (!+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v63, (uint64_t)v64))goto LABEL_97;
      v65 = [PFUbiquityStoreMetadataMedic alloc];
      if (self)
      {
        v66 = self->super.super.super._store;
        v67 = self->super.super.super._localPeerID;
        v68 = self->super.super.super._ubiquityRootLocation;
      }
      else
      {
        v67 = 0;
        v66 = 0;
        v68 = 0;
      }
      v69 = -[PFUbiquityStoreMetadataMedic initWithStore:localPeerID:andUbiquityRootLocation:](v65, "initWithStore:localPeerID:andUbiquityRootLocation:", v66, v67, v68);
      v70 = -[PFUbiquityStoreMetadataMedic recoverMetadataWithError:](v69, &v92);

      if (v70)
      {
        v71 = -[PFUbiquityBaselineRollResponseOperation retainedDelegate](self, "retainedDelegate");
        v72 = v71;
        if (v71)
          objc_msgSend(v71, "rollResponseOperation:successfullyAdoptedBaseline:", self, v13);

        v73 = 1;
      }
      else
      {
LABEL_97:
        v73 = 0;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Adopted: %d"), "-[PFUbiquityBaselineRollResponseOperation main]", 195, v73);
    }
    else
    {
      v74 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v13, &v92);
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Made current w/o replace: %d"), "-[PFUbiquityBaselineRollResponseOperation main]", 199, v74);
      if (!v74)
        goto LABEL_111;
      if (self)
        v75 = self->super.super.super._store;
      else
        v75 = 0;
      v73 = -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v13, (uint64_t)-[NSPersistentStore identifier](v75, "identifier"));
    }
    if (v73)
    {
      if (v13)
      {
        v76 = v13[12];
        if (self)
        {
LABEL_109:
          v77 = self->super.super.super._localPeerID;
          v78 = self->super.super.super._ubiquityRootLocation;
LABEL_110:
          +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, v76, v77, v78);
          LODWORD(v31) = 1;
LABEL_112:

          goto LABEL_43;
        }
      }
      else
      {
        v76 = 0;
        if (self)
          goto LABEL_109;
      }
      v77 = 0;
      v78 = 0;
      goto LABEL_110;
    }
LABEL_111:
    LODWORD(v31) = 0;
    goto LABEL_112;
  }
LABEL_43:
  v32 = -[PFUbiquityBaselineRollResponseOperation retainedDelegate](self, "retainedDelegate");
  v16 = v32;
  if (!v32)
    goto LABEL_46;
  v17 = 0;
  if ((_DWORD)v31)
    objc_msgSend(v32, "rollResponseOperation:successfullyAdoptedBaseline:", self, v13);
  else
    objc_msgSend(v32, "rollResponseOperation:encounteredAnError:whileTryingToAdoptBaseline:", self, v92, v13);
LABEL_47:
  _Block_object_dispose(&v86, 8);

}

id __47__PFUbiquityBaselineRollResponseOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 264);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

@end
