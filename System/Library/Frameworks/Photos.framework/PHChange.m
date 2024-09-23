@implementation PHChange

+ (void)pl_simulateChangeWithAssetContainerList:(id)a3 photoLibrary:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  +[PHFetchResult pl_fetchResultForAssetContainerList:photoLibrary:](PHFetchResult, "pl_fetchResultForAssetContainerList:photoLibrary:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PHChange_PHAdoptionUtilities__pl_simulateChangeWithAssetContainerList_photoLibrary_handler___block_invoke;
  v12[3] = &unk_1E35D8420;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "preloadSimulatedChangeDetailsForManualFetchResults:handler:", v10, v12);

}

uint64_t __94__PHChange_PHAdoptionUtilities__pl_simulateChangeWithAssetContainerList_photoLibrary_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PHChange)init
{
  PHChange *v2;
  uint64_t v3;
  NSMapTable *changeHandlingMap;
  uint64_t v5;
  NSMutableDictionary *changeDetailsForObjects;
  uint64_t v7;
  NSMutableDictionary *collectionChangeDetailsForObjects;
  uint64_t v9;
  NSMutableDictionary *objectIDsByLocalIdentifier;
  dispatch_queue_t v11;
  OS_dispatch_queue *changeDetailIsolation;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHChange;
  v2 = -[PHChange init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    changeHandlingMap = v2->_changeHandlingMap;
    v2->_changeHandlingMap = (NSMapTable *)v3;

    v5 = objc_opt_new();
    changeDetailsForObjects = v2->_changeDetailsForObjects;
    v2->_changeDetailsForObjects = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    collectionChangeDetailsForObjects = v2->_collectionChangeDetailsForObjects;
    v2->_collectionChangeDetailsForObjects = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    objectIDsByLocalIdentifier = v2->_objectIDsByLocalIdentifier;
    v2->_objectIDsByLocalIdentifier = (NSMutableDictionary *)v9;

    v11 = dispatch_queue_create("PHChange", 0);
    changeDetailIsolation = v2->_changeDetailIsolation;
    v2->_changeDetailIsolation = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 library:(id)a5
{
  return -[PHChange initWithChangedIdentifiers:unknownMergeEvent:changeToken:library:](self, "initWithChangedIdentifiers:unknownMergeEvent:changeToken:library:", a3, a4, 0, a5);
}

- (PHChange)initWithCloudStatus:(id)a3 library:(id)a4
{
  id v7;
  PHChange *v8;
  PHChange *v9;

  v7 = a3;
  v8 = -[PHChange initWithChangedIdentifiers:unknownMergeEvent:changeToken:library:](self, "initWithChangedIdentifiers:unknownMergeEvent:changeToken:library:", MEMORY[0x1E0C9AA70], 0, 0, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cloudStatus, a3);

  return v9;
}

- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 changeToken:(id)a5 library:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PHChange *v19;
  uint64_t v21;

  v10 = *MEMORY[0x1E0C97870];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D72EC8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D72ED0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v21) = a4;
  v19 = -[PHChange initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:](self, "initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:", v14, v15, v16, 0, 0, v17, v18, v21, v12, 0, v11, 0, 0);

  return v19;
}

- (PHChange)initWithInsertedObjectIDs:(id)a3 updatedObjectIDs:(id)a4 deletedObjectIDs:(id)a5 deletedUuidsByObjectId:(id)a6 deletedPrimaryLabelCodesByOID:(id)a7 changedAttributesByOID:(id)a8 changedRelationshipsByOID:(id)a9 unknownMergeEvent:(BOOL)a10 changeToken:(id)a11 fetchOptions:(id)a12 library:(id)a13 managedObjectContext:(id)a14 enumerationContext:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PHChange *v25;
  PHChange *v26;
  uint64_t v27;
  NSDictionary *deletedUuidsByObjectId;
  uint64_t v29;
  NSDictionary *deletedPrimaryLabelCodesByObjectId;
  id v31;
  void *v32;
  uint64_t v33;
  PLSortedChangedObjects *sortedChangedObjectIDs;
  uint64_t v35;
  NSMutableDictionary *updatedObjectsChangedAttributesByEntityName;
  uint64_t v37;
  NSMutableDictionary *updatedObjectsChangedRelationshipsByEntityName;
  id v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v47 = a3;
  v41 = a4;
  v46 = a4;
  v45 = a5;
  v48 = a6;
  v49 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v44 = a12;
  v43 = a13;
  v23 = a14;
  v24 = a15;
  v25 = -[PHChange init](self, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_insertedObjectIDs, a3);
    objc_storeStrong((id *)&v26->_changedObjectIDs, v41);
    objc_storeStrong((id *)&v26->_deletedObjectIDs, a5);
    v27 = objc_msgSend(v48, "copy");
    deletedUuidsByObjectId = v26->_deletedUuidsByObjectId;
    v26->_deletedUuidsByObjectId = (NSDictionary *)v27;

    v29 = objc_msgSend(v49, "copy");
    deletedPrimaryLabelCodesByObjectId = v26->_deletedPrimaryLabelCodesByObjectId;
    v26->_deletedPrimaryLabelCodesByObjectId = (NSDictionary *)v29;

    objc_storeStrong((id *)&v26->_changedAttributesByOID, a8);
    objc_storeStrong((id *)&v26->_changedRelationshipsByOID, a9);
    v26->_unknownMergeEvent = a10;
    objc_storeStrong((id *)&v26->_changeToken, a11);
    objc_storeStrong((id *)&v26->_fetchOptions, a12);
    objc_storeStrong((id *)&v26->_context, a14);
    objc_storeStrong((id *)&v26->_enumerationContext, a15);
    objc_storeStrong((id *)&v26->_library, a13);
    v31 = objc_alloc(MEMORY[0x1E0D71B40]);
    -[NSSet allObjects](v26->_changedObjectIDs, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithChangedObjects:", v32);
    sortedChangedObjectIDs = v26->_sortedChangedObjectIDs;
    v26->_sortedChangedObjectIDs = (PLSortedChangedObjects *)v33;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    updatedObjectsChangedAttributesByEntityName = v26->_updatedObjectsChangedAttributesByEntityName;
    v26->_updatedObjectsChangedAttributesByEntityName = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = objc_claimAutoreleasedReturnValue();
    updatedObjectsChangedRelationshipsByEntityName = v26->_updatedObjectsChangedRelationshipsByEntityName;
    v26->_updatedObjectsChangedRelationshipsByEntityName = (NSMutableDictionary *)v37;

  }
  return v26;
}

- (BOOL)hasIncrementalChanges
{
  return !self->_unknownMergeEvent;
}

- (id)insertedObjectIDs
{
  return self->_insertedObjectIDs;
}

- (id)updatedObjectIDs
{
  return self->_changedObjectIDs;
}

- (id)deletedObjectIDs
{
  return self->_deletedObjectIDs;
}

- (id)changedAttributesByOID
{
  return self->_changedAttributesByOID;
}

- (id)changedRelationshipsByOID
{
  return self->_changedRelationshipsByOID;
}

- (unint64_t)totalChangeCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[PHChange insertedObjectIDs](self, "insertedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PHChange updatedObjectIDs](self, "updatedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[PHChange deletedObjectIDs](self, "deletedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v6 + v4 + v8;
}

- (PHPhotoLibraryCloudStatus)cloudStatus
{
  PHPhotoLibraryCloudStatus *v3;

  v3 = self->_cloudStatus;
  if (!v3)
  {
    -[PHPhotoLibrary cloudStatus](self->_library, "cloudStatus");
    v3 = (PHPhotoLibraryCloudStatus *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)hasCloudStatusChanges
{
  return self->_cloudStatus != 0;
}

- (BOOL)wasFetchResultRefetched:(id)a3
{
  return -[NSSet containsObject:](self->_refetchedFetchResults, "containsObject:", a3);
}

- (void)_prepareCachedValuesForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSSet *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_updatedObjectsChangedAttributesByEntityName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v22 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_changedObjectIDs;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v13, "entity", v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isKindOfEntity:", v4);

          if (v15)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "unsignedLongLongValue");

            v10 |= v17;
            -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedLongLongValue");

            v9 |= v19;
          }
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedObjectsChangedAttributesByEntityName, "setObject:forKeyedSubscript:", v20, v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedObjectsChangedRelationshipsByEntityName, "setObject:forKeyedSubscript:", v21, v22);

  }
}

