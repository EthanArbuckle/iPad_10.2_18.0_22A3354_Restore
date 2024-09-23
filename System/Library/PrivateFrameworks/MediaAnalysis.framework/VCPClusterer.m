@implementation VCPClusterer

- (VCPClusterer)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v7;
  id v8;
  VCPClusterer *v9;
  VCPClusterer *v10;
  VCPClusterer *v11;
  VCPPhotosPersistenceDelegate *v12;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL **p_cacheDirUrl;
  void *cacheDirUrl;
  void *v19;
  uint64_t v20;
  NSURL *v21;
  uint64_t v22;
  NSURL *cacheFileUrl;
  dispatch_queue_t v24;
  OS_dispatch_queue *processingQueue;
  dispatch_group_t v26;
  OS_dispatch_group *processingGroup;
  void *v28;
  uint64_t v29;
  NSNumber *threshold;
  uint64_t v31;
  NSSet *faceCSNsInClusterCache;
  uint64_t v33;
  NSMutableSet *faceIdStrsToAdd;
  uint64_t v35;
  NSMutableSet *faceCSNsToRemove;
  VNCanceller *v37;
  VNCanceller *visionCanceler;
  uint64_t v39;
  NSMutableArray *outstandingSuggestionRequests;
  VCPSuggestionRequest *currentSuggestionRequest;
  NSLock *v42;
  NSLock *suggestionLock;
  NSLock *v44;
  NSLock *currentStatusSnapshotLock;
  NSLock *v46;
  NSLock *propertyDictionaryLock;
  objc_super v49;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "faceClusteringDisabled") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VCPClusterer;
    v10 = -[VCPClusterer init](&v49, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_photoLibrary, a3);
      objc_storeStrong((id *)&v11->_context, a4);
      v12 = -[VCPPhotosPersistenceDelegate initWithPhotoLibrary:]([VCPPhotosPersistenceDelegate alloc], "initWithPhotoLibrary:", v7);
      persistenceDelegate = v11->_persistenceDelegate;
      v11->_persistenceDelegate = v12;

      objc_msgSend(v7, "vcp_visionCacheStorageDirectoryURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
        p_cacheDirUrl = &v11->_cacheDirUrl;
        cacheDirUrl = v11->_cacheDirUrl;
        v11->_cacheDirUrl = v16;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0C99E98];
        NSTemporaryDirectory();
        cacheDirUrl = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fileURLWithPath:", cacheDirUrl);
        v20 = objc_claimAutoreleasedReturnValue();
        p_cacheDirUrl = &v11->_cacheDirUrl;
        v21 = v11->_cacheDirUrl;
        v11->_cacheDirUrl = (NSURL *)v20;

      }
      _cacheFileUrlFromDirectoryUrl(*p_cacheDirUrl);
      v22 = objc_claimAutoreleasedReturnValue();
      cacheFileUrl = v11->_cacheFileUrl;
      v11->_cacheFileUrl = (NSURL *)v22;

      v24 = dispatch_queue_create("com.apple.mediaanalysisd.clusterer.processing", 0);
      processingQueue = v11->_processingQueue;
      v11->_processingQueue = (OS_dispatch_queue *)v24;

      v26 = dispatch_group_create();
      processingGroup = v11->_processingGroup;
      v11->_processingGroup = (OS_dispatch_group *)v26;

      objc_storeStrong((id *)&v11->_clusteringType, (id)*MEMORY[0x1E0CEE280]);
      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[VCPPhotosFaceProcessingContext faceClusteringThreshold](v11->_context, "faceClusteringThreshold");
      objc_msgSend(v28, "numberWithFloat:");
      v29 = objc_claimAutoreleasedReturnValue();
      threshold = v11->_threshold;
      v11->_threshold = (NSNumber *)v29;

      v11->_nextSeqNum = 1;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v31 = objc_claimAutoreleasedReturnValue();
      faceCSNsInClusterCache = v11->_faceCSNsInClusterCache;
      v11->_faceCSNsInClusterCache = (NSSet *)v31;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v33 = objc_claimAutoreleasedReturnValue();
      faceIdStrsToAdd = v11->_faceIdStrsToAdd;
      v11->_faceIdStrsToAdd = (NSMutableSet *)v33;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v35 = objc_claimAutoreleasedReturnValue();
      faceCSNsToRemove = v11->_faceCSNsToRemove;
      v11->_faceCSNsToRemove = (NSMutableSet *)v35;

      v37 = (VNCanceller *)objc_alloc_init(MEMORY[0x1E0CEDDB0]);
      visionCanceler = v11->_visionCanceler;
      v11->_visionCanceler = v37;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = objc_claimAutoreleasedReturnValue();
      outstandingSuggestionRequests = v11->_outstandingSuggestionRequests;
      v11->_outstandingSuggestionRequests = (NSMutableArray *)v39;

      currentSuggestionRequest = v11->_currentSuggestionRequest;
      v11->_currentSuggestionRequest = 0;

      v42 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      suggestionLock = v11->_suggestionLock;
      v11->_suggestionLock = v42;

      v44 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      currentStatusSnapshotLock = v11->_currentStatusSnapshotLock;
      v11->_currentStatusSnapshotLock = v44;

      v46 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      propertyDictionaryLock = v11->_propertyDictionaryLock;
      v11->_propertyDictionaryLock = v46;

      atomic_store(0, (unsigned __int8 *)&v11->_canceled);
      mach_timebase_info(&v11->_timebase);
      -[VCPClusterer _readPropertyDictionary](v11, "_readPropertyDictionary");

    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)terminate
{
  uint8_t v3[16];
  uint8_t buf[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Terminating ...", buf, 2u);
  }
  -[VCPClusterer _cancelClusteringAndRestoreClusterCache:](self, "_cancelClusteringAndRestoreClusterCache:", 0);
  -[VCPClusterer cancelAllSuggestionRequests](self, "cancelAllSuggestionRequests");
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
  dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Terminated", v3, 2u);
  }
}

- (void)_processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t nextClusterTriggeringAccumulatedChangesCount;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_nextClusterTriggeringAccumulatedChangesCount)
  {
    v3 = -[VCPPhotosPersistenceDelegate countOfFaces](self->_persistenceDelegate, "countOfFaces") / 0xA;
    v4 = -[VCPPhotosFaceProcessingContext minFaceCountToTriggerClustering](self->_context, "minFaceCountToTriggerClustering");
    v5 = -[VCPPhotosFaceProcessingContext maxFaceCountForClustering](self->_context, "maxFaceCountForClustering");
    if (v3 >= v5)
      v6 = v5;
    else
      v6 = v3;
    if (v4 > v6)
      v6 = v4;
    if (v6 <= 0xA)
      v6 = 10;
    self->_nextClusterTriggeringAccumulatedChangesCount = v6;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      nextClusterTriggeringAccumulatedChangesCount = self->_nextClusterTriggeringAccumulatedChangesCount;
      v8 = 134217984;
      v9 = nextClusterTriggeringAccumulatedChangesCount;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Cluster triggering set to %lu", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)scheduleClusteringAfterRemovingFaceCSNs:(id)a3 addingFaceIdStrs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *processingGroup;
  NSObject *processingQueue;
  id v12;
  _QWORD block[4];
  id v14;
  VCPClusterer *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8 || objc_msgSend(v6, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v20 = objc_msgSend(v6, "count");
      v21 = 2048;
      v22 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Scheduling to remove %lu faces and add %lu faces", buf, 0x16u);
    }
    v9 = (void *)os_transaction_create();
    processingQueue = self->_processingQueue;
    processingGroup = self->_processingGroup;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__VCPClusterer_scheduleClusteringAfterRemovingFaceCSNs_addingFaceIdStrs___block_invoke;
    block[3] = &unk_1E6B15858;
    v14 = v9;
    v15 = self;
    v18 = v8;
    v16 = v6;
    v17 = v7;
    v12 = v9;
    dispatch_group_async(processingGroup, processingQueue, block);

  }
}

