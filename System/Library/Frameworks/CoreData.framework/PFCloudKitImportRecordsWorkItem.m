@implementation PFCloudKitImportRecordsWorkItem

- (PFCloudKitImportRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  PFCloudKitImportRecordsWorkItem *v5;
  PFCloudKitFetchedRecordBytesMetric *v6;
  void *v7;
  PFCloudKitFetchedAssetBytesMetric *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFCloudKitImportRecordsWorkItem;
  v5 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v11, sel_initWithOptions_request_, a3, a4);
  if (v5)
  {
    v5->_importOperationIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v5->_assetPathToSafeSaveURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_updatedRecords = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_allRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_totalOperationBytes = 0;
    v5->_currentOperationBytes = 0;
    v5->_countUpdatedRecords = 0;
    v5->_countDeletedRecords = 0;
    v5->_encounteredErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_failedRelationships = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = [PFCloudKitFetchedRecordBytesMetric alloc];
    if (a3)
      v7 = (void *)*((_QWORD *)a3 + 3);
    else
      v7 = 0;
    v5->_fetchedRecordBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v6, "initWithContainerIdentifier:", objc_msgSend(v7, "containerIdentifier"));
    v8 = [PFCloudKitFetchedAssetBytesMetric alloc];
    if (a3)
      v9 = (void *)*((_QWORD *)a3 + 3);
    else
      v9 = 0;
    v5->_fetchedAssetBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v8, "initWithContainerIdentifier:", objc_msgSend(v9, "containerIdentifier"));
    v5->_incrementalResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_unknownItemRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_updatedShares = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_importOperationIdentifier = 0;
  self->_assetPathToSafeSaveURL = 0;

  self->_updatedRecords = 0;
  self->_recordTypeToDeletedRecordID = 0;

  self->_allRecordIDs = 0;
  self->_encounteredErrors = 0;

  self->_failedRelationships = 0;
  self->_fetchedRecordBytesMetric = 0;

  self->_fetchedAssetBytesMetric = 0;
  self->_incrementalResults = 0;

  self->_unknownItemRecordIDs = 0;
  self->_updatedShares = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportRecordsWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  NSCloudKitMirroringImportRequest *request;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
    request = self->super._request;
  else
    request = 0;
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p - %@>"), v5, self, request);
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  NSManagedObjectContext *v8;
  NSCloudKitMirroringImportRequest *request;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[7];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator]((uint64_t)a4);
  if (self
    && (request = self->super._request) != 0
    && ((-[CKSchedulerActivity shouldDefer](request->super._schedulerActivity, "shouldDefer") & 1) != 0
     || request->super._deferredByBackgroundTimeout))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D68];
      v15[0] = CFSTR("The request was aborted because it was deferred by the system.");
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = -[PFCloudKitImportRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:](self, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", self->super._request, objc_msgSend(a3, "identifier"), 0, 0, objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v11));
      (*((void (**)(id, id))a5 + 2))(a5, v12);

    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke;
    v13[3] = &unk_1E1EDD790;
    v13[4] = v8;
    v13[5] = self;
    v13[6] = a3;
    -[NSManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v13);
    -[PFCloudKitImportRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:](self, "executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:", v8, a5);
  }

}