- (BOOL)anyUpdatedObjectsWithChangedAttributes:(unint64_t)a3 ofEntity:(id)a4
{
  id v6;
  PHChange *v7;
  NSMutableDictionary *updatedObjectsChangedAttributesByEntityName;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[PHChange _prepareCachedValuesForEntity:](v7, "_prepareCachedValuesForEntity:", v6);
  updatedObjectsChangedAttributesByEntityName = v7->_updatedObjectsChangedAttributesByEntityName;
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](updatedObjectsChangedAttributesByEntityName, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  objc_sync_exit(v7);
  return (v11 & a3) != 0;
}

- (BOOL)anyUpdatedObjectsWithChangedRelationships:(unint64_t)a3 ofEntity:(id)a4
{
  id v6;
  PHChange *v7;
  NSMutableDictionary *updatedObjectsChangedRelationshipsByEntityName;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[PHChange _prepareCachedValuesForEntity:](v7, "_prepareCachedValuesForEntity:", v6);
  updatedObjectsChangedRelationshipsByEntityName = v7->_updatedObjectsChangedRelationshipsByEntityName;
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](updatedObjectsChangedRelationshipsByEntityName, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  objc_sync_exit(v7);
  return (v11 & a3) != 0;
}

- (void)preloadSimulatedChangeDetailsForManualFetchResults:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PHChange *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  PHChange *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke;
  v21 = &unk_1E35DFAF8;
  v22 = v6;
  v23 = self;
  v24 = v8;
  v10 = v6;
  pl_dispatch_sync();
  +[PHChange handlerQueue](PHChange, "handlerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_3;
  v14[3] = &unk_1E35DF3B8;
  v16 = self;
  v17 = v7;
  v15 = v24;
  v12 = v7;
  v13 = v24;
  dispatch_async(v11, v14);

}

- (void)preloadChangeDetailsForFetchResults:(id)a3 inManagedObjectContext:(id)a4 handler:(id)a5
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSSet *v50;
  NSSet *refetchedFetchResults;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  os_signpost_id_t spid;
  void *context;
  unint64_t v64;
  NSObject *v65;
  void (**v66)(id, PHChange *);
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  int v72;
  id v73;
  id obj;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  PHChange *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v73 = a4;
  v66 = (void (**)(id, PHChange *))a5;
  context = (void *)MEMORY[0x19AEBEADC]();
  PLChangeHandlingGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  spid = v8;
  v64 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    v98 = (PHChange *)objc_msgSend(v67, "count");
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PreloadChangeDetails", "fetch results: %tu", buf, 0xCu);
  }
  v65 = v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_unknownMergeEvent)
  {
    objc_msgSend(v75, "unionSet:", v67);
    goto LABEL_55;
  }
  v72 = PLIsPhotosAppAnyPlatform();
  v76 = MEMORY[0x19AEBDFF0]();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v67;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
  if (v11)
  {
    v77 = *(_QWORD *)v92;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v92 != v77)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEBEADC]();
        v15 = objc_msgSend(v13, "possibleChangesForChange:propertiesFetchResult:", self, 0);
        if (v15)
        {
          if (v15 != 8
            || (objc_msgSend(v13, "fetchedObjectIDs"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "count") == 0,
                v16,
                v17))
          {
            objc_msgSend(v13, "query");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "fetchRequest");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "entity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "filteringKeys");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            v24 = v76;
            if (v72)
              v24 = objc_msgSend(v22, "containsObject:", CFSTR("activeLibraryScopeParticipationState")) | v76;
            if (v73
              && v23
              && v24
              && (objc_msgSend(MEMORY[0x1E0D71A28], "includesToManyRelationship:entity:", v23, v21) & 1) == 0
              && !objc_msgSend(v18, "requiresFullRefetchForChange:", self))
            {
              objc_msgSend(v20, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectForKeyedSubscript:", v25);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              if (!v26)
              {
                v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v20, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "setObject:forKeyedSubscript:", v26, v27);

              }
              objc_msgSend(v26, "unionSet:", v23);
              objc_msgSend(v68, "addObject:", v13);
              objc_msgSend(v69, "addObject:", v20);

            }
            else
            {
              objc_msgSend(v75, "addObject:", v13);
            }

          }
          else
          {
            objc_msgSend(v71, "addObject:", v13);
          }
        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v11 != v12);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
      v11 = v28;
    }
    while (v28);
  }

  -[PHChange _insertedOrUpdatedObjectIDsMatchingEntities:](self, "_insertedOrUpdatedObjectIDsMatchingEntities:", v69);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v29;
  if ((unint64_t)objc_msgSend(v29, "count") >= 0x7D1)
  {
    PLPhotoKitGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 134218754;
      v98 = self;
      v99 = 2048;
      v100 = v31;
      v101 = 2048;
      v102 = 2000;
      v103 = 2112;
      v104 = v29;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_INFO, "PHChange:%p: preloadChangeDetails too many objects for second pass: %lu > %ld, refetching. objects:%@", buf, 0x2Au);
    }

    objc_msgSend(v75, "unionSet:", v68);
    goto LABEL_54;
  }
  if (objc_msgSend(v29, "count"))
  {
    -[PHChange _propagatePropertyNamesToSubentityNames:moc:](self, "_propagatePropertyNamesToSubentityNames:moc:", v70, v73);
    PLPhotoKitGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v70, "_pl_prettyDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v98 = self;
      v99 = 2112;
      v100 = (uint64_t)v33;
      _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEBUG, "PHChange:%p: preloadChangeDetails propertiesToFetchByEntityName:%@", buf, 0x16u);

    }
    objc_msgSend(v29, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChange library](self, "library");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPropertyFetchingHelper fetchPropertiesForObjectIDs:propertyNamesByEntityName:photoLibrary:](PHPropertyFetchingHelper, "fetchPropertiesForObjectIDs:propertyNamesByEntityName:photoLibrary:", v34, v70, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v37 = v68;
    v38 = 0;
    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (!v39)
    {
LABEL_51:

      PLPhotoKitGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = objc_msgSend(v75, "count");
        v49 = objc_msgSend(v71, "count");
        *(_DWORD *)buf = 134218752;
        v98 = self;
        v99 = 2048;
        v100 = v48;
        v101 = 2048;
        v102 = v49;
        v103 = 2048;
        v104 = v38;
        _os_log_impl(&dword_1991EC000, v47, OS_LOG_TYPE_INFO, "PHChange:%p: preloadChangeDetails refetch:%lu clearCache:%lu avoidedRefetch:%lu", buf, 0x2Au);
      }

      goto LABEL_54;
    }
    v40 = *(_QWORD *)v88;
LABEL_39:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v40)
        objc_enumerationMutation(v37);
      v42 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v41);
      v43 = (void *)MEMORY[0x19AEBEADC]();
      v44 = objc_msgSend(v42, "possibleChangesForChange:propertiesFetchResult:", self, v36);
      if (v44 == 8)
      {
        objc_msgSend(v42, "fetchedObjectIDs");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count") == 0;

        if (v46)
        {
LABEL_48:
          objc_msgSend(v75, "addObject:", v42);
          goto LABEL_49;
        }
        objc_msgSend(v71, "addObject:", v42);
      }
      else if (v44)
      {
        goto LABEL_48;
      }
      ++v38;
LABEL_49:
      objc_autoreleasePoolPop(v43);
      if (v39 == ++v41)
      {
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
        if (!v39)
          goto LABEL_51;
        goto LABEL_39;
      }
    }
  }
LABEL_54:

