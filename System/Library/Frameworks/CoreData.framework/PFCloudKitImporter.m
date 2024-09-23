@implementation PFCloudKitImporter

- (PFCloudKitImporter)initWithOptions:(id)a3 request:(id)a4
{
  PFCloudKitImporter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporter;
  v6 = -[PFCloudKitImporter init](&v8, sel_init);
  if (v6)
  {
    v6->_options = (PFCloudKitImporterOptions *)objc_msgSend(a3, "copy");
    v6->_request = (NSCloudKitMirroringImportRequest *)a4;
    v6->_workItemResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6->_totalImportedBytes = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  self->_request = 0;

  self->_workItems = 0;
  self->_workItemResults = 0;

  self->_updatedDatabaseChangeToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporter;
  -[PFCloudKitImporter dealloc](&v3, sel_dealloc);
}

- (void)importIfNecessaryWithCompletion:(uint64_t)a1
{
  uint64_t v2;
  _QWORD v3[7];

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
      v2 = *(_QWORD *)(v2 + 16);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke;
    v3[3] = &unk_1E1EDF3D8;
    v3[4] = v2;
    v3[5] = a1;
    v3[6] = a2;
    -[PFCloudKitStoreMonitor performBlock:](v2, (uint64_t)v3);
  }
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSCloudKitMirroringResult *v8;
  uint64_t v9;
  uint64_t v10;
  NSCloudKitMirroringResult *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSCloudKitMirroringResult *v15;
  uint64_t v16;
  uint64_t v17;
  NSCloudKitMirroringResult *v18;
  uint64_t v19;
  void *v20;
  PFCloudKitImporterFetchRecordsWorkItem *v21;
  NSManagedObjectContext *v22;
  uint64_t v23;
  PFCloudKitImportDatabaseContext *v24;
  id v25;
  uint64_t v26;
  NSCloudKitMirroringResult *v27;
  uint64_t v28;
  uint64_t v29;
  NSCloudKitMirroringResult *v30;
  uint64_t v31;
  id WeakRetained;
  uint64_t v33;
  const __CFString *v34;
  id v35;
  char v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  id v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[6];
  id v68;
  id location;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[10];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const __CFString *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  v54 = a1;
  if (v2)
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(v3 + 16);
    if (v4)
    {
      if ((objc_msgSend(*(id *)(v4 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v4 + 40))
      {
        v5 = (void *)MEMORY[0x1E0CB35C8];
        v94 = *MEMORY[0x1E0CB2D68];
        v95 = CFSTR("The request was aborted because it was deferred by the system.");
        v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v7 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v6);
        v8 = [NSCloudKitMirroringResult alloc];
        v9 = a1[4];
        if (v9)
          v10 = *(_QWORD *)(v9 + 48);
        else
          v10 = 0;
        v11 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v8, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v10, 0, 0, v7);
        (*(void (**)(void))(a1[6] + 16))();

        goto LABEL_26;
      }
      v3 = a1[5];
    }
    v49 = v2;
    v19 = *(_QWORD *)(v3 + 8);
    if (v19)
      v20 = *(void **)(v19 + 8);
    else
      v20 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PFCloudKitImporterFetchRecordsWorkItem initWithOptions:request:]([PFCloudKitImporterFetchRecordsWorkItem alloc], "initWithOptions:request:", *(_QWORD *)(a1[5] + 8), *(_QWORD *)(a1[5] + 16));
      *(_QWORD *)(a1[5] + 24) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v21, 0);
      -[PFCloudKitImporter processWorkItemsWithCompletion:](a1[5], a1[6]);

    }
    else if (objc_msgSend(v20, "databaseScope") == 2 || objc_msgSend(v20, "databaseScope") == 3)
    {
      v88 = 0;
      v89 = &v88;
      v90 = 0x2020000000;
      v91 = 1;
      v82 = 0;
      v83 = &v82;
      v84 = 0x3052000000;
      v85 = __Block_byref_object_copy__24;
      v86 = __Block_byref_object_dispose__24;
      v87 = 0;
      v76 = 0;
      v77 = &v76;
      v78 = 0x3052000000;
      v79 = __Block_byref_object_copy__24;
      v80 = __Block_byref_object_dispose__24;
      v81 = 0;
      v22 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
      v23 = MEMORY[0x1E0C809B0];
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
      v75[3] = &unk_1E1EDD4A8;
      v75[4] = a1[5];
      v75[5] = v2;
      v75[7] = &v76;
      v75[6] = v22;
      v75[8] = &v82;
      v75[9] = &v88;
      -[NSManagedObjectContext performBlockAndWait:](v22, "performBlockAndWait:", v75);
      if (*((_BYTE *)v89 + 24))
      {
        v24 = objc_alloc_init(PFCloudKitImportDatabaseContext);
        v25 = objc_alloc_init((Class)getCloudKitCKFetchDatabaseChangesOperationClass[0]());
        objc_msgSend(v25, "setPreviousServerChangeToken:", v77[5]);
        -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(a1[5] + 16), "options"), v25);
        v74[0] = v23;
        v74[1] = 3221225472;
        v74[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2;
        v74[3] = &unk_1E1EDF8E8;
        v74[4] = v24;
        objc_msgSend(v25, "setRecordZoneWithIDChangedBlock:", v74);
        v73[0] = v23;
        v73[1] = 3221225472;
        v73[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3;
        v73[3] = &unk_1E1EDF8E8;
        v73[4] = v24;
        objc_msgSend(v25, "setRecordZoneWithIDWasDeletedBlock:", v73);
        v72[0] = v23;
        v72[1] = 3221225472;
        v72[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4;
        v72[3] = &unk_1E1EDF8E8;
        v72[4] = v24;
        objc_msgSend(v25, "setRecordZoneWithIDWasPurgedBlock:", v72);
        v71[0] = v23;
        v71[1] = 3221225472;
        v71[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5;
        v71[3] = &unk_1E1EDF910;
        v71[4] = v24;
        objc_msgSend(v25, "setChangeTokenUpdatedBlock:", v71);
        v70[0] = v23;
        v70[1] = 3221225472;
        v70[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
        v70[3] = &unk_1E1EDF8E8;
        v70[4] = v24;
        objc_msgSend(v25, "setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:", v70);
        objc_initWeak(&location, (id)a1[5]);
        v67[0] = v23;
        v67[1] = 3221225472;
        v67[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7;
        v67[3] = &unk_1E1EDF938;
        objc_copyWeak(&v68, &location);
        v26 = a1[6];
        v67[4] = v24;
        v67[5] = v26;
        objc_msgSend(v25, "setFetchDatabaseChangesCompletionBlock:", v67);
        objc_msgSend(v20, "addOperation:", v25);

        objc_destroyWeak(&v68);
        objc_destroyWeak(&location);
      }
      else
      {
        v27 = [NSCloudKitMirroringResult alloc];
        v28 = a1[4];
        if (v28)
          v29 = *(_QWORD *)(v28 + 48);
        else
          v29 = 0;
        v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v27, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v29, 0, 0, v83[5]);
        (*(void (**)(void))(a1[6] + 16))();

      }
      v83[5] = 0;

      v77[5] = 0;
      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v88, 8);
    }
    else
    {
      if (objc_msgSend(v20, "databaseScope") != 1)
        goto LABEL_26;
      v31 = a1[4];
      if (v31)
        WeakRetained = objc_loadWeakRetained((id *)(v31 + 32));
      else
        WeakRetained = 0;
      v33 = objc_msgSend(v2, "configurationName");
      if (v33)
        v34 = (const __CFString *)v33;
      else
        v34 = CFSTR("PF_DEFAULT_CONFIGURATION_NAME");
      v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = WeakRetained;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = (id)objc_msgSend((id)objc_msgSend(WeakRetained, "managedObjectModel"), "entitiesForConfiguration:", v34);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v98, 16);
      if (v52)
      {
        v36 = 0;
        v51 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v64 != v51)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v35, "addObject:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)v38));
            if ((v36 & 1) != 0)
            {
              v36 = 1;
            }
            else
            {
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v39 = (void *)objc_msgSend(v38, "relationshipsByName");
              v36 = 0;
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v97, 16);
              if (v40)
              {
                v41 = *(_QWORD *)v60;
                do
                {
                  for (j = 0; j != v40; ++j)
                  {
                    if (*(_QWORD *)v60 != v41)
                      objc_enumerationMutation(v39);
                    v43 = (void *)objc_msgSend((id)objc_msgSend(v38, "relationshipsByName"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
                    if (objc_msgSend(v43, "isToMany")
                      && objc_msgSend((id)objc_msgSend(v43, "inverseRelationship"), "isToMany"))
                    {
                      objc_msgSend(v35, "addObject:", CFSTR("CDMR"));
                      v36 = 1;
                    }
                  }
                  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v97, 16);
                }
                while (v40);
              }
            }
          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v98, 16);
        }
        while (v52);
      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v44 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v96, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v56 != v45)
              objc_enumerationMutation(v35);
            v47 = -[PFCloudKitCKQueryBackedImportWorkItem initForRecordType:withOptions:request:]([PFCloudKitCKQueryBackedImportWorkItem alloc], "initForRecordType:withOptions:request:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k), *(_QWORD *)(v54[5] + 8), *(_QWORD *)(v54[5] + 16));
            objc_msgSend(v53, "addObject:", v47);

          }
          v44 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v96, 16);
        }
        while (v44);
      }
      *(_QWORD *)(v54[5] + 24) = objc_msgSend(v53, "copy");
      -[PFCloudKitImporter processWorkItemsWithCompletion:](v54[5], v54[6]);

    }
    v2 = v49;
  }
  else if (a1[6])
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB2D68];
    v93 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier"));
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v13);
    v15 = [NSCloudKitMirroringResult alloc];
    v16 = a1[4];
    if (v16)
      v17 = *(_QWORD *)(v16 + 48);
    else
      v17 = 0;
    v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v15, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v17, 0, 0, v14);
    (*(void (**)(void))(a1[6] + 16))();

  }
