@implementation VCPFullAnalysisURLProcessingTask

- (VCPFullAnalysisURLProcessingTask)initWithURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  VCPFullAnalysisURLProcessingTask *v16;
  VCPFullAnalysisURLProcessingTask *v17;
  VCPFullAnalysisURLProcessingTask *v18;
  uint64_t v19;
  NSURL *assetURL;
  uint64_t v21;
  NSURL *pairedAssetURL;
  unint64_t v23;
  void *v24;
  id progressHandler;
  const void *v26;
  void *v27;
  id completionHandler;
  VCPFullAnalysisURLProcessingTask *v29;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)VCPFullAnalysisURLProcessingTask;
  v16 = -[VCPFullAnalysisURLProcessingTask init](&v31, sel_init);
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    atomic_store(0, (unsigned __int8 *)&v16->_cancel);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v19 = objc_claimAutoreleasedReturnValue();
      assetURL = v18->_assetURL;
      v18->_assetURL = (NSURL *)v19;
    }
    else
    {
      assetURL = v18->_assetURL;
      v18->_assetURL = 0;
    }

    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      pairedAssetURL = v18->_pairedAssetURL;
      v18->_pairedAssetURL = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v21 = objc_claimAutoreleasedReturnValue();
      pairedAssetURL = v18->_pairedAssetURL;
      v18->_pairedAssetURL = (NSURL *)v21;
    }

    v23 = 0x7FFFFFFFFFFFFLL;
    if (a5)
      v23 = a5;
    v18->_analysisTypes = v23;
    v24 = _Block_copy(v14);
    progressHandler = v18->_progressHandler;
    v18->_progressHandler = v24;

    if (v15)
      v26 = v15;
    else
      v26 = &__block_literal_global_57;
    v27 = _Block_copy(v26);
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = v27;

    v18->_noResultStrip = 0;
    objc_storeStrong((id *)&v17->_options, a4);
    v29 = v18;
  }

  return v18;
}

+ (id)taskForURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:", v11, v12, a5, v13, v14);

  return v15;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return (BYTE3(self->_analysisTypes) >> 5) & 1;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

- (int)run
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VCPFullAnalysisURLProcessingTask_run__block_invoke;
  v3[3] = &unk_1E6B15CE8;
  v3[4] = self;
  return -[VCPFullAnalysisURLProcessingTask runWithCancelBlock:](self, "runWithCancelBlock:", v3);
}

uint64_t __39__VCPFullAnalysisURLProcessingTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  return v1 & 1;
}

- (int)runWithCancelBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  uint64_t progressHandler;
  int v6;
  NSURL *assetURL;
  NSURL *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSURL *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSURL *pairedAssetURL;
  NSURL *v27;
  void *v28;
  NSURL *v29;
  void *v30;
  void (**v31)(double);
  NSURL *v33;
  void *v34;
  NSURL *v35;
  void *v36;
  void *v37;
  void *context;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint8_t buf[4];
  NSURL *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  progressHandler = (uint64_t)self->_progressHandler;
  if (progressHandler)
    progressHandler = (*(uint64_t (**)(double))(progressHandler + 16))(0.0);
  if (v4)
  {
    progressHandler = v4[2](v4);
    if ((progressHandler & 1) != 0)
    {
      v6 = -128;
      goto LABEL_47;
    }
  }
  context = (void *)MEMORY[0x1BCCA1B2C](progressHandler);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    assetURL = self->_assetURL;
    *(_DWORD *)buf = 138412290;
    v52 = assetURL;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "  [%@] Processing", buf, 0xCu);
  }
  v8 = self->_assetURL;
  v40 = 0;
  v9 = *MEMORY[0x1E0C998E0];
  -[NSURL getResourceValue:forKey:error:](v8, "getResourceValue:forKey:error:", &v40, *MEMORY[0x1E0C998E0], 0);
  v10 = v40;
  v11 = *MEMORY[0x1E0CEC568];
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0
    || (v12 = *MEMORY[0x1E0CEC640], objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC640])))
  {
    +[VCPURLAsset movieAssetWithURL:](VCPURLAsset, "movieAssetWithURL:", self->_assetURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[VCPMovieAnalyzer analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](VCPMovieAnalyzer, "analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v13, self->_partialAnalysis, self->_analysisTypes, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "analyzeAsset:streamed:", v4, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "status");
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v52 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie, skip", buf, 0xCu);
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis][%@]Unable to open movie, skip"), self->_assetURL, context);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v50 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v15 = 0;
    goto LABEL_34;
  }
  pairedAssetURL = self->_pairedAssetURL;
  if (!pairedAssetURL)
  {
    +[VCPURLAsset imageAssetWithURL:](VCPURLAsset, "imageAssetWithURL:", self->_assetURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_28;
LABEL_50:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v33 = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v52 = v33;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Failed to create asset", buf, 0xCu);
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis][%@]Failed to create asset"), self->_assetURL, context);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v46 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v24);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v19 = (void *)v25;
LABEL_22:
    v18 = 0;
    v6 = -50;
LABEL_39:

    v20 = 10;
    v15 = v23;
    goto LABEL_40;
  }
  v39 = 0;
  -[NSURL getResourceValue:forKey:error:](pairedAssetURL, "getResourceValue:forKey:error:", &v39, v9, 0);
  v23 = v39;
  if ((objc_msgSend(v23, "conformsToType:", v11) & 1) == 0 && !objc_msgSend(v23, "conformsToType:", v12))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v35 = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v52 = v35;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie, skip", buf, 0xCu);
    }
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis][%@]Unable to open movie, skip"), self->_assetURL, context);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  +[VCPURLAsset livePhotoAssetWithImageURL:andMovieURL:](VCPURLAsset, "livePhotoAssetWithImageURL:andMovieURL:", self->_assetURL, self->_pairedAssetURL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_50;
LABEL_28:
  +[VCPPhotoAnalyzer analyzerWithVCPAsset:forAnalysisTypes:](VCPPhotoAnalyzer, "analyzerWithVCPAsset:forAnalysisTypes:", v13, self->_analysisTypes);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "analyzeAsset:withOptions:", v4, self->_options);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "status");
LABEL_13:
  v17 = v16;

  if (v17 == 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v52 = v27;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Analysis cancelled", buf, 0xCu);
    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Analysis cancelled"), self->_assetURL, context);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v44 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -128;
    goto LABEL_38;
  }
  if (v17 != 2)
  {
LABEL_34:
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v52 = v29;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Analysis failed to complete", buf, 0xCu);
    }
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Analysis failed to complete"), self->_assetURL, context);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v42 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -18;
LABEL_38:
    v18 = v15;
    goto LABEL_39;
  }
  if (v15)
  {
    MediaAnalysisStripKeyframeResourceResultsFromAnalysis(v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = 0;
    v20 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v18 = 0;
  v19 = 0;
  v6 = 0;
  v20 = 0;
LABEL_41:

  objc_autoreleasePoolPop(context);
  if (v20 != 10)
  {
    v31 = (void (**)(double))self->_progressHandler;
    if (v31)
      v31[2](100.0);
  }
  if (v18)
    objc_storeStrong((id *)&self->_partialAnalysis, v18);
  (*((void (**)(void))self->_completionHandler + 2))();

LABEL_47:
  return v6;
}

- (NSDictionary)partialAnalysis
{
  return self->_partialAnalysis;
}

- (void)setPartialAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_partialAnalysis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialAnalysis, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pairedAssetURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end
