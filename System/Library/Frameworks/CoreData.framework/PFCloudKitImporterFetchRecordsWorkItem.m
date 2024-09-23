@implementation PFCloudKitImporterFetchRecordsWorkItem

- (PFCloudKitImporterFetchRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  PFCloudKitImporterFetchRecordsWorkItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitImporterFetchRecordsWorkItem;
  v4 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v6, sel_initWithOptions_request_, a3, a4);
  if (v4)
  {
    v4->_updatedObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_failedObjectIDsToError = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_operationsToExecute = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_updatedObjectIDs = 0;
  self->_failedObjectIDsToError = 0;

  self->_recordIDToObjectID = 0;
  self->_operationsToExecute = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterFetchRecordsWorkItem;
  -[PFCloudKitImportRecordsWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  NSCloudKitMirroringImportRequest *request;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
    request = self->super.super._request;
  else
    request = 0;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p - %@>"), v5, self, request);
  objc_msgSend(v7, "appendFormat:", CFSTR(" { %@ %@ %@ %@ }"), self->_updatedObjectIDs, self->_failedObjectIDsToError, self->_recordIDToObjectID, self->_operationsToExecute);
  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  PFCloudKitImporterOptions *options;
  PFCloudKitImporterOptions *v6;
  CKDatabase *database;
  _QWORD *p_isa;
  NSCloudKitMirroringImportRequest *request;
  id v10;
  uint64_t v11;
  NSCloudKitMirroringImportRequest *v12;
  unint64_t requestCompletionBlock;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSCloudKitMirroringImportRequest *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  CKDatabase *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  CKDatabase *v42;
  PFCloudKitImporterOptions *v43;
  _QWORD *v44;
  id v45;
  id obj;
  id v48;
  _QWORD v50[6];
  id v51;
  _QWORD v52[4];
  id v53;
  id location;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[12];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (self)
    options = self->super.super._options;
  else
    options = 0;
  v6 = options;
  v43 = v6;
  if (v6)
    database = v6->_database;
  else
    database = 0;
  v42 = database;
  p_isa = &self->super.super.super.isa;
  if (self)
  {
    p_isa = &self->super.super._options->super.isa;
    request = self->super.super._request;
    if (p_isa)
      p_isa = (_QWORD *)p_isa[2];
  }
  else
  {
    request = 0;
  }
  v44 = p_isa;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 1;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3052000000;
  v64 = __Block_byref_object_copy__30;
  v65 = __Block_byref_object_dispose__30;
  v66 = 0;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
  v60[3] = &unk_1E1EE0210;
  v60[4] = v44;
  v60[5] = request;
  v48 = v10;
  v60[6] = v10;
  v60[7] = a3;
  v60[8] = self;
  v60[9] = v45;
  v60[10] = &v61;
  v60[11] = &v67;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v44, (uint64_t)v60);
  if (*((_BYTE *)v68 + 24))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    if (self)
    {
      v12 = self->super.super._request;
      if (v12)
        requestCompletionBlock = (unint64_t)v12[1].super._requestCompletionBlock;
      else
        requestCompletionBlock = 0;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v45, "count") <= requestCompletionBlock)
      {
        if (objc_msgSend(v45, "count"))
          objc_msgSend(v14, "addObject:", v45);
      }
      else
      {
        v15 = 0;
        v16 = 0;
        do
        {
          v17 = objc_msgSend(v45, "count");
          v18 = v16 + requestCompletionBlock;
          v19 = requestCompletionBlock;
          if (v16 + requestCompletionBlock > v17)
            v19 = v15 + objc_msgSend(v45, "count");
          objc_msgSend(v14, "addObject:", objc_msgSend(v45, "subarrayWithRange:", v16, v19));
          v15 -= requestCompletionBlock;
          v16 += requestCompletionBlock;
        }
        while (v18 < objc_msgSend(v45, "count"));
      }
      obj = v14;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    }
    else
    {
      obj = 0;
      v23 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    }
    v24 = v23;
    if (v23)
    {
      v25 = *(_QWORD *)v57;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v26);
          v28 = objc_alloc_init((Class)getCloudKitCKFetchRecordsOperationClass[0]());
          v29 = objc_msgSend(v28, "operationID");
          if (-[NSCloudKitMirroringRequest options](request, "options"))
            -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)-[NSCloudKitMirroringRequest options](request, "options"), v28);
          objc_msgSend(v28, "setRecordIDs:", v27);
          objc_msgSend(v28, "setDesiredKeys:", v48);
          v55[0] = v11;
          v55[1] = 3221225472;
          v55[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5;
          v55[3] = &unk_1E1EE0238;
          v55[4] = request;
          objc_msgSend(v28, "setPerRecordProgressBlock:", v55);
          objc_initWeak(&location, self);
          v52[0] = v11;
          v52[1] = 3221225472;
          v52[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6;
          v52[3] = &unk_1E1EE0260;
          objc_copyWeak(&v53, &location);
          objc_msgSend(v28, "setPerRecordCompletionBlock:", v52);
          v50[0] = v11;
          v50[1] = 3221225472;
          v50[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7;
          v50[3] = &unk_1E1EE0288;
          objc_copyWeak(&v51, &location);
          v50[4] = v29;
          v50[5] = a4;
          objc_msgSend(v28, "setFetchRecordsCompletionBlock:", v50);
          -[NSMutableDictionary setObject:forKey:](self->_operationsToExecute, "setObject:forKey:", v28, v29);

          objc_destroyWeak(&v51);
          objc_destroyWeak(&v53);
          objc_destroyWeak(&location);
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
      }
      while (v24);
    }
    if (-[NSMutableDictionary count](self->_operationsToExecute, "count"))
    {
      if (v43)
        v30 = v43->_database;
      else
        v30 = 0;
      -[CKDatabase addOperation:](v30, "addOperation:", objc_msgSend((id)-[NSMutableDictionary allValues](self->_operationsToExecute, "allValues"), "objectAtIndexedSubscript:", 0));
    }
    else if (a4)
    {
      v31 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 9)
        v32 = 9;
      else
        v32 = __ckLoggingOverride;
      v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Fetch records request did not match any records in the store: %@\n%@"));
      -[NSCloudKitMirroringImportRequest objectIDsToFetch](request, "objectIDsToFetch");
      _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:]");
      objc_autoreleasePoolPop(v31);
      if (v44)
        v40 = v44[6];
      else
        v40 = 0;
      v41 = -[PFCloudKitImporterFetchRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:](self, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", self->super.super._request, v40, 1, 0, 0);
      (*((void (**)(id, id))a4 + 2))(a4, v41);

    }
  }
  else if (a4)
  {
    if (self)
      v20 = self->super.super._request;
    else
      v20 = 0;
    if (v44)
      v21 = v44[6];
    else
      v21 = 0;
    v22 = -[PFCloudKitImporterFetchRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:](self, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v20, v21, 0, 0, v62[5]);
    (*((void (**)(id, id))a4 + 2))(a4, v22);

  }
  v62[5] = 0;

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
    WeakRetained = 0;
  }
  v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entityNameToAttributesToFetch"), "count");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "entityNameToAttributesToFetch");
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
      v17[3] = &unk_1E1EDE780;
      v17[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
    }
    else
    {
      v11 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v5, "configurationName"), (void *)objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectModel"), 1);
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", objc_msgSend(v11, "allObjects"));

    }
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4;
    v13[3] = &unk_1E1EE01E8;
    v13[4] = *(_QWORD *)(a1 + 40);
    v13[5] = v5;
    v12 = *(_OWORD *)(a1 + 72);
    v14 = *(_OWORD *)(a1 + 56);
    v15 = v12;
    v16 = *(_QWORD *)(a1 + 88);
    objc_msgSend((id)v14, "performBlockAndWait:", v13);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D68];
    v19[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"));
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v10);
  }

}

