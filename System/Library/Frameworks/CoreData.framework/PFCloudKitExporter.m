@implementation PFCloudKitExporter

- (PFCloudKitExporter)initWithOptions:(id)a3 request:(id)a4 monitor:(id)a5 workQueue:(id)a6
{
  PFCloudKitExporter *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFCloudKitExporter;
  v10 = -[PFCloudKitExporter init](&v12, sel_init);
  if (v10)
  {
    v10->_monitor = (PFCloudKitStoreMonitor *)a5;
    v10->_options = (PFCloudKitExporterOptions *)objc_msgSend(a3, "copy");
    v10->_workQueue = (OS_dispatch_queue *)a6;
    if (a6)
      dispatch_retain((dispatch_object_t)a6);
    v10->_request = (NSCloudKitMirroringRequest *)a4;
    objc_storeWeak((id *)&v10->_delegate, 0);
    v10->_exportContext = -[PFCloudKitExportContext initWithOptions:]([PFCloudKitExportContext alloc], "initWithOptions:", v10->_options);
    v10->_operationIDToResult = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v10;
}

- (void)dealloc
{
  NSObject *workQueue;
  objc_super v4;

  workQueue = self->_workQueue;
  if (workQueue)
    dispatch_release(workQueue);

  self->_exportCompletionBlock = 0;
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitExporter;
  -[PFCloudKitExporter dealloc](&v4, sel_dealloc);
}

- (void)exportIfNecessaryWithCompletion:(_QWORD *)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSCloudKitMirroringResult *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCloudKitMirroringResult *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a1[2])
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "exportIfNecessaryWithCompletion invoked multiple times.");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v18);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v18) = 0;
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: exportIfNecessaryWithCompletion invoked multiple times.", (uint8_t *)&v18, 2u);
      }
      v12 = [NSCloudKitMirroringResult alloc];
      v13 = a1[5];
      v14 = a1[8];
      if (v14)
        v15 = *(_QWORD *)(v14 + 48);
      else
        v15 = 0;
      v16 = *MEMORY[0x1E0CB28A8];
      v19 = *MEMORY[0x1E0CB2D68];
      v20[0] = CFSTR("exportIfNecessaryWithCompletion called re-entrantly, this is a serious bug. Please file a feedback report.");
      v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v12, "initWithRequest:storeIdentifier:success:madeChanges:error:", v13, v15, 0, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v16, 134410, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
      ((void (**)(_QWORD, NSCloudKitMirroringResult *))a2)[2](a2, v17);

    }
    else
    {
      a1[2] = objc_msgSend(a2, "copy");
    }
    -[PFCloudKitExporter checkForZonesNeedingExport]((uint64_t)a1);
  }
}

- (void)checkForZonesNeedingExport
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSCloudKitMirroringResult *v19;
  uint64_t v20;
  uint64_t v21;
  NSCloudKitMirroringResult *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  NSCloudKitMirroringResult *v37;
  uint64_t v38;
  uint64_t v39;
  NSCloudKitMirroringResult *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[10];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  const __CFString *v63;
  _QWORD v64[5];
  id v65;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 1;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3052000000;
  v55 = __Block_byref_object_copy__33;
  v56 = __Block_byref_object_dispose__33;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__33;
  v50 = __Block_byref_object_dispose__33;
  v51 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 && ((objc_msgSend(*(id *)(v4 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v4 + 40)))
  {
    *((_BYTE *)v59 + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v62 = *MEMORY[0x1E0CB2D68];
    v63 = CFSTR("The request was aborted because it was deferred by the system.");
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v7 = objc_msgSend(v5, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v6);
    v53[5] = v7;
  }
  else
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke;
    v45[3] = &unk_1E1EDFDA8;
    v45[4] = v3;
    v45[5] = a1;
    v45[6] = v2;
    v45[7] = &v52;
    v45[8] = &v58;
    v45[9] = &v46;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v3, (uint64_t)v45);
  }
  if (*((_BYTE *)v59 + 24))
  {
    if (v47[5])
    {
      v8 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 3)
        v9 = 3;
      else
        v9 = __ckLoggingOverride;
      v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Scheduling modifyRecordZonesOperation in response to request: %@ operation: %@\n%@\n%@"));
      objc_msgSend((id)v47[5], "recordZonesToSave");
      objc_msgSend((id)v47[5], "recordZoneIDsToDelete");
      _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitExporter checkForZonesNeedingExport]");
      objc_autoreleasePoolPop(v8);
      v17 = *(_QWORD *)(a1 + 24);
      if (v17)
        v18 = *(void **)(v17 + 8);
      else
        v18 = 0;
      objc_msgSend(v18, "addOperation:", v47[5]);
      goto LABEL_30;
    }
    if (!objc_msgSend(v2, "count"))
    {
      -[PFCloudKitExporter exportIfNecessary](a1);
      goto LABEL_30;
    }
    v23 = (void *)MEMORY[0x18D76B4E4]();
    v24 = __ckLoggingOverride;
    v25 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Fetching record zones: %@"));
    if (v24 >= 0x10)
      v32 = 16;
    else
      v32 = v24;
    _NSCoreDataLog(v32, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[PFCloudKitExporter fetchRecordZones:]");
    objc_autoreleasePoolPop(v23);
    v33 = *(_QWORD *)(a1 + 40);
    if (v33 && ((objc_msgSend(*(id *)(v33 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v33 + 40)))
    {
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      location[0] = *(id *)MEMORY[0x1E0CB2D68];
      v64[0] = CFSTR("The request was aborted because it was deferred by the system.");
      v35 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, location, 1);
      v36 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v35);
    }
    else
    {
      objc_initWeak(location, (id)a1);
      v41 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKFetchRecordZonesOperationClass[0]()), "initWithRecordZoneIDs:", v2);
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __39__PFCloudKitExporter_fetchRecordZones___block_invoke;
      v64[3] = &unk_1E1EE0580;
      objc_copyWeak(&v65, location);
      v64[4] = a1;
      objc_msgSend(v41, "setFetchRecordZonesCompletionBlock:", v64);
      objc_destroyWeak(&v65);
      objc_destroyWeak(location);
      if (v41)
      {
        v43 = *(_QWORD *)(a1 + 24);
        if (v43)
          v44 = *(void **)(v43 + 8);
        else
          v44 = 0;
        objc_msgSend(v44, "addOperation:", v41);
        v36 = 0;
        goto LABEL_27;
      }
      v36 = 0;
    }
    v37 = [NSCloudKitMirroringResult alloc];
    v38 = *(_QWORD *)(a1 + 64);
    if (v38)
      v39 = *(_QWORD *)(v38 + 48);
    else
      v39 = 0;
    v40 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v37, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), v39, 0, 0, v36);
    -[PFCloudKitExporter finishExportWithResult:]((_QWORD *)a1, (uint64_t)v40);

    v41 = 0;