LABEL_26:

}

- (void)processWorkItemsWithCompletion:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[6];
  uint64_t v20;
  _QWORD v21[7];
  uint64_t v22;

  if (a1)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v5 = 16;
    else
      v5 = __ckLoggingOverride;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Processing work items: %@"));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]");
    objc_autoreleasePoolPop(v4);
    v13 = *(_QWORD **)(a1 + 8);
    if (v13)
      v13 = (_QWORD *)v13[2];
    v14 = v13;
    if (objc_msgSend(*(id *)(a1 + 24), "count")
      && (v15 = (id)objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", 0),
          v16 = (void *)objc_msgSend(*(id *)(a1 + 24), "mutableCopy"),
          objc_msgSend(v16, "removeObjectAtIndex:", 0),
          *(id *)(a1 + 24),
          *(_QWORD *)(a1 + 24) = objc_msgSend(v16, "copy"),
          v16,
          v15))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke;
      v21[3] = &unk_1E1EDDC60;
      v21[4] = v14;
      v21[5] = a1;
      v21[6] = v15;
      v17 = v21;
      v18 = &v22;
    }
    else
    {
      v15 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4;
      v19[3] = &unk_1E1EDF3D8;
      v19[4] = v14;
      v19[5] = a1;
      v17 = v19;
      v18 = &v20;
    }
    *v18 = a2;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v14, (uint64_t)v17);

  }
}