uint64_t __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3;
  v4[3] = &unk_1E1EE01C0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, a2, 1);
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", objc_msgSend(v3, "allObjects"));

}

id __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id result;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(*(id *)(a1 + 32), "objectIDsToFetch"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v3 = v2;
  if (v2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    v5 = result;
    if (result)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)-[NSCKRecordMetadata createRecordID](v8);
          v10 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 168), "setObject:forKey:", v10, v9);
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v9);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        result = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v5 = result;
      }
      while (result);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ '%@': %@ %f"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  _NSCoreDataLog(v3, v4, v6, v7, v8, v9, v10, v11, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:]_block_invoke_5");
  objc_autoreleasePoolPop(v2);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id *WeakRetained;
  id *v8;
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
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v38 = WeakRetained;
    if (a4)
    {
      v9 = (void *)MEMORY[0x18D76B4E4]();
      v10 = __ckLoggingOverride != 0;
      v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ encountered error while fetching record %@\n%@"));
      _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem fetchFinishedForRecord:withID:error:]");
      objc_autoreleasePoolPop(v9);
      v8 = v38;
      if (a3)
      {
        v18 = objc_msgSend(v38[21], "objectForKey:", a3);
        if (v18)
        {
          objc_msgSend(v38[20], "setObject:forKey:", a4, v18);
LABEL_14:
          v8 = v38;
          goto LABEL_15;
        }
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@");
        _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, a3);
        v28 = __pflogFaultLog;
        v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        v8 = v38;
        if (v29)
        {
          *(_DWORD *)buf = 138412546;
          v40 = a3;
          v41 = 2112;
          v42 = a4;
          _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@", buf, 0x16u);
          goto LABEL_14;
        }
      }
    }
    else
    {
      v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"), "hasPrefix:", CFSTR("CD_FAKE_"));
      v8 = v38;
      if ((v19 & 1) == 0)
      {
        v20 = objc_msgSend(v38[21], "objectForKey:", a3);
        if (v20)
        {
          objc_msgSend(v38[19], "addObject:", v20);
        }
        else
        {
          v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@");
          _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, a3);
          v37 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = a3;
            _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@", buf, 0xCu);
          }
        }
        objc_msgSend(v38, "addUpdatedRecord:", a2);
        goto LABEL_14;
      }
    }
  }