LABEL_55:
  v50 = (NSSet *)objc_msgSend(v75, "copy");
  refetchedFetchResults = self->_refetchedFetchResults;
  self->_refetchedFetchResults = v50;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v71, "count") + objc_msgSend(v75, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChange _preloadChangeDetailsWithRefetchForFetchResults:inManagedObjectContext:](self, "_preloadChangeDetailsWithRefetchForFetchResults:inManagedObjectContext:", v75, v73);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObjectsFromArray:", v53);

  -[PHChange _preloadChangeDetailsWithClearCacheForFetchResults:inManagedObjectContext:](self, "_preloadChangeDetailsWithClearCacheForFetchResults:inManagedObjectContext:", v71, v73);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObjectsFromArray:", v54);

  v85 = 0;
  v86 = 0;
  v84 = 0;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v55 = v52;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v81 != v57)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "calculateDiffsAndAccumulateInsertedCount:updatedCount:deletedCount:", &v86, &v85, &v84);
      }
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v56);
  }

  v59 = v65;
  v60 = v59;
  if (v64 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v59))
  {
    v61 = objc_msgSend(v55, "count");
    *(_DWORD *)buf = 134218752;
    v98 = (PHChange *)v61;
    v99 = 2048;
    v100 = v86;
    v101 = 2048;
    v102 = v85;
    v103 = 2048;
    v104 = v84;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v60, OS_SIGNPOST_INTERVAL_END, spid, "PreloadChangeDetails", "change details: %tu, inserted: %tu, updated: %tu, deleted: %tu", buf, 0x2Au);
  }

  v66[2](v66, self);
  objc_autoreleasePoolPop(context);

}

- (id)_insertedOrUpdatedObjectIDsMatchingEntities:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __56__PHChange__insertedOrUpdatedObjectIDsMatchingEntities___block_invoke;
        v17[3] = &unk_1E35D8828;
        v18 = v5;
        objc_msgSend(v12, "ph_enumerateSelfAndSubentities:", v17);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v5, "count"))
  {
    -[PHChange insertedObjectIDs](self, "insertedObjectIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _addOIDsWithEntityNames(v13, v14, v5);

    -[PHChange updatedObjectIDs](self, "updatedObjectIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _addOIDsWithEntityNames(v13, v15, v5);

  }
  return v13;
}

- (void)_propagatePropertyNamesToSubentityNames:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  id obj;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v25 = 0;
        PLSafeEntityForNameInManagedObjectContext();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v25;
        v15 = v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 0;
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHChange.m"), 433, CFSTR("Error fetching entityName:%@, moc:%@ error:%@"), v11, v6, v15);

        }
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __56__PHChange__propagatePropertyNamesToSubentityNames_moc___block_invoke;
        v22[3] = &unk_1E35D8850;
        v23 = v5;
        v24 = v12;
        v17 = v12;
        objc_msgSend(v13, "ph_enumerateSelfAndSubentities:", v22);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

- (id)_preloadChangeDetailsWithRefetchForFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v14, "query");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "combinedQueryGroupKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v16);
          }
          objc_msgSend(v17, "addObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke;
  v39[3] = &unk_1E35D8878;
  v32 = v7;
  v40 = v32;
  v31 = v18;
  v41 = v31;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v39);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v24, "changeHandlingKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[NSMapTable objectForKey:](self->_changeHandlingMap, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend(v31, "objectForKeyedSubscript:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "changeHandlingValueUsingSeedOids:withChange:usingManagedObjectContext:", v27, self, v32);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](self->_changeHandlingMap, "setObject:forKey:", v26, v25);

          }
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v33 = v19;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v19;
  pl_dispatch_sync();
  v29 = v34;

  return v29;
}

- (id)_preloadChangeDetailsWithClearCacheForFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  id v4;
  id v5;
  id v6;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = v4;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  pl_dispatch_sync();
  v6 = v9;

  return v6;
}

- (BOOL)keyFaceChangedForPersonOID:(id)a3
{
  NSDictionary *changedRelationshipsByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  changedRelationshipsByOID = self->_changedRelationshipsByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedRelationshipsByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  v15[0] = CFSTR("keyFace");
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "indexValueForRelationshipNames:entity:", v10, v12);

  if ((v13 & v7) == 0)
    return self->_unknownMergeEvent;
  return v9;
}

- (BOOL)contentOrThumbnailChangedForPHAssetOID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;

  v4 = a3;
  if (!self->_unknownMergeEvent)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "unsignedLongLongValue");

    if (!v5)
      goto LABEL_12;
    if (contentOrThumbnailChangedForPHAssetOID__onceToken != -1)
      dispatch_once(&contentOrThumbnailChangedForPHAssetOID__onceToken, &__block_literal_global_12495);
    objc_msgSend(v4, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71880], "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D71880], "entityName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqualToString:", v10);

      if (!v11)
      {
        v12 = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForAttributeNames:entity:", contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames, v8);
        goto LABEL_11;
      }
    }
    v12 = contentOrThumbnailChangedForPHAssetOID__genericAssetContentAttributes;
LABEL_11:
    LOBYTE(v5) = (v12 & v5) != 0;

    goto LABEL_12;
  }
  LOBYTE(v5) = 1;
LABEL_12:

  return v5;
}

- (BOOL)contentOrThumbnailChangedForAsset:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHChange contentOrThumbnailChangedForPHAssetOID:](self, "contentOrThumbnailChangedForPHAssetOID:", v4);

  return (char)self;
}

- (BOOL)trashedStateChangedForObjectID:(id)a3
{
  NSDictionary *changedAttributesByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  changedAttributesByOID = self->_changedAttributesByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedAttributesByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  objc_msgSend(v5, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "indexValueForAttributeNames:entity:", &unk_1E3657258, v10);

  return (v11 & v7) != 0 || self->_unknownMergeEvent;
}

- (BOOL)hiddenStateChangedForPHAssetOID:(id)a3
{
  NSDictionary *changedAttributesByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  changedAttributesByOID = self->_changedAttributesByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedAttributesByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  v15[0] = CFSTR("hidden");
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "indexValueForAttributeNames:entity:", v10, v12);

  if ((v13 & v7) == 0)
    return self->_unknownMergeEvent;
  return v9;
}

- (BOOL)favoriteStateChangedForPHAssetOID:(id)a3
{
  NSDictionary *changedAttributesByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  changedAttributesByOID = self->_changedAttributesByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedAttributesByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  v15[0] = CFSTR("favorite");
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "indexValueForAttributeNames:entity:", v10, v12);

  if ((v13 & v7) == 0)
    return self->_unknownMergeEvent;
  return v9;
}

- (BOOL)packedBadgeAttributesChangedForPHAssetOID:(id)a3
{
  NSDictionary *changedAttributesByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  changedAttributesByOID = self->_changedAttributesByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedAttributesByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  v15[0] = CFSTR("packedBadgeAttributes");
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "indexValueForAttributeNames:entity:", v10, v12);

  if ((v13 & v7) == 0)
    return self->_unknownMergeEvent;
  return v9;
}

- (BOOL)assetCloudLocalStateChangedForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL unknownMergeEvent;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudLocalStateProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cloudMasterObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v8, "unsignedLongLongValue");

    -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v9, "unsignedLongLongValue");

    v10 = (void *)MEMORY[0x1E0D71A28];
    v25[0] = CFSTR("cloudLocalState");
    unknownMergeEvent = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "indexValueForAttributeNames:entity:", v12, v14);

    v16 = (void *)MEMORY[0x1E0D71A28];
    v24 = CFSTR("cloudLocalState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "indexValueForAttributeNames:entity:", v17, v19);

    if (!(v15 & v23 | v20 & v22))
      unknownMergeEvent = self->_unknownMergeEvent;
  }
  else
  {
    unknownMergeEvent = 0;
  }

  return unknownMergeEvent;
}

- (BOOL)keyAssetsChangedForPHAssetCollectionOID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("keyAssets");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)userCuratedAssetsChangedForPHMemoryOID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("userCuratedAssets");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)customUserAssetsChangedForPHMemoryOID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("customUserAssets");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)_changedRelationshipsContainChangeForRelationshipNames:(id)a3 objectID:(id)a4
{
  NSDictionary *changedRelationshipsByOID;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  changedRelationshipsByOID = self->_changedRelationshipsByOID;
  v7 = a4;
  v8 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedRelationshipsByOID, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  v11 = (void *)MEMORY[0x1E0D71A28];
  objc_msgSend(v7, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "indexValueForRelationshipNames:entity:", v8, v13);

  return (v14 & v10) != 0 || self->_unknownMergeEvent;
}