void __73__VCPClusterer_scheduleClusteringAfterRemovingFaceCSNs_addingFaceIdStrs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_recordIncrementCountOfPendingFacesToAdd:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "unionSet:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "unionSet:", *(_QWORD *)(a1 + 56));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "count") + v3;
  objc_msgSend(*(id *)(a1 + 40), "_processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary");
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "count");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "count");
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: total remove %lu faces and add %lu faces", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)_processingQueuePerformForcedFaceClustering:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  _BOOL4 v4;
  unint64_t accumulatedChangesCount;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  double Current;
  double v17;
  NSObject *v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  VCPClusterer *v23;
  BOOL v24;
  double v25;
  BOOL v26;
  NSObject *v27;
  id v28;
  double v29;
  NSObject *v30;
  id v31;
  double v32;
  NSObject *v33;
  id v34;
  double v35;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  void *v37;
  VCPClusterer *v38;
  double v39;
  double v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  void *v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  CFAbsoluteTime v54;
  VCPClusterer *v55;
  NSObject *v56;
  uint64_t v57;
  NSMutableSet *faceIdStrsToAdd;
  void *v59;
  id v60;
  NSObject *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  double v73;
  NSObject *v74;
  id v75;
  BOOL v76;
  double v77;
  BOOL v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  id v86;
  CFAbsoluteTime v87;
  unint64_t v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  qos_class_t v98;
  void *v99;
  void *v100;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  unint64_t v107;
  void *v108;
  os_signpost_id_t spid;
  uint64_t (**v110)(void);
  VCPClusterer *v111;
  id v112;
  id v113;
  _QWORD v114[7];
  _QWORD v115[7];
  uint8_t buf[4];
  double v117;
  __int16 v118;
  double v119;
  uint64_t v120;

  v4 = a3;
  v120 = *MEMORY[0x1E0C80C00];
  v110 = (uint64_t (**)(void))a4;
  accumulatedChangesCount = self->_accumulatedChangesCount;
  if ((v4 && accumulatedChangesCount || accumulatedChangesCount >= self->_nextClusterTriggeringAccumulatedChangesCount)
    && (!v110 || (v110[2]() & 1) == 0))
  {
    -[VCPClusterer _recordClusteringState:](self, "_recordClusteringState:", 1);
    self->_accumulatedChangesCount = 0;
    -[VCPClusterer _processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary](self, "_processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary");
    v106 = -[NSMutableSet count](self->_faceCSNsToRemove, "count");
    v104 = -[NSMutableSet count](self->_faceIdStrsToAdd, "count");
    v111 = self;
    if (v104 | v106)
    {
      v8 = mach_absolute_time();
      VCPSignPostLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_generate(v9);

      VCPSignPostLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPFaceProcessingClusterFacesCoreAnalyticsCollection", ", buf, 2u);
      }

      -[VNClustererBuilder allClusteredFaceIdsAndReturnError:](v111->_clusterBuilder, "allClusteredFaceIdsAndReturnError:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v13, "count");

      VCPSignPostLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_END, v10, "VCPFaceProcessingClusterFacesCoreAnalyticsCollection", ", buf, 2u);
      }

      if (v8)
      {
        mach_absolute_time();
        self = v111;
        VCPPerformance_LogMeasurement();
      }
      else
      {
        self = v111;
      }
    }
    else
    {
      v103 = 0;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v17 = COERCE_DOUBLE(-[NSMutableSet count](self->_faceCSNsToRemove, "count"));
    if (v17 != 0.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v117 = v17;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Removing %lu faces from cluster cache", buf, 0xCu);
        }

        self = v111;
      }
      v20 = CFAbsoluteTimeGetCurrent();
      -[NSMutableSet allObjects](self->_faceCSNsToRemove, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPClusterer _faceTorsoprintsFromFaceCSNs:](self, "_faceTorsoprintsFromFaceCSNs:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v111;
      -[NSMutableSet removeAllObjects](v111->_faceCSNsToRemove, "removeAllObjects");
      -[VCPClusterer setClustererBringUpState:](v111, "setClustererBringUpState:", 60);
      v113 = 0;
      v24 = -[VCPClusterer _performAndPersistClustersWithFaceTorsoprintsToAdd:groupingIdentifiersToAdd:faceTorsoprintsToRemove:updatedFaces:cancelOrExtendTimeoutBlock:error:](v111, "_performAndPersistClustersWithFaceTorsoprintsToAdd:groupingIdentifiersToAdd:faceTorsoprintsToRemove:updatedFaces:cancelOrExtendTimeoutBlock:error:", 0, 0, v22, 0, v110, &v113);
      v25 = COERCE_DOUBLE(v113);
      v26 = v25 == 0.0 && v24;
      if (!v26 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v117 = v25;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to cluster(removing) faces - %@", buf, 0xCu);
        }

        v23 = v111;
      }
      -[VCPClusterer setClustererBringUpState:](v23, "setClustererBringUpState:", 50);
      v29 = CFAbsoluteTimeGetCurrent();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v30 = MEMORY[0x1E0C81028];
        v31 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v117 = v17;
          v118 = 2048;
          v119 = v29 - v20;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Removed %lu faces from cluster cache [time: %f secs]", buf, 0x16u);
        }

      }
      self = v111;
    }
    v32 = COERCE_DOUBLE(-[NSMutableSet count](self->_faceIdStrsToAdd, "count"));
    if (v32 != 0.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v33 = MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v117 = v32;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Adding %lu faces to cluster cache", buf, 0xCu);
        }

        self = v111;
      }
      v35 = CFAbsoluteTimeGetCurrent();
      persistenceDelegate = self->_persistenceDelegate;
      -[NSMutableSet allObjects](self->_faceIdStrsToAdd, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPPhotosPersistenceDelegate deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:faceprintVersion:](persistenceDelegate, "deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:faceprintVersion:", v37, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v105);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v111;
      v39 = COERCE_DOUBLE(objc_msgSend(v108, "count"));
      v40 = COERCE_DOUBLE(-[NSMutableSet count](v111->_faceIdStrsToAdd, "count"));
      if (*(_QWORD *)&v39 != *(_QWORD *)&v40)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v41 = MEMORY[0x1E0C81028];
          v42 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v117 = v39;
            v118 = 2048;
            v119 = v40;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Number of orderedFaceIdentifiers (%lu) != number of _faceIdStrsToAdd (%lu)", buf, 0x16u);
          }

          v38 = v111;
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v105);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v38->_faceIdStrsToAdd);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "intersectSet:", v43);
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v38->_faceIdStrsToAdd);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "minusSet:", v44);
        objc_msgSend(v45, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

        v38 = v111;
      }
      v107 = -[VCPPhotosFaceProcessingContext maxFaceCountForClustering](v38->_context, "maxFaceCountForClustering");
      *(_QWORD *)&v46 = 138412290;
      v102 = v46;
      do
      {
        if (v32 == 0.0)
          break;
        v47 = (void *)MEMORY[0x1BCCA1B2C]();
        if (v110 && (v110[2]() & 1) != 0)
        {
          v48 = 0;
        }
        else
        {
          VCPSignPostLog();
          v49 = objc_claimAutoreleasedReturnValue();
          spid = os_signpost_id_generate(v49);

          VCPSignPostLog();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPClusteringBatch", ", buf, 2u);
          }

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v52 = MEMORY[0x1E0C81028];
            v53 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              v54 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)buf = 134218240;
              v117 = v32;
              v118 = 2048;
              v119 = v54 - v35;
              _os_log_impl(&dword_1B6C4A000, v52, OS_LOG_TYPE_DEBUG, "VCPClusterer: %lu faces to cluster, already took %f seconds", buf, 0x16u);
            }

          }
          v55 = v111;
          v56 = MEMORY[0x1E0C81028];
          if (*(_QWORD *)&v32 <= v107 + v107 / 5)
          {
            v60 = v108;
            -[NSMutableSet removeAllObjects](v111->_faceIdStrsToAdd, "removeAllObjects");
          }
          else
          {
            objc_msgSend(v108, "subarrayWithRange:", 0, v107);
            v57 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "removeObjectsInArray:", v57);
            faceIdStrsToAdd = v111->_faceIdStrsToAdd;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet minusSet:](faceIdStrsToAdd, "minusSet:", v59);

            v60 = (id)v57;
            v32 = *(double *)&v107;
            v55 = v111;
            v56 = MEMORY[0x1E0C81028];
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v61 = v56;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              v62 = COERCE_DOUBLE(-[NSMutableSet count](v55->_faceIdStrsToAdd, "count"));
              *(_DWORD *)buf = 134218240;
              v117 = v32;
              v118 = 2048;
              v119 = v62;
              _os_log_impl(&dword_1B6C4A000, v56, OS_LOG_TYPE_DEBUG, "VCPClusterer: %lu faces in current batch, %lu faces remain", buf, 0x16u);
            }

            v55 = v111;
          }
          v32 = COERCE_DOUBLE(-[NSMutableSet count](v55->_faceIdStrsToAdd, "count", v102));
          v63 = COERCE_DOUBLE(objc_msgSend(v60, "count"));
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)&v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          VCPSignPostLog();
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = os_signpost_id_generate(v66);

          VCPSignPostLog();
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = v68;
          if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v69, OS_SIGNPOST_INTERVAL_BEGIN, v67, "VCPClusteringGetFaceObservations", ", buf, 2u);
          }

          -[VCPClusterer _faceTorsoprintsFromFaceIdentifiers:assignClusterSeqNumberIfNeeded:updatedFaces:groupingIdentifiers:](v111, "_faceTorsoprintsFromFaceIdentifiers:assignClusterSeqNumberIfNeeded:updatedFaces:groupingIdentifiers:", v60, 1, v64, v65);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          VCPSignPostLog();
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v72, OS_SIGNPOST_INTERVAL_END, v67, "VCPClusteringGetFaceObservations", ", buf, 2u);
          }

          v73 = COERCE_DOUBLE(objc_msgSend(v70, "count"));
          if (*(_QWORD *)&v73 != *(_QWORD *)&v63 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v74 = MEMORY[0x1E0C81028];
            v75 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v117 = v73;
              v118 = 2048;
              v119 = v63;
              _os_log_impl(&dword_1B6C4A000, v74, OS_LOG_TYPE_ERROR, "VCPClusterer: Number of faceTorsoprintsToAdd (%lu) !=  number to cluster (%lu)", buf, 0x16u);
            }

          }
          if (v73 != 0.0)
          {
            -[VCPClusterer setClustererBringUpState:](v111, "setClustererBringUpState:", 60);
            v112 = 0;
            v76 = -[VCPClusterer _performAndPersistClustersWithFaceTorsoprintsToAdd:groupingIdentifiersToAdd:faceTorsoprintsToRemove:updatedFaces:cancelOrExtendTimeoutBlock:error:](v111, "_performAndPersistClustersWithFaceTorsoprintsToAdd:groupingIdentifiersToAdd:faceTorsoprintsToRemove:updatedFaces:cancelOrExtendTimeoutBlock:error:", v70, v65, 0, v64, v110, &v112);
            v77 = COERCE_DOUBLE(v112);
            v78 = v77 == 0.0 && v76;
            if (!v78 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v79 = MEMORY[0x1E0C81028];
              v80 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v102;
                v117 = v77;
                _os_log_impl(&dword_1B6C4A000, v79, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to cluster(adding) faces - %@", buf, 0xCu);
              }

            }
            -[VCPClusterer _recordCountOfPendingFacesToAdd:](v111, "_recordCountOfPendingFacesToAdd:", *(_QWORD *)&v32);
            -[VCPClusterer setClustererBringUpState:](v111, "setClustererBringUpState:", 50);

          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v81 = MEMORY[0x1E0C81028];
            v82 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v117 = v73;
              _os_log_impl(&dword_1B6C4A000, v81, OS_LOG_TYPE_DEBUG, "VCPClusterer: Added %lu faces to cluster cache", buf, 0xCu);
            }

          }
          VCPSignPostLog();
          v83 = objc_claimAutoreleasedReturnValue();
          v84 = v83;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v84, OS_SIGNPOST_INTERVAL_END, spid, "VCPClusteringBatch", ", buf, 2u);
          }

          v48 = 1;
        }
        objc_autoreleasePoolPop(v47);
      }
      while ((v48 & 1) != 0);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v85 = MEMORY[0x1E0C81028];
        v86 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v87 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          v117 = v87 - v35;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Added faces to cluster cache [time: %f secs]", buf, 0xCu);
        }

      }
      self = v111;
    }
    -[VCPClusterer _recordClusteringState:](self, "_recordClusteringState:", 0, v102);
    if (v104 | v106)
    {
      v88 = -[PHPhotoLibrary vcp_assetCountForTaskID:](self->_photoLibrary, "vcp_assetCountForTaskID:", 3);
      v89 = CFAbsoluteTimeGetCurrent();
      +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = CFSTR("ClusteringSequence");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "description");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v92;
      v114[1] = CFSTR("FacesAddToClustering");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v104);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v93;
      v114[2] = CFSTR("FacesRemoveFromClustering");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v106);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v94;
      v114[3] = CFSTR("FacesInClusterBeforeClustering");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v103);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v115[3] = v95;
      v114[4] = CFSTR("ClusteringInterval");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v89 - Current);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v115[4] = v96;
      v114[5] = CFSTR("TotalAssetCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v88);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v115[5] = v97;
      v114[6] = CFSTR("ProcessingQoS");
      v98 = qos_class_self();
      VCPMAQoSDescription(v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v115[6] = v99;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 7);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.photos.faceclustering"), v100);

    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __87__VCPClusterer__processingQueuePerformForcedFaceClustering_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: missing localIdentifiers : %@", (uint8_t *)&v3, 0xCu);
  }

}

- (unint64_t)numberOfAccumulatedClusterChanges
{
  NSObject *processingQueue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__VCPClusterer_numberOfAccumulatedClusterChanges__block_invoke;
  v6[3] = &unk_1E6B158A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__VCPClusterer_numberOfAccumulatedClusterChanges__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)clusteredFaceCount
{
  NSObject *processingQueue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__VCPClusterer_clusteredFaceCount__block_invoke;
  v6[3] = &unk_1E6B158A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__VCPClusterer_clusteredFaceCount__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "allClusteredFaceIdsAndReturnError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)clusterCount
{
  NSObject *processingQueue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__VCPClusterer_clusterCount__block_invoke;
  v6[3] = &unk_1E6B158A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __28__VCPClusterer_clusterCount__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "getAllClustersAndReturnError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v7 = (id)os_transaction_create();
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VCPClusterer_clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock___block_invoke;
  block[3] = &unk_1E6B158C8;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(processingQueue, block);

}

void __72__VCPClusterer_clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "needsFullSync") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "needsUpdate"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:cancelOrExtendTimeoutBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 40));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isReady"))
    objc_msgSend(*(id *)(a1 + 32), "_processingQueuePerformForcedFaceClustering:cancelOrExtendTimeoutBlock:", 0, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)clusterAndWaitWithCancelOrExtendTimeoutBlock:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v7 = (id)os_transaction_create();
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCPClusterer_clusterAndWaitWithCancelOrExtendTimeoutBlock___block_invoke;
  block[3] = &unk_1E6B158C8;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(processingQueue, block);

}

void __61__VCPClusterer_clusterAndWaitWithCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "needsFullSync") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "needsUpdate"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:cancelOrExtendTimeoutBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 40));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isReady"))
    objc_msgSend(*(id *)(a1 + 32), "_processingQueuePerformForcedFaceClustering:cancelOrExtendTimeoutBlock:", 1, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_cancelClusteringAndRestoreClusterCache:(BOOL)a3
{
  _BOOL4 v3;
  atomic<BOOL> *p_canceled;
  VNClustererBuilder *clusterBuilder;

  v3 = a3;
  p_canceled = &self->_canceled;
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
  -[VNCanceller signalCancellation](self->_visionCanceler, "signalCancellation");
  dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (v3)
  {
    atomic_store(0, (unsigned __int8 *)p_canceled);
    clusterBuilder = self->_clusterBuilder;
    self->_clusterBuilder = 0;

    -[VCPClusterer restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:](self, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", 1, 0, 0);
  }
}

- (void)cancelClustering
{
  -[VCPClusterer _cancelClusteringAndRestoreClusterCache:](self, "_cancelClusteringAndRestoreClusterCache:", 1);
}

- (void)_recordClusteringState:(BOOL)a3
{
  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  self->_currentStatusSnapshot.isClustering = a3;
  if (!a3)
    self->_currentStatusSnapshot.rebuildRequired = 0;
  self->_currentStatusSnapshotIsValid = 1;
  -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
}

- (void)_recordClusterRebuildRequired:(BOOL)a3
{
  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  self->_currentStatusSnapshot.rebuildRequired = a3;
  self->_currentStatusSnapshotIsValid = 1;
  -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
}

- (void)_recordCountOfPendingFacesToAdd:(unint64_t)a3
{
  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  self->_currentStatusSnapshot.countOfFacesPendingToAdd = a3;
  self->_currentStatusSnapshotIsValid = 1;
  -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
}

- (void)_recordIncrementCountOfPendingFacesToAdd:(unint64_t)a3
{
  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  *(int64x2_t *)&self->_currentStatusSnapshot.countOfEligibleFaces = vaddq_s64(*(int64x2_t *)&self->_currentStatusSnapshot.countOfEligibleFaces, vdupq_n_s64(a3));
  self->_currentStatusSnapshotIsValid = 1;
  -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
}

- (void)_recordCurrentStatus:(id *)a3
{
  __int128 v5;

  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  v5 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_currentStatusSnapshot.isClustering = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_currentStatusSnapshot.countOfEligibleFaces = v5;
  self->_currentStatusSnapshotIsValid = 1;
  -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
}

- (id)status
{
  unint64_t countOfEligibleFaces;
  unint64_t countOfFacesPendingToAdd;
  BOOL isClustering;
  BOOL rebuildRequired;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_currentStatusSnapshotLock, "lock");
  if (self->_currentStatusSnapshotIsValid)
  {
    countOfEligibleFaces = self->_currentStatusSnapshot.countOfEligibleFaces;
    countOfFacesPendingToAdd = self->_currentStatusSnapshot.countOfFacesPendingToAdd;
    isClustering = self->_currentStatusSnapshot.isClustering;
    rebuildRequired = self->_currentStatusSnapshot.rebuildRequired;
    -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
    v13[0] = CFSTR("VCPClusteringStatusIsClustering");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isClustering);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = CFSTR("VCPClusteringStatusClusterRebuildRequired");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", rebuildRequired);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    v13[2] = CFSTR("VCPClusteringStatusEligibleFacesCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", countOfEligibleFaces);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v9;
    v13[3] = CFSTR("VCPClusteringStatusPendingFacesCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", countOfFacesPendingToAdd);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    -[NSLock unlock](self->_currentStatusSnapshotLock, "unlock");
    return MEMORY[0x1E0C9AA70];
  }
}