LABEL_27:

    goto LABEL_30;
  }
  v19 = [NSCloudKitMirroringResult alloc];
  v20 = *(_QWORD *)(a1 + 64);
  if (v20)
    v21 = *(_QWORD *)(v20 + 48);
  else
    v21 = 0;
  v22 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v19, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), v21, *((unsigned __int8 *)v59 + 24), 0, v53[5]);
  -[PFCloudKitExporter finishExportWithResult:]((_QWORD *)a1, (uint64_t)v22);

LABEL_30:
  v42 = (id)v53[5];
  v53[5] = 0;

  v47[5] = 0;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSManagedObjectContext *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      v6 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v6 = 0;
      WeakRetained = 0;
    }
    v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:](v7, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.export"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_2;
    v11[3] = &unk_1E1EE0490;
    v11[4] = v3;
    v11[5] = v7;
    v8 = *(_OWORD *)(a1 + 56);
    v12 = *(_OWORD *)(a1 + 40);
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 72);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v11);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "requestIdentifier"));
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v10);
  }
}

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSFetchRequest *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id location[5];
  _BYTE v43[128];
  _QWORD v44[3];

  v1 = a1;
  v44[1] = *MEMORY[0x1E0C80C00];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    location[0] = 0;
    if ((objc_msgSend(*(id *)(v1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), location) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18D76B4E4]();
      v3 = __ckLoggingOverride != 0;
      v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitExporter checkForZonesNeedingExport]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }
    v1 = a1;
  }
  v11 = *(_QWORD *)(v1 + 48);
  if (v11 && (v12 = *(_QWORD *)(v11 + 24)) != 0)
    v13 = *(void **)(v12 + 16);
  else
    v13 = 0;
  v14 = objc_msgSend(v13, "databaseScope");
  if ((unint64_t)(v14 - 1) <= 1)
  {
    v15 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", v14);
    if (!+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v15, v14, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v17 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
    -[NSFetchRequest setPredicate:](v17, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hasRecordZoneNum = NO AND database.databaseScopeNum = %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14)));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
    if (v18)
      v19 = *(_QWORD *)(v18 + 32);
    else
      v19 = 0;
    -[NSFetchRequest setFetchLimit:](v17, "setFetchLimit:", v19);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v17, "setReturnsObjectsAsFaults:", 0);
    v44[0] = *(_QWORD *)(a1 + 32);
    -[NSFetchRequest setAffectedStores:](v17, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1));
    v20 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v21 = v20;
    if (v20)
    {
      if (objc_msgSend(v20, "count"))
      {
        v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x18D76B4E4]();
              v27 = -[NSCKRecordZoneMetadata createRecordZoneID](v25);
              v28 = (void *)objc_msgSend(v27, "ownerName");
              if (objc_msgSend(v28, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]())
                && (v29 = (void *)objc_msgSend(v27, "zoneName"),
                    objc_msgSend(v29, "isEqualToString:", getCloudKitCKRecordZoneDefaultName[0]())))
              {
                objc_msgSend(v25, "setHasRecordZone:", 1);
                objc_msgSend(v25, "setSupportsAtomicChanges:", 1);
              }
              else
              {
                v30 = (void *)objc_msgSend(v25, "ckOwnerName");
                if (objc_msgSend(v30, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]()))
                {
                  v31 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneClass[0]()), "initWithZoneID:", v27);
                  objc_msgSend(v34, "addObject:", v31);

                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 56), "addObject:", v27);
                }
              }

              objc_autoreleasePoolPop(v26);
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v22);
        }
        if (objc_msgSend(v34, "count"))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]()), "initWithRecordZonesToSave:recordZoneIDsToDelete:", v34, 0);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "options"))
            -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "options"), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          objc_initWeak(location, *(id *)(a1 + 48));
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_3;
          v36[3] = &unk_1E1EE0468;
          objc_copyWeak(&v37, location);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setModifyRecordZonesCompletionBlock:", v36);
          objc_destroyWeak(&v37);
          objc_destroyWeak(location);
        }
        if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v32 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          }
        }

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v33 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
  }
}

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[8];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[4];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_4;
    v10[3] = &unk_1E1EDE7A8;
    v10[4] = v8;
    v10[5] = a2;
    v10[6] = a3;
    v10[7] = a4;
    dispatch_async(v9, v10);
  }

}

