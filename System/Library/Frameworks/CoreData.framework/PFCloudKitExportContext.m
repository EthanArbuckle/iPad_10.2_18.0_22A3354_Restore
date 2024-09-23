@implementation PFCloudKitExportContext

- (PFCloudKitExportContext)initWithOptions:(id)a3
{
  PFCloudKitExportContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitExportContext;
  v4 = -[PFCloudKitExportContext init](&v6, sel_init);
  if (v4)
  {
    v4->_options = (PFCloudKitExporterOptions *)a3;
    v4->_totalBytes = 0;
    v4->_totalRecords = 0;
    v4->_totalRecordIDs = 0;
    v4->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  self->_writtenAssetURLs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitExportContext;
  -[PFCloudKitExportContext dealloc](&v3, sel_dealloc);
}

- (BOOL)processAnalyzedHistoryInStore:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  char v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__50;
  v22 = __Block_byref_object_dispose__50;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke;
  v17[3] = &unk_1E1EDE670;
  v17[4] = a3;
  v17[5] = a4;
  v17[7] = &v18;
  v17[8] = &v24;
  v17[6] = self;
  objc_msgSend(a4, "performBlockAndWait:", v17);
  if (!*((_BYTE *)v25 + 24))
  {
    v8 = (id)v19[5];
    if (v8)
    {
      if (a5)
        *a5 = v8;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        v30 = 1024;
        v31 = 690;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v19[5] = 0;
  v6 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSFetchRequest *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  int8x16_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  __int128 v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD v50[5];
  __int128 v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  _QWORD v57[14];
  __int128 v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  uint64_t v75;

  v70 = 0;
  v71 = &v70;
  v72 = 0x3052000000;
  v73 = __Block_byref_object_copy__50;
  v74 = __Block_byref_object_dispose__50;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3052000000;
  v67 = __Block_byref_object_copy__50;
  v68 = __Block_byref_object_dispose__50;
  v69 = 0;
  v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v3 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v4 = __ckLoggingOverride;
    v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to read the last history token: %@"));
    _NSCoreDataLog(v4 != 0, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke");
    v12 = 0;
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v12 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transformedValue"), "storeTokens"), "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (!v12)
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v71[5] = (uint64_t)v14;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v65[5] = (uint64_t)v15;
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v59[3] = 0;
    v18 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"));
    -[NSFetchRequest setReturnsObjectsAsFaults:](v18, "setReturnsObjectsAsFaults:", 0);
    -[NSFetchRequest setPropertiesToFetch:](v18, "setPropertiesToFetch:", &unk_1E1F52560);
    -[NSFetchRequest setFetchBatchSize:](v18, "setFetchBatchSize:", 200);
    v19 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2;
    v57[3] = &unk_1E1EE1648;
    v20 = *(void **)(a1 + 40);
    v57[4] = *(_QWORD *)(a1 + 32);
    v57[5] = v16;
    v57[10] = &v64;
    v57[11] = v59;
    v57[12] = &v70;
    v57[13] = &v60;
    v57[6] = v17;
    v57[7] = v13;
    v58 = *(_OWORD *)(a1 + 56);
    v57[8] = v20;
    v57[9] = v12;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v18, v20, (uint64_t)v57);
    v22 = *(_QWORD *)(a1 + 64);
    if (*(_BYTE *)(*(_QWORD *)(v22 + 8) + 24))
    {
      if (!v61[3])
        goto LABEL_9;
      v50[0] = v19;
      v50[1] = 3221225472;
      v50[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3;
      v50[3] = &unk_1E1EE1620;
      v51 = *(_OWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 56);
      v53 = &v70;
      v54 = v23;
      v50[4] = v12;
      v52 = v17;
      v55 = &v60;
      v56 = v22;
      v21 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v50);
      v22 = *(_QWORD *)(a1 + 64);
      if (*(_BYTE *)(*(_QWORD *)(v22 + 8) + 24))
      {
LABEL_9:
        v43[0] = v19;
        v43[1] = 3221225472;
        v43[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4;
        v43[3] = &unk_1E1EE1620;
        v44 = *(_OWORD *)(a1 + 32);
        v24 = *(_QWORD *)(a1 + 56);
        v46 = &v64;
        v47 = v24;
        v43[4] = v12;
        v45 = v16;
        v48 = v59;
        v49 = v22;
        v21 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v43);
      }
    }
    v25 = (void *)MEMORY[0x18D76B4E4](v21);
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v26 = 16;
    else
      v26 = __ckLoggingOverride;
    v27 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished processing analyzed history with %lu metadata objects to create, %lu deleted rows without metadata."));
    objc_msgSend(v17, "count");
    objc_msgSend(v16, "count");
    _NSCoreDataLog(v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_5");
    objc_autoreleasePoolPop(v25);
    v34 = *(_QWORD *)(a1 + 64);
    if (*(_BYTE *)(*(_QWORD *)(v34 + 8) + 24))
    {
      v37[0] = v19;
      v37[1] = 3221225472;
      v37[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6;
      v37[3] = &unk_1E1EE1760;
      v37[4] = v17;
      v36 = *(_QWORD *)(a1 + 48);
      v35 = *(_QWORD *)(a1 + 56);
      v41 = v34;
      v42 = v35;
      v38 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      v39 = v36;
      v40 = v12;
      +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v37);
    }
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v13 = 0;
    v16 = 0;
    v17 = 0;
  }

  v71[5] = 0;
  v65[5] = 0;

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);
}

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  _BYTE *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[12];
  _QWORD v48[12];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40) = result;
    goto LABEL_39;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v7)
    goto LABEL_28;
  v8 = v7;
  v9 = *(_QWORD *)v50;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v50 != v9)
        objc_enumerationMutation(a2);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      v12 = (void *)objc_msgSend(v11, "analyzedObjectID");
      if (!v12)
      {
        objc_msgSend(*(id *)(a1 + 64), "deleteObject:", v11);
        goto LABEL_22;
      }
      v13 = v12;
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = _sqlEntityForEntityDescription(objc_msgSend(*(id *)(a1 + 32), "model"), (_QWORD *)objc_msgSend(v12, "entity"));
      if (v15)
        v16 = *(unsigned int *)(v15 + 184);
      else
        v16 = 0;
      v17 = objc_msgSend(v14, "numberWithUnsignedInt:", v16);
      v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
      if (objc_msgSend(v11, "finalChangeType") == 2)
      {
        v19 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "objectForKey:", v17);
        if (!v19)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKey:", v19, v17);
        }
        objc_msgSend(v19, "addObject:", v18);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
        v20 = *(_QWORD *)(a1 + 88);
      }
      else
      {
        if (objc_msgSend(v11, "finalChangeType") && objc_msgSend(v11, "finalChangeType") != 1)
        {
          v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unhandled persistent history change type: %@");
          _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)v11);
          v29 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v11;
            _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Unhandled persistent history change type: %@", buf, 0xCu);
          }
          goto LABEL_21;
        }
        v21 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "objectForKey:", v17);
        if (!v21)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setObject:forKey:", v21, v17);
        }
        objc_msgSend(v21, "addObject:", v18);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
        v20 = *(_QWORD *)(a1 + 104);
      }
      ++*(_QWORD *)(*(_QWORD *)(v20 + 8) + 24);
LABEL_21:
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
LABEL_22:
      ++v10;
    }
    while (v8 != v10);
    v30 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v8 = v30;
  }
  while (v30);
