@implementation NSCoreDataCoreSpotlightDelegate

void __57__NSCoreDataCoreSpotlightDelegate_startSpotlightIndexing__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  -[NSCoreDataCoreSpotlightDelegate _initializePersistentStore](*(_QWORD *)(a1 + 32));
}

- (void)_initializePersistentStore
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *global_queue;
  _QWORD block[5];

  if (a1)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("NSCoreDataCoreSpotlightDelegate initializing support for store with identifier %@")));
      _NSCoreDataLog(4, v2, v3, v4, v5, v6, v7, v8, a1);
    }
    global_queue = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
}

void __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke(uint64_t a1)
{
  unint64_t *v2;
  unint64_t *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  uint64_t v65;
  id *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  id *v78;
  unint64_t *v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[6];
  uint8_t v90[128];
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  id v94;
  __int16 v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v2 = (unint64_t *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForURL:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "URL"));
  if (!v2)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Store was nil on initialization"));
      v81 = *(_QWORD *)(a1 + 32);
      v7 = objc_msgSend(v5, "stringWithFormat:", v6);
      _NSCoreDataLog(4, v7, v8, v9, v10, v11, v12, v13, v81);
    }
    *(_QWORD *)&v97 = 0;
    *((_QWORD *)&v97 + 1) = &v97;
    v98 = 0x3052000000;
    v99 = __Block_byref_object_copy__9;
    v100 = __Block_byref_object_dispose__9;
    v101 = 0;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 8);
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke_5;
    v89[3] = &unk_1E1EDD618;
    v89[4] = v14;
    v89[5] = &v97;
    objc_msgSend(v15, "performBlockAndWait:", v89);
    v16 = *(id *)(*((_QWORD *)&v97 + 1) + 40);
    if (v16 && _CoreData_SpotlightDebug >= 1)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Error during initialization %@"));
      v82 = *(_QWORD *)(a1 + 32);
      v19 = objc_msgSend(v17, "stringWithFormat:", v18);
      _NSCoreDataLog(4, v19, v20, v21, v22, v23, v24, v25, v82);
    }
    v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "URL");
    if (objc_msgSend(v16, "code") == 134081
      && (v27 = (void *)objc_msgSend(v16, "domain"),
          objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
    {
      v28 = objc_msgSend(v26, "path");
      v35 = CFSTR("NSCoreDataCoreSpotlightDelegate tried to load a store at %@ twice");
    }
    else
    {
      if (v16)
      {
        v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CDCS - NSCoreDataCoreSpotlightDelegate failed to load a store at %@ due to %@ with %@");
        v37 = objc_msgSend(v26, "path");
        objc_msgSend(v16, "userInfo");
        _NSCoreDataLog(17, v36, v38, v39, v40, v41, v42, v43, v37);
        v44 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v45 = objc_msgSend(v26, "path");
          v46 = objc_msgSend(v16, "userInfo");
          *(_DWORD *)buf = 138412802;
          v92 = v45;
          v93 = 2112;
          v94 = v16;
          v95 = 2112;
          v96 = v46;
          _os_log_fault_impl(&dword_18A253000, v44, OS_LOG_TYPE_FAULT, "CoreData: CDCS - NSCoreDataCoreSpotlightDelegate failed to load a store at %@ due to %@ with %@", buf, 0x20u);
        }
        goto LABEL_40;
      }
      v28 = objc_msgSend(v26, "path");
      v35 = CFSTR("NSCoreDataCoreSpotlightDelegate failed to find its store at %@.  Possibly it was removed from the coordinator.");
    }
    _NSCoreDataLog(1, (uint64_t)v35, v29, v30, v31, v32, v33, v34, v28);
LABEL_40:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    _Block_object_dispose(&v97, 8);
    return;
  }
  v3 = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend((id)objc_msgSend(v2, "identifier"), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "domainIdentifier"), "copy");
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "indexName"), "length"))
  {
    v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), objc_msgSend(*(id *)(a1 + 32), "indexName"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)), "copy");
  }
  else
  {
    v47 = *(_QWORD *)(a1 + 32);
    v48 = *(_QWORD *)(v47 + 56);
    if (v48
      || (v48 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"),
          v47 = *(_QWORD *)(a1 + 32),
          v48))
    {
      v49 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotlight_%@_%@"), v48, *(_QWORD *)(v47 + 24));
    }
    else
    {
      v49 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotlight_<>_%@"), *(_QWORD *)(v47 + 24), v84);
    }
    v4 = v49;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "protectionClass"), "copy");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = objc_msgSend(*(id *)(a1 + 32), "usePrivateIndex");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = (id)objc_msgSend(*(id *)(a1 + 32), "indexedPropertyNamesByEntityNameUsingModel:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectModel"));
  if (_CoreData_SpotlightDebug >= 1)
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Initializing with store identifier %@, index name %@, domain identifier %@, bundle ID %@, protection class %@, uses private index %d, indexed property names %@"));
    v83 = *(_QWORD *)(a1 + 32);
    v52 = objc_msgSend(v50, "stringWithFormat:", v51);
    _NSCoreDataLog(4, v52, v53, v54, v55, v56, v57, v58, v83);
  }
  v59 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectModel"), "entitiesByName");
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v60 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allKeys");
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v86 != v62)
          objc_enumerationMutation(v60);
        v64 = (void *)objc_msgSend(v59, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i));
        objc_msgSend(v64, "coreSpotlightDisplayNameExpression");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend((id)objc_msgSend(v64, "coreSpotlightDisplayNameExpression"), "allowEvaluation");
      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    }
    while (v61);
  }
  v65 = objc_msgSend(v3, "coreSpotlightExporter");
  v66 = *(id **)(a1 + 32);
  if ((id *)v65 != v66)
  {
    if (v65)
    {
      v67 = (void *)objc_msgSend(v66[2], "URL");
      v68 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CDCS - Attempt to illegally register multiple NSCoreDataCoreSpotlightDelegate for a single store at %@");
      v69 = objc_msgSend(v67, "path");
      _NSCoreDataLog(17, v68, v70, v71, v72, v73, v74, v75, v69);
      v76 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v77 = objc_msgSend(v67, "path");
        LODWORD(v97) = 138412290;
        *(_QWORD *)((char *)&v97 + 4) = v77;
        _os_log_fault_impl(&dword_18A253000, v76, OS_LOG_TYPE_FAULT, "CoreData: CDCS - Attempt to illegally register multiple NSCoreDataCoreSpotlightDelegate for a single store at %@", (uint8_t *)&v97, 0xCu);
      }
    }
    else
    {
      v78 = v66;
      v79 = v3 + 9;
      while (!__ldaxr(v79))
      {
        if (!__stlxr((unint64_t)v66, v79))
          return;
      }
      __clrex();

    }
  }
}

uint64_t __58__NSCoreDataCoreSpotlightDelegate__initialImportCompleted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)), "metadata"), "valueForKey:", CFSTR("coreSpotlightImportProgress")), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)initialize
{
  objc_opt_self();
  objc_opt_class();
  if ((id)objc_opt_class() == a1)
    _CoreData_SpotlightDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.SpotlightDebug"));
}

- (void)_updateSpotlightIndexFromSaveRequest:(uint64_t)a3
{
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  int v30;

  if (a1 && *((_BYTE *)a1 + 72))
  {
    v11 = a1 + 22;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    if (v12)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Dropping \"duplicate\" indexing request (%d).")), a1, "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]", 483, objc_msgSend(a1, "_indexerThrottle"));
        _NSCoreDataLog(4, v13, v14, v15, v16, v17, v18, v19, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Allowing indexing request (%d)."));
        objc_msgSend(a1, "_indexerThrottle");
        v22 = objc_msgSend(v20, "stringWithFormat:", v21);
        _NSCoreDataLog(4, v22, v23, v24, v25, v26, v27, v28, (uint64_t)a1);
      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromSaveRequest___block_invoke;
      v29[3] = &unk_1E1EDDB30;
      v30 = 1;
      v29[4] = a1;
      v29[5] = a2;
      -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)a1, (uint64_t)v29);
    }
  }
}

uint64_t __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke_2;
  v3[3] = &unk_1E1EDD520;
  v3[4] = v1;
  return -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v1, (uint64_t)v3);
}