_QWORD *__48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_4(_QWORD *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  NSCloudKitMirroringResult *v5;
  uint64_t v6;
  uint64_t v7;
  NSCloudKitMirroringResult *v8;
  uint64_t v9;
  NSCloudKitMirroringResult *v10;
  uint64_t v11;
  uint64_t v12;
  NSCloudKitMirroringResult *v13;
  uint64_t v15;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (_QWORD *)a1[4];
  if (v3)
  {
    v4 = a1[7];
    if (v4)
    {
      v5 = [NSCloudKitMirroringResult alloc];
      v6 = v3[8];
      if (v6)
        v7 = *(_QWORD *)(v6 + 48);
      else
        v7 = 0;
      v8 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v5, "initWithRequest:storeIdentifier:success:madeChanges:error:", v3[5], v7, 0, 0, v4);
      -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v8);

    }
    else
    {
      v9 = a1[5];
      v15 = 0;
      if (-[PFCloudKitExporter updateMetadataForSavedZones:error:]((uint64_t)v3, v9, &v15))
      {
        -[PFCloudKitExporter checkForZonesNeedingExport](v3);
      }
      else
      {
        v10 = [NSCloudKitMirroringResult alloc];
        v11 = v3[8];
        if (v11)
          v12 = *(_QWORD *)(v11 + 48);
        else
          v12 = 0;
        v13 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v10, "initWithRequest:storeIdentifier:success:madeChanges:error:", v3[5], v12, 0, 0, v15);
        -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v13);

      }
    }
    v3 = 0;
  }
  objc_msgSend(v2, "drain");
  return v3;
}

- (void)exportIfNecessary
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSCloudKitMirroringResult *v7;
  uint64_t v8;
  uint64_t v9;
  NSCloudKitMirroringResult *v10;
  id v11;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__33;
    v17 = __Block_byref_object_dispose__33;
    v18 = 0;
    v2 = *(id *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 && ((objc_msgSend(*(id *)(v3 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v3 + 40)))
    {
      *((_BYTE *)v20 + 24) = 0;
      v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v23 = *MEMORY[0x1E0CB2D68];
      v24[0] = CFSTR("The request was aborted because it was deferred by the system.");
      v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v6 = objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v5);
      v14[5] = v6;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __39__PFCloudKitExporter_exportIfNecessary__block_invoke;
      v12[3] = &unk_1E1EDD7B8;
      v12[4] = v2;
      v12[5] = a1;
      v12[6] = &v19;
      v12[7] = &v13;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v2, (uint64_t)v12);
    }
    if (!*((_BYTE *)v20 + 24))
    {
      v7 = [NSCloudKitMirroringResult alloc];
      v8 = *(_QWORD *)(a1 + 64);
      if (v8)
        v9 = *(_QWORD *)(v8 + 48);
      else
        v9 = 0;
      v10 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v7, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), v9, 0, 0, v14[5]);
      -[PFCloudKitExporter finishExportWithResult:]((_QWORD *)a1, (uint64_t)v10);

    }
    v11 = (id)v14[5];
    v14[5] = 0;

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
}

- (void)finishExportWithResult:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PFCloudKitExportedRecordBytesMetric *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = 0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v4 = a1[7];
    v33 = a1;
    if (v4)
      v5 = *(void **)(v4 + 40);
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      v9 = *MEMORY[0x1E0CB28A8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(v3, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), &v38) & 1) == 0
            && (!objc_msgSend((id)objc_msgSend(v38, "domain"), "isEqualToString:", v9)
             || objc_msgSend(v38, "code") != 4))
          {
            v11 = (void *)MEMORY[0x18D76B4E4]();
            v12 = __ckLoggingOverride != 0;
            v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to delete asset file: %@\n%@"));
            _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitExporter purgeWrittenAssetURLs]");
            objc_autoreleasePoolPop(v11);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    v20 = [PFCloudKitExportedRecordBytesMetric alloc];
    v21 = v33[3];
    if (v21)
      v22 = *(void **)(v21 + 16);
    else
      v22 = 0;
    v23 = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v20, "initWithContainerIdentifier:", objc_msgSend(v22, "containerIdentifier"));
    v24 = (void *)v23;
    v25 = v33[7];
    if (v25)
      v26 = *(_QWORD *)(v25 + 16);
    else
      v26 = 0;
    -[PFCloudKitSizeMetric addByteSize:](v23, v26);
    v27 = v33[3];
    if (v27 && (v28 = *(_QWORD *)(v27 + 16)) != 0)
      v29 = *(_QWORD *)(v28 + 72);
    else
      v29 = 0;
    -[PFCloudKitMetricsClient logMetric:](v29, v24);

    v30 = v33[2];
    if (v30)
    {
      (*(void (**)(uint64_t, uint64_t))(v30 + 16))(v30, a2);
      v31 = (void *)v33[2];
    }
    else
    {
      v31 = 0;
    }

    v33[2] = 0;
  }
}

void __39__PFCloudKitExporter_exportIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSManagedObjectContext *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      v6 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v6 = 0;
      WeakRetained = 0;
    }
    v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:](v7, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.export"));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v7, "_setAllowAncillaryEntities:", 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PFCloudKitExporter_exportIfNecessary__block_invoke_2;
    v10[3] = &unk_1E1EDD6B8;
    v10[4] = *(_QWORD *)(a1 + 40);
    v10[5] = v3;
    v10[6] = v7;
    v11 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0CB2D68];
    v13[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "requestIdentifier"));
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v9);
  }
}