- (BOOL)_performAndPersistClustersWithFaceTorsoprintsToAdd:(id)a3 groupingIdentifiersToAdd:(id)a4 faceTorsoprintsToRemove:(id)a5 updatedFaces:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  id v12;
  uint64_t v13;
  VNClustererBuilder *clusterBuilder;
  VNCanceller *visionCanceler;
  id *v16;
  uint64_t v17;
  uint64_t numer;
  uint32_t denom;
  unint64_t v20;
  unint64_t v21;
  float v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  id *v53;
  BOOL v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  uint64_t v65;
  os_signpost_id_t spid;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int (**v80)(void);
  id v81;
  _QWORD aBlock[7];
  _QWORD v83[4];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id obj;
  uint8_t buf[8];
  uint8_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint8_t v96[4];
  uint64_t v97;
  _BYTE v98[24];
  char v99;
  uint64_t v100;
  void *v101;
  _BYTE v102[128];
  uint64_t v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v73 = a4;
  v74 = a5;
  v69 = a6;
  v80 = (unsigned int (**)(void))a7;
  v72 = v12;
  if (!objc_msgSend(v12, "count") && !objc_msgSend(v74, "count"))
    goto LABEL_76;
  -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 60);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Start clustering", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v91 = buf;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__2;
  v94 = __Block_byref_object_dispose__2;
  v95 = 0;
  v13 = mach_absolute_time();
  visionCanceler = self->_visionCanceler;
  clusterBuilder = self->_clusterBuilder;
  v16 = (id *)(v91 + 40);
  obj = (id)*((_QWORD *)v91 + 5);
  -[VNClustererBuilder updateModelByAddingPersons:withGroupingIdentifiers:andRemovingPersons:canceller:error:](clusterBuilder, "updateModelByAddingPersons:withGroupingIdentifiers:andRemovingPersons:canceller:error:", v12, v73, v74, visionCanceler, &obj);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v16, obj);
  v17 = mach_absolute_time();
  numer = self->_timebase.numer;
  denom = self->_timebase.denom;
  v20 = objc_msgSend(v71, "count");
  v21 = v20;
  if (v20)
    v22 = (float)((float)((float)((v17 - v13) * numer) / (float)denom) / 1000000.0) / (float)v20;
  else
    v22 = 0.0;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v98 = 134218240;
    *(_QWORD *)&v98[4] = v21;
    *(_WORD *)&v98[12] = 2048;
    *(double *)&v98[14] = v22;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Finished clustering %lu faces, with normalized %.2f millisecond per face", v98, 0x16u);
  }
  v23 = (void *)*((_QWORD *)v91 + 5);
  if (v23)
  {
    if (a8)
      *a8 = objc_retainAutorelease(v23);
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = *((_QWORD *)v91 + 5);
      *(_DWORD *)v98 = 138412290;
      *(_QWORD *)&v98[4] = v24;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Vision failed to cluster - %@", v98, 0xCu);
    }
LABEL_22:
    v28 = 1;
    goto LABEL_74;
  }
  if (v80 && v80[2]())
  {
    if (a8)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v103 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation cancelled"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v27);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = mach_absolute_time();
  VCPSignPostLog();
  v29 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v29);

  VCPSignPostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)v98 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPVisionFgMapping_Prepare", ", v98, 2u);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v70 = v71;
  v32 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v86;
    v67 = *MEMORY[0x1E0CB2F90];
    v68 = *MEMORY[0x1E0CB2D50];
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v86 != v33)
          objc_enumerationMutation(v70);
        v35 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v34);
        v36 = (void *)MEMORY[0x1BCCA1B2C]();
        if (!v80 || !v80[2]())
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "clusterId"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objects");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "count"))
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v39);
          else
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKey:", v41, v38);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v42 = objc_msgSend(v39, "count");
            *(_DWORD *)v98 = 134217984;
            *(_QWORD *)&v98[4] = v42;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Preparing Vision Clusters (size: %ld) to Photos FaceGroup", v98, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setObject:forKey:", v43, v38);
          -[VCPClusterer level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:](self, "level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:", objc_msgSend(v38, "longValue"), 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKeyedSubscript:", v44, v38);
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke;
          v83[3] = &unk_1E6B158F0;
          v45 = v43;
          v84 = v45;
          objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v83);

          v40 = 1;
          goto LABEL_42;
        }
        if (a8)
        {
          v37 = (void *)MEMORY[0x1E0CB35C8];
          v100 = v68;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation cancelled"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", v67, -128, v39);
          v40 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

          goto LABEL_43;
        }
        v40 = 0;
LABEL_43:
        objc_autoreleasePoolPop(v36);
        if (!v40)
        {

          goto LABEL_65;
        }
        ++v34;
      }
      while (v32 != v34);
      v46 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
      v32 = v46;
    }
    while (v46);
  }

  VCPSignPostLog();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)v98 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v48, OS_SIGNPOST_INTERVAL_END, spid, "VCPVisionFgMapping_Prepare", ", v98, 2u);
  }

  if (v65)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if (!objc_msgSend(v77, "count"))
    goto LABEL_72;
  *(_QWORD *)v98 = 0;
  *(_QWORD *)&v98[8] = v98;
  *(_QWORD *)&v98[16] = 0x2020000000;
  v99 = 1;
  -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 70);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke_279;
  aBlock[3] = &unk_1E6B15918;
  aBlock[5] = v98;
  aBlock[4] = self;
  aBlock[6] = buf;
  v51 = _Block_copy(aBlock);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v96 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Start to update database models", v96, 2u);
  }
  persistenceDelegate = self->_persistenceDelegate;
  v53 = (id *)(v91 + 40);
  v81 = (id)*((_QWORD *)v91 + 5);
  v54 = -[VCPPhotosPersistenceDelegate persistChangesToAlgorithmicFaceGroups:l1ClustersByFaceCSNRepresentingFaceGroup:l0ClustersByFaceCSNRepresentingFaceGroup:faceCSNByLocalIdentifierForNewlyClusteredFaces:faceCSNsOfUnclusteredFaces:localIdentifiersOfUnclusteredFaces:persistenceCompletionBlock:cancelOrExtendTimeoutBlock:error:](persistenceDelegate, "persistChangesToAlgorithmicFaceGroups:l1ClustersByFaceCSNRepresentingFaceGroup:l0ClustersByFaceCSNRepresentingFaceGroup:faceCSNByLocalIdentifierForNewlyClusteredFaces:faceCSNsOfUnclusteredFaces:localIdentifiersOfUnclusteredFaces:persistenceCompletionBlock:cancelOrExtendTimeoutBlock:error:", v77, v76, v75, v69, v49, v50, v51, v80, &v81);
  objc_storeStrong(v53, v81);
  *(_BYTE *)(*(_QWORD *)&v98[8] + 24) = v54;
  if (objc_msgSend(v49, "count") || objc_msgSend(v50, "count"))
    -[VCPClusterer scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:](self, "scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:", v49, v50);
  v55 = *(unsigned __int8 *)(*(_QWORD *)&v98[8] + 24);
  if (*(_BYTE *)(*(_QWORD *)&v98[8] + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v96 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Updated database models", v96, 2u);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v56 = *((_QWORD *)v91 + 5);
      *(_DWORD *)v96 = 138412290;
      v97 = v56;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to persist FaceGroups; will try next time - %@",
        v96,
        0xCu);
    }
    v57 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v69, "allValues");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v69, "allKeys");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPClusterer scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:](self, "scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:", v59, v62);

    if (a8)
      *a8 = objc_retainAutorelease(*((id *)v91 + 5));
  }

  _Block_object_dispose(v98, 8);
  if (!v55)
LABEL_65:
    v28 = 1;
  else
LABEL_72:
    v28 = 0;

LABEL_74:
  _Block_object_dispose(buf, 8);

  if (!v28)
  {
LABEL_76:
    v63 = 1;
    goto LABEL_77;
  }
  v63 = 0;
LABEL_77:

  return v63;
}

void __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:");

}

void __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke_279(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  id obj;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_processingQueueSaveClusterCache:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to save cluster cache - %@", buf, 0xCu);
  }
}

- (id)_faceTorsoprintsFromFaceCSNs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0CEDEE8]);
        v11 = (void *)objc_msgSend(v10, "initWithFaceprint:torsoprint:", 0, 0, (_QWORD)v13);
        objc_msgSend(v11, "setPersonId:", objc_msgSend(v9, "integerValue"));
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_faceTorsoprintsFromFaceIdentifiers:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5 groupingIdentifiers:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  -[VCPPhotosPersistenceDelegate facesForClusteringWithLocalIdentifiers:faceprintVersion:groupingIdentifiers:](self->_persistenceDelegate, "facesForClusteringWithLocalIdentifiers:faceprintVersion:groupingIdentifiers:", v10, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPClusterer _faceTorsoprintsFromFaces:assignClusterSeqNumberIfNeeded:updatedFaces:](self, "_faceTorsoprintsFromFaces:assignClusterSeqNumberIfNeeded:updatedFaces:", v14, v8, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  return v15;
}

- (id)_faceTorsoprintsFromFaces:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t nextSeqNum;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  _BOOL4 v25;
  id v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v25 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v10, "imageprintWrapper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type"))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v13 = objc_msgSend(v12, "type");
            *(_DWORD *)buf = 134217984;
            v35 = v13;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Cannot cluster image print type %lu", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v12, "data");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v29 = 0;
            +[VCPVNImageprintWrapper generateVNImageprintWithType:archiveData:andError:](VCPVNImageprintWrapper, "generateVNImageprintWithType:archiveData:andError:", 0, v14, &v29);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v29;
            if (v15)
            {
              v16 = objc_msgSend(v10, "clusterSequenceNumber");
              nextSeqNum = v16;
              if (v25 && !v16)
              {
                nextSeqNum = self->_nextSeqNum;
                self->_nextSeqNum = nextSeqNum + 1;
                objc_msgSend(v10, "setClusterSequenceNumber:", nextSeqNum);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", nextSeqNum);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "localIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v19);

              }
              if (nextSeqNum >= 1)
              {
                objc_msgSend(v15, "setPersonId:", nextSeqNum);
                objc_msgSend(v24, "addObject:", v15);
                if (self->_nextSeqNum <= nextSeqNum)
                  self->_nextSeqNum = nextSeqNum + 1;
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "localIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v35 = (uint64_t)v21;
              v36 = 2112;
              v37 = v27;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Failed to get VNFaceTorsoprint from face %@ - %@", buf, 0x16u);

            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "localIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v20;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Missing faceprint data for face %@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v7);
  }

  return v24;
}

- (void)_removeEmptyGroups
{
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  BOOL v3;
  id v4;
  BOOL v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  persistenceDelegate = self->_persistenceDelegate;
  v6 = 0;
  v3 = -[VCPPhotosPersistenceDelegate deleteEmptyGroupsAndReturnError:](persistenceDelegate, "deleteEmptyGroupsAndReturnError:", &v6);
  v4 = v6;
  if (v4)
    v5 = 0;
  else
    v5 = v3;
  if (!v5 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove empty FaceGroup(s) - %@", buf, 0xCu);
  }

}