id __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    v3 = *(void **)(v2 + 8);
  else
    v3 = 0;
  result = (id)-[NSManagedObject currentChangeToken](+[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, objc_msgSend(v3, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "currentChangeToken");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = __ckLoggingOverride;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch metadata for database: %@"));
    _NSCoreDataLog(v6 != 0, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitImporter importIfNecessaryWithCompletion:]_block_invoke");
    objc_autoreleasePoolPop(v5);
    result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 8), "addObject:", a2);
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 16), "addObject:", a2);
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 24), "addObject:", a2);
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5(uint64_t a1, char *newValue)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_setProperty_nonatomic(v2, newValue, newValue, 40);
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 32), "addObject:", a2);
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *WeakRetained;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = *(id *)(a1 + 32);
  v10 = v8;
  if (WeakRetained)
  {
    if (v8)
      objc_setProperty_nonatomic(v8, v9, a2, 40);
    v11 = WeakRetained[1];
    if (v11)
      v12 = *(NSObject **)(v11 + 32);
    else
      v12 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8;
    v14[3] = &unk_1E1EDDC60;
    v14[4] = WeakRetained;
    v14[5] = v10;
    v13 = *(_QWORD *)(a1 + 40);
    v14[6] = a4;
    v14[7] = v13;
    dispatch_async(v12, v14);
  }

}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSCloudKitMirroringResult *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSCloudKitMirroringResult *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[8];

  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v21 = v2;
    if (!v4)
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = (_QWORD *)v2[1];
      if (v20)
        v20 = (_QWORD *)v20[2];
      v18 = v20;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke;
      v22[3] = &unk_1E1EDDC60;
      v22[4] = v18;
      v22[5] = v21;
      v22[6] = v19;
      v22[7] = v3;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v18, (uint64_t)v22);
      goto LABEL_11;
    }
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = __ckLoggingOverride != 0;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Database fetch for request: %@ failed with error: %@"));
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]");
    objc_autoreleasePoolPop(v5);
    v2 = v21;
    if (v3)
    {
      v14 = [NSCloudKitMirroringResult alloc];
      v15 = v21[1];
      if (v15 && (v16 = *(_QWORD *)(v15 + 16)) != 0)
        v17 = *(_QWORD *)(v16 + 48);
      else
        v17 = 0;
      v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:error:", v21[2], v17, 0, 0, v4);
      (*(void (**)(uint64_t, NSCloudKitMirroringResult *))(v3 + 16))(v3, v18);
LABEL_11:

      v2 = v21;
    }
  }

}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
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
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  void *v22;
  PFCloudKitImporterZoneChangedWorkItem *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  PFCloudKitImporterZoneChangedWorkItem *v28;
  PFCloudKitImporterZoneChangedWorkItem *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSCloudKitMirroringResult *v33;
  uint64_t v34;
  uint64_t v35;
  NSCloudKitMirroringResult *v36;
  NSCloudKitMirroringResult *v37;
  uint64_t v38;
  uint64_t v39;
  NSCloudKitMirroringResult *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSCloudKitMirroringResult *v50;
  uint64_t v51;
  uint64_t v52;
  NSCloudKitMirroringResult *v53;
  PFCloudKitImporterZoneChangedWorkItem *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  PFCloudKitImporterZoneDeletedWorkItem *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  PFCloudKitImporterZonePurgedWorkItem *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  PFCloudKitImporterZoneDeletedWorkItem *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSManagedObjectContext *v74;
  _QWORD v75[10];
  _QWORD v76[10];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    v74 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
    v3 = *(_QWORD *)(a1[5] + 8);
    if (v3)
      v4 = *(void **)(v3 + 8);
    else
      v4 = 0;
    v5 = objc_msgSend(v4, "databaseScope");
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 1;
    v77 = 0;
    v78 = &v77;
    v79 = 0x3052000000;
    v80 = __Block_byref_object_copy__24;
    v81 = __Block_byref_object_dispose__24;
    v6 = MEMORY[0x1E0C809B0];
    v82 = 0;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2;
    v76[3] = &unk_1E1EDF960;
    v76[4] = v2;
    v76[5] = v74;
    v76[6] = a1[6];
    v76[7] = &v83;
    v76[8] = &v77;
    v76[9] = v5;
    -[NSManagedObjectContext performBlockAndWait:](v74, "performBlockAndWait:", v76);
    if (*((_BYTE *)v84 + 24))
    {
      v7 = -[PFCloudKitImportDatabaseContext hasWorkToDo](a1[6]);
      v8 = (void *)MEMORY[0x18D76B4E4]();
      v9 = __ckLoggingOverride;
      if (!v7)
      {
        v41 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Import request finished with no work to do: %@"));
        if (v9 >= 0x10)
          v48 = 16;
        else
          v48 = v9;
        _NSCoreDataLog(v48, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
        objc_autoreleasePoolPop(v8);
        v75[0] = v6;
        v75[1] = 3221225472;
        v75[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3;
        v75[3] = &unk_1E1EDF0B8;
        v49 = a1[6];
        v75[4] = a1[5];
        v75[5] = v2;
        v75[6] = v74;
        v75[7] = v49;
        v75[8] = &v83;
        v75[9] = &v77;
        -[NSManagedObjectContext performBlockAndWait:](v74, "performBlockAndWait:", v75);
        if (a1[7])
        {
          v50 = [NSCloudKitMirroringResult alloc];
          v51 = a1[4];
          if (v51)
            v52 = *(_QWORD *)(v51 + 48);
          else
            v52 = 0;
          v53 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v50, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v52, 1, 0, 0);
          (*(void (**)(void))(a1[7] + 16))();

        }
        goto LABEL_74;
      }
      v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Import request finished: %@ - %@"));
      if (v9 >= 0x10)
        v17 = 16;
      else
        v17 = v9;
      _NSCoreDataLog(v17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
      objc_autoreleasePoolPop(v8);
      v18 = (_QWORD *)a1[6];
      if (v18)
        v18 = (_QWORD *)v18[5];
      *(_QWORD *)(a1[5] + 40) = v18;
      v19 = (_QWORD *)a1[5];
      if (v19)
      {
        v20 = a1[6];
        v72 = a1[7];
        v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v73 = v20;
        if (v20)
        {
          if (!objc_msgSend(*(id *)(v20 + 8), "count"))
          {
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
LABEL_47:
            v56 = *(void **)(v20 + 16);
LABEL_48:
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
            if (v57)
            {
              v58 = *(_QWORD *)v96;
              do
              {
                for (i = 0; i != v57; ++i)
                {
                  if (*(_QWORD *)v96 != v58)
                    objc_enumerationMutation(v56);
                  v60 = -[PFCloudKitImporterZoneDeletedWorkItem initWithDeletedRecordZoneID:options:request:]([PFCloudKitImporterZoneDeletedWorkItem alloc], "initWithDeletedRecordZoneID:options:request:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i), v19[1], v19[2]);
                  objc_msgSend(v21, "addObject:", v60);

                }
                v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
              }
              while (v57);
            }
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            if (v73)
              v61 = *(void **)(v73 + 24);
            else
              v61 = 0;
            v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
            if (v62)
            {
              v63 = *(_QWORD *)v92;
              do
              {
                for (j = 0; j != v62; ++j)
                {
                  if (*(_QWORD *)v92 != v63)
                    objc_enumerationMutation(v61);
                  v65 = -[PFCloudKitImporterZonePurgedWorkItem initWithPurgedRecordZoneID:options:request:]([PFCloudKitImporterZonePurgedWorkItem alloc], "initWithPurgedRecordZoneID:options:request:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j), v19[1], v19[2]);
                  objc_msgSend(v21, "addObject:", v65);

                }
                v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
              }
              while (v62);
            }
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            if (v73)
              v66 = *(void **)(v73 + 32);
            else
              v66 = 0;
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
            if (v67)
            {
              v68 = *(_QWORD *)v88;
              do
              {
                for (k = 0; k != v67; ++k)
                {
                  if (*(_QWORD *)v88 != v68)
                    objc_enumerationMutation(v66);
                  v70 = -[PFCloudKitImporterZoneDeletedWorkItem initWithDeletedRecordZoneID:options:request:]([PFCloudKitImporterZoneDeletedWorkItem alloc], "initWithDeletedRecordZoneID:options:request:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k), v19[1], v19[2]);
                  objc_msgSend(v21, "addObject:", v70);

                }
                v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
              }
              while (v67);
            }
            v19[3] = objc_msgSend(v21, "copy");
            -[PFCloudKitImporter processWorkItemsWithCompletion:]((uint64_t)v19, v72);

            goto LABEL_74;
          }
          v22 = *(void **)(v20 + 8);
        }
        else
        {
          if (!objc_msgSend(0, "count"))
          {
            v56 = 0;
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            goto LABEL_48;
          }
          v22 = 0;
          v20 = 0;
        }
        if ((unint64_t)objc_msgSend(v22, "count") < 0x191)
        {
          v54 = [PFCloudKitImporterZoneChangedWorkItem alloc];
          if (v20)
            v55 = *(void **)(v20 + 8);
          else
            v55 = 0;
          v23 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:](v54, "initWithChangedRecordZoneIDs:options:request:", objc_msgSend(v55, "allObjects"), v19[1], v19[2]);
          objc_msgSend(v21, "addObject:", v23);
        }
        else
        {
          v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          if (v20)
            v24 = *(void **)(v20 + 8);
          else
            v24 = 0;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
          v71 = v2;
          if (v25)
          {
            v26 = *(_QWORD *)v100;
            do
            {
              for (m = 0; m != v25; ++m)
              {
                if (*(_QWORD *)v100 != v26)
                  objc_enumerationMutation(v24);
                -[PFCloudKitImporterZoneChangedWorkItem addObject:](v23, "addObject:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m));
                if (-[PFCloudKitImporterZoneChangedWorkItem count](v23, "count") == 400)
                {
                  v28 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:]([PFCloudKitImporterZoneChangedWorkItem alloc], "initWithChangedRecordZoneIDs:options:request:", v23, v19[1], v19[2]);
                  objc_msgSend(v21, "addObject:", v28);

                  v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                }
              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
            }
            while (v25);
          }
          v2 = v71;
          v20 = v73;
          if (-[PFCloudKitImporterZoneChangedWorkItem count](v23, "count"))
          {
            v29 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:]([PFCloudKitImporterZoneChangedWorkItem alloc], "initWithChangedRecordZoneIDs:options:request:", v23, v19[1], v19[2]);
            objc_msgSend(v21, "addObject:", v29);

          }
        }

        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        if (!v20)
        {
          v56 = 0;
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
    else
    {
      v37 = [NSCloudKitMirroringResult alloc];
      v38 = a1[4];
      if (v38)
        v39 = *(_QWORD *)(v38 + 48);
      else
        v39 = 0;
      v40 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v37, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v39, 0, 0, v78[5]);
      (*(void (**)(void))(a1[7] + 16))();

    }
LABEL_74:

    v78[5] = 0;
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v83, 8);
    goto LABEL_75;
  }
  v30 = (void *)MEMORY[0x1E0CB35C8];
  v103 = *MEMORY[0x1E0CB2D68];
  v104 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier"));
  v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
  v32 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v31);
  v33 = [NSCloudKitMirroringResult alloc];
  v34 = a1[4];
  if (v34)
    v35 = *(_QWORD *)(v34 + 48);
  else
    v35 = 0;
  v36 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v33, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v35, 0, 0, v32);
  (*(void (**)(void))(a1[7] + 16))();

LABEL_75:
}

id __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2(uint64_t a1)
{
  NSFetchRequest *v2;
  void *v3;
  void *v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20[5];
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v20[0] = 0;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsImport = YES AND database.databaseScopeNum = %@ AND (needsNewShareInvitation = NO OR needsNewShareInvitation = NULL)"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72))));
  v22[0] = *(_QWORD *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v2, v20);
  v4 = v3;
  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    result = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    v6 = result;
    if (result)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
          v10 = -[NSCKRecordZoneMetadata createRecordZoneID](v9);
          if (objc_msgSend(v9, "needsImport"))
          {
            v11 = *(_QWORD *)(a1 + 48);
            v12 = v11 ? *(void **)(v11 + 16) : 0;
            if ((objc_msgSend(v12, "containsObject:", v10) & 1) == 0)
            {
              v13 = *(_QWORD *)(a1 + 48);
              if (v13)
                v14 = *(void **)(v13 + 24);
              else
                v14 = 0;
              if ((objc_msgSend(v14, "containsObject:", v10) & 1) == 0)
              {
                v15 = *(_QWORD *)(a1 + 48);
                if (v15)
                  objc_msgSend(*(id *)(v15 + 8), "addObject:", v10);
              }
            }
          }

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        result = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        v6 = result;
      }
      while (result);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    result = v20[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSManagedObject *v4;
  NSManagedObject *v5;
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
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v17[0] = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    v3 = *(void **)(v2 + 8);
  else
    v3 = 0;
  v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, objc_msgSend(v3, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v17);
  v5 = v4;
  if (!v4
    || ((v6 = *(_QWORD *)(a1 + 56)) == 0 ? (v7 = 0) : (v7 = *(_QWORD *)(v6 + 40)),
        -[NSManagedObject setCurrentChangeToken:](v4, "setCurrentChangeToken:", v7),
        -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")),
        (objc_msgSend(*(id *)(a1 + 48), "save:", v17) & 1) == 0))
  {
    v8 = (void *)MEMORY[0x18D76B4E4]();
    v9 = __ckLoggingOverride;
    v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Error fetching database metadata update for request: %@\n%@"));
    _NSCoreDataLog(v9 != 0, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke_3");
    objc_autoreleasePoolPop(v8);
  }
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSCloudKitMirroringResult *v11;
  uint64_t v12;
  uint64_t v13;
  NSCloudKitMirroringResult *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSCloudKitMirroringResult *v18;
  uint64_t v19;
  uint64_t v20;
  NSCloudKitMirroringResult *v21;
  _OWORD *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  __int128 v26;
  id v27;
  id location;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    v4 = a1[4];
  }
  else
  {
    v4 = 0;
    WeakRetained = 0;
  }
  v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    v6 = (_QWORD *)a1[5];
    if (v6)
    {
      v7 = v6[2];
      if (v7)
      {
        if ((objc_msgSend(*(id *)(v7 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v7 + 40))
        {
          v8 = (void *)MEMORY[0x1E0CB35C8];
          v31 = *MEMORY[0x1E0CB2D68];
          v32[0] = CFSTR("The request was aborted because it was deferred by the system.");
          v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
          v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v9);
          v11 = [NSCloudKitMirroringResult alloc];
          v12 = a1[4];
          if (v12)
            v13 = *(_QWORD *)(v12 + 48);
          else
            v13 = 0;
          v14 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v11, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v13, 0, 0, v10);
          (*(void (**)(void))(a1[7] + 16))();

          goto LABEL_16;
        }
        v6 = (_QWORD *)a1[5];
      }
    }
    objc_initWeak(&location, v6);
    v23 = (void *)a1[6];
    v22 = a1 + 6;
    v24 = *((_QWORD *)v22 - 2);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2;
    v25[3] = &unk_1E1EDF988;
    objc_copyWeak(&v27, &location);
    v26 = *v22;
    objc_msgSend(v23, "doWorkForStore:inMonitor:completion:", v5, v24, v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v29 = *MEMORY[0x1E0CB2D68];
  v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier"));
  v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v16);
  v18 = [NSCloudKitMirroringResult alloc];
  v19 = a1[4];
  if (v19)
    v20 = *(_QWORD *)(v19 + 48);
  else
    v20 = 0;
  v21 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v18, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1[5] + 16), v20, 0, 0, v17);
  (*(void (**)(void))(a1[7] + 16))();