void __39__PFCloudKitExporter_exportIfNecessary__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  id *v2;
  void *v3;
  unsigned __int8 *v4;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
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
  uint64_t v35;
  char v36;
  void *v37;
  uint64_t *v38;
  PFCloudKitHistoryAnalyzerOptions *v39;
  PFCloudKitHistoryAnalyzerOptions *v40;
  const char *v41;
  PFCloudKitHistoryAnalyzer *v42;
  void *v43;
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
  id v55;
  id v56;
  char v57;
  int v58;
  int v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  id *v119;
  void *v120;
  uint64_t v121;
  int v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id WeakRetained;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id *v151;
  id *v152;
  void *v153;
  id v154;
  void *v155;
  NSCloudKitMirroringResult *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSCloudKitMirroringResult *v160;
  id *v161;
  id *v162;
  NSCloudKitMirroringResult *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  NSCloudKitMirroringResult *v167;
  uint64_t v168;
  id v169;
  id *v170;
  _QWORD v172[5];
  id *v173;
  id v174[5];
  uint64_t v175;
  const __CFString *v176;
  void *v177;
  uint64_t v178;
  const __CFString *v179;
  uint64_t v180;
  id location[2];
  _BYTE buf[24];
  void *v183;
  uint64_t v184;
  id v185[5];

  v1 = (_QWORD *)a1;
  v185[2] = *(id *)MEMORY[0x1E0C80C00];
  v173 = 0;
  v2 = *(id **)(a1 + 32);
  v170 = v2;
  if (!v2)
    goto LABEL_74;
  v4 = *(unsigned __int8 **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v174[0] = 0;
  v169 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, v4))
  {
    *(_QWORD *)buf = 0;
    if ((objc_msgSend(v3, "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
    {
      v5 = (void *)MEMORY[0x18D76B4E4]();
      v6 = __ckLoggingOverride;
      v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v6 != 0, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v5);
    }
  }
  v14 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), (uint64_t)v4, v3, (uint64_t)v174);
  if (v174[0])
  {
    v15 = (void *)MEMORY[0x18D76B4E4](v174[0]);
    v16 = __ckLoggingOverride;
    v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to read the last history token: %@"));
    _NSCoreDataLog(v16 != 0, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v15);
    v24 = 0;
    v25 = 0;
  }
  else
  {
    v25 = objc_msgSend(v14, "transformedValue");
    v26 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateBypassHistoryOnExportKey"), (uint64_t)v4, v3, (uint64_t)v174);
    if (!v174[0])
    {
      v58 = objc_msgSend(v26, "BOOLValue");
      v24 = v58;
      if (v25)
        v59 = v58;
      else
        v59 = 1;
      if (v59 == 1)
      {
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey"), 1, (uint64_t)v4, v3, v174))
        {
          v60 = v174[0];
          goto LABEL_9;
        }
      }
      else
      {
        v24 = 0;
      }
      v36 = 0;
      goto LABEL_10;
    }
    v27 = (void *)MEMORY[0x18D76B4E4](v174[0]);
    v28 = __ckLoggingOverride;
    v29 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to read the bypass entry: %@"));
    _NSCoreDataLog(v28 != 0, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v27);
    v24 = 0;
  }
LABEL_9:
  v36 = 1;
