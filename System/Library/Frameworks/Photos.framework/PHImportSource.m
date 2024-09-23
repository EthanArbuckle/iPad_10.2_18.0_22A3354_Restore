@implementation PHImportSource

- (PHImportSource)init
{
  PHImportSource *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  uint64_t v6;
  NSMutableArray *items;
  uint64_t v8;
  NSMutableArray *assets;
  NSMutableDictionary *v10;
  NSMutableDictionary *assetsByImportIdentifier;
  NSMutableDictionary *v12;
  NSMutableDictionary *representationsByImportIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *audioByImportIdentifier;
  NSMutableDictionary *v16;
  NSMutableDictionary *pairedSidecarsByImportIdentifier;
  uint64_t v18;
  NSMutableArray *processed;
  uint64_t v20;
  NSMutableArray *duplicateAssets;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *dupPathCollectionQueue;
  dispatch_queue_t v25;
  OS_dispatch_queue *controlQueue;
  dispatch_queue_t v27;
  OS_dispatch_queue *processingQueue;
  uint64_t v29;
  NSMutableArray *removedSourceFileIdentifiers;
  NSMutableDictionary *v31;
  NSMutableDictionary *importIdentifierToLivePhotoStateMap;
  uint64_t v33;
  NSHashTable *observers;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PHImportSource;
  v2 = -[PHImportExceptionRecorder init](&v36, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    v6 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    assets = v2->_assets;
    v2->_assets = (NSMutableArray *)v8;

    v2->_batchSize = 0;
    v2->_batchCount = 0;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetsByImportIdentifier = v2->_assetsByImportIdentifier;
    v2->_assetsByImportIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    representationsByImportIdentifier = v2->_representationsByImportIdentifier;
    v2->_representationsByImportIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    audioByImportIdentifier = v2->_audioByImportIdentifier;
    v2->_audioByImportIdentifier = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pairedSidecarsByImportIdentifier = v2->_pairedSidecarsByImportIdentifier;
    v2->_pairedSidecarsByImportIdentifier = v16;

    v18 = objc_opt_new();
    processed = v2->_processed;
    v2->_processed = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    duplicateAssets = v2->_duplicateAssets;
    v2->_duplicateAssets = (NSMutableArray *)v20;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("dup path collection", v22);
    dupPathCollectionQueue = v2->_dupPathCollectionQueue;
    v2->_dupPathCollectionQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_create("control queue", v22);
    controlQueue = v2->_controlQueue;
    v2->_controlQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_create("processing queue", v22);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v27;

    v2->_itemsLock._os_unfair_lock_opaque = 0;
    v29 = objc_opt_new();
    removedSourceFileIdentifiers = v2->_removedSourceFileIdentifiers;
    v2->_removedSourceFileIdentifiers = (NSMutableArray *)v29;

    v2->_sourceAccessState = 2;
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    importIdentifierToLivePhotoStateMap = v2->_importIdentifierToLivePhotoStateMap;
    v2->_importIdentifierToLivePhotoStateMap = v31;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v33 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v33;

    v2->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PHImportSource name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addImportSourceObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeImportSourceObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)notifyObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_observersLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSString)name
{
  return (NSString *)&stru_1E35DFFF8;
}

- (NSString)productKind
{
  return (NSString *)&stru_1E35DFFF8;
}

- (NSString)path
{
  return 0;
}

- (CGImage)icon
{
  return 0;
}

- (NSString)iconSymbolName
{
  return 0;
}

- (BOOL)isCamera
{
  return 0;
}

- (BOOL)isAppleDevice
{
  return 0;
}

- (BOOL)canEject
{
  return 0;
}

- (BOOL)isConnectedDevice
{
  return 0;
}

- (BOOL)isLibrary
{
  return 0;
}

- (BOOL)isAvailable
{
  return 1;
}

- (NSString)volumePath
{
  return 0;
}

- (id)requestDeleteAssetsForRecords:(id)a3
{
  return 0;
}

