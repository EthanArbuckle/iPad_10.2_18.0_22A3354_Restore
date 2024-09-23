@implementation VCPPersonBuilder

- (VCPPersonBuilder)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4 andContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPPersonBuilder *v12;
  VCPPersonBuilder *v13;
  VCPPhotosPersistenceDelegate *v14;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPPersonBuilder;
  v12 = -[VCPPersonBuilder init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_faceClusterer, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v14 = -[VCPPhotosPersistenceDelegate initWithPhotoLibrary:]([VCPPhotosPersistenceDelegate alloc], "initWithPhotoLibrary:", v13->_photoLibrary);
    persistenceDelegate = v13->_persistenceDelegate;
    v13->_persistenceDelegate = v14;

    v13->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = 0;
    v13->_personBuilderMergeCandidatesEnabled = 0;
    -[VCPPersonBuilder _readFaceAnalysisState](v13, "_readFaceAnalysisState");
  }

  return v13;
}

- (void)_readFaceAnalysisState
{
  id v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *state;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PHPhotoLibrary vcp_faceAnalysisStateFilepath](self->_photoLibrary, "vcp_faceAnalysisStateFilepath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v3, "initWithContentsOfFile:", v4);
  state = self->_state;
  self->_state = v5;

  v7 = self->_state;
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("PersonBuilderMergeCandidatesEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_personBuilderMergeCandidatesEnabled = objc_msgSend(v8, "BOOLValue");

    -[NSMutableDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", CFSTR("PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = objc_msgSend(v12, "unsignedIntegerValue");

    }
    else
    {
      self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = 0;
    }
  }
  else
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_state;
    self->_state = v10;

  }
}

- (void)_setFaceAnalysisStateValue:(id)a3 forKey:(id)a4
{
  id v6;
  VCPPersonBuilder *v7;
  NSMutableDictionary *state;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_state, "setObject:forKeyedSubscript:", v10, v6);
  state = v7->_state;
  -[PHPhotoLibrary vcp_faceAnalysisStateFilepath](v7->_photoLibrary, "vcp_faceAnalysisStateFilepath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary writeToFile:atomically:](state, "writeToFile:atomically:", v9, 0);

  objc_sync_exit(v7);
}

- (void)setPersonBuilderMergeCandidatesEnabled:(BOOL)a3
{
  id v4;

  if (self->_personBuilderMergeCandidatesEnabled != a3)
  {
    self->_personBuilderMergeCandidatesEnabled = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[VCPPersonBuilder _setFaceAnalysisStateValue:forKey:](self, "_setFaceAnalysisStateValue:forKey:", v4, CFSTR("PersonBuilderMergeCandidatesEnabled"));

  }
}

- (void)setLastMinimumFaceGroupSizeForCreatingMergeCandidate:(unint64_t)a3
{
  id v4;

  if (self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates != a3)
  {
    self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[VCPPersonBuilder _setFaceAnalysisStateValue:forKey:](self, "_setFaceAnalysisStateValue:forKey:", v4, CFSTR("PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"));

  }
}

- (BOOL)_setAllFaceGroupsNeedPersonBuilding
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  PHPhotoLibrary *photoLibrary;
  id v8;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CD1578]);
  objc_msgSend(v3, "setPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v3, "setChunkSizeForFetch:", 500);
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personBuilderState != %lu"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    photoLibrary = self->_photoLibrary;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__VCPPersonBuilder__setAllFaceGroupsNeedPersonBuilding__block_invoke;
    v11[3] = &unk_1E6B15440;
    v12 = v6;
    v10 = 0;
    v4 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v11, &v10);
    v8 = v10;
    if ((v4 & 1) == 0
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error resetting all FaceGroups Person Builder state: %@", buf, 0xCu);
    }

  }
  return v4;
}

unint64_t __55__VCPPersonBuilder__setAllFaceGroupsNeedPersonBuilding__block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v4 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPersonBuilderState:", 1);

      objc_autoreleasePoolPop(v4);
      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
  }
  return result;
}