LABEL_10:
  if (objc_msgSend(v3, "hasChanges") && (objc_msgSend(v3, "save:", v174) & 1) == 0)
  {
    v38 = 0;
    v39 = 0;
    v56 = v174[0];
    v37 = 0;
    v57 = 0;
    goto LABEL_55;
  }
  if ((v36 & 1) == 0)
  {
    v40 = objc_alloc_init(PFCloudKitHistoryAnalyzerOptions);
    v39 = v40;
    if (v40)
    {
      *(&v40->_includePrivateTransactions + 1) = v24;
      objc_setProperty_nonatomic(v40, v41, v170[5], 32);
    }
    v42 = -[PFCloudKitHistoryAnalyzer initWithOptions:managedObjectContext:]([PFCloudKitHistoryAnalyzer alloc], "initWithOptions:managedObjectContext:", v39, v3);
    v43 = (void *)MEMORY[0x18D76B4E4]();
    v38 = (uint64_t *)v42;
    v44 = __ckLoggingOverride;
    v45 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Exporting changes since (%d): %@"));
    if (v44 >= 0x10)
      v52 = 16;
    else
      v52 = v44;
    _NSCoreDataLog(v52, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v43);
    v53 = -[PFHistoryAnalyzer newAnalyzerContextForStore:sinceLastHistoryToken:inManagedObjectContext:error:]((uint64_t)v38, (uint64_t)v4, v25, v3, v174);
    v37 = (void *)v53;
    if (v53)
    {
      v54 = *(_QWORD *)(v53 + 48);
      if (v54)
      {
        +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), v54, (uint64_t)v4, v3, v174);
        if (v174[0])
        {
          v55 = v174[0];
          goto LABEL_54;
        }
        v80 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateBypassHistoryOnExportKey"), (uint64_t)v4, v3, (uint64_t)v174);
        if (v174[0])
        {
          v81 = (void *)MEMORY[0x18D76B4E4](v80);
          v82 = __ckLoggingOverride;
          v83 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to read the bypass entry: %@"));
          _NSCoreDataLog(v82 != 0, v83, v84, v85, v86, v87, v88, v89, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
          objc_autoreleasePoolPop(v81);
          v90 = v174[0];
          goto LABEL_54;
        }
        v91 = v80;
        if (v80)
          objc_msgSend(v3, "deleteObject:", v80);
        if (objc_msgSend(v3, "hasChanges", v91))
        {
          if ((objc_msgSend(v3, "save:", v174) & 1) == 0)
            v92 = v174[0];
          objc_msgSend(v3, "reset");
        }
      }
      v57 = 1;
      goto LABEL_55;
    }
    if (!v174[0])
    {
      v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "History analyzer should have set an error if the analyzer context is nil.");
      _NSCoreDataLog(17, v61, v62, v63, v64, v65, v66, v67, v168);
      v68 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v68, OS_LOG_TYPE_FAULT, "CoreData: History analyzer should have set an error if the analyzer context is nil.", buf, 2u);
      }
    }
    v69 = v174[0];
    v70 = (void *)objc_msgSend(v174[0], "domain");
    if (objc_msgSend(v70, "isEqualToString:", *MEMORY[0x1E0CB28A8])
      && objc_msgSend(v174[0], "code") == 134419
      && v38
      && v38[3])
    {
      *(_QWORD *)buf = 0;
      if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), v38[3], (uint64_t)v4, v3, buf))
      {
        v71 = (void *)MEMORY[0x18D76B4E4]();
        v93 = __ckLoggingOverride;
        v94 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to update exporter history token after deferral: %@"));
        _NSCoreDataLog(v93 != 0, v94, v95, v96, v97, v98, v99, v100, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
        goto LABEL_52;
      }
      if ((objc_msgSend(v3, "save:", buf) & 1) == 0)
      {
        v71 = (void *)MEMORY[0x18D76B4E4]();
        v72 = __ckLoggingOverride;
        v73 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save exporter history token after deferral: %@"));
        _NSCoreDataLog(v72 != 0, v73, v74, v75, v76, v77, v78, v79, (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
LABEL_52:
        objc_autoreleasePoolPop(v71);
      }
    }
    v37 = 0;
    goto LABEL_54;
  }
  v37 = 0;
  v38 = 0;
  v39 = 0;
LABEL_54:
  v57 = 0;
LABEL_55:

  v1 = (_QWORD *)a1;
  if ((v57 & 1) == 0)
  {
    v101 = (id *)v174[0];
    if (v101)
    {
      v173 = v101;
    }
    else
    {
      v102 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v102, v103, v104, v105, v106, v107, v108, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m");
      v109 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 629;
        _os_log_fault_impl(&dword_18A253000, v109, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  if ((v57 & 1) == 0)
  {
    v2 = v173;
LABEL_74:
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) = 0;
    v119 = v2;
    goto LABEL_75;
  }
  v110 = *(_QWORD *)(a1 + 32);
  if (v110)
  {
    v111 = *(_QWORD *)(v110 + 40);
    if (v111)
    {
      if ((objc_msgSend(*(id *)(v111 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v111 + 40))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v178 = *MEMORY[0x1E0CB2D68];
        v179 = CFSTR("The request was aborted because it was deferred by the system.");
        v113 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
        v114 = (id *)objc_msgSend(v112, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v113);
LABEL_66:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v114;
        goto LABEL_67;
      }
    }
  }
  v120 = (void *)+[NSCKHistoryAnalyzerState countAnalyzerStatesInStore:withManagedObjectContext:error:]((uint64_t)NSCKHistoryAnalyzerState, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (id *)&v173);
  if (v120)
  {
    if (objc_msgSend(v120, "integerValue") >= 1)
    {
      v121 = a1 + 56;
      v122 = 1;
      goto LABEL_108;
    }
    v153 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v173);
    if (v153)
    {
      v122 = objc_msgSend(v153, "BOOLValue");
      goto LABEL_104;
    }
    v161 = v173;
    if (!v173)
    {
      v122 = 0;
      goto LABEL_104;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v151 = v161;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v151 = v173;
  }
  v152 = v151;
  v122 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v152;
LABEL_104:
  v121 = a1 + 56;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && (v122 & 1) == 0)
  {
    v154 = +[NSCKRecordZoneMoveReceipt countMoveReceiptsInStore:matchingPredicate:withManagedObjectContext:error:](NSCKRecordZoneMoveReceipt, "countMoveReceiptsInStore:matchingPredicate:withManagedObjectContext:error:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsCloudDelete == 1")), *(_QWORD *)(a1 + 48), &v173);
    if (!v154)
    {
LABEL_111:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v121 + 8) + 24) = 0;
      v114 = v173;
      goto LABEL_66;
    }
    v122 = objc_msgSend(v154, "integerValue") > 0;
  }
LABEL_108:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v121 + 8) + 24)
    && v122
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "processAnalyzedHistoryInStore:inManagedObjectContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v173) & 1) == 0)
  {
    goto LABEL_111;
  }