LABEL_16:
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((_QWORD *)WeakRetained + 1);
    if (v6)
      v7 = *(NSObject **)(v6 + 32);
    else
      v7 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3;
    v10[3] = &unk_1E1EDDC60;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = v5;
    v10[5] = v8;
    v10[6] = a2;
    v10[7] = v9;
    dispatch_async(v7, v10);
  }

}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  uint64_t v5;
  _QWORD v6[5];
  int8x16_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v4 = *(int8x16_t *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke;
    v6[3] = &unk_1E1EDDC60;
    v6[4] = v3;
    v7 = vextq_s8(v4, v4, 8uLL);
    v8 = v5;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v6);
  }

  objc_autoreleasePoolPop(v2);
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4(uint64_t *a1)
{
  uint64_t *v1;
  void *v2;
  NSManagedObjectContext *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSCloudKitMirroringResult *v33;
  uint64_t v34;
  uint64_t v35;
  NSCloudKitMirroringResult *v36;
  char v37;
  uint64_t v38;
  id v39;
  id v40;
  NSCloudKitMirroringResult *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  PFCloudKitImportedRecordBytesMetric *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  PFCloudKitImportedRecordBytesMetric *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSManagedObjectContext *v55;
  uint64_t *v56;
  id v57;
  _QWORD v58[10];
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
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  const __CFString *v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v1 = a1;
  v86 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v79 = *MEMORY[0x1E0CB2D68];
    v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(v1[5] + 16), "requestIdentifier"));
    v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v32 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v31);
    v33 = [NSCloudKitMirroringResult alloc];
    v34 = v1[4];
    if (v34)
      v35 = *(_QWORD *)(v34 + 48);
    else
      v35 = 0;
    v36 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v33, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v1[5] + 16), v35, 0, 0, v32);
    (*(void (**)(void))(v1[6] + 16))();

    goto LABEL_48;
  }
  v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v1[4]);
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 1;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3052000000;
  v72 = __Block_byref_object_copy__24;
  v73 = __Block_byref_object_dispose__24;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__24;
  v67 = __Block_byref_object_dispose__24;
  v68 = 0;
  if ((unint64_t)objc_msgSend(*(id *)(v1[5] + 32), "count") < 2)
  {
    if (objc_msgSend(*(id *)(v1[5] + 32), "count") == 1)
    {
      v37 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "success");
      *((_BYTE *)v76 + 24) = v37;
      v38 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "madeChanges");
      v39 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "error");
      v70[5] = (uint64_t)v39;
      v40 = (id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject");
      v64[5] = (uint64_t)v40;
    }
    else
    {
      v38 = 0;
    }
    goto LABEL_32;
  }
  v55 = v3;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v4 = *(void **)(v1[5] + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
  v56 = v1;
  v6 = 0;
  if (v5)
  {
    v7 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v60 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if ((objc_msgSend(v9, "success") & 1) == 0)
        {
          *((_BYTE *)v76 + 24) = 0;
          if (objc_msgSend(v9, "error"))
          {
            objc_msgSend(v57, "addObject:", objc_msgSend(v9, "error"));
          }
          else
          {
            v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Work item result failed but did not include an error: %@");
            _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
            v17 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v9;
              _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Work item result failed but did not include an error: %@", buf, 0xCu);
            }
          }
        }
        if (objc_msgSend(v9, "madeChanges"))
          v6 = 1;
        v18 = objc_opt_class();
        if (v18 != objc_opt_class())
        {
          v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "The importer needs to be taught how to merge results of different types when dealing with multiple work items: %@");
          _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v9);
          v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v9;
            _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: The importer needs to be taught how to merge results of different types when dealing with multiple work items: %@", buf, 0xCu);
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
    }
    while (v5);
  }
  v1 = v56;
  if ((unint64_t)objc_msgSend(v57, "count") >= 2)
  {
    *((_BYTE *)v76 + 24) = 0;
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v81 = CFSTR("NSDetailedErrors");
    v82 = v57;
    v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v29 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134404, v28);
