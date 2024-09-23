@implementation PFCloudKitSchemaGenerator

- (PFCloudKitSchemaGenerator)initWithMirroringOptions:(id)a3 forStoreInMonitor:(id)a4
{
  PFCloudKitSchemaGenerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitSchemaGenerator;
  v6 = -[PFCloudKitSchemaGenerator init](&v8, sel_init);
  if (v6)
  {
    v6->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a3;
    v6->_storeMonitor = (PFCloudKitStoreMonitor *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_representativeFuture = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSchemaGenerator;
  -[PFCloudKitSchemaGenerator dealloc](&v3, sel_dealloc);
}

- (uint64_t)newRepresentativeRecords:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v2 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3052000000;
    v20 = __Block_byref_object_copy__54;
    v21 = __Block_byref_object_dispose__54;
    v22 = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(v2 + 16);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke;
    v16[3] = &unk_1E1EE1988;
    v16[6] = &v17;
    v16[7] = &v23;
    v16[4] = v2;
    v16[5] = v4;
    -[PFCloudKitStoreMonitor performBlock:](v5, (uint64_t)v16);
    if (*((_BYTE *)v24 + 24))
    {
      v2 = objc_msgSend(v4, "copy");
LABEL_10:

      v18[5] = 0;
      _Block_object_dispose(&v17, 8);
      _Block_object_dispose(&v23, 8);
      return v2;
    }
    v6 = (id)v18[5];
    if (v6)
    {
      if (a2)
      {
        v2 = 0;
        *a2 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m";
        v29 = 1024;
        v30 = 124;
        _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v2 = 0;
    goto LABEL_10;
  }
  return v2;
}

void __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectModel *v6;
  id v7;
  _QWORD v8[9];
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2 && *(_BYTE *)(v2 + 21))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, 0);
  }
  else
  {
    v7 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](v2);
    v4 = (id)objc_msgSend(v7, "configurationName");
    v5 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v5, "_setAllowAncillaryEntities:", 1);
    -[NSManagedObjectContext setTransactionAuthor:](v5, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.schemaGenerator"));
    v6 = -[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator"), "managedObjectModel");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke_2;
    v8[3] = &unk_1E1EE1960;
    v8[4] = v4;
    v8[5] = v6;
    v8[6] = *(_QWORD *)(a1 + 32);
    v8[7] = v7;
    v8[8] = v5;
    v10 = *(_QWORD *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 40);
    -[NSManagedObjectContext performBlockAndWait:](v5, "performBlockAndWait:", v8);

  }
}

void __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  PFCloudKitMetadataCache *v14;
  PFCloudKitSerializer *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_msgSend(*(id *)(a1 + 32), "length");
  v6 = *(void **)(a1 + 40);
  if (v5)
    v7 = (void *)objc_msgSend(v6, "entitiesForConfiguration:", *(_QWORD *)(a1 + 32));
  else
    v7 = (void *)objc_msgSend(v6, "entities");
  v8 = v7;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        if (!-[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(_QWORD *)(a1 + 48), *(void **)(*((_QWORD *)&v42 + 1) + 8 * i), *(_QWORD *)(a1 + 56), *(void **)(a1 + 64), v4, 1, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
          v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v36 = v3;
    v37 = v2;
    v14 = objc_alloc_init(PFCloudKitMetadataCache);
    v15 = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:]([PFCloudKitSerializer alloc], "initWithMirroringOptions:metadataCache:recordNamePrefix:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v14, CFSTR("CD_FAKE_"));
    v16 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "insertedObjects"), "allObjects");
    if (objc_msgSend(*(id *)(a1 + 64), "obtainPermanentIDsForObjects:error:", v16, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v39 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
            v22 = (void *)MEMORY[0x18D76B4E4]();
            if (v15
              && (v23 = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]((uint64_t)v15, v21, 1, 1, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))) != 0)
            {
              v24 = v23;
              objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v23);
            }
            else
            {
              v25 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              v24 = 0;
            }

            objc_autoreleasePoolPop(v22);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        }
        while (v18);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to acquire permanent objectIDs during schema generation: %@");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v47 = v35;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Failed to acquire permanent objectIDs during schema generation: %@", buf, 0xCu);
      }
    }

    v3 = v36;
    v2 = v37;
  }

}