- (BOOL)deferredProcessingNeededChangedForPHAssetOID:(id)a3
{
  NSDictionary *changedAttributesByOID;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  changedAttributesByOID = self->_changedAttributesByOID;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](changedAttributesByOID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0D71A28];
  v15[0] = CFSTR("deferredProcessingNeeded");
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "indexValueForAttributeNames:entity:", v10, v12);

  if ((v13 & v7) == 0)
    return self->_unknownMergeEvent;
  return v9;
}

- (PHObjectChangeDetails)changeDetailsForObject:(PHObject *)object
{
  id v3;
  PHObject *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12443;
  v10 = __Block_byref_object_dispose__12444;
  v11 = 0;
  v5 = object;
  pl_dispatch_sync();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return (PHObjectChangeDetails *)v3;
}

- (PHFetchResultChangeDetails)changeDetailsForFetchResult:(PHFetchResult *)object
{
  PHFetchResult *v3;
  PHFetchResult *v4;
  id v5;
  PHFetchResult *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = object;
  v4 = v3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12443;
  v12 = __Block_byref_object_dispose__12444;
  v13 = 0;
  if (v3)
  {
    v7 = v3;
    pl_dispatch_sync();

    v3 = (PHFetchResult *)v9[5];
  }
  if (-[PHFetchResult hasDiffs](v3, "hasDiffs"))
    v5 = (id)v9[5];
  else
    v5 = 0;
  _Block_object_dispose(&v8, 8);

  return (PHFetchResultChangeDetails *)v5;
}

- (BOOL)intersectsWithDetectionCriteria:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v9 = MEMORY[0x1E0C809B0];
    v22 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke;
    v16[3] = &unk_1E35D88C0;
    v16[4] = self;
    v10 = v7;
    v17 = v10;
    v18 = &v19;
    objc_msgSend(v6, "enumerateEntitiesAndAttributeIndexesUsingBlock:", v16);
    if (*((_BYTE *)v20 + 24))
    {
      v11 = 1;
    }
    else
    {
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke_2;
      v13[3] = &unk_1E35D88C0;
      v13[4] = self;
      v14 = v10;
      v15 = &v19;
      objc_msgSend(v6, "enumerateEntitiesAndRelationshipIndexesBlock:", v13);
      v11 = *((_BYTE *)v20 + 24) != 0;

    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)containsChangesForEntityWithManagedEntityName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  BOOL unknownMergeEvent;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PHChange insertedObjectIDs](self, "insertedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v9), "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        goto LABEL_26;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PHChange deletedObjectIDs](self, "deletedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v15)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v16), "entity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v4);

      if ((v19 & 1) != 0)
        goto LABEL_26;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v14)
          goto LABEL_11;
        break;
      }
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PHChange updatedObjectIDs](self, "updatedObjectIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
LABEL_19:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v22)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "entity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v4);

      if ((v26 & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v21)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
LABEL_26:

    unknownMergeEvent = 1;
    goto LABEL_27;
  }
LABEL_25:

  unknownMergeEvent = self->_unknownMergeEvent;
LABEL_27:

  return unknownMergeEvent;
}

- (BOOL)containsChangesForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return self->_unknownMergeEvent;
  -[objc_class managedEntityName](a3, "managedEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PHChange insertedObjectIDs](self, "insertedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v10), "entity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        goto LABEL_28;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v8)
          goto LABEL_4;
        break;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PHChange deletedObjectIDs](self, "deletedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
LABEL_12:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v16)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v17), "entity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v5);

      if ((v20 & 1) != 0)
        goto LABEL_28;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v15)
          goto LABEL_12;
        break;
      }
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PHChange updatedObjectIDs](self, "updatedObjectIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (!v21)
  {
LABEL_26:

    return self->_unknownMergeEvent;
  }
  v22 = v21;
  v23 = *(_QWORD *)v30;
LABEL_20:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v23)
      objc_enumerationMutation(v6);
    objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v24), "entity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", v5);

    if ((v27 & 1) != 0)
      break;
    if (v22 == ++v24)
    {
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v22)
        goto LABEL_20;
      goto LABEL_26;
    }
  }
LABEL_28:

  return 1;
}

- (id)changedLocalIdentifiersForEntityClass:(Class)a3
{
  return -[PHChange changedLocalIdentifiersForEntityClass:context:](self, "changedLocalIdentifiersForEntityClass:context:", a3, self->_context);
}

- (id)deletedLocalIdentifiersForEntityClass:(Class)a3
{
  return -[PHChange _deletedLocalIdentifiersForEntityClass:context:](self, "_deletedLocalIdentifiersForEntityClass:context:", a3, self->_context);
}