- (void)_processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 visionClusters:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(_QWORD);
  double Current;
  unint64_t v10;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  BOOL v12;
  id v13;
  BOOL v14;
  id v15;
  VCPPhotosPersistenceDelegate *v16;
  BOOL v17;
  BOOL v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  float v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  uint64_t v27;
  CFAbsoluteTime v28;
  id v29;
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(_QWORD))a5;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Start quick-syncing cluster cache with library", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v10 = objc_msgSend(v7, "count");
  persistenceDelegate = self->_persistenceDelegate;
  v30 = 0;
  v12 = -[VCPPhotosPersistenceDelegate cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:error:](persistenceDelegate, "cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:error:", v8, &v30);
  v13 = v30;
  if (v13)
    v14 = 0;
  else
    v14 = v12;
  if (!v14 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v32 = *(double *)&v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to clean faces with valid CSN but not in any FaceGroup - %@", buf, 0xCu);
  }
  if (v8 && (v8[2](v8) & 1) != 0)
  {
    v15 = v13;
    goto LABEL_42;
  }
  v16 = self->_persistenceDelegate;
  v29 = v13;
  v17 = -[VCPPhotosPersistenceDelegate cleanupGroupedFacesWithClusterSequenceNumberSetToZero:error:](v16, "cleanupGroupedFacesWithClusterSequenceNumberSetToZero:error:", v8, &v29);
  v15 = v29;

  if (v15)
    v18 = 0;
  else
    v18 = v17;
  if (!v18 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v32 = *(double *)&v15;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to clean faces with CSN = 0 but found in any FaceGroup - %@", buf, 0xCu);
  }
  if (!v8 || (v8[2](v8) & 1) == 0)
  {
    v19 = -[VCPPhotosPersistenceDelegate countOfClusteredFaces](self->_persistenceDelegate, "countOfClusteredFaces");
    if (v10 >= v19)
    {
      if (!v10 || (v23 = (float)(v10 - v19) / (float)v10, v23 <= 0.1))
      {
        v27 = 40;
        goto LABEL_39;
      }
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_33:
        if (self->_timestampOfLastClusterComparison)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceDate:", self->_timestampOfLastClusterComparison);
          v26 = v25 < 10080.0;

          if (v26)
            v27 = 40;
          else
            v27 = 10;
        }
        else
        {
          v27 = 10;
        }
LABEL_39:
        -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", v27);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v28 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          v32 = v28 - Current;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Finished quick-syncing cluster cache with library. Elapsed time: %f", buf, 0xCu);
        }
        goto LABEL_42;
      }
      *(_DWORD *)buf = 134217984;
      v32 = (float)(v23 * 100.0);
      v20 = MEMORY[0x1E0C81028];
      v21 = "VCPClusterer: Quick-syncing cluster cache with library, found > 10%% (%5.2f) difference in the number of fac"
            "es that are in the cluster cache versus library";
      v22 = 12;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_DWORD *)buf = 134218240;
      v32 = *(double *)&v10;
      v33 = 2048;
      v34 = v19;
      v20 = MEMORY[0x1E0C81028];
      v21 = "VCPClusterer: Number of clustered faces in the cluster cache (%lu) < number of clustered faces in the library (%lu)";
      v22 = 22;
    }
    _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_INFO, v21, buf, v22);
    goto LABEL_33;
  }
LABEL_42:

}

- (void)_processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  unsigned int (**v6)(_QWORD);
  unsigned int (**v7)(_QWORD);
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  const char *v21;
  os_log_type_t v22;
  uint32_t v23;
  NSObject *v24;
  id v25;
  id v26;
  _BOOL4 v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  void *v35;
  NSObject *v36;
  id v37;
  _BOOL4 v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  NSObject *v47;
  id v48;
  char v49;
  int v50;
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  NSObject *v59;
  id v60;
  void *v61;
  int v62;
  NSObject *v63;
  VCPPhotosPersistenceDelegate *v64;
  _BOOL4 v65;
  id v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  double v72;
  NSObject *v73;
  id v74;
  void *v75;
  double v76;
  NSObject *v77;
  id v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  float v83;
  NSObject *v84;
  id v85;
  uint64_t v86;
  NSObject *v87;
  id v88;
  NSObject *v89;
  id v90;
  NSObject *v91;
  id v92;
  NSObject *v93;
  id v94;
  NSObject *v95;
  id v96;
  id v97;
  int v98;
  void *v99;
  uint64_t v100;
  NSObject *v101;
  id v102;
  VCPPhotosPersistenceDelegate *v103;
  void *v104;
  id v105;
  NSObject *v106;
  id v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  NSObject *v111;
  id v112;
  NSObject *v113;
  id v114;
  id v115;
  VCPPhotosPersistenceDelegate *v116;
  _BOOL4 v117;
  double v118;
  NSObject *v119;
  id v120;
  NSDate *v121;
  NSDate *timestampOfLastClusterComparison;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  int v136;
  id v137;
  id v138;
  _QWORD v139[2];
  __int16 v140;
  id v141;
  id v142;
  id v143;
  id v144;
  _QWORD v145[4];
  id v146;
  _QWORD v147[5];
  _QWORD v148[4];
  id v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  id v156;
  _QWORD v157[4];
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  uint8_t v163[4];
  double v164;
  _BYTE buf[24];
  uint64_t v166;
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v138 = a3;
  v6 = (unsigned int (**)(_QWORD))a4;
  v7 = v6;
  if (!v6 || !v6[2](v6))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Start syncing cluster cache with library ...", buf, 2u);
      }

    }
    if (self->_clustererBringUpState)
    {
      v10 = 0;
      if (!v7)
        goto LABEL_22;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v11 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);

        }
      }
      v162 = 0;
      -[VCPClusterer _processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:visionClusters:cancelOrExtendTimeoutBlock:](self, "_processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:visionClusters:cancelOrExtendTimeoutBlock:", v138, &v162, v7);
      v10 = v162;
      if (!v7)
        goto LABEL_22;
    }
    if (v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_213;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      v14 = MEMORY[0x1E0C81028];
LABEL_40:
      _os_log_impl(&dword_1B6C4A000, v14, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
LABEL_213:

      goto LABEL_214;
    }
LABEL_22:
    if (self->_clustererBringUpState != 10)
    {
      v136 = 1;
      goto LABEL_35;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);

      }
    }
    if (v10)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v36 = MEMORY[0x1E0C81028];
        v37 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieving clusters from cluster cache ...", buf, 2u);
        }

      }
      v161 = 0;
      v38 = -[VCPClusterer _processingQueueGetVisionClusters:minimumClusterSize:returnClusterAsCountedSet:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:error:](self, "_processingQueueGetVisionClusters:minimumClusterSize:returnClusterAsCountedSet:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:error:", v10, 1, 1, 0, v7, &v161);
      v18 = v161;
      if (!v38)
      {
        v19 = v10;
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_111;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        v20 = MEMORY[0x1E0C81028];
        v21 = "VCPClusterer: Failed to retrieve clusters from cluster cache - %@";
        v22 = OS_LOG_TYPE_ERROR;
        v23 = 12;
        goto LABEL_110;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v39 = MEMORY[0x1E0C81028];
        v40 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieved clusters from cluster cache", buf, 2u);
        }

      }
    }
    v19 = v10;
    if (v7 && v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_111;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      v20 = MEMORY[0x1E0C81028];
      v21 = "VCPClusterer: Canceled syncing cluster cache [point: %d]";
      v22 = OS_LOG_TYPE_DEBUG;
      v23 = 8;
LABEL_110:
      _os_log_impl(&dword_1B6C4A000, v20, v22, v21, buf, v23);
LABEL_111:

LABEL_112:
      v10 = v19;
      goto LABEL_213;
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v32 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieving clusters from library ...", buf, 2u);
      }

    }
    persistenceDelegate = self->_persistenceDelegate;
    v160 = 0;
    -[VCPPhotosPersistenceDelegate groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:error:](persistenceDelegate, "groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:error:", 1, &v160);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v160;
    if (v137)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v137;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters from library - %@", buf, 0xCu);
      }

      goto LABEL_112;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v41 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieved clusters from library", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v43);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = MEMORY[0x1E0C809B0];
    v157[0] = MEMORY[0x1E0C809B0];
    v157[1] = 3221225472;
    v157[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke;
    v157[3] = &unk_1E6B15940;
    v131 = v43;
    v158 = v131;
    v133 = v126;
    v159 = v133;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v157);
    v154[0] = v44;
    v154[1] = 3221225472;
    v154[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_2;
    v154[3] = &unk_1E6B15940;
    v45 = v127;
    v155 = v45;
    v135 = v125;
    v156 = v135;
    objc_msgSend(v35, "enumerateObjectsUsingBlock:", v154);

    v46 = v131;
    v152[0] = v44;
    v152[1] = 3221225472;
    v152[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_4;
    v152[3] = &unk_1E6B159A8;
    v153 = &__block_literal_global_285;
    objc_msgSend(v131, "sortUsingComparator:", v152);
    v150[0] = v44;
    v150[1] = 3221225472;
    v150[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_5;
    v150[3] = &unk_1E6B159A8;
    v151 = &__block_literal_global_285;
    objc_msgSend(v45, "sortUsingComparator:", v150);
    if (v7 && v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
        v49 = 0;
        v136 = 1;
LABEL_212:

        v10 = 0;
        if ((v49 & 1) == 0)
          goto LABEL_213;
LABEL_35:
        if (v7 && v7[2](v7))
        {
          if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            goto LABEL_213;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v136;
          v14 = MEMORY[0x1E0C81028];
          goto LABEL_40;
        }
        v134 = v10;
        if (self->_clustererBringUpState != 20)
        {
LABEL_82:
          if (v7 && v7[2](v7))
          {
            if ((int)MediaAnalysisLogLevel() < 7)
              goto LABEL_213;
            v54 = MEMORY[0x1E0C81028];
            v55 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v136;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
            }

          }
          else
          {
            if (self->_clustererBringUpState == 30)
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v56 = MEMORY[0x1E0C81028];
                v57 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
                  v58 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v58;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);

                }
              }
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v59 = MEMORY[0x1E0C81028];
                v60 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Deleting FaceGroups and reset CSN of all previously clustered faces", buf, 2u);
                }

              }
              v61 = 0;
              v62 = 1;
              v63 = MEMORY[0x1E0C81028];
              while (1)
              {
                v64 = self->_persistenceDelegate;
                v142 = v61;
                v65 = -[VCPPhotosPersistenceDelegate resetLibraryClustersWithCancelOrExtendTimeoutBlock:error:](v64, "resetLibraryClustersWithCancelOrExtendTimeoutBlock:error:", v7, &v142);
                v66 = v142;

                v61 = v66;
                if (v7)
                {
                  if (v7[2](v7))
                    break;
                }
                if (v65)
                  goto LABEL_140;
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v67 = v63;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)&buf[4] = v62;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = 3;
                    _os_log_impl(&dword_1B6C4A000, v63, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retry deleting FaceGroups and reset CSN of all previously clustered faces. Attempt %d of %d.", buf, 0xEu);
                  }

                }
                if (++v62 == 4)
                  goto LABEL_145;
              }
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v87 = MEMORY[0x1E0C81028];
                v88 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v136;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d do loop]", buf, 8u);
                }

              }
              if (!v65)
              {
LABEL_145:
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v91 = MEMORY[0x1E0C81028];
                  v92 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v66;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to delete face groups and reset CSN of all previously clustered faces - %@", buf, 0xCu);
                  }

                }
                goto LABEL_149;
              }
LABEL_140:
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v89 = MEMORY[0x1E0C81028];
                v90 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Deleted FaceGroups and reset CSN of all previously clustered faces", buf, 2u);
                }

              }
              -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 40);
LABEL_149:

              v10 = v134;
            }
            if (v7 && v7[2](v7))
            {
              if ((int)MediaAnalysisLogLevel() < 7)
                goto LABEL_213;
              v93 = MEMORY[0x1E0C81028];
              v94 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v136;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
              }

            }
            else
            {
              if (self->_clustererBringUpState == 40)
              {
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  v95 = MEMORY[0x1E0C81028];
                  v96 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                  {
                    -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
                    v97 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v97;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);

                  }
                }
                -[VCPPhotosPersistenceDelegate unclusteredClusteringEligibleFaceLocalIdentifiers:](self->_persistenceDelegate, "unclusteredClusteringEligibleFaceLocalIdentifiers:", 0);
                v98 = v136;
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v99, "count"))
                  -[NSMutableSet unionSet:](self->_faceIdStrsToAdd, "unionSet:", v99);
                v100 = -[NSMutableSet count](self->_faceIdStrsToAdd, "count");
                if (v100 && (int)MediaAnalysisLogLevel() >= 7)
                {
                  v101 = MEMORY[0x1E0C81028];
                  v102 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v100;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Schedule adding %lu faces to the cluster state", buf, 0xCu);
                  }

                  v98 = v136;
                }
                v103 = self->_persistenceDelegate;
                v141 = 0;
                -[VCPPhotosPersistenceDelegate invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:cancelOrExtendTimeoutBlock:error:](v103, "invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:cancelOrExtendTimeoutBlock:error:", v138, v7, &v141);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = v141;
                if (v104)
                {
                  -[NSMutableSet unionSet:](self->_faceCSNsToRemove, "unionSet:", v104);
                }
                else if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v106 = MEMORY[0x1E0C81028];
                  v107 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPClusterer: Failed to get faces that are no longer present in the library", buf, 2u);
                  }

                  v98 = v136;
                }
                if (v7 && v7[2](v7))
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v108 = MEMORY[0x1E0C81028];
                    v109 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&buf[4] = v98;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
                    }

                  }
                  goto LABEL_191;
                }
                v110 = -[NSMutableSet count](self->_faceCSNsToRemove, "count");
                if (v110 && (int)MediaAnalysisLogLevel() >= 7)
                {
                  v111 = MEMORY[0x1E0C81028];
                  v112 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v110;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Schedule removing %lu faces from the cluster state", buf, 0xCu);
                  }

                }
                self->_accumulatedChangesCount = v110 + v100;
                -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 50);
                v139[0] = -[VCPPhotosPersistenceDelegate countOfClusteringEligibleFaces](self->_persistenceDelegate, "countOfClusteringEligibleFaces");
                v139[1] = v100;
                v140 = 0;
                -[VCPClusterer _recordCurrentStatus:](self, "_recordCurrentStatus:", v139);

                v10 = v134;
              }
              if ((int)MediaAnalysisLogLevel() < 6)
                goto LABEL_213;
              v113 = MEMORY[0x1E0C81028];
              v114 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
              {
                -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
                v115 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v115;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Finished syncing cluster cache with library - %@", buf, 0xCu);

              }
            }
          }
