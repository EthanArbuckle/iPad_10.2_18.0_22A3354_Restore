@implementation PFUbiquityStoreSaveSnapshot

- (PFUbiquityStoreSaveSnapshot)init
{
  PFUbiquityStoreSaveSnapshot *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  v2 = -[PFUbiquityStoreSaveSnapshot init](&v4, sel_init);
  if (v2)
  {
    v2->_entityNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_peerIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_globalObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_primaryKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_updatedObjects = 0;
    v2->_deletedObjects = 0;
    v2->_insertedObjects = 0;
    v2->_managedObjectIDToGlobalObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_globalObjectIDToPermanentManagedObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_entityNameToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_peerIDToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_primaryKeyToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_globalObjectIDToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_gidCache = 0;
    *(_OWORD *)&v2->_peerStates = 0u;
    *(_OWORD *)&v2->_exportingPeerID = 0u;
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.snapshot", 0);
  }
  return v2;
}

- (PFUbiquityStoreSaveSnapshot)initWithExportingPeerID:(id)a3
{
  PFUbiquityStoreSaveSnapshot *v4;

  v4 = -[PFUbiquityStoreSaveSnapshot init](self, "init");
  if (v4)
    v4->_exportingPeerID = (NSString *)a3;
  return v4;
}

- (id)initForExport:(id)a3
{
  PFUbiquityStoreSaveSnapshot *v3;

  v3 = -[PFUbiquityStoreSaveSnapshot initWithExportingPeerID:](self, "initWithExportingPeerID:", a3);
  if (v3)
  {
    v3->_insertedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_updatedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_deletedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  self->_entityNames = 0;
  self->_peerIDs = 0;

  self->_globalObjectIDs = 0;
  self->_primaryKeys = 0;

  self->_managedObjectIDToGlobalObjectID = 0;
  self->_globalObjectIDToPermanentManagedObjectID = 0;

  self->_entityNameToIndex = 0;
  self->_peerIDToIndex = 0;

  self->_primaryKeyToIndex = 0;
  self->_insertedObjects = 0;

  self->_updatedObjects = 0;
  self->_deletedObjects = 0;

  self->_peerStates = 0;
  self->_transactionNumber = 0;

  self->_storeKV = 0;
  self->_exportingPeerID = 0;

  self->_localPeerID = 0;
  self->_globalObjectIDToIndex = 0;

  self->_filesInsertedInTransaction = 0;
  self->_filesDeletedInTransaction = 0;

  self->_gidCache = 0;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = queue;
    dispatch_async(queue, block);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  -[PFUbiquityStoreSaveSnapshot dealloc](&v4, sel_dealloc);
}

void __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke_2(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (id)description
{
  void *v3;
  id v4;
  NSMutableArray *entityNames;
  NSMutableArray *peerIDs;
  NSMutableArray *primaryKeys;
  NSMutableArray *globalObjectIDs;
  NSMutableDictionary *managedObjectIDToGlobalObjectID;
  NSMutableDictionary *entityNameToIndex;
  NSMutableDictionary *peerIDToIndex;
  NSMutableDictionary *primaryKeyToIndex;
  NSMutableDictionary *insertedObjects;
  NSMutableDictionary *updatedObjects;
  NSMutableDictionary *deletedObjects;
  NSMutableDictionary *peerStates;
  NSNumber *transactionNumber;
  objc_super v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  v4 = -[PFUbiquityStoreSaveSnapshot description](&v19, sel_description);
  if (self)
  {
    entityNames = self->_entityNames;
    peerIDs = self->_peerIDs;
    globalObjectIDs = self->_globalObjectIDs;
    primaryKeys = self->_primaryKeys;
    managedObjectIDToGlobalObjectID = self->_managedObjectIDToGlobalObjectID;
    entityNameToIndex = self->_entityNameToIndex;
    peerIDToIndex = self->_peerIDToIndex;
    primaryKeyToIndex = self->_primaryKeyToIndex;
    insertedObjects = self->_insertedObjects;
    updatedObjects = self->_updatedObjects;
    deletedObjects = self->_deletedObjects;
    peerStates = self->_peerStates;
    transactionNumber = self->_transactionNumber;
  }
  else
  {
    peerStates = 0;
    updatedObjects = 0;
    primaryKeyToIndex = 0;
    entityNameToIndex = 0;
    primaryKeys = 0;
    peerIDs = 0;
    entityNames = 0;
    globalObjectIDs = 0;
    managedObjectIDToGlobalObjectID = 0;
    peerIDToIndex = 0;
    insertedObjects = 0;
    deletedObjects = 0;
    transactionNumber = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n\tentityNames: %@\n\tpeerIDs: %@\n\tglobalObjectIDs: %@\n\tprimaryKeys: %@\n\tmanagedObjectIDToGlobalObjectID: %@\n\tentityNameToIndex: %@\n\tpeerIDToIndex: %@\n\tprimaryKeyToIndex: %@\n\tinsertedObjects: %@\n\tupdatedObjects: %@\n\tdeletedObjects: %@\n\tpeerStates: %@\n\ttransactionNumber: %@\n"), v4, entityNames, peerIDs, globalObjectIDs, primaryKeys, managedObjectIDToGlobalObjectID, entityNameToIndex, peerIDToIndex, primaryKeyToIndex, insertedObjects, updatedObjects, deletedObjects, peerStates, transactionNumber);
}

- (void)_setFilesDeletedInTransaction:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 152) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 152) = a2;
    }
  }
}

