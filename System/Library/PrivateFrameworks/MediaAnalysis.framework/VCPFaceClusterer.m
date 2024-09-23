@implementation VCPFaceClusterer

- (VCPFaceClusterer)initWithPhotoLibrary:(id)a3 context:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPFaceClusterer *v12;
  VCPFaceClusterer *v13;
  VCPClusterer *v14;
  VCPClusterer *clusterer;
  void *v16;
  id cancelOrExtendTimeoutBlock;
  VCPClusterer *v18;
  id v19;
  uint64_t v20;
  id v21;
  VCPFaceClusterer *v22;
  VCPFaceClusterer *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)VCPFaceClusterer;
  v12 = -[VCPFaceClusterer init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v14 = -[VCPClusterer initWithPhotoLibrary:andContext:]([VCPClusterer alloc], "initWithPhotoLibrary:andContext:", v13->_photoLibrary, v13->_context);
    clusterer = v13->_clusterer;
    v13->_clusterer = v14;

    v16 = _Block_copy(v11);
    cancelOrExtendTimeoutBlock = v13->_cancelOrExtendTimeoutBlock;
    v13->_cancelOrExtendTimeoutBlock = v16;

    v18 = v13->_clusterer;
    v19 = v13->_cancelOrExtendTimeoutBlock;
    v25 = 0;
    v20 = -[VCPClusterer restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:](v18, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", 1, v19, &v25);
    v21 = v25;
    if (v20)
    {
      v22 = v13;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v22 = v13;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v28 = v20;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPFaceClusterer] Restored Face Clusterer with ClusterState = %ld", buf, 0xCu);
          v22 = v13;
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPFaceClusterer] Failed to restore clusterer (state unknown) - %@", buf, 0xCu);
      }
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  return v23;
}

- (void)scheduleClusteringOfFacesWithLocalIdentifiers:(id)a3
{
  -[VCPClusterer scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:](self->_clusterer, "scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:", 0, a3);
}

- (void)scheduleUnclusteringOfFacesWithClusterSequenceNumbers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

LABEL_14:
  -[VCPClusterer scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:](self->_clusterer, "scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:", v6, 0, (_QWORD)v11);

}

- (unint64_t)numberOfFacesPendingClustering
{
  return -[VCPClusterer numberOfAccumulatedClusterChanges](self->_clusterer, "numberOfAccumulatedClusterChanges");
}

- (BOOL)resetFaceClusteringState:(id *)a3
{
  VCPClusterer *clusterer;
  VCPClusterer *v6;
  void *v7;
  BOOL v8;
  VCPClusterer *v9;
  VCPClusterer *v10;
  VCPClusterer *v11;
  id cancelOrExtendTimeoutBlock;
  uint64_t v13;
  id v14;
  NSObject *v15;
  const char *v16;
  os_log_type_t v17;
  uint32_t v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  clusterer = self->_clusterer;
  if (clusterer)
  {
    -[VCPClusterer terminate](self->_clusterer, "terminate");
    v6 = self->_clusterer;
    self->_clusterer = 0;

  }
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[VCPClusterer removeClusteringStateCacheWithURL:error:](VCPClusterer, "removeClusteringStateCacheWithURL:error:", v7, a3);
  if (clusterer)
  {
    v9 = -[VCPClusterer initWithPhotoLibrary:andContext:]([VCPClusterer alloc], "initWithPhotoLibrary:andContext:", self->_photoLibrary, self->_context);
    v10 = self->_clusterer;
    self->_clusterer = v9;

    v11 = self->_clusterer;
    cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
    v20 = 0;
    v13 = -[VCPClusterer restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:](v11, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", 1, cancelOrExtendTimeoutBlock, &v20);
    v14 = v20;
    if (v14 || !v13)
    {
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 134218242;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v15 = MEMORY[0x1E0C81028];
      v16 = "Reset restore clusterer error (ClusterState = %ld): %@";
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 22;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)buf = 134217984;
      v22 = v13;
      v15 = MEMORY[0x1E0C81028];
      v16 = "Reset restored clusterer, ClusterState = %ld";
      v17 = OS_LOG_TYPE_INFO;
      v18 = 12;
    }
    _os_log_impl(&dword_1B6C4A000, v15, v17, v16, buf, v18);
LABEL_13:

  }
  return v8;
}