LABEL_67:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    return;
  v115 = *(_QWORD *)(a1 + 32);
  if (v115)
  {
    v116 = *(_QWORD *)(v115 + 40);
    if (v116)
    {
      if ((objc_msgSend(*(id *)(v116 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v116 + 40))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v117 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v175 = *MEMORY[0x1E0CB2D68];
        v176 = CFSTR("The request was aborted because it was deferred by the system.");
        v118 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
        v119 = (id *)objc_msgSend(v117, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v118);
LABEL_75:
        *(_QWORD *)(*(_QWORD *)(v1[8] + 8) + 40) = v119;
        return;
      }
    }
  }
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 40)))
  {
    *(_QWORD *)buf = 0;
    if ((objc_msgSend(*(id *)(a1 + 48), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
    {
      v123 = (void *)MEMORY[0x18D76B4E4]();
      v124 = __ckLoggingOverride;
      v1 = (_QWORD *)a1;
      v125 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v124 != 0, v125, v126, v127, v128, v129, v130, v131, (uint64_t)"-[PFCloudKitExporter exportIfNecessary]_block_invoke_2");
      objc_autoreleasePoolPop(v123);
    }
  }
  v180 = 0;
  if (!objc_msgSend(*(id *)(v1[4] + 56), "checkForObjectsNeedingExportInStore:andReturnCount:withManagedObjectContext:error:", v1[5], &v180, v1[6], &v173))
  {
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) = 0;
    v119 = v173;
    goto LABEL_75;
  }
  v132 = (void *)MEMORY[0x18D76B4E4]();
  v133 = __ckLoggingOverride;
  v134 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Found %lu objects needing export."));
  if (v133 >= 0x10)
    v141 = 16;
  else
    v141 = v133;
  _NSCoreDataLog(v141, v134, v135, v136, v137, v138, v139, v140, (uint64_t)"-[PFCloudKitExporter exportIfNecessary]_block_invoke_2");
  objc_autoreleasePoolPop(v132);
  if (v180)
  {
    v142 = -[PFCloudKitExportContext newOperationBySerializingDirtyObjectsInStore:inManagedObjectContext:error:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), &v173);
    if (v142)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      v144 = *(_QWORD *)(a1 + 32);
      v177 = v142;
      objc_msgSend(WeakRetained, "exporter:willScheduleOperations:", v144, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v177, 1));

      v145 = *(_QWORD *)(a1 + 32);
      if (v145)
      {
        objc_initWeak(location, *(id *)(a1 + 32));
        if (objc_msgSend(*(id *)(v145 + 40), "options"))
          -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(v145 + 40), "options"), v142);
        objc_msgSend(v142, "setSavePolicy:", 1);
        v146 = *(_QWORD *)(v145 + 24);
        if (!v146 || (v147 = *(_QWORD *)(v146 + 16)) == 0 || !*(_BYTE *)(v147 + 18))
          objc_msgSend(v142, "setSavePolicy:", 0);
        v148 = objc_msgSend(v142, "operationID");
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __39__PFCloudKitExporter_executeOperation___block_invoke;
        v183 = &unk_1E1EE0508;
        objc_copyWeak(v185, location);
        v184 = v148;
        objc_msgSend(v142, "setModifyRecordsCompletionBlock:", buf);
        v149 = *(_QWORD *)(v145 + 24);
        if (v149)
          v150 = *(void **)(v149 + 8);
        else
          v150 = 0;
        objc_msgSend(v150, "addOperation:", v142);
        objc_destroyWeak(v185);
        objc_destroyWeak(location);
      }
    }
    else
    {
      v162 = v173;
      if (v173)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v162;
      }
      else
      {
        v163 = [NSCloudKitMirroringResult alloc];
        v164 = *(_QWORD *)(a1 + 32);
        v165 = *(_QWORD *)(v164 + 64);
        if (v165)
          v166 = *(_QWORD *)(v165 + 48);
        else
          v166 = 0;
        v167 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v163, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v164 + 40), v166, 1, 0, 0);
        -[PFCloudKitExporter finishExportWithResult:](*(_QWORD **)(a1 + 32), (uint64_t)v167);

      }
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v183) = 0;
    v155 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v172[0] = MEMORY[0x1E0C809B0];
    v172[1] = 3221225472;
    v172[2] = __39__PFCloudKitExporter_exportIfNecessary__block_invoke_3;
    v172[3] = &unk_1E1EE04B8;
    v172[4] = buf;
    objc_msgSend(v155, "enumerateKeysAndObjectsUsingBlock:", v172);
    v156 = [NSCloudKitMirroringResult alloc];
    v157 = *(_QWORD *)(a1 + 32);
    v158 = *(_QWORD *)(v157 + 64);
    if (v158)
      v159 = *(_QWORD *)(v158 + 48);
    else
      v159 = 0;
    v160 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v156, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v157 + 40), v159, 1, *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24), 0);
    -[PFCloudKitExporter finishExportWithResult:](*(_QWORD **)(a1 + 32), (uint64_t)v160);

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __39__PFCloudKitExporter_exportIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "madeChanges");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __39__PFCloudKitExporter_executeOperation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[9];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PFCloudKitExporter_executeOperation___block_invoke_2;
    block[3] = &unk_1E1EE04E0;
    v11 = *(_QWORD *)(a1 + 32);
    block[4] = v9;
    block[5] = v11;
    block[6] = a2;
    block[7] = a3;
    block[8] = a4;
    dispatch_async(v10, block);
  }

}

id __39__PFCloudKitExporter_executeOperation___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSCloudKitMirroringResult *v18;
  uint64_t v19;
  uint64_t v20;
  NSCloudKitMirroringResult *v21;
  _QWORD v23[10];

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = a1[4];
  if (v3)
  {
    v4 = a1[5];
    v5 = a1[6];
    v7 = a1[7];
    v6 = a1[8];
    v8 = (void *)MEMORY[0x18D76B4E4]();
    v9 = __ckLoggingOverride;
    v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Modify records finished: %@\n%@\n%@"));
    if (v9 >= 3)
      v17 = 3;
    else
      v17 = v9;
    _NSCoreDataLog(v17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitExporter exportOperationFinished:withSavedRecords:deletedRecordIDs:operationError:]");
    objc_autoreleasePoolPop(v8);
    if (v6)
    {
      v18 = [NSCloudKitMirroringResult alloc];
      v19 = *(_QWORD *)(v3 + 64);
      if (v19)
        v20 = *(_QWORD *)(v19 + 48);
      else
        v20 = 0;
      v21 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v18, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v3 + 40), v20, 0, objc_msgSend(*(id *)(v3 + 8), "count") != 0, v6);
      -[PFCloudKitExporter finishExportWithResult:]((_QWORD *)v3, (uint64_t)v21);
    }
    else
    {
      v21 = (NSCloudKitMirroringResult *)*(id *)(v3 + 64);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke;
      v23[3] = &unk_1E1EE0558;
      v23[4] = v21;
      v23[5] = v3;
      v23[6] = v5;
      v23[7] = v7;
      v23[8] = 0;
      v23[9] = v4;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v21, (uint64_t)v23);
    }

  }
  objc_msgSend(v2, "drain");
  return 0;
}