void __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke(uint64_t a1)
{
  NSManagedObject *v2;
  NSManagedObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKImportOperation entityPath](), *(_QWORD *)(a1 + 32));
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(_QWORD *)(v4 + 32);
  else
    v5 = 0;
  -[NSManagedObject setOperationUUID:](v2, "setOperationUUID:", v5);
  -[NSManagedObject setImportDate:](v3, "setImportDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  objc_msgSend(*(id *)(a1 + 32), "assignObject:toPersistentStore:", v3, *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "save:", &v14) & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to save import operation: %@");
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v14);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Failed to save import operation: %@", buf, 0xCu);
    }
  }
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  NSManagedObjectContext *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[9];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  unsigned __int8 v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[4];
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = &v55;
  v57 = 0x3052000000;
  v58 = __Block_byref_object_copy__44;
  v59 = __Block_byref_object_dispose__44;
  v60 = 0;
  v54 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v5 = 0;
      WeakRetained = 0;
    }
    v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    -[NSManagedObjectContext setTransactionAuthor:](v6, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.import"));
    v7 = objc_msgSend(*(id *)(a1 + 40), "applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:", v2, v6, *(_QWORD *)(a1 + 32), &v54, v56 + 5);
    *((_BYTE *)v51 + 24) = v7;
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (v8 && *(_BYTE *)(v8 + 21))
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D68];
        v10 = *(_QWORD *)(a1 + 40);
        if (v10)
          v11 = *(void **)(v10 + 16);
        else
          v11 = 0;
        v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v11, "requestIdentifier"));
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v13 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v12);
        v14 = *(_QWORD **)(a1 + 40);
        if (v14)
          v15 = v14[2];
        else
          v15 = 0;
        v16 = objc_msgSend(v14, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v15, objc_msgSend(v2, "identifier"), 0, 0, v13);
      }
      else
      {
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2;
        v49[3] = &unk_1E1EDD6B8;
        v49[4] = v2;
        v49[5] = v6;
        v49[6] = *(_QWORD *)(a1 + 40);
        v49[7] = &v55;
        v49[8] = &v50;
        v28 = -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v49);
        if (*((_BYTE *)v51 + 24))
        {
          v29 = (void *)MEMORY[0x18D76B4E4](v28);
          if ((unint64_t)__ckLoggingOverride >= 3)
            v30 = 3;
          else
            v30 = __ckLoggingOverride;
          v31 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished importing changes for request: %@"));
          _NSCoreDataLog(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke");
          objc_autoreleasePoolPop(v29);
        }
        if (!v54)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "count"))
          {
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v41 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
            if (v42)
            {
              v43 = *(_QWORD *)v46;
              while (2)
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v46 != v43)
                    objc_enumerationMutation(v41);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "madeChanges"))
                  {
                    v54 = 1;
                    goto LABEL_26;
                  }
                }
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
                if (v42)
                  continue;
                break;
              }
            }
          }
        }
LABEL_26:
        v38 = *(_QWORD **)(a1 + 40);
        if (v38)
          v39 = v38[2];
        else
          v39 = 0;
        v40 = objc_msgSend(v2, "identifier");
        v16 = objc_msgSend(v38, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v39, v40, *((unsigned __int8 *)v51 + 24), v54, v56[5]);
      }
    }
    else
    {
      v24 = (id)v56[5];
      v25 = *(_QWORD **)(a1 + 40);
      if (v25)
        v26 = v25[2];
      else
        v26 = 0;
      v27 = objc_msgSend(v2, "identifier");
      v16 = objc_msgSend(v25, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v26, v27, 0, 0, v56[5]);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v16;

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D68];
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      v19 = *(void **)(v18 + 16);
    else
      v19 = 0;
    v62[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v19, "requestIdentifier"));
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v21 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v20);
    v22 = *(_QWORD **)(a1 + 40);
    if (v22)
      v23 = v22[2];
    else
      v23 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v22, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v23, objc_msgSend(0, "identifier"), 0, 0, v21);
  }

  v56[5] = 0;
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v55, 8);
}