- (void)_updateSpotlightIndexClientState:(uint64_t)a3 historyToken:(int)a4 updatedSpotlight:
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = (uint64_t)result;
    objc_sync_enter(result);
    v8 = objc_msgSend(*(id *)(v7 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v7 + 24));
    if (a2 && *(_BYTE *)(v7 + 72) && v8)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x3052000000;
      v39 = __Block_byref_object_copy__9;
      v40 = __Block_byref_object_dispose__9;
      v41 = 0;
      if (a3)
        v9 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v41);
      else
        v9 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v16 = v9;
      if (v37[5])
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Error while archiving data to store in client state index, %@"), v10, v11, v12, v13, v14, v15, v37[5]);
      }
      else
      {
        if (_CoreData_SpotlightDebug >= 1)
        {
          v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Persisting token to index client state, %@")));
          _NSCoreDataLog(4, v17, v18, v19, v20, v21, v22, v23, v7);
        }
        v24 = dispatch_semaphore_create(0);
        objc_msgSend(a2, "beginIndexBatch");
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __98__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexClientState_historyToken_updatedSpotlight___block_invoke;
        v35[3] = &unk_1E1EDDBF0;
        v35[4] = v24;
        v35[5] = &v36;
        objc_msgSend(a2, "endIndexBatchWithClientState:completionHandler:", v16, v35);
        dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v24);
        if (_CoreData_SpotlightDebug >= 1)
        {
          v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Persisted token to index client state, %@")));
          _NSCoreDataLog(4, v25, v26, v27, v28, v29, v30, v31, v7);
        }
        v32 = v37;
        if (a3 && !v37[5])
        {
          if (a4)
          {
            v33 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v34 = *(_QWORD *)(v7 + 24);
            v42[0] = CFSTR("NSStoreUUID");
            v42[1] = CFSTR("historyToken");
            v43[0] = v34;
            v43[1] = a3;
            objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification"), v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
            v32 = v37;
          }
        }

        v37[5] = 0;
      }
      _Block_object_dispose(&v36, 8);
    }
    return (void *)objc_sync_exit((id)v7);
  }
  return result;
}

void __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromSaveRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  int v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 72))
  {
    if (objc_msgSend(*(id *)(v9 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v9 + 24)))
      -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
    v11 = *(_DWORD *)(a1 + 48);
    v12 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 88);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 - v11, v12));
    if ((int)(v13 - v11) < 1)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Do *not* need additional indexing operation (%d).")), *(_QWORD *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]_block_invoke", 475, objc_msgSend(*(id *)(a1 + 32), "_indexerThrottle"));
        _NSCoreDataLog(4, v31, v32, v33, v34, v35, v36, v37, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Need additional indexing operation (%d)"));
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v16, "_indexerThrottle");
        v17 = objc_msgSend(v14, "stringWithFormat:", v15);
        _NSCoreDataLog(4, v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
      }
      v24 = *(_QWORD *)(a1 + 32);
      v26 = *(_DWORD *)(v24 + 88);
      v25 = (unsigned int *)(v24 + 88);
      v27 = -v26;
      do
        v28 = __ldxr(v25);
      while (__stxr(v28 + v27, v25));
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v29 = (unsigned int *)(v9 + 88);
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 - 1, v29));
  }
}

void __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t PFBundleVersion;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 72))
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (_CoreData_SpotlightDebug < 1)
      return;
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("NSCoreDataCoreSpotlightDelegate initialization cancelled for persistent store for %@"));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 24);
    v17 = 1306;
    goto LABEL_20;
  }
  v18 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v11);
  if (*(_QWORD *)(a1 + 32))
  {
    v20 = (void *)objc_msgSend((id)objc_msgSend(v10, "metadata"), "objectForKey:", CFSTR("_NSCoreDataCoreSpotlightFullReindexFrameworkVersion"));
    PFBundleVersion = +[_PFRoutines _getPFBundleVersionNumber]();
    if (v20)
    {
      v22 = objc_msgSend(v20, "isEqual:", PFBundleVersion);
      v19 = *(_QWORD *)(a1 + 32);
      if (v22)
        goto LABEL_12;
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 32);
    }
LABEL_17:
    -[NSCoreDataCoreSpotlightDelegate _doFullReimport](v19);
    goto LABEL_18;
  }
  v19 = 0;
LABEL_12:
  v23 = -[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](v19, v18);
  v19 = *(_QWORD *)(a1 + 32);
  if (!v23)
    goto LABEL_17;
  if (!v19)
    goto LABEL_17;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v24 = (void *)-[NSCoreDataCoreSpotlightDelegate _context](v19);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__NSCoreDataCoreSpotlightDelegate__initialImportCompleted__block_invoke;
  v33[3] = &unk_1E1EDD0E0;
  v33[4] = v19;
  v33[5] = &v34;
  objc_msgSend(v24, "performBlockAndWait:", v33);
  v25 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v34, 8);
  v19 = *(_QWORD *)(a1 + 32);
  if (!v25)
    goto LABEL_17;
  -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
LABEL_18:

  if (_CoreData_SpotlightDebug < 1)
    return;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("NSCoreDataCoreSpotlightDelegate finished initialization for persistent store for %@"));
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(v15 + 24);
  v17 = 1299;
LABEL_20:
  v26 = objc_msgSend(v13, "stringWithFormat:", v14, v15, "-[NSCoreDataCoreSpotlightDelegate _initializePersistentStore]_block_invoke_2", v17, v16);
  _NSCoreDataLog(4, v26, v27, v28, v29, v30, v31, v32, a9);
}

void __63__NSCoreDataCoreSpotlightDelegate__catchUpToCurrentTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  id v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 72))
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = (id)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)-[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](*(_QWORD *)(a1 + 32), v5);

  }
}

- (uint64_t)createClientSearchableIndex
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    -[NSCoreDataCoreSpotlightDelegate _context](result);
    v2 = *(void **)(v1 + 80);
    if (v2)
    {
      return objc_msgSend(*(id *)(v1 + 112), "createPrivateSearchableIndexWithPath:", objc_msgSend(v2, "path"));
    }
    else
    {
      v3 = *(void **)(v1 + 112);
      v5 = *(_QWORD *)(v1 + 56);
      v4 = *(_QWORD *)(v1 + 64);
      v6 = *(_QWORD *)(v1 + 48);
      if (*(_BYTE *)(v1 + 73))
        return objc_msgSend(v3, "createPrivateSearchableIndexWithName:protectionClass:bundleIdentifier:", v6, v4, v5);
      else
        return objc_msgSend(v3, "createSearchableIndexWithName:protectionClass:bundleIdentifier:", v6, v4, v5);
    }
  }
  return result;
}

- (uint64_t)_clientStateForSpotlightIndex:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  _BYTE buf[24];
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  dispatch_semaphore_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_msgSend(*(id *)(a1 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(a1 + 24));
  v5 = 0;
  if (a2 && *(_BYTE *)(a1 + 72) && v4)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3052000000;
    v34 = __Block_byref_object_copy__9;
    v35 = __Block_byref_object_dispose__9;
    v36 = 0;
    objc_sync_enter((id)a1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v38 = __Block_byref_object_copy__9;
    v39 = __Block_byref_object_dispose__9;
    v40 = 0;
    v40 = dispatch_semaphore_create(0);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__NSCoreDataCoreSpotlightDelegate__clientStateForSpotlightIndex___block_invoke;
    v30[3] = &unk_1E1EDDC18;
    v30[4] = &v31;
    v30[5] = buf;
    objc_msgSend(a2, "fetchLastClientStateWithCompletionHandler:", v30);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
    objc_sync_exit((id)a1);
    if (objc_msgSend((id)v32[5], "length"))
    {
      v29 = 0;
      v5 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v32[5], &v29);
      if (!v5 && _CoreData_SpotlightDebug >= 1)
      {
        v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to decode CoreSpotlight token for %@, doing full reimport (error: %@)")));
        _NSCoreDataLog(4, v6, v7, v8, v9, v10, v11, v12, a1);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_13;
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CDCS - Unexpected class for CoreSpotlight token for %@, doing full reimport (token: %@)");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)a2);
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a2;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v5;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: CDCS - Unexpected class for CoreSpotlight token for %@, doing full reimport (token: %@)", buf, 0x16u);
      }
    }
    v5 = 0;
LABEL_13:

    v32[5] = 0;
    if (_CoreData_SpotlightDebug >= 1)
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Fetched client state, %@, for index, %@")));
      _NSCoreDataLog(4, v21, v22, v23, v24, v25, v26, v27, a1);
    }
    _Block_object_dispose(&v31, 8);
  }
  return v5;
}

