@implementation PFUbiquityBaselineRecoveryOperation

- (PFUbiquityBaselineRecoveryOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return (PFUbiquityBaselineRecoveryOperationDelegate *)-[PFUbiquityImportOperation delegate](&v3, sel_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  -[PFUbiquityImportOperation setDelegate:](&v3, sel_setDelegate_, a3);
}

- (id)retainedDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return -[PFUbiquityImportOperation retainedDelegate](&v3, sel_retainedDelegate);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return -[PFUbiquityBaselineRecoveryOperation isEqual:](&v6, sel_isEqual_, a3);
}

uint64_t __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  result = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], (void *)objc_msgSend(a2, "path"), 0, *(_QWORD *)(a1[6] + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

uint64_t __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "replaceItemAtURL:options:error:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)resolveConflictsForBaseline:(_QWORD *)a3 withError:
{
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  PFUbiquityFileCoordinator *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t *v37;
  _BOOL8 v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t *v49;
  void *v51;
  char v52;
  void *v53;
  _QWORD *v55;
  id obj;
  PFUbiquityFileCoordinator *v57;
  _QWORD v58[8];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _QWORD v73[9];
  _QWORD v74[7];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  uint8_t v94[128];
  uint8_t buf[4];
  const char *v96;
  __int16 v97;
  int v98;
  _BYTE v99[24];
  void (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 1;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__59;
  v67 = __Block_byref_object_dispose__59;
  v68 = 0;
  if (a2)
    v4 = *(_QWORD *)(a2 + 8);
  else
    v4 = 0;
  v5 = (void *)-[PFUbiquityLocation createFullURL](v4);
  obj = (id)objc_msgSend(MEMORY[0x1E0CB3648], "unresolvedConflictVersionsOfItemAtURL:", v5);
  if (objc_msgSend(obj, "count"))
  {
    v49 = v64;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 1;
    v89 = 0;
    v83 = 0;
    v84 = &v83;
    v85 = 0x3052000000;
    v86 = __Block_byref_object_copy__59;
    v87 = __Block_byref_object_dispose__59;
    v88 = 0;
    v53 = v5;
    v57 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 248));
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    *(_QWORD *)v99 = 0;
    *(_QWORD *)&v99[8] = v99;
    *(_QWORD *)&v99[16] = 0x3052000000;
    v100 = __Block_byref_object_copy__59;
    v101 = __Block_byref_object_dispose__59;
    v102 = 0;
    if (a2)
    {
      v6 = *(_QWORD **)(a2 + 96);
      if (v6)
        v6 = (_QWORD *)v6[6];
    }
    else
    {
      v6 = 0;
    }
    v55 = v6;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
    if (!v7)
      goto LABEL_29;
    v8 = *(_QWORD *)v76;
    v51 = 0;
    v52 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v76 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v12 = objc_msgSend(v10, "URL");
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke;
        v74[3] = &unk_1E1EE1928;
        v74[4] = &v79;
        v74[5] = &v83;
        v74[6] = v99;
        -[PFUbiquityFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v57, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, 1, &v89, v74);
        v13 = v84[5];
        if (v13)
        {
          v14 = +[PFUbiquityBaseline metadataFromBaselineArchive:]((uint64_t)PFUbiquityBaseline, v13);
          if (v14)
          {
            v15 = *(void **)(v14 + 48);
            if (v15)
            {
              if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v55, (uint64_t)v15) & 1) == 0
                && (objc_msgSend(v55, "isEqual:", v15) & 1) == 0
                && -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v15, (uint64_t)v55))
              {

                v51 = v10;
                v52 = 0;
                v55 = v15;
              }
            }
          }
        }
        else
        {
          *((_BYTE *)v91 + 24) = 0;
          if (*((_BYTE *)v80 + 24))
            v89 = *(id *)(*(_QWORD *)&v99[8] + 40);
        }
        if (!*((_BYTE *)v91 + 24))
          v16 = v89;
        objc_msgSend(v11, "drain");
        if (!*((_BYTE *)v91 + 24))
          v17 = v89;

        v84[5] = 0;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
    }
    while (v7);
    if (!((*((_BYTE *)v91 + 24) == 0) | v52 & 1))
    {
      if (a2)
        v19 = *(_QWORD *)(a2 + 8);
      else
        v19 = 0;
      v20 = -[PFUbiquityLocation createFullURL](v19);
      *((_BYTE *)v80 + 24) = 0;
      v21 = *(_QWORD *)&v99[8];
      *(_QWORD *)(*(_QWORD *)&v99[8] + 40) = 0;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke_2;
      v73[3] = &unk_1E1EE1BC8;
      v73[6] = &v79;
      v73[7] = &v90;
      v73[4] = v51;
      v73[5] = v20;
      v73[8] = v99;
      -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v57, "coordinateWritingItemAtURL:options:error:byAccessor:", v20, 8, v21 + 40, v73);
      if (!*((_BYTE *)v91 + 24) && *((_BYTE *)v80 + 24))
        v89 = *(id *)(*(_QWORD *)&v99[8] + 40);
      v18 = (void *)v20;
    }
    else
    {
LABEL_29:
      v18 = 0;
    }

    _Block_object_dispose(v99, 8);
    _Block_object_dispose(&v79, 8);
    if (!*((_BYTE *)v91 + 24))
    {
      if (v89)
      {
        v49[5] = (uint64_t)v89;
      }
      else
      {
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
        v29 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v99 = 136315394;
          *(_QWORD *)&v99[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/P"
                               "FUbiquityBaselineRecoveryOperation.m";
          *(_WORD *)&v99[12] = 1024;
          *(_DWORD *)&v99[14] = 258;
          _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v99, 0x12u);
        }
      }
    }

    v30 = *((unsigned __int8 *)v91 + 24);
    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(&v90, 8);
    *((_BYTE *)v70 + 24) = v30;
    if (v30)
    {
      v31 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 248));
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v94, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v60;
        v34 = MEMORY[0x1E0C809B0];
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v60 != v33)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_msgSend(v36, "setResolved:", 1);
            v37 = v64;
            v64[5] = 0;
            v58[0] = v34;
            v58[1] = 3221225472;
            v58[2] = __77__PFUbiquityBaselineRecoveryOperation_resolveConflictsForBaseline_withError___block_invoke;
            v58[3] = &unk_1E1EE1BF0;
            v58[4] = v36;
            v58[5] = a1;
            v58[6] = &v63;
            v58[7] = &v69;
            -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v31, "coordinateWritingItemAtURL:options:error:byAccessor:", v53, 0, v37 + 5, v58);
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v94, 16);
        }
        while (v32);
      }

      v5 = v53;
    }
  }

  if (!*((_BYTE *)v70 + 24))
  {
    v40 = v64[5];
    if (v40)
    {
      if (a3)
        *a3 = v40;
    }
    else
    {
      v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
      v48 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline"
              "RecoveryOperation.m";
        v97 = 1024;
        v98 = 306;
        _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v38 = *((_BYTE *)v70 + 24) != 0;
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  return v38;
}

void __77__PFUbiquityBaselineRecoveryOperation_resolveConflictsForBaseline_withError___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "removeAndReturnError:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing version: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation resolveConflictsForBaseline:withError:]_block_invoke", 293, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "userInfo"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (uint64_t)shouldReplaceLocalStoreWithBaseline:(uint64_t)a1
{
  uint64_t v2;
  id *v4;
  void *v5;
  id v6;
  PFUbiquityKnowledgeVector *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PFUbiquityKnowledgeVector *v21;
  id *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  objc_opt_self();
  v4 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v2 + 248), *(void **)(v2 + 256), *(void **)(v2 + 272), 0);
  if (!a2)
  {
    v5 = 0;
    if (v4)
      goto LABEL_4;
LABEL_34:
    v6 = 0;
    goto LABEL_5;
  }
  v5 = *(void **)(a2 + 120);
  if (!v4)
    goto LABEL_34;