LABEL_28:
  result = objc_msgSend(*(id *)(a1 + 64), "hasChanges");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 64), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
      result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    }
  }
  v32 = *(_QWORD *)(a1 + 120);
  if (*(_BYTE *)(*(_QWORD *)(v32 + 8) + 24))
  {
    v33 = *(_QWORD *)(a1 + 104);
    v34 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(*(_QWORD *)(v33 + 8) + 24) >= 0x1F4uLL)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_20;
      v48[3] = &unk_1E1EE1620;
      v35 = *(_QWORD *)(a1 + 96);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(_QWORD *)(a1 + 64);
      v48[4] = *(_QWORD *)(a1 + 72);
      v48[5] = v36;
      v38 = *(_QWORD *)(a1 + 112);
      v48[8] = v35;
      v48[9] = v38;
      v39 = *(_QWORD *)(a1 + 48);
      v48[6] = v37;
      v48[7] = v39;
      v48[10] = v33;
      v48[11] = v32;
      result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v48);
      v32 = *(_QWORD *)(a1 + 120);
    }
    v40 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(*(_QWORD *)(v40 + 8) + 24) >= 0x1F4uLL)
    {
      v47[0] = v34;
      v47[1] = 3221225472;
      v47[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_31;
      v47[3] = &unk_1E1EE1620;
      v41 = *(_QWORD *)(a1 + 80);
      v42 = *(_QWORD *)(a1 + 64);
      v43 = *(_QWORD *)(a1 + 32);
      v44 = *(_QWORD *)(a1 + 40);
      v47[4] = *(_QWORD *)(a1 + 72);
      v47[5] = v43;
      v45 = *(_QWORD *)(a1 + 112);
      v47[8] = v41;
      v47[9] = v45;
      v47[6] = v42;
      v47[7] = v44;
      v47[10] = v40;
      v47[11] = v32;
      result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v47);
      v32 = *(_QWORD *)(a1 + 120);
    }
  }
  v4 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(v32 + 8) + 24))
LABEL_39:
    *v4 = 1;
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_20(uint64_t a1)
{
  id v2;
  id result;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("needsUpload");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v4[1] = CFSTR("needsCloudDelete");
  v5[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAA0]);
  v4[2] = CFSTR("pendingExportTransactionNumber");
  v5[2] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 32));
  v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "minusSet:", v2);

    result = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_31(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id result;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("needsUpload");
  v2 = MEMORY[0x1E0C9AAB0];
  v6[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v5[1] = CFSTR("needsCloudDelete");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v2);
  v5[2] = CFSTR("pendingExportTransactionNumber");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 32));
  v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "minusSet:", v3);

    result = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3(uint64_t a1)
{
  id v2;
  id result;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("needsUpload");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v4[1] = CFSTR("needsCloudDelete");
  v5[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAA0]);
  v4[2] = CFSTR("pendingExportTransactionNumber");
  v5[2] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 32));
  v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "minusSet:", v2);

    result = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id result;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("needsUpload");
  v2 = MEMORY[0x1E0C9AAB0];
  v6[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v5[1] = CFSTR("needsCloudDelete");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v2);
  v5[2] = CFSTR("pendingExportTransactionNumber");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 32));
  v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "minusSet:", v3);

    result = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSFetchRequest *v14;
  uint64_t v15;
  void *v16;
  int v17;
  char v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  uint64_t v38;
  NSSQLBlockRequestContext *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  int v52;
  id v53;
  id v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  NSFetchRequest *v63;
  int8x16_t v64;
  int8x16_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  NSSQLBlockRequestContext *v79;
  id v80;
  void *v81;
  id obj;
  char *obja;
  id v84;
  _QWORD v85[4];
  int8x16_t v86;
  int8x16_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[7];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  uint64_t v102;
  _QWORD v103[7];
  int8x16_t v104;
  char v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[6];
  __int128 v115;
  id v116;
  uint64_t v117;
  id v118;
  id v119;
  int8x16_t v120;
  uint64_t v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _QWORD v124[2];
  _QWORD v125[2];
  const __CFString *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v80 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v78 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  obj = objc_alloc_init(MEMORY[0x1E0C99E08]);
  while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
        if (v4)
        {
          v72 = *(_QWORD *)v111;
LABEL_8:
          v5 = 0;
          v74 = v4;
          while (1)
          {
            if (*(_QWORD *)v111 != v72)
              objc_enumerationMutation(obj);
            v6 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v5);
            v7 = (void *)objc_msgSend(obj, "objectForKey:", v6);
            v76 = v5;
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
            if (v8)
            {
              v9 = *(_QWORD *)v107;
LABEL_13:
              v10 = 0;
              while (1)
              {
                if (*(_QWORD *)v107 != v9)
                  objc_enumerationMutation(v7);
                v11 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v10);
                v12 = (void *)MEMORY[0x18D76B4E4]();
                v13 = objc_msgSend(v7, "objectForKey:", v11);
                v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v11);
                -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v13));
                -[NSFetchRequest setFetchBatchSize:](v14, "setFetchBatchSize:", 500);
                v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                if (v15)
                  v16 = *(void **)(v15 + 16);
                else
                  v16 = 0;
                v17 = objc_msgSend(v16, "preserveLegacyRecordMetadataBehavior");
                v18 = v17;
                if (v17
                  && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", v11), "propertiesByName"), "objectForKey:", CFSTR("ckRecordID")))
                {
                  v126 = CFSTR("ckRecordID");
                  -[NSFetchRequest setPropertiesToFetch:](v14, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1));
                }
                v19 = *(void **)(a1 + 40);
                v103[0] = MEMORY[0x1E0C809B0];
                v103[1] = 3221225472;
                v103[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8;
                v103[3] = &unk_1E1EE1698;
                v105 = v18;
                v20 = *(_QWORD *)(a1 + 64);
                v103[4] = v6;
                v103[5] = v20;
                v104 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
                v103[6] = v19;
                +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v14, v19, (uint64_t)v103);
                v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
                objc_autoreleasePoolPop(v12);
                if (!v21)
                  break;
                if (v8 == ++v10)
                {
                  v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
                  v8 = v22;
                  if (v22)
                    goto LABEL_13;
                  break;
                }
              }
            }
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
              break;
            v5 = v76 + 1;
            if (v76 + 1 == v74)
            {
              v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
              if (v4)
                goto LABEL_8;
              goto LABEL_29;
            }
          }
        }
      }
      break;
    }
    v2 = objc_msgSend(*(id *)(a1 + 32), "anyObject");
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v2);
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7;
    v114[3] = &unk_1E1EE1670;
    v3 = *(_QWORD *)(a1 + 32);
    v114[4] = *(_QWORD *)(a1 + 40);
    v114[5] = v2;
    v115 = *(_OWORD *)(a1 + 48);
    v120 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v116 = obj;
    v117 = v3;
    v118 = v78;
    v119 = v80;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v114);
  }
