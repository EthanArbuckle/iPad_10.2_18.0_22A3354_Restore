@implementation PHFetchResult

void __57__PHFetchResult_fetchedObjectsUsingManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 40))
  {
    v3 = *(id *)(v1 + 56);
    if (!v3)
    {
      v4 = *(void **)(a1 + 40);
      if (v4)
      {
        v5 = v4;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "managedObjectContextForCurrentQueueQoS");
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[PHFetchResult fetchObjectIDs:inManagedObjectContext:](PHFetchResult, "fetchObjectIDs:inManagedObjectContext:", *(_QWORD *)(a1 + 32), v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v3 = v10;
    }
    v11 = v3;
    +[PHFetchResult _batchFetchingArrayForObjectIDs:fetchResult:](PHFetchResult, "_batchFetchingArrayForObjectIDs:fetchResult:", v3, *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

+ (id)_batchFetchingArrayForObjectIDs:(id)a3 fetchResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  PHBatchFetchingArray *v19;
  void *v20;
  PHBatchFetchingArray *v21;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchType");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchPropertySets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 && objc_msgSend(v11, "count"))
    v13 = -[objc_class propertyFetchHintsForPropertySets:](+[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v10), "propertyFetchHintsForPropertySets:", v12);
  else
    v13 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("propertyHint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "chunkSizeForFetch"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("batchSize"));

  if (objc_msgSend(v8, "cacheSizeForFetch") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "cacheSizeForFetch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("cacheSize"));

  }
  objc_msgSend(v5, "query");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "overrideResultClassWithFetchType");

  if (v18)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", NSClassFromString(v10), CFSTR("fetchedObjectClass"));
  v19 = [PHBatchFetchingArray alloc];
  objc_msgSend(v5, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PHBatchFetchingArray initWithOIDs:options:photoLibrary:](v19, "initWithOIDs:options:photoLibrary:", v6, v9, v20);

  return v21;
}

- (PHPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PHFetchResult query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (PHQuery)query
{
  return (PHQuery *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)fetchType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)fetchPropertySets
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (PHFetchResult)initWithQuery:(id)a3 oids:(id)a4 registerIfNeeded:(BOOL)a5 usingManagedObjectContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  PHFetchResult *v13;
  PHFetchResult *v14;
  id changeHandlingKey;
  uint64_t v16;
  PHQuery *query;
  void *v18;
  uint64_t v19;
  NSString *fetchType;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *fetchPropertySets;
  NSObject *v25;
  _PHFetchRequestWrapper *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  PHFetchResult *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  NSError *fetchError;
  NSError *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  NSNumber *prefetchCount;
  id v48;
  __int128 v50;
  uint64_t v51;

  v7 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PHFetchResult init](self, "init");
  v14 = v13;
  if (!v13)
  {
LABEL_28:
    v35 = v14;
    goto LABEL_29;
  }
  v13->_preventsClearingOIDCache = 1;
  changeHandlingKey = v13->_changeHandlingKey;
  v13->_changeHandlingKey = 0;

  objc_storeStrong((id *)&v14->_seedOIDs, a4);
  if (!v10)
  {
    PLPhotoKitGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v50) = 0;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_FAULT, "PHFetchRequest initialized with nil query", (uint8_t *)&v50, 2u);
    }
    goto LABEL_26;
  }
  v16 = objc_msgSend(v10, "copy");
  query = v14->_query;
  v14->_query = (PHQuery *)v16;

  objc_msgSend(v10, "fetchType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  fetchType = v14->_fetchType;
  v14->_fetchType = (NSString *)v19;

  objc_msgSend(v10, "fetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchPropertySetsAsSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  fetchPropertySets = v14->_fetchPropertySets;
  v14->_fetchPropertySets = (NSSet *)v23;

  -[PHQuery fetchRequest](v14->_query, "fetchRequest");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = [_PHFetchRequestWrapper alloc];
    -[PHQuery containerIdentifier](v14->_query, "containerIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
    {
      -[PHQuery changeHandlingContainerIdentifier](v14->_query, "changeHandlingContainerIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = -[_PHFetchRequestWrapper initWithFetchRequest:containerIdentifier:fetchPropertySets:](v26, "initWithFetchRequest:containerIdentifier:fetchPropertySets:", v25, v28, v14->_fetchPropertySets);
    v30 = v14->_changeHandlingKey;
    v14->_changeHandlingKey = (id)v29;

    if (!v27)
    if (v14->_changeHandlingKey)
    {
      if (v12)
      {
LABEL_10:
        v31 = v12;
LABEL_22:
        objc_msgSend(v10, "fetchOptions", (_QWORD)v50);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "shouldPrefetchCount");

        if (v45)
        {
          +[PHFetchResult fetchObjectCount:inManagedObjectContext:](PHFetchResult, "fetchObjectCount:inManagedObjectContext:", v14, v31);
          v46 = objc_claimAutoreleasedReturnValue();
          prefetchCount = v14->_prefetchCount;
          v14->_prefetchCount = (NSNumber *)v46;

        }
        else
        {
          v48 = -[PHFetchResult fetchedObjectsUsingManagedObjectContext:](v14, "fetchedObjectsUsingManagedObjectContext:", v31);
        }

LABEL_26:
        if (v7)
          -[PHFetchResult updateRegistrationForChangeNotificationDeltas](v14, "updateRegistrationForChangeNotificationDeltas");
        goto LABEL_28;
      }
LABEL_21:
      objc_msgSend(v10, "photoLibrary", v50);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "managedObjectContextForCurrentQueueQoS");
      v31 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    PLPhotoKitGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      if (v12)
        goto LABEL_10;
      goto LABEL_21;
    }
    LODWORD(v50) = 138412290;
    *(_QWORD *)((char *)&v50 + 4) = v14;
    v37 = "PHFetchRequest failed to create _PHFetchRequestWrapper from fetch request %@";
    v38 = v36;
    v39 = OS_LOG_TYPE_ERROR;
LABEL_19:
    _os_log_impl(&dword_1991EC000, v38, v39, v37, (uint8_t *)&v50, 0xCu);
    goto LABEL_20;
  }
  -[PHQuery searchIndexLookupIdentifier](v14->_query, "searchIndexLookupIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    fetchError = v14->_fetchError;
    v14->_fetchError = (NSError *)v40;

    PLPhotoKitGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      goto LABEL_20;
    v42 = v14->_fetchError;
    LODWORD(v50) = 138412290;
    *(_QWORD *)((char *)&v50 + 4) = v42;
    v37 = "PHFetchRequest initialized with invalid query, nil fetch request %@";
    v38 = v36;
    v39 = OS_LOG_TYPE_FAULT;
    goto LABEL_19;
  }
  -[PHQuery searchIndexLookupIdentifier](v14->_query, "searchIndexLookupIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsForSearchLookupIdentifier:options:](PHAsset, "fetchAssetsForSearchLookupIdentifier:options:", v33, v34);
  v35 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

LABEL_29:
  return v35;
}

- (PHFetchResult)init
{
  PHFetchResult *v2;
  uint64_t v3;
  id changeHandlingKey;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *isolationQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHFetchResult;
  v2 = -[PHFetchResult init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "emptyFetchResultChangeHandlingKey");
    v3 = objc_claimAutoreleasedReturnValue();
    changeHandlingKey = v2->_changeHandlingKey;
    v2->_changeHandlingKey = (id)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("PHFetchResult", v5);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v6;

    v2->_countsLock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_albumsCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v2->_foldersCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

+ (id)emptyFetchResultChangeHandlingKey
{
  return CFSTR("EmptyFetchResultKey");
}

+ (id)fetchObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v7;
  id v8;
  PHFetchResultInstrumentation *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSString *importantFetchName;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  OS_os_log *log;
  void *v22;
  NSObject *p_super;
  id v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t signpostId;
  uint64_t v28;
  _QWORD v30[4];
  PHFetchResultInstrumentation *v31;
  id v32;
  id v33;
  id v34;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t v41[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(PHFetchResultInstrumentation);
  v10 = v7;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    objc_msgSend(v10, "fetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importantFetchName");
    v12 = objc_claimAutoreleasedReturnValue();
    importantFetchName = v9->_importantFetchName;
    v9->_importantFetchName = (NSString *)v12;

    objc_msgSend(v10, "fetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_suppressSlowFetchReports = objc_msgSend(v14, "suppressSlowFetchReports");

    objc_msgSend(v10, "fetchRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (kdebug_is_enabled())
    {
      PLPhotoKitGetLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = os_signpost_id_generate(v16);

      v18 = v16;
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        objc_msgSend(v15, "entityName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchObjectIDs", "Entity: %@", (uint8_t *)&buf, 0xCu);

      }
      log = v9->_fetchSignpost.log;
      v9->_fetchSignpost.log = (OS_os_log *)v19;

      v9->_fetchSignpost.signpostId = v17;
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__43764;
  v39 = __Block_byref_object_dispose__43765;
  v40 = 0;
  objc_msgSend(v10, "fetchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __55__PHFetchResult_fetchObjectIDs_inManagedObjectContext___block_invoke;
    v30[3] = &unk_1E35DF9A0;
    p_buf = &buf;
    v31 = v9;
    v32 = v22;
    v33 = v8;
    v34 = v10;
    objc_msgSend(v33, "performBlockAndWait:", v30);

    p_super = &v31->super;
  }
  else
  {
    PLPhotoKitGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_ERROR, "fetchObjectIDs found NULL fetch request, returning empty array", v41, 2u);
    }
  }

  objc_msgSend(a1, "postProcessFetchedObjectIDs:forFetchResult:fetchRequest:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v10, v22);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && kdebug_is_enabled())
  {
    v25 = v9->_fetchSignpost.log;
    v26 = v25;
    signpostId = v9->_fetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = objc_msgSend(v24, "count");
      *(_DWORD *)v41 = 134217984;
      v42 = v28;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v26, OS_SIGNPOST_INTERVAL_END, signpostId, "FetchObjectIDs", "%tu", v41, 0xCu);
    }

  }
  _Block_object_dispose(&buf, 8);

  return v24;
}

- (NSFetchRequest)fetchRequest
{
  void *v2;
  void *v3;

  -[PHFetchResult query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSFetchRequest *)v3;
}

- (PHFetchOptions)fetchOptions
{
  void *v2;
  void *v3;

  -[PHFetchResult query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchOptions *)v3;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PHFetchResult query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = objc_msgSend(v5, "wantsIncrementalChangeDetails");
  else
    v4 = 1;
  -[PHFetchResult setRegisteredForChangeNotificationDeltas:](self, "setRegisteredForChangeNotificationDeltas:", v4);

}

- (void)setRegisteredForChangeNotificationDeltas:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_registeredForChangeNotificationDeltas != a3)
  {
    v3 = a3;
    -[PHFetchResult photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "registerFetchResult:", self);
    else
      objc_msgSend(v5, "unregisterFetchResult:", self);

    self->_registeredForChangeNotificationDeltas = v3;
  }
}

