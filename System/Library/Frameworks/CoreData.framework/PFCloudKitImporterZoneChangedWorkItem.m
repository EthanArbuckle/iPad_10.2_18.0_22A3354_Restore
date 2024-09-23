@implementation PFCloudKitImporterZoneChangedWorkItem

- (PFCloudKitImporterZoneChangedWorkItem)initWithChangedRecordZoneIDs:(id)a3 options:(id)a4 request:(id)a5
{
  PFCloudKitImporterZoneChangedWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  v6 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6)
  {
    v6->_changedRecordZoneIDs = (NSArray *)a3;
    v6->_fetchedZoneIDToChangeToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_fetchedZoneIDToMoreComing = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_changedRecordZoneIDs = 0;
  self->_fetchedZoneIDToChangeToken = 0;

  self->_fetchedZoneIDToMoreComing = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
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
  objc_msgSend(v7, "appendFormat:", CFSTR(" {\n%@\n}"), self->_changedRecordZoneIDs);
  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  PFCloudKitImporterOptions *options;
  PFCloudKitImporterOptions *v8;
  PFCloudKitImporterOptions *v9;
  PFCloudKitStoreMonitor *monitor;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSCloudKitMirroringDelegateOptions *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSCloudKitMirroringImportRequest *v26;
  uint64_t v27;
  uint64_t v28;
  NSCloudKitMirroringResult *v29;
  NSCloudKitMirroringImportRequest *v30;
  PFCloudKitStoreMonitor *v31;
  uint64_t v32;
  NSCloudKitMirroringResult *v33;
  void *v34;
  void *v35;
  NSCloudKitMirroringResult *v36;
  NSCloudKitMirroringImportRequest *request;
  PFCloudKitStoreMonitor *v38;
  uint64_t storeIdentifier;
  NSCloudKitMirroringResult *v40;
  void (**v41)(id, void *);
  PFCloudKitImporterZoneChangedWorkItem *v42;
  NSArray *obj;
  uint64_t v44;
  id WeakRetained;
  id v46;
  PFCloudKitImporterOptions *v47;
  CKDatabase *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[11];
  id location;
  id *p_location;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (self)
    options = self->super.super._options;
  else
    options = 0;
  v8 = options;
  v9 = v8;
  if (v8)
  {
    v48 = v8->_database;
    monitor = v9->_monitor;
    if (monitor)
    {
      WeakRetained = objc_loadWeakRetained((id *)&monitor->_monitoredCoordinator);
      v11 = (uint64_t)v9->_monitor;
      goto LABEL_6;
    }
  }
  else
  {
    v48 = 0;
  }
  WeakRetained = 0;
  v11 = 0;
LABEL_6:
  v47 = v9;
  v49 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v11);
  if (v49)
  {
    v41 = (void (**)(id, void *))a4;
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v84 = 1;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3052000000;
    v78 = __Block_byref_object_copy__41;
    v79 = __Block_byref_object_dispose__41;
    v80 = 0;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v42 = self;
    obj = self->_changedRecordZoneIDs;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    if (v12)
    {
      v44 = *(_QWORD *)v72;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v72 != v44)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v13);
          location = 0;
          p_location = &location;
          v67 = 0x3052000000;
          v68 = __Block_byref_object_copy__41;
          v69 = __Block_byref_object_dispose__41;
          v70 = 0;
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
          v64[3] = &unk_1E1EE0B80;
          v64[4] = v14;
          v64[5] = v48;
          v64[6] = v49;
          v64[7] = a3;
          v64[8] = &location;
          v64[9] = &v81;
          v64[10] = &v75;
          objc_msgSend(a3, "performBlockAndWait:", v64);
          if (!*((_BYTE *)v82 + 24))
          {
            _Block_object_dispose(&location, 8);
            v9 = v47;
            goto LABEL_37;
          }
          v15 = objc_alloc_init((Class)getCloudKitCKFetchRecordZoneChangesConfigurationClass[0]());
          objc_msgSend(v15, "setPreviousServerChangeToken:", p_location[5]);

          p_location[5] = 0;
          v16 = objc_msgSend(v49, "configurationName");
          v17 = (void *)objc_msgSend(WeakRetained, "managedObjectModel");
          if (v47)
            v18 = v47->_options;
          else
            v18 = 0;
          v19 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, v16, v17, -[NSCloudKitMirroringDelegateOptions automaticallyDownloadFileBackedFutures](v18, "automaticallyDownloadFileBackedFutures"));
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v61 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(v20, "addObject:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
            }
            while (v21);
          }
          objc_msgSend(v15, "setDesiredKeys:", v20);
          objc_msgSend(v46, "setObject:forKey:", v15, v14);

          _Block_object_dispose(&location, 8);
          ++v13;
        }
        while (v13 != v12);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
        v12 = v24;
        v9 = v47;
      }
      while (v24);
    }