LABEL_29:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend(v80, "count"))
    {
      v124[0] = CFSTR("needsUpload");
      v125[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
      v124[1] = CFSTR("needsCloudDelete");
      v125[1] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
      v23 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v80, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      if (v23)
      {
        objc_msgSend(v78, "minusSet:", v23);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v24 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges")
      && (objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v25 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    && (+[NSCKHistoryAnalyzerState purgeAnalyzedHistoryFromStore:withManagedObjectContext:error:]((uint64_t)NSCKHistoryAnalyzerState, *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  }

  objc_msgSend(*(id *)(a1 + 40), "reset");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend((id)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "BOOLValue")&& ((v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)) == 0 ? (v28 = 0) : (v28 = *(void **)(v27 + 8)), objc_msgSend(v28, "databaseScope") == 2|| ((v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)) == 0 ? (v30 = 0) : (v30 = *(void **)(v29 + 8)), objc_msgSend(v30, "databaseScope") == 1)))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v31)
        v32 = *(void **)(v31 + 8);
      else
        v32 = 0;
      v68 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(v32, "databaseScope"));
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v33)
        v34 = *(void **)(v33 + 8);
      else
        v34 = 0;
      if (+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v68, objc_msgSend(v34, "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      {
        v97 = 0;
        v98 = &v97;
        v99 = 0x3052000000;
        v100 = __Block_byref_object_copy__50;
        v101 = __Block_byref_object_dispose__50;
        v102 = 0;
        v77 = (id)objc_msgSend(*(id *)(a1 + 48), "model");
        v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey")), "entityNamed:", CFSTR("NSCKRecordMetadata"));
        v35 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configurationName"));
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v70 = v35;
        v75 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v93, v123, 16);
        if (v75)
        {
          v73 = *(_QWORD *)v94;
LABEL_56:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v94 != v73)
              objc_enumerationMutation(v70);
            obja = v36;
            v37 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v36);
            v81 = (void *)MEMORY[0x18D76B4E4]();
            v38 = objc_msgSend(v77, "entityNamed:", objc_msgSend(v37, "name"));
            if (!v38 || *(_QWORD *)(v38 + 160))
              goto LABEL_88;
            v92[0] = MEMORY[0x1E0C809B0];
            v92[1] = 3221225472;
            v92[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_9;
            v92[3] = &unk_1E1EE16C0;
            v92[6] = &v97;
            v92[4] = v38;
            v92[5] = v69;
            v39 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v92, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
            -[NSSQLCore dispatchRequest:withRetries:](*(_QWORD *)(a1 + 48), v39, 0);
            v79 = v39;
            v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v84 = (id)v98[5];
            v41 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v88, v122, 16);
            if (v41)
            {
              v42 = 0;
              v43 = *(_QWORD *)v89;
              v44 = v40;
LABEL_63:
              v45 = 0;
              v46 = v42 + 1;
              v71 = v41 + v42;
              while (1)
              {
                if (*(_QWORD *)v89 != v43)
                  objc_enumerationMutation(v84);
                v47 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v45);
                v48 = (void *)MEMORY[0x18D76B4E4]();
                if (objc_msgSend(v47, "count") != 2)
                {

                  v66 = (void *)MEMORY[0x1E0C99DA0];
                  v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected number of items in the pk / ent array: %@"), v47);
                  objc_exception_throw((id)objc_msgSend(v66, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v67, 0));
                }
                v49 = (void *)objc_msgSend(*(id *)(a1 + 48), "newObjectIDForEntity:pk:", _sqlCoreLookupSQLEntityForEntityID(*(void **)(a1 + 48), objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", 1), "unsignedLongValue")), objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", 0), "integerValue"));
                objc_msgSend(v44, "addObject:", v49);

                if (!(v46 % 0x64))
                {
                  if (-[PFCloudKitExportContext insertRecordMetadataForObjectIDsInBatch:inManagedObjectContext:withPendingTransactionNumber:error:](*(_QWORD *)(a1 + 56), v44, *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)))
                  {
                    if ((objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0)
                    {
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
                      v50 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
                    }

                    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  }
                  else
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
                    v51 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
                  }
                  objc_msgSend(*(id *)(a1 + 40), "reset");
                }
                v52 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
                objc_autoreleasePoolPop(v48);
                if (!v52)
                  break;
                ++v45;
                ++v46;
                if (v41 == v45)
                {
                  v41 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v88, v122, 16);
                  v42 = v71;
                  if (v41)
                    goto LABEL_63;
                  break;
                }
              }
            }
            else
            {
              v44 = v40;
            }
            if (objc_msgSend(v44, "count")
              && (-[PFCloudKitExportContext insertRecordMetadataForObjectIDsInBatch:inManagedObjectContext:withPendingTransactionNumber:error:](*(_QWORD *)(a1 + 56), v44, *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              v53 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            }
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
              && objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
            {
              if ((objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
                v54 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              }
              objc_msgSend(*(id *)(a1 + 40), "reset");
            }

            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
            {
LABEL_88:

              v98[5] = 0;
              v55 = 1;
            }
            else
            {
              v55 = 0;
            }
            objc_autoreleasePoolPop(v81);
            if (!v55)
              break;
            v36 = obja + 1;
            if (obja + 1 == (char *)v75)
            {
              v56 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v93, v123, 16);
              v75 = v56;
              if (v56)
                goto LABEL_56;
              break;
            }
          }
        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v57 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          if (v57)
          {
            objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v57);
          }
          else
          {
            v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            if (v60)
            {
              v61 = v60;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            }
          }
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
            && (objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v62 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          }
        }

        v98[5] = 0;
        _Block_object_dispose(&v97, 8);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v59 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      }

    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v58 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v63 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
    -[NSFetchRequest setPredicate:](v63, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsCloudDelete == 1")));
    -[NSFetchRequest setFetchBatchSize:](v63, "setFetchBatchSize:", 500);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v63, "setReturnsObjectsAsFaults:", 0);
    v121 = *(_QWORD *)(a1 + 48);
    -[NSFetchRequest setAffectedStores:](v63, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1));
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_10;
    v85[3] = &unk_1E1EE16E8;
    v64 = *(int8x16_t *)(a1 + 40);
    v65 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v86 = vextq_s8(v64, v64, 8uLL);
    v87 = v65;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v63, (void *)v64.i64[0], (uint64_t)v85);
  }
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  id v50;
  id v51;
  id v52;
  NSString *v53;
  NSString *v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v2)
  {
    v3 = v2;
    v4 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v2);
    if (!objc_msgSend(v4, "count"))
    {
LABEL_48:
      objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v3, objc_msgSend(v3, "hasChanges"));
      goto LABEL_49;
    }
    v5 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:](NSCKRecordZoneMetadata, "fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v6 = v5;
    if (!v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
      v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
LABEL_47:

      goto LABEL_48;
    }
    v55 = v5;
    v56 = v3;
    if (objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v6, "count") == 1)
      {
        v7 = (id)objc_msgSend(v6, "anyObject");
LABEL_26:
        v40 = v7;
        goto LABEL_28;
      }
      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
        v40 = 0;
        goto LABEL_28;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
      v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v32 = *MEMORY[0x1E0CB28A8];
      v62 = *MEMORY[0x1E0CB2D68];
      v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object graph corruption detected. Objects related to '%@' are assigned to multiple zones: %@"), *(_QWORD *)(a1 + 40), v6);
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = &v63;
      v38 = &v62;
    }
    else
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v17)
        v18 = *(void **)(v17 + 8);
      else
        v18 = 0;
      if (objc_msgSend(v18, "databaseScope") != 3)
      {
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (v41)
          v42 = *(void **)(v41 + 8);
        else
          v42 = 0;
        v7 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(v42, "databaseScope"));
        goto LABEL_26;
      }
      v19 = (void *)MEMORY[0x18D76B4E4]();
      v20 = __ckLoggingOverride != 0;
      v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: %@ - Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@"));
      v22 = *(_QWORD *)(a1 + 48);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v54 = NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
      v53 = v24;
      _NSCoreDataLog(v20, v21, v25, v26, v27, v28, v29, v30, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_7");
      objc_autoreleasePoolPop(v19);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
      v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v32 = *MEMORY[0x1E0CB28A8];
      v64 = *MEMORY[0x1E0CB2D68];
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      v65[0] = objc_msgSend(v33, "stringWithFormat:", CFSTR("Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@"), v35, NSStringFromSelector(sel_shareManagedObjects_toShare_completion_), objc_msgSend(v3, "objectID"), v22, v53, v54, v3);
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = v65;
      v38 = &v64;
    }
    v39 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 134060, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
    v40 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = v39;