- (BOOL)canDeleteContent
{
  return 0;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isOptimizedCPLStorage
{
  return 0;
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 atEnd:(id)a6
{
  return -[PHImportSource loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:](self, "loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:", a3, a4, a5, 0, a6, 0.0);
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 atEnd:(id)a7
{
  return -[PHImportSource loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:](self, "loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:", a3, a4, a5, a6, a7, 0.0);
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchInterval:(double)a6 atEnd:(id)a7
{
  if (a6 == 0.0)
    a6 = 0.0;
  return -[PHImportSource loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:](self, "loadAssetsForLibrary:allowDuplicates:order:batchSize:batchInterval:atEnd:", a3, a4, a5, 0, a7, a6);
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 batchInterval:(double)a7 atEnd:(id)a8
{
  id v15;
  id v16;
  void *v17;
  PFTimeZoneLookup *v18;
  PFTimeZoneLookup *timeZoneLookup;
  void *v20;
  id completion;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  _QWORD block[5];
  BOOL v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location[2];

  v15 = a3;
  v16 = a8;
  objc_storeStrong((id *)&self->_library, a3);
  objc_msgSend(v15, "photoLibraryBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeZoneLookup");
  v18 = (PFTimeZoneLookup *)objc_claimAutoreleasedReturnValue();
  timeZoneLookup = self->_timeZoneLookup;
  self->_timeZoneLookup = v18;

  v20 = _Block_copy(v16);
  completion = self->_completion;
  self->_completion = v20;

  self->_batchSize = a6;
  v22 = 0.25;
  if (a7 != 0.0)
    v22 = a7;
  self->_batchInterval = v22;
  self->_rampBatchInterval = a7 <= 0.0;
  self->_assetLoadOrder = a5;
  v23 = (void *)MEMORY[0x1E0CB38A8];
  -[PHImportSource items](self, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "discreteProgressWithTotalUnitCount:", objc_msgSend(v24, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setCancellable:", 1);
  objc_initWeak(location, self);
  v26 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke;
  v36[3] = &unk_1E35DE1F8;
  objc_copyWeak(&v37, location);
  objc_msgSend(v25, "setCancellationHandler:", v36);
  objc_msgSend(v25, "setPausable:", 1);
  v34[0] = v26;
  v34[1] = 3221225472;
  v34[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_2;
  v34[3] = &unk_1E35DE1F8;
  objc_copyWeak(&v35, location);
  objc_msgSend(v25, "setPausingHandler:", v34);
  v32[0] = v26;
  v32[1] = 3221225472;
  v32[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_3;
  v32[3] = &unk_1E35DE1F8;
  objc_copyWeak(&v33, location);
  objc_msgSend(v25, "setResumingHandler:", v32);
  objc_msgSend(v25, "setCancellable:", 1);
  -[PHImportSource setProgress:](self, "setProgress:", v25);
  dispatch_get_global_queue(25, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = v26;
  block[1] = 3221225472;
  block[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_4;
  block[3] = &unk_1E35DF138;
  block[4] = self;
  v31 = a4;
  dispatch_async(v27, block);

  -[PHImportSource progress](self, "progress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(location);

  return v28;
}

- (void)pauseAssetLoading
{
  NSObject *controlQueue;
  _QWORD block[5];

  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PHImportSource_pauseAssetLoading__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

- (void)resumeAssetLoading
{
  NSObject *controlQueue;
  _QWORD block[5];

  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PHImportSource_resumeAssetLoading__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

- (void)stopAssetLoading
{
  NSObject *controlQueue;
  _QWORD block[5];

  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PHImportSource_stopAssetLoading__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

- (void)dispatchAssetDataRequestAsync:(id)a3 usingBlock:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)beginWork
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PHImportSource beginWork]";
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportSource_beginWork__block_invoke;
  v4[3] = &unk_1E35DF110;
  v4[4] = self;
  -[PHImportSource beginProcessingWithCompletion:](self, "beginProcessingWithCompletion:", v4);
}

- (void)beginProcessingWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[PHImportSource beginProcessingWithCompletion:]";
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)processNextItems
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PHImportSource_processNextItems__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

- (id)assetsByProcessingItem:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImportSource.m"), 402, CFSTR("Abstract Base Class Method"));

  return 0;
}

- (void)endBatch
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSMutableArray *v41;
  NSMutableArray *processed;
  uint64_t v43;
  uint64_t v44;
  id obj;
  void *v46;
  _QWORD block[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_processed, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v3 = self->_processed;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        -[PHImportSource removedSourceFileIdentifiers](self, "removedSourceFileIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
        {

        }
        else
        {
          v11 = -[NSMutableArray containsObject:](self->_assets, "containsObject:", v8);

          if ((v11 & 1) == 0)
            objc_msgSend(v46, "addObject:", v8);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v5);
  }

  v12 = v46;
  if (objc_msgSend(v46, "count"))
  {
    -[PHImportSource options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "allowDuplicates");

    if ((v14 & 1) == 0)
    {
      -[PHImportSource findDuplicatesOfItems:considerItemsInTheTrash:](self, "findDuplicatesOfItems:considerItemsInTheTrash:", v46, 1);
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v46;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v54;
        v43 = *(_QWORD *)v54;
        do
        {
          v18 = 0;
          v44 = v16;
          do
          {
            if (*(_QWORD *)v54 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v18);
            if (objc_msgSend(v19, "isDuplicate"))
            {
              objc_msgSend(v19, "duplicates");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImportDuplicateChecker duplicatesFromResults:forLibrary:](PHImportDuplicateChecker, "duplicatesFromResults:forLibrary:", v20, self->_library);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v51 = 0u;
              v52 = 0u;
              v49 = 0u;
              v50 = 0u;
              v22 = v21;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v50;
                while (2)
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v50 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                    objc_msgSend(v19, "uuid");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "uuid");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v28, "isEqualToString:", v29);

                    if (v30)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "UUIDString");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setUuid:", v32);

                      goto LABEL_30;
                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                  if (v24)
                    continue;
                  break;
                }
              }
LABEL_30:

              v17 = v43;
              v16 = v44;
            }
            PLImportGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v19, "uuid");
              v34 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "duplicates");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImportDuplicateChecker duplicatesFromResults:forLibrary:](PHImportDuplicateChecker, "duplicatesFromResults:forLibrary:", v35, self->_library);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v62 = v34;
              v63 = 2112;
              v64 = (uint64_t)v36;
              _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEBUG, "asset: %@\n duplicates: %@", buf, 0x16u);

            }
            ++v18;
          }
          while (v18 != v16);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        }
        while (v16);
      }

      v12 = v46;
    }
  }
  PLImportGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v38 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 136315394;
    v62 = "-[PHImportSource endBatch]";
    v63 = 2048;
    v64 = v38;
    _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEBUG, "%s (%lu)", buf, 0x16u);
  }

  if (objc_msgSend(v12, "count"))
  {
    -[PHImportSource assets](self, "assets");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v12);

    dispatch_get_global_queue(25, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PHImportSource_endBatch__block_invoke;
    block[3] = &unk_1E35DF9E8;
    block[4] = self;
    v48 = v12;
    dispatch_async(v40, block);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_processed, "count"));
  v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  processed = self->_processed;
  self->_processed = v41;

}

- (void)endWork
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  PHImportSource *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSMutableDictionary *obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v67 = "-[PHImportSource endWork]";
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = -[NSMutableDictionary count](self->_representationsByImportIdentifier, "count");
  v5 = v3;
  v6 = self;
  objc_msgSend(v5, "arrayWithCapacity:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[NSMutableDictionary allValues](self->_representationsByImportIdentifier, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  v42 = v7;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v55 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v42, "addObject:", v19);
              if (objc_msgSend(v19, "isImage"))
              {
                objc_msgSend(v19, "setResourceType:", 1);
                if (objc_msgSend(v19, "isLivePhoto"))
                {
                  objc_msgSend(v19, "videoComplement");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setResourceType:", 9);

                }
              }
              else if (objc_msgSend(v19, "isMovie"))
              {
                objc_msgSend(v19, "setResourceType:", 2);
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v16);
        }

        v7 = v42;
        if (objc_msgSend(v42, "count"))
        {
          -[PHImportSource options](self, "options");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "allowDuplicates");

          if ((v22 & 1) == 0)
            -[PHImportSource findDuplicatesOfItems:considerItemsInTheTrash:](self, "findDuplicatesOfItems:considerItemsInTheTrash:", v42, 1);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[PHImportSource assets](self, "assets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v7);

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __25__PHImportSource_endWork__block_invoke;
    v52[3] = &unk_1E35DE220;
    v52[4] = self;
    v53 = v7;
    -[PHImportSource notifyObserversUsingBlock:](self, "notifyObserversUsingBlock:", v52);
    -[NSMutableDictionary removeAllObjects](self->_representationsByImportIdentifier, "removeAllObjects");

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_audioByImportIdentifier;
  v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v49;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v49 != v39)
          objc_enumerationMutation(obj);
        v41 = v24;
        v25 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v24);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](v6->_audioByImportIdentifier, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
              v32 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(v31, "fileName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unsupported: %@ was not an audio sidecar for any other resource"), v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "url");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "path");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 0, v36, v34, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportSource.m", 479);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          }
          while (v28);
        }

        v24 = v41 + 1;
        v6 = self;
      }
      while (v41 + 1 != v40);
      v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v40);
  }

}

- (void)addPairedSidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "importIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PHImportSource pairedSidecarsByImportIdentifier](self, "pairedSidecarsByImportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportSource pairedSidecarsByImportIdentifier](self, "pairedSidecarsByImportIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v13);

  }
  objc_msgSend(v4, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v4, "resourceType");

  objc_msgSend(v10, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v12);

}

- (BOOL)isPairedSidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[PHImportSource pairedSidecarsByImportIdentifier](self, "pairedSidecarsByImportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "containsObject:", v10);

  return v11;
}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5
{
  return 0;
}