LABEL_4:
  v6 = v4[1];
LABEL_5:
  if (!+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v5, v6))
  {

    return 1;
  }
  v7 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:]((uint64_t)v4, 0);
  if (a2 && (v8 = *(_QWORD *)(a2 + 96)) != 0)
    v9 = *(_QWORD *)(v8 + 48);
  else
    v9 = 0;
  v10 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:](v9, (uint64_t)v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  if (v10)
    v12 = (void *)objc_msgSend(v10[1], "allKeys");
  else
    v12 = 0;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v13)
  {
    v2 = 1;
    goto LABEL_31;
  }
  v14 = v13;
  v21 = v7;
  v22 = v4;
  v15 = *(_QWORD *)v24;
LABEL_13:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v15)
      objc_enumerationMutation(v12);
    v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
    if (v10)
      v18 = (void *)objc_msgSend(v10[1], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16));
    else
      v18 = 0;
    if (objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(v2 + 248), v21, v22, (_QWORD)v23))
    {
      if ((objc_msgSend(v18, "isEqualToNumber:", v11) & 1) == 0)
        break;
      goto LABEL_22;
    }
    if (objc_msgSend(v11, "compare:", v18) == 1)
      break;
LABEL_22:
    if (v14 == ++v16)
    {
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v14 = v19;
      if (!v19)
      {
        v2 = 1;
        goto LABEL_28;
      }
      goto LABEL_13;
    }
  }
  v2 = 0;