- (id)_deletedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class managedEntityName](a3, "managedEntityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71788], "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
      -[PHChange _deletedObjectIDsMatchingGraphNodeContainerType:](self, "_deletedObjectIDsMatchingGraphNodeContainerType:", a3);
    else
      -[objc_class objectIDsMatchingEntityFromObjectIDs:context:](a3, "objectIDsMatchingEntityFromObjectIDs:context:", self->_deletedObjectIDs, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__PHChange__deletedLocalIdentifiersForEntityClass_context___block_invoke;
    v14[3] = &unk_1E35D88E8;
    v14[4] = self;
    v14[5] = a3;
    v12 = _Block_copy(v14);
    objc_msgSend(v11, "_pl_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_requiredLabelCodeNumberForContainerClass:(Class)a3
{
  NSObject *v4;
  void *v6;
  uint64_t v7;
  int v8;
  Class v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = 1000;
LABEL_8:
    objc_msgSend(v6, "numberWithUnsignedInt:", v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if ((Class)objc_opt_class() == a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = 1100;
    goto LABEL_8;
  }
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = a3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "No node container class for node with class: %@", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (id)_deletedObjectIDsMatchingGraphNodeContainerType:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  PHChange *v13;
  id v14;

  -[PHChange _requiredLabelCodeNumberForContainerClass:](self, "_requiredLabelCodeNumberForContainerClass:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __60__PHChange__deletedObjectIDsMatchingGraphNodeContainerType___block_invoke;
    v12 = &unk_1E35D8910;
    v13 = self;
    v14 = v4;
    v6 = _Block_copy(&v9);
    -[NSSet _pl_filter:](self->_deletedObjectIDs, "_pl_filter:", v6, v9, v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!-[PHPersistentChangeFetchOptions excludesPrivateChanges](self->_fetchOptions, "excludesPrivateChanges"))
    {
      -[PHChange _changedLocalIdentifiersForEntityClass:context:](self, "_changedLocalIdentifiersForEntityClass:context:", a3, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend((id)objc_opt_class(), "isPublicPHObjectChangeClass:", a3))
    {
      -[PHChange _changedLocalIdentifiersWithPublicChangesForEntityClass:context:](self, "_changedLocalIdentifiersWithPublicChangesForEntityClass:context:", a3, v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v7;
      goto LABEL_9;
    }
  }
  v8 = (void *)MEMORY[0x1E0C9AA70];
LABEL_9:

  return v8;
}

- (id)_changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD aBlock[4];
  id v30;
  PHChange *v31;
  Class v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[objc_class objectIDsMatchingEntityFromObjectIDs:context:](a3, "objectIDsMatchingEntityFromObjectIDs:context:", self->_insertedObjectIDs, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class objectIDsMatchingEntityFromObjectIDs:context:](a3, "objectIDsMatchingEntityFromObjectIDs:context:", self->_changedObjectIDs, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "unionSet:", v8);
  -[objc_class managedEntityName](a3, "managedEntityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71788], "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12);

  if ((_DWORD)v11)
  {
    -[PHChange _fetchGraphNodeIDsWithRequiredPrimaryLabelCode:changedObjectIDs:](self, "_fetchGraphNodeIDsWithRequiredPrimaryLabelCode:changedObjectIDs:", a3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intersectSet:", v13);

  }
  -[PHChange _fetchUUIDMapForObjectIDs:entityClass:context:](self, "_fetchUUIDMapForObjectIDs:entityClass:context:", v10, a3, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PHChange__changedLocalIdentifiersForEntityClass_context___block_invoke;
  aBlock[3] = &unk_1E35D8938;
  v31 = self;
  v32 = a3;
  v24 = v14;
  v30 = v24;
  v15 = _Block_copy(aBlock);
  v28 = v7;
  objc_msgSend(v7, "_pl_map:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  objc_msgSend(v8, "_pl_map:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChange _deletedLocalIdentifiersForEntityClass:context:](self, "_deletedLocalIdentifiersForEntityClass:context:", a3, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("PHInsertedLocalIdentifiersKey");
  v19 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[0] = v19;
  v33[1] = CFSTR("PHUpdatedLocalIdentifiersKey");
  v20 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[1] = v20;
  v33[2] = CFSTR("PHDeletedLocalIdentifiersKey");
  v21 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_16;
LABEL_19:

    if (v16)
      goto LABEL_17;
LABEL_20:

    goto LABEL_17;
  }

  if (!v17)
    goto LABEL_19;
LABEL_16:
  if (!v16)
    goto LABEL_20;
LABEL_17:

  return v22;
}

- (id)_fetchGraphNodeIDsWithRequiredPrimaryLabelCode:(Class)a3 changedObjectIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSManagedObjectContext *context;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  PHChange *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a4;
  -[PHChange _requiredLabelCodeNumberForContainerClass:](self, "_requiredLabelCodeNumberForContainerClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke;
    v15[3] = &unk_1E35DF9A0;
    v10 = v6;
    v16 = v10;
    v17 = self;
    v20 = &v21;
    v18 = v7;
    v11 = v8;
    v19 = v11;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v15);
    if (*((_BYTE *)v22 + 24))
      v12 = v11;
    else
      v12 = v10;
    v13 = v12;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (id)_fetchUUIDMapForObjectIDs:(id)a3 entityClass:(Class)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  void *context;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  _QWORD v58[5];

  v58[2] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v7 = a5;
  context = (void *)MEMORY[0x19AEBEADC]();
  v8 = (void *)MEMORY[0x1E0C97B48];
  -[objc_class managedEntityName](a4, "managedEntityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  -[objc_class entityKeyForPropertyKey:](a4, "entityKeyForPropertyKey:", CFSTR("uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v13;
  v58[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v14);

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__12443;
  v51 = __Block_byref_object_dispose__12444;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__12443;
  v45 = __Block_byref_object_dispose__12444;
  v46 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __58__PHChange__fetchUUIDMapForObjectIDs_entityClass_context___block_invoke;
  v36[3] = &unk_1E35DE5F8;
  v39 = &v41;
  v15 = v7;
  v37 = v15;
  v16 = v10;
  v38 = v16;
  v40 = &v47;
  objc_msgSend(v15, "performBlockAndWait:", v36);
  v29 = v16;
  if (v42[5])
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = (id)v42[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v26);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
      }
      while (v21);
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v27 = v48[5];
      *(_DWORD *)buf = 138412546;
      v55 = v27;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Fetch error: %@ while fetching objectIDs: %@", buf, 0x16u);
    }
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  objc_autoreleasePoolPop(context);
  return v17;
}

- (id)_retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:(id)a3 minusResolved:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v14, (_QWORD)v18) & 1) == 0
          && (-[PHChange trashedStateChangedForPHAssetOID:](self, "trashedStateChangedForPHAssetOID:", v14)
           || -[PHChange hiddenStateChangedForPHAssetOID:](self, "hiddenStateChangedForPHAssetOID:", v14)))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[PHChange _predicateForPublicResultsWithEntityClass:objectIDs:](self, "_predicateForPublicResultsWithEntityClass:objectIDs:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChange retrieveUUIDsForAssetObjectIDs:filterPredicate:](self, "retrieveUUIDsForAssetObjectIDs:filterPredicate:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_changedLocalIdentifiersWithPublicChangesForEntityClass:(Class)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD aBlock[4];
  id v47;
  PHChange *v48;
  id v49;
  id v50;
  id v51;
  Class v52;
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[objc_class objectIDsMatchingEntityFromObjectIDs:context:](a3, "objectIDsMatchingEntityFromObjectIDs:context:", self->_insertedObjectIDs, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v6;
  -[objc_class objectIDsMatchingEntityFromObjectIDs:context:](a3, "objectIDsMatchingEntityFromObjectIDs:context:", self->_changedObjectIDs, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "unionSet:", v8);
  v44 = (void *)v8;
  -[objc_class managedEntityName](a3, "managedEntityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71788], "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v11;
  LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12);

  if ((_DWORD)v11)
  {
    -[PHChange _fetchGraphNodeIDsWithRequiredPrimaryLabelCode:changedObjectIDs:](self, "_fetchGraphNodeIDsWithRequiredPrimaryLabelCode:changedObjectIDs:", a3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intersectSet:", v13);

  }
  -[PHChange _predicateForPublicResultsWithEntityClass:objectIDs:](self, "_predicateForPublicResultsWithEntityClass:objectIDs:", a3, v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChange _fetchCombinedPublicResultsMapForEntityClass:predicate:context:](self, "_fetchCombinedPublicResultsMapForEntityClass:predicate:context:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class())
    && (v15 = objc_msgSend(v14, "count"), v15 < objc_msgSend(v10, "count"))
    && (-[PHPhotoLibrary photoLibraryBundle](self->_library, "photoLibraryBundle"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "connectionType"),
        v16,
        v17 == 1))
  {
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v14, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChange _retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:minusResolved:](self, "_retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:minusResolved:", v10, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PHChange__changedLocalIdentifiersWithPublicChangesForEntityClass_context___block_invoke;
  aBlock[3] = &unk_1E35D8960;
  v52 = a3;
  v39 = v14;
  v47 = v39;
  v48 = self;
  v24 = v23;
  v49 = v24;
  v25 = v22;
  v50 = v25;
  v37 = v21;
  v51 = v37;
  v26 = _Block_copy(aBlock);
  v43 = v7;
  objc_msgSend(v7, "_pl_map:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_pl_map:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChange _deletedLocalIdentifiersForEntityClass:context:](self, "_deletedLocalIdentifiersForEntityClass:context:", a3, v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    if (v29)
    {
      objc_msgSend(v29, "setByAddingObjectsFromSet:", v25, v37, v39);
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v25, v37, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v24, "count", v37))
  {
    if (v27)
    {
      objc_msgSend(v27, "setByAddingObjectsFromSet:", v24);
      v31 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v31;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v53[0] = CFSTR("PHInsertedLocalIdentifiersKey");
  v32 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[0] = v32;
  v53[1] = CFSTR("PHUpdatedLocalIdentifiersKey");
  v33 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[1] = v33;
  v53[2] = CFSTR("PHDeletedLocalIdentifiersKey");
  v34 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (v28)
      goto LABEL_29;
LABEL_32:

    if (v27)
      goto LABEL_30;
LABEL_33:

    goto LABEL_30;
  }

  if (!v28)
    goto LABEL_32;
LABEL_29:
  if (!v27)
    goto LABEL_33;
LABEL_30:

  return v35;
}

- (id)_predicateForPublicResultsWithEntityClass:(Class)a3 objectIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIncludeAssetSourceTypes:", 1);
  if (-[objc_class managedObjectSupportsTrashedState](a3, "managedObjectSupportsTrashedState"))
    objc_msgSend(v7, "setIncludeTrashedAssets:", 1);
  if (-[objc_class managedObjectSupportsHiddenState](a3, "managedObjectSupportsHiddenState"))
    objc_msgSend(v7, "setIncludeHiddenAssets:", 1);
  if (-[objc_class managedObjectSupportsBursts](a3, "managedObjectSupportsBursts"))
    objc_msgSend(v7, "setIncludeAllBurstAssets:", 1);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[objc_class fetchType](a3, "fetchType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v9, v8, self->_library);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchOptions:", v7);
  objc_msgSend(v10, "effectivePredicateForPHClass:includingBasePredicate:", a3, v8 != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_fetchCombinedPublicResultsMapForEntityClass:(Class)a3 predicate:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  void *context;
  id v32;
  void *v33;
  const __CFString *v34;
  id obj;
  int v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  _QWORD v64[5];

  v64[2] = *MEMORY[0x1E0C80C00];
  v32 = a4;
  v7 = a5;
  context = (void *)MEMORY[0x19AEBEADC]();
  -[objc_class entityKeyForPropertyKey:](a3, "entityKeyForPropertyKey:", CFSTR("uuid"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v9;
  v64[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[objc_class managedObjectSupportsTrashedState](a3, "managedObjectSupportsTrashedState");
  if (v36)
  {
    objc_msgSend(v33, "addObject:", CFSTR("trashedState"));
    v34 = CFSTR("trashedState");
  }
  else
  {
    v34 = 0;
  }
  v11 = (void *)MEMORY[0x1E0C97B48];
  -[objc_class managedEntityName](a3, "managedEntityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPredicate:", v32);
  objc_msgSend(v13, "setPropertiesToFetch:", v33);
  objc_msgSend(v13, "setResultType:", 2);
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__12443;
  v57 = __Block_byref_object_dispose__12444;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__12443;
  v51 = __Block_byref_object_dispose__12444;
  v52 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __75__PHChange__fetchCombinedPublicResultsMapForEntityClass_predicate_context___block_invoke;
  v42[3] = &unk_1E35DE5F8;
  v45 = &v47;
  v14 = v7;
  v43 = v14;
  v15 = v13;
  v44 = v15;
  v46 = &v53;
  objc_msgSend(v14, "performBlockAndWait:", v42);
  v29 = v14;
  v30 = v15;
  if (v48[5])
  {
    objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)v48[5];
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v37);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("uuid"));

          if (v36)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v34);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("trashed"));

          }
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v23);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
      }
      while (v19);
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v27 = v54[5];
      *(_DWORD *)buf = 138412546;
      v61 = v27;
      v62 = 2112;
      v63 = v15;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Fetch error: %@ while fetching objectIDs with fetch request %@", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x1E0C9AA70];
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  objc_autoreleasePoolPop(context);
  return v18;
}

- (BOOL)_shouldCreateChangeDetailsWithCurrentFetchResultForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSManagedObjectContext *context;
  NSManagedObjectContext *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  NSManagedObjectContext *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "fetchType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PHPerson")) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "fetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "personContext");

  if (v7 != 1)
  {
LABEL_6:
    LOBYTE(v11) = 0;
    goto LABEL_23;
  }
  +[PHAsset managedEntityName](PHAsset, "managedEntityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  if (context)
  {
    v10 = context;
  }
  else
  {
    -[PHPhotoLibrary photoLibrary](self->_library, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v10 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D71A28];
  v30[0] = CFSTR("hidden");
  v30[1] = CFSTR("trashedState");
  v30[2] = CFSTR("visibilityState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "indexValueForAttributeNames:entity:", v15, v8);

  if (-[PHChange anyUpdatedObjectsWithChangedAttributes:ofEntity:](self, "anyUpdatedObjectsWithChangedAttributes:ofEntity:", v16, v13))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = self->_deletedObjectIDs;
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v24 = v10;
      v18 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "entity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v8);

          if ((v22 & 1) != 0)
          {
            LOBYTE(v11) = 1;
            goto LABEL_20;
          }
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
LABEL_20:
      v10 = v24;
    }

  }
LABEL_23:

  return v11;
}