- (uint64_t)checkIndex:(uint64_t)a3 forValue:(uint64_t)a4 fromArrayOfValues:
{
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__51;
  v11 = __Block_byref_object_dispose__51;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PFUbiquityStoreSaveSnapshot_checkIndex_forValue_fromArrayOfValues___block_invoke;
  v6[3] = &unk_1E1EDD4D0;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  dispatch_sync(a1, v6);
  v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __69__PFUbiquityStoreSaveSnapshot_checkIndex_forValue_fromArrayOfValues___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v2);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));

  }
}

- (void)noSyncCheckIndex:(void *)a1 forValue:(uint64_t)a2 fromArrayOfValues:(void *)a3
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(a1, "objectForKey:", a2);
  if (!v6)
  {
    v7 = objc_msgSend(a3, "count");
    objc_msgSend(a3, "addObject:", a2);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v7);
    objc_msgSend(a1, "setObject:forKey:", v6, a2);

  }
  return v6;
}

- (void)globalObjectIDForManagedObject:(uint64_t)a3 withStoreExportContext:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v5 = (void *)objc_msgSend(a2, "objectID");
  objc_msgSend(v5, "isTemporaryID");
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
  if (!v6)
  {
    if (a3 && (v7 = *(_QWORD *)(a3 + 48)) != 0)
      v8 = *(_QWORD *)(v7 + 40);
    else
      v8 = 0;
    v6 = (void *)-[PFUbiquityPeerRangeCache createGlobalObjectIDForManagedObjectID:](v8, v5);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);

  }
  return v6;
}

- (uint64_t)compressedGlobalObjectIDFromGlobalObjectID:(uint64_t)a1
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  if (!a1)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  v11 = 0;
  v2 = *(NSObject **)(a1 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PFUbiquityStoreSaveSnapshot_compressedGlobalObjectIDFromGlobalObjectID___block_invoke;
  block[3] = &unk_1E1EDE1F0;
  block[5] = a2;
  block[6] = &v6;
  block[4] = a1;
  dispatch_sync(v2, block);
  v3 = objc_msgSend((id)v7[5], "stringValue");
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__74__PFUbiquityStoreSaveSnapshot_compressedGlobalObjectIDFromGlobalObjectID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  void *result;

  v2 = a1[4];
  if (v2)
  {
    v3 = (uint64_t *)a1[5];
    v4 = *(void **)(v2 + 56);
    if (v3)
    {
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](v4, v3[2], *(void **)(v2 + 8));
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 64), v3[4], *(void **)(v2 + 16));
      v5 = v3[3];
    }
    else
    {
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](v4, 0, *(void **)(v2 + 8));
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 64), 0, *(void **)(v2 + 16));
      v5 = 0;
    }
    -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 72), v5, *(void **)(v2 + 32));
    result = -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 80), (uint64_t)v3, *(void **)(v2 + 24));
  }
  else
  {
    result = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (uint64_t)globalObjectIDFromCompressedObjectID:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v2 = a1;
  if (a1)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", objc_msgSend(a2, "integerValue"));
    if (v4)
    {
      v5 = (void *)v4;
      v9 = 0;
      v10 = &v9;
      v11 = 0x3052000000;
      v12 = __Block_byref_object_copy__51;
      v13 = __Block_byref_object_dispose__51;
      v14 = 0;
      v6 = *(NSObject **)(v2 + 176);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PFUbiquityStoreSaveSnapshot_globalObjectIDFromCompressedObjectID___block_invoke;
      block[3] = &unk_1E1EDD138;
      block[4] = v2;
      block[5] = v5;
      block[6] = &v9;
      dispatch_sync(v6, block);

      v2 = v10[5];
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to convert compressed object ID string: %@ to index number."), "-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]", 240, v2, a2);
      return 0;
    }
  }
  return v2;
}