- (id)processAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSMutableDictionary *assetsByImportIdentifier;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v33 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v11, "importIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (objc_msgSend(v11, "isRepresentation"))
              -[PHImportSource processRepresentation:](self, "processRepresentation:", v11);
            else
              -[PHImportSource processResource:](self, "processResource:", v11);
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            PLImportGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v11, "redactedFileNameDescription");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (void *)MEMORY[0x1E0D731F0];
              objc_msgSend(v11, "parentFolderPath");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "descriptionWithPath:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v50 = v14;
              v51 = 2112;
              v52 = v17;
              _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "Invalid import identifier for %@ (parent path: %@)", buf, 0x16u);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = v5;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          if ((objc_msgSend(v23, "isSidecar") & 1) == 0)
          {
            if (objc_msgSend(v23, "isPrimary"))
              objc_msgSend(v34, "addObject:", v23);
            assetsByImportIdentifier = self->_assetsByImportIdentifier;
            objc_msgSend(v23, "importIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](assetsByImportIdentifier, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v27 = v26;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v36;
              do
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v36 != v30)
                    objc_enumerationMutation(v27);
                  -[PHImportSource addRepresentationsForAsset:](self, "addRepresentationsForAsset:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
              }
              while (v29);
            }

          }
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v20);
    }

    v4 = v33;
  }
  else
  {
    PLImportGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "'assets' was nil", buf, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (void)processRepresentation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSMutableDictionary *representationsByImportIdentifier;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PHImportSource *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PLImportGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
    goto LABEL_51;
  }
  v5 = v4;
  representationsByImportIdentifier = self->_representationsByImportIdentifier;
  -[NSObject importIdentifier](v4, "importIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](representationsByImportIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v56 = self;
  v10 = self->_representationsByImportIdentifier;
  -[NSObject importIdentifier](v5, "importIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v12 = v9;
  v63 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
  if (!v63)
  {
LABEL_43:

    v43 = v55;
    if (!v55)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v56->_representationsByImportIdentifier;
      -[NSObject importIdentifier](v5, "importIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v43, v47);

    }
    PLImportGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject redactedFileNameDescription](v5, "redactedFileNameDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
      v50 = v43;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR(","));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v76 = v49;
      v77 = 2112;
      v78 = v54;
      _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed representation", buf, 0x16u);

      v43 = v50;
    }

    if (-[NSObject isRender](v5, "isRender"))
      objc_msgSend(v43, "insertObject:atIndex:", v5, 0);
    else
      objc_msgSend(v43, "addObject:", v5);
    goto LABEL_50;
  }
  v62 = *(_QWORD *)v65;
  v57 = v12;
  v58 = v5;