LABEL_191:
          v10 = v134;
          goto LABEL_213;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v24 = MEMORY[0x1E0C81028];
          v25 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v26;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);

          }
        }
        v143 = 0;
        v27 = -[VCPClusterer _processingQueueResetClusterCache:](self, "_processingQueueResetClusterCache:", &v143);
        v28 = v143;
        if (v27)
        {
          -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 30);
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v29 = MEMORY[0x1E0C81028];
            v30 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
              v31 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v31;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Successfully reset cluster cache - %@", buf, 0xCu);

            }
LABEL_80:

          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v51 = MEMORY[0x1E0C81028];
          v52 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
            v53 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v28;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to reset cluster cache - %@ - %@", buf, 0x16u);

          }
          goto LABEL_80;
        }

        goto LABEL_82;
      }
      v47 = MEMORY[0x1E0C81028];
      v48 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v136 = 1;
        v49 = 0;
        goto LABEL_211;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      _os_log_impl(&dword_1B6C4A000, v47, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
      v49 = 0;
      v50 = 2;
LABEL_210:
      v136 = v50;
LABEL_211:

      goto LABEL_212;
    }
    VCPCompareLibraryClustersWithVisionClusters(v45, v131);
    v124 = objc_claimAutoreleasedReturnValue();
    v129 = (void *)objc_msgSend(v133, "mutableCopy");
    objc_msgSend(v129, "minusSet:", v135);
    v130 = (void *)objc_msgSend(v135, "mutableCopy");
    objc_msgSend(v130, "minusSet:", v133);
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v166 = 0;
    v47 = v124;
    v68 = -[NSObject count](v124, "count");
    v69 = objc_msgSend(v130, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v135, "count") + objc_msgSend(v45, "count"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v129;
    if (v68)
    {
      -[NSObject objectForKeyedSubscript:](v124, "objectForKeyedSubscript:", CFSTR("VisionClustersMinusLibraryClusters"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = COERCE_DOUBLE(objc_msgSend(v71, "count"));
      if (v72 != 0.0)
      {
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_286;
        v148[3] = &unk_1E6B159D0;
        v149 = v128;
        objc_msgSend(v71, "enumerateObjectsUsingBlock:", v148);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v73 = MEMORY[0x1E0C81028];
          v74 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v163 = 134217984;
            v164 = v72;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found %lu non-singleton clusters in the cluster cache that do not match those in the library", v163, 0xCu);
          }

        }
      }
      -[NSObject objectForKeyedSubscript:](v124, "objectForKeyedSubscript:", CFSTR("LibraryClustersMinusVisionClusters"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = COERCE_DOUBLE(objc_msgSend(v75, "count"));
      if (v76 != 0.0)
      {
        v147[0] = MEMORY[0x1E0C809B0];
        v147[1] = 3221225472;
        v147[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_287;
        v147[3] = &unk_1E6B159F8;
        v147[4] = buf;
        objc_msgSend(v75, "enumerateObjectsUsingBlock:", v147);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v77 = MEMORY[0x1E0C81028];
          v78 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v163 = 134217984;
            v164 = v76;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found %lu clusters in the library cache that do not match those in the cluster cache", v163, 0xCu);
          }

        }
      }
      v79 = -[VCPPhotosPersistenceDelegate countOfClusteredFaces](self->_persistenceDelegate, "countOfClusteredFaces");
      v80 = objc_msgSend(v138, "count");
      if (v79 <= v80)
        v81 = v80;
      else
        v81 = v79;
      v46 = v131;
      if (v81)
      {
        v82 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        v83 = (float)(unint64_t)(objc_msgSend(v128, "count") + v82) / (float)v81;
        if (v83 > 0.2)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v84 = MEMORY[0x1E0C81028];
            v85 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v163 = 134217984;
              v164 = (float)(v83 * 100.0);
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found > 20%% (%5.2f) difference in the number of faces are in the cluster cache versus library", v163, 0xCu);
            }

          }
          v47 = v124;
          v86 = 20;
          goto LABEL_207;
        }
      }
      -[NSMutableSet unionSet:](self->_faceCSNsToRemove, "unionSet:", v128);
      if (v76 != 0.0)
        objc_msgSend(v132, "addObjectsFromArray:", v75);

      v47 = v124;
      v70 = v129;
    }
    if (objc_msgSend(v70, "count"))
      -[NSMutableSet unionSet:](self->_faceCSNsToRemove, "unionSet:", v70);
    if (v69)
    {
      v145[0] = MEMORY[0x1E0C809B0];
      v145[1] = 3221225472;
      v145[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_288;
      v145[3] = &unk_1E6B15A20;
      v146 = v132;
      objc_msgSend(v130, "enumerateObjectsUsingBlock:", v145);

    }
    if (objc_msgSend(v132, "count"))
    {
      v116 = self->_persistenceDelegate;
      v144 = 0;
      v117 = -[VCPPhotosPersistenceDelegate ungroupFaceClusterSequenceNumbers:batchSizeForUnclusteringFaces:cancelOrExtendTimeoutBlock:error:](v116, "ungroupFaceClusterSequenceNumbers:batchSizeForUnclusteringFaces:cancelOrExtendTimeoutBlock:error:", v132, 500, v7, &v144);
      v118 = COERCE_DOUBLE(v144);
      if (!v117 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v119 = MEMORY[0x1E0C81028];
        v120 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v163 = 138412290;
          v164 = v118;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to ungroup faces - %@", v163, 0xCu);
        }

        v47 = v124;
      }
      -[VCPClusterer _removeEmptyGroups](self, "_removeEmptyGroups");

      if (!v117)
      {
        v86 = 40;
        goto LABEL_209;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v121 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timestampOfLastClusterComparison = self->_timestampOfLastClusterComparison;
    self->_timestampOfLastClusterComparison = v121;

    v123 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](self->_timestampOfLastClusterComparison, "timeIntervalSinceReferenceDate");
    objc_msgSend(v123, "numberWithDouble:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPClusterer _setPropertyDictionaryValue:forKey:](self, "_setPropertyDictionaryValue:forKey:", v71, CFSTR("VCPClusterCompareTimestamp"));
    v86 = 40;
LABEL_207:

LABEL_209:
    -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", v86);

    _Block_object_dispose(buf, 8);
    v49 = 1;
    v50 = 1;
    goto LABEL_210;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 1;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
  }
LABEL_214:

}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v3);
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v3);
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "count");
  v6 = objc_msgSend(v4, "count");
  if (v5 > v6)
    v7 = -1;
  else
    v7 = v5 < v6;

  return v7;
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_286(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_287(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_288(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (BOOL)_processingQueueGetFaceClusterSequenceNumbersInClusterCache:(id *)a3 lastClusterSequenceNumber:(unint64_t *)a4 error:(id *)a5
{
  void *v7;
  VNClustererBuilder *clusterBuilder;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id *v20;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  clusterBuilder = self->_clusterBuilder;
  v28 = 0;
  -[VNClustererBuilder allClusteredFaceIdsAndReturnError:](clusterBuilder, "allClusteredFaceIdsAndReturnError:", &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (!v10)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v9;
    a5 = 0;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v14);
          v20 = (id *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntegerValue");
          if (v20 > a5)
            a5 = v20;
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      }
      while (v17);
    }
    v9 = v14;
    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = CFSTR("VCPClusterer: Failed to get face CSNs from cluster cache, which should not be used");
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ - %@", buf, 0x16u);
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = *MEMORY[0x1E0CB3388];
    v29[0] = v31;
    v29[1] = v13;
    v30[0] = CFSTR("VCPClusterer: Failed to get face CSNs from cluster cache, which should not be used");
    v30[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("PVErrorInvalidClusterCacheFile - %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
LABEL_19:

  }
  objc_autoreleasePoolPop(v7);
  if (!v10)
  {
    *a3 = objc_retainAutorelease(v9);
    *a4 = (unint64_t)a5;
  }

  return v10 == 0;
}

- (BOOL)_processingQueueSaveClusterCache:(id *)a3
{
  unint64_t v4;
  VNClustererBuilder *clusterBuilder;
  void *v6;
  id v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *faceCSNsInClusterCache;
  BOOL v15;
  id v16;
  NSSet *v17;
  NSSet *v18;
  BOOL v19;
  NSURL *v20;
  int v21;
  uint64_t v22;
  NSURL *v23;
  int v24;
  id v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  const std::__fs::filesystem::path *v36;
  id v37;
  const std::__fs::filesystem::path *v38;
  std::error_code *v39;
  int v40;
  int v41;
  _BOOL4 v42;
  void *v43;
  id v45;
  id v46;
  int v47;
  _DWORD __buf[2];
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  unsigned __int8 md[8];
  uint64_t v55;
  uint64_t v56;
  void *v57;
  CC_MD5_CTX buf;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = -[VCPClusterer clustererBringUpState](self, "clustererBringUpState");
  if (v4 != 90 && v4 != 70)
  {
    v13 = 0;
    goto LABEL_10;
  }
  clusterBuilder = self->_clusterBuilder;
  v49 = 0;
  -[VNClustererBuilder saveAndReturnCurrentModelState:](clusterBuilder, "saveAndReturnCurrentModelState:", &v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v49;
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to get Vision cluster state - %@"), v7);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      buf.A = 138412290;
      *(_QWORD *)&buf.B = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    if (a3)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_32;
  }
  v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[NSSet encodeObject:forKey:](v9, "encodeObject:forKey:", v6, CFSTR("VisionClusterState"));
  -[NSSet encodeObject:forKey:](v9, "encodeObject:forKey:", self->_clusteringType, CFSTR("clusteringType"));
  -[NSSet encodeObject:forKey:](v9, "encodeObject:forKey:", self->_threshold, CFSTR("threshold"));
  -[NSSet finishEncoding](v9, "finishEncoding");
  v20 = self->_cacheFileUrl;
  v21 = open(-[NSURL fileSystemRepresentation](self->_cacheFileUrl, "fileSystemRepresentation"), 0);
  if ((v21 & 0x80000000) == 0)
  {
    _tempCacheFileUrlFromCacheFileUrl(v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (NSURL *)v22;
    close(v21);
  }
  v23 = objc_retainAutorelease(v20);
  v24 = open(-[NSURL fileSystemRepresentation](v23, "fileSystemRepresentation"), 1537, 438);
  if (v24 < 0)
  {

    v8 = 0;
LABEL_32:

LABEL_33:
    v19 = 0;
    goto LABEL_34;
  }
  strcpy((char *)__buf, "CLST");
  v47 = 3;
  *(_QWORD *)md = 0;
  v55 = 0;
  -[NSSet encodedData](v9, "encodedData");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (char *)objc_msgSend(v25, "bytes");
  v27 = objc_msgSend(v25, "length");
  CC_MD5_Init(&buf);
  for (; v27; v27 -= v28)
  {
    if (v27 >= 0x4000)
      v28 = 0x4000;
    else
      v28 = v27;
    CC_MD5_Update(&buf, v26, v28);
    v26 += v28;
  }
  CC_MD5_Final(md, &buf);
  write(v24, __buf, 4uLL);
  write(v24, &v47, 4uLL);
  write(v24, md, 0x10uLL);
  v29 = objc_retainAutorelease(v25);
  write(v24, (const void *)objc_msgSend(v29, "bytes"), objc_msgSend(v29, "length"));
  if (close(v24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to write cluster snapshot to file '%@'"), v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      buf.A = 138412290;
      *(_QWORD *)&buf.B = v30;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    if (!a3)
      goto LABEL_40;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v33);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v21 < 0)
    {
      v42 = 1;
      goto LABEL_41;
    }
    -[NSURL path](v23, "path");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = (const std::__fs::filesystem::path *)objc_msgSend(v35, "fileSystemRepresentation");
    -[NSURL path](self->_cacheFileUrl, "path");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = (const std::__fs::filesystem::path *)objc_msgSend(v37, "fileSystemRepresentation");
    rename(v36, v38, v39);
    v41 = v40;

    v42 = v41 == 0;
    if (!a3 || !v41)
      goto LABEL_41;
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to rename file from '%@' to '%@'. Error = %d"), v23, self->_cacheFileUrl, *__error());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v32);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_40:
  v42 = 0;
LABEL_41:

  if (!v42)
  {
    v8 = 0;
    goto LABEL_33;
  }
  v13 = v6;
LABEL_10:
  faceCSNsInClusterCache = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = 0;

  if (objc_msgSend(v13, "length"))
    -[VCPClusterer _removeVisionClusterCacheFilesNotReferencedByVisionClusterState:](self, "_removeVisionClusterCacheFilesNotReferencedByVisionClusterState:", v13);
  *(_QWORD *)&buf.A = 0;
  v45 = 0;
  v46 = 0;
  v15 = -[VCPClusterer _processingQueueGetFaceClusterSequenceNumbersInClusterCache:lastClusterSequenceNumber:error:](self, "_processingQueueGetFaceClusterSequenceNumbersInClusterCache:lastClusterSequenceNumber:error:", &v46, &buf, &v45);
  v9 = (NSSet *)v46;
  v16 = v45;
  v8 = v16;
  if (!v15)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    v6 = v13;
    goto LABEL_32;
  }
  v17 = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = v9;
  v18 = v9;

  self->_nextSeqNum = *(_QWORD *)&buf.A + 1;
  -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 50);
  v19 = 1;
  v6 = v13;
LABEL_34:

  return v19;
}

- (id)_visionClusterMemmapFileInCacheDirectoryURL:(id)a3 clusterState:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CEDE00];
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clustererModelFileNamesFromState:storedInPath:error:", v8, v10, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing parameter clusterState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (BOOL)_processingQueueRestoreClusteringCacheWithCacheDirectoryURL:(id)a3 clusterState:(id)a4 threshold:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  float v23;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  VNClustererBuilder **p_clusterBuilder;
  VNClustererBuilder *clusterBuilder;
  int v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)objc_opt_class();
  v14 = VCPMAGetRevisionForVisionModel(v13, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
  v15 = (objc_class *)objc_opt_class();
  v16 = VCPMAGetRevisionForVisionModel(v15, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
  v17 = objc_alloc(MEMORY[0x1E0CEDDF8]);
  objc_msgSend(v10, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v19 = (void *)objc_msgSend(v17, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", *MEMORY[0x1E0CEE288], v18, v11, v14, v16);

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v20 = -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion");
    objc_msgSend(v19, "type");
    v31 = v20;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "requestRevision");
    objc_msgSend(v19, "threshold");
    v24 = v23;
    v25 = objc_msgSend(v19, "torsoprintRequestRevision");
    objc_msgSend(v19, "torsoThreshold");
    *(_DWORD *)buf = 67110658;
    v34 = v31;
    v35 = 2112;
    v36 = v32;
    v37 = 2112;
    v38 = v21;
    v39 = 2048;
    v40 = v22;
    v41 = 2048;
    v42 = v24;
    v43 = 2048;
    v44 = v25;
    v45 = 2048;
    v46 = v26;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Creating VNClustererBuilder with context.processingVersion:%d, type: %@, cachePath: %@, faceprintRequestRevision-%lu threshold-%.2f, torsoprintRequestRevision-%lu threshold-%.2f", buf, 0x44u);

  }
  objc_msgSend(MEMORY[0x1E0CEDDF0], "clustererBuilderWithOptions:error:", v19, a6);
  v27 = objc_claimAutoreleasedReturnValue();
  clusterBuilder = self->_clusterBuilder;
  p_clusterBuilder = &self->_clusterBuilder;
  *p_clusterBuilder = (VNClustererBuilder *)v27;

  LOBYTE(p_clusterBuilder) = *p_clusterBuilder != 0;
  return (char)p_clusterBuilder;
}

- (BOOL)_processingQueueResetClusterCache:(id *)a3
{
  VNClustererBuilder *clusterBuilder;
  void *v6;
  NSURL *cacheDirUrl;
  char v8;
  id v9;
  NSURL *v10;
  NSNumber *threshold;
  _BOOL4 v12;
  id v13;
  BOOL v14;
  id v15;
  BOOL v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Started resetting cluster cache ... ", buf, 2u);
  }
  clusterBuilder = self->_clusterBuilder;
  self->_clusterBuilder = 0;

  v6 = (void *)objc_opt_class();
  cacheDirUrl = self->_cacheDirUrl;
  v20 = 0;
  v8 = objc_msgSend(v6, "removeClusteringStateCacheWithURL:error:", cacheDirUrl, &v20);
  v9 = v20;
  if ((v8 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove all cluster cache files - %@", buf, 0xCu);
    }

    v9 = 0;
  }
  v10 = self->_cacheDirUrl;
  threshold = self->_threshold;
  v19 = v9;
  v12 = -[VCPClusterer _processingQueueRestoreClusteringCacheWithCacheDirectoryURL:clusterState:threshold:error:](self, "_processingQueueRestoreClusteringCacheWithCacheDirectoryURL:clusterState:threshold:error:", v10, 0, threshold, &v19);
  v13 = v19;

  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Created a new cluster cache", buf, 2u);
    }
    -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 90);
    v18 = v13;
    v14 = -[VCPClusterer _processingQueueSaveClusterCache:](self, "_processingQueueSaveClusterCache:", &v18);
    v15 = v18;

    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Finished resetting cluster cache", buf, 2u);
      }
      v16 = 1;
      if (!a3)
        goto LABEL_30;