- (NSManagedObject)representativeObjectForEntity:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 cache:(int)a6 populate:(uint64_t)a7 error:
{
  NSManagedObject *v14;

  if (!a1)
    return 0;
  v14 = (NSManagedObject *)objc_msgSend(a5, "objectForKey:", objc_msgSend(a2, "name"));
  if (v14)
  {
    if (!a6)
      return v14;
  }
  else
  {
    v14 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", objc_msgSend(a2, "name"), a4);
    objc_msgSend(a4, "assignObject:toPersistentStore:", v14, a3);
    objc_msgSend(a5, "setObject:forKey:", v14, objc_msgSend(a2, "name"));
    if (!a6)
      return v14;
  }
  if (!-[PFCloudKitSchemaGenerator populateValuesOnObject:error:](a1, v14, a7))
    return 0;
  if (!-[PFCloudKitSchemaGenerator populateRelationshipsOnObject:inStore:withCache:error:](a1, v14, a3, (uint64_t)a5, a7))return 0;
  return v14;
}

- (BOOL)populateValuesOnObject:(uint64_t)a3 error:
{
  void *v6;
  _BOOL8 v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!a1)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PFCloudKitSchemaGenerator_populateValuesOnObject_error___block_invoke;
  v9[3] = &unk_1E1EE19B0;
  v9[4] = a2;
  v9[5] = a1;
  v9[6] = &v10;
  v9[7] = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)populateRelationshipsOnObject:(uint64_t)a3 inStore:(uint64_t)a4 withCache:(uint64_t)a5 error:
{
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[11];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  if (!a1)
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = (void *)objc_msgSend(a2, "entity");
  v11 = objc_msgSend(a2, "managedObjectContext");
  v12 = (void *)objc_msgSend(v10, "relationshipsByName");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PFCloudKitSchemaGenerator_populateRelationshipsOnObject_inStore_withCache_error___block_invoke;
  v15[3] = &unk_1E1EE19D8;
  v15[4] = a2;
  v15[5] = a1;
  v15[6] = a3;
  v15[7] = v11;
  v15[8] = a4;
  v15[9] = &v16;
  v15[10] = a5;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  return v13;
}

void __58__PFCloudKitSchemaGenerator_populateValuesOnObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;

  if ((+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a3) & 1) == 0
    && objc_msgSend(a3, "attributeType")
    && objc_msgSend(a3, "attributeType") != 1800
    && (objc_msgSend(a3, "isTransient") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2))
  {
    if (objc_msgSend(a3, "isFileBackedFuture"))
    {
      v8 = *(uint64_t **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v9 = -[PFCloudKitSchemaGenerator createRepresentativeFileBackedFutureInContext:error:](v8, *(_QWORD **)(a1 + 56));
      if (v9)
      {
        v10 = v9;
        objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v9, a2);
        v9 = v10;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a4 = 1;
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", +[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, a3), a2);
    }
  }
}

- (uint64_t)createRepresentativeFileBackedFutureInContext:(uint64_t *)a1 error:(_QWORD *)a2
{
  uint64_t *v2;
  void *v3;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _NSDataFileBackedFuture *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v2 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v23 = 0;
    v3 = (void *)a1[3];
    if (v3)
    {
LABEL_3:
      v2 = v3;
LABEL_16:

      return v2;
    }
    v5 = a1[2];
    if (v5 && *(_BYTE *)(v5 + 21))
    {
      v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, 0);
      v23 = v7;
    }
    else
    {
      v8 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v5);
      v9 = (void *)+[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, v8);
      v10 = (void *)objc_msgSend(CFSTR("Some sample data generated by PFCloudKitSchemaGenerator for a representative file backed future"), "dataUsingEncoding:", 1);
      if (objc_msgSend(v10, "writeToURL:options:error:", v9, 0, &v23))
      {
        v11 = [_NSDataFileBackedFuture alloc];
        v2[3] = (uint64_t)-[_NSDataFileBackedFuture initWithURL:UUID:size:](v11, v9, (void *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), objc_msgSend(v10, "length"));

        v3 = (void *)v2[3];
        goto LABEL_3;
      }
      v12 = v23;

      v7 = v23;
    }
    v13 = v7;
    if (v13)
    {
      if (a2)
      {
        v2 = 0;
        *a2 = v13;
        goto LABEL_16;
      }
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m";
        v26 = 1024;
        v27 = 303;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v2 = 0;
    goto LABEL_16;
  }
  return v2;
}