LABEL_4:
  v13 = 0;
  while (2)
  {
    if (*(_QWORD *)v65 != v62)
      objc_enumerationMutation(v12);
    v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v13);
    PLImportGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject redactedFileNameDescription](v5, "redactedFileNameDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v61;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "componentsJoinedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "redactedFileNameDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "resourceType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v20);
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v76 = v16;
      v77 = 2112;
      v78 = v17;
      v79 = 2112;
      v80 = v18;
      v81 = 2112;
      v82 = v23;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), processed: %@ (%@)", buf, 0x2Au);

      v14 = v21;
      v5 = v58;

      v12 = v57;
    }

    switch(objc_msgSend(v14, "resourceType"))
    {
      case 5:
        if (-[NSObject resourceType](v5, "resourceType") == 6)
          goto LABEL_25;
        goto LABEL_29;
      case 6:
        if (-[NSObject resourceType](v5, "resourceType") != 5
          || !objc_msgSend(v14, "isVideoComplementOf:", v5))
        {
          goto LABEL_29;
        }
        -[NSObject importIdentifier](v5, "importIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportSource setIsLivePhotoForImportIdentifier:](v56, "setIsLivePhotoForImportIdentifier:", v35);

        PLImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          goto LABEL_42;
        objc_msgSend(v14, "redactedFileNameDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        v77 = 2112;
        v78 = v42;
        goto LABEL_41;
      case 8:
        if (-[NSObject resourceType](v5, "resourceType") != 12)
          goto LABEL_29;
        -[NSObject importIdentifier](v5, "importIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[PHImportSource isLivePhotoForImportIdentifier:](v56, "isLivePhotoForImportIdentifier:", v30);

        if (!v31)
          goto LABEL_29;
        objc_msgSend(v14, "takeAsVideoComplement:", v5);
        goto LABEL_36;
      case 12:
        if (-[NSObject resourceType](v5, "resourceType") != 8)
          goto LABEL_29;
        -[NSObject importIdentifier](v5, "importIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[PHImportSource isLivePhotoForImportIdentifier:](v56, "isLivePhotoForImportIdentifier:", v32);

        if (!v33)
          goto LABEL_29;
        -[NSObject takeAsVideoComplement:](v5, "takeAsVideoComplement:", v14);
        PLImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          goto LABEL_42;
        objc_msgSend(v14, "redactedFileNameDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        v77 = 2112;
        v78 = v42;
        goto LABEL_41;
      case 13:
        if (-[NSObject resourceType](v5, "resourceType") != 14)
          goto LABEL_29;
LABEL_25:
        if (!-[NSObject isVideoComplementOf:](v5, "isVideoComplementOf:", v14))
        {
LABEL_29:
          if (v63 != ++v13)
            continue;
          v63 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
          if (!v63)
            goto LABEL_43;
          goto LABEL_4;
        }
        -[NSObject importIdentifier](v5, "importIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportSource setIsLivePhotoForImportIdentifier:](v56, "setIsLivePhotoForImportIdentifier:", v34);

LABEL_36:
        v5 = v12;
        v43 = v55;
LABEL_50:

LABEL_51:
        return;
      case 14:
        if (-[NSObject resourceType](v5, "resourceType") != 13
          || !objc_msgSend(v14, "isVideoComplementOf:", v5))
        {
          goto LABEL_29;
        }
        -[NSObject importIdentifier](v5, "importIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportSource setIsLivePhotoForImportIdentifier:](v56, "setIsLivePhotoForImportIdentifier:", v45);

        PLImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          goto LABEL_42;
        objc_msgSend(v14, "redactedFileNameDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        v77 = 2112;
        v78 = v42;
LABEL_41:
        _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed representation", buf, 0x16u);

LABEL_42:
        objc_msgSend(v55, "removeObject:", v14);
        goto LABEL_43;
      default:
        PLImportGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "redactedFileNameDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "resourceType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          PHDescriptionsForResourceTypes(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v76 = v25;
          v77 = 2112;
          v78 = v29;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "Unexpected representation resource type for %@ (%@)", buf, 0x16u);

        }
        goto LABEL_29;
    }
  }
}

- (BOOL)_addSidecarAsset:(id)a3 toAsset:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (v6 && -[PHImportSource confirmAsset:isSidecarOfAsset:](self, "confirmAsset:isSidecarOfAsset:", v6, v7))
  {
    objc_msgSend(v7, "addSidecarAsset:", v6);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_adjustmentDataAssetFromAssets:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "resourceType", (_QWORD)v9) == 7)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_adjustmentSecondaryDataAssetFromAssets:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "resourceType", (_QWORD)v9) == 110)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_findDatAssetInProcessedAssets:(id)a3 toPairWithMediaAsset:(id)a4 ifAssetIsAdjustment:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a5, "resourceType") != 7)
    goto LABEL_4;
  -[PHImportSource _adjustmentSecondaryDataAssetFromAssets:](self, "_adjustmentSecondaryDataAssetFromAssets:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PHImportSource _addSidecarAsset:toAsset:](self, "_addSidecarAsset:toAsset:", v10, v9))
  {

LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (BOOL)_pairDatSidecar:(id)a3 withMediaAssetIfHasAdjustments:(id)a4 orAaeInProcessedAssets:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  -[PHImportSource _adjustmentDataAssetFromAssets:](self, "_adjustmentDataAssetFromAssets:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (v10 || objc_msgSend(v9, "hasAdjustments"))
     && -[PHImportSource _addSidecarAsset:toAsset:](self, "_addSidecarAsset:toAsset:", v8, v9);

  return v11;
}

- (void)processResource:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSMutableDictionary *assetsByImportIdentifier;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *audioByImportIdentifier;
  void *v34;
  id v35;
  NSMutableDictionary *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSMutableDictionary *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  PHImportSource *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  id obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _OWORD v99[4];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  void *v104;
  _BYTE v105[128];
  void *v106;
  void *v107;
  char v108[128];
  void *v109;
  void *v110;
  void *v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetsByImportIdentifier = self->_assetsByImportIdentifier;
    -[NSObject importIdentifier](v5, "importIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assetsByImportIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
    v84 = self;
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v101;
      v83 = *(_QWORD *)v101;
      while (1)
      {
        v12 = 0;
        v85 = v10;
        do
        {
          if (*(_QWORD *)v101 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v12);
          PLImportGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject redactedFileNameDescription](v5, "redactedFileNameDescription");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v88;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
            v92 = v5;
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            PHDescriptionsForResourceTypes(v87);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
            v90 = v12;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "redactedFileNameDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "resourceType"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
            v19 = v13;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            PHDescriptionsForResourceTypes(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v113 = v86;
            v114 = 2112;
            v115 = v16;
            v116 = 2112;
            v117 = v17;
            v118 = 2112;
            v119 = v22;
            _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), processed: %@ (%@)", buf, 0x2Au);

            v13 = v19;
            v11 = v83;

            self = v84;
            v5 = v92;

            v10 = v85;
            v12 = v90;
          }

          v23 = objc_msgSend(v13, "resourceType");
          if (v23 <= 15)
          {
            switch(v23)
            {
              case 1:
                v24 = -[NSObject resourceType](v5, "resourceType");
                if (v24 > 15)
                {
                  if ((unint64_t)(v24 - 16) < 2)
                    goto LABEL_40;
                  if (v24 == 110)
                    goto LABEL_36;
                }
                else
                {
                  switch(v24)
                  {
                    case 2:
                      if (!-[NSObject isVideoComplementOf:](v5, "isVideoComplementOf:", v13))
                        goto LABEL_55;
                      -[NSObject importIdentifier](v5, "importIdentifier");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PHImportSource setIsLivePhotoForImportIdentifier:](self, "setIsLivePhotoForImportIdentifier:", v30);

                      goto LABEL_53;
                    case 3:
                      objc_msgSend(v13, "audioAsset");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v31)
                        goto LABEL_55;
                      objc_msgSend(v13, "setAudioAsset:", v5);
                      goto LABEL_53;
                    case 7:
                      goto LABEL_40;
                  }
                }
                if (-[NSObject isRAW](v5, "isRAW") && objc_msgSend(v13, "isJPEG"))
                {
                  if (!-[PHImportSource processPotentialJpegAsset:plusRawAsset:](self, "processPotentialJpegAsset:plusRawAsset:", v13, v5))break;
LABEL_53:

LABEL_54:
                  v5 = 0;
                  break;
                }
                if (-[NSObject isJPEG](v5, "isJPEG")
                  && objc_msgSend(v13, "isRAW")
                  && -[PHImportSource processPotentialJpegAsset:plusRawAsset:](self, "processPotentialJpegAsset:plusRawAsset:", v5, v13))
                {
                  goto LABEL_20;
                }
                break;
              case 2:
                v27 = -[NSObject resourceType](v5, "resourceType");
                if (v27 <= 15)
                {
                  if (v27 != 1)
                  {
                    if (v27 != 7)
                      break;
LABEL_40:
                    if (!-[PHImportSource _addSidecarAsset:toAsset:](self, "_addSidecarAsset:toAsset:", v5, v13))
                      break;
                    -[PHImportSource _findDatAssetInProcessedAssets:toPairWithMediaAsset:ifAssetIsAdjustment:](self, "_findDatAssetInProcessedAssets:toPairWithMediaAsset:ifAssetIsAdjustment:", obj, v13, v5);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v28)
                      objc_msgSend(v82, "addObject:", v28);

                    goto LABEL_54;
                  }
                  if (objc_msgSend(v13, "isVideoComplementOf:", v5))
                  {
                    -[NSObject importIdentifier](v5, "importIdentifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PHImportSource setIsLivePhotoForImportIdentifier:](self, "setIsLivePhotoForImportIdentifier:", v29);

LABEL_20:
                    objc_msgSend(v82, "addObject:", v13);
                  }
                }
                else
                {
                  if (v27 == 16 || v27 == 18)
                    goto LABEL_40;
                  if (v27 == 110)
                  {
LABEL_36:
                    if (-[PHImportSource _pairDatSidecar:withMediaAssetIfHasAdjustments:orAaeInProcessedAssets:](self, "_pairDatSidecar:withMediaAssetIfHasAdjustments:orAaeInProcessedAssets:", v5, v13, obj))
                    {
                      goto LABEL_53;
                    }
                  }
                }
                break;
              case 7:
LABEL_17:
                if ((-[NSObject resourceType](v5, "resourceType") == 1
                   || -[NSObject resourceType](v5, "resourceType") == 2)
                  && -[PHImportSource _addSidecarAsset:toAsset:](self, "_addSidecarAsset:toAsset:", v13, v5))
                {
                  goto LABEL_20;
                }
                break;
              default:
LABEL_26:
                PLImportGetLog();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v13, "redactedFileNameDescription");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v113 = v26;
                  _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "Unexpected asset resource type for %@", buf, 0xCu);

                }
                break;
            }
          }
          else
          {
            if ((unint64_t)(v23 - 16) < 3)
              goto LABEL_17;
            if (v23 != 110)
              goto LABEL_26;
            if (-[PHImportSource _pairDatSidecar:withMediaAssetIfHasAdjustments:orAaeInProcessedAssets:](self, "_pairDatSidecar:withMediaAssetIfHasAdjustments:orAaeInProcessedAssets:", v13, v5, obj))
            {
              goto LABEL_20;
            }
          }
LABEL_55:
          ++v12;
        }
        while (v10 != v12);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
        v10 = v32;
        if (!v32)
        {

          if (!v5)
            goto LABEL_99;
          goto LABEL_67;
        }
      }
    }