void __73__NSCoreDataCoreSpotlightDelegate__importObjectsUpdatedSinceTransaction___block_invoke(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;
  NSPersistentHistoryChangeRequest *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t m;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  const __CFString *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  int v158;
  uint64_t *v159;
  void *v160;
  uint64_t v161;
  id obj;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *context;
  id v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  _QWORD v179[5];
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
  _QWORD v192[5];
  id v193;
  _QWORD v194[6];
  _QWORD v195[6];
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
  __int128 v207;
  _QWORD v208[3];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  uint64_t v212;
  id v213[16];
  id v214[16];
  _BYTE v215[128];
  uint64_t v216;

  v1 = a1;
  v216 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 8), "persistentStoreForIdentifier:", *(_QWORD *)(a1[4] + 24));
  v3 = v1[4];
  if (*(_BYTE *)(v3 + 72))
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    if (_CoreData_SpotlightDebug > 0)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Importing objects since transaction %@"));
      v154 = v1[4];
      v7 = objc_msgSend(v5, "stringWithFormat:", v6);
      _NSCoreDataLog(4, v7, v8, v9, v10, v11, v12, v13, v154);
      v3 = v1[4];
      if (!v3)
        goto LABEL_122;
    }
    v14 = *(void **)(*(_QWORD *)(v1[5] + 8) + 40);
    v15 = objc_msgSend(*(id *)(v3 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v3 + 24));
    v161 = v15;
    if (!*(_BYTE *)(v3 + 72) || v15 == 0)
      goto LABEL_122;
    v17 = v14;
    v158 = 0;
    v165 = *MEMORY[0x1E0CB28A8];
    v159 = v1;
    v178 = v3;
    v157 = v14;
LABEL_12:
    v160 = (void *)MEMORY[0x18D76B4E4]();
    if (!*(_BYTE *)(v3 + 72))
    {
LABEL_127:

LABEL_114:
      objc_autoreleasePoolPop(v160);
      goto LABEL_122;
    }
    v18 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", v17);
    -[NSPersistentHistoryChangeRequest setResultType:](v18, "setResultType:", 5);
    v212 = v161;
    -[NSPersistentStoreRequest setAffectedStores:](v18, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v212, 1));
    -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v18, "setFetchBatchSize:", 100);
    -[NSPersistentHistoryChangeRequest setFetchLimit:](v18, "setFetchLimit:", 1000);
    v193 = 0;
    v19 = (void *)objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](v3), "executeRequest:error:", v18, &v193);
    if (v19)
    {
      v26 = v19;
      if (objc_msgSend((id)objc_msgSend(v19, "result"), "count"))
      {
        if (!*(_BYTE *)(v3 + 72))
          goto LABEL_127;
        v27 = (void *)objc_msgSend(v26, "result");
        v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v170 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v188 = 0u;
        v189 = 0u;
        v190 = 0u;
        v191 = 0u;
        obj = v27;
        v164 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v188, v211, 16);
        if (!v164)
          goto LABEL_56;
        v163 = *(_QWORD *)v189;
        v171 = v28;
LABEL_18:
        v29 = 0;
        v30 = v17;
        while (1)
        {
          if (*(_QWORD *)v189 != v163)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * v29);
          v32 = (void *)MEMORY[0x18D76B4E4]();
          if (!*(_BYTE *)(v3 + 72))
          {

            objc_autoreleasePoolPop(v32);
            v1 = v159;
            goto LABEL_114;
          }
          if (objc_msgSend((id)objc_msgSend(v31, "author"), "hasPrefix:", CFSTR("com.apple.coredata.schemamigrator")))
          {
            if (_CoreData_SpotlightDebug >= 1)
            {
              v119 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Discovered migration author, performing full re-import")));
              _NSCoreDataLog(4, v119, v120, v121, v122, v123, v124, v125, v3);
            }
            objc_autoreleasePoolPop(v32);
            objc_autoreleasePoolPop(v160);
            if (_CoreData_SpotlightDebug > 0)
            {
              v126 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Discovered migration author while processing transactions")));
              _NSCoreDataLog(4, v126, v127, v128, v129, v130, v131, v132, v3);
            }
            v179[0] = MEMORY[0x1E0C809B0];
            v179[1] = 3221225472;
            v179[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_3;
            v179[3] = &unk_1E1EDD520;
            v179[4] = v3;
            -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v3, (uint64_t)v179);
            v17 = v30;
            v1 = v159;
            goto LABEL_120;
          }
          v166 = v29;
          context = v32;
          v168 = (id)objc_msgSend(v31, "token");

          v186 = 0u;
          v187 = 0u;
          v184 = 0u;
          v185 = 0u;
          v172 = (id)objc_msgSend(v31, "changes");
          v176 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v184, v210, 16);
          if (!v176)
            goto LABEL_54;
          v173 = *(void **)v185;
          do
          {
            for (i = 0; i != v176; ++i)
            {
              if (*(void **)v185 != v173)
                objc_enumerationMutation(v172);
              v34 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
              v35 = (void *)MEMORY[0x18D76B4E4]();
              v36 = (void *)objc_msgSend(v34, "changedObjectID");
              if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](objc_msgSend(v36, "entity")))
              {
                if (objc_msgSend(v34, "changeType") == 1)
                {
                  v182 = 0u;
                  v183 = 0u;
                  v180 = 0u;
                  v181 = 0u;
                  v37 = (void *)objc_msgSend(v34, "updatedProperties");
                  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v180, v209, 16);
                  if (!v38)
                    goto LABEL_52;
                  v39 = v38;
                  v40 = *(_QWORD *)v181;
LABEL_32:
                  v41 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v181 != v40)
                      objc_enumerationMutation(v37);
                    v42 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v41);
                    objc_opt_class();
                    v43 = (objc_opt_isKindOfClass() & 1) != 0
                        ? objc_msgSend(v42, "_qualifiedName")
                        : objc_msgSend(v42, "name");
                    if ((objc_msgSend((id)objc_msgSend(*(id *)(v178 + 96), "objectForKey:", objc_msgSend((id)objc_msgSend(v36, "entity"), "name")), "containsObject:", v43) & 1) != 0)break;
                    if (v39 == ++v41)
                    {
                      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v180, v209, 16);
                      if (v39)
                        goto LABEL_32;
                      goto LABEL_52;
                    }
                  }
                }
                v44 = objc_msgSend(v34, "changeType");
                if (v44 >= 2)
                {
                  if (v44 != 2)
                  {
                    _NSCoreDataLog(1, (uint64_t)CFSTR("Core Data Spotlight Error - unknown change type - %@"), v45, v46, v47, v48, v49, v50, (uint64_t)v34);
                    goto LABEL_52;
                  }
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Deleted object ID")));
                    _NSCoreDataLog(4, v59, v60, v61, v62, v63, v64, v65, v178);
                  }
                  v58 = v170;
                }
                else
                {
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Inserted or updated item")));
                    _NSCoreDataLog(4, v51, v52, v53, v54, v55, v56, v57, v178);
                  }
                  v58 = v171;
                }
                objc_msgSend(v58, "addObject:", v36);
              }
LABEL_52:
              objc_autoreleasePoolPop(v35);
            }
            v176 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v184, v210, 16);
          }
          while (v176);
LABEL_54:
          objc_autoreleasePoolPop(context);
          v29 = v166 + 1;
          v17 = v168;
          v30 = v168;
          v3 = v178;
          v28 = v171;
          if (v166 + 1 == v164)
          {
            v1 = v159;
            v164 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v211, 16);
            if (v164)
              goto LABEL_18;