LABEL_28:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    {
      v43 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v40);
      if (!v43)
      {
        v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v43, v40);
      }
      v44 = (id)objc_msgSend(v43, "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "entityName"));
      if (!v44)
      {
        v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v43, "setObject:forKey:", v44, objc_msgSend(*(id *)(a1 + 40), "entityName"));
      }
      objc_msgSend(v44, "addObject:", *(_QWORD *)(a1 + 40));

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v45 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v58 != v47)
              objc_enumerationMutation(v4);
            v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v49))
            {
              objc_msgSend(*(id *)(a1 + 72), "removeObject:", v49);
              v50 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v40);
              if (!v50)
              {
                v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v50, v40);
              }
              v51 = (id)objc_msgSend(v50, "objectForKey:", objc_msgSend(v49, "entityName"));
              if (!v51)
              {
                v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v50, "setObject:forKey:", v51, objc_msgSend(v49, "entityName"));
              }
              objc_msgSend(v51, "addObject:", v49);

            }
          }
          v46 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v46);
      }
    }

    v6 = v55;
    v3 = v56;
    goto LABEL_47;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "code") == 133000
    && (v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "domain"),
        objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = 0;
    objc_msgSend(*(id *)(a1 + 80), "addObject:", *(_QWORD *)(a1 + 40));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = _sqlEntityForEntityDescription(objc_msgSend(*(id *)(a1 + 48), "model"), (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "entity"));
    if (v10)
      v11 = *(unsigned int *)(v10 + 184);
    else
      v11 = 0;
    v12 = objc_msgSend(v9, "numberWithUnsignedInt:", v11);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "_referenceData64"));
    v14 = (id)objc_msgSend(*(id *)(a1 + 88), "objectForKey:", v12);
    if (!v14)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 88), "setObject:forKey:", v14, v12);
    }
    objc_msgSend(v14, "addObject:", v13);

  }
  else
  {
    v15 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
  }
