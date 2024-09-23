@implementation PFCloudKitCKQueryBackedImportWorkItem

- (id)initForRecordType:(id)a3 withOptions:(id)a4 request:(id)a5
{
  PFCloudKitCKQueryBackedImportWorkItem *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  v7 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v10, sel_initWithOptions_request_, a4, a5);
  if (v7)
  {
    v7->_recordType = (NSString *)a3;
    if (a4)
      v8 = (void *)*((_QWORD *)a4 + 3);
    else
      v8 = 0;
    v7->_zoneIDToQuery = (CKRecordZoneID *)+[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(v8, "databaseScope"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_maxModificationDate = 0;
  self->_queryCursor = 0;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  -[PFCloudKitImportRecordsWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  NSDate *maxModificationDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", -[PFCloudKitImportRecordsWorkItem description](&v7, sel_description));
  v4 = v3;
  maxModificationDate = self->_maxModificationDate;
  if (!maxModificationDate)
    maxModificationDate = (NSDate *)CFSTR("nil");
  objc_msgSend(v3, "appendFormat:", CFSTR(" { %@:%@:%@ }"), self->_zoneIDToQuery, self->_recordType, maxModificationDate);
  return v4;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  PFCloudKitImporterOptions *options;
  PFCloudKitStoreMonitor *monitor;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  PFCloudKitImporterOptions *v19;
  CKDatabase *database;
  NSCloudKitMirroringResult *v21;
  NSCloudKitMirroringImportRequest *request;
  PFCloudKitImporterOptions *v23;
  PFCloudKitStoreMonitor *v24;
  NSString *storeIdentifier;
  NSCloudKitMirroringResult *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[10];
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
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v21 = [NSCloudKitMirroringResult alloc];
    request = 0;
    v9 = 0;
    goto LABEL_22;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x3052000000;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  options = self->super.super._options;
  if (options)
    monitor = options->_monitor;
  else
    monitor = 0;
  v8 = MEMORY[0x1E0C809B0];
  location[0] = (id)MEMORY[0x1E0C809B0];
  location[1] = (id)3221225472;
  location[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke;
  location[3] = &unk_1E1EDD858;
  location[4] = monitor;
  location[5] = a3;
  location[6] = self;
  location[7] = &v32;
  location[8] = &v38;
  location[9] = &v42;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)monitor, (uint64_t)location);
  if (*((_BYTE *)v39 + 24))
  {
    v9 = 0;
  }
  else
  {
    v9 = (id)v43[5];
    if (!v9)
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        v50 = 1024;
        v51 = 190;
        _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    v33[5] = 0;
  }

  v43[5] = 0;
  v18 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  if (!v18)
  {
    v21 = [NSCloudKitMirroringResult alloc];
    v23 = self->super.super._options;
    request = self->super.super._request;
    if (v23)
    {
      v24 = v23->_monitor;
      if (v24)
      {
        storeIdentifier = v24->_storeIdentifier;
LABEL_19:
        v26 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v21, "initWithRequest:storeIdentifier:success:madeChanges:error:", request, storeIdentifier, 0, 0, v9);
        (*((void (**)(id, NSCloudKitMirroringResult *))a4 + 2))(a4, v26);

        v18 = 0;
        goto LABEL_20;
      }
    }
LABEL_22:
    storeIdentifier = 0;
    goto LABEL_19;
  }
  objc_initWeak(location, self);
  if (-[NSCloudKitMirroringRequest options](self->super.super._request, "options"))
    -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)-[NSCloudKitMirroringRequest options](self->super.super._request, "options"), v18);
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
  v29[3] = &unk_1E1EDD808;
  objc_copyWeak(&v30, location);
  objc_msgSend(v18, "setRecordMatchedBlock:", v29);
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
  v27[3] = &unk_1E1EDD830;
  objc_copyWeak(&v28, location);
  v27[4] = a4;
  objc_msgSend(v18, "setQueryCompletionBlock:", v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
  v19 = self->super.super._options;
  if (v19)
    database = v19->_database;
  else
    database = 0;
  -[CKDatabase addOperation:](database, "addOperation:", v18);
LABEL_20:

}

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v5;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "addUpdatedRecord:", a3);
      WeakRetained = v5;
    }

  }
}

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *WeakRetained;
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
  void *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v27 = WeakRetained;
    v8 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v9 = 16;
    else
      v9 = __ckLoggingOverride;
    v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Finished with cursor: %@\n%@"));
    _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
    objc_autoreleasePoolPop(v8);
    if (a3)
    {
      v17 = (void *)objc_msgSend(a3, "domain");
      if (!objc_msgSend(v17, "isEqualToString:", getCloudKitCKErrorDomain[0]())
        || objc_msgSend(a3, "code") != 11)
      {
        goto LABEL_12;
      }
      v18 = (void *)MEMORY[0x18D76B4E4]();
      v19 = __ckLoggingOverride != 0;
      v20 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed due to querying for an unknown record type (not fatal, schema needs to be initialized): %@"));
      _NSCoreDataLog(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
      objc_autoreleasePoolPop(v18);
    }
    else if (a2)
    {
      a3 = 0;
      v27[21] = a2;
LABEL_12:
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v27, (uint64_t)a3, v7);
      WeakRetained = v27;
      goto LABEL_13;
    }
    a3 = 0;
    goto LABEL_12;
  }