+ (id)postProcessFetchedObjectIDs:(id)a3 forFetchResult:(id)a4 fetchRequest:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "count"))
  {
    v15 = v7;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "resultType") == 2
    && (objc_msgSend(v7, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "indexForKey:", CFSTR("objectID"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "valueAtIndex:", v14, (_QWORD)v29);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v18);
    }

  }
  else
  {
    v15 = v7;
  }
  objc_msgSend(v8, "query", (_QWORD)v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchResult cleanedAndSortedOIDsFrom:usingFetchOptions:](PHFetchResult, "cleanedAndSortedOIDsFrom:usingFetchOptions:", v15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entityName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "photoLibrary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchResult filteredOIDsFrom:usingEntityName:withPhotoLibrary:](PHFetchResult, "filteredOIDsFrom:usingEntityName:withPhotoLibrary:", v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    goto LABEL_16;
LABEL_17:

  return v27;
}

+ (id)filteredOIDsFrom:(id)a3 usingEntityName:(id)a4 withPhotoLibrary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "allowedEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v7;
  else
    v11 = (id)MEMORY[0x1E0C9AA60];

  return v11;
}

+ (id)cleanedAndSortedOIDsFrom:(id)a3 usingFetchOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHPhotoLibrary uniquedOIDs:](PHPhotoLibrary, "uniquedOIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customObjectIDSortOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsObject:", v16))
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }
    v27 = v5;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          if ((objc_msgSend(v17, "containsObject:", v23) & 1) == 0)
            objc_msgSend(v10, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v20);
    }

    v6 = v26;
    v5 = v27;
  }
  else
  {
    v10 = v7;
  }
  v24 = v10;

  return v24;
}

- (NSArray)fetchedObjectIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "oids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSUInteger)count
{
  void *v3;
  NSUInteger v4;

  if (self->_prefetchCount)
    return -[NSNumber unsignedIntegerValue](self->_prefetchCount, "unsignedIntegerValue");
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)fetchedObjectsUsingManagedObjectContext:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  PHBatchFetchingArray *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PHFetchResult_fetchedObjectsUsingManagedObjectContext___block_invoke;
  v9[3] = &unk_1E35DF9E8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, v9);
  v7 = self->_fetchedObjects;

  return v7;
}

- (NSArray)fetchedObjects
{
  return (NSArray *)-[PHFetchResult fetchedObjectsUsingManagedObjectContext:](self, "fetchedObjectsUsingManagedObjectContext:", 0);
}

+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3
{
  return a3;
}

- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5
{
  return 0;
}

void __55__PHFetchResult_fetchObjectIDs_inManagedObjectContext___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v18 = 0;
  if (v2)
  {
    v5 = v4;
    v6 = v3;
    objc_opt_class();
    objc_msgSend(v5, "_delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v9, "setPhotoKitFetchInstrumentation:", v2);
    objc_msgSend(v5, "executeFetchRequest:error:", v6, &v18);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPhotoKitFetchInstrumentation:", 0);
    v11 = v18;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v12 = v11;
  v13 = *(_QWORD *)(a1[8] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;

  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = a1[5];
      v17 = a1[7];
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_FAULT, "Error executing fetch %@ for %@: %@", buf, 0x20u);
    }

  }
}

- (PHFetchResult)initWithQuery:(id)a3
{
  return -[PHFetchResult initWithQuery:registerIfNeeded:](self, "initWithQuery:registerIfNeeded:", a3, 1);
}

- (NSSet)fetchedObjectIDsSet
{
  void *v2;
  void *v3;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oidsSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (id)firstObject
{
  void *v2;
  void *v3;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectAtIndex:(NSUInteger)index
{
  void *v4;
  void *v5;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", index);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  void *v4;
  void *v5;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", idx);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PHFetchResult)initWithMediaTypeCounts:(id)a3
{
  id v5;
  PHFetchResult *v6;
  PHFetchResult *v7;

  v5 = a3;
  v6 = -[PHFetchResult init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaTypeCounts, a3);

  return v7;
}

- (NSArray)thumbnailAssets
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[5];
  id v11;
  void *v12;

  v3 = objc_opt_class();
  if (!self->_thumbnailAssets)
  {
    v4 = (void *)v3;
    v5 = -[PHFetchResult count](self, "count");
    if (v5 > objc_msgSend(v4, "batchSize"))
    {
      if (-[PHFetchResult _canCreateFetchedPropertyObjectsWithClass:](self, "_canCreateFetchedPropertyObjectsWithClass:", v4))
      {
        -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        isolationQueue = self->_isolationQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __32__PHFetchResult_thumbnailAssets__block_invoke;
        block[3] = &unk_1E35DFA38;
        v11 = v6;
        v12 = v4;
        block[4] = self;
        v8 = v6;
        dispatch_sync(isolationQueue, block);

      }
    }
  }
  return self->_thumbnailAssets;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PHQuery photoLibrary](self->_query, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterFetchResult:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHFetchResult;
  -[PHFetchResult dealloc](&v4, sel_dealloc);
}

- (NSUInteger)indexOfObject:(id)anObject
{
  id v4;
  void *v5;
  NSUInteger v6;

  v4 = anObject;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mediaTypeCounts, 0);
  objc_storeStrong((id *)&self->_prefetchCount, 0);
  objc_storeStrong((id *)&self->_thumbnailAssets, 0);
  objc_storeStrong(&self->_changeHandlingKey, 0);
  objc_storeStrong((id *)&self->_seedOIDs, 0);
  objc_storeStrong((id *)&self->_fetchedPropertySetsCache, 0);
  objc_storeStrong((id *)&self->_fetchedObjects, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_fetchType, 0);
}

- (id)pl_photoLibraryObject
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PHFetchResult *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  void *v54;
  id v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  PHFetchResult *v59;
  __int16 v60;
  NSObject *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAdoptionUtilities.m"), 208, CFSTR("This is only callable on the main thread"));

  }
  -[PHFetchResult containerIdentifier](self, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x19AEBEADC]();
  -[PHFetchResult photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainQueueConcurrencyPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PHFetchResult firstObject](self, "firstObject");
    v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[PHFetchResult isTransient](v11, "isTransient"))
        {
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __59__PHFetchResult_PHAdoptionUtilities__pl_photoLibraryObject__block_invoke;
          v53[3] = &unk_1E35D83D0;
          v53[4] = self;
          v54 = v13;
          v12 = v13;
          -[PHFetchResult enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v53);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71B18]), "initWithAssetContainers:", v12);
          v14 = v54;