LABEL_49:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
    && (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "insertedObjects"), "count") >= 0x1F4)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "reset");
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
      v52 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    }
  }
}

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(a2);
          v11 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v11, "setNeedsUpload:", 1);
            objc_msgSend(v12, "setNeedsCloudDelete:", 0);
            objc_msgSend(v12, "setPendingExportTransactionNumber:", *(_QWORD *)(a1 + 40));
          }
          else
          {
            v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
            *a4 = 1;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    result = objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      result = (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  result = -[NSSQLiteConnection createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:metadataEntity:](v3, *(_QWORD **)(a1 + 32), *(id **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (uint64_t)insertRecordMetadataForObjectIDsInBatch:(void *)a3 inManagedObjectContext:(uint64_t)a4 withPendingTransactionNumber:(_QWORD *)a5 error:
{
  uint64_t v9;
  void *v10;
  NSFetchRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD *v41;
  char v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v48 = 0;
  v9 = objc_msgSend((id)objc_msgSend(a2, "lastObject"), "entity");
  if (v9)
  {
    if ((*(_BYTE *)(v9 + 120) & 4) != 0)
    {
      v10 = *(void **)(v9 + 72);
    }
    else
    {
      do
      {
        v10 = (void *)v9;
        v9 = objc_msgSend((id)v9, "superentity");
      }
      while (v9);
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", objc_msgSend(v10, "name"));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), a2));
  v12 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v11, &v48);
  if (!v12)
  {
    v30 = v48;
    goto LABEL_28;
  }
  v13 = v12;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v14)
  {
    v15 = v14;
    v41 = a5;
    v16 = *(_QWORD *)v45;
    v42 = 1;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x18D76B4E4]();
        v20 = *(_QWORD *)(a1 + 8);
        if (v20)
          v21 = *(void **)(v20 + 8);
        else
          v21 = 0;
        v22 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(v21, "databaseScope"));
        v23 = *(_QWORD *)(a1 + 8);
        if (v23)
          v24 = *(void **)(v23 + 16);
        else
          v24 = 0;
        v25 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v18, objc_msgSend(v24, "preserveLegacyRecordMetadataBehavior"), v22, 0, &v48);
        if (v25)
        {
          v26 = v25;
          objc_msgSend(v25, "setNeedsUpload:", 1);
          objc_msgSend(v26, "setPendingExportTransactionNumber:", a4);
          objc_msgSend(v26, "setPendingExportChangeTypeNumber:", &unk_1E1F4B7C8);
        }
        else
        {
          v27 = v48;
          v42 = 0;
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      v15 = v28;
    }
    while (v28);
    a5 = v41;
    if ((v42 & 1) == 0)
    {
LABEL_28:
      v31 = v48;
      if (v31)
      {
        if (a5)
        {
          v29 = 0;
          *a5 = v31;
          goto LABEL_34;
        }
      }
      else
      {
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
        v39 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
          v51 = 1024;
          v52 = 1366;
          _os_log_fault_impl(&dword_18A253000, v39, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v29 = 0;
      goto LABEL_34;
    }
  }
  v29 = 1;
LABEL_34:

  return v29;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_10(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(a2);
          v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "createRecordIDForMovedRecord");
          objc_msgSend(v7, "addObject:", v12);

        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }
    v13 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E0C9AA60], v7, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (!v13)
      goto LABEL_18;
    v14 = v13;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      v18 = MEMORY[0x1E0C9AAA0];
      v19 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v21, "setIsUploaded:", v18);
          objc_msgSend(v21, "setNeedsDelete:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) & 1) == 0)
    {
LABEL_18:
      v22 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)newOperationBySerializingDirtyObjectsInStore:(void *)a3 inManagedObjectContext:(_QWORD *)a4 error:
{
  PFCloudKitOperationBatch *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[12];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__50;
  v36 = __Block_byref_object_dispose__50;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__50;
  v30 = __Block_byref_object_dispose__50;
  v31 = 0;
  v8 = objc_alloc_init(PFCloudKitOperationBatch);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke;
  v25[3] = &unk_1E1EE1710;
  v25[4] = a2;
  v25[5] = a1;
  v25[10] = &v38;
  v25[11] = &v26;
  v25[6] = a3;
  v25[7] = v8;
  v25[8] = v9;
  v25[9] = &v32;
  objc_msgSend(a3, "performBlockAndWait:", v25);
  v10 = (void *)a1[5];
  v11 = v27[5];
  if (v11)
    v12 = (id)objc_msgSend(*(id *)(v11 + 40), "copy");
  else
    v12 = 0;
  objc_msgSend(v10, "addObjectsFromArray:", v12);
  v13 = 0;
  if (*((_BYTE *)v39 + 24) && v8)
  {
    v14 = -[NSMutableArray count](v8->_records, "count");
    if (-[NSMutableSet count](v8->_deletedRecordIDs, "count") + v14)
    {
      v13 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()), "initWithRecordsToSave:recordIDsToDelete:", v8->_records, -[NSMutableSet allObjects](v8->_deletedRecordIDs, "allObjects"));
      a1[2] += v8->_sizeInBytes;
      a1[3] += -[NSMutableArray count](v8->_records, "count");
      a1[4] += -[NSMutableSet count](v8->_deletedRecordIDs, "count");
    }
    else
    {
      v13 = 0;
    }
  }

  v27[5] = 0;
  if (!*((_BYTE *)v39 + 24))
  {
    v15 = (id)v33[5];
    if (v15)
    {
      if (a4)
        *a4 = v15;
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        v44 = 1024;
        v45 = 1039;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    v13 = 0;
  }

  v33[5] = 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v13;
}

void __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke(uint64_t a1)
{
  id v1;
  NSFetchRequest *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  PFCloudKitSerializer *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  PFMirroredManyToManyRelationshipV2 *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  NSFetchRequest *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  id v116;
  id v117;
  NSFetchRequest *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  char v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  void *v133;
  id v134;
  id v135;
  uint64_t v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  id v149;
  id obj;
  uint64_t v151;
  uint64_t v152;
  void *context;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  PFCloudKitMetadataCache *v158;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
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
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _BYTE v192[128];
  uint64_t v193;
  uint8_t buf[4];
  char *v195;
  __int16 v196;
  void *v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _QWORD v205[4];

  v205[1] = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0);
  v205[0] = *(_QWORD *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 1));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3)
    v4 = *(_QWORD *)(v3 + 32);
  else
    v4 = 0;
  -[NSFetchRequest setFetchLimit:](v2, "setFetchLimit:", v4);
  -[NSFetchRequest setPropertiesToFetch:](v2, "setPropertiesToFetch:", &unk_1E1F52578);
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsUpload = YES")));
  v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v6 = v5;
  if (v5)
  {
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v188, v204, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v189;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v189 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x18D76B4E4]();
          v12 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v10);
          objc_msgSend(v1, "addObject:", v12);

          objc_autoreleasePoolPop(v11);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v188, v204, 16);
      }
      while (v7);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v158 = objc_alloc_init(PFCloudKitMetadataCache);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v14)
      v15 = *(_QWORD *)(v14 + 16);
    else
      v15 = 0;
    if (-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]((id *)&v158->super.isa, v1, MEMORY[0x1E0C9AA60], *(void **)(a1 + 32), *(void **)(a1 + 48), v15, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
    {
      v16 = [PFCloudKitSerializer alloc];
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v17)
        v18 = *(_QWORD *)(v17 + 16);
      else
        v18 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:](v16, "initWithMirroringOptions:metadataCache:recordNamePrefix:", v18, v158, 0);
      v184 = 0u;
      v185 = 0u;
      v186 = 0u;
      v187 = 0u;
      v152 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v184, v203, 16);
      if (v152)
      {
        v151 = *(_QWORD *)v185;
        v148 = *MEMORY[0x1E0CB28A8];
LABEL_21:
        v155 = 0;
        while (1)
        {
          if (*(_QWORD *)v185 != v151)
            objc_enumerationMutation(v6);
          v19 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v155);
          context = (void *)MEMORY[0x18D76B4E4]();
          v154 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v19);
          v156 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v154, "entity"));
          v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          v21 = objc_msgSend(v20, "zoneID");
          if (v158
            && (v21 = -[NSMutableSet containsObject:](v158->_mutableZoneIDs, "containsObject:", v21), (_DWORD)v21))
          {
            if (objc_msgSend(v19, "needsCloudDelete"))
            {
              -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v20, v156);
            }
            else
            {
              v32 = (void *)objc_msgSend(*(id *)(a1 + 48), "existingObjectWithID:error:", v154, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
              v33 = v32;
              if (v32)
              {
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "objectID"), "persistentStore"), "identifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "identifier")))
                {
                  v149 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
                  v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
                  if (v34)
                    obj = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:](v34, v33, 0, 1, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
                  else
                    obj = 0;
                  objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v33, objc_msgSend(v33, "hasChanges"));
                  if (obj)
                  {
                    v182 = 0u;
                    v183 = 0u;
                    v180 = 0u;
                    v181 = 0u;
                    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v202, 16);
                    if (v35)
                    {
                      v36 = *(_QWORD *)v181;
LABEL_39:
                      v37 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v181 != v36)
                          objc_enumerationMutation(obj);
                        v38 = *(_QWORD *)(a1 + 56);
                        v39 = v38 ? *(void **)(v38 + 8) : 0;
                        v40 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v37);
                        if (objc_msgSend(v39, "containsObject:", objc_msgSend(v40, "recordID")))
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), (void *)objc_msgSend(v40, "recordID"), v156);
                        else
                          -[PFCloudKitOperationBatch addRecord:](*(_QWORD *)(a1 + 56), v40);
                        if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) != 0)break;
                        if (v35 == ++v37)
                        {
                          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v202, 16);
                          v35 = v41;
                          if (v41)
                            goto LABEL_39;
                          break;
                        }
                      }
                    }
                  }
                  else
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
                    v44 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                  }
                  v178 = 0u;
                  v179 = 0u;
                  v176 = 0u;
                  v177 = 0u;
                  v45 = (void *)objc_msgSend(v19, "moveReceipts");
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
                  if (v46)
                  {
                    v47 = *(_QWORD *)v177;
                    do
                    {
                      for (j = 0; j != v46; ++j)
                      {
                        if (*(_QWORD *)v177 != v47)
                          objc_enumerationMutation(v45);
                        v49 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * j);
                        if (objc_msgSend(v49, "needsCloudDelete"))
                        {
                          if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) != 0)goto LABEL_69;
                          v50 = (void *)objc_msgSend(v49, "createRecordIDForMovedRecord");
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v50, v156);
                          objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v49, "objectID"));

                        }
                      }
                      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
                    }
                    while (v46);
                  }