unint64_t __68__PFUbiquityStoreSaveSnapshot_globalObjectIDFromCompressedObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t result;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "count");
  result = objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue");
  if (v4 > result)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 24);
    else
      v7 = 0;
    result = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

- (PFUbiquityTransactionEntryLight)addManagedObject:(unsigned int)a3 withTransactionType:(id *)a4 andStoreExportContext:(uint64_t *)a5 withError:
{
  _QWORD *v10;
  void *v11;
  const char *v12;
  id v13;
  PFUbiquityTransactionEntryLight *v14;
  uint64_t v15;
  id v16;
  void *v17;

  if (!a1)
    return 0;
  v10 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, a2, (uint64_t)a4);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v10);
  if (v10)
    objc_setProperty_nonatomic(v10, v12, v11, 48);
  v13 = -[PFUbiquityGlobalObjectID createGlobalIDString](v10);
  v14 = -[PFUbiquityStoreExportContext addTransactionEntryForGlobalID:andTransactionType:](a4, v10, a3);

  v15 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v10);
  v16 = -[PFUbiquityStoreSaveSnapshot createUbiquityDictionary:withStoreExportContext:error:](a1, a2, (uint64_t)a4, a5);
  if (!v16)
    return 0;
  v17 = v16;
  if (a3 <= 2)
    objc_msgSend(*(id *)(a1 + 8 * a3 + 88), "setObject:forKey:", v16, v15);

  return v14;
}

- (id)createUbiquityDictionary:(uint64_t)a3 withStoreExportContext:(uint64_t *)a4 error:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PFUbiquityFileCoordinator *v18;
  PFUbiquityFileCoordinator *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  uint64_t v45;
  id v46;
  id obj;
  id obja;
  void *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[7];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  int v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v51 = a2;
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName"), "allValues");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v71;
    v45 = *MEMORY[0x1E0CB28A8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v71 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "isTransient") & 1) == 0)
        {
          if (objc_msgSend(v11, "attributeType"))
          {
            v12 = objc_msgSend(v11, "name");
            v13 = (id)objc_msgSend(v51, "valueForKey:", v12);
            if (v13)
            {
              if (objc_msgSend(v11, "attributeType") == 1800)
                v13 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v11);
              if (objc_msgSend(v11, "attributeType") != 1000
                || !objc_msgSend(v11, "allowsExternalBinaryDataStorage"))
              {
                goto LABEL_37;
              }
              v14 = a3 ? *(_QWORD **)(a3 + 40) : 0;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_37;
              v13 = (id)-[NSSQLCore _ubiquityDictionaryForAttribute:onObject:](v14, v11, v51);
              if ((unint64_t)objc_msgSend(v13, "count") < 2)
                goto LABEL_37;
              v15 = (void *)objc_msgSend(v13, "valueForKey:", CFSTR("UUID"));
              v16 = (uint64_t)v15;
              if (v14 && objc_msgSend(v15, "length"))
                obj = (id)objc_msgSend((id)objc_msgSend(v14, "externalDataReferencesDirectory"), "stringByAppendingPathComponent:", v16);
              else
                obj = 0;
              v49 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v16, v14);
              v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v49);
              v18 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v49);
              v19 = v18;
              v69 = 0;
              v65 = 0;
              v66 = &v65;
              v67 = 0x2020000000;
              v68 = 0;
              v61 = 0;
              v62 = &v61;
              v63 = 0x2020000000;
              v64 = 0;
              if (v18)
              {
                v60[0] = MEMORY[0x1E0C809B0];
                v60[1] = 3221225472;
                v60[2] = __85__PFUbiquityStoreSaveSnapshot_createUbiquityDictionary_withStoreExportContext_error___block_invoke;
                v60[3] = &unk_1E1EE1788;
                v60[4] = obj;
                v60[5] = &v65;
                v60[6] = &v61;
                -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v18, "coordinateWritingItemAtURL:options:error:byAccessor:", v17, 8, &v69, v60);

              }
              else
              {
                v68 = 0;
              }

              v20 = *((unsigned __int8 *)v66 + 24);
              if (*((_BYTE *)v66 + 24))
              {
                if (!*((_BYTE *)v62 + 24))
                {
                  v21 = *(id *)(a1 + 144);
                  if (!v21)
                  {
                    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    *(_QWORD *)(a1 + 144) = v21;
                  }
                  objc_msgSend(v21, "addObject:", v49);
                }
                goto LABEL_36;
              }

              v22 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v45, 134030, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Failed to copy external reference to ubiquity container"), CFSTR("Underlying error")));
              if (v22)
              {
                if (a4)
                {
                  v46 = 0;
                  *a4 = v22;
LABEL_36:
                  _Block_object_dispose(&v61, 8);
                  _Block_object_dispose(&v65, 8);
                  if (!v20)
                    return 0;
LABEL_37:
                  if (v13)
                    objc_msgSend(v46, "setObject:forKey:", v13, v12);
                  goto LABEL_39;
                }
              }
              else
              {
                v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityStoreSaveSnapshot.m");
                v30 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v77 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/"
                        "PFUbiquityStoreSaveSnapshot.m";
                  v78 = 1024;
                  v79 = 599;
                  _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
              v46 = 0;
              goto LABEL_36;
            }
          }
        }