LABEL_47:

LABEL_48:
          goto LABEL_49;
        }
      }
    }
    objc_msgSend((id)objc_opt_class(), "managedEntityName");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PHFetchResult objectIDs](self, "objectIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_17:
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setPredicate:", v19);

          objc_msgSend(v8, "executeFetchRequest:error:", v18, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
          v44 = v16;
          if (v20)
          {
            v43 = v5;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
            v22 = objc_claimAutoreleasedReturnValue();
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v42 = v20;
            v23 = v20;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v50 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                  objc_msgSend(v28, "objectID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKey:](v22, "setObject:forKey:", v28, v29);

                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v25);
            }

            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v23, "count"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v31 = v44;
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v46;
              do
              {
                for (j = 0; j != v33; ++j)
                {
                  if (*(_QWORD *)v46 != v34)
                    objc_enumerationMutation(v31);
                  -[NSObject objectForKey:](v22, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                    objc_msgSend(v30, "addObject:", v36);

                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
              }
              while (v33);
            }

            +[PHAsset managedEntityName](PHAsset, "managedEntityName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[NSObject isEqualToString:](v12, "isEqualToString:", v37);

            if (v38)
              v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71B10]), "initWithTitle:assets:", &stru_1E35DFFF8, v30);
            else
              v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71B18]), "initWithAssetContainers:", v30);
            v10 = (void *)v39;
            v20 = v42;
            v5 = v43;

          }
          else
          {
            PLPhotoKitGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = 0;
              _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "Failed to fetch managedObject for fetchresult result: %@", buf, 0xCu);
            }
            v10 = 0;
          }

          v14 = v44;
          goto LABEL_47;
        }
LABEL_19:
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLPhotoKitGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v59 = self;
          v60 = 2112;
          v61 = v12;
          v62 = 2112;
          v63 = v16;
          _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "Cannot to fetch managedObject for fetchresult result: %@, with entityName %@ and objectIDs %@", buf, 0x20u);
        }

        goto LABEL_22;
      }
      -[PHFetchResult query](self, "query");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "entityName");
      v12 = objc_claimAutoreleasedReturnValue();

    }
    if (!v12)
      goto LABEL_19;
    goto LABEL_17;
  }
  -[PHFetchResult containerIdentifier](self, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v8, "existingObjectWithID:error:", v9, &v55);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (PHFetchResult *)v55;

  if (!v10)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch container for fetchresult: %@", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_48;
  }
LABEL_49:

  objc_autoreleasePoolPop(v5);
  return v10;
}

void __59__PHFetchResult_PHAdoptionUtilities__pl_photoLibraryObject__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v5, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIncludeHiddenAssets:", 1);
  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pl_photoLibraryObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4
{
  return +[PHFetchResult pl_fetchResultContainingAssetContainer:photoLibrary:includeTrash:](PHFetchResult, "pl_fetchResultContainingAssetContainer:photoLibrary:includeTrash:", a3, a4, 0);
}

+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  PHAssetCollection *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  _QWORD v78[3];

  v5 = a5;
  v78[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v11 = objc_msgSend(v10, "isEqual:", objc_opt_class());
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v8, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("self IN %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v16);

    +[PHAssetCollection fetchMomentsWithOptions:](PHAssetCollection, "fetchMomentsWithOptions:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_72;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v8;
    v19 = objc_msgSend(v18, "kindValue");
    switch(v19)
    {
      case 1605:
        v20 = 2;
        v21 = 201;
        goto LABEL_69;
      case 1606:
        v20 = 2;
        v21 = 202;
        goto LABEL_69;
      case 1607:
      case 1608:
      case 1625:
      case 1629:
      case 1633:
      case 1635:
      case 1637:
      case 1638:
        goto LABEL_36;
      case 1609:
        v20 = 2;
        v21 = 203;
        goto LABEL_69;
      case 1610:
        v20 = 2;
        v21 = 204;
        goto LABEL_69;
      case 1611:
        v20 = 2;
        v21 = 205;
        goto LABEL_69;
      case 1612:
        v58 = 200;
        goto LABEL_67;
      case 1613:
        v20 = 2;
        v21 = 209;
        goto LABEL_69;
      case 1614:
        v20 = 2;
        v21 = 207;
        goto LABEL_69;
      case 1615:
        v20 = 2;
        v21 = 208;
        goto LABEL_69;
      case 1616:
        v20 = 2;
        v21 = 206;
        goto LABEL_69;
      case 1617:
        v20 = 2;
        v21 = 210;
        goto LABEL_69;
      case 1618:
        v20 = 2;
        v21 = 211;
        goto LABEL_69;
      case 1619:
        objc_msgSend(v12, "setIncludePlacesSmartAlbum:", 1);
        v58 = 202;
        goto LABEL_67;
      case 1620:
        v20 = 2;
        v21 = 212;
        goto LABEL_69;
      case 1621:
        v20 = 2;
        v21 = 213;
        goto LABEL_69;
      case 1622:
        v20 = 2;
        v21 = 214;
        goto LABEL_69;
      case 1623:
        v20 = 2;
        v21 = 215;
        goto LABEL_69;
      case 1624:
        v20 = 2;
        v21 = 216;
        goto LABEL_69;
      case 1626:
        objc_msgSend(v12, "setIncludeRecentlyEditedSmartAlbum:", 1);
        v21 = 1000000206;
        goto LABEL_68;
      case 1627:
        objc_msgSend(v12, "setIncludeScreenRecordingsSmartAlbum:", 1);
        v58 = 206;
        goto LABEL_67;
      case 1628:
        objc_msgSend(v12, "setIncludeAllPhotosSmartAlbum:", 1);
        v58 = 204;
        goto LABEL_67;
      case 1630:
        v20 = 2;
        v21 = 217;
        goto LABEL_69;
      case 1631:
        v20 = 2;
        v21 = 218;
        goto LABEL_69;
      case 1632:
        objc_msgSend(v12, "setIncludeProResSmartAlbum:", 1);
        v58 = 210;
        goto LABEL_67;
      case 1634:
        objc_msgSend(v12, "setIncludeDuplicatesAlbums:", 1);
        v21 = 1000000212;
        goto LABEL_68;
      case 1636:
        objc_msgSend(v12, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", 1);
        v21 = 1000000214;
        goto LABEL_68;
      case 1639:
        v20 = 2;
        v21 = 219;
        goto LABEL_69;
      case 1640:
        v21 = 1000000218;
        goto LABEL_68;
      case 1641:
        v58 = 218;
LABEL_67:
        v21 = v58 | 0x3B9ACA01;
LABEL_68:
        v20 = 2;
        goto LABEL_69;
      default:
        if (v19 != 1000)
        {
LABEL_36:
          objc_msgSend(v18, "objectID");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v77 = v29;
          v36 = (void *)MEMORY[0x1E0C99D20];
          v37 = &v77;
          goto LABEL_37;
        }
        v20 = 1;
        v21 = 1000000001;
LABEL_69:
        +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", v20, v21, v12);
        v26 = objc_claimAutoreleasedReturnValue();
        break;
    }
    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "backingAlbum");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v18, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "predicateWithFormat:", CFSTR("self IN %@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setInternalPredicate:", v25);

      +[PHAssetCollection fetchMomentsWithOptions:](PHAssetCollection, "fetchMomentsWithOptions:", v12);
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_70:
      v17 = (void *)v26;
      goto LABEL_71;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
LABEL_71:

      goto LABEL_72;
    }
    if (objc_msgSend(v18, "kindValue") == 1628)
      objc_msgSend(v12, "setIncludeAllPhotosSmartAlbum:", 1);
    objc_msgSend(v18, "objectID");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v75 = v29;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = &v75;
LABEL_37:
    objc_msgSend(v36, "arrayWithObjects:count:", v37, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollection fetchAssetCollectionsWithObjectIDs:options:](PHAssetCollection, "fetchAssetCollectionsWithObjectIDs:options:", v57, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
    goto LABEL_71;
  }
  v27 = (void *)objc_opt_class();
  if (objc_msgSend(v27, "isEqual:", NSClassFromString(CFSTR("PUMapAlbum"))))
  {
    objc_msgSend(v12, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v8, "assets");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke;
    v66[3] = &unk_1E35D83F8;
    v67 = v28;
    v29 = v28;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v66);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v30);

    objc_msgSend(v12, "setIncludeAssetSourceTypes:", 7);
    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:title:](PHAssetCollection, "transientAssetCollectionWithAssetFetchResult:title:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHCollection fetchCollectionsInCollectionList:options:](PHAssetCollection, "fetchCollectionsInCollectionList:options:", v35, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v38 = (void *)objc_opt_class(),
        (objc_msgSend(v38, "isEqual:", NSClassFromString(CFSTR("PXFeedAssetsSectionInfo"))) & 1) != 0)
    || (v39 = (void *)objc_opt_class(),
        (objc_msgSend(v39, "isEqual:", NSClassFromString(CFSTR("PXFeedCommentsSectionInfo"))) & 1) != 0)
    || (v40 = (void *)objc_opt_class(),
        (objc_msgSend(v40, "isEqual:", NSClassFromString(CFSTR("PXFeedSubscriptionSectionInfo"))) | v11) == 1))
  {
    v63 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v12, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v8, "assets");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke_2;
    v64[3] = &unk_1E35D83F8;
    v43 = v42;
    v65 = v43;
    v62 = v41;
    objc_msgSend(v41, "enumerateObjectsUsingBlock:", v64);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v44);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortDescriptors:", v46);

    objc_msgSend(v12, "setCustomObjectIDSortOrder:", v43);
    if (v11)
      objc_msgSend(v12, "setIncludeAllBurstAssets:", 1);
    if (v5)
      objc_msgSend(v12, "setIncludeTrashedAssets:", 1);
    objc_msgSend(v12, "setIncludeAssetSourceTypes:", 7);
    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v12);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "performSelector:", sel_transientIdentifier);
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v11)
      {
        v49 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v8, "uuid");
      v48 = objc_claimAutoreleasedReturnValue();
    }
    v49 = (void *)v48;