LABEL_15:

}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  id *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v30 = WeakRetained;
    v8 = (void *)MEMORY[0x18D76B4E4]();
    v9 = 0x1ECD87000uLL;
    objc_msgSend(v30[22], "removeObjectForKey:", v7);
    if (a3)
    {
      v10 = (void *)objc_msgSend(a3, "domain");
      if (objc_msgSend(v10, "isEqualToString:", getCloudKitCKErrorDomain[0]())
        && objc_msgSend(a3, "code") == 2)
      {
        v29 = v8;
        v11 = (void *)objc_msgSend(a3, "userInfo");
        v12 = (void *)objc_msgSend(v11, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey[0]());
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              v18 = objc_msgSend(v30[21], "objectForKey:", v17);
              if (v18)
              {
                objc_msgSend(v30[20], "setObject:forKey:", objc_msgSend(v12, "objectForKey:", v17), v18);
              }
              else
              {
                v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@");
                _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, v17);
                v26 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v36 = v17;
                  v37 = 2112;
                  v38 = a3;
                  _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@", buf, 0x16u);
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v14);
        }
        -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0);
        v8 = v29;
        v9 = 0x1ECD87000;
      }
      else
      {
        objc_msgSend(v30[11], "addObject:", a3);
      }
    }
    else
    {
      -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0);
    }
    if (objc_msgSend(*(id *)((char *)v30 + *(int *)(v9 + 1376)), "count"))
    {
      v27 = v30[1];
      if (v27)
        v28 = (void *)v27[1];
      else
        v28 = 0;
      objc_msgSend(v28, "addOperation:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v30 + *(int *)(v9 + 1376)), "allValues"), "objectAtIndexedSubscript:", 0));
    }
    else
    {
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v30, 0, v6);
    }
    objc_autoreleasePoolPop(v8);
    WeakRetained = v30;
  }

}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v13;
  NSCloudKitMirroringFetchRecordsResult *v14;
  NSMutableArray *updatedObjectIDs;
  NSMutableDictionary *failedObjectIDsToError;

  v8 = a6;
  v9 = a5;
  if (a5)
  {
    v13 = -[NSMutableDictionary count](self->_failedObjectIDsToError, "count");
    v14 = [NSCloudKitMirroringFetchRecordsResult alloc];
    if (v13)
      return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:", a3, a4, 0, v8, self->_updatedObjectIDs, self->_failedObjectIDsToError, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134418, 0));
  }
  else
  {
    v14 = [NSCloudKitMirroringFetchRecordsResult alloc];
    if (!self)
    {
      updatedObjectIDs = 0;
      failedObjectIDsToError = 0;
      return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:", a3, a4, v9, v8, updatedObjectIDs, failedObjectIDsToError, a7);
    }
  }
  updatedObjectIDs = self->_updatedObjectIDs;
  failedObjectIDsToError = self->_failedObjectIDsToError;
  return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:", a3, a4, v9, v8, updatedObjectIDs, failedObjectIDsToError, a7);
}

- (id)entityNameToAttributesToUpdate
{
  PFCloudKitImporterFetchRecordsWorkItem *v2;
  id result;
  NSCloudKitMirroringImportRequest *request;

  v2 = self;
  if (self)
    self = (PFCloudKitImporterFetchRecordsWorkItem *)self->super.super._request;
  result = (id)objc_msgSend((id)-[PFCloudKitImporterFetchRecordsWorkItem entityNameToAttributesToFetch](self, "entityNameToAttributesToFetch"), "count");
  if (result)
  {
    if (v2)
      request = v2->super.super._request;
    else
      request = 0;
    return (id)-[NSCloudKitMirroringImportRequest entityNameToAttributesToFetch](request, "entityNameToAttributesToFetch");
  }
  return result;
}

- (id)entityNameToRelationshipsToUpdate
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