LABEL_28:
  v7 = v21;
  v4 = v22;
LABEL_31:

  return v2;
}

- (PFUbiquityStoreMetadata)replaceLocalStoreWithBaseline:(uint64_t *)a3 error:
{
  id v6;
  id v7;
  NSPersistentStoreCoordinator *v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  PFUbiquityStoreMetadata *v22;
  id v23;
  PFUbiquityStoreMetadata *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t *v43;
  id v44;
  NSPersistentStoreCoordinator *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_opt_self();
  v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 248));
  v7 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v6, *(_QWORD *)(a1 + 256));

  if (objc_msgSend(v7, "count"))
  {
    v8 = (NSPersistentStoreCoordinator *)(id)objc_msgSend(v7, "anyObject");
    goto LABEL_6;
  }
  v9 = -[PFUbiquityBaseline createManagedObjectModel](a2);
  if (v9)
  {
    v10 = v9;
    v8 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v9);

LABEL_6:
    objc_opt_self();
    v11 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 248), *(void **)(a1 + 256), *(void **)(a1 + 272), 0);
    if (v11)
      v12 = v11[1];
    else
      v12 = 0;
    v13 = +[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 256), v12);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v14 = -[NSPersistentStoreCoordinator persistentStores](v8, "persistentStores");
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v15)
    {
      v16 = v15;
      v44 = v7;
      v45 = v8;
      v42 = a2;
      v43 = a3;
      v17 = 0;
      v18 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")), "isEqualToString:", *(_QWORD *)(a1 + 256)))v17 = v20;
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v16);
      if (!v17)
      {
        v24 = 0;
        v7 = v44;
        v8 = v45;
LABEL_41:

        return v24;
      }
      v7 = v44;
      v8 = v45;
      if (!v13)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Got nil store metadata for store named: %@"), "-[PFUbiquityBaselineRecoveryOperation replaceLocalStoreWithBaseline:error:]", 400, a1, *(_QWORD *)(a1 + 256));
        v21 = v11 ? v11[1] : 0;
        if (objc_msgSend(v21, "persistentStoreCoordinator"))
        {
          v22 = [PFUbiquityStoreMetadata alloc];
          v23 = v11 ? v11[1] : 0;
          v24 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v22, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 272), v23);
        }
        else
        {
          v24 = 0;
        }
        -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v24, v17, *(_QWORD *)(a1 + 272));

        if (!v24)
          goto LABEL_41;
      }
      v37 = objc_msgSend(v17, "URL");
      v38 = objc_msgSend(v17, "type");
      v39 = objc_msgSend(v17, "options");
      v40 = v38;
      v8 = v45;
      if (-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:](v42, v37, v40, v39, v45, v43))
      {
        v24 = (PFUbiquityStoreMetadata *)+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v17, *(_QWORD *)(a1 + 248));
        goto LABEL_41;
      }
    }
    v24 = 0;
    goto LABEL_41;
  }

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB28A8];
  v27 = (void *)MEMORY[0x1E0C99D80];
  if (!a2)
    a2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 134308, objc_msgSend(v27, "dictionaryWithObject:forKey:", a2, CFSTR("offendingBaseline")));
  if (!v28)
  {
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
    v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRe"
            "coveryOperation.m";
      v53 = 1024;
      v54 = 378;
      _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  if (!a3)
    return 0;
  v24 = 0;
  *a3 = v28;
  return v24;
}