LABEL_30:
    v50 = objc_msgSend(v8, "canShowComments");
    if ((_DWORD)v50)
      v51 = 101;
    else
      v51 = 200;
    v52 = [PHAssetCollection alloc];
    objc_msgSend(v8, "localizedTitle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:](v52, "initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:", 0, v47, v53, v49, 2, v51);

    objc_msgSend(v54, "_setCanShowCloudComments:", v50);
    v72 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", v55, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHCollection fetchCollectionsInCollectionList:options:](PHAssetCollection, "fetchCollectionsInCollectionList:options:", v56, v63);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_72;
  }
  PLPhotoKitGetLog();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = v61;
    v70 = 2112;
    v71 = v8;
    _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_DEBUG, "##### %@: Unhandled album %@", buf, 0x16u);

  }
  v17 = 0;
LABEL_72:

  return v17;
}

+ (id)pl_filterPredicateForAssetContainer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAdoptionUtilities.m"), 490, CFSTR("This is only callable on the main thread"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "backingAlbum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "predicate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)pl_fetchResultForAssetContainerList:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:options:](PHCollectionList, "fetchCollectionListsWithLocalIdentifiers:options:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[PHCollection fetchCollectionsInCollectionList:options:](PHCollection, "fetchCollectionsInCollectionList:options:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSClassFromString(CFSTR("PXFeedAssetContainerList"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "performSelector:", sel_transientIdentifier);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v5, "containers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:photoLibrary:](PHAssetCollection, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v27), v6);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              objc_msgSend(v22, "addObject:", v28);

            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v25);
      }

      +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v22, &stru_1E35DFFF8, v11, v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHCollection fetchCollectionsInCollectionList:options:](PHCollection, "fetchCollectionsInCollectionList:options:", v29, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "containers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v13;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v11);
            +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:photoLibrary:](PHAssetCollection, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18), v6, (_QWORD)v31);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v14, "addObject:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v16);
      }

      +[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", v14, &stru_1E35DFFF8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHCollection fetchCollectionsInCollectionList:options:](PHCollection, "fetchCollectionsInCollectionList:options:", v20, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

+ (id)pl_fetchResultForStandInAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "pl_assetContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainQueueConcurrencyPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "albumListForAlbumOfKind:", objc_msgSend(v4, "kindValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchResult pl_fetchResultForAssetContainerList:photoLibrary:](PHFetchResult, "pl_fetchResultForAssetContainerList:photoLibrary:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (PHFetchResult)initWithQuery:(id)a3 registerIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  PHFetchResult *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "seedOIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:](self, "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v7, v8, v4, 0);

  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_FAULT, "PHFetchRequest initWithQuery: initialized with nil query", v12, 2u);
    }

    v9 = -[PHFetchResult init](self, "init");
  }

  return v9;
}

- (PHFetchResult)initWithExistingFetchResult:(id)a3 filteredObjectIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PHFetchResult *v22;
  PHManualFetchResult *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (v9)
  {
    objc_msgSend(v9, "fetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = v13;
    if (v12)
    {
      if (v13)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _appendFetchOptionsPredicate(PHFetchOptions *__strong, NSPredicate *__strong)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PHFetchResult.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchOptions"));

      if (v14)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _appendFetchOptionsPredicate(PHFetchOptions *__strong, NSPredicate *__strong)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PHFetchResult.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

LABEL_4:
    objc_msgSend(v12, "predicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internalPredicate");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15)
    {
      v18 = (void *)MEMORY[0x1E0CB3528];
      v32 = (uint64_t)v15;
      v33 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v20);
    }
    else
    {
      if (!v16)
      {
        objc_msgSend(v12, "setPredicate:", v14);
        goto LABEL_11;
      }
      v21 = (void *)MEMORY[0x1E0CB3528];
      v32 = v16;
      v33 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "andPredicateWithSubpredicates:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setInternalPredicate:", v20);
    }

LABEL_11:
    v22 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:](self, "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v9, v7, objc_msgSend(v6, "isRegisteredForChangeNotificationDeltas"), 0);

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v23 = [PHManualFetchResult alloc];
  objc_msgSend(v6, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchPropertySets");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v23, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, v24, v25, v26, v12, objc_msgSend(v6, "isRegisteredForChangeNotificationDeltas"));

LABEL_14:
  return v22;
}

- (id)copyWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PHFetchResult *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  PHFetchResultMediaTypeCounts *mediaTypeCounts;

  v4 = a3;
  -[PHFetchResult query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "chunkSizeForFetch");

  objc_msgSend(v5, "fetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cacheSizeForFetch");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chunkSizeForFetch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheSizeForFetch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invalidateCache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("registerIfNeeded"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v7 != objc_msgSend(v10, "integerValue")
    || v11 && v9 != objc_msgSend(v11, "integerValue")
    || v12 && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
    v14 = 0;
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    v14 = v13 == 0;
    if (!v5)
    {
LABEL_13:
      v18 = (PHFetchResult *)-[PHFetchResult copy](self, "copy");
      goto LABEL_25;
    }
  }
  if (v14)
    goto LABEL_13;
  objc_msgSend(v5, "fetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v5, "fetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
  }
  else
  {
    -[PHFetchResult photoLibrary](self, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "librarySpecificFetchOptions");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;

  if (v10)
    objc_msgSend(v19, "setChunkSizeForFetch:", objc_msgSend(v10, "integerValue"));
  if (v11)
    objc_msgSend(v19, "setCacheSizeForFetch:", objc_msgSend(v11, "integerValue"));
  v20 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v20, "setFetchOptions:", v19);
  -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v22 = objc_msgSend(v13, "BOOLValue");
  else
    v22 = -[PHFetchResult isRegisteredForChangeNotificationDeltas](self, "isRegisteredForChangeNotificationDeltas");
  v18 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:]([PHFetchResult alloc], "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v20, v21, v22, 0);
  if (objc_msgSend(v21, "count"))
  {
    -[PHFetchResult _mediaTypeCounts](self, "_mediaTypeCounts");
    v23 = objc_claimAutoreleasedReturnValue();
    mediaTypeCounts = v18->_mediaTypeCounts;
    v18->_mediaTypeCounts = (PHFetchResultMediaTypeCounts *)v23;

  }
LABEL_25:

  return v18;
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefetchObjectsAtIndexes:", v4);

}

- (void)prefetchThumbnailAssetsAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHFetchResult thumbnailAssets](self, "thumbnailAssets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefetchObjectsAtIndexes:", v4);

}

- (id)changeHandlingKey
{
  id changeHandlingKey;
  NSObject *v4;
  id v5;
  int v7;
  PHFetchResult *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  changeHandlingKey = self->_changeHandlingKey;
  if (!changeHandlingKey)
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Missing required change handling key for fetch result %@", (uint8_t *)&v7, 0xCu);
    }

    changeHandlingKey = self->_changeHandlingKey;
  }
  objc_msgSend((id)objc_opt_class(), "emptyFetchResultChangeHandlingKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (changeHandlingKey == v5)
    return 0;
  else
    return self->_changeHandlingKey;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PHFetchResult *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PHFetchResult query](self, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatedQueryWithChange:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:]([PHFetchResult alloc], "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v12, v10, 0, v8);
  return v13;
}

- (NSArray)fetchSortDescriptors
{
  void *v2;
  void *v3;

  -[PHFetchResult fetchRequest](self, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (int64_t)collectionFetchType
{
  void *v2;
  int64_t v3;

  -[PHFetchResult query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collectionFetchType");

  return v3;
}

- (id)containerIdentifier
{
  void *v2;
  void *v3;

  -[PHFetchResult query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectIDs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchedPropertiesForPropertySetClass:(Class)a3
{
  void *v5;
  NSObject *isolationQueue;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  Class v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__43764;
  v18 = __Block_byref_object_dispose__43765;
  -[NSDictionary objectForKeyedSubscript:](self->_fetchedPropertySetsCache, "objectForKeyedSubscript:");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15[5]
    && -[PHFetchResult _canCreateFetchedPropertyObjectsWithClass:](self, "_canCreateFetchedPropertyObjectsWithClass:", a3))
  {
    -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isolationQueue = self->_isolationQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PHFetchResult_fetchedPropertiesForPropertySetClass___block_invoke;
    v10[3] = &unk_1E35DFA10;
    v12 = &v14;
    v13 = a3;
    v10[4] = self;
    v11 = v5;
    v7 = v5;
    dispatch_sync(isolationQueue, v10);

  }
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)fetchPropertiesForPropertySetClass:(Class)a3 forObjectsAtIndexes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[PHFetchResult _canCreateFetchedPropertyObjectsWithClass:](self, "_canCreateFetchedPropertyObjectsWithClass:", a3))
  {
    -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHFetchResult _createFetchedPropertyObjectsWithClass:fetchedObjectIDs:](self, "_createFetchedPropertyObjectsWithClass:fetchedObjectIDs:", a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_canCreateFetchedPropertyObjectsWithClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == -[PHFetchResult count](self, "count"))
  {
    -[PHFetchResult fetchType](self, "fetchType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class fetchType](a3, "fetchType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_createFetchedPropertyObjectsWithClass:(Class)a3 fetchedObjectIDs:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PHBatchFetchingArray *v11;
  void *v12;
  PHBatchFetchingArray *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("batchSize");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", -[objc_class batchSize](a3, "batchSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = CFSTR("cacheSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[objc_class cacheSize](a3, "cacheSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = CFSTR("fetchedObjectBatchPropertySetClass");
  v16[1] = v9;
  v16[2] = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PHBatchFetchingArray alloc];
  -[PHFetchResult photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHBatchFetchingArray initWithOIDs:options:photoLibrary:](v11, "initWithOIDs:options:photoLibrary:", v7, v10, v12);

  return v13;
}

- (BOOL)isRegisteredForChangeNotificationDeltas
{
  return self->_registeredForChangeNotificationDeltas;
}

- (unint64_t)_possibleChangesFromDetectionCriteriaForChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;

  v4 = a3;
  -[PHFetchResult query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetectionCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "intersectsWithDetectionCriteria:managedObjectContext:", v7, v9);

  if (v10)
    v11 = 15;
  else
    v11 = 0;

  return v11;
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  return -[PHFetchResult possibleChangesForChange:propertiesFetchResult:](self, "possibleChangesForChange:propertiesFetchResult:", a3, 0);
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  char v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  int v56;
  id v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  void *v63;
  int v64;
  uint64_t *v65;
  uint64_t v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  PHFetchResult *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD *v98;
  _BYTE *v99;
  uint64_t *v100;
  _QWORD v101[5];
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint8_t v112[128];
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v86 = a4;
  v108 = 0;
  v109 = &v108;
  v110 = 0x2020000000;
  v111 = 0;
  v83 = self;
  if ((unint64_t)(-[PHFetchResult collectionFetchType](self, "collectionFetchType") - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    -[PHFetchResult fetchRequest](self, "fetchRequest");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "entity");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      -[PHFetchResult query](self, "query");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult fetchedObjectIDsSet](self, "fetchedObjectIDsSet");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "changedRelationshipsByOID");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "changedAttributesByOID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult containerIdentifier](self, "containerIdentifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v87, "containerToObjectRelationshipIndexValue");
      if (!v80)
        goto LABEL_14;
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v88, "updatedObjectIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v80);

        if (v10)
        {
          objc_msgSend(v84, "objectForKeyedSubscript:", v80);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedLongLongValue");

          if ((objc_msgSend(v87, "containerToObjectRelationshipIndexValue") & v12) != 0)
            v109[3] |= 7uLL;
        }
      }
      objc_msgSend(v85, "objectForKeyedSubscript:", v80);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedLongLongValue");

      v15 = objc_msgSend(v87, "containerSortingAttributesIndexValue");
      v16 = objc_msgSend(v87, "containerUserQueryIndexValue");
      if ((v15 & v14) != 0)
        v109[3] |= 4uLL;
      if ((v16 & v14) != 0)
        v109[3] |= 3uLL;
      if (!v8)
      {
LABEL_14:
        objc_msgSend(v88, "insertedObjectIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = _oidsContainEntity(v17, v89);

        if (v18)
        {
          if (v86)
          {
            v106 = 0u;
            v107 = 0u;
            v104 = 0u;
            v105 = 0u;
            objc_msgSend(v88, "insertedObjectIDs");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v105;
              while (2)
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v105 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
                  objc_msgSend(v23, "entity");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "isKindOfEntity:", v89);

                  if ((v25 & 1) != 0)
                  {
                    v103 = 0;
                    v26 = objc_msgSend(v86, "evaluateQuery:withObjectID:outMissingPropertyNames:", v87, v23, &v103);
                    v27 = v103;
                    if (objc_msgSend(v27, "count"))
                    {
                      PLPhotoKitGetLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = v23;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v27;
                        *(_WORD *)&buf[22] = 2112;
                        v114 = (uint64_t (*)(uint64_t, uint64_t))v87;
                        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "Unable to perform detailed change handling for inserts, falling back to refetch, oid:%@ missing properties:%@ for query:%@", buf, 0x20u);
                      }

LABEL_37:
                      v109[3] |= 1uLL;

                      goto LABEL_38;
                    }
                    if ((v26 & 1) != 0)
                      goto LABEL_37;

                  }
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
                if (v20)
                  continue;
                break;
              }
            }