void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    v30[0] = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v30) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18D76B4E4]();
      v3 = __ckLoggingOverride;
      v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v3 != 0, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }
  }
  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:](*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v11 = (void *)MEMORY[0x18D76B4E4]();
    v12 = __ckLoggingOverride;
    v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch import operation with identifier '%@': %@"));
    _NSCoreDataLog(v12 != 0, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
    objc_autoreleasePoolPop(v11);
LABEL_10:
    v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "commitMetadataChangesWithContext:forStore:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v21 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v22 = __ckLoggingOverride;
    v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save changes from import: %@"));
    _NSCoreDataLog(v22 != 0, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
    objc_autoreleasePoolPop(v21);
  }
}

- (BOOL)checkForActiveImportOperationInStore:(void *)a3 inManagedObjectContext:(uint64_t *)a4 error:
{
  unint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v20 = 0;
  v6 = (unint64_t)+[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKImportOperation, *(_QWORD *)(a1 + 32), a2, a3, (uint64_t)&v20);
  v7 = v20;
  v8 = v6 != 0;
  if (v6 | v20)
  {
    if (v6)
      return v8;
    if (v20)
      goto LABEL_5;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB28A8];
    v25 = *MEMORY[0x1E0CB2D68];
    v26[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request '%@' was cancelled because it conflicted with another active import operation."), *(_QWORD *)(a1 + 16));
    v7 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
    v20 = v7;
    if (v7)
    {
LABEL_5:
      if (a4)
        *a4 = v7;
      return v8;
    }
  }
  v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
  v18 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
    v23 = 1024;
    v24 = 866;
    _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return v8;
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD v38[10];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3052000000;
  v42 = __Block_byref_object_copy__44;
  v43 = __Block_byref_object_dispose__44;
  v44 = 0;
  if (-[NSMutableArray count](self->_updatedRecords, "count")
    || -[NSMutableDictionary count](self->_recordTypeToDeletedRecordID, "count")
    || -[NSMutableArray count](self->_unknownItemRecordIDs, "count")
    || -[NSMutableDictionary count](self->_updatedShares, "count"))
  {
    if (a5 && *((_BYTE *)a5 + 21))
    {
      *((_BYTE *)v50 + 24) = 0;
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0CB2D68];
      v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), -[NSCloudKitMirroringRequest requestIdentifier](self->super._request, "requestIdentifier"));
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v14);
      v40[5] = v15;
    }
    else
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v38[3] = &unk_1E1EDD858;
      v38[4] = a3;
      v38[5] = a4;
      v38[6] = self;
      v38[7] = &v39;
      v38[8] = &v45;
      v38[9] = &v49;
      v16 = objc_msgSend(a4, "performBlockAndWait:", v38);
      if (*((_BYTE *)v50 + 24))
      {
        v17 = (void *)MEMORY[0x18D76B4E4](v16);
        v18 = __ckLoggingOverride;
        v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished importing applying changes for request: %@"));
        if (v18 >= 3)
          v26 = 3;
        else
          v26 = v18;
        _NSCoreDataLog(v26, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]");
        objc_autoreleasePoolPop(v17);
      }
    }
  }
  else
  {
    *((_BYTE *)v50 + 24) = 1;
    *((_BYTE *)v46 + 24) = 0;
  }
  *a6 = *((_BYTE *)v46 + 24);
  if (!*((_BYTE *)v50 + 24))
  {
    v29 = (id)v40[5];
    if (v29)
    {
      if (a7)
        *a7 = v29;
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
        v57 = 1024;
        v58 = 536;
        _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v40[5] = 0;
  v27 = *((_BYTE *)v50 + 24);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  return v27;
}

void __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke(uint64_t a1)
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
  PFCloudKitSerializer *v11;
  uint64_t v12;
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
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  char v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSManagedObject *v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  id obj;
  PFCloudKitMetadataCache *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  uint64_t v147;
  uint64_t v148;
  _BYTE v149[128];
  _BYTE buf[12];
  __int16 v151;
  void *v152;
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    *(_QWORD *)buf = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18D76B4E4]();
      v3 = __ckLoggingOverride;
      v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on managedObjectContext: %@"));
      _NSCoreDataLog(v3 != 0, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
      objc_autoreleasePoolPop(v2);
    }
  }
  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:](*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v131 = 0;
    v133 = 0;
    v63 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    goto LABEL_49;
  }
  v133 = objc_alloc_init(PFCloudKitMetadataCache);
  v11 = [PFCloudKitSerializer alloc];
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 && (v13 = *(_QWORD *)(v12 + 8)) != 0)
    v14 = *(_QWORD *)(v13 + 24);
  else
    v14 = 0;
  v15 = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:](v11, "initWithMirroringOptions:metadataCache:recordNamePrefix:", v14, v133, 0);
  v131 = (void *)v15;
  if (v15)
    objc_storeWeak((id *)(v15 + 32), *(id *)(a1 + 48));
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 8);
  if (v18)
    v19 = *(_QWORD *)(v18 + 24);
  else
    v19 = 0;
  if (!-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]((id *)&v133->super.isa, MEMORY[0x1E0C9AA60], v17, *(void **)(a1 + 32), *(void **)(a1 + 40), v19, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))goto LABEL_48;
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v20 = *(void **)(*(_QWORD *)(a1 + 48) + 112);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v143;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v143 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x18D76B4E4]();
        v26 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)v133, v24);
        if (v26)
        {
          v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v26, "entityId"), "unsignedLongValue")), "entityDescription");
          if (v27)
          {
            v28 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, v27);
            v29 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "objectForKey:", v28);
            if (!v29)
            {
              v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "setObject:forKey:", v29, v28);
            }
            objc_msgSend(v29, "addObject:", v24);

          }
          else
          {
            v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@");
            _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v24);
            v37 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              v151 = 2112;
              v152 = v26;
              _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@", buf, 0x16u);
            }
          }
        }
        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
    }
    while (v21);
  }
  v38 = (void *)MEMORY[0x18D76B4E4]();
  v39 = __ckLoggingOverride;
  v40 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Importing updated records:\n%@\nDeleted RecordIDs:\n%@"));
  v47 = v39 >= 9 ? 9 : v39;
  v130 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72);
  _NSCoreDataLog(v47, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
  objc_autoreleasePoolPop(v38);
  if (!-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]((uint64_t)v131, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "entityNameToAttributesToUpdate"), objc_msgSend(*(id *)(a1 + 48), "entityNameToRelationshipsToUpdate"), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
LABEL_48:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v64 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    goto LABEL_49;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "updateMetadataForAccumulatedChangesInContext:inStore:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "hasChanges");
    if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
    {
      *(_QWORD *)buf = 0;
      if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
      {
        v48 = (void *)MEMORY[0x18D76B4E4]();
        v49 = __ckLoggingOverride;
        v50 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on managedObjectContext: %@"));
        _NSCoreDataLog(v49 != 0, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v48);
      }
    }
    v57 = +[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKImportOperation, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v57)
    {
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v58 = *(void **)(*(_QWORD *)(a1 + 48) + 96);
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v138, v149, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v139;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v139 != v60)
              objc_enumerationMutation(v58);
            +[NSCKImportPendingRelationship insertPendingRelationshipForFailedRelationship:forOperation:inStore:withManagedObjectContext:]((uint64_t)NSCKImportPendingRelationship, *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j), (uint64_t)v57, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
          }
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v138, v149, 16);
        }
        while (v59);
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) & 1) == 0)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v115 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          v116 = __ckLoggingOverride;
          v117 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save applied changes from import: %@"));
          _NSCoreDataLog(v116 != 0, v117, v118, v119, v120, v121, v122, v123, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
          objc_autoreleasePoolPop(v115);
        }
        goto LABEL_89;
      }
      v62 = 1;
    }
    else
    {
      v104 = (void *)MEMORY[0x18D76B4E4]();
      v105 = __ckLoggingOverride;
      v106 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch import operation with identifier '%@': %@"));
      v128 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32);
      v129 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      _NSCoreDataLog(v105 != 0, v106, v107, v108, v109, v110, v111, v112, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
      objc_autoreleasePoolPop(v104);
      v113 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v113)
      {
        v114 = v113;
        v62 = 0;
      }
      else
      {
        v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v147 = *MEMORY[0x1E0CB2D68];
        v125 = *(_QWORD *)(a1 + 48);
        if (v125)
          v125 = *(_QWORD *)(v125 + 16);
        v148 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request '%@' was cancelled because it conflicted with another active import operation."), v125, 425, v128, v129, v130);
        v126 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
        v127 = objc_msgSend(v124, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v126);
        v62 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v127;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v62;
  }
  else
  {
    v103 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
LABEL_89:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128) = 0;
LABEL_49:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 48) + 120);
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v135;
LABEL_52:
      v67 = 0;
      while (1)
      {
        if (*(_QWORD *)v135 != v66)
          objc_enumerationMutation(obj);
        v68 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v67);
        v69 = (void *)MEMORY[0x18D76B4E4]();
        v70 = *(_QWORD *)(a1 + 48);
        if (v70 && (v71 = *(_QWORD *)(v70 + 8)) != 0)
          v72 = *(void **)(v71 + 24);
        else
          v72 = 0;
        v73 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v68, objc_msgSend(v72, "databaseScope"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        if (v73)
        {
          v74 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 120), "objectForKey:", v68);
          v75 = (void *)MEMORY[0x18D76B4E4]();
          v76 = __ckLoggingOverride;
          v77 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Importing updated share: %@"));
          v84 = v76 >= 0x10 ? 16 : v76;
          _NSCoreDataLog(v84, v77, v78, v79, v80, v81, v82, v83, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
          objc_autoreleasePoolPop(v75);
          v85 = *(_QWORD *)(a1 + 48);
          if (v85
            && (v86 = *(_QWORD *)(v85 + 8)) != 0
            && (v87 = *(_QWORD *)(v86 + 24)) != 0
            && (v88 = *(_QWORD *)(v87 + 136)) != 0
            && (v89 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v88, v74, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))) != 0)
          {
            -[NSManagedObject setEncodedShareData:](v73, "setEncodedShareData:", v89);
            -[NSManagedObject setNeedsShareUpdate:](v73, "setNeedsShareUpdate:", 0);
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v91 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
            v92 = __ckLoggingOverride;
            v93 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to encode an updated share: %@\n%@\n%@\n%@"));
            _NSCoreDataLog(v92 != 0, v93, v94, v95, v96, v97, v98, v99, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
            objc_autoreleasePoolPop(v91);
            v89 = 0;
          }

        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v90 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        }
        v100 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        objc_autoreleasePoolPop(v69);
        if (!v100)
          break;
        if (v65 == ++v67)
        {
          v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
          v65 = v101;
          if (v101)
            goto LABEL_52;
          break;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      && (objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v102 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
  }
  -[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles](*(_QWORD *)(a1 + 48));

}