- (void)main
{
  NSString *storeName;
  NSString *localPeerID;
  PFUbiquityBaseline *v5;
  NSString *v6;
  PFUbiquityLocation *ubiquityRootLocation;
  NSString *v8;
  NSManagedObjectModel *model;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  int *v23;
  NSString *v24;
  uint64_t v25;
  _QWORD *v26;
  int *v27;
  uint64_t v28;
  id *v29;
  id *v30;
  NSPersistentStore *store;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  void *v44;
  PFUbiquityBaseline *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t *v54;
  id v55;
  id v56;

  if ((-[PFUbiquityBaselineRecoveryOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
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
    v55 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
    if (!v55)
    {
      v54 = 0;
      v18 = 0;
LABEL_32:

      return;
    }
    v5 = [PFUbiquityBaseline alloc];
    if (self)
    {
      v6 = self->super.super._localPeerID;
      ubiquityRootLocation = self->super.super._ubiquityRootLocation;
      v8 = self->super.super._storeName;
      model = self->super._model;
    }
    else
    {
      v8 = 0;
      v6 = 0;
      ubiquityRootLocation = 0;
      model = 0;
    }
    v54 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:](v5, "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", v6, ubiquityRootLocation, v8, model);
    v53 = -[PFUbiquitySafeSaveFile existsInCloud](v54);
    if (self)
    {
      v10 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, (uint64_t)CFSTR("baseline.meta"), self->super.super._ubiquityRootLocation);
      v11 = -[PFUbiquityLocation createFullPath]((uint64_t)v10);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if (objc_msgSend(v12, "fileExistsAtPath:", v11))
      {
        v13 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, (uint64_t)CFSTR("baseline.meta"), self->super.super._ubiquityRootLocation);
        v14 = -[PFUbiquityLocation createFullPath]((uint64_t)v13);
        if (objc_msgSend(v12, "fileExistsAtPath:", v14))
        {
          v15 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, (uint64_t)CFSTR("baseline.meta"), self->super.super._ubiquityRootLocation);
          v16 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
          v17 = objc_msgSend(v12, "fileExistsAtPath:", v16);

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
    v56 = 0;
    if (!v53)
    {
LABEL_31:
      v18 = v55;
      goto LABEL_32;
    }
    v19 = -[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v54, 1, (uint64_t *)&v56);
    if (v54)
      v20 = v19;
    else
      v20 = 0;
    if (v20 != 1 || !objc_msgSend(v54, "loadFileFromLocation:error:", v54[3], &v56))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError trying to load the baseline archive: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 454, self, v56, objc_msgSend(v56, "userInfo"));
      goto LABEL_31;
    }
    if (self)
    {
      v21 = (void *)-[PFUbiquityLocation createFullURL](v54[1]);
      v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3648], "unresolvedConflictVersionsOfItemAtURL:", v21), "count");

      if (v22)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Found conflicts for baseline: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 461, v54);
        if (-[PFUbiquityBaselineRecoveryOperation resolveConflictsForBaseline:withError:]((uint64_t)self, (uint64_t)v54, &v56))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully resolved conflicts for baseline: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 463, v54);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to resolve conflicts for baseline: %@, the baseline will not be adopted.\n%@"), "-[PFUbiquityBaselineRecoveryOperation main]", 465, v54, v56);
        }
        goto LABEL_31;
      }
      if (v17)
      {
LABEL_35:
        if ((-[PFUbiquityBaselineRecoveryOperation isCancelled](self, "isCancelled") & 1) != 0)
          goto LABEL_31;
        if (self)
        {
          v23 = &OBJC_IVAR___NSCloudKitMirroringDelegate__exportActivityIdentifier;
          v24 = self->super.super._localPeerID;
        }
        else
        {
          v24 = 0;
          v23 = &OBJC_IVAR___NSCloudKitMirroringDelegate__exportActivityIdentifier;
        }
        v25 = v54[1];
        if (v25 && *(_DWORD *)(v25 + 24) != 1)
          v25 = *(_QWORD *)(v25 + 8);
        v26 = (_QWORD *)+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, v54[15], (uint64_t)v24, v54[16], (void *)v25);
        if (!v26)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCurrent baseline directory exists however an error was encountered while trying to read the current metadata: %@\nuserInfo: %@\nWill attempt to adopt the existing baseline."), "-[PFUbiquityBaselineRecoveryOperation main]", 476, self, v56, objc_msgSend(v56, "userInfo"));
          if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 480, self, v54);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 482, self, v54, v56, objc_msgSend(v56, "userInfo"));
          }
        }
        v27 = v23;
        v28 = v54[12];
        if ((objc_msgSend(v26, "isEqual:", v28) & 1) != 0)
          goto LABEL_31;
        if (v26)
        {
          v29 = (id *)v26[6];
          if (v28)
          {
LABEL_45:
            v30 = *(id **)(v28 + 48);
            goto LABEL_46;
          }
        }
        else
        {
          v29 = 0;
          if (v28)
            goto LABEL_45;
        }
        v30 = 0;