- (BOOL)performPersonBuildingWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  float v18;
  void *v19;
  VCPPhotosPersistenceDelegate *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  VCPPhotosPersistenceDelegate *v27;
  BOOL v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  _QWORD aBlock[5];
  id v35;
  uint8_t v36[4];
  id v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates >= 0xF)
  {
    v14 = 0;
  }
  else
  {
    v7 = mach_absolute_time();
    VCPSignPostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);

    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPFaceProcessingCleanupMergeCandidates", ", (uint8_t *)&buf, 2u);
    }

    persistenceDelegate = self->_persistenceDelegate;
    v35 = 0;
    v13 = -[VCPPhotosPersistenceDelegate cleanupMergeCandidatesWithMinimumFaceGroupSize:cancelOrExtendTimeoutBlock:error:](persistenceDelegate, "cleanupMergeCandidatesWithMinimumFaceGroupSize:cancelOrExtendTimeoutBlock:error:", 15, v6, &v35);
    v14 = v35;
    if (v13)
    {
      -[VCPPersonBuilder setLastMinimumFaceGroupSizeForCreatingMergeCandidate:](self, "setLastMinimumFaceGroupSizeForCreatingMergeCandidate:", 15);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to clean up merge candidates. Error: %@", (uint8_t *)&buf, 0xCu);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v14);
    }
    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v9, "VCPFaceProcessingCleanupMergeCandidates", ", (uint8_t *)&buf, 2u);
    }

    if (v7)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }
  if (self->_personBuilderMergeCandidatesEnabled)
  {
    v17 = !self->_personBuilderMergeCandidatesEnabled;
  }
  else
  {
    -[PHPhotoLibrary pn_faceProcessingProgress](self->_photoLibrary, "pn_faceProcessingProgress");
    if (v18 >= 0.9
      && -[VCPPersonBuilder _setAllFaceGroupsNeedPersonBuilding](self, "_setAllFaceGroupsNeedPersonBuilding"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "->->-> Enabling personBuilderMergeCandidates", (uint8_t *)&buf, 2u);
      }
      -[VCPPersonBuilder setPersonBuilderMergeCandidatesEnabled:](self, "setPersonBuilderMergeCandidatesEnabled:", 1);
      v17 = 0;
    }
    else
    {
      v17 = 1;
    }
  }
  -[VCPPhotosPersistenceDelegate setPersonBuilderMergeCandidatesDisabled:](self->_persistenceDelegate, "setPersonBuilderMergeCandidatesDisabled:", v17);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__37;
  v41 = __Block_byref_object_dispose__37;
  v42 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VCPPersonBuilder_performPersonBuildingWithCancelOrExtendTimeoutBlock_error___block_invoke;
  aBlock[3] = &unk_1E6B19B30;
  aBlock[4] = &buf;
  v19 = _Block_copy(aBlock);
  v20 = self->_persistenceDelegate;
  -[VCPFaceClusterer clusterer](self->_faceClusterer, "clusterer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPhotosPersistenceDelegate buildPersonWithFaceClusterer:keyFaceUpdateBlock:context:cancelOrExtendTimeoutBlock:](v20, "buildPersonWithFaceClusterer:keyFaceUpdateBlock:context:cancelOrExtendTimeoutBlock:", v21, v19, self->_context, v6);

  v22 = mach_absolute_time();
  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);

  VCPSignPostLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPPersonBuilder_UpdateKeyface", ", v36, 2u);
  }

  v27 = self->_persistenceDelegate;
  v33 = v14;
  v28 = -[VCPPhotosPersistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:](v27, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:", MEMORY[0x1E0C9AA60], 0, v6, &v33);
  v29 = v33;

  if (!v28)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v36 = 138412290;
      v37 = v29;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to update key faces - %@", v36, 0xCu);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v29);
  }
  VCPSignPostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_END, v24, "VCPPersonBuilder_UpdateKeyface", ", v36, 2u);
  }

  if (v22)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }

  _Block_object_dispose(&buf, 8);
  return 1;
}

void __78__VCPPersonBuilder_performPersonBuildingWithCancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