- (void)removeDownloadedAssetFiles
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v22 = 0;
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 24), "allValues");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      v7 = *MEMORY[0x1E0CB28A8];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), &v22) & 1) == 0
            && (!objc_msgSend((id)objc_msgSend(v22, "domain"), "isEqualToString:", v7)
             || objc_msgSend(v22, "code") != 4))
          {
            v9 = (void *)MEMORY[0x18D76B4E4]();
            v10 = __ckLoggingOverride != 0;
            v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to delete processed asset file: %@\n%@"));
            _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles]");
            objc_autoreleasePoolPop(v9);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  char v7;
  _BOOL4 v8;
  void *v9;
  _BOOL8 v10;
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
  uint64_t v24;
  NSObject *v25;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  if (!+[NSCKImportOperation purgeFinishedImportOperationsInStore:withManagedObjectContext:error:]((uint64_t)NSCKImportOperation, (uint64_t)a4, a3, (uint64_t)&v27))
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    v10 = __ckLoggingOverride != 0;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to purge mirrored relationships during import: %@"));
LABEL_6:
    _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:]");
    objc_autoreleasePoolPop(v9);
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v8) = 0;
        *a5 = v27;
        return v8;
      }
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      v25 = __pflogFaultLog;
      v8 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v8)
        return v8;
      *(_DWORD *)buf = 136315394;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
      v30 = 1024;
      v31 = 568;
      _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v8) = 0;
    return v8;
  }
  v7 = objc_msgSend(a3, "save:", &v27);
  LOBYTE(v8) = 1;
  if ((v7 & 1) == 0 && v27)
  {
    v9 = (void *)MEMORY[0x18D76B4E4](1);
    v10 = __ckLoggingOverride != 0;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save changes from import: %@"));
    goto LABEL_6;
  }
  return v8;
}