LABEL_46:
        if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v29, (uint64_t)v30))
        {
          if (-[PFUbiquityBaselineRecoveryOperation shouldReplaceLocalStoreWithBaseline:]((uint64_t)self, (uint64_t)v54))
          {
            if (-[PFUbiquityBaselineRecoveryOperation replaceLocalStoreWithBaseline:error:]((uint64_t)self, (uint64_t)v54, (uint64_t *)&v56))
            {
              if (self)
              {
                store = self->super.super._store;
                v32 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[412]);
              }
              else
              {
                store = 0;
                v32 = 0;
              }
              +[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, store, v32);
              v33 = -[PFUbiquityBaselineRecoveryOperation retainedDelegate](self, "retainedDelegate");
              v34 = v33;
              if (v33)
                objc_msgSend(v33, "recoveryOperation:didReplaceLocalStoreFileWithBaseline:", self, v54);

            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered an error trying to replace the local store file with a baseline: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 506, self, v54, v56, objc_msgSend(v56, "userInfo"));
            }
          }
          if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 512, self, v54);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 514, self, v54, v56, objc_msgSend(v56, "userInfo"));
          }
        }
        else if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v30, (uint64_t)v29))
        {
          if (self)
            v43 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[412]);
          else
            v43 = 0;
          v44 = +[PFUbiquityLocation createPeerBaselineFileLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, v43, (void *)v54[1]);
          v45 = [PFUbiquityBaseline alloc];
          if (self)
            v46 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[412]);
          else
            v46 = 0;
          v47 = -[PFUbiquityBaseline initWithBaselineLocation:andLocalPeerID:](v45, "initWithBaselineLocation:andLocalPeerID:", v44, v46);
          v48 = (_QWORD *)v47;
          if (v47
            && -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(_QWORD *)(v47 + 16), *(_QWORD *)(v47 + 32), 0))
          {
            if (objc_msgSend(v48, "loadFileFromLocation:error:", v48[2], &v56))
            {
              v49 = v48[12];
              if (v49)
                v50 = *(void **)(v49 + 48);
              else
                v50 = 0;
              if (objc_msgSend(v50, "isEqual:", v29)
                && (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v48, 0, 1, &v56) & 1) == 0
                && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to safe save peer baseline file: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 525, v48, v56, objc_msgSend(v56, "userInfo"));
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error trying to read peer baseline file: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 529, v48);
            }
          }
          else if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v54, 1, (uint64_t *)&v56)&& objc_msgSend(v54, "loadFileFromLocation:error:", v54[3], &v56))
          {
            v51 = v54[12];
            v52 = v51 ? *(void **)(v51 + 48) : 0;
            if ((objc_msgSend(v52, "isEqual:", v29) & 1) == 0)
            {
              if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 541, self, v54);
                }
              }
              else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 543, self, v54, v56, objc_msgSend(v56, "userInfo"));
              }
            }
          }

        }
        goto LABEL_31;
      }
      v35 = v54;
      v36 = v54[15];
      v37 = self->super.super._localPeerID;
    }
    else
    {
      if ((v17 & 1) != 0)
        goto LABEL_35;
      v37 = 0;
      v35 = v54;
      v36 = v54[15];
    }
    v38 = v35[1];
    if (v38 && *(_DWORD *)(v38 + 24) != 1)
      v38 = *(_QWORD *)(v38 + 8);
    v39 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, v36, (uint64_t)v37, v35[16], (void *)v38);
    if (v39)
    {
      v40 = *(_QWORD *)(v39 + 48);
      v41 = v54[12];
      if (v41)
        v42 = *(id **)(v41 + 48);
      else
        v42 = 0;
      if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v42, v40))
      {
        if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 573, self, v54);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 575, self, v54, v56, objc_msgSend(v56, "userInfo"));
        }
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot nil for current baseline metadata, %@\nuserInfo: %@"), "-[PFUbiquityBaselineRecoveryOperation main]", 557, self, v56, objc_msgSend(v56, "userInfo"));
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nWill attempt to adopt existing baseline: %@."), "-[PFUbiquityBaselineRecoveryOperation main]", 558, self, v54);
      v56 = 0;
      if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 563, self, v54);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaselineRecoveryOperation main]", 565, self, v54, v56, objc_msgSend(v56, "userInfo"));
      }
    }
    goto LABEL_31;
  }
}

@end