LABEL_39:
        ++v10;
      }
      while (v8 != v10);
      v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      v8 = v31;
    }
    while (v31);
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obja = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "entity"), "relationshipsByName"), "allValues");
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
  if (v32)
  {
    v50 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v57 != v50)
          objc_enumerationMutation(obja);
        v34 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v35 = objc_msgSend(v34, "name");
        v36 = (void *)objc_msgSend(v51, "valueForKey:", v35);
        if (v36 && (objc_msgSend(v34, "isTransient") & 1) == 0)
        {
          if (objc_msgSend(v34, "isToMany"))
          {
            v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
            if (v38)
            {
              v39 = *(_QWORD *)v53;
              do
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v53 != v39)
                    objc_enumerationMutation(v36);
                  v41 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, *(void **)(*((_QWORD *)&v52 + 1) + 8 * j), a3);
                  objc_msgSend(v37, "addObject:", -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v41));
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
              }
              while (v38);
            }
          }
          else
          {
            v42 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, v36, a3);
            v37 = (void *)-[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v42);
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got final value for relationship: %@\n%@\nObject: %@"), "-[PFUbiquityStoreSaveSnapshot createUbiquityDictionary:withStoreExportContext:error:]", 647, v35, v37, v51);
          objc_msgSend(v46, "setObject:forKey:", v37, v35);
        }
      }
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
    }
    while (v32);
  }
  return v46;
}

- (void)reserveTransactionNumberWithStoreExportContext:(_QWORD *)a1
{
  id Property;
  id *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  if (a1)
  {
    if (a2)
    {
      Property = *(id *)(a2 + 48);
      if (Property)
        Property = objc_getProperty(Property, (SEL)a2, 64, 1);
    }
    else
    {
      Property = 0;
    }
    v5 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByIncrementingPeerWithID:]((uint64_t)Property, a1[16]);
    a1[20] = v5;
    if (v5)
      v5 = (id *)objc_msgSend(v5[1], "objectForKey:", a1[16]);
    a1[15] = v5;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      v7 = a1[20];
      if (a2)
      {
        v8 = *(id *)(a2 + 48);
        if (v8)
          v8 = objc_getProperty(v8, v6, 64, 1);
      }
      else
      {
        v8 = 0;
      }
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nReserved transaction knowledge vector: %@ (%@)"), "-[PFUbiquityStoreSaveSnapshot reserveTransactionNumberWithStoreExportContext:]", 293, a1, v7, v8);
    }
  }
}