void __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSManagedObjectContext *v7;
  uint64_t v8;
  NSCloudKitMirroringResult *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSCloudKitMirroringResult *v13;
  _QWORD *v14;
  NSCloudKitMirroringResult *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSCloudKitMirroringResult *v22;
  _QWORD v23[6];
  __int128 v24;
  uint64_t v25;
  NSManagedObjectContext *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      v6 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v6 = 0;
      WeakRetained = 0;
    }
    v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setMergePolicy:](v7, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    -[NSManagedObjectContext setTransactionAuthor:](v7, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.export"));
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__33;
    v34 = __Block_byref_object_dispose__33;
    v35 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke_2;
    v23[3] = &unk_1E1EE0530;
    v23[4] = *(_QWORD *)(a1 + 40);
    v23[5] = v3;
    v24 = *(_OWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 72);
    v25 = *(_QWORD *)(a1 + 64);
    v26 = v7;
    v28 = &v30;
    v29 = &v36;
    v27 = v8;
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v23);
    v9 = [NSCloudKitMirroringResult alloc];
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 64);
    if (v11)
      v12 = *(_QWORD *)(v11 + 48);
    else
      v12 = 0;
    v13 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v9, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v10 + 40), v12, *((unsigned __int8 *)v37 + 24), *((unsigned __int8 *)v37 + 24), v31[5]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v13, *(_QWORD *)(a1 + 72));
    v14 = *(_QWORD **)(a1 + 40);
    if (*((_BYTE *)v37 + 24))
      -[PFCloudKitExporter exportIfNecessary](v14);
    else
      -[PFCloudKitExporter finishExportWithResult:](v14, (uint64_t)v13);

    v31[5] = 0;
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

  }
  else
  {
    v15 = [NSCloudKitMirroringResult alloc];
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 40);
    v18 = *(_QWORD *)(v16 + 64);
    if (v18)
      v19 = *(_QWORD *)(v18 + 48);
    else
      v19 = 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D68];
    v41[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v17, "requestIdentifier"));
    v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v22 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v15, "initWithRequest:storeIdentifier:success:madeChanges:error:", v17, v19, 0, 0, objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v21));
    -[PFCloudKitExporter finishExportWithResult:](*(_QWORD **)(a1 + 40), (uint64_t)v22);

  }
}

uint64_t __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
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
  uint64_t result;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  char v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v76;
  char v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90[5];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (!-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 72), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)))
  {
    v27 = (void *)MEMORY[0x18D76B4E4]();
    v28 = __ckLoggingOverride;
    v29 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Failed to update metadadata after operation finished (%@): %@"));
    _NSCoreDataLog(v28 != 0, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[PFCloudKitExporter exportOperationFinished:withSavedRecords:deletedRecordIDs:operationError:]_block_invoke_2");
LABEL_30:
    objc_autoreleasePoolPop(v27);
    goto LABEL_31;
  }
  v76 = *(_QWORD *)(a1 + 32);
  if (!v76)
  {
LABEL_31:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
    return (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  }
  v2 = *(void **)(a1 + 48);
  v1 = *(void **)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 72);
  v73 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v90[0] = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v2, v1, v3, v4, v90);
  if (!v7)
  {
    v37 = (void *)MEMORY[0x18D76B4E4]();
    v38 = __ckLoggingOverride;
    v39 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Failed to fetch metadata for post-export update: %@\n%@\n%@"));
    _NSCoreDataLog(v38 != 0, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"-[PFCloudKitExporter updateMetadataForSavedRecords:deletedRecordIDs:inStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v37);
LABEL_55:
    v50 = 0;
    goto LABEL_56;
  }
  v72 = v3;
  v74 = v6;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v8 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v87;
    v77 = 1;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v9)
        objc_enumerationMutation(v2);
      v11 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v10);
      if ((+[PFCloudKitSerializer isMirroredRelationshipRecordType:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend(v11, "recordType")) & 1) == 0)
      {
        v12 = (void *)objc_msgSend(v11, "recordType");
        if ((objc_msgSend(v12, "isEqualToString:", getCloudKitCKRecordTypeShare[0]()) & 1) == 0)
        {
          v13 = (void *)objc_msgSend(v7, "objectForKey:", objc_msgSend(v11, "recordID"));
          if (v13)
          {
            v14 = *(_QWORD *)(v76 + 24);
            if (v14 && (v15 = *(_QWORD *)(v14 + 16)) != 0)
              v16 = *(_QWORD *)(v15 + 136);
            else
              v16 = 0;
            v17 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v16, (uint64_t)v11, v90);
            if (v17)
            {
              objc_msgSend(v13, "setEncodedRecord:", v17);
              objc_msgSend(v13, "setCkRecordSystemFields:", 0);
            }
            else
            {
              v77 = 0;
            }

            if (objc_msgSend(v13, "pendingExportTransactionNumber"))
            {
              objc_msgSend(v13, "setLastExportedTransactionNumber:", objc_msgSend(v13, "pendingExportTransactionNumber"));
              objc_msgSend(v13, "setPendingExportTransactionNumber:", 0);
            }
          }
          else
          {
            v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Metadata Inconsistency: Missing metadata for record: %@");
            _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v11);
            v25 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = (const char *)v11;
              _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Metadata Inconsistency: Missing metadata for record: %@", buf, 0xCu);
            }
          }
          if ((v77 & 1) == 0)
            break;
        }
      }
      if (v8 == ++v10)
      {
        v26 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
        v8 = v26;
        if (v26)
          goto LABEL_6;
        if ((v77 & 1) != 0)
          goto LABEL_35;
        break;
      }
    }
  }
  else
  {
    v77 = 1;
LABEL_35:
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v46 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v83 != v47)
            objc_enumerationMutation(v1);
          v49 = objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
          if (v49)
            objc_msgSend(v4, "deleteObject:", v49);
        }
        v46 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
      }
      while (v46);
    }
  }
  v50 = v77;
  if ((v77 & 1) == 0)
  {
    v6 = v74;
    goto LABEL_56;
  }
  v6 = v74;
  v51 = +[NSCKRecordZoneMoveReceipt moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:](NSCKRecordZoneMoveReceipt, "moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:", v1, v4, v72, v90);
  v52 = v51;
  if (!v51)
    goto LABEL_55;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v79 != v54)
          objc_enumerationMutation(v52);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "setNeedsCloudDelete:", 0);
      }
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
    }
    while (v53);
  }