LABEL_69:

                }
              }
              else
              {
                v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                if (v42)
                {
                  if (objc_msgSend((id)objc_msgSend(v42, "domain"), "isEqualToString:", v148)
                    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code") == 133000)
                  {
                    objc_msgSend(v19, "setNeedsCloudDelete:", 1);
                    -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v20, v156);
                    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
                  }
                  else
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
                    v43 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                  }
                }
              }
            }
          }
          else
          {
            v22 = (void *)MEMORY[0x18D76B4E4](v21);
            v23 = __ckLoggingOverride;
            v24 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Ignoring dirty metadata for record in immutable zone: %@"));
            v31 = v23 >= 3 ? 3 : v23;
            _NSCoreDataLog(v31, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[PFCloudKitExportContext newOperationBySerializingDirtyObjectsInStore:inManagedObjectContext:error:]_block_invoke");
            objc_autoreleasePoolPop(v22);
            objc_msgSend(v19, "setNeedsUpload:", 0);
            objc_msgSend(v19, "setNeedsCloudDelete:", 0);
          }

          if (objc_msgSend(*(id *)(a1 + 48), "hasChanges"))
          {
            v51 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "insertedObjects"), "count");
            v52 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "updatedObjects"), "count");
            if ((unint64_t)(v52
                                  + v51
                                  + objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "deletedObjects"), "count")) >= 0xC9
              && (objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) & 1) == 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
              v53 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            }
          }
          objc_msgSend(*(id *)(a1 + 48), "refreshAllObjects");
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
            v54 = -[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56))? 5: 0;
          else
            v54 = 5;
          objc_autoreleasePoolPop(context);
          if (v54)
            break;
          if (++v155 == v152)
          {
            v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v184, v203, 16);
            v152 = v55;
            if (v55)
              goto LABEL_21;
            break;
          }
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) == 0)
        {
          v56 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isUploaded = NO")), *(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if (v56)
          {
            v157 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator"), "managedObjectModel");
            v174 = 0u;
            v175 = 0u;
            v172 = 0u;
            v173 = 0u;
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
            if (v57)
            {
              v58 = *(_QWORD *)v173;
LABEL_89:
              v59 = 0;
              while (1)
              {
                if (*(_QWORD *)v173 != v58)
                  objc_enumerationMutation(v56);
                v60 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v59);
                if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) != 0)break;
                v61 = -[NSCKMirroredRelationship createRecordID](v60);
                v62 = objc_msgSend(v61, "zoneID");
                if (v158
                  && (v62 = -[NSMutableSet containsObject:](v158->_mutableZoneIDs, "containsObject:", v62),
                      (v62 & 1) != 0))
                {
                  v63 = *(_QWORD *)(a1 + 56);
                  if (v63)
                    v64 = *(void **)(v63 + 32);
                  else
                    v64 = 0;
                  if ((objc_msgSend(v64, "containsObject:", v61) & 1) == 0)
                  {
                    v65 = *(_QWORD *)(a1 + 56);
                    v66 = v65 ? *(void **)(v65 + 8) : 0;
                    if ((objc_msgSend(v66, "containsObject:", v61) & 1) == 0)
                    {
                      if (objc_msgSend(v60, "needsDelete"))
                      {
                        -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v61, (uint64_t)CFSTR("CDMR"));
                      }
                      else
                      {
                        v76 = -[NSCKMirroredRelationship createRecordIDForRecord](v60);
                        v77 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v60);
                        v78 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v157, "entitiesByName"), "objectForKeyedSubscript:", objc_msgSend(v60, "cdEntityName")), "relationshipsByName"), "objectForKeyedSubscript:", objc_msgSend(v60, "relationshipName"));
                        v79 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v61, v76, v77, v78, objc_msgSend(v78, "inverseRelationship"), 0);
                        v80 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordClass[0]()), "initWithRecordType:recordID:", CFSTR("CDMR"), v61);
                        v81 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                        if (v81)
                          v82 = *(void **)(v81 + 16);
                        else
                          v82 = 0;
                        v83 = objc_msgSend(v82, "useDeviceToDeviceEncryption");
                        v84 = (uint64_t)v80;
                        if (v83)
                          v84 = objc_msgSend(v80, "encryptedValueStore", v80);
                        -[PFMirroredManyToManyRelationshipV2 populateRecordValues:](v79, "populateRecordValues:", v84);
                        -[PFCloudKitOperationBatch addRecord:](*(_QWORD *)(a1 + 56), v80);

                      }
                    }
                  }
                }
                else
                {
                  v67 = (void *)MEMORY[0x18D76B4E4](v62);
                  v68 = __ckLoggingOverride;
                  v69 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Ignoring update to dirty mirrored relationship because the zone is not mutable: %@"));
                  _NSCoreDataLog(v68 != 0, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"-[PFCloudKitExportContext newOperationBySerializingDirtyObjectsInStore:inManagedObjectContext:error:]_block_invoke");
                  objc_autoreleasePoolPop(v67);
                  objc_msgSend(v60, "setIsUploaded:", MEMORY[0x1E0C9AAB0]);
                }

                if (v57 == ++v59)
                {
                  v85 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
                  v57 = v85;
                  if (v85)
                    goto LABEL_89;
                  break;
                }
              }
            }
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
            v135 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          }
        }
        v136 = *(_QWORD *)(a1 + 56);
        if (v136)
          v137 = *(void **)(v136 + 8);
        else
          v137 = 0;
        v138 = +[NSCKMirroredRelationship markRelationshipsForDeletedRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (void *)objc_msgSend(v137, "allObjects"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v139 = v138;
        if (v138)
        {
          v170 = 0u;
          v171 = 0u;
          v168 = 0u;
          v169 = 0u;
          v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v168, v199, 16);
          if (v140)
          {
            v141 = *(_QWORD *)v169;
LABEL_177:
            v142 = 0;
            while (1)
            {
              if (*(_QWORD *)v169 != v141)
                objc_enumerationMutation(v139);
              v143 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v142);
              if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) != 0)break;
              v144 = *(_QWORD *)(a1 + 56);
              if (v144)
                v145 = *(void **)(v144 + 8);
              else
                v145 = 0;
              if ((objc_msgSend(v145, "containsObject:", v143) & 1) == 0)
                -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v143, (uint64_t)CFSTR("CDMR"));
              if (v140 == ++v142)
              {
                v146 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v168, v199, 16);
                v140 = v146;
                if (v146)
                  goto LABEL_177;
                break;
              }
            }
          }
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
          v147 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        }
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v86 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
  }
  else
  {
    v158 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    && (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    v87 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
    -[NSFetchRequest setPredicate:](v87, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsShareUpdate = YES OR needsShareDelete = YES")));
    -[NSFetchRequest setPropertiesToFetch:](v87, "setPropertiesToFetch:", &unk_1E1F52590);
    v88 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v87, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v89 = v88;
    if (v88)
    {
      v166 = 0u;
      v167 = 0u;
      v164 = 0u;
      v165 = 0u;
      v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v164, v198, 16);
      if (v90)
      {
        v91 = *(_QWORD *)v165;
        do
        {
          v92 = 0;
          do
          {
            if (*(_QWORD *)v165 != v91)
              objc_enumerationMutation(v89);
            v93 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v92);
            v94 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v93);
            if (!objc_msgSend(v93, "encodedShareData"))
            {
              v95 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Zone metadata is missing it's encoded share data but is marked for a mutation: %@ - %@");
              _NSCoreDataLog(17, v95, v96, v97, v98, v99, v100, v101, (uint64_t)v94);
              v102 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v195 = v94;
                v196 = 2112;
                v197 = v93;
                _os_log_fault_impl(&dword_18A253000, v102, OS_LOG_TYPE_FAULT, "CoreData: Zone metadata is missing it's encoded share data but is marked for a mutation: %@ - %@", buf, 0x16u);
              }
            }
            v103 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            if (v103 && (v104 = *(_QWORD *)(v103 + 16)) != 0)
              v105 = *(_QWORD *)(v104 + 136);
            else
              v105 = 0;
            v106 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v105, (void *)objc_msgSend(v93, "encodedShareData"), v94, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
            if (!v106)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
              v117 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);

              goto LABEL_149;
            }
            if (objc_msgSend(v93, "needsShareUpdate"))
            {
              -[PFCloudKitOperationBatch addRecord:](*(_QWORD *)(a1 + 56), v106);
              if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) != 0)goto LABEL_148;
            }
            else if (objc_msgSend(v93, "needsShareDelete"))
            {
              -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), (void *)objc_msgSend(v106, "recordID"), objc_msgSend(v106, "recordType"));
              if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)))
              {
LABEL_148:

                goto LABEL_149;
              }
            }
            else
            {
              v107 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetched dirty zone that didn't need a share update or delete: %@");
              _NSCoreDataLog(17, v107, v108, v109, v110, v111, v112, v113, (uint64_t)v93);
              v114 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v195 = (char *)v93;
                _os_log_fault_impl(&dword_18A253000, v114, OS_LOG_TYPE_FAULT, "CoreData: Fetched dirty zone that didn't need a share update or delete: %@", buf, 0xCu);
              }
            }

            ++v92;
          }
          while (v90 != v92);
          v115 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v164, v198, 16);
          v90 = v115;
        }
        while (v115);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v116 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
  }