LABEL_30:
    v70[5] = (uint64_t)v29;
    goto LABEL_31;
  }
  if (objc_msgSend(v57, "count") == 1)
  {
    *((_BYTE *)v76 + 24) = 0;
    v29 = (id)objc_msgSend(v57, "lastObject");
    goto LABEL_30;
  }
LABEL_31:

  v38 = v6 & 1;
  v3 = v55;
LABEL_32:
  if (*((_BYTE *)v76 + 24))
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_59;
    v58[3] = &unk_1E1EDD858;
    v58[4] = v1[5];
    v58[5] = v2;
    v58[6] = v3;
    v58[7] = &v75;
    v58[8] = &v69;
    v58[9] = &v63;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v58);

    v3 = 0;
  }
  if (!v64[5])
  {
    v41 = [NSCloudKitMirroringResult alloc];
    v42 = v1[4];
    if (v42)
      v43 = *(_QWORD *)(v42 + 48);
    else
      v43 = 0;
    v44 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v41, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(v1[5] + 16), v43, *((unsigned __int8 *)v76 + 24), v38, v70[5]);
    v64[5] = v44;
  }
  v45 = [PFCloudKitImportedRecordBytesMetric alloc];
  v46 = v1[5];
  if (v46 && (v47 = *(_QWORD *)(v46 + 8)) != 0)
    v48 = *(void **)(v47 + 24);
  else
    v48 = 0;
  v49 = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v45, "initWithContainerIdentifier:", objc_msgSend(v48, "containerIdentifier"));
  -[PFCloudKitSizeMetric addByteSize:]((uint64_t)v49, *(_QWORD *)(v1[5] + 48));
  v50 = v1[5];
  if (v50 && (v51 = *(_QWORD *)(v50 + 8)) != 0 && (v52 = *(_QWORD *)(v51 + 24)) != 0)
    v53 = *(_QWORD *)(v52 + 72);
  else
    v53 = 0;
  -[PFCloudKitMetricsClient logMetric:](v53, v49);

  v54 = v1[6];
  if (v54)
    (*(void (**)(uint64_t, uint64_t))(v54 + 16))(v54, v64[5]);

  v64[5] = 0;
  v70[5] = 0;
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
LABEL_48:

}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSManagedObject *v4;
  NSManagedObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15[6];

  v15[5] = *(id *)MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    v3 = *(void **)(v2 + 8);
  else
    v3 = 0;
  v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, objc_msgSend(v3, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v15);
  v5 = v4;
  if (!v4
    || (-[NSManagedObject setCurrentChangeToken:](v4, "setCurrentChangeToken:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)), -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), (objc_msgSend(*(id *)(a1 + 48), "save:", v15) & 1) == 0))
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Error fetching database metadata update for request: %@\n%@"));
    _NSCoreDataLog(v7 != 0, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]_block_invoke");
    objc_autoreleasePoolPop(v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v15[0];

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
  }
}

uint64_t __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "success"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = *(_QWORD *)(a1 + 48);
      if (v2)
      {
        v3 = *(_QWORD *)(v2 + 64);
        if (v3)
          v4 = *(void **)(v3 + 24);
        else
          v4 = 0;
        v5 = objc_msgSend(v4, "unsignedIntegerValue");
      }
      else
      {
        v5 = 0;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) += v5;
    }
    return -[PFCloudKitImporter processWorkItemsWithCompletion:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  }
  return result;
}

@end