LABEL_28:
      if (v15)
        *a3 = objc_retainAutorelease(v15);
      goto LABEL_30;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to save a new cluster cache - %@", buf, 0xCu);
    }
    v16 = 0;
    if (a3)
      goto LABEL_28;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to create a new cluster cache - %@", buf, 0xCu);
    }
    v16 = 0;
    v15 = v13;
    if (a3)
      goto LABEL_28;
  }
LABEL_30:

  return v16;
}

- (id)_visionClusterStateDataBlobFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  int v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ssize_t v19;
  uint8x8_t v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  size_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  uint64_t __buf;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t md;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint8_t v63[4];
  uint64_t v64;
  CC_MD5_CTX buf;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v7 = open(v6, 0);
  v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    v9 = lseek(v7, 0, 2);
    if (v9 > 0x17)
    {
      __buf = 0;
      v59 = 0;
      v60 = 0;
      md = 0;
      v58 = 0;
      v19 = pread(v8, (char *)&__buf + 4, 4uLL, 0);
      v20.i32[0] = HIDWORD(__buf);
      if (vmovn_s16((int16x8_t)vmovl_u8(v20)).u32[0] == 1414745155 && v19 == 4)
      {
        if (pread(v8, &__buf, 4uLL, 4) == 4 && (_DWORD)__buf == 3)
        {
          if (pread(v8, &v59, 0x10uLL, 8) == 16)
          {
            lseek(v8, 24, 0);
            v26 = malloc_type_malloc(0x4000uLL, 0xF507287CuLL);
            if (!v26)
              goto LABEL_37;
            CC_MD5_Init(&buf);
            v27 = v9 - 24;
            if (v27)
            {
              v28 = v27;
              while (1)
              {
                v29 = v28 >= 0x4000 ? 0x4000 : v28;
                if (read(v8, v26, 0x4000uLL) != v29)
                  break;
                CC_MD5_Update(&buf, v26, v29);
                v28 -= v29;
                if (!v28)
                  goto LABEL_24;
              }
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v63 = 134217984;
                v64 = v29;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPClusterer - _calculateChecksumMD5ForFile: error reading %zu bytes from file", v63, 0xCu);
              }
              close(v8);
              v30 = 0;
            }
            else
            {
LABEL_24:
              v30 = 1;
            }
            CC_MD5_Final((unsigned __int8 *)&md, &buf);
            free(v26);
            if ((v30 & 1) != 0)
            {
              if (md == v59 && v58 == v60)
              {
                v37 = malloc_type_malloc(v27, 0x43BB1ABuLL);
                if (pread(v8, v37, v27, 24) == v27)
                {
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v37, v27, 1);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v18)
                  {
                    v13 = 0;
                    goto LABEL_40;
                  }
                  v39 = (void *)MEMORY[0x1E0CB35C8];
                  v43 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to read vision cluster state blob from '%s'"), v6);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v23;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
                  v25 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  free(v37);
                  v38 = (void *)MEMORY[0x1E0CB35C8];
                  v45 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to read size of vision cluster state blob from '%s'"), v6);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v23;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
                  v25 = objc_claimAutoreleasedReturnValue();
                }
              }
              else
              {
                v34 = (void *)MEMORY[0x1E0CB35C8];
                v47 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed MD5 check for '%s'"), v6);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v23;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
                v25 = objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
LABEL_37:
              v35 = (void *)MEMORY[0x1E0CB35C8];
              v49 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to compute MD5 of '%s'"), v6);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
              v25 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v32 = (void *)MEMORY[0x1E0CB35C8];
            v51 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to read MD5 from header of '%s'"), v6);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
            v25 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v53 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Invalid version in '%s', %d != %d"), v6, __buf, 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
          v25 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Invalid magic number found in '%s'"), v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v25;

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Cluster snapshot file '%s' is too small"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
LABEL_40:
    close(v8);
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to open cluster cache file '%s'"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    buf.A = 138412290;
    *(_QWORD *)&buf.B = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v41 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
LABEL_41:
  if (a4)
    *a4 = objc_retainAutorelease(v13);

  return v18;
}

- (void)_removeVisionClusterCacheFilesNotReferencedByVisionClusterState:(id)a3
{
  id v4;
  NSURL *cacheDirUrl;
  id v6;
  void *v7;
  NSURL *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  cacheDirUrl = self->_cacheDirUrl;
  v30[1] = 0;
  v22 = v4;
  -[VCPClusterer _visionClusterMemmapFileInCacheDirectoryURL:clusterState:error:](self, "_visionClusterMemmapFileInCacheDirectoryURL:clusterState:error:", cacheDirUrl);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v6 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to get old vision cluster cache filenames from vision cluster state", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_cacheDirUrl;
  v30[0] = v6;
  v23 = v7;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 1, v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30[0];

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "pathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("cmap")) & 1) != 0)
        {
          objc_msgSend(v15, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v24, "containsObject:", v17);

          if ((v18 & 1) == 0)
          {
            v25 = v10;
            v19 = objc_msgSend(v23, "removeItemAtURL:error:", v15, &v25);
            v20 = v25;

            if ((v19 & 1) == 0
              && (int)MediaAnalysisLogLevel() >= 3
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v21;
              v33 = 2112;
              v34 = v20;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster mmap file at '%@' - %@", buf, 0x16u);

            }
            v10 = v20;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }

}

- (BOOL)_processingQueueRestoreFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD *v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30[1] = 0;
  v24 = a3;
  -[VCPClusterer _visionClusterStateDataBlobFromClusterSnapshotFileAtURL:error:](self, "_visionClusterStateDataBlobFromClusterSnapshotFileAtURL:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (!v5)
  {
    v15 = 0;
    goto LABEL_23;
  }
  v30[0] = 0;
  v29 = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v29);
  v8 = v29;

  if (v7)
  {
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLClusterState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusteringType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("CVMLClusteringAlgorithm_Greedy"));
    v13 = (_QWORD *)MEMORY[0x1E0CEE280];
    if (v12)
    {
      v14 = (id)*MEMORY[0x1E0CEE280];

      if (v9)
        goto LABEL_10;
    }
    else
    {
      v14 = v10;
      if (v9)
        goto LABEL_10;
    }
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VisionClusterState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    objc_msgSend(v7, "finishDecoding");
    if (v11)
    {
      if (!v9)
        goto LABEL_17;
    }
    else
    {
      v11 = (void *)-[NSNumber copy](self->_threshold, "copy");
      if (!v9)
      {
LABEL_17:
        v16 = 0;
        goto LABEL_18;
      }
    }
    if (objc_msgSend(v14, "isEqualToString:", *v13))
    {
      objc_msgSend(v24, "URLByDeletingLastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v8;
      v18 = v8;
      v19 = -[VCPClusterer _processingQueueRestoreClusteringCacheWithCacheDirectoryURL:clusterState:threshold:error:](self, "_processingQueueRestoreClusteringCacheWithCacheDirectoryURL:clusterState:threshold:error:", v17, v9, v11, &v28);
      v8 = v28;

      if (v19)
      {
        v26 = v8;
        v27 = 0;
        v20 = v8;
        v23 = -[VCPClusterer _processingQueueGetFaceClusterSequenceNumbersInClusterCache:lastClusterSequenceNumber:error:](self, "_processingQueueGetFaceClusterSequenceNumbersInClusterCache:lastClusterSequenceNumber:error:", &v27, v30, &v26);
        v16 = v27;
        v8 = v26;

        v21 = v23;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to restore Vision clustering state - %@", buf, 0xCu);
        }
        v16 = 0;
        v21 = 0;
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v14 = 0;
  v11 = 0;
  v16 = 0;
  v9 = 0;
LABEL_18:
  v21 = 0;
LABEL_19:

  v6 = v8;
  if (v21)
  {
    objc_storeStrong((id *)&self->_clusteringType, v14);
    objc_storeStrong((id *)&self->_threshold, v11);
    objc_storeStrong((id *)&self->_faceCSNsInClusterCache, v16);
    self->_nextSeqNum = v30[0] + 1;
    if (objc_msgSend(v9, "length"))
      -[VCPClusterer _removeVisionClusterCacheFilesNotReferencedByVisionClusterState:](self, "_removeVisionClusterCacheFilesNotReferencedByVisionClusterState:", v9);
  }

  v15 = v21;
LABEL_23:
  if (a4 && !v15)
    *a4 = objc_retainAutorelease(v6);

  return v15;
}

- (BOOL)_processingQueueRestoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  NSSet *faceCSNsInClusterCache;
  void *v10;
  id v11;
  const std::__fs::filesystem::path *v12;
  id v13;
  const std::__fs::filesystem::path *v14;
  std::error_code *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSURL *cacheFileUrl;
  BOOL v23;
  id v24;
  _BOOL4 v25;
  BOOL v26;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v6 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  faceCSNsInClusterCache = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = 0;

  _tempCacheFileUrlFromCacheFileUrl(self->_cacheFileUrl);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPClusterer _processingQueueRestoreFromClusterSnapshotFileAtURL:error:](self, "_processingQueueRestoreFromClusterSnapshotFileAtURL:error:", v10, 0))
  {
    objc_msgSend(v10, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const std::__fs::filesystem::path *)objc_msgSend(v11, "fileSystemRepresentation");
    -[NSURL path](self->_cacheFileUrl, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const std::__fs::filesystem::path *)objc_msgSend(v13, "fileSystemRepresentation");
    rename(v12, v14, v15);
    LODWORD(v12) = v16;

    if (!(_DWORD)v12)
    {
      v24 = 0;
      if (!v6)
      {
LABEL_20:
        v26 = 1;
        goto LABEL_21;
      }
LABEL_18:
      if (self->_clustererBringUpState >= 0x28)
        -[VCPClusterer _processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:visionClusters:cancelOrExtendTimeoutBlock:](self, "_processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:visionClusters:cancelOrExtendTimeoutBlock:", self->_faceCSNsInClusterCache, 0, v8);
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to rename file from '%@' to '%@'. Error = %d"), v10, self->_cacheFileUrl, *__error());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    cacheFileUrl = self->_cacheFileUrl;
    v29 = 0;
    v23 = -[VCPClusterer _processingQueueRestoreFromClusterSnapshotFileAtURL:error:](self, "_processingQueueRestoreFromClusterSnapshotFileAtURL:error:", cacheFileUrl, &v29);
    v21 = v29;
    v24 = v21;
    if (v23)
      goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Resetting cluster cache files - %@", buf, 0xCu);
  }
  v28 = v21;
  v25 = -[VCPClusterer _processingQueueResetClusterCache:](self, "_processingQueueResetClusterCache:", &v28);
  v24 = v28;

  if (v25)
  {
    -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 30);
LABEL_13:
    if (!v6)
      goto LABEL_20;
    goto LABEL_18;
  }
  -[VCPClusterer setClustererBringUpState:](self, "setClustererBringUpState:", 20);
  if (a5)
  {
    v24 = objc_retainAutorelease(v24);
    v26 = 0;
    *a5 = v24;
  }
  else
  {
    v26 = 0;
  }
LABEL_21:

  return v26;
}

- (unint64_t)restoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  id v8;
  double Current;
  NSObject *processingQueue;
  id v11;
  void *v12;
  void *v13;
  CFAbsoluteTime v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  VCPClusterer *v21;
  id v22;
  uint8_t *v23;
  BOOL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t v31[4];
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Started restoring cluster cache", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke;
  v20 = &unk_1E6B15A48;
  v21 = self;
  v24 = a3;
  v11 = v8;
  v22 = v11;
  v23 = buf;
  dispatch_sync(processingQueue, &v17);
  if (a5)
  {
    v12 = (void *)*((_QWORD *)v26 + 5);
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  -[VCPClusterer _recordClusterRebuildRequired:](self, "_recordClusterRebuildRequired:", -[VCPClusterer needsFullSync](self, "needsFullSync", v17, v18, v19, v20, v21));
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)v31 = 138412546;
    v32 = v13;
    v33 = 2048;
    v34 = v14 - Current;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Restored cluster cache. Clusterer bring-up state - %@, time to restore: %f secs", v31, 0x16u);

  }
  v15 = -[VCPClusterer clustererState](self, "clustererState");

  _Block_object_dispose(buf, 8);
  return v15;
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7[7];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = 0;
  v5 = objc_msgSend(v3, "_processingQueueRestoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", v2, v4, v7);
  v6 = v7[0];
  if ((v5 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to restore cluster cache - %@", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *processingQueue;
  _QWORD block[4];
  id v13;
  VCPClusterer *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[VCPClusterer needsFullSync](self, "needsFullSync"))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer needs a full sync"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else if (objc_msgSend(v6, "count"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__2;
    v21 = __Block_byref_object_dispose__2;
    v22 = 0;
    dispatch_group_enter((dispatch_group_t)self->_processingGroup);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__VCPClusterer_suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters_error___block_invoke;
    block[3] = &unk_1E6B15A70;
    v13 = v6;
    v14 = self;
    v15 = &v23;
    v16 = &v17;
    dispatch_sync(processingQueue, block);
    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
    a4 = (id *)(id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

void __107__VCPClusterer_suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E6B726E0, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 144);
  objc_msgSend(*(id *)(v7 + 48), "facePrimarySuggestionsThreshold");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v8, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", v2, v9, &obj);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 32));
}