LABEL_13:

}

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    else
      WeakRetained = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2;
    v10[3] = &unk_1E1EDD858;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 48);
    v10[5] = v2;
    v10[6] = v5;
    v11 = *(_OWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v5, "performBlockAndWait:", v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0CB28A8];
    v13 = *MEMORY[0x1E0CB2D68];
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      v9 = *(void **)(v8 + 16);
    else
      v9 = 0;
    v14[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v9, "requestIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
  }

}

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSManagedObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSManagedObject *v8;
  NSManagedObject *v9;
  void *v10;
  id v11[6];

  v11[5] = *(id *)MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(v2 + 176), objc_msgSend(v4, "databaseScope", v11[0]), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v11);
  if (v5
    && ((v6 = *(_QWORD *)(a1 + 32)) == 0 ? (v7 = 0) : (v7 = *(_QWORD *)(v6 + 152)),
        v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, v7, v5, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v11), (v9 = v8) != 0))
  {
    v10 = -[NSCKRecordZoneQuery createQueryForUpdatingRecords](v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(objc_alloc((Class)getCloudKitCKQueryOperationClass[0]()), "initWithQuery:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setZoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCursor:", -[NSManagedObject queryCursor](v9, "queryCursor"));

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v11[0];
  }
}

- (void)addUpdatedRecord:(id)a3
{
  PFCloudKitCKQueryBackedImportWorkItem *v4;
  NSDate *maxModificationDate;
  NSDate *v6;
  objc_super v7;

  v4 = self;
  if (self)
    self = (PFCloudKitCKQueryBackedImportWorkItem *)self->super._encounteredErrors;
  if (!-[PFCloudKitCKQueryBackedImportWorkItem count](self, "count"))
  {
    maxModificationDate = v4->_maxModificationDate;
    if (!maxModificationDate)
    {
      v6 = 0;
      goto LABEL_8;
    }
    if (-[NSDate compare:](maxModificationDate, "compare:", objc_msgSend(a3, "modificationDate")) == NSOrderedAscending)
    {
      v6 = v4->_maxModificationDate;
LABEL_8:

      v4->_maxModificationDate = (NSDate *)(id)objc_msgSend(a3, "modificationDate");
    }
  }
  v7.receiver = v4;
  v7.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  -[PFCloudKitImportRecordsWorkItem addUpdatedRecord:](&v7, sel_addUpdatedRecord_, a3);
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  id v12;
  char v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[9];
  objc_super v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25.receiver = self;
  v25.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  v29 = -[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:](&v25, sel_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error_, a3, a4, a5, a6, &v35);
  if (*((_BYTE *)v27 + 24))
  {
    if (!a5 || !*((_BYTE *)a5 + 21))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v24[3] = &unk_1E1EDD6B8;
      v24[4] = self;
      v24[5] = a3;
      v24[6] = a4;
      v24[7] = &v30;
      v24[8] = &v26;
      objc_msgSend(a4, "performBlockAndWait:", v24);
    }
  }
  else
  {
    v12 = (id)v31[5];
  }
  if (!*((_BYTE *)v27 + 24))
  {
    v15 = (id)v31[5];
    if (v15)
    {
      if (a7)
        *a7 = v15;
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        v38 = 1024;
        v39 = 268;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v31[5] = 0;
  v13 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v13;
}

id __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSManagedObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSManagedObject *v8;
  uint64_t v9;
  uint64_t v10;
  id result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(v2 + 176), objc_msgSend(v4, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 152);
  else
    v7 = 0;
  v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, v7, v5, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 160);
  else
    v10 = 0;
  -[NSManagedObject setMostRecentRecordModificationDate:](v8, "setMostRecentRecordModificationDate:", v10);
  result = (id)objc_msgSend(*(id *)(a1 + 48), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  return result;
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  CKRecordZoneID *zoneIDToQuery;
  PFCloudKitImporterOptions *options;
  CKDatabase *database;
  NSManagedObject *v12;
  NSManagedObject *v13;
  NSManagedObject *v14;
  NSManagedObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  objc_super v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options)
    database = options->_database;
  else
    database = 0;
  v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, zoneIDToQuery, -[CKDatabase databaseScope](database, "databaseScope"), (uint64_t)a4, a3, (uint64_t)&v27);
  if (!v12
    || (v13 = v12,
        (v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, (uint64_t)self->_recordType, v12, (uint64_t)a4, a3, (uint64_t)&v27)) == 0)|| (v15 = v14, -[NSManagedObject setQueryCursor:](v14, "setQueryCursor:", self->_queryCursor), -[NSManagedObject setLastFetchDate:](v15, "setLastFetchDate:", -[NSManagedObject lastFetchDate](v13, "lastFetchDate")), v26.receiver = self, v26.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem, !-[PFCloudKitImportRecordsWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:](&v26, sel_updateMetadataForAccumulatedChangesInContext_inStore_error_, a3, a4,
           a5)))
  {
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v16) = 0;
        *a5 = v27;
        return v16;
      }
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v24 = __pflogFaultLog;
      v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v16)
        return v16;
      *(_DWORD *)buf = 136315394;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
      v30 = 1024;
      v31 = 307;
      _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v16) = 0;
    return v16;
  }
  LOBYTE(v16) = 1;
  return v16;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  CKRecordZoneID *zoneIDToQuery;
  PFCloudKitImporterOptions *options;
  CKDatabase *database;
  NSManagedObject *v12;
  NSManagedObject *v13;
  NSManagedObject *v14;
  NSManagedObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options)
    database = options->_database;
  else
    database = 0;
  v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, zoneIDToQuery, -[CKDatabase databaseScope](database, "databaseScope"), (uint64_t)a4, a3, (uint64_t)&v36);
  if (!v12)
    goto LABEL_17;
  v13 = v12;
  -[NSManagedObject setLastFetchDate:](v12, "setLastFetchDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, (uint64_t)self->_recordType, v13, (uint64_t)a4, a3, (uint64_t)&v36);
  if (!v14)
    goto LABEL_17;
  v15 = v14;
  -[NSManagedObject setQueryCursor:](v14, "setQueryCursor:", self->_queryCursor);
  -[NSManagedObject setLastFetchDate:](v15, "setLastFetchDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  -[NSManagedObject setNeedsImport:](v13, "setNeedsImport:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = (void *)-[NSManagedObject queries](v13, "queries");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "queryCursor"))
        {
          -[NSManagedObject setNeedsImport:](v13, "setNeedsImport:", 1);
          goto LABEL_15;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_15:
  v31.receiver = self;
  v31.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  if (!-[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:](&v31, sel_commitMetadataChangesWithContext_forStore_error_, a3, a4, &v36))
  {
LABEL_17:
    if (v36)
    {
      if (a5)
      {
        LOBYTE(v21) = 0;
        *a5 = v36;
        return v21;
      }
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v29 = __pflogFaultLog;
      v21 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v21)
        return v21;
      *(_DWORD *)buf = 136315394;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
      v39 = 1024;
      v40 = 355;
      _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v21) = 0;
    return v21;
  }
  LOBYTE(v21) = 1;
  return v21;
}

@end