LABEL_37:
    if (*((_BYTE *)v82 + 24))
    {
      v35 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKFetchRecordZoneChangesOperationClass[0]()), "initWithRecordZoneIDs:configurationsByRecordZoneID:", v42->_changedRecordZoneIDs, v46);
      if (-[NSCloudKitMirroringRequest options](v42->super.super._request, "options"))
        -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)-[NSCloudKitMirroringRequest options](v42->super.super._request, "options"), v35);
      objc_initWeak(&location, v42);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
      v58[3] = &unk_1E1EDD808;
      objc_copyWeak(&v59, &location);
      objc_msgSend(v35, "setRecordWasChangedBlock:", v58);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3;
      v56[3] = &unk_1E1EE0BA8;
      objc_copyWeak(&v57, &location);
      objc_msgSend(v35, "setRecordWithIDWasDeletedBlock:", v56);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4;
      v54[3] = &unk_1E1EE0BD0;
      objc_copyWeak(&v55, &location);
      objc_msgSend(v35, "setRecordZoneChangeTokensUpdatedBlock:", v54);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5;
      v52[3] = &unk_1E1EE0BF8;
      objc_copyWeak(&v53, &location);
      objc_msgSend(v35, "setRecordZoneFetchCompletionBlock:", v52);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6;
      v50[3] = &unk_1E1EE0C20;
      objc_copyWeak(&v51, &location);
      v50[4] = v41;
      objc_msgSend(v35, "setFetchRecordZoneChangesCompletionBlock:", v50);
      -[CKDatabase addOperation:](v48, "addOperation:", v35);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v53);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&location);
      v34 = v35;
      goto LABEL_48;
    }
    if (!v41)
    {
LABEL_47:
      v34 = 0;
LABEL_48:

      v76[5] = 0;
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v81, 8);
      goto LABEL_49;
    }
    v36 = [NSCloudKitMirroringResult alloc];
    if (v42)
    {
      request = v42->super.super._request;
      if (!v9)
        goto LABEL_57;
    }
    else
    {
      request = 0;
      if (!v9)
        goto LABEL_57;
    }
    v38 = v9->_monitor;
    if (v38)
    {
      storeIdentifier = (uint64_t)v38->_storeIdentifier;
LABEL_46:
      v40 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v36, "initWithRequest:storeIdentifier:success:madeChanges:error:", request, storeIdentifier, 0, 0, v76[5]);
      v41[2](v41, v40);

      goto LABEL_47;
    }
LABEL_57:
    storeIdentifier = 0;
    goto LABEL_46;
  }
  if (a4)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v85 = *MEMORY[0x1E0CB2D68];
    if (self)
      v26 = self->super.super._request;
    else
      v26 = 0;
    v86 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), -[NSCloudKitMirroringRequest requestIdentifier](v26, "requestIdentifier"));
    v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v28 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v27);
    v29 = [NSCloudKitMirroringResult alloc];
    if (self)
    {
      v30 = self->super.super._request;
      if (!v9)
        goto LABEL_55;
    }
    else
    {
      v30 = 0;
      if (!v9)
        goto LABEL_55;
    }
    v31 = v9->_monitor;
    if (v31)
    {
      v32 = (uint64_t)v31->_storeIdentifier;
LABEL_34:
      v33 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v29, "initWithRequest:storeIdentifier:success:madeChanges:error:", v30, v32, 0, 0, v28);
      (*((void (**)(id, NSCloudKitMirroringResult *))a4 + 2))(a4, v33);

      goto LABEL_35;
    }
LABEL_55:
    v32 = 0;
    goto LABEL_34;
  }
LABEL_35:
  v34 = 0;
  v46 = 0;
LABEL_49:

}