- (void)addUpdatedRecord:(id)a3
{
  PFCloudKitImporterOptions *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSURL *assetStorageURL;
  NSURL *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_encounteredErrors, "count"))
  {
    v5 = self->super._options;
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_msgSend(a3, "recordType");
    if (objc_msgSend(v7, "isEqualToString:", getCloudKitCKRecordTypeShare[0]()))
    {
      -[NSMutableDictionary setObject:forKey:](self->_updatedShares, "setObject:forKey:", a3, objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    }
    else
    {
      -[NSMutableArray addObject:](self->_updatedRecords, "addObject:", a3);
      -[NSMutableArray addObject:](self->_allRecordIDs, "addObject:", objc_msgSend(a3, "recordID"));
    }
    self->_totalOperationBytes += objc_msgSend(a3, "size");
    self->_currentOperationBytes += objc_msgSend(a3, "size");
    ++self->_countUpdatedRecords;
    -[PFCloudKitSizeMetric addByteSize:]((uint64_t)self->_fetchedRecordBytesMetric, objc_msgSend(a3, "size"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = +[PFCloudKitSerializer assetsOnRecord:withOptions:]((uint64_t)PFCloudKitSerializer, a3);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
          if (v5)
            assetStorageURL = v5->_assetStorageURL;
          else
            assetStorageURL = 0;
          v14 = -[NSURL URLByAppendingPathComponent:isDirectory:](assetStorageURL, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0);
          v38 = 0;
          if (objc_msgSend(v6, "moveItemAtURL:toURL:error:", objc_msgSend(v12, "fileURL"), v14, &v38))
          {
            -[NSMutableDictionary setObject:forKey:](self->_assetPathToSafeSaveURL, "setObject:forKey:", v14, objc_msgSend((id)objc_msgSend(v12, "fileURL"), "path"));
            v15 = (void *)objc_msgSend(v6, "attributesOfItemAtPath:error:", -[NSURL path](v14, "path"), &v38);
            if (v15)
            {
              v16 = v15;
              self->_totalOperationBytes += objc_msgSend(v15, "fileSize");
              self->_currentOperationBytes += objc_msgSend(v16, "fileSize");
              -[PFCloudKitSizeMetric addByteSize:]((uint64_t)self->_fetchedAssetBytesMetric, objc_msgSend(v16, "fileSize"));
              goto LABEL_18;
            }
            v27 = MEMORY[0x18D76B4E4]();
            v28 = __ckLoggingOverride != 0;
            v29 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to read attributes of asset file at URL: %@\n%@\n%@\n%@"));
            _NSCoreDataLog(v28, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            v26 = (void *)v27;
          }
          else
          {
            v17 = MEMORY[0x18D76B4E4]();
            v18 = __ckLoggingOverride != 0;
            v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to copy asset to URL: %@\n%@\n%@\n%@"));
            _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            v26 = (void *)v17;
          }
          objc_autoreleasePoolPop(v26);
          -[NSMutableArray addObject:](self->_encounteredErrors, "addObject:", v38);
LABEL_18:
          ++v11;
        }
        while (v9 != v11);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v9 = v36;
      }
      while (v36);
    }

    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)self, 0);
  }
}