LABEL_38:

          }
          else
          {
            v109[3] |= 1uLL;
          }
        }
        objc_msgSend(v88, "deletedObjectIDs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = _oidsContainEntity(v31, v89);

        if (v32)
          v109[3] |= 2uLL;
      }
      objc_msgSend(v88, "updatedObjectIDs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(v87, "filteringOids");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "updatedObjectIDs");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "intersectsSet:", v35);

        if (v36)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v114 = __Block_byref_object_copy__43764;
          v115 = __Block_byref_object_dispose__43765;
          v116 = 0;
          v101[0] = 0;
          v101[1] = v101;
          v101[2] = 0x3032000000;
          v101[3] = __Block_byref_object_copy__43764;
          v101[4] = __Block_byref_object_dispose__43765;
          v102 = 0;
          objc_msgSend(v87, "filteringOids");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "updatedObjectIDs");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __64__PHFetchResult_possibleChangesForChange_propertiesFetchResult___block_invoke;
          v95[3] = &unk_1E35DFA68;
          v98 = v101;
          v99 = buf;
          v96 = v87;
          v97 = v84;
          v100 = &v108;
          objc_msgSend(v37, "ph_enumerateIntersectionWithSet:usingBlock:", v38, v95);

          _Block_object_dispose(v101, 8);
          _Block_object_dispose(buf, 8);

        }
      }
      v39 = objc_msgSend(v87, "objectToContainerRelationshipIndexValue");
      v82 = objc_msgSend(v87, "filteringAttributesIndexValue");
      v40 = objc_msgSend(v87, "filteringRelationshipsIndexValue");
      v41 = objc_msgSend(v87, "sortingAttributesIndexValue");
      v42 = objc_msgSend(v88, "anyUpdatedObjectsWithChangedAttributes:ofEntity:", v82, v89);
      v43 = v40 & ~v39;
      if ((v42 | objc_msgSend(v88, "anyUpdatedObjectsWithChangedRelationships:ofEntity:", v43, v89)) == 1)
      {
        if (v86)
        {
          v78 = v41;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          objc_msgSend(v88, "updatedObjectIDs");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
          if (!v45)
            goto LABEL_75;
          v46 = *(_QWORD *)v92;
          while (1)
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v92 != v46)
                objc_enumerationMutation(v44);
              v48 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
              v49 = (void *)MEMORY[0x19AEBEADC]();
              objc_msgSend(v48, "entity");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "isKindOfEntity:", v89);

              if ((v51 & 1) == 0)
              {
                v59 = 5;
                goto LABEL_71;
              }
              objc_msgSend(v85, "objectForKeyedSubscript:", v48);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "unsignedLongLongValue");

              objc_msgSend(v84, "objectForKeyedSubscript:", v48);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "unsignedLongLongValue");

              if (!(v53 & v82 | v55 & v43))
                goto LABEL_67;
              v90 = 0;
              v56 = objc_msgSend(v86, "evaluateQuery:withObjectID:outMissingPropertyNames:", v87, v48, &v90);
              v57 = v90;
              if (objc_msgSend(v57, "count"))
              {
                PLPhotoKitGetLog();
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v48;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v57;
                  *(_WORD *)&buf[22] = 2114;
                  v114 = (uint64_t (*)(uint64_t, uint64_t))v87;
                  _os_log_impl(&dword_1991EC000, v58, OS_LOG_TYPE_ERROR, "Unable to perform detailed change analysis, falling back to refetch, oid:%@ missing properties:%{public}@ for query:%{public}@", buf, 0x20u);
                }

                v109[3] |= 7uLL;
                v59 = 4;
                goto LABEL_71;
              }
              if (objc_msgSend(v81, "containsObject:", v48))
              {
                if ((v56 & 1) == 0)
                  v109[3] |= 2uLL;
                if ((v53 & v78) == 0)
                  goto LABEL_66;
                v60 = 4;
                goto LABEL_65;
              }
              if (v56)
              {
                v60 = 1;
LABEL_65:
                v109[3] |= v60;
              }
LABEL_66:

LABEL_67:
              v61 = v109[3];
              if ((v61 & 8) == 0)
              {
                v62 = objc_msgSend(v81, "containsObject:", v48);
                v61 = v109[3];
                if (v62)
                {
                  v61 |= 8uLL;
                  v109[3] = v61;
                }
              }
              v59 = 4 * (v61 == 15);
LABEL_71:
              objc_autoreleasePoolPop(v49);
              if (v59 != 5 && v59)
                goto LABEL_75;
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
            if (!v45)
            {
LABEL_75:

              goto LABEL_82;
            }
          }
        }
        objc_msgSend(v88, "updatedObjectIDs");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "isSubsetOfSet:", v81);

        if (v64)
        {
          v65 = v109;
          v66 = v109[3] | 6;
        }
        else
        {
          objc_msgSend(v88, "updatedObjectIDs");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "intersectsSet:", v81);

          v65 = v109;
          v69 = v109[3];
          if (v68)
            v66 = v69 | 7;
          else
            v66 = v69 | 1;
        }
        v65[3] = v66;
      }
LABEL_82:
      v70 = -[PHFetchResult _possibleChangesFromDetectionCriteriaForChange:](v83, "_possibleChangesFromDetectionCriteriaForChange:", v88);
      v109[3] |= v70;
      v71 = objc_msgSend(v87, "possibleChangesForChange:", v88);
      v72 = v109[3];
      v6 = v72 | v71;
      v109[3] = v72 | v71;
      if (((v72 | v71) & 2) == 0)
      {
        objc_msgSend(v88, "deletedObjectIDs");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "intersectsSet:", v81);

        v6 = v109[3];
        if (v74)
        {
          v6 |= 2uLL;
          v109[3] = v6;
        }
      }
      if ((v6 & 8) == 0)
      {
        objc_msgSend(v88, "updatedObjectIDs");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "intersectsSet:", v81);

        v6 = v109[3];
        if (v76)
        {
          v6 |= 8uLL;
          v109[3] = v6;
        }
      }

    }
    else
    {
      PLPhotoKitGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v87 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = CFSTR("non-null");
        if (!v79)
          v29 = CFSTR("nil");
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "returning PHFetchResultChangeKindNone because entity is nil for change with %{public}@ fetchRequest", buf, 0xCu);
      }
      v6 = 0;
    }

    goto LABEL_90;
  }
  v6 = v109[3];
LABEL_90:
  _Block_object_dispose(&v108, 8);

  return v6;
}

- (PHFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  id v4;
  PHFetchResult *v5;
  void *v6;
  PHFetchResult *v7;

  v4 = a3;
  v5 = [PHFetchResult alloc];
  -[PHFetchResult query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:](v5, "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v6, v4, 0, 0);

  return v7;
}

- (BOOL)containsObject:(id)anObject
{
  id v4;
  void *v5;
  char v6;

  v4 = anObject;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSUInteger v9;

  length = range.length;
  location = range.location;
  v7 = anObject;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:inRange:", v7, location, length);

  return v9;
}

- (id)lastObject
{
  void *v2;
  void *v3;

  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  NSIndexSet *v4;
  void *v5;
  void *v6;

  v4 = indexes;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  void *v4;
  id v5;

  v4 = block;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  void *v6;
  id v7;

  v6 = block;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", opts, v6);

}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  void *v8;
  NSIndexSet *v9;
  id v10;

  v8 = block;
  v9 = s;
  -[PHFetchResult fetchedObjects](self, "fetchedObjects");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateObjectsAtIndexes:options:usingBlock:", v9, opts, v8);

}