LABEL_67:
    if (-[NSObject isAudio](v5, "isAudio"))
    {
      audioByImportIdentifier = self->_audioByImportIdentifier;
      -[NSObject importIdentifier](v5, "importIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](audioByImportIdentifier, "objectForKeyedSubscript:", v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v36 = self->_audioByImportIdentifier;
        -[NSObject importIdentifier](v5, "importIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v35, v37);

      }
      PLImportGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject redactedFileNameDescription](v5, "redactedFileNameDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR(","));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v113 = v39;
        v114 = 2112;
        v115 = v43;
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed asset", buf, 0x16u);

      }
      objc_msgSend(v35, "addObject:", v5);

    }
    else
    {
      if (-[NSObject resourceType](v5, "resourceType") == 1)
      {
        v44 = self->_audioByImportIdentifier;
        -[NSObject importIdentifier](v5, "importIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "copy");

        memset(v99, 0, sizeof(v99));
        v48 = v47;
        if (objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v99, v108, 16))
        {
          v49 = (void *)**((_QWORD **)&v99[0] + 1);
          -[NSObject setAudioAsset:](v5, "setAudioAsset:", **((_QWORD **)&v99[0] + 1));
          PLImportGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v49, "redactedFileNameDescription");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v49, "resourceType"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v52;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            PHDescriptionsForResourceTypes(v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "componentsJoinedByString:", CFSTR(","));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v113 = v51;
            v114 = 2112;
            v115 = v55;
            _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed asset", buf, 0x16u);

          }
          v56 = v84->_audioByImportIdentifier;
          -[NSObject importIdentifier](v5, "importIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v49;
          self = v84;
          objc_msgSend(v58, "removeObject:", v59);

        }
      }
      if (!obj)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = self->_assetsByImportIdentifier;
        -[NSObject importIdentifier](v5, "importIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        obj = (id)v60;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v60, v62);

      }
      if ((objc_msgSend(v82, "containsObject:", v5) & 1) == 0)
      {
        PLImportGetLog();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject redactedFileNameDescription](v5, "redactedFileNameDescription");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v65;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          PHDescriptionsForResourceTypes(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "componentsJoinedByString:", CFSTR(","));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v113 = v64;
          v114 = 2112;
          v115 = v68;
          _os_log_impl(&dword_1991EC000, v63, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed asset", buf, 0x16u);

        }
        if (-[NSObject isSidecar](v5, "isSidecar"))
          objc_msgSend(obj, "insertObject:atIndex:", v5, 0);
        else
          objc_msgSend(obj, "addObject:", v5);
      }
      v93 = v5;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v69 = v82;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v96;
        v89 = *(_QWORD *)v96;
        do
        {
          v73 = 0;
          v91 = v71;
          do
          {
            if (*(_QWORD *)v96 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v73);
            PLImportGetLog();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v74, "redactedFileNameDescription");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v69;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v74, "resourceType"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v78;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              PHDescriptionsForResourceTypes(v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "componentsJoinedByString:", CFSTR(","));
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v76;
              v114 = 2112;
              v115 = v81;
              _os_log_impl(&dword_1991EC000, v75, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed asset", buf, 0x16u);

              v69 = v77;
              v71 = v91;

              v72 = v89;
            }

            objc_msgSend(obj, "removeObject:", v74);
            ++v73;
          }
          while (v71 != v73);
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
        }
        while (v71);
      }

      if (objc_msgSend(v69, "count"))
        -[PHImportSource removeAssets:](v84, "removeAssets:", v69);
      v5 = v93;
    }
LABEL_99:

  }
  else
  {
    PLImportGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
  }

}

- (void)addRepresentationsForAsset:(id)a3
{
  id v3;
  void *v4;
  NSMutableDictionary *representationsByImportIdentifier;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  void *v27;
  NSObject *obj;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "resourceType") == 1 || objc_msgSend(v4, "resourceType") == 2)
    {
      representationsByImportIdentifier = self->_representationsByImportIdentifier;
      objc_msgSend(v4, "importIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](representationsByImportIdentifier, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v7;
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      if (v36)
      {
        v35 = *(_QWORD *)v38;
        *(_QWORD *)&v8 = 138412546;
        v26 = v8;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v38 != v35)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            PLImportGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v4, "redactedFileNameDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v33;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              PHDescriptionsForResourceTypes(v32);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "redactedFileNameDescription");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "resourceType"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v14;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
              v34 = v10;
              v15 = v4;
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              PHDescriptionsForResourceTypes(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v45 = v30;
              v46 = 2112;
              v47 = v12;
              v48 = 2112;
              v49 = v13;
              v50 = 2112;
              v51 = v18;
              _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), representation: %@ (%@)", buf, 0x2Au);

              v4 = v15;
              v10 = v34;

            }
            switch(objc_msgSend(v10, "resourceType"))
            {
              case 5:
                if ((objc_msgSend(v4, "resourceType") == 1 || objc_msgSend(v4, "resourceType") == 2)
                  && -[PHImportSource confirmAsset:isRenderOf:](self, "confirmAsset:isRenderOf:", v10, v4, v26))
                {
                  objc_msgSend(v4, "setLargeRender:", v10);
                  goto LABEL_29;
                }
                break;
              case 6:
                if (objc_msgSend(v4, "resourceType") == 2)
                {
                  objc_msgSend(v4, "setLargeMovieRender:", v10);
                  goto LABEL_29;
                }
                break;
              case 8:
                if (objc_msgSend(v4, "resourceType") == 1)
                  goto LABEL_24;
                break;
              case 12:
                if (objc_msgSend(v4, "resourceType") == 2)
                {
LABEL_24:
                  if (-[PHImportSource confirmAsset:isBaseOf:](self, "confirmAsset:isBaseOf:", v10, v4, v26))
                  {
                    objc_msgSend(v4, "setBase:", v10);
                    goto LABEL_29;
                  }
                }
                break;
              case 13:
                goto LABEL_27;
              case 14:
                if (objc_msgSend(v4, "resourceType") == 2)
                {
LABEL_27:
                  if (-[PHImportSource confirmAsset:isSocOf:](self, "confirmAsset:isSocOf:", v10, v4, v26))
                  {
                    objc_msgSend(v4, "setSpatialOverCapture:", v10);
LABEL_29:
                    objc_msgSend(v27, "addObject:", v10, v26);
                  }
                }
                break;
              default:
                PLImportGetLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v10, "redactedFileNameDescription");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "resourceType"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v21;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  PHDescriptionsForResourceTypes(v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v26;
                  v45 = v20;
                  v46 = 2112;
                  v47 = v24;
                  _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "Unexpected representation resource type for %@ (%@)", buf, 0x16u);

                }
                break;
            }
          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
        }
        while (v36);
      }

      -[NSObject removeObjectsInArray:](obj, "removeObjectsInArray:", v27);
    }
    else
    {
      PLImportGetLog();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "redactedFileNameDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v25;
        _os_log_impl(&dword_1991EC000, obj, OS_LOG_TYPE_DEBUG, "'%@' is not a photo or video, not adding representations", buf, 0xCu);

      }
    }
  }
  else
  {
    PLImportGetLog();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, obj, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
  }

}

- (BOOL)isLivePhotoForImportIdentifier:(id)a3
{
  void *v3;
  char v4;
  NSObject *v6;
  uint8_t v7[16];

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_importIdentifierToLivePhotoStateMap, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    return v4;
  }
  else
  {
    PLImportGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "identifier was nil", v7, 2u);
    }

    return 0;
  }
}

- (void)accessItems:(id)a3
{
  os_unfair_lock_s *p_itemsLock;
  void (**v4)(_QWORD);

  p_itemsLock = &self->_itemsLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_itemsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_itemsLock);
}

- (id)nextItem
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36679;
  v9 = __Block_byref_object_dispose__36680;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__PHImportSource_nextItem__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportSource accessItems:](self, "accessItems:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)isDone
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportSource_isDone__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportSource accessItems:](self, "accessItems:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)stalled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportSource_stalled__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportSource accessItems:](self, "accessItems:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)addItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__PHImportSource_addItems___block_invoke;
  v6[3] = &unk_1E35DEE50;
  v8 = &v9;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[PHImportSource accessItems:](self, "accessItems:", v6);
  if (*((_BYTE *)v10 + 24))
    -[PHImportSource processNextItems](self, "processNextItems");

  _Block_object_dispose(&v9, 8);
}

