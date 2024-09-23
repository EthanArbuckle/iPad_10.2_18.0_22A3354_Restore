@implementation VCPVideoStabilizationAssetProcessingTask

- (VCPVideoStabilizationAssetProcessingTask)initWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPVideoStabilizationAssetProcessingTask *v12;
  VCPVideoStabilizationAssetProcessingTask *v13;
  const void *v14;
  void *v15;
  id completionHandler;
  void *v17;
  uint64_t v18;
  PHPhotoLibrary *photoLibrary;
  uint64_t v20;
  VCPDatabaseReader *database;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  VCPVideoStabilizationAssetProcessingTask *v29;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VCPVideoStabilizationAssetProcessingTask;
  v12 = -[VCPVideoStabilizationAssetProcessingTask init](&v31, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_15:
    v29 = v13;
    goto LABEL_16;
  }
  if (v11)
    v14 = v11;
  else
    v14 = &__block_literal_global_54;
  v15 = _Block_copy(v14);
  completionHandler = v12->_completionHandler;
  v12->_completionHandler = v15;

  if (objc_msgSend(v9, "count"))
  {
    objc_storeStrong((id *)&v12->_assets, a3);
    -[NSArray objectAtIndexedSubscript:](v12->_assets, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoLibrary");
    v18 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v13->_photoLibrary;
    v13->_photoLibrary = (PHPhotoLibrary *)v18;

    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v13->_photoLibrary);
    v20 = objc_claimAutoreleasedReturnValue();
    database = v13->_database;
    v13->_database = (VCPDatabaseReader *)v20;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AllowOnDemandPixel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_onDemandPixel = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AllowOnDemandGyro"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_onDemandGyro = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v10, "objectForKeyedSubscript:", VCPVideoStabilizationProcessing_GyroKey);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24
      && (objc_msgSend(v10, "objectForKeyedSubscript:", VCPVideoStabilizationProcessing_PixelKey),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v24,
          !v25))
    {
      v28 = 0x10000000;
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", VCPVideoStabilizationProcessing_PixelKey);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        && (objc_msgSend(v10, "objectForKeyedSubscript:", VCPVideoStabilizationProcessing_GyroKey),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v27,
            v26,
            !v27))
      {
        v28 = 0x4000000;
      }
      else
      {
        v28 = 335544320;
      }
    }
    v13->_stabilizationType = v28;
    goto LABEL_15;
  }
  v29 = 0;
LABEL_16:

  return v29;
}

+ (id)taskWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssets:andOptions:andCompletionHandler:", v7, v8, v9);

  return v10;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void (**completionHandler)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    if (completionHandler)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video stabilization task cancelled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, 0, v8);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoStabilizationAssetProcessingTask;
  -[VCPVideoStabilizationAssetProcessingTask dealloc](&v9, sel_dealloc);
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

+ (BOOL)deserializeStabilizationRecipeInAttributes:(id)a3
{
  id v3;
  void *v4;
  VCPProtoMovieStabilizationRecipe *v5;
  void *v6;
  VCPProtoMovieStabilizationRecipe *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabilizationRecipe"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [VCPProtoMovieStabilizationRecipe alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabilizationRecipe"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VCPProtoMovieStabilizationRecipe initWithData:](v5, "initWithData:", v6);

    -[VCPProtoMovieStabilizationRecipe exportToLegacyDictionary](v7, "exportToLegacyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("stabilizationRecipe"));
      objc_msgSend(v3, "addEntriesFromDictionary:", v8);

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (int)main
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  VCPDatabaseReader *database;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t stabilizationType;
  void *v17;
  void *v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  VCPMovieAnalyzer *v22;
  VCPMovieAnalyzer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSArray *obj;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_assets, "count"))
    return -50;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_assets;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v3)
  {
    v36 = *(_QWORD *)v39;
LABEL_4:
    v35 = v3;
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v36)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
      v6 = atomic_load((unsigned __int8 *)&self->_cancel);
      if ((v6 & 1) != 0)
      {
        v31 = -128;
        goto LABEL_36;
      }
      database = self->_database;
      objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v4), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPDatabaseReader queryAnalysisForAsset:](database, "queryAnalysisForAsset:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "vcp_results");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VideoStabilizationResults"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("gyroStabilization"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        stabilizationType = self->_stabilizationType;
        if (v15)
        {
          if ((stabilizationType & 0x10000000) == 0)
            goto LABEL_15;
        }
        else if ((stabilizationType & 0x4000000) == 0)
        {
          goto LABEL_15;
        }
        if ((int)objc_msgSend(v9, "vcp_version") < 35
          || (objc_msgSend(v9, "vcp_dateModified"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v5, "vcp_modificationDate"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v17, "isEqualToDate:", v18),
              v18,
              v17,
              (v19 & 1) == 0))
        {
LABEL_15:

          v11 = 0;
        }
      }
      v20 = self->_stabilizationType;
      if (!self->_onDemandPixel)
        v20 &= ~0x4000000uLL;
      if (self->_onDemandGyro)
        v21 = v20;
      else
        v21 = v20 & 0xFFFFFFFFEFFFFFFFLL;
      if ((v21 & 0x14000000) != 0 && !v11)
      {
        v22 = -[VCPMovieAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPMovieAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", v5, 0, v21);
        v23 = v22;
        if (!v22)
          goto LABEL_35;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __48__VCPVideoStabilizationAssetProcessingTask_main__block_invoke;
        v37[3] = &unk_1E6B15CE8;
        v37[4] = self;
        -[VCPMovieAnalyzer analyzeAsset:streamed:](v22, "analyzeAsset:streamed:", v37, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "vcp_results");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("VideoStabilizationResults"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v11)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("attributes"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "mutableCopy");

        if ((objc_msgSend((id)objc_opt_class(), "deserializeStabilizationRecipeInAttributes:", v28) & 1) == 0)
        {

LABEL_35:
          v31 = -18;
LABEL_36:

          goto LABEL_39;
        }
        objc_msgSend(v5, "localIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v28, v29);

      }
      if (v35 == ++v4)
      {
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v3)
          goto LABEL_4;
        break;
      }
    }
  }

  if (objc_msgSend(v34, "count"))
  {
    v30 = v34;
  }
  else
  {

    v30 = 0;
  }
  v34 = v30;
  (*((void (**)(void))self->_completionHandler + 2))();
  v31 = 0;
LABEL_39:

  return v31;
}

uint64_t __48__VCPVideoStabilizationAssetProcessingTask_main__block_invoke(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  return v1 & 1;
}

- (int)run
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void (**completionHandler)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoStabilizationAssetProcessingTask", ", v16, 2u);
  }

  v7 = -[VCPVideoStabilizationAssetProcessingTask main](self, "main");
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoStabilizationAssetProcessingTask", ", v16, 2u);
  }

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Video Stabilization processing failed", v16, 2u);
    }
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video stabilization processing failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v14);

  }
  return v7;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