- (unint64_t)countOfAssetCollections
{
  void *v3;
  unint64_t v4;

  +[PHFetchResult _typesToCountForAssetCollections](PHFetchResult, "_typesToCountForAssetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult getCountOfCollectionsWithCollectionTypes:](self, "getCountOfCollectionsWithCollectionTypes:", v3);
  v4 = -[PHFetchResult cachedCountOfCollectionsWithCollectionTypes:](self, "cachedCountOfCollectionsWithCollectionTypes:", v3);

  return v4;
}

- (unint64_t)countOfCollectionsLists
{
  void *v3;
  unint64_t v4;

  +[PHFetchResult _typesToCountForListCollections](PHFetchResult, "_typesToCountForListCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult getCountOfCollectionsWithCollectionTypes:](self, "getCountOfCollectionsWithCollectionTypes:", v3);
  v4 = -[PHFetchResult cachedCountOfCollectionsWithCollectionTypes:](self, "cachedCountOfCollectionsWithCollectionTypes:", v3);

  return v4;
}

- (unint64_t)cachedCountOfCollectionsWithCollectionTypes:(id)a3
{
  id v4;
  void (**v5)(void *, unint64_t);
  void *v6;
  int v7;
  unint64_t v8;
  _QWORD aBlock[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PHFetchResult_cachedCountOfCollectionsWithCollectionTypes___block_invoke;
  aBlock[3] = &unk_1E35DFAD0;
  aBlock[4] = &v11;
  v5 = (void (**)(void *, unint64_t))_Block_copy(aBlock);
  +[PHFetchResult _typesToCountForAssetCollections](PHFetchResult, "_typesToCountForAssetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "intersectsSet:", v6);

  if (v7)
    v5[2](v5, self->_albumsCount);
  if (objc_msgSend(v4, "containsObject:", &unk_1E36564A0))
    v5[2](v5, self->_sharedAlbumsCount);
  if (objc_msgSend(v4, "containsObject:", &unk_1E3656710))
    v5[2](v5, self->_foldersCount);
  v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)getCountOfCollectionsWithCollectionTypes:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PHFetchResult *v12;
  id v13;

  v9 = a3;
  if (self->_albumsCount == 0x7FFFFFFFFFFFFFFFLL
    || self->_sharedAlbumsCount == 0x7FFFFFFFFFFFFFFFLL
    || self->_foldersCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PHFetchResult objectIDs](self, "objectIDs", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[PHFetchResult photoLibrary](self, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photoLibraryForCurrentQueueQoS");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__PHFetchResult_getCountOfCollectionsWithCollectionTypes___block_invoke;
      v10[3] = &unk_1E35DFAF8;
      v11 = v9;
      v12 = self;
      v13 = v7;
      v8 = v7;
      objc_msgSend(v8, "performBlockAndWait:", v10);

    }
  }

}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[PHFetchResult _mediaTypeCounts](self, "_mediaTypeCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    switch(a3)
    {
      case 0:
        v7 = -[PHFetchResult count](self, "count");
        v8 = objc_msgSend(v6, "photosCount");
        v9 = objc_msgSend(v6, "videosCount");
        v10 = v7 - objc_msgSend(v6, "audiosCount") - (v8 + v9);
        break;
      case 1:
        v11 = objc_msgSend(v5, "photosCount");
        goto LABEL_9;
      case 2:
        v11 = objc_msgSend(v5, "videosCount");
        goto LABEL_9;
      case 3:
        v11 = objc_msgSend(v5, "audiosCount");
LABEL_9:
        v10 = v11;
        break;
      default:
        v10 = 0;
        break;
    }
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (NSUInteger)countOfAssetsWithMediaType:(PHAssetMediaType)mediaType
{
  -[PHFetchResult _updateMediaTypeCountsIfNeeded](self, "_updateMediaTypeCountsIfNeeded");
  return -[PHFetchResult cachedCountOfAssetsWithMediaType:](self, "cachedCountOfAssetsWithMediaType:", mediaType);
}

- (id)_mediaTypeCounts
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateMediaTypeCountsIfNeeded
{
  void *v3;
  id v4;
  void *v5;

  -[PHFetchResult _mediaTypeCounts](self, "_mediaTypeCounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PHFetchResult calculateMediaTypeCounts](self, "calculateMediaTypeCounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    PLRunWithUnfairLock();

    v3 = 0;
  }

}

- (id)calculateMediaTypeCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  PHFetchResultMediaTypeCounts *v8;
  PHFetchResultMediaTypeCounts *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  PHFetchResult *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v3 = (void *)MEMORY[0x19AEBEADC](self, a2);
  -[PHFetchResult fetchedObjectIDs](self, "fetchedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PHFetchResult photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibraryForCurrentQueueQoS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__PHFetchResult_calculateMediaTypeCounts__block_invoke;
    v11[3] = &unk_1E35DFB48;
    v12 = v4;
    v7 = v6;
    v13 = v7;
    v14 = self;
    v15 = &v26;
    v16 = &v22;
    v17 = &v18;
    objc_msgSend(v7, "performBlockAndWait:", v11);

  }
  objc_autoreleasePoolPop(v3);
  v8 = [PHFetchResultMediaTypeCounts alloc];
  v9 = -[PHFetchResultMediaTypeCounts initWithPhotosCount:videosCount:audiosCount:](v8, "initWithPhotosCount:videosCount:audiosCount:", v27[3], v23[3], v19[3]);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v9;
}

- (BOOL)isFullyBackedByObjectIDs
{
  return 1;
}

- (id)localIdentifiers
{
  void *v3;
  PHFetchResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self;
  v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "localIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  NSNumber *prefetchCount;
  uint64_t v5;
  PHBatchFetchingArray *fetchedObjects;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHFetchResult;
  -[PHFetchResult description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  prefetchCount = self->_prefetchCount;
  if (prefetchCount)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" prefetchCount=%lu"), -[NSNumber unsignedLongValue](prefetchCount, "unsignedLongValue"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  fetchedObjects = self->_fetchedObjects;
  if (fetchedObjects)
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" count=%lu"), -[PHBatchFetchingArray count](fetchedObjects, "count"));
  else
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" count=(NA)"), v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHFetchResult containerIdentifier](self, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHFetchResult collectionFetchType](self, "collectionFetchType");
  -[PHFetchResult query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" CID=%@, CFT=%ld query=%@"), v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)chunkSizeForFetch
{
  return self->_chunkSizeForFetch;
}

- (void)setChunkSizeForFetch:(int64_t)a3
{
  self->_chunkSizeForFetch = a3;
}

- (BOOL)preventsClearingOIDCache
{
  return self->_preventsClearingOIDCache;
}

- (void)setPreventsClearingOIDCache:(BOOL)a3
{
  self->_preventsClearingOIDCache = a3;
}

void __41__PHFetchResult_calculateMediaTypeCounts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int16 v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  _QWORD v44[5];

  v44[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIncludesPendingChanges:", 0);
  objc_msgSend(v4, "setPropertiesToGroupBy:", &unk_1E36576C0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(self) IN %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForFunction:arguments:", CFSTR("count:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v10, "setName:", CFSTR("count"));
  objc_msgSend(v10, "setExpression:", v9);
  objc_msgSend(v10, "setExpressionResultType:", 200);
  v44[0] = CFSTR("kind");
  v44[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v11);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v4, &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;

  if (v13)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v16)
    {
      v17 = v16;
      v27 = v14;
      v28 = v9;
      v29 = v6;
      v30 = v4;
      v18 = *(_QWORD *)v33;
      obj = v15;
      while (1)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kind"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "intValue");

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "intValue");

          v25 = a1 + 56;
          if (!v22)
            goto LABEL_12;
          if (v22 == 2)
          {
            v25 = a1 + 72;
LABEL_12:
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v25 + 8) + 24) = v24;
            continue;
          }
          v25 = a1 + 64;
          if (v22 == 1)
            goto LABEL_12;
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (!v17)
        {
          v6 = v29;
          v4 = v30;
          v9 = v28;
          v14 = v27;
          v15 = obj;
          break;
        }
      }
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v39 = v4;
      v40 = 2112;
      v41 = v26;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Error executing media type fetch %@ for %@: %@", buf, 0x20u);
    }
  }

}

void __47__PHFetchResult__updateMediaTypeCountsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v1 + 88);
  v2 = (id *)(v1 + 88);
  if (!v3)
    objc_storeStrong(v2, *(id *)(a1 + 40));
}

id __33__PHFetchResult__mediaTypeCounts__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

void __58__PHFetchResult_getCountOfCollectionsWithCollectionTypes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[4];

  v49[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71778], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(v4, "setIncludesPendingChanges:", 0);
  v49[0] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToGroupBy:", v5);

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForFunction:arguments:", CFSTR("count:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v10, "setName:", CFSTR("count"));
  objc_msgSend(v10, "setExpression:", v9);
  objc_msgSend(v10, "setExpressionResultType:", 200);
  v48[0] = CFSTR("kind");
  v48[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v11);

  objc_msgSend(v4, "setResultType:", 2);
  v12 = (void *)MEMORY[0x1E0CB3880];
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K in %@ AND self IN %@ AND trashedState == %d"), CFSTR("kind"), v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v15);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = 0;
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v16, "executeFetchRequest:error:", v4, &v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v40;

  if (v17)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v20)
    {
      v21 = v20;
      v32 = v18;
      v33 = v10;
      v34 = v9;
      v35 = v4;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kind"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "intValue");

          +[PHFetchResult _typesToCountForAssetCollections](PHFetchResult, "_typesToCountForAssetCollections");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "integerValue") == 1505)
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = v27;
          }
          else if (objc_msgSend(v25, "integerValue") == 4000)
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) = v27;
          }
          else if (objc_msgSend(v28, "containsObject:", v25))
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) += v27;
          }

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v21);
      v4 = v35;
      v10 = v33;
      v9 = v34;
      v18 = v32;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v43 = v4;
      v44 = 2112;
      v45 = v29;
      v46 = 2112;
      v47 = v18;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Error executing count of collections fetch %@ for %@: %@", buf, 0x20u);
    }
  }

  v30 = *(_QWORD *)(a1 + 40);
  v31 = *(_QWORD *)(v30 + 96);
  if (!v31)
    v31 = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v30 + 96) = v31;

}