- (void)checkAndApplyChangesIfNeeded:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];

  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = v4 ? *(void **)(v4 + 24) : 0;
    if (objc_msgSend((id)objc_msgSend(v5, "operationMemoryThresholdBytes"), "unsignedIntegerValue")
      && ((v7 = *(_QWORD *)(a1 + 8)) == 0 ? (v8 = 0) : (v8 = *(void **)(v7 + 24)),
          v6 = *(_QWORD *)(a1 + 128),
          v6 >= objc_msgSend((id)objc_msgSend(v8, "operationMemoryThresholdBytes"), "unsignedIntegerValue"))
      || *(_QWORD *)(a1 + 128) > 0xA00000uLL
      || (v9 = objc_msgSend(*(id *)(a1 + 80), "count"), a2)
      || v9 >= 0x1F5)
    {
      v10 = *(_QWORD *)(a1 + 8);
      if (v10)
        v11 = *(NSObject **)(v10 + 32);
      else
        v11 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke;
      v12[3] = &unk_1E1EDD430;
      v12[4] = a1;
      v12[5] = a2;
      dispatch_sync(v11, v12);
    }
  }
}

- (void)addDeletedRecordID:(uint64_t)a3 ofType:
{
  id v6;

  if (a1 && !objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 72), "objectForKey:", a3);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v6, a3);
    }
    objc_msgSend(v6, "addObject:", a2);

    objc_msgSend(*(id *)(a1 + 80), "addObject:", a2);
    ++*(_QWORD *)(a1 + 144);
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:](a1, 0);
  }
}

- (void)fetchOperationFinishedWithError:(uint64_t)a3 completion:
{
  NSObject *isa;
  _QWORD block[7];

  if (a1)
  {
    isa = *(NSObject **)(a1 + 8);
    if (isa)
      isa = isa[4].isa;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke;
    block[3] = &unk_1E1EDF3D8;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(isa, block);
  }
}

id __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke(uint64_t *a1)
{
  id v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t *v51;
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  uint64_t v76;
  _BYTE v77[128];
  const __CFString *v78;
  uint64_t v79;
  _BYTE buf[24];
  void *v81;
  _QWORD *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (_QWORD *)a1[4];
  if (v3)
    v3 = (_QWORD *)v3[1];
  v4 = v3;
  v6 = a1[4];
  v5 = (void *)a1[5];
  if (!v5)
  {
    if (!objc_msgSend(*(id *)(v6 + 88), "count"))
    {
      if (v4)
        v13 = (void *)v4[3];
      else
        v13 = 0;
      if (objc_msgSend(v13, "operationMemoryThresholdBytes"))
      {
        v14 = v4 ? (void *)v4[3] : 0;
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v14, "operationMemoryThresholdBytes"), "unsignedLongLongValue") < *(_QWORD *)(a1[4] + 128))
        {
          v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@");
          v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1[4] + 128));
          _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16);
          v23 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1[4] + 128));
            if (v4)
              v25 = v4[3];
            else
              v25 = 0;
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v25;
            _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@", buf, 0x16u);
          }
        }
      }
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1[4] + 88), "count") == 1)
    {
      v12 = objc_msgSend(*(id *)(a1[4] + 88), "lastObject");
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v78 = CFSTR("NSDetailedErrors");
      v79 = *(_QWORD *)(a1[4] + 88);
      v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v12 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134404, v27);
    }
    v5 = (void *)v12;
LABEL_26:
    v11 = 0;
    goto LABEL_27;
  }
  if (!v6)
    goto LABEL_26;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  LOBYTE(v74) = 0;
  v7 = (void *)objc_msgSend(v5, "domain");
  if (objc_msgSend(v7, "isEqualToString:", getCloudKitCKErrorDomain[0]())
    && objc_msgSend(v5, "code") == 2)
  {
    v8 = (void *)objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_msgSend(v8, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey[0]());
    *((_BYTE *)v72 + 24) = 1;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke;
    v81 = &unk_1E1EE1278;
    v82 = (_QWORD *)v6;
    v83 = &v71;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", buf);
  }
  v10 = *((unsigned __int8 *)v72 + 24);
  _Block_object_dispose(&v71, 8);
  if (!v10)
  {
    v11 = 0;
    v5 = (void *)a1[5];
    goto LABEL_27;
  }