LABEL_56:
            if (objc_msgSend(v28, "count") || objc_msgSend(v170, "count"))
            {
              objc_msgSend(v28, "minusSet:", v170);
              v208[0] = v28;
              v208[1] = MEMORY[0x1E0C9AA60];
              v208[2] = v170;
              v66 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 3);
              if (*(_BYTE *)(v3 + 72))
              {
                v67 = (void *)v66;
                if (objc_msgSend(*(id *)(v3 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v3 + 24)))
                {
                  v169 = v17;
                  v68 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v69 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v174 = (void *)MEMORY[0x18D76B4E4]();
                  v177 = v67;
                  v204 = 0u;
                  v205 = 0u;
                  v206 = 0u;
                  v207 = 0u;
                  v70 = (void *)objc_msgSend(v67, "firstObject");
                  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v204, v215, 16);
                  if (v71)
                  {
                    v72 = v71;
                    v73 = *(_QWORD *)v205;
                    do
                    {
                      for (j = 0; j != v72; ++j)
                      {
                        if (*(_QWORD *)v205 != v73)
                          objc_enumerationMutation(v70);
                        v75 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * j);
                        v76 = (void *)MEMORY[0x18D76B4E4]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](objc_msgSend(v75, "entity")))
                        {
                          v214[0] = 0;
                          v77 = (void *)objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](v178), "existingObjectWithID:error:", v75, v214);
                          if (v77)
                          {
                            v78 = v77;
                            v79 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((_QWORD *)v178, v77);
                            if (v79)
                            {
                              v80 = (uint64_t)v79;
                              v81 = v68;
                            }
                            else
                            {
                              v80 = objc_msgSend((id)objc_msgSend(v75, "URIRepresentation"), "description");
                              v81 = v69;
                            }
                            objc_msgSend(v81, "addObject:", v80);
                            objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](v178), "refreshObject:mergeChanges:", v78, 1);
                          }
                          else if (objc_msgSend(v214[0], "code") == 133000
                                 && objc_msgSend((id)objc_msgSend(v214[0], "domain"), "isEqualToString:", v165))
                          {
                            objc_msgSend(v69, "addObject:", objc_msgSend((id)objc_msgSend(v75, "URIRepresentation"), "description"));
                          }
                        }
                        objc_autoreleasePoolPop(v76);
                      }
                      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v204, v215, 16);
                    }
                    while (v72);
                  }
                  objc_autoreleasePoolPop(v174);
                  v175 = (void *)MEMORY[0x18D76B4E4]();
                  v200 = 0u;
                  v201 = 0u;
                  v202 = 0u;
                  v203 = 0u;
                  v82 = (void *)objc_msgSend(v177, "objectAtIndex:", 1);
                  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v200, v214, 16);
                  if (v83)
                  {
                    v84 = v83;
                    v85 = *(_QWORD *)v201;
                    do
                    {
                      for (k = 0; k != v84; ++k)
                      {
                        if (*(_QWORD *)v201 != v85)
                          objc_enumerationMutation(v82);
                        v87 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * k);
                        v88 = (void *)MEMORY[0x18D76B4E4]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](objc_msgSend(v87, "entity")))
                        {
                          v213[0] = 0;
                          v89 = (void *)objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](v178), "existingObjectWithID:error:", v87, v213);
                          if (v89)
                          {
                            v90 = v89;
                            v91 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((_QWORD *)v178, v89);
                            if (v91)
                            {
                              v92 = (uint64_t)v91;
                              v93 = v68;
                            }
                            else
                            {
                              v92 = objc_msgSend((id)objc_msgSend(v87, "URIRepresentation"), "description");
                              v93 = v69;
                            }
                            objc_msgSend(v93, "addObject:", v92);
                            objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](v178), "refreshObject:mergeChanges:", v90, 1);
                          }
                          else if (objc_msgSend(v213[0], "code") == 133000
                                 && objc_msgSend((id)objc_msgSend(v213[0], "domain"), "isEqualToString:", v165))
                          {
                            objc_msgSend(v69, "addObject:", objc_msgSend((id)objc_msgSend(v87, "URIRepresentation"), "description"));
                          }
                        }
                        objc_autoreleasePoolPop(v88);
                      }
                      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v200, v214, 16);
                    }
                    while (v84);
                  }
                  objc_autoreleasePoolPop(v175);
                  v94 = (void *)MEMORY[0x18D76B4E4]();
                  v196 = 0u;
                  v197 = 0u;
                  v198 = 0u;
                  v199 = 0u;
                  v95 = (void *)objc_msgSend(v177, "lastObject");
                  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v196, v213, 16);
                  if (v96)
                  {
                    v97 = v96;
                    v98 = *(_QWORD *)v197;
                    do
                    {
                      for (m = 0; m != v97; ++m)
                      {
                        if (*(_QWORD *)v197 != v98)
                          objc_enumerationMutation(v95);
                        v100 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * m);
                        v101 = (void *)MEMORY[0x18D76B4E4]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](objc_msgSend(v100, "entity")))
                          objc_msgSend(v69, "addObject:", objc_msgSend((id)objc_msgSend(v100, "URIRepresentation"), "description"));
                        objc_autoreleasePoolPop(v101);
                      }
                      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v196, v213, 16);
                    }
                    while (v97);
                  }
                  objc_autoreleasePoolPop(v94);
                  v3 = v178;
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    v102 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Searchable items %@")));
                    _NSCoreDataLog(4, v102, v103, v104, v105, v106, v107, v108, v178);
                    if (_CoreData_SpotlightDebug >= 1)
                    {
                      v109 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Identifiers to delete %@")));
                      _NSCoreDataLog(4, v109, v110, v111, v112, v113, v114, v115, v178);
                    }
                  }
                  v116 = objc_msgSend(v68, "count");
                  v17 = v169;
                  if (v116 + objc_msgSend(v69, "count"))
                  {
                    v117 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v178);
                    if (objc_msgSend(v68, "count"))
                    {
                      v195[0] = MEMORY[0x1E0C809B0];
                      v195[1] = 3221225472;
                      v195[2] = __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke;
                      v195[3] = &unk_1E1EDDB08;
                      v195[4] = v178;
                      v195[5] = v68;
                      objc_msgSend(v117, "indexSearchableItems:completionHandler:", v68, v195);
                      v158 = 1;
                    }
                    v1 = v159;
                    if (objc_msgSend(v69, "count"))
                    {
                      v194[0] = MEMORY[0x1E0C809B0];
                      v194[1] = 3221225472;
                      v194[2] = __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke_2;
                      v194[3] = &unk_1E1EDDB08;
                      v194[4] = v178;
                      v194[5] = v69;
                      objc_msgSend(v117, "deleteSearchableItemsWithIdentifiers:completionHandler:", v69, v194);
                      v158 = 1;
                    }

                  }
                  else
                  {
                    v1 = v159;
                  }
                }
              }
            }
            v118 = objc_msgSend(obj, "count");
            objc_autoreleasePoolPop(v160);
            if (v118 != 1000)
              goto LABEL_120;
            goto LABEL_12;
          }
        }
      }
    }
    v146 = v157;
    if (v193)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Core Data Spotlight Error during processing of history: %@"), v20, v21, v22, v23, v24, v25, (uint64_t)v193);
      if (objc_msgSend((id)objc_msgSend(v193, "domain"), "isEqualToString:", v165)
        && objc_msgSend(v193, "code") == 134301)
      {
        _NSCoreDataLog(2, (uint64_t)CFSTR("Discovered an expired history token, attempting recovery."), v147, v148, v149, v150, v151, v152, v156);
        v153 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v3);
        -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:]((void *)v3, v153, 0, 0);

        v146 = v157;
        v192[0] = MEMORY[0x1E0C809B0];
        v192[1] = 3221225472;
        v192[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke;
        v192[3] = &unk_1E1EDDB58;
        v192[4] = v3;
        -[NSCoreDataCoreSpotlightDelegate _resetSpotlightIndexWithCompletionHandler:]((_QWORD *)v3, (uint64_t)v192);
      }

      v17 = 0;
    }
    if (v17 == v146)
    {

      objc_autoreleasePoolPop(v160);
      v17 = 0;
    }
    else
    {
      objc_autoreleasePoolPop(v160);
    }
LABEL_120:
    v133 = v17;
    if (v133)
    {
      v134 = (uint64_t)v133;
      *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = v133;
      v135 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v1[4]);
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:]((void *)v1[4], v135, v134, v158 != 0);

      return;
    }
LABEL_122:
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = *(id *)(*(_QWORD *)(v1[5] + 8) + 40);
    if (_CoreData_SpotlightDebug >= 1)
    {
      v136 = (void *)MEMORY[0x1E0CB3940];
      v137 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Didn't receive a new token back after processing transactions starting at, %@"));
      v138 = *(const __CFString **)(*(_QWORD *)(v1[5] + 8) + 40);
      if (!v138)
        v138 = CFSTR("null token");
      v139 = objc_msgSend(v136, "stringWithFormat:", v137, v1[4], "-[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:]_block_invoke", 910, v138);
      _NSCoreDataLog(4, v139, v140, v141, v142, v143, v144, v145, v155);
    }
  }
}

- (void)_catchUpToCurrentTransaction
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__9;
    v15 = __Block_byref_object_dispose__9;
    v16 = 0;
    v2 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)a1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__NSCoreDataCoreSpotlightDelegate__catchUpToCurrentTransaction__block_invoke;
    v10[3] = &unk_1E1EDD0E0;
    v10[4] = a1;
    v10[5] = &v11;
    objc_msgSend(v2, "performBlockAndWait:", v10);
    if (_CoreData_SpotlightDebug >= 1)
    {
      v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Catching up Spotlight index since transaction, %@")));
      _NSCoreDataLog(4, v3, v4, v5, v6, v7, v8, v9, (uint64_t)a1);
    }
    -[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:](a1, (void *)v12[5]);

    _Block_object_dispose(&v11, 8);
  }
}

