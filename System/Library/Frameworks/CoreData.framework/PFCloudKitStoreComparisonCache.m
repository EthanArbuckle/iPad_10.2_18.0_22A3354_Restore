@implementation PFCloudKitStoreComparisonCache

- (PFCloudKitStoreComparisonCache)initWithStore:(id)a3 otherStore:(id)a4
{
  PFCloudKitStoreComparisonCache *v6;
  NSManagedObjectContext *storeMoc;
  void *v8;
  uint64_t v9;
  NSManagedObjectContext *otherStoreMoc;
  void *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PFCloudKitStoreComparisonCache;
  v6 = -[PFCloudKitStoreComparisonCache init](&v14, sel_init);
  if (v6)
  {
    v6->_store = (NSPersistentStore *)a3;
    v6->_otherStore = (NSPersistentStore *)a4;
    v6->_storeMoc = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v6->_storeMoc, "setPersistentStoreCoordinator:", objc_msgSend(a3, "persistentStoreCoordinator"));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v6->_storeMoc, "_setAllowAncillaryEntities:", 1);
    storeMoc = v6->_storeMoc;
    v16[0] = objc_msgSend(a3, "identifier");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    if (storeMoc)
    {
      v9 = objc_msgSend(v8, "copy");

      storeMoc->_persistentStoreIdentifiers = (NSArray *)v9;
    }
    v6->_otherStoreMoc = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v6->_otherStoreMoc, "setPersistentStoreCoordinator:", objc_msgSend(a4, "persistentStoreCoordinator"));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v6->_otherStoreMoc, "_setAllowAncillaryEntities:", 1);
    otherStoreMoc = v6->_otherStoreMoc;
    v15 = objc_msgSend(a4, "identifier");
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    if (otherStoreMoc)
    {
      v12 = objc_msgSend(v11, "copy");

      otherStoreMoc->_persistentStoreIdentifiers = (NSArray *)v12;
    }
    v6->_storeUUIDToStoreCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeUUIDToStoreCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparisonCache;
  -[PFCloudKitStoreComparisonCache dealloc](&v3, sel_dealloc);
}

- (BOOL)populate:(id *)a3
{
  NSObject *v4;
  PFCloudKitStoreComparisonCacheStoreCache *v5;
  PFCloudKitStoreComparisonCacheStoreCache *v6;
  PFCloudKitStoreComparisonCacheStoreCache *v7;
  PFCloudKitStoreComparisonCacheStoreCache *v8;
  NSManagedObjectContext *storeMoc;
  uint64_t v10;
  NSManagedObjectContext *otherStoreMoc;
  dispatch_time_t v12;
  void *v13;
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
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  char v36;
  uint64_t v38;
  _QWORD v40[9];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  _QWORD v47[9];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  const __CFString *v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[4];

  v65[1] = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v4 = dispatch_group_create();
  v5 = objc_alloc_init(PFCloudKitStoreComparisonCacheStoreCache);
  v6 = v5;
  if (v5)
    v5->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  -[NSMutableDictionary setObject:forKey:](self->_storeUUIDToStoreCache, "setObject:forKey:", v5, -[NSPersistentStore identifier](self->_store, "identifier"));
  v7 = objc_alloc_init(PFCloudKitStoreComparisonCacheStoreCache);
  v8 = v7;
  if (v7)
    v7->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  -[NSMutableDictionary setObject:forKey:](self->_storeUUIDToStoreCache, "setObject:forKey:", v7, -[NSPersistentStore identifier](self->_otherStore, "identifier"));
  v48 = 0;
  v49 = &v48;
  v50 = 0x3052000000;
  v51 = __Block_byref_object_copy__14;
  v52 = __Block_byref_object_dispose__14;
  v53 = 0;
  dispatch_group_enter(v4);
  storeMoc = self->_storeMoc;
  v10 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke;
  v47[3] = &unk_1E1EDE670;
  v47[4] = v6;
  v47[5] = self;
  v47[7] = &v48;
  v47[8] = &v54;
  v47[6] = v4;
  -[NSManagedObjectContext performBlock:](storeMoc, "performBlock:", v47);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__14;
  v45 = __Block_byref_object_dispose__14;
  v46 = 0;
  dispatch_group_enter(v4);
  otherStoreMoc = self->_otherStoreMoc;
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2;
  v40[3] = &unk_1E1EDE670;
  v40[4] = v8;
  v40[5] = self;
  v40[7] = &v41;
  v40[8] = &v54;
  v40[6] = v4;
  -[NSManagedObjectContext performBlock:](otherStoreMoc, "performBlock:", v40);
  v12 = dispatch_time(0, 180000000000);
  if (dispatch_group_wait(v4, v12))
  {
    *((_BYTE *)v55 + 24) = 0;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v64 = *MEMORY[0x1E0CB2D68];
    v65[0] = CFSTR("Failed to intialize caches in a reasonable amount of time.");
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v15 = (void *)objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v14);
  }
  else
  {
    if (*((_BYTE *)v55 + 24))
      goto LABEL_22;
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v16;
    if (v49[5])
      objc_msgSend(v16, "addObject:");
    if (v42[5])
      objc_msgSend(v17, "addObject:");
    if (!objc_msgSend(v17, "count"))
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Stores failed to initialize but did not return an error.");
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, v38);
      v25 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Stores failed to initialize but did not return an error.", buf, 2u);
      }
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v62 = CFSTR("NSDetailedErrors");
    v63 = v17;
    v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v15 = (void *)objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v27);

  }
  if (!*((_BYTE *)v55 + 24))
  {
    if (v15)
    {
      if (a3)
        *a3 = v15;
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m");
      v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m";
        v60 = 1024;
        v61 = 163;
        _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
LABEL_22:

  v49[5] = 0;
  v42[5] = 0;

  v36 = *((_BYTE *)v55 + 24);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  return v36;
}

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke(uint64_t a1)
{
  id v2;

  if ((-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 40) + 24), *(void **)(*(_QWORD *)(a1 + 40) + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2(uint64_t a1)
{
  id v2;

  if ((-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 40) + 32), *(void **)(*(_QWORD *)(a1 + 40) + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)mirroredRelationshipForObject:(id)a3 relatedToObject:(id)a4 byRelationship:(id)a5
{
  uint64_t v7;
  _QWORD *v8;

  v7 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(-[PFCloudKitStoreComparisonCache recordIDForObjectID:](self, "recordIDForObjectID:", objc_msgSend(a3, "objectID")), "recordName"), objc_msgSend(-[PFCloudKitStoreComparisonCache recordIDForObjectID:](self, "recordIDForObjectID:", objc_msgSend(a4, "objectID")), "recordName"), (uint64_t)a5, objc_msgSend(a5, "inverseRelationship"));
  v8 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore"), "identifier"));
  if (v8)
    v8 = (_QWORD *)v8[3];
  return (id)objc_msgSend(v8, "objectForKey:", v7);
}

- (id)mtmKeysForStore:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  if (v4)
    return v4;
  else
    return (id)NSSet_EmptySet;
}

- (id)recordIDsRelatedToRecordID:(id)a3 byRelationshipNamed:(id)a4 inStore:(id)a5
{
  _QWORD *v7;
  id result;

  v7 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a5, "identifier"));
  if (v7)
    v7 = (_QWORD *)v7[6];
  result = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", a3), "objectForKey:", a4);
  if (!result)
    return (id)NSSet_EmptySet;
  return result;
}