- (uint64_t)generatePeerStates
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    *(_QWORD *)(result + 112) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGenerating Peer States: %@"), "-[PFUbiquityStoreSaveSnapshot generatePeerStates]", 300, v1, *(_QWORD *)(v1 + 160));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = *(_QWORD *)(v1 + 160);
    if (v2)
      v3 = (void *)objc_msgSend(*(id *)(v2 + 8), "allKeys");
    else
      v3 = 0;
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v13;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
          if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(v1 + 136)) & 1) == 0)
          {
            v8 = (void *)-[PFUbiquityStoreSaveSnapshot checkIndex:forValue:fromArrayOfValues:](*(NSObject **)(v1 + 176), *(_QWORD *)(v1 + 64), (uint64_t)v7, *(_QWORD *)(v1 + 16));
            v9 = *(void **)(v1 + 112);
            v10 = *(_QWORD *)(v1 + 160);
            if (v10)
              v11 = objc_msgSend(*(id *)(v10 + 8), "objectForKey:", v7);
            else
              v11 = 0;
            objc_msgSend(v9, "setObject:forKey:", v11, objc_msgSend(v8, "stringValue"));
          }
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)resetFromOptimisticLockingException
{
  if (a1)
  {

    a1[20] = 0;
    a1[15] = 0;

    a1[14] = 0;
  }
}

- (PFUbiquityKnowledgeVector)createKnowledgeVectorFromPeerStates
{
  PFUbiquityKnowledgeVector *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setObject:forKey:", v1[3]._hash, v1[4].super.isa);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v1->_storeKVDict);
    v4 = -[NSDictionary count](v1->_storeKVDict, "count");
    v5 = v4 - -[NSDictionary containsObject:](v1->_storeKVDict, "containsObject:", v1[4].super.isa);
    if (-[NSDictionary count](v1[3]._storeKVDict, "count") != v5)
      objc_msgSend(v3, "addObjectsFromArray:", -[NSDictionary allKeys](v1[3]._storeKVDict, "allKeys"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v3);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = -[PFUbiquityStoreSaveSnapshot transactionNumberFromPeerStates:]((uint64_t)v1, (void *)-[objc_class objectForKey:](v1[2].super.isa, "objectForKey:", v10));
          if (!v11)
          {
            v11 = -[NSDictionary objectForKey:](v1[3]._storeKVDict, "objectForKey:", v10);
            if (!v11)
              continue;
          }
          objc_msgSend(v2, "setObject:forKey:", v11, v10);
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    v1 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorDictionary:", v2);

  }
  return v1;
}

- (uint64_t)transactionNumberFromPeerStates:(uint64_t)result
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(a2, "isNSString"))
      v4 = a2;
    else
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), a2);
    v5 = v4;
    v6 = objc_msgSend(*(id *)(v3 + 112), "objectForKey:", v4);

    return v6;
  }
  return result;
}

- (id)setTransactionNumber:(void *)a3 peerStates:(void *)a4 andPeerIDs:
{
  id *v6;
  void *v7;
  unint64_t i;
  uint64_t v9;
  void *v10;

  if (result)
  {
    v6 = result;
    objc_setProperty_nonatomic(result, newValue, newValue, 120);

    v6[14] = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v6[8], "removeAllObjects");
    v7 = (void *)objc_msgSend(a4, "mutableCopy");
    v6[2] = v7;
    result = (id *)objc_msgSend(v7, "count");
    if (result)
    {
      for (i = 0; i < (unint64_t)result; ++i)
      {
        v9 = objc_msgSend(v6[2], "objectAtIndex:", i);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", i);
        objc_msgSend(v6[8], "setObject:forKey:", v10, v9);

        result = (id *)objc_msgSend(v6[2], "count");
      }
    }
  }
  return result;
}