- (void)addSourceFileIdentifiersForRemovedFiles:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PHImportSource_addSourceFileIdentifiersForRemovedFiles___block_invoke;
  block[3] = &unk_1E35DF9E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(processingQueue, block);

}

- (void)removeAssets:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PHImportSource *v9;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__PHImportSource_removeAssets___block_invoke;
  v7[3] = &unk_1E35DF9E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 isCancelable:(BOOL)a5 atEnd:(id)a6
{
  return 0;
}

- (BOOL)date:(id)a3 matchesDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "dateByAddingTimeInterval:", -30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_msgSend(v5, "compare:", v7) == 1 || !objc_msgSend(v5, "compare:", v7))
    && (objc_msgSend(v5, "compare:", v8) == -1 || objc_msgSend(v5, "compare:", v8) == 0);

  return v9;
}

- (BOOL)batchComplete
{
  unint64_t v3;
  unint64_t batchSize;
  NSObject *v5;
  unint64_t batchCount;
  unint64_t v7;
  double v8;
  double v10;
  double v11;
  NSObject *v12;
  double batchInterval;
  double v14;
  double v15;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v3 = self->_batchCount + 1;
  self->_batchCount = v3;
  batchSize = self->_batchSize;
  if (batchSize)
  {
    if (v3 >= batchSize)
    {
      PLImportGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        batchCount = self->_batchCount;
        v7 = self->_batchSize;
        v16 = 134218240;
        v17 = *(double *)&batchCount;
        v18 = 2048;
        v19 = *(double *)&v7;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "END BATCH: batch count (%lu) >= batch size (%lu)", (uint8_t *)&v16, 0x16u);
      }

LABEL_6:
      self->_batchCount = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_batchStart = v8;
      return 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11 = v10 - self->_batchStart;
    if (v11 >= self->_batchInterval)
    {
      PLImportGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        batchInterval = self->_batchInterval;
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = batchInterval;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "Batch duration: %g, Batch Interval: %g", (uint8_t *)&v16, 0x16u);
      }

      if (self->_rampBatchInterval)
      {
        v14 = self->_batchInterval;
        if (v14 < 1.0)
        {
          v15 = v14 * 1.5;
          self->_batchInterval = v15;
          if (v15 > 1.0)
            self->_batchInterval = 1.0;
        }
      }
      goto LABEL_6;
    }
  }
  return 0;
}

- (BOOL)processPotentialJpegAsset:(id)a3 plusRawAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHImportSource date:matchesDate:](self, "date:matchesDate:", v8, v9);

  if (v10)
    goto LABEL_4;
  objc_msgSend(v6, "fileCreationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHImportSource date:matchesDate:](self, "date:matchesDate:", v11, v12);

  if (v13)
    goto LABEL_4;
  objc_msgSend(v6, "loadMetadataSync");
  objc_msgSend(v7, "loadMetadataSync");
  objc_msgSend(v6, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHImportSource date:matchesDate:](self, "date:matchesDate:", v14, v15);

  if (v16)
  {
LABEL_4:
    PLImportGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "redactedFileNameDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "redactedFileNameDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ as RAW of %@", (uint8_t *)&v29, 0x16u);

    }
    objc_msgSend(v6, "setRawAsset:", v7);
    objc_msgSend(v6, "largeRender");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v7, "largeRender");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLargeRender:", v21);

      objc_msgSend(v7, "setLargeRender:", 0);
    }
    objc_msgSend(v6, "base");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(v7, "base");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBase:", v23);

      objc_msgSend(v7, "setBase:", 0);
    }
    objc_msgSend(v6, "audioAsset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v7, "audioAsset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAudioAsset:", v25);

      objc_msgSend(v7, "setAudioAsset:", 0);
    }
    objc_msgSend(v6, "sidecarAssetsByType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(v7, "sidecarAssetsByType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSidecarAssetsByType:", v27);

      objc_msgSend(v7, "setSidecarAssetsByType:", 0);
    }
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)setIsLivePhotoForImportIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "identifier was nil", buf, 2u);
    }
    goto LABEL_23;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_importIdentifierToLivePhotoStateMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_importIdentifierToLivePhotoStateMap, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_representationsByImportIdentifier, "objectForKeyedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (!v8)
    {
      v11 = 0;
      v10 = 0;
      goto LABEL_22;
    }
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "resourceType") == 8)
        {
          v15 = v11;
          v16 = v10;
          v11 = v14;
        }
        else
        {
          v15 = v10;
          v16 = v14;
          if (objc_msgSend(v14, "resourceType") != 12)
            continue;
        }
        v17 = v14;

        v10 = v16;
      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (!v9)
      {
        if (v11 && v10)
        {
          objc_msgSend(v11, "takeAsVideoComplement:", v10);
          PLImportGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "redactedFileNameDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "resourceType"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            PHDescriptionsForResourceTypes(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v30 = v19;
            v31 = 2112;
            v32 = v23;
            _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed representation", buf, 0x16u);

          }
          -[NSObject removeObject:](v7, "removeObject:", v10);
        }
LABEL_22:

LABEL_23:
        break;
      }
    }
  }

}

- (BOOL)confirmAsset:(id)a3 isRenderOf:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  char v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    PLImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134218240;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "must provide render (%p) and orig (%p)", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_13;
  }
  if (!objc_msgSend((id)v6, "isRender")
    || (!objc_msgSend((id)v6, "isImage")
     || (objc_msgSend((id)v7, "isImage") & 1) == 0 && (objc_msgSend((id)v7, "isMovie") & 1) == 0)
    && (!objc_msgSend((id)v6, "isMovie") || !objc_msgSend((id)v7, "isMovie")))
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend((id)v7, "hasAdjustments") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[PHImportSource loadSidecarsFor:](self, "loadSidecarsFor:", v7);
    v8 = objc_msgSend((id)v7, "hasAdjustments");
  }
LABEL_14:

  return v8;
}

- (BOOL)confirmAsset:(id)a3 isSocOf:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    if (objc_msgSend((id)v5, "isSpatialOverCapture")
      && (objc_msgSend((id)v5, "isJPEG") && (objc_msgSend((id)v6, "isJPEG") & 1) != 0
       || objc_msgSend((id)v5, "isHEIF") && (objc_msgSend((id)v6, "isHEIF") & 1) != 0
       || objc_msgSend((id)v5, "isMovie") && objc_msgSend((id)v6, "isMovie")))
    {
      v7 = objc_msgSend((id)v6, "isLivePhoto");
      if (v7 == objc_msgSend((id)v6, "isLivePhoto"))
      {
        objc_msgSend((id)v5, "spatialOverCaptureIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8
          && (v9 = (void *)v8,
              objc_msgSend((id)v6, "spatialOverCaptureIdentifier"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              v10))
        {
          objc_msgSend((id)v5, "spatialOverCaptureIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)v6;
        }
        else
        {
          objc_msgSend((id)v6, "loadMetadataSync");
          objc_msgSend((id)v6, "spatialOverCaptureIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v14 = 0;
            goto LABEL_22;
          }
          objc_msgSend((id)v5, "loadMetadataSync");
          v12 = (void *)v5;
        }
        objc_msgSend(v12, "spatialOverCaptureIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqualToString:", v16);

LABEL_22:
        goto LABEL_17;
      }
    }
  }
  else
  {
    PLImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = 134218240;
      v18 = 0;
      v19 = 2048;
      v20 = 0;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "must provide soc (%p) and orig (%p)", (uint8_t *)&v17, 0x16u);
    }

  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (BOOL)confirmAsset:(id)a3 isBaseOf:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218240;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "must provide base (%p) and orig (%p)", (uint8_t *)&v14, 0x16u);
    }

    goto LABEL_14;
  }
  if (!objc_msgSend((id)v6, "isBase")
    || (!objc_msgSend((id)v6, "isImage")
     || !objc_msgSend((id)v7, "isImage")
     || (v8 = objc_msgSend((id)v6, "isLivePhoto"), v8 != objc_msgSend((id)v7, "isLivePhoto")))
    && (!objc_msgSend((id)v6, "isMovie") || !objc_msgSend((id)v7, "isMovie")))
  {
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend((id)v7, "hasAdjustments") && (objc_msgSend((id)v7, "isImage") & 1) != 0)
  {
    objc_msgSend((id)v7, "largeRender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)v7, "largeMovieRender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;

  if (v13)
  {
    v11 = 1;
  }
  else
  {
    -[PHImportSource loadSidecarsFor:](self, "loadSidecarsFor:", v7);
    v11 = objc_msgSend((id)v7, "hasAdjustments");
  }
LABEL_15:

  return v11;
}

- (BOOL)confirmAsset:(id)a3 isSidecarOfAsset:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = objc_msgSend(a3, "isSidecar")
    && ((objc_msgSend(v5, "isImage") & 1) != 0 || objc_msgSend(v5, "isMovie"));

  return v6;
}