LABEL_9:
  v5 = 0;
  v11 = 1;
LABEL_27:
  if (v4 && (v28 = v4[3]) != 0)
    v29 = *(_QWORD *)(v28 + 72);
  else
    v29 = 0;
  -[PFCloudKitMetricsClient logMetric:](v29, *(void **)(a1[4] + 64));
  if (v4 && (v30 = v4[3]) != 0)
    v31 = *(_QWORD *)(v30 + 72);
  else
    v31 = 0;
  -[PFCloudKitMetricsClient logMetric:](v31, *(void **)(a1[4] + 56));
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v32 = *(void **)(a1[4] + 104);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v68;
LABEL_35:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v34)
        objc_enumerationMutation(v32);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v35), "madeChanges") & 1) != 0)
        break;
      if (v33 == ++v35)
      {
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        if (v33)
          goto LABEL_35;
        goto LABEL_41;
      }
    }
    v36 = 1;
    if (!v11)
      goto LABEL_42;
LABEL_49:
    v51 = (uint64_t *)a1[4];
    if (v51)
    {
      v71 = 0;
      v72 = &v71;
      v73 = 0x3052000000;
      v74 = __Block_byref_object_copy__44;
      v75 = __Block_byref_object_dispose__44;
      v76 = 0;
      v52 = (_QWORD *)v51[1];
      if (v52)
        v52 = (_QWORD *)v52[2];
      v53 = v52;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke;
      v81 = &unk_1E1EDD138;
      v82 = v53;
      v83 = v51;
      v84 = &v71;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v53, (uint64_t)buf);

      v54 = (void *)v72[5];
      _Block_object_dispose(&v71, 8);
      if (v54)
      {
        if (!objc_msgSend(v54, "success")
          || ((objc_msgSend(v54, "madeChanges") | v36 ^ 1) & 1) != 0)
        {
          goto LABEL_66;
        }

        v55 = (_QWORD *)a1[4];
        if (v55)
        {
          v56 = v55[2];
          if (!v4)
            goto LABEL_80;
        }
        else
        {
          v56 = 0;
          if (!v4)
            goto LABEL_80;
        }
        v57 = v4[2];
        if (v57)
        {
          v58 = *(_QWORD *)(v57 + 48);
LABEL_59:
          v59 = objc_msgSend(v55, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v56, v58, 1, 1, 0);
LABEL_65:
          v54 = (void *)v59;
LABEL_66:
          v65 = a1[6];
          if (v65)
            (*(void (**)(uint64_t, void *))(v65 + 16))(v65, v54);

          goto LABEL_69;
        }
LABEL_80:
        v58 = 0;
        goto LABEL_59;
      }
      v60 = (_QWORD *)a1[4];
      if (v60)
      {
        v62 = v60[1];
        v61 = v60[2];
        if (v62)
        {
          v63 = *(_QWORD *)(v62 + 16);
          if (v63)
          {
            v64 = *(_QWORD *)(v63 + 48);
LABEL_64:
            v59 = objc_msgSend(v60, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v61, v64, 0, v36, v5);
            goto LABEL_65;
          }
        }
      }
      else
      {
        v61 = 0;
      }
    }
    else
    {
      v61 = 0;
      v60 = 0;
    }
    v64 = 0;
    goto LABEL_64;
  }
LABEL_41:
  v36 = 0;
  if (v11)
    goto LABEL_49;
LABEL_42:
  v37 = (void *)MEMORY[0x18D76B4E4]();
  v38 = __ckLoggingOverride;
  v39 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Fetch finished with error:\n%@"));
  _NSCoreDataLog(v38 != 0, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"-[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]_block_invoke");
  objc_autoreleasePoolPop(v37);
  if (!a1[6])
  {
LABEL_69:
    v50 = 0;
    goto LABEL_70;
  }
  v46 = (_QWORD *)a1[4];
  if (v46)
  {
    v47 = v46[2];
    if (!v4)
    {
LABEL_76:
      v49 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v47 = 0;
    if (!v4)
      goto LABEL_76;
  }
  v48 = v4[2];
  if (!v48)
    goto LABEL_76;
  v49 = *(_QWORD *)(v48 + 48);
LABEL_47:
  v50 = (void *)objc_msgSend(v46, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v47, v49, 0, v36, v5);
  (*(void (**)(void))(a1[6] + 16))();
LABEL_70:
  -[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles](a1[4]);

  objc_msgSend(v2, "drain");
  return 0;
}