LABEL_56:

  if ((v50 & 1) == 0)
  {
    if (v90[0])
    {
      *(id *)(v73 + 40) = v90[0];
    }
    else
    {
      v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m");
      v71 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v92 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m";
        v93 = 1024;
        v94 = 871;
        _os_log_fault_impl(&dword_18A253000, v71, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    goto LABEL_31;
  }
  result = objc_msgSend(*(id *)(a1 + 72), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if ((result & 1) == 0)
  {
    v27 = (void *)MEMORY[0x18D76B4E4]();
    v56 = __ckLoggingOverride;
    v57 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save record name updates: %@"));
    _NSCoreDataLog(v56 != 0, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[PFCloudKitExporter exportOperationFinished:withSavedRecords:deletedRecordIDs:operationError:]_block_invoke_2");
    goto LABEL_30;
  }
  return result;
}

- (uint64_t)updateMetadataForSavedZones:(_QWORD *)a3 error:
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__33;
  v27 = __Block_byref_object_dispose__33;
  v28 = 0;
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 && ((objc_msgSend(*(id *)(v7 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v7 + 40)))
  {
    *((_BYTE *)v30 + 24) = 0;
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v37 = *MEMORY[0x1E0CB2D68];
    v38[0] = CFSTR("The request was aborted because it was deferred by the system.");
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v10 = objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v9);
    v24[5] = v10;
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke;
    v22[3] = &unk_1E1EDD6B8;
    v22[4] = v6;
    v22[5] = a2;
    v22[6] = a1;
    v22[7] = &v23;
    v22[8] = &v29;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v22);
  }

  if (!*((_BYTE *)v30 + 24))
  {
    v13 = (id)v24[5];
    if (v13)
    {
      if (a3)
        *a3 = v13;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m";
        v35 = 1024;
        v36 = 1008;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v24[5] = 0;
  v11 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSManagedObjectContext *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;
  void *v12;
  NSManagedObjectContext *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      v6 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v6 = 0;
      WeakRetained = 0;
    }
    v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:](v7, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.export"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke_2;
    v10[3] = &unk_1E1EDF0B8;
    v11 = *(_OWORD *)(a1 + 40);
    v12 = v3;
    v13 = v7;
    v14 = *(_OWORD *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "requestIdentifier"));
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v9);
  }
}

uint64_t __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSManagedObject *v12;
  unint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v4 = result;
  if (result)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(v7, "zoneID");
        v9 = *(_QWORD *)(a1 + 40);
        if (v9 && (v10 = *(_QWORD *)(v9 + 24)) != 0)
          v11 = *(void **)(v10 + 16);
        else
          v11 = 0;
        v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v8, objc_msgSend(v11, "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (!v12
          || (v13 = objc_msgSend(v7, "capabilities"),
              -[NSManagedObject setSupportsFetchChanges:](v12, "setSupportsFetchChanges:", v13 & 1),
              -[NSManagedObject setSupportsRecordSharing:](v12, "setSupportsRecordSharing:", (v13 >> 2) & 1),
              -[NSManagedObject setSupportsAtomicChanges:](v12, "setSupportsAtomicChanges:", (v13 >> 1) & 1),
              -[NSManagedObject setSupportsZoneSharing:](v12, "setSupportsZoneSharing:", (v13 >> 3) & 1),
              -[NSManagedObject setHasRecordZone:](v12, "setHasRecordZone:", 1),
              (objc_msgSend(*(id *)(a1 + 56), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) & 1) == 0))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void __39__PFCloudKitExporter_fetchRecordZones___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  _QWORD block[7];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PFCloudKitExporter_fetchRecordZones___block_invoke_2;
    block[3] = &unk_1E1EDD790;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v8, block);
  }

}

_QWORD *__39__PFCloudKitExporter_fetchRecordZones___block_invoke_2(_QWORD *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSCloudKitMirroringResult *v16;
  uint64_t v17;
  uint64_t v18;
  NSCloudKitMirroringResult *v19;
  NSCloudKitMirroringResult *v20;
  uint64_t v21;
  uint64_t v22;
  NSCloudKitMirroringResult *v23;
  uint64_t v25;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (_QWORD *)a1[4];
  if (v3)
  {
    v5 = (void *)a1[5];
    v4 = a1[6];
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Finished fetching record zones: %@ - %@"));
    if (v7 >= 0x10)
      v15 = 16;
    else
      v15 = v7;
    _NSCoreDataLog(v15, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitExporter fetchRecordZonesOperationFinished:operationError:]");
    objc_autoreleasePoolPop(v6);
    if (v4)
    {
      v16 = [NSCloudKitMirroringResult alloc];
      v17 = v3[8];
      if (v17)
        v18 = *(_QWORD *)(v17 + 48);
      else
        v18 = 0;
      v19 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v16, "initWithRequest:storeIdentifier:success:madeChanges:error:", v3[5], v18, 0, 0, v4);
      -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v19);

    }
    else
    {
      v25 = 0;
      if (-[PFCloudKitExporter updateMetadataForSavedZones:error:]((uint64_t)v3, objc_msgSend(v5, "allValues"), &v25))
      {
        -[PFCloudKitExporter exportIfNecessary]((uint64_t)v3);
      }
      else
      {
        v20 = [NSCloudKitMirroringResult alloc];
        v21 = v3[8];
        if (v21)
          v22 = *(_QWORD *)(v21 + 48);
        else
          v22 = 0;
        v23 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v20, "initWithRequest:storeIdentifier:success:madeChanges:error:", v3[5], v22, 0, 0, v25);
        -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v23);

      }
    }
    v3 = 0;
  }
  objc_msgSend(v2, "drain");
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