- (void)loadSidecarsFor:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *folders;
  void *v7;
  NSObject *v8;
  NSMutableDictionary *assetsByImportIdentifier;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableDictionary *representationsByImportIdentifier;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    folders = self->_folders;
    objc_msgSend(v4, "parentFolderPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(folders) = -[NSMutableSet containsObject:](folders, "containsObject:", v7);

    if ((folders & 1) == 0)
    {
      objc_msgSend(v5, "loadSidecarFiles");
      goto LABEL_30;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetsByImportIdentifier = self->_assetsByImportIdentifier;
    objc_msgSend(v5, "importIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assetsByImportIdentifier, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
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
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v17, "isSidecar"))
          {
            objc_msgSend(v5, "addSidecarAsset:", v17);
            -[NSObject addObject:](v8, "addObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    if (-[NSObject count](v8, "count"))
      objc_msgSend(v12, "removeObjectsInArray:", v8);
    -[NSObject removeAllObjects](v8, "removeAllObjects");
    representationsByImportIdentifier = self->_representationsByImportIdentifier;
    objc_msgSend(v5, "importIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](representationsByImportIdentifier, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if (objc_msgSend(v26, "isSidecar", (_QWORD)v27))
          {
            objc_msgSend(v5, "addSidecarAsset:", v26);
            -[NSObject addObject:](v8, "addObject:", v26);
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v23);
    }

    if (-[NSObject count](v8, "count"))
      objc_msgSend(v21, "removeObjectsInArray:", v8);

  }
  else
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "asset was nil", buf, 2u);
    }
  }

LABEL_30:
}

- (void)findDuplicatesOfItems:(id)a3 considerItemsInTheTrash:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PHImportDuplicateChecker *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__36679;
  v9[4] = __Block_byref_object_dispose__36680;
  v10 = 0;
  v7 = -[PHImportDuplicateChecker initWithLibrary:]([PHImportDuplicateChecker alloc], "initWithLibrary:", self->_library);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PHImportSource_findDuplicatesOfItems_considerItemsInTheTrash___block_invoke;
  v8[3] = &unk_1E35DE248;
  v8[4] = v9;
  -[PHImportDuplicateChecker findDuplicatesOfItems:considerItemsInTrash:forEach:atEnd:](v7, "findDuplicatesOfItems:considerItemsInTrash:forEach:atEnd:", v6, v4, 0, v8);

  _Block_object_dispose(v9, 8);
}

- (id)assetsDescription
{
  PHImportSource *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  PHImportSource *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v2 = self;
  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PHImportSource assets](self, "assets");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = -[__CFString countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v4)
  {
    v20 = &stru_1E35DFFF8;
LABEL_27:

    v3 = (__CFString *)v20;
    goto LABEL_28;
  }
  v5 = v4;
  v25 = v2;
  v26 = 0;
  v6 = 0;
  v7 = 0;
  v33 = 0;
  v34 = 0;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v31 = 0;
  v32 = 0;
  v35 = 0;
  obj = v3;
  v8 = 0;
  v9 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v11, "sidecarAssets");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      objc_msgSend(v11, "largeRender");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      v16 = objc_msgSend(v11, "hasAudioAttachment");
      if (objc_msgSend(v11, "isMovie"))
      {
        ++v8;
        v6 += v13;
        v7 += v15;
      }
      else if ((objc_msgSend(v11, "isAudio") & 1) == 0)
      {
        if (objc_msgSend(v11, "isRAW"))
        {
          ++v33;
          v30 += v13;
          v29 += v15;
          v28 += v16;
        }
        else
        {
          v32 += v13;
          ++v34;
          v35 += v15;
          v31 += v16;
          if (objc_msgSend(v11, "isJpegPlusRAW"))
          {
            ++v27;
          }
          else if (objc_msgSend(v11, "isLivePhoto"))
          {
            ++v26;
            objc_msgSend(v11, "videoComplement");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "largeRender");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v35;
            if (v18)
              v19 = v35 + 1;
            v35 = v19;

          }
        }
      }
    }
    v5 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v5);

  if (v8)
  {
    objc_msgSend(&stru_1E35DFFF8, "stringByAppendingFormat:", CFSTR("Movie:\t\t%lu (adj: %lu, render: %lu)\n"), v8, v6, v7);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E35DFFF8;
  }
  v2 = v25;
  if (v33)
  {
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("RAW:\t\t%lu (adj: %lu, render: %lu, audio: %lu)\n"), v33, v30, v29, v28);
    v21 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v21;
  }
  if (v34)
  {
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("Non RAW:\t%lu (adj: %lu, render: %lu, audio: %lu, movie: %lu, raw: %lu)\n"), v34, v32, v35, v31, v26, v27);
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
LABEL_28:
  -[PHImportSource assets](v2, "assets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("Total:\t\t%lu\n"), objc_msgSend(v22, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isEjecting
{
  return self->_ejecting;
}

- (BOOL)canAutolaunch
{
  return self->_canAutolaunch;
}

- (unsigned)sourceAccessState
{
  return self->_sourceAccessState;
}

- (void)setSourceAccessState:(unsigned __int8)a3
{
  self->_sourceAccessState = a3;
}

- (NSURL)autolaunchApplicationURL
{
  return self->_autolaunchApplicationURL;
}

- (void)setAutolaunchApplicationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (unint64_t)currentItemIndex
{
  return self->_currentItemIndex;
}

- (void)setCurrentItemIndex:(unint64_t)a3
{
  self->_currentItemIndex = a3;
}

- (unint64_t)nextItemIndex
{
  return self->_nextItemIndex;
}

- (void)setNextItemIndex:(unint64_t)a3
{
  self->_nextItemIndex = a3;
}

- (unint64_t)completedItems
{
  return self->_completedItems;
}

- (void)setCompletedItems:(unint64_t)a3
{
  self->_completedItems = a3;
}

- (OS_dispatch_queue)controlQueue
{
  return self->_controlQueue;
}

- (void)setControlQueue:(id)a3
{
  objc_storeStrong((id *)&self->_controlQueue, a3);
}

- (OS_dispatch_queue)itemQueue
{
  return self->_itemQueue;
}

- (void)setItemQueue:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue, a3);
}