- (id)requestSuggestionsForFaceClusterSequenceNumbers:(id)a3 withClusteringFlags:(id)a4 updateHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *processingGroup;
  NSObject *processingQueue;
  _QWORD v21[5];
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    if (!-[VCPClusterer needsFullSync](self, "needsFullSync"))
    {
      +[VCPSuggestionRequest requestWithFaceClusterIds:clusterFlags:updateHandler:](VCPSuggestionRequest, "requestWithFaceClusterIds:clusterFlags:updateHandler:", v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLock lock](self->_suggestionLock, "lock");
      -[NSMutableArray addObject:](self->_outstandingSuggestionRequests, "addObject:", v14);
      -[NSLock unlock](self->_suggestionLock, "unlock");
      processingQueue = self->_processingQueue;
      processingGroup = self->_processingGroup;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __104__VCPClusterer_requestSuggestionsForFaceClusterSequenceNumbers_withClusteringFlags_updateHandler_error___block_invoke;
      v21[3] = &unk_1E6B15468;
      v21[4] = self;
      dispatch_group_async(processingGroup, processingQueue, v21);
      objc_msgSend(v14, "requestId");
      a6 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (a6)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer is not ready"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      a6 = 0;
LABEL_9:

    }
  }
  else if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing updateHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  return a6;
}

void __104__VCPClusterer_requestSuggestionsForFaceClusterSequenceNumbers_withClusteringFlags_updateHandler_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "lock");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "unlock");
  v3 = objc_msgSend(*(id *)(a1 + 32), "needsFullSync");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (!v3)
  {
    if (!v4)
      goto LABEL_19;
    objc_msgSend(v4, "updateHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD))v11)[2](v11, CFSTR("VCPSuggestionUpdateStarted"), 0, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "canceller");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "wasSignalled");
    v13 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      objc_msgSend(*(id *)(v13 + 168), "updateHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD))v14)[2](v14, CFSTR("VCPSuggestionUpdateCancelled"), 0, 0);

      goto LABEL_18;
    }
    v15 = *(void **)(v13 + 144);
    objc_msgSend(*(id *)(v13 + 168), "clusterFlagByClusterId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "facePrimarySuggestionsThreshold");
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v29 = 0;
    objc_msgSend(v15, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", v16, v17, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;

    if (v19)
    {
      objc_msgSend(v19, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CEE2A8]))
      {
        v21 = objc_msgSend(v19, "code") == 1;

        if (v21)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "updateHandler");
          v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD))v22)[2](v22, CFSTR("VCPSuggestionUpdateCancelled"), 0, 0);
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {

      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer: Failed to get suggestions from Vision framework %@"), v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v25);
      v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "updateHandler");
      v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD))v26)[2](v26, CFSTR("VCPSuggestionUpdateFinished"), 0, v22);

      goto LABEL_17;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "updateHandler");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *, _QWORD))v22)[2](v22, CFSTR("VCPSuggestionUpdateFinished"), v18, 0);
    goto LABEL_17;
  }
  objc_msgSend(v4, "updateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "updateHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer needs a full sync"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, _QWORD, void *))v6)[2](v6, CFSTR("VCPSuggestionUpdateFinished"), 0, v10);

LABEL_18:
  }
LABEL_19:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "lock");
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 168);
  *(_QWORD *)(v27 + 168) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "unlock");
}

- (void)cancelSuggestionRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_suggestionLock, "lock");
  -[VCPSuggestionRequest requestId](self->_currentSuggestionRequest, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    -[VCPSuggestionRequest canceller](self->_currentSuggestionRequest, "canceller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signalCancellation");

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_outstandingSuggestionRequests;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v12);

          objc_msgSend(v10, "requestId", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if ((v15 & 1) != 0)
          {

            if (v10)
              -[NSMutableArray removeObject:](self->_outstandingSuggestionRequests, "removeObject:", v10);
            goto LABEL_15;
          }
          ++v12;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }

    }
    v10 = 0;
LABEL_15:

  }
  -[NSLock unlock](self->_suggestionLock, "unlock", (_QWORD)v16);

}

- (void)cancelAllSuggestionRequests
{
  VCPSuggestionRequest *currentSuggestionRequest;
  void *v4;

  -[NSLock lock](self->_suggestionLock, "lock");
  currentSuggestionRequest = self->_currentSuggestionRequest;
  if (currentSuggestionRequest)
  {
    -[VCPSuggestionRequest canceller](currentSuggestionRequest, "canceller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signalCancellation");

  }
  -[NSMutableArray removeAllObjects](self->_outstandingSuggestionRequests, "removeAllObjects");
  -[NSLock unlock](self->_suggestionLock, "unlock");
}

- (BOOL)isReadyToReturnSuggestions
{
  unint64_t v2;

  v2 = -[VCPClusterer clustererBringUpState](self, "clustererBringUpState");
  return v2 != 60 && v2 != 70 && v2 != 80;
}

- (id)_resolveConflictingL0ClustersFromVNClusters:(id)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  VCPClusterer *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke;
  v18[3] = &unk_1E6B15AC0;
  v12 = v9;
  v22 = v12;
  v13 = v10;
  v19 = v13;
  v20 = self;
  v14 = v11;
  v21 = v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
  if (a4)
    *a4 = objc_retainAutorelease(v14);
  v15 = v21;
  v16 = v13;

  return v16;
}

void __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
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
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "clusterId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      if (objc_msgSend(v9, "count") == 1)
      {
        v10 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:", objc_msgSend(v6, "clusterId"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v8;
          v32 = 2048;
          v33 = objc_msgSend(v9, "count");
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Checking l1-cluster %@ (%ld faces) for conflict", buf, 0x16u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "identifyConflictingL0Clusters:csnToRejectedPersonForNewlyClusteredFaces:csnToConfirmedPersonForNewlyClusteredFaces:", v12, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "clusterId"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
          v20 = MEMORY[0x1E0C809B0];
          v21 = 3221225472;
          v22 = __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_364;
          v23 = &unk_1E6B15A98;
          v24 = v8;
          v25 = v12;
          v26 = *(id *)(a1 + 32);
          v27 = *(id *)(a1 + 48);
          v28 = v6;
          v18 = v14;
          v29 = v18;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v20);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v18, v20, v21, v22, v23);

        }
        else
        {
          v19 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v18);
        }

      }
    }

  }
}

void __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_364(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VisionFgMapping] Resolving conflict l0-cluster %@ in l1-cluster %@", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "clusterId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  objc_msgSend(*(id *)(a1 + 72), "minusSet:", v6);

}

- (BOOL)_processingQueueGetVisionClusters:(id)a3 minimumClusterSize:(unint64_t)a4 returnClusterAsCountedSet:(BOOL)a5 excludedL0ClustersByL1ClusterId:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  VNClustererBuilder *clusterBuilder;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  unint64_t v23;
  BOOL v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  clusterBuilder = self->_clusterBuilder;
  v25 = 0;
  -[VNClustererBuilder l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:error:](clusterBuilder, "l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:error:", 0, &v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v25;
  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to get Vision clusters - %@", buf, 0xCu);
    }
    *a8 = objc_retainAutorelease(v18);
  }
  else
  {
    -[VCPClusterer _resolveConflictingL0ClustersFromVNClusters:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:](self, "_resolveConflictingL0ClustersFromVNClusters:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:", v17, a6, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __160__VCPClusterer__processingQueueGetVisionClusters_minimumClusterSize_returnClusterAsCountedSet_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock_error___block_invoke;
    v21[3] = &unk_1E6B15AE8;
    v23 = a4;
    v22 = v14;
    v24 = a5;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v21);

  }
  return v18 == 0;
}

void __160__VCPClusterer__processingQueueGetVisionClusters_minimumClusterSize_returnClusterAsCountedSet_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((unint64_t)objc_msgSend(v6, "count") >= *(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "setWithSet:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v6;
    }
    objc_msgSend(v3, "addObject:", v5);
    if (v4)

  }
}