- (id)_importObjectsUpdatedSinceTransaction:(void *)a1
{
  id v2;
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v2 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__9;
    v17 = 0;
    v17 = a2;
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__9;
    v10 = __Block_byref_object_dispose__9;
    v11 = 0;
    v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)v2);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__NSCoreDataCoreSpotlightDelegate__importObjectsUpdatedSinceTransaction___block_invoke;
    v5[3] = &unk_1E1EDDC88;
    v5[4] = v2;
    v5[5] = &v12;
    v5[6] = &v6;
    objc_msgSend(v3, "performBlockAndWait:", v5);

    v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v12, 8);
  }
  return v2;
}

- (void)startSpotlightIndexing
{
  void *v3;
  _QWORD v4[5];

  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSCoreDataCoreSpotlightDelegate_startSpotlightIndexing__block_invoke;
  v4[3] = &unk_1E1EDD520;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);
}

- (uint64_t)_context
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  if (result)
  {
    v1 = result;
    if (!objc_msgSend(*(id *)(result + 32), "persistentStoreCoordinator"))
    {
      v2 = *(void **)(v1 + 32);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke;
      v3[3] = &unk_1E1EDD520;
      v3[4] = v1;
      objc_msgSend(v2, "performBlockAndWait:", v3);
    }
    return *(_QWORD *)(v1 + 32);
  }
  return result;
}

- (uint64_t)_asyncContextBlock:(uint64_t)result
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 72))
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("retval: %d"));
        v6 = (unsigned int *)(v2 + 104);
        do
          v7 = __ldxr(v6);
        while (__stxr(v7 + 1, v6));
        v8 = objc_msgSend(v4, "stringWithFormat:", v5);
        _NSCoreDataLog(4, v8, v9, v10, v11, v12, v13, v14, v2);
      }
      v15 = *(void **)(v2 + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__NSCoreDataCoreSpotlightDelegate__asyncContextBlock___block_invoke;
      v16[3] = &unk_1E1EDDAE0;
      v16[4] = v2;
      v16[5] = a2;
      return objc_msgSend(v15, "performBlock:", v16);
    }
  }
  return result;
}

- (void)indexSearchableItemsToCurrentHistoryToken
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_enabled)
    -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]((unsigned int *)self, 0, v2, v3, v4, v5, v6, v7, v8);
}

- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description coordinator:(NSPersistentStoreCoordinator *)psc
{
  id v7;
  const __CFString *v8;
  uint64_t v9;
  NSCoreDataCoreSpotlightDelegate *v10;
  void *v12;
  objc_super v13;

  if (self && (_BYTE)dword_1ECD8DE20)
  {
    v7 = -[NSDictionary objectForKey:](-[NSPersistentStoreDescription options](description, "options"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
    if (-[NSString isEqualToString:](-[NSPersistentStoreDescription type](description, "type"), "isEqualToString:", CFSTR("SQLite")))
    {
      if ((objc_msgSend(v7, "isNSDictionary") & 1) != 0
        || objc_msgSend(v7, "isNSNumber") && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
      {
        goto LABEL_10;
      }
      v8 = CFSTR("NSCoreDataCoreSpotlightDelegate requires NSPersistentHistoryTrackingKey to be enabled in NSPersistentStoreDescription options.");
    }
    else
    {
      v8 = CFSTR("NSCoreDataCoreSpotlightDelegate requires the store type to be NSSQLiteStoreType.");
    }
    v9 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v8, 0);
    if (v9)
    {
      v12 = (void *)v9;

      objc_exception_throw(v12);
    }
  }
LABEL_10:
  v13.receiver = self;
  v13.super_class = (Class)NSCoreDataCoreSpotlightDelegate;
  v10 = -[NSCoreDataCoreSpotlightDelegate init](&v13, sel_init);
  if (v10)
  {
    v10->_coordinator = psc;
    v10->_indexProvider = objc_alloc_init(PFCSSearchableIndexProvider);
    v10->_description = (NSPersistentStoreDescription *)-[NSPersistentStoreDescription copy](description, "copy");
    v10->_context__ = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    v10->_enabled = 0;
  }
  return v10;
}

void __54__NSCoreDataCoreSpotlightDelegate__asyncContextBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 0;
  v2 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Spotlight Indexing"), &v18);
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[NSCoreDataCoreSpotlightDelegate _context](*(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
  objc_msgSend(v3, "drain");
  v4 = 0;
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v18, v2);
  if (_CoreData_SpotlightDebug >= 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("retval: %d"));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (unsigned int *)(v7 + 104);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 - 1, v8));
    v17 = v7;
    v10 = objc_msgSend(v5, "stringWithFormat:", v6);
    _NSCoreDataLog(4, v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

intptr_t __65__NSCoreDataCoreSpotlightDelegate__clientStateForSpotlightIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v5 = objc_msgSend(a3, "localizedDescription");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error while fetching client state: %@, state, %@"), v6, v7, v8, v9, v10, v11, v5);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

intptr_t __98__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexClientState_historyToken_updatedSpotlight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    v4 = objc_msgSend(a2, "localizedDescription");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error while batch updating the client state index: %@"), v5, v6, v7, v8, v9, v10, v4);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)indexedPropertyNamesByEntityNameUsingModel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id obj;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "entities"), "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_msgSend(a3, "entities");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    v27 = *(_QWORD *)v42;
    do
    {
      v7 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v7);
        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)v8))
        {
          v32 = v7;
          v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v31 = v8;
          v10 = (void *)objc_msgSend(v8, "properties");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (!v11)
            goto LABEL_31;
          v12 = v11;
          v13 = *(_QWORD *)v38;
          while (1)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              if (objc_msgSend(v15, "_propertyType", v27) == 7)
              {
                v16 = (void *)objc_msgSend(v15, "_flattenedElements");
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v34;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v34 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                      if (objc_msgSend(v21, "isIndexedBySpotlight"))
                        objc_msgSend(v9, "addObject:", objc_msgSend(v21, "_qualifiedName"));
                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  }
                  while (v18);
                }
              }
              else
              {
                v22 = objc_msgSend(v15, "_propertyType");
                v23 = objc_msgSend(v15, "isIndexedBySpotlight");
                if (v22 == 2)
                {
                  if (!v23)
                    continue;
                  v24 = objc_msgSend(v15, "_qualifiedName");
                }
                else
                {
                  if (!v23)
                    continue;
                  v24 = objc_msgSend(v15, "name");
                }
                objc_msgSend(v9, "addObject:", v24);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (!v12)
            {
LABEL_31:
              objc_msgSend(v28, "setObject:forKey:", v9, objc_msgSend(v31, "name", v27));

              v6 = v27;
              v5 = v29;
              v7 = v32;
              break;
            }
          }
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v5);
  }
  v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v28);

  return v25;
}

id *__43__NSCoreDataCoreSpotlightDelegate__context__block_invoke_5(uint64_t a1)
{
  id *result;

  result = -[NSPersistentStoreCoordinator _lastOpenError](*(id **)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)domainIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)indexName
{
  return 0;
}

- (NSCoreDataCoreSpotlightDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  uint8_t buf[16];

  if ((_BYTE)dword_1ECD8DE20)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataCoreSpotlightDelegate requires the use of the initializer %@"), NSStringFromSelector(sel_initForStoreWithDescription_coordinator_)), 0);
    objc_exception_throw(v11);
  }
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-init results in undefined behavior for NSCoreDataCoreSpotlightDelegate");
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v12);
  v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18A253000, v9, OS_LOG_TYPE_FAULT, "CoreData: -init results in undefined behavior for NSCoreDataCoreSpotlightDelegate", buf, 2u);
  }
  return 0;
}

- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description model:(NSManagedObjectModel *)model
{

  return 0;
}

uint64_t __46__NSCoreDataCoreSpotlightDelegate__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
}

- (void)dealloc
{
  objc_super v3;

  self->_domainIdentifier = 0;
  self->_indexName = 0;

  self->_coordinator = 0;
  self->_description = 0;

  self->_storeIdentifier = 0;
  self->_context__ = 0;

  self->_bundleIdentifier = 0;
  self->_protectionClass = 0;

  self->_indexURL = 0;
  self->_indexedPropertyNamesByEntity = 0;

  self->_indexProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCoreDataCoreSpotlightDelegate;
  -[NSCoreDataCoreSpotlightDelegate dealloc](&v3, sel_dealloc);
}

- (int)_indexerThrottle
{
  return self->__indexerThrottle;
}