+ (const)representativeValueFor:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[2];

  objc_opt_self();
  v3 = objc_msgSend(a2, "defaultValue");
  v4 = objc_msgSend(a2, "attributeType");
  if (v3)
    return (const __CFString *)v3;
  if (v4 <= 699)
  {
    if (v4 > 399)
    {
      if (v4 != 400 && v4 != 500 && v4 != 600)
        goto LABEL_24;
      return (const __CFString *)&unk_1E1F52788;
    }
    else
    {
      if (v4 != 100 && v4 != 200 && v4 != 300)
        goto LABEL_24;
      return (const __CFString *)&unk_1E1F4B7E0;
    }
  }
  if (v4 <= 999)
  {
    if (v4 == 700)
      return CFSTR("An example core data string");
    if (v4 == 800)
      return (const __CFString *)MEMORY[0x1E0C9AAB0];
    if (v4 != 900)
    {
LABEL_24:
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unsupported attribute type");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v23);
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v23) = 0;
        v14 = "CoreData: Unsupported attribute type";
        v15 = (uint8_t *)&v23;
LABEL_34:
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, v14, v15, 2u);
        return 0;
      }
      return 0;
    }
    return (const __CFString *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  else
  {
    if (v4 <= 1199)
    {
      if (v4 != 1000)
      {
        if (v4 == 1100)
          return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        goto LABEL_24;
      }
      if (objc_msgSend(a2, "isFileBackedFuture"))
      {
        v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid invocation of this method, it cannot generate a useful value for a file backed future.");
        _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v23);
        v13 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v14 = "CoreData: Invalid invocation of this method, it cannot generate a useful value for a file backed future.";
          v15 = buf;
          goto LABEL_34;
        }
        return 0;
      }
      return (const __CFString *)objc_msgSend(CFSTR("Some example data"), "dataUsingEncoding:", 4);
    }
    if (v4 != 1200)
    {
      if (v4 != 1800)
        goto LABEL_24;
      return (const __CFString *)objc_msgSend(CFSTR("Some example data"), "dataUsingEncoding:", 4);
    }
    return (const __CFString *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://www.apple.com"));
  }
}

uint64_t __83__PFCloudKitSchemaGenerator_populateRelationshipsOnObject_inStore_withCache_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;

  if (objc_msgSend(a3, "isToMany"))
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
    if (!v8 || (result = objc_msgSend(v8, "count")) == 0)
    {
      result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(_QWORD *)(a1 + 40), objc_msgSend(a3, "destinationEntity"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 80));
      if (result)
      {
        v10 = *(void **)(a1 + 32);
        v11 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", result);
        v12 = v10;
        return objc_msgSend(v12, "setValue:forKey:", v11, a2);
      }
      goto LABEL_15;
    }
  }
  else
  {
    v13 = objc_msgSend((id)objc_msgSend(a3, "inverseRelationship"), "isToMany");
    result = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
    if (v13)
    {
      if (result)
        return result;
      result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(_QWORD *)(a1 + 40), objc_msgSend(a3, "destinationEntity"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 80));
      if (result)
      {
        v11 = result;
        v12 = *(void **)(a1 + 32);
        return objc_msgSend(v12, "setValue:forKey:", v11, a2);
      }
      goto LABEL_15;
    }
    if (!result)
    {
      result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(_QWORD *)(a1 + 40), objc_msgSend(a3, "destinationEntity"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 80));
      if (result)
      {
        v14 = (void *)result;
        objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", result, a2);
        result = -[PFCloudKitSchemaGenerator populateValuesOnObject:error:](*(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 80));
        if (!(_DWORD)result
          || (result = -[PFCloudKitSchemaGenerator populateRelationshipsOnObject:inStore:withCache:error:](*(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80)), (result & 1) == 0))
        {
LABEL_15:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
  return result;
}

+ (void)newRepresentativeRecordForStaticFieldsInEntity:(uint64_t)a3 inZoneWithID:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_alloc((Class)getCloudKitCKRecordClass[0]());
  v6 = (void *)objc_msgSend(v5, "initWithRecordType:zoneID:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)a2), a3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "attributesByName", 0), "allValues");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "attributeType");
        if (v13
          && v13 != 2000
          && (+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v12, "attributeType")) & 1) == 0)
        {
          v14 = (__CFString *)+[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, v12);
          if (objc_msgSend(v12, "attributeType") == 1100)
          {
            v15 = -[__CFString UUIDString](v14, "UUIDString");
            goto LABEL_13;
          }
          if (objc_msgSend(v12, "attributeType") == 1200)
          {
            v15 = -[__CFString absoluteString](v14, "absoluteString");
LABEL_13:
            v14 = (__CFString *)v15;
          }
          objc_msgSend(v6, "setObject:forKey:", v14, +[PFCloudKitSerializer applyCDPrefixToName:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v12, "name")));
          continue;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return v6;
}

- (_NSDataFileBackedFuture)representativeFuture
{
  return self->_representativeFuture;
}

@end