uint64_t __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2;
  v2[3] = &unk_1E1EDD430;
  v3 = *(_OWORD *)(a1 + 32);
  return +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v2);
}

id __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2(uint64_t a1)
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
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  id result;
  _QWORD v15[6];

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Applying accumulated changes at change token: %@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke_2");
  objc_autoreleasePoolPop(v2);
  v11 = *(_QWORD **)(a1 + 32);
  if (v11)
  {
    v11 = (_QWORD *)v11[1];
    if (v11)
      v11 = (_QWORD *)v11[2];
  }
  v12 = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3;
  v15[3] = &unk_1E1EDD430;
  v13 = *(_QWORD *)(a1 + 32);
  v15[4] = v12;
  v15[5] = v13;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v12, (uint64_t)v15);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = result;
  return result;
}

void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  NSManagedObjectContext *v6;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[6];
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[24];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v5 = 0;
      WeakRetained = 0;
    }
    v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    -[NSManagedObjectContext setTransactionAuthor:](v6, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.import"));
    v48 = 0;
    if (objc_msgSend(*(id *)(a1 + 40), "applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:", v2, v6, *(_QWORD *)(a1 + 32), &v48, &v49))
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4;
      v47[3] = &unk_1E1EDD430;
      v7 = *(_QWORD *)(a1 + 40);
      v47[4] = v6;
      v47[5] = v7;
      v8 = (void *)MEMORY[0x18D76B4E4](-[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v47));
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v9 = 16;
      else
        v9 = __ckLoggingOverride;
      v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Successfully applied incremental changes during request: %@"));
      _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      objc_autoreleasePoolPop(v8);
      v17 = *(_QWORD **)(a1 + 40);
      if (v17)
        v18 = v17[2];
      else
        v18 = 0;
      v19 = *(_QWORD *)(a1 + 32);
      if (v19)
        v20 = *(_QWORD *)(v19 + 48);
      else
        v20 = 0;
      v21 = (void *)objc_msgSend(v17, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v18, v20, 1, v48, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "addObject:", v21);
      if ((objc_msgSend(v21, "success") & 1) == 0)
      {
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Should tear down here and stop subsequent attempts to import from happening.");
        _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, v46);
        v29 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Should tear down here and stop subsequent attempts to import from happening.", buf, 2u);
        }
      }
    }
    else
    {
      v36 = (void *)MEMORY[0x18D76B4E4]();
      v37 = __ckLoggingOverride != 0;
      v38 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to incrementally apply changes during request: %@\n%@"));
      _NSCoreDataLog(v37, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      objc_autoreleasePoolPop(v36);
      v45 = *(_QWORD *)(a1 + 40);
      if (v45)
        objc_msgSend(*(id *)(v45 + 88), "addObject:", v49);
      v21 = 0;
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D68];
    v31 = *(_QWORD *)(a1 + 40);
    if (v31)
      v32 = *(void **)(v31 + 16);
    else
      v32 = 0;
    v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v32, "requestIdentifier"));
    v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v34 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v33);
    v49 = v34;
    v35 = *(_QWORD *)(a1 + 40);
    if (v35)
      objc_msgSend(*(id *)(v35 + 88), "addObject:", v34);
  }

}

void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Incremental import left uncommitted changes in the managed object context: %@");
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      v9 = *(_QWORD *)(v9 + 16);
    _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v9);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        v11 = *(_QWORD *)(v11 + 16);
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: Incremental import left uncommitted changes in the managed object context: %@", buf, 0xCu);
    }
  }
}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  return -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a3, a4, a5, a6, a7);
}

void __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  getCloudKitCKRecordIDClass[0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v8, "isEqualToString:", getCloudKitCKErrorDomain[0]())
      && objc_msgSend(a3, "code") == 11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", a2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", a2);
      return;
    }
  }
  else
  {
    getCloudKitCKRecordZoneIDClass[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, a2);
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = a2;
        v19 = 2112;
        v20 = a3;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@", buf, 0x16u);
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
}

- (void)cloudKitSerializer:(id)a3 failedToUpdateRelationship:(id)a4 withError:(id)a5
{
  -[NSMutableArray addObject:](self->_failedRelationships, "addObject:", a4);
}

- (id)cloudKitSerializer:(id)a3 safeSaveURLForAsset:(id)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_assetPathToSafeSaveURL, "objectForKey:", objc_msgSend((id)objc_msgSend(a4, "fileURL", a3), "path"));
}

- (id)entityNameToAttributesToUpdate
{
  return 0;
}

- (id)entityNameToRelationshipsToUpdate
{
  return 0;
}

@end