- (CSSearchableItemAttributeSet)attributeSetForObject:(NSManagedObject *)object
{
  id v5;
  void *v6;
  NSEntityDescription *v7;
  NSExpression *v8;
  _NSRange *propertyRanges;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t location;
  NSUInteger length;
  uint64_t v15;
  void *v16;
  void *Property;
  void *v18;
  id v19;
  id v21;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v6 = (void *)objc_msgSend(objc_alloc((Class)getCoreSpotlightCSSearchableItemAttributeSetClass[0]()), "initWithItemContentType:", CFSTR("public.item"));
  v7 = -[NSManagedObject entity](object, "entity");
  v8 = -[NSEntityDescription coreSpotlightDisplayNameExpression](v7, "coreSpotlightDisplayNameExpression");
  if (v8)
  {
    v21 = v5;
    objc_msgSend(v6, "setDisplayName:", -[NSExpression expressionValueWithObject:context:](v8, "expressionValueWithObject:context:", object, objc_msgSend(MEMORY[0x1E0C99E08], "dictionary")));
    if (v7)
      propertyRanges = v7->_propertyRanges;
    else
      propertyRanges = 0;
    v11 = -[NSDictionary values](-[NSEntityDescription propertiesByName](v7, "propertiesByName"), "values");
    v12 = _kvcPropertysPublicGetters((unint64_t *)v7);
    location = propertyRanges[3].location;
    length = propertyRanges[3].length;
    if (location < length + location)
    {
      v15 = v12;
      do
      {
        v16 = *(void **)(v11 + 8 * location);
        if (objc_msgSend(v16, "isIndexedBySpotlight"))
        {
          Property = _PF_Handler_Public_GetProperty((id **)object, location, 0, *(_QWORD *)(v15 + 8 * location));
          if (Property)
          {
            v18 = (void *)objc_msgSend(objc_alloc((Class)getCoreSpotlightCSCustomAttributeKeyClass[0]()), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", objc_msgSend(v16, "name"), 1, 1, 0, 0);
            objc_msgSend(v6, "setValue:forCustomKey:", Property, v18);

          }
        }
        ++location;
        --length;
      }
      while (length);
    }
    v10 = 1;
    v5 = v21;
  }
  else
  {
    v10 = 0;
  }
  -[NSManagedObjectContext refreshObject:mergeChanges:](-[NSManagedObject managedObjectContext](object, "managedObjectContext"), "refreshObject:mergeChanges:", object, 0);
  objc_msgSend(v5, "drain");
  v19 = 0;
  if (v10)
    return (CSSearchableItemAttributeSet *)v6;
  else
    return 0;
}

- (_QWORD)_searchableItemForObject:(_QWORD *)result
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)result);
    v5 = (void *)MEMORY[0x18D76B4E4](v4);
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectID"), "URIRepresentation"), "description");
    v7 = objc_msgSend(v3, "attributeSetForObject:", a2);
    if (v7)
      v8 = (void *)objc_msgSend(objc_alloc(getCoreSpotlightCSSearchableItemClass()), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v6, v3[5], v7);
    else
      v8 = 0;
    objc_autoreleasePoolPop(v5);
    return v8;
  }
  return result;
}

void __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2)
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error indexing (insert/update): %@"), a3, a4, a5, a6, a7, a8, a2);
  if (_CoreData_SpotlightDebug >= 1)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Indexed %d searchable items")), *(_QWORD *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexForObjectsWithIDs:updatedSpotlight:]_block_invoke", 430, objc_msgSend(*(id *)(a1 + 40), "count"));
    _NSCoreDataLog(4, v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

void __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2)
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error indexing (delete): %@"), a3, a4, a5, a6, a7, a8, a2);
  if (_CoreData_SpotlightDebug >= 1)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Deleted %lu identifiers")), *(_QWORD *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexForObjectsWithIDs:updatedSpotlight:]_block_invoke_2", 442, objc_msgSend(*(id *)(a1 + 40), "count"));
    _NSCoreDataLog(4, v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

- (void)_updateSpotlightIndexFromBatchResult:(uint64_t)a3
{
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  int v28;

  if (a1 && *((_BYTE *)a1 + 72))
  {
    v11 = a1 + 22;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    if (v12)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Dropping \"duplicate\" indexing request (%d).")), a1, "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:]", 518, objc_msgSend(a1, "_indexerThrottle"));
        _NSCoreDataLog(4, v13, v14, v15, v16, v17, v18, v19, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Allowing indexing request (%d).")));
        _NSCoreDataLog(4, v20, v21, v22, v23, v24, v25, v26, (uint64_t)a1);
      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromBatchResult___block_invoke;
      v27[3] = &unk_1E1EDDB30;
      v28 = 1;
      v27[4] = a1;
      v27[5] = a2;
      -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)a1, (uint64_t)v27);
    }
  }
}

void __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromBatchResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  int v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 72))
  {
    if (objc_msgSend(*(id *)(v9 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v9 + 24)))
      -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
    v11 = *(_DWORD *)(a1 + 48);
    v12 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 88);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 - v11, v12));
    if ((int)(v13 - v11) < 1)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Do *not* need additional indexing operation (%d).")), *(_QWORD *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:]_block_invoke", 510, objc_msgSend(*(id *)(a1 + 32), "_indexerThrottle"));
        _NSCoreDataLog(4, v31, v32, v33, v34, v35, v36, v37, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Need additional indexing operation (%d)."));
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v16, "_indexerThrottle");
        v17 = objc_msgSend(v14, "stringWithFormat:", v15);
        _NSCoreDataLog(4, v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
      }
      v24 = *(_QWORD *)(a1 + 32);
      v26 = *(_DWORD *)(v24 + 88);
      v25 = (unsigned int *)(v24 + 88);
      v27 = -v26;
      do
        v28 = __ldxr(v25);
      while (__stxr(v28 + v27, v25));
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v29 = (unsigned int *)(v9 + 88);
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 - 1, v29));
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (re-index), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (delete), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (batch), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (re-index), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (delete), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "name");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for entity %@ (batch), %@."), v3, v4, v5, v6, v7, v8, v2);
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed, %@."), a3, a4, a5, a6, a7, a8, a2);
}

void __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD v9[5];

  if (a2)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error resetting spotlight index while recovering from expired history token: %@"), a3, a4, a5, a6, a7, a8, a2);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_2;
    v9[3] = &unk_1E1EDD520;
    v9[4] = v8;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v8, (uint64_t)v9);
  }
}

uint64_t __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_2(uint64_t a1)
{
  return -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_doFullReimport
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  if (result)
  {
    v1 = result;
    if (_CoreData_SpotlightDebug >= 1)
    {
      v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Performing full Spotlight re-import")));
      _NSCoreDataLog(4, v2, v3, v4, v5, v6, v7, v8, v1);
    }
    -[NSCoreDataCoreSpotlightDelegate _context](v1);
    v9 = (void *)-[NSCoreDataCoreSpotlightDelegate _context](v1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke;
    v10[3] = &unk_1E1EDD520;
    v10[4] = v1;
    return objc_msgSend(v9, "performBlockAndWait:", v10);
  }
  return result;
}

- (void)_resetSpotlightIndexWithCompletionHandler:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex]((uint64_t)a1);
    if (v4)
    {
      v5 = v4;
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](a1, v4, 0, 0);
      v6[0] = a1[5];
      objc_msgSend(v5, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1), a2);

    }
    else if (a2)
    {
      (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
    }
  }
}

uint64_t __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_3(uint64_t a1)
{
  return -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(_QWORD *)(a1 + 32));
}