- (id)changedPropertyNamesForObjectID:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v6 = a3;
  -[objc_class managedEntityName](a4, "managedEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71A28], "attributeNamesForIndexValues:entity:", objc_msgSend(v8, "unsignedLongLongValue"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PHChange_changedPropertyNamesForObjectID_entityClass___block_invoke;
  v13[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v13[4] = a4;
  objc_msgSend(v9, "_pl_map:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)changedPropertyNamesForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  -[PHChange changedPropertyNamesForObjectID:entityClass:](self, "changedPropertyNamesForObjectID:entityClass:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)changedPropertyNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4
{
  void *v6;
  void *v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PHChange changedPropertyNamesForObjectID:entityClass:](self, "changedPropertyNamesForObjectID:entityClass:", v6, a4);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_relationshipNamesForObjectID:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v6 = a3;
  -[objc_class managedEntityName](a4, "managedEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71A28], "relationshipNamesForIndexValues:entity:", objc_msgSend(v8, "unsignedLongLongValue"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PHChange__relationshipNamesForObjectID_entityClass___block_invoke;
  v13[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v13[4] = a4;
  objc_msgSend(v9, "_pl_map:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)changedRelationshipNamesForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  -[PHChange _relationshipNamesForObjectID:entityClass:](self, "_relationshipNamesForObjectID:entityClass:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)changedRelationshipNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4
{
  void *v6;
  void *v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PHChange _relationshipNamesForObjectID:entityClass:](self, "_relationshipNamesForObjectID:entityClass:", v6, a4);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)retrieveUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  PHPhotoLibrary *library;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  if (-[NSDictionary count](self->_deletedUuidsByObjectId, "count"))
  {
    v27 = v7;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_deletedUuidsByObjectId, "objectForKeyedSubscript:", v15, v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);
            objc_msgSend(v9, "removeObject:", v15);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v12);
    }

    v7 = v27;
  }
  if (objc_msgSend(v9, "count", v27))
  {
    library = self->_library;
    if (library)
    {
      -[PHPhotoLibrary assetsdClient](library, "assetsdClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photoKitClient");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHPhotoLibrary changeHandlingPhotoLibrary](self->_library, "changeHandlingPhotoLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v19, "getUUIDsForAssetObjectIDs:filterPredicate:context:error:", v22, v7, v21, &v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;

      if (v23)
      {
        objc_msgSend(v8, "addEntriesFromDictionary:", v23);
      }
      else
      {
        PLPhotoKitGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v24;
          _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Failed to retrieve UUIDs for changed object IDs %@", buf, 0xCu);
        }

      }
    }
  }

  return v8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHChange;
  -[PHChange description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  pl_result_with_autoreleasepool();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_formatedDeletedUUidsByObjectId
{
  void *v3;
  NSDictionary *deletedUuidsByObjectId;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deletedUuidsByObjectId = self->_deletedUuidsByObjectId;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PHChange__formatedDeletedUUidsByObjectId__block_invoke;
  v7[3] = &unk_1E35D8AB8;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](deletedUuidsByObjectId, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_formatEncodedDictionary:(id)a3 withDecodeBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __53__PHChange__formatEncodedDictionary_withDecodeBlock___block_invoke;
  v16 = &unk_1E35D8AE0;
  v17 = v8;
  v18 = v5;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (NSDictionary)deletedUuidsByObjectId
{
  return self->_deletedUuidsByObjectId;
}

- (NSDictionary)deletedPrimaryLabelCodesByObjectId
{
  return self->_deletedPrimaryLabelCodesByObjectId;
}

- (PHPersistentChangeFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (PHPersistentChangeEnumerationContext)enumerationContext
{
  return self->_enumerationContext;
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_deletedPrimaryLabelCodesByObjectId, 0);
  objc_storeStrong((id *)&self->_deletedUuidsByObjectId, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_cloudStatus, 0);
  objc_storeStrong((id *)&self->_refetchedFetchResults, 0);
  objc_storeStrong((id *)&self->_objectIDsByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_changeHandlingMap, 0);
  objc_storeStrong((id *)&self->_changeDetailIsolation, 0);
  objc_storeStrong((id *)&self->_collectionChangeDetailsForObjects, 0);
  objc_storeStrong((id *)&self->_changeDetailsForObjects, 0);
  objc_storeStrong((id *)&self->_sortedChangedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectsChangedRelationshipsByEntityName, 0);
  objc_storeStrong((id *)&self->_updatedObjectsChangedAttributesByEntityName, 0);
  objc_storeStrong((id *)&self->_changedRelationshipsByOID, 0);
  objc_storeStrong((id *)&self->_changedAttributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_changedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
}

void __53__PHChange__formatEncodedDictionary_withDecodeBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "pl_shortURI");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "unsignedLongLongValue");

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);
}

void __43__PHChange__formatedDeletedUUidsByObjectId__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "pl_shortURI");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