- (OS_dispatch_queue)batchQueue
{
  return self->_batchQueue;
}

- (void)setBatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_batchQueue, a3);
}

- (OS_dispatch_queue)dupPathCollectionQueue
{
  return self->_dupPathCollectionQueue;
}

- (void)setDupPathCollectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dupPathCollectionQueue, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSMutableArray)duplicateAssets
{
  return self->_duplicateAssets;
}

- (void)setDuplicateAssets:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateAssets, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (OS_dispatch_queue)itemProcessingQueue
{
  return self->_itemProcessingQueue;
}

- (void)setItemProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_itemProcessingQueue, a3);
}

- (NSMutableArray)removedSourceFileIdentifiers
{
  return self->_removedSourceFileIdentifiers;
}

- (NSDateFormatter)dupeDateFormatter
{
  return self->_dupeDateFormatter;
}

- (void)setDupeDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dupeDateFormatter, a3);
}

- (NSMutableArray)processed
{
  return self->_processed;
}

- (void)setProcessed:(id)a3
{
  objc_storeStrong((id *)&self->_processed, a3);
}

- (double)batchStart
{
  return self->_batchStart;
}

- (void)setBatchStart:(double)a3
{
  self->_batchStart = a3;
}

- (unint64_t)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unint64_t)a3
{
  self->_batchCount = a3;
}

- (BOOL)rampBatchInterval
{
  return self->_rampBatchInterval;
}

- (void)setRampBatchInterval:(BOOL)a3
{
  self->_rampBatchInterval = a3;
}

- (NSMutableDictionary)importIdentifierToLivePhotoStateMap
{
  return self->_importIdentifierToLivePhotoStateMap;
}

- (void)setImportIdentifierToLivePhotoStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_importIdentifierToLivePhotoStateMap, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (void)setBatchInterval:(double)a3
{
  self->_batchInterval = a3;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableSet)folders
{
  return self->_folders;
}

- (void)setFolders:(id)a3
{
  objc_storeStrong((id *)&self->_folders, a3);
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)open
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)canShowProgress
{
  return self->_canShowProgress;
}

- (BOOL)deleteContentAllowed
{
  return self->_deleteContentAllowed;
}

- (void)setDeleteContentAllowed:(BOOL)a3
{
  self->_deleteContentAllowed = a3;
}

- (PHImportOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (int64_t)assetLoadOrder
{
  return self->_assetLoadOrder;
}

- (void)setAssetLoadOrder:(int64_t)a3
{
  self->_assetLoadOrder = a3;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (NSMutableDictionary)pairedSidecarsByImportIdentifier
{
  return self->_pairedSidecarsByImportIdentifier;
}

- (void)setPairedSidecarsByImportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedSidecarsByImportIdentifier, a3);
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return (PFTimeZoneLookup *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneLookup, 0);
  objc_storeStrong((id *)&self->_pairedSidecarsByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_importIdentifierToLivePhotoStateMap, 0);
  objc_storeStrong((id *)&self->_processed, 0);
  objc_storeStrong((id *)&self->_dupeDateFormatter, 0);
  objc_storeStrong((id *)&self->_removedSourceFileIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemProcessingQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_duplicateAssets, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_dupPathCollectionQueue, 0);
  objc_storeStrong((id *)&self->_batchQueue, 0);
  objc_storeStrong((id *)&self->_itemQueue, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_autolaunchApplicationURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_audioByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_representationsByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_assetsByImportIdentifier, 0);
}

void __64__PHImportSource_findDuplicatesOfItems_considerItemsInTheTrash___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __31__PHImportSource_removeAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "indexOfObject:", v7);
        v9 = *(_QWORD *)(a1 + 40);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = objc_msgSend(*(id *)(v9 + 280), "indexOfObject:", v7);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "removeObjectAtIndex:", v10);
            objc_msgSend(v12, "addObject:", v7);
          }
        }
        else
        {
          objc_msgSend(*(id *)(v9 + 200), "removeObjectAtIndex:", v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v12, "count"))
  {
    v11 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __31__PHImportSource_removeAssets___block_invoke_2;
    v13[3] = &unk_1E35DE220;
    v13[4] = v11;
    v14 = v12;
    objc_msgSend(v11, "notifyObserversUsingBlock:", v13);

  }
}

uint64_t __31__PHImportSource_removeAssets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "importSource:didRemoveAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __58__PHImportSource_addSourceFileIdentifiersForRemovedFiles___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removedSourceFileIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

void __27__PHImportSource_addItems___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count") == 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount") + objc_msgSend(*(id *)(a1 + 40), "count"));

}

uint64_t __25__PHImportSource_stalled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

uint64_t __24__PHImportSource_isDone__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 68))
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(v2 + 248), "count");
    v3 = result == 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

void __26__PHImportSource_nextItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "objectAtIndexedSubscript:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeObjectAtIndex:", 0);
  }
  else
  {
    PLImportGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Nothing to process", v6, 2u);
    }

  }
}

uint64_t __25__PHImportSource_endWork__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "importSource:didAddAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __26__PHImportSource_endBatch__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__PHImportSource_endBatch__block_invoke_2;
  v2[3] = &unk_1E35DE220;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "notifyObserversUsingBlock:", v2);

}

uint64_t __26__PHImportSource_endBatch__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "importSource:didAddAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __34__PHImportSource_processNextItems__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "nextItem");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
        break;
      v5 = (void *)v4;
      objc_msgSend(*(id *)(a1 + 32), "assetsByProcessingItem:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v28 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "containsObject:", v11) & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v8);
      }
      if (objc_msgSend(*(id *)(a1 + 32), "batchComplete"))
        objc_msgSend(*(id *)(a1 + 32), "endBatch");

      objc_msgSend(*(id *)(a1 + 32), "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isCancelled");

    }
    while (!v13);
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "isDone");
  v15 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v15, "endBatch");
    objc_msgSend(*(id *)(a1 + 32), "endWork");
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "assets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v20 = v19 - *(double *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 134218240;
      v32 = v18;
      v33 = 2048;
      v34 = v20;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "-----===== Time to load %lu assets: %g =====-----", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v15, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isCancelled");

    if (!v22)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "exceptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v24)[2](v24, v25, v26);

    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  }
}

uint64_t __27__PHImportSource_beginWork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "processNextItems");
}

uint64_t __34__PHImportSource_stopAssetLoading__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setOpen:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "stalled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "processNextItems");
  return result;
}

void __36__PHImportSource_resumeAssetLoading__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "processingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v4);

  }
}

void __35__PHImportSource_pauseAssetLoading__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isPaused](v4, "isPaused") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isCancelled");

    if ((v3 & 1) != 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "processingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v4);
  }

}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "stopAssetLoading");
    WeakRetained = v2;
  }

}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "pauseAssetLoading");
    WeakRetained = v2;
  }

}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "resumeAssetLoading");
    WeakRetained = v2;
  }

}

uint64_t __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setOptions:", v2);

  v3 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowDuplicates:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "beginWork");
}

@end