- (id)differencesBetweenClusterCacheAndLibrary:(id *)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8;
  NSObject *processingQueue;
  uint64_t v10;
  id v11;
  void *v12;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  id *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id obj;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  id *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke;
  block[3] = &unk_1E6B15B10;
  v28 = &v32;
  v29 = &v42;
  block[4] = self;
  v31 = a4;
  v11 = v8;
  v27 = v11;
  v30 = &v36;
  dispatch_sync(processingQueue, block);
  if (*((_BYTE *)v33 + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Retrieving clusters in library ...", buf, 2u);
    }
    v12 = (void *)v37[5];
    v37[5] = 0;

    persistenceDelegate = self->_persistenceDelegate;
    v14 = (id *)(v37 + 5);
    obj = (id)v37[5];
    -[VCPPhotosPersistenceDelegate groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:error:](persistenceDelegate, "groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:error:", 1, &obj);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v14, obj);
    if (v37[5])
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = v37[5];
        *(_DWORD *)buf = 138412290;
        v49 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters in library - %@", buf, 0xCu);
      }
      v17 = 0;
      if (a3)
        *a3 = objc_retainAutorelease((id)v37[5]);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Comparing clusters", buf, 2u);
      }
      v19 = (void *)v43[5];
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_2;
      v23[3] = &unk_1E6B15B78;
      v24 = &__block_literal_global_369;
      objc_msgSend(v19, "sortUsingComparator:", v23);
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_3;
      v21[3] = &unk_1E6B159A8;
      v22 = &__block_literal_global_369;
      objc_msgSend(v15, "sortUsingComparator:", v21);
      VCPCompareLibraryClustersWithVisionClusters(v15, (void *)v43[5]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = v37[5];
      *(_DWORD *)buf = 138412290;
      v49 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters in cluster cache - %@", buf, 0xCu);
    }
    v17 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v37[5]);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v17;
}

void __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;
  uint8_t buf[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Retrieving clusters in cluster cache ...", buf, 2u);
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v3 = a1[9];
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "_processingQueueGetVisionClusters:minimumClusterSize:returnClusterAsCountedSet:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:error:", v2, 1, 1, v3, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 32));
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_367(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "count");
  v6 = objc_msgSend(v4, "count");
  if (v5 > v6)
    v7 = -1;
  else
    v7 = v5 < v6;

  return v7;
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)removeClusteringStateCacheWithURL:(id)a3 error:(id *)a4
{
  NSURL *v4;
  NSURL *v5;
  void *v6;
  int v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  char v25;
  id v26;
  void *v27;
  BOOL v28;
  void *v30;
  void *v31;
  NSURL *v33;
  NSURL *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (NSURL *)a3;
  v34 = v4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _cacheFileUrlFromDirectoryUrl(v4);
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    if (v5
      && (-[NSURL path](v5, "path"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v35, "fileExistsAtPath:", v6),
          v6,
          v7))
    {
      v42 = 0;
      v8 = objc_msgSend(v35, "removeItemAtURL:error:", v33, &v42);
      v9 = v42;
      if ((v8 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](v33, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v10;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster snapshot at '%@': %@", buf, 0x16u);

      }
    }
    else
    {
      v9 = 0;
    }
    _tempCacheFileUrlFromCacheFileUrl(v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v11;
    if (v11
      && (objc_msgSend(v11, "path"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v35, "fileExistsAtPath:", v12),
          v12,
          v13))
    {
      v41 = v9;
      v14 = objc_msgSend(v35, "removeItemAtURL:error:", v31, &v41);
      v15 = v41;

      if ((v14 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](v33, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v16;
        v46 = 2112;
        v47 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster snapshot at '%@': %@", buf, 0x16u);

      }
    }
    else
    {
      v15 = v9;
    }
    objc_msgSend(v35, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v34, 0, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    if (v17)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v22, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("cmap"));

            if (v24)
            {
              v36 = v15;
              v25 = objc_msgSend(v35, "removeItemAtURL:error:", v22, &v36);
              v26 = v36;

              if ((v25 & 1) == 0
                && (int)MediaAnalysisLogLevel() >= 3
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v22, "path");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v45 = v27;
                v46 = 2112;
                v47 = v26;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster mmap file at '%@': %@", buf, 0x16u);

              }
              v15 = v26;
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v19);
      }

    }
    v28 = v15 == 0;
    if (a4 && v15)
    {
      v15 = objc_retainAutorelease(v15);
      v28 = 0;
      *a4 = v15;
    }
  }
  else
  {
    v15 = 0;
    v28 = 1;
  }

  return v28;
}

- (BOOL)getClusters:(id *)a3 threshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  id v11;
  NSObject *processingQueue;
  id v13;
  uint64_t *v14;
  id v15;
  char v16;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;

  v11 = a6;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__VCPClusterer_getClusters_threshold_utilizingGPU_cancelOrExtendTimeoutBlock_error___block_invoke;
  block[3] = &unk_1E6B15BA0;
  v21 = &v25;
  v22 = &v35;
  block[4] = self;
  v13 = v11;
  v20 = v13;
  v23 = &v29;
  v24 = &v41;
  dispatch_sync(processingQueue, block);
  v14 = v26;
  if (*((_BYTE *)v26 + 24))
  {
    if (a4)
      *a4 = v42[3];
    if (a3)
      *a3 = objc_retainAutorelease((id)v36[5]);
    if (a5)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CEE018]);
      objc_msgSend(v15, "setPreferBackgroundProcessing:", 1);
      objc_msgSend(v15, "setMetalContextPriority:", 1);
      *a5 = objc_msgSend(v15, "usesCPUOnly") ^ 1;

    }
    goto LABEL_10;
  }
  if (a7)
  {
    *a7 = objc_retainAutorelease((id)v30[5]);
LABEL_10:
    v14 = v26;
  }
  v16 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v16;
}

void __84__VCPClusterer_getClusters_threshold_utilizingGPU_cancelOrExtendTimeoutBlock_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id obj;

  v2 = a1[8];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "_processingQueueGetVisionClusters:minimumClusterSize:returnClusterAsCountedSet:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:error:", v3, 1, 0, 0, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(*(id *)(a1[4] + 80), "doubleValue");
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 32));
}

- (id)_propertyDictionaryFileURL
{
  return -[NSURL URLByAppendingPathComponent:](self->_cacheDirUrl, "URLByAppendingPathComponent:", CFSTR("clustererState.plist"));
}

- (void)_readPropertyDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *propertyDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDate *v16;
  NSDate *timestampOfLastClusterComparison;
  id v18;

  -[VCPClusterer _propertyDictionaryFileURL](self, "_propertyDictionaryFileURL");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v18);
  propertyDictionary = self->_propertyDictionary;
  self->_propertyDictionary = v3;

  v5 = self->_propertyDictionary;
  if (!v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_propertyDictionary;
    self->_propertyDictionary = v6;

    v5 = self->_propertyDictionary;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("VCPClustererBringUpState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntegerValue");
    v11 = 40;
    if (v10 <= 0x32)
      v11 = v10;
    self->_clustererBringUpState = v11;
  }
  else
  {
    self->_clustererBringUpState = 40;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPClusterer _setPropertyDictionaryValue:forKey:](self, "_setPropertyDictionaryValue:forKey:", v12, CFSTR("VCPClustererBringUpState"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyDictionary, "objectForKeyedSubscript:", CFSTR("VCPClusterCompareTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timestampOfLastClusterComparison = self->_timestampOfLastClusterComparison;
    self->_timestampOfLastClusterComparison = v16;

  }
}

- (void)_setPropertyDictionaryValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSLock lock](self->_propertyDictionaryLock, "lock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyDictionary, "setObject:forKeyedSubscript:", v8, v6);
  -[VCPClusterer _propertyDictionaryFileURL](self, "_propertyDictionaryFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary writeToURL:atomically:](self->_propertyDictionary, "writeToURL:atomically:", v7, 0);
  -[NSLock unlock](self->_propertyDictionaryLock, "unlock");

}

- (id)_bringUpStateDescription:(unint64_t)a3
{
  if ((uint64_t)a3 > 49)
  {
    if ((uint64_t)a3 <= 69)
    {
      if (a3 == 50)
        return CFSTR("ready");
      if (a3 == 60)
        return CFSTR("clustering");
    }
    else
    {
      switch(a3)
      {
        case 'F':
          return CFSTR("have unsaved cluster cache");
        case 'P':
          return CFSTR("saving cluster cache");
        case 'Z':
          return CFSTR("have new cluster cache");
      }
    }
  }
  else if ((uint64_t)a3 <= 19)
  {
    if (!a3)
      return CFSTR("need full sync");
    if (a3 == 10)
      return CFSTR("need to compare clusters");
  }
  else
  {
    switch(a3)
    {
      case 0x14uLL:
        return CFSTR("need to reset cluster cache");
      case 0x1EuLL:
        return CFSTR("need to reset library clusters");
      case 0x28uLL:
        return CFSTR("need update");
    }
  }
  return CFSTR("unknown (error)");
}

- (void)setClustererBringUpState:(unint64_t)a3
{
  unint64_t clustererBringUpState;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  clustererBringUpState = self->_clustererBringUpState;
  if (clustererBringUpState != a3)
  {
    self->_clustererBringUpState = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPClusterer _setPropertyDictionaryValue:forKey:](self, "_setPropertyDictionaryValue:forKey:", v6, CFSTR("VCPClustererBringUpState"));

    if (a3 == 40)
      -[VCPClusterer _recordClusterRebuildRequired:](self, "_recordClusterRebuildRequired:", 0);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", clustererBringUpState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPClusterer _bringUpStateDescription:](self, "_bringUpStateDescription:", self->_clustererBringUpState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPClusterer: Bring-up state transition: %@ -> %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (unint64_t)clustererState
{
  if (-[VCPClusterer needsFullSync](self, "needsFullSync"))
    return 10;
  if (-[VCPClusterer needsUpdate](self, "needsUpdate"))
    return 20;
  if (self->_accumulatedChangesCount)
    return 30;
  if (-[VCPClusterer isReady](self, "isReady"))
    return 40;
  return 0;
}

- (BOOL)isReady
{
  return self->_clustererBringUpState == 50;
}

- (BOOL)needsFullSync
{
  return (self->_clustererBringUpState < 0x1F) & (0x40100401u >> self->_clustererBringUpState);
}

- (BOOL)needsUpdate
{
  return self->_clustererBringUpState == 40;
}

- (id)level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:(unint64_t)a3 error:(id *)a4
{
  VNClustererBuilder *clusterBuilder;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  clusterBuilder = self->_clusterBuilder;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNClustererBuilder clusteredFaceIdsForClusterContainingFaceId:error:](clusterBuilder, "clusteredFaceIdsForClusterContainingFaceId:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "firstObject", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)distanceBetweenLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a3 andLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a4 error:(id *)a5
{
  VNClustererBuilder *clusterBuilder;
  void *v8;
  void *v9;
  void *v10;

  clusterBuilder = self->_clusterBuilder;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNClustererBuilder distanceBetweenClustersWithFaceId:andFaceId:error:](clusterBuilder, "distanceBetweenClustersWithFaceId:andFaceId:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)distancesFromClustersIdentifiedByFaceCSNs:(id)a3 toClustersIdentifiedByFaceCSNs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *processingQueue;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__VCPClusterer_distancesFromClustersIdentifiedByFaceCSNs_toClustersIdentifiedByFaceCSNs_error___block_invoke;
  block[3] = &unk_1E6B15BC8;
  block[4] = self;
  v19 = &v27;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v20 = &v21;
  dispatch_sync(processingQueue, block);
  if (a5)
  {
    v13 = (void *)v22[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __95__VCPClusterer_distancesFromClustersIdentifiedByFaceCSNs_toClustersIdentifiedByFaceCSNs_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "needsFullSync"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    v3 = *(_QWORD *)(a1 + 48);
    v16[0] = *(_QWORD *)(a1 + 40);
    v16[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v5 + 40);
    objc_msgSend(v2, "distanceBetweenLevel1Clusters:error:", v4, &obj);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v5 + 40), obj);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer is not ready"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)clustererBringUpState
{
  return self->_clustererBringUpState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampOfLastClusterComparison, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_propertyDictionaryLock, 0);
  objc_storeStrong((id *)&self->_currentStatusSnapshotLock, 0);
  objc_storeStrong((id *)&self->_suggestionLock, 0);
  objc_storeStrong((id *)&self->_currentSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_outstandingSuggestionRequests, 0);
  objc_storeStrong((id *)&self->_clusterBuilder, 0);
  objc_storeStrong((id *)&self->_visionCanceler, 0);
  objc_storeStrong((id *)&self->_faceCSNsToRemove, 0);
  objc_storeStrong((id *)&self->_faceIdStrsToAdd, 0);
  objc_storeStrong((id *)&self->_faceCSNsInClusterCache, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_clusteringType, 0);
  objc_storeStrong((id *)&self->_cacheFileUrl, 0);
  objc_storeStrong((id *)&self->_cacheDirUrl, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v2 = 136315138;
  v3 = v1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "VCPClusterer: Failed to restore cluster cache with std::exception %s", (uint8_t *)&v2, 0xCu);
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "VCPClusterer: Failed to restore cluster cache", v0, 2u);
}

@end