id __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1)
{
  NSManagedObject *v2;
  id result;
  uint64_t v4;
  id v5[6];

  v5[5] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), (uint64_t)v5);
  if (v2)
  {
    result = (id)-[NSManagedObject currentChangeToken](v2, "currentChangeToken");
    v4 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    result = v5[0];
    v4 = *(_QWORD *)(a1 + 80);
  }
  *(_QWORD *)(*(_QWORD *)(v4 + 8) + 40) = result;
  return result;
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  char v5;
  void *v6;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "recordID"), "recordName"), "hasPrefix:", CFSTR("CD_FAKE_"));
      WeakRetained = v6;
      if ((v5 & 1) == 0)
      {
        objc_msgSend(v6, "addUpdatedRecord:", a3);
        WeakRetained = v6;
      }
    }

  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem addDeletedRecordID:ofType:]((uint64_t)WeakRetained, a2, a3);
    WeakRetained = v6;
  }

}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a3 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[20], "setObject:forKey:", a3, a2);
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v6, a3);
    WeakRetained = v6;
  }

}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id *WeakRetained;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    if (a6)
    {
      objc_msgSend(WeakRetained[11], "addObject:", a6);
    }
    else
    {
      if (a3)
      {
        objc_msgSend(WeakRetained[20], "setObject:forKey:", a3, a2);
        WeakRetained = v11;
      }
      objc_msgSend(WeakRetained[21], "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5), a2);
    }
    WeakRetained = v11;
  }

}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)WeakRetained, a2, *(_QWORD *)(a1 + 32));
    WeakRetained = v5;
  }

}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  NSMutableDictionary *fetchedZoneIDToChangeToken;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PFCloudKitImporterOptions *options;
  CKDatabase *database;
  NSManagedObject *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  NSObject *v35;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  fetchedZoneIDToChangeToken = self->_fetchedZoneIDToChangeToken;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchedZoneIDToChangeToken, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(fetchedZoneIDToChangeToken);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
        options = self->super.super._options;
        if (options)
          database = options->_database;
        else
          database = 0;
        v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v13, -[CKDatabase databaseScope](database, "databaseScope"), (uint64_t)a4, a3, (uint64_t)&v43);
        if (v43)
        {
          v19 = (void *)MEMORY[0x18D76B4E4](v16);
          v20 = __ckLoggingOverride != 0;
          v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to fetch zone metadata for zone: %@\n%@"));
          _NSCoreDataLog(v20, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:]");
          objc_autoreleasePoolPop(v19);
          goto LABEL_16;
        }
        -[NSManagedObject setCurrentChangeToken:](v16, "setCurrentChangeToken:", -[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToChangeToken, "objectForKey:", v13));
        ++v12;
      }
      while (v10 != v12);
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchedZoneIDToChangeToken, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      v10 = v17;
    }
    while (v17);
  }
  v38.receiver = self;
  v38.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  if (!-[PFCloudKitImportRecordsWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:](&v38, sel_updateMetadataForAccumulatedChangesInContext_inStore_error_, a3, a4, &v43))
  {
LABEL_16:
    if (v43)
    {
      if (a5)
      {
        LOBYTE(v18) = 0;
        *a5 = v43;
        return v18;
      }
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = __pflogFaultLog;
      v18 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v18)
        return v18;
      *(_DWORD *)buf = 136315394;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
      v46 = 1024;
      v47 = 284;
      _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v18) = 0;
    return v18;
  }
  LOBYTE(v18) = 1;
  return v18;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PFCloudKitImporterOptions *options;
  CKDatabase *database;
  void *v14;
  NSManagedObject *v15;
  NSManagedObject *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  NSObject *v35;
  id obj;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", -[NSMutableDictionary allKeys](self->_fetchedZoneIDToChangeToken, "allKeys"));
  obj = v8;
  objc_msgSend(v8, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->_fetchedZoneIDToMoreComing, "allKeys"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        options = self->super.super._options;
        if (options)
          database = options->_database;
        else
          database = 0;
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        v15 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v14, -[CKDatabase databaseScope](database, "databaseScope"), (uint64_t)a4, a3, (uint64_t)&v44);
        if (v44)
        {
          v19 = (void *)MEMORY[0x18D76B4E4](v15);
          v20 = __ckLoggingOverride;
          v8 = obj;
          v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to fetch zone metadata for zone: %@\n%@"));
          _NSCoreDataLog(v20 != 0, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem commitMetadataChangesWithContext:forStore:error:]");
          objc_autoreleasePoolPop(v19);
          v18 = 0;
          goto LABEL_15;
        }
        v16 = v15;
        -[NSManagedObject setCurrentChangeToken:](v15, "setCurrentChangeToken:", -[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToChangeToken, "objectForKey:", v14));
        -[NSManagedObject setNeedsImport:](v16, "setNeedsImport:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToMoreComing, "objectForKey:", v14), "BOOLValue"));
        -[NSManagedObject setLastFetchDate:](v16, "setLastFetchDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
        ++v11;
      }
      while (v9 != v11);
      v8 = obj;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      v9 = v17;
    }
    while (v17);
  }
  v39.receiver = self;
  v39.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  v18 = -[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:](&v39, sel_commitMetadataChangesWithContext_forStore_error_, a3, a4, &v44);
LABEL_15:

  if (!v18)
  {
    if (v44)
    {
      if (a5)
        *a5 = v44;
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
        v47 = 1024;
        v48 = 329;
        _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v18;
}

@end