- (id)metadataForObjectWithID:(id)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4)
    v4 = (_QWORD *)v4[8];
  return (id)objc_msgSend(v4, "objectForKey:", a3);
}

- (id)recordIdsForStore:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (v3)
    v4 = *(void **)(v3 + 72);
  else
    v4 = 0;
  if (v4)
    return v4;
  else
    return (id)NSSet_EmptySet;
}

- (id)objectIDForRecordID:(id)a3 inStore:(id)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a4, "identifier"));
  if (v5)
    v5 = (_QWORD *)v5[10];
  return (id)objc_msgSend(v5, "objectForKey:", a3);
}

- (id)recordIDForObjectID:(id)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4)
    v4 = (_QWORD *)v4[11];
  return (id)objc_msgSend(v4, "objectForKey:", a3);
}

- (id)identityRecordNameForStoreWithIdentifier:(id)a3
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", a3);
  if (result)
    return (id)*((_QWORD *)result + 16);
  return result;
}

- (int64_t)databaseScopeForStoreWithIdentifier:(id)a3
{
  _QWORD *v3;

  v3 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", a3);
  if (v3)
    v3 = (_QWORD *)v3[17];
  return objc_msgSend(v3, "unsignedIntegerValue");
}

- (id)sharedZoneIDsForStore:(id)a3
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (result)
    return (id)*((_QWORD *)result + 13);
  return result;
}

- (id)mtmKeysForRecordZone:(id)a3 inStore:(id)a4
{
  _QWORD *v5;
  id result;

  v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a4, "identifier"));
  if (v5)
    v5 = (_QWORD *)v5[5];
  result = (id)objc_msgSend(v5, "objectForKey:", a3);
  if (!result)
    return (id)NSSet_EmptySet;
  return result;
}

- (id)objectIDForIdentifier:(id)a3 inStore:(id)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a4, "identifier"));
  if (v5)
    v5 = (_QWORD *)v5[2];
  return (id)objc_msgSend(v5, "objectForKey:", a3);
}

- (id)identifiersForStore:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  if (v4)
    return v4;
  else
    return (id)NSSet_EmptySet;
}

- (id)metadataForRecordID:(id)a3 inStore:(id)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend(a4, "identifier"));
  if (v5)
    v5 = (_QWORD *)v5[7];
  return (id)objc_msgSend(v5, "objectForKeyedSubscript:", a3);
}

- (id)deriveIdentifierForNonCloudObjectID:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "URIRepresentation");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend((id)objc_msgSend(v3, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v3, "lastPathComponent"));
}

- (void)_setCheckCloudKitMetadata:(BOOL)a3
{
  self->_checkCloudKitMetadata = a3;
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (NSPersistentStore)otherStore
{
  return self->_otherStore;
}

- (NSManagedObjectContext)storeMoc
{
  return self->_storeMoc;
}

- (NSManagedObjectContext)otherStoreMoc
{
  return self->_otherStoreMoc;
}

- (BOOL)checkCloudKitMetadata
{
  return self->_checkCloudKitMetadata;
}

@end