uint64_t __61__PHFetchResult_cachedCountOfCollectionsWithCollectionTypes___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if (*(_QWORD *)(v2 + 24) == 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0;
    else
      v3 = *(_QWORD *)(v2 + 24);
    *(_QWORD *)(v2 + 24) = v3 + a2;
  }
  return result;
}

void __64__PHFetchResult_possibleChangesForChange_propertiesFetchResult___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v21 = v5;
  objc_msgSend(v5, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(v21, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_baseEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(v21, "entity");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  objc_msgSend(*(id *)(a1 + 32), "filteringRelationshipsIndexValueByBaseEntityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedLongLongValue");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedLongLongValue");

  if ((v20 & v18) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= 1uLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= 2uLL;
    *a3 = 1;
  }

}

void __32__PHFetchResult_thumbnailAssets__block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (_QWORD *)a1[4];
  if (!v2[9])
  {
    objc_msgSend(v2, "_createFetchedPropertyObjectsWithClass:fetchedObjectIDs:", a1[6], a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

  }
}

void __54__PHFetchResult_fetchedPropertiesForPropertySetClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createFetchedPropertyObjectsWithClass:fetchedObjectIDs:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v10;

    objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
    v11 = objc_msgSend(v14, "copy");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v11;

  }
}

+ (id)fetchObjectIDsForCombinableFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__43764;
  v40 = __Block_byref_object_dispose__43765;
  v41 = 0;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "query");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v12);
  }

  +[PHQuery combinedFetchRequestForQueries:](PHQuery, "combinedFetchRequestForQueries:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80__PHFetchResult_fetchObjectIDsForCombinableFetchResults_inManagedObjectContext___block_invoke;
    v24[3] = &unk_1E35DF978;
    v25 = v6;
    v26 = v16;
    v27 = v7;
    v28 = v8;
    v29 = v11;
    v30 = v9;
    v31 = &v36;
    objc_msgSend(v25, "performBlockAndWait:", v24);
    v17 = v37;
    v18 = (void *)v37[5];
    if (v18)
    {
      v19 = v18;
      v20 = (void *)v17[5];
      v17[5] = (uint64_t)v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v37[5];
      v37[5] = v22;
    }

    v21 = (id)v37[5];
  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&v36, 8);
  return v21;
}

+ (id)fetchObjectCount:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  PHFetchResultInstrumentation *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  OS_os_log *log;
  void *v18;
  NSObject *p_super;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t signpostId;
  void *v24;
  _QWORD v26[4];
  PHFetchResultInstrumentation *v27;
  id v28;
  id v29;
  id v30;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PHFetchResultInstrumentation);
  v8 = v5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "fetchRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_suppressSlowFetchReports = objc_msgSend(v11, "suppressSlowFetchReports");

    if (kdebug_is_enabled())
    {
      PLPhotoKitGetLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_id_generate(v12);

      v14 = v12;
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        objc_msgSend(v10, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FetchCount", "Entity: %@", (uint8_t *)&buf, 0xCu);

      }
      log = v7->_fetchSignpost.log;
      v7->_fetchSignpost.log = (OS_os_log *)v15;

      v7->_fetchSignpost.signpostId = v13;
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(v9, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __57__PHFetchResult_fetchObjectCount_inManagedObjectContext___block_invoke;
    v26[3] = &unk_1E35DF9A0;
    p_buf = &buf;
    v27 = v7;
    v28 = v18;
    v29 = v6;
    v30 = v9;
    objc_msgSend(v29, "performBlockAndWait:", v26);

    p_super = &v27->super;
  }
  else
  {
    PLPhotoKitGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_ERROR, "fetchObjectCount found NULL fetch request, returning zero count", v35, 2u);
    }
  }

  if (v7)
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (kdebug_is_enabled())
    {
      v21 = v7->_fetchSignpost.log;
      v22 = v21;
      signpostId = v7->_fetchSignpost.signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)v35 = 134217984;
        v36 = v20;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v22, OS_SIGNPOST_INTERVAL_END, signpostId, "FetchCount", "count: %tu", v35, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  return v24;
}

+ (id)_typesToCountForAssetCollections
{
  if (_typesToCountForAssetCollections_onceToken != -1)
    dispatch_once(&_typesToCountForAssetCollections_onceToken, &__block_literal_global_43824);
  return (id)_typesToCountForAssetCollections_typesToCountForAssetCollections;
}

+ (id)_typesToCountForListCollections
{
  if (_typesToCountForListCollections_onceToken != -1)
    dispatch_once(&_typesToCountForListCollections_onceToken, &__block_literal_global_86_43822);
  return (id)_typesToCountForListCollections_typesToCountForListCollections;
}

void __48__PHFetchResult__typesToCountForListCollections__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3656710, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_typesToCountForListCollections_typesToCountForListCollections;
  _typesToCountForListCollections_typesToCountForListCollections = v0;

}

void __49__PHFetchResult__typesToCountForAssetCollections__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3656488, &unk_1E36564A0, &unk_1E36564B8, &unk_1E36564D0, &unk_1E36564E8, &unk_1E3656500, &unk_1E3656518, &unk_1E3656530, &unk_1E3656548, &unk_1E3656560, &unk_1E3656578, &unk_1E3656590, &unk_1E36565A8, &unk_1E36565C0, &unk_1E36565D8, &unk_1E36565F0, &unk_1E3656608,
    &unk_1E3656620,
    &unk_1E3656638,
    &unk_1E3656650,
    &unk_1E3656668,
    &unk_1E3656680,
    &unk_1E3656698,
    &unk_1E36566B0,
    &unk_1E36566C8,
    &unk_1E36566E0,
    &unk_1E36566F8,
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_typesToCountForAssetCollections_typesToCountForAssetCollections;
  _typesToCountForAssetCollections_typesToCountForAssetCollections = v0;

}

void __57__PHFetchResult_fetchObjectCount_inManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v4 = (void *)a1[6];
  v13 = 0;
  v5 = v2;
  v6 = v4;
  if (v3)
  {
    objc_msgSend(v3, "willExecuteFetchRequestWithContext:", v6);
    v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, &v13);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "didFailFetchRequestWithContext:", v6);
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = v7;
      objc_msgSend(v3, "didExecuteFetchRequestWithContext:resultCount:sqlString:bindVariables:", v6, v7, 0, 0);
    }
  }
  else
  {
    v8 = 0;
  }

  v9 = v13;
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v8;
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = a1[5];
      v12 = a1[7];
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_FAULT, "Error executing count fetch %@ for %@: %@", buf, 0x20u);
    }

  }
}

void __80__PHFetchResult_fetchObjectIDsForCombinableFetchResults_inManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  id obj;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v52 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v52);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v52;
  v6 = v5;
  if (v4)
  {
    v37 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    v43 = a1;
    objc_msgSend(*(id *)(a1 + 56), "combinedQueryKeyPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v38 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("objectID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v42);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v16, v15);
          }
          objc_msgSend(v16, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = *(id *)(a1 + 64);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v17)
    {
      v18 = v17;
      v40 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v45 != v40)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v20, "query");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "combinedQuerySeparatingIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = (void *)MEMORY[0x1E0C9AA60];
          if (v23)
            v25 = (void *)v23;
          v26 = v25;

          objc_msgSend(v20, "query");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fetchOptions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHFetchResult cleanedAndSortedOIDsFrom:usingFetchOptions:](PHFetchResult, "cleanedAndSortedOIDsFrom:usingFetchOptions:", v26, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "fetchRequest");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "entityName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHFetchResult filteredOIDsFrom:usingEntityName:withPhotoLibrary:](PHFetchResult, "filteredOIDsFrom:usingEntityName:withPhotoLibrary:", v29, v31, *(_QWORD *)(v43 + 72));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "setObject:forKeyedSubscript:", v32, v20);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v18);
    }

    v33 = *(_QWORD *)(*(_QWORD *)(v43 + 80) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v41;

    v6 = v37;
    v4 = v38;
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v35 = *(_QWORD *)(a1 + 40);
      v36 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v56 = v35;
      v57 = 2112;
      v58 = v36;
      v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_FAULT, "Error executing combined fetch %@ for %@: %@", buf, 0x20u);
    }
  }

}

@end