id __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D716C0], "prettyMultiLineDescriptionBuilderWithObject:indent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_pl_map:", &__block_literal_global_145_12401);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("insertedObjectIDs"), v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_pl_map:", &__block_literal_global_145_12401);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("changedObjectIDs"), v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_pl_map:", &__block_literal_global_145_12401);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("deletedObjectIDs"), v5);

  objc_msgSend(*(id *)(a1 + 32), "_formatedDeletedUUidsByObjectId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("deletedUuidsByObjectId"), v6);

  objc_msgSend(*(id *)(a1 + 32), "_formatEncodedDictionary:withDecodeBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &__block_literal_global_156);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("changedAttributesByOID"), v7);
  objc_msgSend(*(id *)(a1 + 32), "_formatEncodedDictionary:withDecodeBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), &__block_literal_global_159_12407);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendName:object:", CFSTR("changedRelationshipsByOID"), v8);
  objc_msgSend(v2, "appendName:typeCode:value:", CFSTR("unknownMergeEvent"), "B", *(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(v2, "appendName:typeCode:value:", CFSTR("changeToken"), "@", *(_QWORD *)(a1 + 32) + 184);
  if (objc_msgSend(*(id *)(a1 + 32), "hasCloudStatusChanges"))
    objc_msgSend(v2, "appendName:typeCode:value:", CFSTR("cloudStatus"), "@", *(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(v2, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0D71A28], "relationshipNamesForIndexValues:entity:", a2, a3);
}

uint64_t __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0D71A28], "attributeNamesForIndexValues:entity:", a2, a3);
}

uint64_t __54__PHChange__relationshipNamesForObjectID_entityClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "propertyKeyForEntityKey:", a2);
}

uint64_t __56__PHChange_changedPropertyNamesForObjectID_entityClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "propertyKeyForEntityKey:", a2);
}

void __75__PHChange__fetchCombinedPublicResultsMapForEntityClass_predicate_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

NSObject *__76__PHChange__changedLocalIdentifiersWithPublicChangesForEntityClass_context___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  char v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid")), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1[8], "objectForKeyedSubscript:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(a1[9], "localIdentifierWithUUID:", v15);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)a1[5] + 14), "setObject:forKeyedSubscript:", v3, v8);
      if (!objc_msgSend(a1[5], "trashedStateChangedForPHAssetOID:", v3))
      {
LABEL_15:

        v7 = 0;
        goto LABEL_16;
      }
      objc_msgSend(*((id *)a1[5] + 22), "trashedIdentifiersAsDeletes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v8);

      if ((v17 & 1) == 0)
        objc_msgSend(a1[7], "addObject:", v8);
    }
    else
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v21 = 138412290;
        v22 = v3;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Could not fetch valid uuid for the objectID: %@", (uint8_t *)&v21, 0xCu);
      }
    }

    v8 = 0;
    goto LABEL_15;
  }
  v7 = (void *)v6;
  objc_msgSend(a1[9], "localIdentifierWithUUID:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*((id *)a1[5] + 14), "setObject:forKeyedSubscript:", v3, v8);
    if (objc_msgSend(a1[5], "trashedStateChangedForPHAssetOID:", v3))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");
      v11 = (void *)*((_QWORD *)a1[5] + 22);
      if (v10)
      {
        objc_msgSend(v11, "trashedIdentifiersAsDeletes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v8);

        if ((v13 & 1) == 0)
        {
          v14 = a1 + 7;
LABEL_19:
          objc_msgSend(*v14, "addObject:", v8);
        }
      }
      else
      {
        objc_msgSend(v11, "untrashedIdentifiersAsInserts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v8);

        if ((v20 & 1) == 0)
        {
          v14 = a1 + 6;
          goto LABEL_19;
        }
      }

      v8 = 0;
    }
  }
LABEL_16:

  return v8;
}

void __58__PHChange__fetchUUIDMapForObjectIDs_entityClass_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71788], "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setResultType:", 2);
  v15[0] = CFSTR("primaryLabelCode");
  v15[1] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v4);

  objc_msgSend(v2, "setFetchBatchSize:", 100);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
  v12 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v6)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Error fetching graphNodePrimaryLabelCodeDictionaries: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke_119;
  v9[3] = &unk_1E35D9120;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objectID"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("primaryLabelCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToNumber:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

id __59__PHChange__changedLocalIdentifiersForEntityClass_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "localIdentifierWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", v3, v5);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "Could not fetch valid uuid for the objectID: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

uint64_t __60__PHChange__deletedObjectIDsMatchingGraphNodeContainerType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

  return v4;
}

id __59__PHChange__deletedLocalIdentifiersForEntityClass_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "localIdentifierWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "nil deleted uuid for objectID: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

void __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", a2, a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "anyUpdatedObjectsWithChangedAttributes:ofEntity:", a3, v6);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
}

void __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", a2, a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "anyUpdatedObjectsWithChangedRelationships:ofEntity:", a3, v6);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
}

void __40__PHChange_changeDetailsForFetchResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PHFetchResultChangeDetails *v12;
  uint64_t v13;
  void *v14;
  id v15;
  PHFetchResultChangeDetails *v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "changeHandlingKey");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", v19),
          (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = (void *)v5;
      v7 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v7 + 104))
        v8 = 0;
      else
        v8 = *(void **)(v7 + 64);
      v15 = v8;
      v11 = v6;
      v16 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:]([PHFetchResultChangeDetails alloc], "initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:", *(_QWORD *)(a1 + 40), v11, v15, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));

      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "calculateDiffs");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

    }
    else
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v9, "_shouldCreateChangeDetailsWithCurrentFetchResultForQuery:", v10);

      if (!(_DWORD)v9)
      {
LABEL_11:

        return;
      }
      objc_msgSend(*(id *)(a1 + 40), "fetchResultWithChangeHandlingValue:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:]([PHFetchResultChangeDetails alloc], "initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:", *(_QWORD *)(a1 + 40), v11, 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "calculateDiffs");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
    }

    goto LABEL_11;
  }
}

void __35__PHChange_changeDetailsForObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  PHObjectChangeDetails *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v10 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKey:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v10;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", v10) & 1) != 0
        || (v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v10), v2 = v10, (v6 & 1) != 0)
        || *(_BYTE *)(*(_QWORD *)(a1 + 40) + 104))
      {
        v7 = -[PHObjectChangeDetails initWithPHObject:]([PHObjectChangeDetails alloc], "initWithPHObject:", *(_QWORD *)(a1 + 32));
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
        v2 = v10;
      }
    }
  }

}

void __51__PHChange_contentOrThumbnailChangedForPHAssetOID___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("adjustmentTimestamp");
  v5[1] = CFSTR("thumbnailIndex");
  v5[2] = CFSTR("avalanchePickType");
  v5[3] = CFSTR("deferredProcessingNeeded");
  v5[4] = CFSTR("videoKeyFrameValue");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames;
  contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames = v0;

  v2 = (void *)MEMORY[0x1E0D71A28];
  v3 = contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames;
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  contentOrThumbnailChangedForPHAssetOID__genericAssetContentAttributes = objc_msgSend(v2, "indexValueForAttributeNames:entity:", v3, v4);

}

void __86__PHChange__preloadChangeDetailsWithClearCacheForFetchResults_inManagedObjectContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  PHFetchResultChangeDetails *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", v7, (_QWORD)v13);
        v8 = (PHFetchResultChangeDetails *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = (void *)objc_msgSend(v7, "copyWithOptions:", &unk_1E3657838);
          v10 = *(_QWORD *)(a1 + 40);
          if (*(_BYTE *)(v10 + 104))
            v11 = 0;
          else
            v11 = *(void **)(v10 + 64);
          v12 = v11;
          v8 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:]([PHFetchResultChangeDetails alloc], "initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:", v7, v9, v12, *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 104));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKey:", v8, v7);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "count");
  v7 = v9;
  if (v6 >= 2)
  {
    +[PHFetchResult fetchObjectIDsForCombinableFetchResults:inManagedObjectContext:](PHFetchResult, "fetchObjectIDsForCombinableFetchResults:inManagedObjectContext:", v9, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v8);
    else
      *a4 = 1;

    v7 = v9;
  }

}