void __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSManagedObjectContext *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[9];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  _QWORD v66[2];
  _QWORD v67[6];
  _BYTE v68[160];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v2 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(_QWORD *)(a1 + 32));
  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), v2, 0, 0);

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Not performing full re-import because Spotlight was disabled or store was nil."));
      v54 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(v6, "stringWithFormat:", v7);
      _NSCoreDataLog(4, v8, v9, v10, v11, v12, v13, v14, v54);
    }
    *((_BYTE *)v63 + 24) = 1;
  }
  else
  {
    v15 = (id)objc_msgSend(v3, "currentChangeToken");
    v16 = v15;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
    {
      v17 = (void *)objc_msgSend((id)objc_msgSend(v4, "metadata"), "mutableCopy");
      objc_msgSend(v17, "setValue:forKey:", 0, CFSTR("coreSpotlightImportProgress"));
      objc_msgSend(v17, "setValue:forKey:", 0, CFSTR("_NSCoreDataCoreSpotlightFullReindexFrameworkVersion"));
      objc_msgSend(v4, "setMetadata:", v17);

      v61 = 0;
      if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStores"), "count")
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)))
      {
        objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](*(_QWORD *)(a1 + 32)), "save:", &v61);
      }
      else
      {
        *((_BYTE *)v63 + 24) = 1;
      }
      if (v61)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to save store metadata changes to Spotlight import tracking, %@"), v18, v19, v20, v21, v22, v23, v61);
        *((_BYTE *)v63 + 24) = 1;
      }
    }
    if (*((_BYTE *)v63 + 24))
    {

      goto LABEL_38;
    }
    v24 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](*(_QWORD *)(a1 + 32)), "persistentStoreCoordinator"), "managedObjectModel");
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v58 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](v29))
            objc_msgSend(v25, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v26);
    }
    v30 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v30, "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    -[NSManagedObjectContext setName:](v30, "setName:", CFSTR("Spotlight_reindex"));
    v31 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(_QWORD *)(a1 + 32));
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_2;
    v56[3] = &unk_1E1EDDBC8;
    v56[4] = *(_QWORD *)(a1 + 32);
    v56[5] = v31;
    v56[7] = v30;
    v56[8] = &v62;
    v56[6] = v25;
    -[NSManagedObjectContext performBlockAndWait:](v30, "performBlockAndWait:", v56);

    if (*((_BYTE *)v63 + 24))
    {
LABEL_37:

      goto LABEL_38;
    }
    v61 = 0;
    v32 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72)
      && (v39 = v32) != 0
      && (v40 = (void *)objc_msgSend((id)objc_msgSend(v32, "metadata"), "mutableCopy"),
          objc_msgSend(v40, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("coreSpotlightImportProgress")),
          objc_msgSend(v40, "setValue:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), CFSTR("_NSCoreDataCoreSpotlightFullReindexFrameworkVersion")), objc_msgSend(v39, "setMetadata:", v40), v40, objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStores"), "count"))&& objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)))
    {
      objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](*(_QWORD *)(a1 + 32)), "save:", &v61);
    }
    else
    {
      *((_BYTE *)v63 + 24) = 1;
    }
    if (v61)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to save store metadata changes to Spotlight import tracking, %@"), v33, v34, v35, v36, v37, v38, v61);
      *((_BYTE *)v63 + 24) = 1;
      goto LABEL_37;
    }
    if (*((_BYTE *)v63 + 24))
      goto LABEL_37;
    if (v16)
    {
      v41 = (void *)-[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(_QWORD *)(a1 + 32));
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), v41, (uint64_t)v16, 0);

      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v66[0] = CFSTR("NSStoreUUID");
      v66[1] = CFSTR("historyToken");
      v67[0] = v42;
      v67[1] = v16;
      v43 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification"), *(_QWORD *)(a1 + 32), v43);
    }
    if (_CoreData_SpotlightDebug >= 1)
    {
      v44 = (void *)MEMORY[0x1E0CB3940];
      v45 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Performing extended import with token, %@"));
      v55 = *(_QWORD *)(a1 + 32);
      v46 = objc_msgSend(v44, "stringWithFormat:", v45);
      _NSCoreDataLog(4, v46, v47, v48, v49, v50, v51, v52, v55);
    }
    v53 = (id)-[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:](*(_QWORD *)(a1 + 32), v16);

  }
LABEL_38:
  _Block_object_dispose(&v62, 8);
}

uint64_t __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void *v29;
  NSFetchRequest *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  _QWORD *v39;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *context;
  uint64_t i;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[6];
  _QWORD v85[6];
  _QWORD v86[5];
  _QWORD v87[6];
  _QWORD v88[6];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  _BYTE v99[128];
  uint64_t v100;
  uint64_t v101;
  _BYTE v102[128];
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), *(void **)(a1 + 40), 0, 0);
  v1 = *(_QWORD **)(a1 + 32);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_3;
  v82[3] = &unk_1E1EDDBA0;
  v82[4] = *(_QWORD *)(a1 + 64);
  -[NSCoreDataCoreSpotlightDelegate _resetSpotlightIndexWithCompletionHandler:](v1, (uint64_t)v82);
  v80 = *(_QWORD *)(a1 + 32);
  if (!v80)
    return objc_msgSend(*(id *)(a1 + 56), "reset");
  if (!*(_BYTE *)(v80 + 72))
  {
    if (_CoreData_SpotlightDebug < 1)
      return objc_msgSend(*(id *)(a1 + 56), "reset");
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Returning from %@, Spotlight not enabled."));
    v11 = NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
    v12 = 528;
    goto LABEL_13;
  }
  v2 = *(void **)(a1 + 40);
  obj = *(id *)(a1 + 48);
  v81 = *(void **)(a1 + 56);
  v3 = objc_msgSend(*(id *)(v80 + 8), "persistentStoreForIdentifier:", *(_QWORD *)(v80 + 24));
  if (!v3)
  {
    if (_CoreData_SpotlightDebug < 1)
      return objc_msgSend(*(id *)(a1 + 56), "reset");
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Returning from %@, store for identifier %@ is nil."));
    NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
    v66 = v80;
    v15 = objc_msgSend(v13, "stringWithFormat:", v14);
LABEL_14:
    _NSCoreDataLog(4, v15, v16, v17, v18, v19, v20, v21, v66);
    return objc_msgSend(*(id *)(a1 + 56), "reset");
  }
  if (!v2)
  {
    if (_CoreData_SpotlightDebug < 1)
      return objc_msgSend(*(id *)(a1 + 56), "reset");
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Returning from %@, searchable index is nil."));
    v11 = NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
    v12 = 539;
LABEL_13:
    v15 = objc_msgSend(v9, "stringWithFormat:", v10, v80, "-[NSCoreDataCoreSpotlightDelegate _reindexInstancesOf:inIndex:usingContext:]", v12, v11);
    goto LABEL_14;
  }
  v70 = v3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = *(void **)(v80 + 8);
  v103[0] = v70;
  v68 = v4;
  v6 = objc_msgSend(v5, "currentPersistentHistoryTokenFromStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1));
  v7 = -[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](v80, v2);
  v98 = 0;
  if (v6)
    v8 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v98);
  else
    v8 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v67 = v8;
  if (v7)
    v76 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v98);
  else
    v76 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
  if (_CoreData_SpotlightDebug >= 1)
  {
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Starting re-indexing with history token %@.")));
    _NSCoreDataLog(4, v22, v23, v24, v25, v26, v27, v28, v80);
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  if (v73)
  {
    v78 = 0;
    v79 = 0;
    v72 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v95 != v72)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        context = (void *)MEMORY[0x18D76B4E4]();
        if ((-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)v29) & 1) != 0)
        {
          v30 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend(v29, "name"));
          -[NSFetchRequest setIncludesSubentities:](v30, "setIncludesSubentities:", 0);
          -[NSFetchRequest setFetchBatchSize:](v30, "setFetchBatchSize:", 100);
          v101 = v70;
          -[NSFetchRequest setAffectedStores:](v30, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1));
          v100 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("SELF"), 1);
          -[NSFetchRequest setSortDescriptors:](v30, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1));
          v93 = 0;
          v77 = (id)objc_msgSend(v81, "executeFetchRequest:error:", v30, &v93);

          if (!v77 || v93)
          {
            v50 = objc_msgSend(v29, "name");
            _NSCoreDataLog(1, (uint64_t)CFSTR("Full re-import failed for: %@ due to %@."), v51, v52, v53, v54, v55, v56, v50);
          }
          else
          {
            v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v33 = 0;
            v34 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v90;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v90 != v35)
                    objc_enumerationMutation(v77);
                  v37 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                  v38 = (void *)MEMORY[0x18D76B4E4]();
                  objc_msgSend(v37, "willAccessValueForKey:", 0);
                  v39 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((_QWORD *)v80, v37);
                  if (v39)
                    objc_msgSend(v31, "addObject:", v39);
                  else
                    objc_msgSend(v32, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "objectID"), "URIRepresentation"), "description"));
                  objc_msgSend(v81, "refreshObject:mergeChanges:", v37, 1);
                  if (++v33 == 100)
                  {
                    objc_msgSend(v2, "beginIndexBatch");
                    if (objc_msgSend(v31, "count"))
                    {
                      v40 = objc_msgSend(v31, "count");
                      v88[0] = MEMORY[0x1E0C809B0];
                      v88[1] = 3221225472;
                      v88[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke;
                      v88[3] = &unk_1E1EDDB08;
                      v88[4] = v29;
                      v88[5] = v31;
                      objc_msgSend(v2, "indexSearchableItems:completionHandler:", v31, v88);
                      v79 += v40;
                    }
                    if (objc_msgSend(v32, "count"))
                    {
                      v87[0] = MEMORY[0x1E0C809B0];
                      v87[1] = 3221225472;
                      v87[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_2;
                      v87[3] = &unk_1E1EDDB08;
                      v87[4] = v29;
                      v87[5] = v32;
                      objc_msgSend(v2, "deleteSearchableItemsWithIdentifiers:completionHandler:", v32, v87);
                      v78 *= 2;
                    }
                    v86[0] = MEMORY[0x1E0C809B0];
                    v86[1] = 3221225472;
                    v86[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_3;
                    v86[3] = &unk_1E1EDDB58;
                    v86[4] = v29;
                    objc_msgSend(v2, "endIndexBatchWithClientState:completionHandler:", v76, v86);
                    v33 = 0;
                  }
                  objc_autoreleasePoolPop(v38);
                }
                v34 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
              }
              while (v34);
            }
            objc_msgSend(v81, "reset");
            if (v33)
            {
              objc_msgSend(v2, "beginIndexBatch");
              if (objc_msgSend(v31, "count"))
              {
                v41 = objc_msgSend(v31, "count");
                v85[0] = MEMORY[0x1E0C809B0];
                v85[1] = 3221225472;
                v85[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_4;
                v85[3] = &unk_1E1EDDB08;
                v85[4] = v29;
                v85[5] = v31;
                objc_msgSend(v2, "indexSearchableItems:completionHandler:", v31, v85);
                v79 += v41;
              }
              if (objc_msgSend(v32, "count"))
              {
                v42 = objc_msgSend(v32, "count");
                v84[0] = MEMORY[0x1E0C809B0];
                v84[1] = 3221225472;
                v84[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_5;
                v84[3] = &unk_1E1EDDB08;
                v84[4] = v29;
                v84[5] = v32;
                objc_msgSend(v2, "deleteSearchableItemsWithIdentifiers:completionHandler:", v32, v84);
                v78 += v42;
              }
              v83[0] = MEMORY[0x1E0C809B0];
              v83[1] = 3221225472;
              v83[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_6;
              v83[3] = &unk_1E1EDDB58;
              v83[4] = v29;
              objc_msgSend(v2, "endIndexBatchWithClientState:completionHandler:", v76, v83);
            }
          }
        }
        else
        {
          v43 = objc_msgSend(v29, "name");
          _NSCoreDataLog(2, (uint64_t)CFSTR("Entity %@ has no indexed properties, skipping."), v44, v45, v46, v47, v48, v49, v43);
        }
        objc_autoreleasePoolPop(context);
      }
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v73);
  }
  if (_CoreData_SpotlightDebug >= 1)
  {
    v57 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Total items indexed, %lu, total items deleted, %lu")));
    _NSCoreDataLog(4, v57, v58, v59, v60, v61, v62, v63, v80);
  }
  objc_msgSend(v2, "beginIndexBatch");
  objc_msgSend(v2, "endIndexBatchWithClientState:completionHandler:", v67, &__block_literal_global_6);
  objc_msgSend(v81, "reset");
  objc_msgSend(v68, "drain");
  v64 = 0;
  return objc_msgSend(*(id *)(a1 + 56), "reset");
}