- (void)setEntityNames:(uint64_t)a1 globalObjectIDs:(void *)a2 primaryKeys:(void *)a3 forStoreName:(uint64_t)a4 withRootLocation:(uint64_t)a5
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  PFUbiquityGlobalObjectIDCache *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PFUbiquityGlobalObjectID *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(a2);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13), "copy");
          objc_msgSend(*(id *)(a1 + 8), "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v15 = 0;
      do
      {
        v16 = objc_msgSend(*(id *)(a1 + 8), "objectAtIndex:", v15);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v15);
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v17, v16);

        ++v15;
      }
      while (v15 < objc_msgSend(*(id *)(a1 + 8), "count"));
    }
    objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "setArray:", a4);
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v18 = 0;
      do
      {
        v19 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v18);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v18);
        objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v20, v19);

        ++v18;
      }
      while (v18 < objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    v21 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__PFUbiquityStoreSaveSnapshot_setEntityNames_globalObjectIDs_primaryKeys_forStoreName_withRootLocation___block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = a1;
    dispatch_sync(v21, block);
    v22 = (PFUbiquityGlobalObjectIDCache *)*(id *)(a1 + 168);
    if (!v22)
      v22 = -[PFUbiquityGlobalObjectIDCache initWithLocalPeerID:forStoreName:]([PFUbiquityGlobalObjectIDCache alloc], "initWithLocalPeerID:forStoreName:", *(_QWORD *)(a1 + 136), a5);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v29;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(a3);
          v27 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForCompressedString:withEntityNames:primaryKeys:peerIDs:]((PFUbiquityGlobalObjectID *)v22, *(void **)(*((_QWORD *)&v28 + 1) + 8 * v26), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 16));
          if (v27)
            -[PFUbiquityStoreSaveSnapshot checkIndex:forValue:fromArrayOfValues:](*(NSObject **)(a1 + 176), *(_QWORD *)(a1 + 80), (uint64_t)v27, *(_QWORD *)(a1 + 24));

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v24);
    }

  }
}

unint64_t __104__PFUbiquityStoreSaveSnapshot_setEntityNames_globalObjectIDs_primaryKeys_forStoreName_withRootLocation___block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t i;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndex:", i);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", i);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v5, v4);

      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    }
  }
  return result;
}

- (void)replaceGlobalObjectID:(uint64_t)a3 withGlobalObjectID:
{
  NSObject *v3;
  _QWORD block[7];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PFUbiquityStoreSaveSnapshot_replaceGlobalObjectID_withGlobalObjectID___block_invoke;
    block[3] = &unk_1E1EDD790;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_sync(v3, block);
  }
}

void __72__PFUbiquityStoreSaveSnapshot_replaceGlobalObjectID_withGlobalObjectID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 24);
  if (v2 && (v3 = objc_msgSend(v2, "indexOfObject:", a1[5]), v3 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = v3;
    if (objc_msgSend(*(id *)(a1[4] + 24), "count"))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ replacing global object id:\n\told: %@\n\tnew: %@"), "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 492, a1[4], a1[5], a1[6]);
      objc_msgSend(*(id *)(a1[4] + 24), "replaceObjectAtIndex:withObject:", v4, a1[6]);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v4);
      objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
      objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKey:", v5, a1[6]);

    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Hrm found something in empty array did you? %@\n\ti: %lu\n\tNSNotFound: %lu"), "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 488, *(_QWORD *)(a1[4] + 24), v4, 0x7FFFFFFFFFFFFFFFLL);
      __break(1u);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ wasn't in this snapshot: %@"), "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 507, a1[5], a1[4]);
  }
}

- (void)finishGlobalIDReplacement
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__51;
    v16 = __Block_byref_object_dispose__51;
    v17 = 0;
    v2 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PFUbiquityStoreSaveSnapshot_finishGlobalIDReplacement__block_invoke;
    block[3] = &unk_1E1EDD618;
    block[4] = a1;
    block[5] = &v12;
    dispatch_sync(v2, block);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)v13[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i));
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
      }
      while (v4);
    }
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __56__PFUbiquityStoreSaveSnapshot_finishGlobalIDReplacement__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __85__PFUbiquityStoreSaveSnapshot_createUbiquityDictionary_withStoreExportContext_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v4;
  int v5;
  id result;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char v12;

  v4 = objc_msgSend((id)objc_msgSend(a2, "path"), "stringByDeletingLastPathComponent");
  v12 = 0;
  v11 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v4, &v12) & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
  v10 = 0;
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", a1[4], objc_msgSend(a2, "path"), &v10);
  result = v10;
  if (v5)
    v7 = v10 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v9 = a1[5];
    goto LABEL_11;
  }
  v8 = (void *)objc_msgSend(v10, "domain");
  result = (id)objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
  if ((_DWORD)result)
  {
    result = (id)objc_msgSend(v10, "code");
    if (result == (id)516)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      v9 = a1[6];
LABEL_11:
      *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    }
  }
  return result;
}

@end