LABEL_149:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    && (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    v118 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
    v193 = *(_QWORD *)(a1 + 32);
    -[NSFetchRequest setAffectedStores:](v118, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1));
    v119 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v119)
      v120 = *(_QWORD *)(v119 + 32);
    else
      v120 = 0;
    -[NSFetchRequest setFetchLimit:](v118, "setFetchLimit:", v120);
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v118, "setRelationshipKeyPathsForPrefetching:", &unk_1E1F525A8);
    -[NSFetchRequest setPredicate:](v118, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(needsCloudDelete == 1) AND !(SELF IN %@)"), *(_QWORD *)(a1 + 64)));
    -[NSFetchRequest setReturnsObjectsAsFaults:](v118, "setReturnsObjectsAsFaults:", 0);
    v121 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v118, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v122 = v121;
    if (v121)
    {
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
      if (v123)
      {
        v124 = *(_QWORD *)v161;
LABEL_156:
        v125 = 0;
        while (1)
        {
          if (*(_QWORD *)v161 != v124)
            objc_enumerationMutation(v122);
          v126 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v125);
          v127 = (void *)MEMORY[0x18D76B4E4]();
          v128 = -[PFCloudKitExportContext currentBatchExceedsThresholds:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
          if ((v128 & 1) == 0)
          {
            v129 = (void *)objc_msgSend(v126, "createRecordIDForMovedRecord");
            v130 = -[NSCKRecordMetadata createObjectIDForLinkedRow]((void *)objc_msgSend(v126, "recordMetadata"));
            v131 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v130, "entity"));
            -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(_QWORD *)(a1 + 56), v129, v131);

          }
          objc_autoreleasePoolPop(v127);
          if ((v128 & 1) != 0)
            break;
          if (v123 == ++v125)
          {
            v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
            if (v123)
              goto LABEL_156;
            break;
          }
        }
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v132 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "hasChanges"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v133 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v133)
        v134 = v133;
    }
  }

}

- (uint64_t)currentBatchExceedsThresholds:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      v4 = objc_msgSend(*(id *)(a2 + 24), "count");
      v5 = objc_msgSend(*(id *)(a2 + 8), "count") + v4;
    }
    else
    {
      v5 = 0;
    }
    v6 = *(_QWORD *)(v3 + 8);
    if (v6)
      v7 = *(_QWORD *)(v6 + 32);
    else
      v7 = 0;
    if (v5 == v7)
      return 1;
    if (a2)
    {
      v8 = *(_QWORD *)(a2 + 40);
      if (!v6)
        return v8 >= v6;
    }
    else
    {
      v8 = 0;
      if (!v6)
        return v8 >= v6;
    }
    v6 = *(_QWORD *)(v6 + 24);
    return v8 >= v6;
  }
  return result;
}

- (BOOL)checkForObjectsNeedingExportInStore:(id)a3 andReturnCount:(unint64_t *)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSFetchRequest *v14;
  uint64_t v15;
  NSFetchRequest *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v10 = (void *)+[NSCKRecordMetadata countRecordMetadataInStore:matchingPredicate:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (uint64_t)a3, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsUpload = YES")), (uint64_t)a5, &v27);
  if (v10)
  {
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    v12 = (void *)+[NSCKMirroredRelationship countMirroredRelationshipsInStore:matchingPredicate:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (uint64_t)a3, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isUploaded = NO")), (uint64_t)a5, &v27);
    if (v12)
    {
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
      v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
      -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsShareUpdate = YES OR needsShareDelete = YES")));
      -[NSFetchRequest setResultType:](v14, "setResultType:", 4);
      v33[0] = a3;
      -[NSFetchRequest setAffectedStores:](v14, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1));
      if (a5)
      {
        v15 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v14, &v27);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_7;
      }
      else
      {
        v15 = 0;
      }
      v16 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
      -[NSFetchRequest setPredicate:](v16, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsCloudDelete = YES")));
      -[NSFetchRequest setResultType:](v16, "setResultType:", 4);
      v32 = a3;
      -[NSFetchRequest setAffectedStores:](v16, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1));
      if (a5)
      {
        v17 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v16, &v27);
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_7;
      }
      else
      {
        v17 = 0;
      }
      *a4 = v13 + v11 + v15 + v17;
      LOBYTE(v17) = 1;
      return v17;
    }
  }
LABEL_7:
  if (!v27)
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
    v25 = __pflogFaultLog;
    LODWORD(v17) = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)v17)
      return v17;
    *(_DWORD *)buf = 136315394;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
    v30 = 1024;
    v31 = 1092;
    _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_12:
    LOBYTE(v17) = 0;
    return v17;
  }
  if (!a6)
    goto LABEL_12;
  LOBYTE(v17) = 0;
  *a6 = v27;
  return v17;
}

- (BOOL)modifyRecordsOperationFinishedForStore:(uint64_t)a3 withSavedRecords:(uint64_t)a4 deletedRecordIDs:(uint64_t)a5 operationError:(void *)a6 managedObjectContext:(_QWORD *)a7 error:
{
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[11];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__50;
  v25 = __Block_byref_object_dispose__50;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke;
  v20[3] = &unk_1E1EE1760;
  v20[4] = a3;
  v20[5] = a2;
  v20[9] = &v27;
  v20[10] = &v21;
  v20[6] = a6;
  v20[7] = a1;
  v20[8] = a4;
  objc_msgSend(a6, "performBlockAndWait:", v20);
  if (!*((_BYTE *)v28 + 24))
  {
    v10 = (id)v22[5];
    v11 = v22[5];
    if (v11)
    {
      if (a7)
        *a7 = v11;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        v33 = 1024;
        v34 = 1312;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  v8 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v8;
}

void __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSManagedObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  id v71;
  id v72;
  char v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t k;
  void *v85;
  id v86;
  NSBatchUpdateRequest *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  NSManagedObject *v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  id obj;
  void *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[5];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  const __CFString *v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v2 = *(void **)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v128 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          v7 = +[PFCloudKitSerializer isMirroredRelationshipRecordType:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend(v6, "recordType"));
          v8 = v105;
          if ((v7 & 1) != 0
            || (v9 = (void *)objc_msgSend(v6, "recordType"),
                v10 = objc_msgSend(v9, "isEqualToString:", getCloudKitCKRecordTypeShare[0]()),
                v8 = obj,
                v10))
          {
            objc_msgSend(v8, "addObject:", v6);
          }
          else
          {
            objc_msgSend(v104, "setObject:forKey:", v6, objc_msgSend(v6, "recordID"));
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      }
      while (v3);
    }
    v102 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 32), MEMORY[0x1E0C9AA60], *(void **)(a1 + 40), *(void **)(a1 + 48), (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    if (!v102)
    {
      v43 = (void *)MEMORY[0x18D76B4E4]();
      v44 = __ckLoggingOverride;
      v45 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch record metadata for saved records: %@\n%@"));
      _NSCoreDataLog(v44 != 0, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
      objc_autoreleasePoolPop(v43);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v52 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      goto LABEL_38;
    }
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v11 = (void *)objc_msgSend(v104, "allKeys");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v124;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v124 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v14);
          v16 = objc_msgSend(v104, "objectForKey:", v15);
          v17 = (void *)objc_msgSend(v102, "objectForKey:", v15);
          if (!v16)
          {
            v23 = (void *)MEMORY[0x18D76B4E4](v17);
            v24 = __ckLoggingOverride;
            v25 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Can't find record for recordID '%@' even though it was supposedly saved in these records: %@"));
            _NSCoreDataLog(v24 != 0, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
LABEL_28:
            objc_autoreleasePoolPop(v23);
            goto LABEL_31;
          }
          v18 = v17;
          if (!v17)
          {
            v23 = (void *)MEMORY[0x18D76B4E4]();
            v32 = __ckLoggingOverride;
            v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Can't find metadata for recordID '%@' even though it was supposedly saved in these records: %@"));
            _NSCoreDataLog(v32 != 0, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
            goto LABEL_28;
          }
          objc_msgSend(v17, "setNeedsUpload:", 0);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v19 && (v20 = *(_QWORD *)(v19 + 16)) != 0)
            v21 = *(_QWORD *)(v20 + 136);
          else
            v21 = 0;
          v22 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v21, v16, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          if (v22)
          {
            objc_msgSend(v18, "setEncodedRecord:", v22);
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v40 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          }

LABEL_31:
          ++v14;
        }
        while (v12 != v14);
        v41 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
        v12 = v41;
      }
      while (v41);
    }