void __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error while resetting the client spotlight index before re-index, %@."), a3, a4, a5, a6, a7, a8, a2);
  }
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexAllSearchableItemsWithAcknowledgementHandler:(void *)acknowledgementHandler
{
  _QWORD v4[6];

  if (self->_enabled)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __103__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
    v4[3] = &unk_1E1EDDAE0;
    v4[4] = self;
    v4[5] = acknowledgementHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v4);
  }
  else if (acknowledgementHandler)
  {
    (*((void (**)(void *))acknowledgementHandler + 2))(acknowledgementHandler);
  }
}

uint64_t __103__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (_CoreData_SpotlightDebug >= 1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Re-indexing all searchable items"));
    v12 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(v2, "stringWithFormat:", v3);
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v12);
  }
  -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexSearchableItemsWithIdentifiers:(NSArray *)identifiers acknowledgementHandler:(void *)acknowledgementHandler
{
  _QWORD v5[8];

  if (self->_enabled)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
    v5[3] = &unk_1E1EDDC60;
    v5[4] = self;
    v5[5] = identifiers;
    v5[6] = searchableIndex;
    v5[7] = acknowledgementHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v5);
  }
  else if (acknowledgementHandler)
  {
    (*((void (**)(void *))acknowledgementHandler + 2))(acknowledgementHandler);
  }
}

uint64_t __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (_CoreData_SpotlightDebug >= 1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Re-indexing searchable items with identifiers, %@"));
    v37 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(v2, "stringWithFormat:", v3);
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v37);
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = *(void **)(a1 + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x18D76B4E4]();
        v19 = (const char *)objc_msgSend(v17, "UTF8String");
        v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectIDFromUTF8String:length:", v19, strlen(v19));
        if (v20)
        {
          v21 = v20;
          if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](objc_msgSend(v20, "entity")))
            objc_msgSend(v11, "addObject:", v21);
        }
        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v14);
  }
  if (objc_msgSend(v11, "count"))
  {
    v22 = -[NSCoreDataCoreSpotlightDelegate _context](*(_QWORD *)(a1 + 32));
    v23 = +[_PFRoutines fetchHeterogeneousCollectionByObjectIDs:intoContext:]((uint64_t)_PFRoutines, (uint64_t)v11, v22);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v39 != v29)
              objc_enumerationMutation(v24);
            v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
            v32 = (void *)MEMORY[0x18D76B4E4]();
            v33 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:](*(_QWORD **)(a1 + 32), v31);
            if (v33)
            {
              v34 = (uint64_t)v33;
              v35 = v25;
            }
            else
            {
              v34 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "objectID"), "URIRepresentation"), "description");
              v35 = v26;
            }
            objc_msgSend(v35, "addObject:", v34);
            objc_autoreleasePoolPop(v32);
          }
          v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v28);
      }
      if (objc_msgSend(v25, "count"))
        objc_msgSend(*(id *)(a1 + 48), "indexSearchableItems:completionHandler:", v25, &__block_literal_global_187);
      if (objc_msgSend(v26, "count"))
        objc_msgSend(*(id *)(a1 + 48), "deleteSearchableItemsWithIdentifiers:completionHandler:", v26, &__block_literal_global_190);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error indexing (insert/update 2): %@"), a3, a4, a5, a6, a7, a8, a2);
}

void __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error indexing (delete 2): %@"), a3, a4, a5, a6, a7, a8, a2);
}

- (void)stopSpotlightIndexing
{
  void *v3;
  _QWORD v4[5];

  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NSCoreDataCoreSpotlightDelegate_stopSpotlightIndexing__block_invoke;
  v4[3] = &unk_1E1EDD520;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);
}

uint64_t __56__NSCoreDataCoreSpotlightDelegate_stopSpotlightIndexing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  if (_CoreData_SpotlightDebug >= 1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Stopping spotlight indexing"));
    v12 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(v2, "stringWithFormat:", v3);
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v12);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
}

- (void)deleteSpotlightIndexWithCompletionHandler:(void *)completionHandler
{
  uint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__NSCoreDataCoreSpotlightDelegate_deleteSpotlightIndexWithCompletionHandler___block_invoke;
    v4[3] = &unk_1E1EDDAE0;
    v4[4] = self;
    v4[5] = completionHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v4);
  }
  else if (completionHandler)
  {
    v3 = *MEMORY[0x1E0CB28A8];
    v5 = *MEMORY[0x1E0CB2D50];
    v6[0] = CFSTR("Spotlight index not deleted because indexing was not started.");
    (*((void (**)(void *, uint64_t))completionHandler + 2))(completionHandler, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v3, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
}

void __77__NSCoreDataCoreSpotlightDelegate_deleteSpotlightIndexWithCompletionHandler___block_invoke(uint64_t a1)
{
  -[NSCoreDataCoreSpotlightDelegate _resetSpotlightIndexWithCompletionHandler:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (PFCSSearchableIndexProvider)indexProvider
{
  return self->_indexProvider;
}

- (void)setIndexProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)isIndexingEnabled
{
  return self->_enabled;
}

- (id)bundleIdentifier
{
  return 0;
}

- (id)protectionClass
{
  return 0;
}

- (BOOL)usePrivateIndex
{
  return 0;
}

- (NSURL)indexURL
{
  return self->_indexURL;
}

- (void)setIndexURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  NSURL *v13;

  if (_CoreData_SpotlightDebug >= 1)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend(CFSTR("CoreData+CoreSpotlight <%p>: %s(%d): "), "stringByAppendingString:", CFSTR("Setting alternative index URL")));
    _NSCoreDataLog(4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)self);
  }
  v12 = (NSURL *)objc_msgSend(a3, "standardizedURL");
  if (self->_indexURL != v12)
  {
    v13 = v12;
    if (objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "isEqualToString:", -[NSURL absoluteString](v12, "absoluteString")))
    {

      self->_indexURL = (NSURL *)-[NSURL copy](v13, "copy");
    }
  }
}

@end