void __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  PHFetchResultChangeDetails *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id obj;
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
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", v6);
        v7 = (PHFetchResultChangeDetails *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v6, "changeHandlingKey");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = 0;
          }
          v10 = *(_QWORD *)(a1 + 40);
          if (*(_BYTE *)(v10 + 104))
            v11 = 0;
          else
            v11 = *(void **)(v10 + 64);
          v12 = v11;
          v13 = v9;
          v7 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:]([PHFetchResultChangeDetails alloc], "initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:", v6, v13, v12, *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 104));

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKey:", v7, v6);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

void __56__PHChange__propagatePropertyNamesToSubentityNames_moc___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15 = v3;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v6);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v15, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = v11;

  objc_msgSend(v12, "unionSet:", *(_QWORD *)(a1 + 40));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v15, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

}

void __56__PHChange__insertedOrUpdatedObjectIDsMatchingEntities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_2;
  v2[3] = &unk_1E35D8800;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "calculateDiffs", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_2(uint64_t a1, void *a2)
{
  PHFetchResultChangeDetails *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:");
  v3 = (PHFetchResultChangeDetails *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[PHFetchResultChangeDetails initWithManualFetchResultAfterChanges:]([PHFetchResultChangeDetails alloc], "initWithManualFetchResultAfterChanges:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

+ (id)publicPHObjectChangeClasses
{
  pl_dispatch_once();
  return (id)publicPHObjectChangeClasses_pl_once_object_29;
}

+ (BOOL)isPublicPHObjectChangeClass:(Class)a3
{
  void *v4;

  objc_msgSend(a1, "publicPHObjectChangeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsObject:", a3);

  return (char)a3;
}

+ (id)handlerQueue
{
  if (handlerQueue_onceToken != -1)
    dispatch_once(&handlerQueue_onceToken, &__block_literal_global_136);
  return (id)handlerQueue_handlerQueue;
}

+ (id)mergePersistedChanges:(id)a3
{
  id v3;
  PHChange *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v42;
  void *context;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id obj;
  id obja;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (PHChange *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "changeToken");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fetchOptions");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "library");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enumerationContext");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      context = (void *)MEMORY[0x19AEBEADC]();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v47 = v3;
      obj = v3;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v64 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            v17 = (void *)MEMORY[0x19AEBEADC]();
            if ((objc_msgSend(v16, "hasIncrementalChanges") & 1) == 0)
            {
              objc_msgSend(v16, "changeToken");
              v36 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "context");
              v37 = objc_claimAutoreleasedReturnValue();

              objc_autoreleasePoolPop(v17);
              v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);

              v28 = v38;
              v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);

              v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v53 = 1;
              v48 = (void *)v36;
              v35 = (void *)v37;
              v34 = v40;
              v56 = v39;
              v57 = v28;
              v26 = v27;
              v58 = v28;
              goto LABEL_22;
            }
            objc_msgSend(v16, "insertedObjectIDs");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "unionSet:", v18);

            objc_msgSend(v16, "updatedObjectIDs");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "unionSet:", v19);

            objc_msgSend(v16, "deletedObjectIDs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "unionSet:", v20);

            objc_msgSend(v16, "changedAttributesByOID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            __34__PHChange_mergePersistedChanges___block_invoke(v21, v5);
            objc_msgSend(v16, "changedRelationshipsByOID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            __34__PHChange_mergePersistedChanges___block_invoke(v22, v6);
            objc_msgSend(v16, "deletedUuidsByObjectId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addEntriesFromDictionary:", v23);

            objc_msgSend(v16, "deletedPrimaryLabelCodesByObjectId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addEntriesFromDictionary:", v24);

            objc_autoreleasePoolPop(v17);
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
          if (v13)
            continue;
          break;
        }
      }

      v25 = objc_msgSend(v58, "copy");
      objc_msgSend(v58, "minusSet:", v57);
      objc_msgSend(v52, "minusSet:", v57);
      objc_msgSend(v52, "minusSet:", v58);
      obja = (id)v25;
      objc_msgSend(v57, "minusSet:", v25);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v28 = v52;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v60 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            __34__PHChange_mergePersistedChanges___block_invoke_3(v33, v5, v26);
            __34__PHChange_mergePersistedChanges___block_invoke_3(v33, v6, v27);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v30);
      }

      v53 = 0;
      v34 = v54;
      v35 = v49;
LABEL_22:
      v55 = v34;
      objc_autoreleasePoolPop(context);
      LOBYTE(v42) = v53;
      v4 = -[PHChange initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:]([PHChange alloc], "initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:", v58, v28, v57, v56, v34, v26, v27, v42, v48, v46, v45, v35, v44);

      v3 = v47;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __34__PHChange_mergePersistedChanges___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PHChange_mergePersistedChanges___block_invoke_2;
  v5[3] = &unk_1E35D89C8;
  v6 = v3;
  v4 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __34__PHChange_mergePersistedChanges___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v11 |= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedLongLongValue");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v5);

  }
}

void __34__PHChange_mergePersistedChanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(v6, "addObject:", v5);

}

void __24__PHChange_handlerQueue__block_invoke()
{
  dispatch_qos_class_t v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();
  if (PLIsForegroundApplication())
    v0 = QOS_CLASS_USER_INITIATED;
  else
    v0 = QOS_CLASS_UTILITY;
  dispatch_queue_attr_make_with_qos_class(attr, v0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("PHChange-queue", v1);
  v3 = (void *)handlerQueue_handlerQueue;
  handlerQueue_handlerQueue = (uint64_t)v2;

}

void __39__PHChange_publicPHObjectChangeClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)publicPHObjectChangeClasses_pl_once_object_29;
  publicPHObjectChangeClasses_pl_once_object_29 = v3;

}

- (BOOL)hasRelationshipChangesForLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL unknownMergeEvent;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

    if (v6)
      unknownMergeEvent = 1;
    else
      unknownMergeEvent = self->_unknownMergeEvent;
  }
  else
  {
    unknownMergeEvent = 0;
  }

  return unknownMergeEvent;
}

- (BOOL)faceRelationshipChangedForPersonWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL unknownMergeEvent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("detectedFaces");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v9, v11);

  if ((v12 & v6) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

- (BOOL)personRelationshipChangedForFaceWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL unknownMergeEvent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("personForFace");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v9, v11);

  if ((v12 & v6) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

- (BOOL)momentRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL unknownMergeEvent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("moments");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v9, v11);

  if ((v12 & v6) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

- (BOOL)highlightGroupRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL unknownMergeEvent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("childDayGroupPhotosHighlights");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v9, v11);

  if ((v12 & v6) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

- (BOOL)assetsOrDayGroupAssetsRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("assets");
  v14[1] = CFSTR("dayGroupAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v8, v10);

  v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)keyAssetPrivateOrDayGroupKeyAssetPrivateChangedForHighlightWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("keyAssetPrivate");
  v14[1] = CFSTR("dayGroupKeyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v8, v10);

  v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)keyAssetSharedOrDayGroupKeyAssetSharedChangedForHighlightWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("keyAssetShared");
  v14[1] = CFSTR("dayGroupKeyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v8, v10);

  v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)userFeedbackRelationshipChangedForObject:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL unknownMergeEvent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_changedRelationshipsByOID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = (void *)MEMORY[0x1E0D71A28];
  v14[0] = CFSTR("userFeedbacks");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v9, v11);

  if ((v12 & v6) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

- (BOOL)membersOrAssetContainmentForSocialGroupChangedWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL unknownMergeEvent;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectIDsByLocalIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_changedAttributesByOID, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  v9 = (void *)MEMORY[0x1E0D71A28];
  v18[0] = CFSTR("changeFlag2");
  unknownMergeEvent = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "indexValueForAttributeNames:entity:", v11, v6);

  v13 = (void *)MEMORY[0x1E0D71A28];
  v17 = CFSTR("changeFlag4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "indexValueForAttributeNames:entity:", v14, v6);

  if (((v12 | v15) & v8) == 0)
    unknownMergeEvent = self->_unknownMergeEvent;

  return unknownMergeEvent;
}

@end