LABEL_38:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
      if (v53)
      {
        v54 = *(_QWORD *)v120;
        do
        {
          v55 = 0;
          do
          {
            if (*(_QWORD *)v120 != v54)
              objc_enumerationMutation(obj);
            v56 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v55);
            v57 = (void *)objc_msgSend((id)objc_msgSend(v56, "recordID"), "zoneID");
            v58 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (v58)
              v59 = *(void **)(v58 + 16);
            else
              v59 = 0;
            v60 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v57, objc_msgSend(v59, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            if (v60)
            {
              v61 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              if (v61
                && (v62 = *(_QWORD *)(v61 + 16)) != 0
                && (v63 = *(_QWORD *)(v62 + 136)) != 0
                && (v64 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v63, (uint64_t)v56, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))) != 0)
              {
                -[NSManagedObject setEncodedShareData:](v60, "setEncodedShareData:", v64);
                -[NSManagedObject setNeedsShareUpdate:](v60, "setNeedsShareUpdate:", 0);
              }
              else
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
                v66 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
                v64 = 0;
              }

            }
            else
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              v65 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            }
            ++v55;
          }
          while (v53 != v55);
          v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
          v53 = v67;
        }
        while (v67);
      }
    }
    v68 = *(_QWORD *)(a1 + 72);
    if (*(_BYTE *)(*(_QWORD *)(v68 + 8) + 24))
    {
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke_2;
      v118[3] = &unk_1E1EE1738;
      v69 = *(void **)(a1 + 48);
      v118[4] = *(_QWORD *)(a1 + 56);
      v70 = +[NSCKMirroredRelationship updateMirroredRelationshipsMatchingRecords:forStore:withManagedObjectContext:usingBlock:error:]((uint64_t)NSCKMirroredRelationship, v105, *(_QWORD *)(a1 + 40), v69, (uint64_t)v118, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v68 = *(_QWORD *)(a1 + 72);
      if (!v70)
      {
        *(_BYTE *)(*(_QWORD *)(v68 + 8) + 24) = 0;
        v71 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v68 = *(_QWORD *)(a1 + 72);
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(v68 + 8) + 24))
    {
      if ((+[NSCKMirroredRelationship purgeMirroredRelationshipsWithRecordIDs:fromStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(void **)(a1 + 64), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v72 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      }
      v68 = *(_QWORD *)(a1 + 72);
      if (*(_BYTE *)(*(_QWORD *)(v68 + 8) + 24))
      {
        v73 = +[NSCKRecordMetadata purgeRecordMetadataWithRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 64), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
        v68 = *(_QWORD *)(a1 + 72);
        if ((v73 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(v68 + 8) + 24) = 0;
          v74 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          v68 = *(_QWORD *)(a1 + 72);
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(v68 + 8) + 24))
    {
      v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v76 = *(void **)(a1 + 64);
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
      if (v77)
      {
        v78 = *(_QWORD *)v115;
        do
        {
          for (j = 0; j != v77; ++j)
          {
            if (*(_QWORD *)v115 != v78)
              objc_enumerationMutation(v76);
            v80 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
            v81 = (id)objc_msgSend(v75, "objectForKey:", objc_msgSend(v80, "zoneID"));
            if (!v81)
            {
              v81 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(v75, "setObject:forKey:", v81, objc_msgSend(v80, "zoneID"));
            }
            objc_msgSend(v81, "addObject:", objc_msgSend(v80, "recordName"));

            v82 = (void *)objc_msgSend(v80, "recordName");
            if (objc_msgSend(v82, "isEqualToString:", getCloudKitCKRecordNameZoneWideShare()))
              objc_msgSend(v101, "addObject:", v80);
          }
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
        }
        while (v77);
      }
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v83 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
      if (v83)
      {
        v100 = *(_QWORD *)v111;
        while (2)
        {
          v99 = v83;
          for (k = 0; k != v99; ++k)
          {
            if (*(_QWORD *)v111 != v100)
              objc_enumerationMutation(v75);
            v85 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
            v86 = (id)objc_msgSend(v75, "objectForKey:", v85);
            v87 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
            -[NSBatchUpdateRequest setPredicate:](v87, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("zoneName = %@ AND ownerName = %@ AND recordName in %@"), objc_msgSend(v85, "zoneName"), objc_msgSend(v85, "ownerName"), v86));
            v134 = *(_QWORD *)(a1 + 40);
            -[NSPersistentStoreRequest setAffectedStores:](v87, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1));
            v132 = CFSTR("needsCloudDelete");
            v133 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAA0]);
            -[NSBatchUpdateRequest setPropertiesToUpdate:](v87, "setPropertiesToUpdate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
            -[NSBatchUpdateRequest setResultType:](v87, "setResultType:", 0);
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v87, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              v88 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              goto LABEL_90;
            }

          }
          v83 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
          if (v83)
            continue;
          break;
        }
      }
      v86 = 0;
      v87 = 0;
LABEL_90:
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v89 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
      if (v89)
      {
        v90 = *(_QWORD *)v107;
        do
        {
          v91 = 0;
          do
          {
            if (*(_QWORD *)v107 != v90)
              objc_enumerationMutation(v101);
            v92 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v91), "zoneID");
            v93 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (v93)
              v94 = *(void **)(v93 + 16);
            else
              v94 = 0;
            v95 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v92, objc_msgSend(v94, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            if (!v95)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              v97 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              goto LABEL_104;
            }
            -[NSManagedObject setNeedsShareDelete:](v95, "setNeedsShareDelete:", 0);
            ++v91;
          }
          while (v89 != v91);
          v96 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
          v89 = v96;
        }
        while (v96);
      }
LABEL_104:
      if ((objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v98 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      }

    }
    v42 = v105;
  }
  else
  {
    v102 = 0;
    obj = 0;
    v101 = 0;
    v42 = 0;
    v104 = 0;
  }

}

uint64_t __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a2, "setIsUploaded:", MEMORY[0x1E0C9AAB0]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 && (v7 = *(_QWORD *)(v6 + 16)) != 0)
    v8 = *(_QWORD *)(v7 + 136);
  else
    v8 = 0;
  v9 = -[PFCloudKitArchivingUtilities newArchivedDataForSystemFieldsOfRecord:](v8, a3);
  objc_msgSend(a2, "setCkRecordSystemFields:", v9);

  return 1;
}

@end