- (BOOL)getFaceClusters:(id *)a3 clusteringThreshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  id v12;
  VCPClusterer *clusterer;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  clusterer = self->_clusterer;
  if (clusterer)
  {
    LOBYTE(a7) = -[VCPClusterer getClusters:threshold:utilizingGPU:cancelOrExtendTimeoutBlock:error:](clusterer, "getClusters:threshold:utilizingGPU:cancelOrExtendTimeoutBlock:error:", a3, a4, a5, v12, a7);
  }
  else if (a7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clusterer is not available"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (unint64_t)clustererState
{
  return -[VCPClusterer clustererState](self->_clusterer, "clustererState");
}

- (BOOL)clustererIsReadyToReturnSuggestions
{
  return -[VCPClusterer isReadyToReturnSuggestions](self->_clusterer, "isReadyToReturnSuggestions");
}

- (id)clusterer
{
  return self->_clusterer;
}

- (BOOL)_resetFaceClusteringState:(id *)a3
{
  VCPClusterer *clusterer;
  VCPClusterer *v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  char v11;
  VCPClusterer *v12;
  VCPClusterer *v13;
  VCPClusterer *v14;
  id cancelOrExtendTimeoutBlock;
  id v17;
  id v18;

  clusterer = self->_clusterer;
  if (clusterer)
  {
    -[VCPClusterer terminate](self->_clusterer, "terminate");
    v6 = self->_clusterer;
    self->_clusterer = 0;

  }
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = +[VCPClusterer removeClusteringStateCacheWithURL:error:](VCPClusterer, "removeClusteringStateCacheWithURL:error:", v7, &v18);
  v9 = v18;
  v10 = v9;
  if (a3)
    v11 = v8;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
    *a3 = objc_retainAutorelease(v9);
  if (clusterer)
  {
    v12 = -[VCPClusterer initWithPhotoLibrary:andContext:]([VCPClusterer alloc], "initWithPhotoLibrary:andContext:", self->_photoLibrary, self->_context);
    v13 = self->_clusterer;
    self->_clusterer = v12;

    v14 = self->_clusterer;
    cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
    v17 = 0;
    -[VCPClusterer restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:](v14, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", 1, cancelOrExtendTimeoutBlock, &v17);
    v10 = v17;
    v8 = v10 == 0;
  }

  return v8;
}

- (BOOL)reclusterFacesWithThreshold:(id)a3 shouldRecluster:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  float v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v29[8];
  uint64_t v30;
  _QWORD v31[2];

  v6 = a4;
  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "floatValue");
  if (v10 < 1.0 && v10 > 0.1)
  {
    -[VCPPhotosFaceProcessingContext setFaceClusteringThreshold:](self->_context, "setFaceClusteringThreshold:");
LABEL_5:
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Reset Face Clustering", v29, 2u);
    }
    v11 = mach_absolute_time();
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPFaceProcessingResetFaceClusteringState", ", v29, 2u);
    }

    LODWORD(a5) = -[VCPFaceClusterer resetFaceClusteringState:](self, "resetFaceClusteringState:", a5);
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v13, "VCPFaceProcessingResetFaceClusteringState", ", v29, 2u);
    }

    if (v11)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Reset Face Clustering Done", v29, 2u);
    }
    if ((a5 & v6) == 1)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Face Clustering", v29, 2u);
      }
      v18 = mach_absolute_time();
      VCPSignPostLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_signpost_id_generate(v19);

      VCPSignPostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPFaceProcessingPerformFaceClusteringAndWait", ", v29, 2u);
      }

      -[VCPFaceClusterer clusterFaces](self, "clusterFaces");
      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v20, "VCPFaceProcessingPerformFaceClusteringAndWait", ", v29, 2u);
      }

      if (v18)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Face Clustering Done", v29, 2u);
      }
      LOBYTE(a5) = 1;
    }
    goto LABEL_37;
  }
  if (a5)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face clustering threshold should be in the range: [0.1, 1.0]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
LABEL_37:

  return (char)a5;
}

- (int)clusterFaces
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFaceProcessingClusterFaces", ", (uint8_t *)&v15, 2u);
  }

  v7 = -[VCPClusterer clustererState](self->_clusterer, "clustererState");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPClusterer status](self->_clusterer, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Start face clustering (%ld) with clustering status: %@", (uint8_t *)&v15, 0x16u);

  }
  -[VCPClusterer clusterAndWaitWithCancelOrExtendTimeoutBlock:](self->_clusterer, "clusterAndWaitWithCancelOrExtendTimeoutBlock:", self->_cancelOrExtendTimeoutBlock);
  v9 = -[VCPClusterer clustererState](self->_clusterer, "clustererState");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPClusterer status](self->_clusterer, "status");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Finished face clustering (%ld) with clustering status: %@", (uint8_t *)&v15, 0x16u);

  }
  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_END, v4, "VCPFaceProcessingClusterFaces", ", (uint8_t *)&v15, 2u);
  }

  if (v9 == 30 || v9 == 40)
    return 0;
  else
    return -18;
}

- (int)clusterFacesIfNecessary
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFaceProcessingClusterFacesIfNecessary", ", (uint8_t *)&v15, 2u);
  }

  v7 = -[VCPClusterer clustererState](self->_clusterer, "clustererState");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPClusterer status](self->_clusterer, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Start face clustering as need (%ld) with clustering status: %@", (uint8_t *)&v15, 0x16u);

  }
  -[VCPClusterer clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:](self->_clusterer, "clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:", self->_cancelOrExtendTimeoutBlock);
  v9 = -[VCPClusterer clustererState](self->_clusterer, "clustererState");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPClusterer status](self->_clusterer, "status");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Finished face clustering (%ld) with clustering status: %@", (uint8_t *)&v15, 0x16u);

  }
  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_END, v4, "VCPFaceProcessingClusterFacesIfNecessary", ", (uint8_t *)&v15, 2u);
  }

  if (v9 == 30 || v9 == 40)
    return 0;
  else
    return -18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelOrExtendTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
