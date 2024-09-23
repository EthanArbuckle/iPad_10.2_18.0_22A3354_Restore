@implementation VCPFullAnalysisAssetProcessingTask

+ (BOOL)AllowPersistSettlingEffectScore
{
  return 1;
}

- (VCPFullAnalysisAssetProcessingTask)initWithAssets:(id)a3 analysisTypes:(unint64_t)a4 options:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  VCPFullAnalysisAssetProcessingTask *v15;
  const void *v16;
  void *v17;
  id completionHandler;
  void *v19;
  uint64_t v20;
  PHPhotoLibrary *photoLibrary;
  uint64_t v22;
  VCPDatabaseReader *database;
  void *v24;
  void *v25;
  VCPFullAnalysisAssetProcessingTask *v26;
  objc_super v28;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)VCPFullAnalysisAssetProcessingTask;
  v15 = -[VCPFullAnalysisAssetProcessingTask init](&v28, sel_init);
  if (v15)
  {
    if (v14)
      v16 = v14;
    else
      v16 = &__block_literal_global_9;
    v17 = _Block_copy(v16);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = v17;

    if (!objc_msgSend(v12, "count"))
    {
      v26 = 0;
      goto LABEL_9;
    }
    atomic_store(0, (unsigned __int8 *)&v15->_cancel);
    objc_storeStrong((id *)&v15->_assets, a3);
    -[NSArray objectAtIndexedSubscript:](v15->_assets, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "photoLibrary");
    v20 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v15->_photoLibrary;
    v15->_photoLibrary = (PHPhotoLibrary *)v20;

    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v15->_photoLibrary);
    v22 = objc_claimAutoreleasedReturnValue();
    database = v15->_database;
    v15->_database = (VCPDatabaseReader *)v22;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_allowOnDemand = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AllowStreaming"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_allowStreaming = objc_msgSend(v25, "BOOLValue");

    v15->_analysisTypes = a4;
    objc_storeStrong((id *)&v15->_options, a5);
  }
  v26 = v15;
LABEL_9:

  return v26;
}

+ (id)taskWithAsset:(id)a3 andAnalysisTypes:(unint64_t)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssets:analysisTypes:options:progressHandler:andCompletionHandler:", v11, a4, v12, v13, v14);

  return v15;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Full analysis asset processing task cancelled"));
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
  v9.super_class = (Class)VCPFullAnalysisAssetProcessingTask;
  -[VCPFullAnalysisAssetProcessingTask dealloc](&v9, sel_dealloc);
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (id)requestAnalysis:(unint64_t)a3 forAsset:(id)a4 andDatabase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  uint64_t v20;
  __objc2_class **v21;
  int v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  float v40;
  PHPhotoLibrary *photoLibrary;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  void *v51;
  void *v53;
  id v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  float v59;
  int v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MediaAnalysisResultsTypesForAnalysisTypes(a3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryAnalysisForAsset:withTypes:", v13, v55);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0;
  LODWORD(v13) = objc_msgSend(v11, "isAssetBlacklisted:blacklistDate:", v12, &v61);
  v54 = v61;
  if ((_DWORD)v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Analysis requested for blacklisted asset", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (!v14)
    goto LABEL_18;
  if ((int)objc_msgSend(v14, "vcp_version") >= 7)
  {
    objc_msgSend(v14, "vcp_dateModified");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vcp_modificationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToDate:", v16);

    if ((v17 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on old modification", buf, 0xCu);
      }
      goto LABEL_17;
    }
    if (!a3)
    {
      v47 = v14;
      v14 = v47;
LABEL_60:
      v46 = v47;
      goto LABEL_61;
    }
    v18 = objc_msgSend(v14, "vcp_degraded");
    if (self->_allowOnDemand)
    {
      objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "mediaType");
      v21 = off_1E6B0FA70;
      if (v20 != 1)
        v21 = off_1E6B0FA68;
      v22 = -[__objc2_class canAnalyzeUndegraded:withResources:](*v21, "canAnalyzeUndegraded:withResources:", v10, v19);
      MediaAnalysisStripOutdatedAnalysis(v10, v14);
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = v22 ^ 1;
      v14 = (void *)v23;
    }
    else
    {
      v24 = v18;
    }
    if (((objc_msgSend(v14, "vcp_degraded") ^ 1 | v24) & 1) != 0)
    {
      if ((a3 & ~objc_msgSend(v14, "vcp_types")) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          MediaAnalysisTypeDescription(objc_msgSend(v14, "vcp_types"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = v12;
          v64 = 2112;
          v65 = v48;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis satisfies request (%@)", buf, 0x16u);

        }
        goto LABEL_59;
      }
      if (((objc_msgSend(v14, "vcp_degraded") | v24 ^ 1) & 1) != 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          MediaAnalysisTypeDescription(objc_msgSend(v14, "vcp_types"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = v12;
          v64 = 2112;
          v65 = v51;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't satisfy request (%@)", buf, 0x16u);

        }
        v25 = a3 & ~objc_msgSend(v14, "vcp_types");
        if (!v25)
          goto LABEL_59;
        goto LABEL_19;
      }
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
LABEL_65:

        v14 = 0;
        v25 = a3;
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      v49 = MEMORY[0x1E0C81028];
      v50 = "[MediaAnalysis][%@] Existing analysis doesn't match asset state";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_65;
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      v49 = MEMORY[0x1E0C81028];
      v50 = "[MediaAnalysis][%@] Existing analysis based on degraded asset";
    }
    _os_log_impl(&dword_1B6C4A000, v49, OS_LOG_TYPE_DEBUG, v50, buf, 0xCu);
    goto LABEL_65;
  }
LABEL_17:

  v14 = 0;
LABEL_18:
  v25 = a3;
  if (!a3)
  {
LABEL_59:
    v47 = v14;
    v14 = v47;
    a3 = 0;
    goto LABEL_60;
  }
LABEL_19:
  if (!self->_allowOnDemand)
    goto LABEL_59;
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    MediaAnalysisTypeDescription(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v63 = v12;
    v64 = 2112;
    v65 = v26;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Generating analysis on-demand: %@", buf, 0x16u);

  }
  -[VCPFullAnalysisAssetProcessingTask analyzeOndemand:forAnalysisTypes:withExistingAnalysis:error:](self, "analyzeOndemand:forAnalysisTypes:withExistingAnalysis:error:", v10, v25, v14, a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    MediaAnalysisMergeAnalysis(v14, v27, self->_allowOnDemand);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  v29 = objc_msgSend((id)objc_opt_class(), "AllowPersistSettlingEffectScore") ^ 1;
  if ((a3 & 0x40000) == 0)
    LOBYTE(v29) = 1;
  if ((v29 & 1) == 0)
  {
    objc_msgSend(v28, "vcp_results");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("SettlingEffectsGatingResults"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v53, "count"))
    {
      objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "vcp_quality");
      v33 = v32;

      objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("attributes"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("RankingLevel"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v38 = v37;

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "localIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v39;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "   [%@] Publishing settling effect score to PHAssetPropertySetMediaAnalysis", buf, 0xCu);

      }
      photoLibrary = self->_photoLibrary;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __81__VCPFullAnalysisAssetProcessingTask_requestAnalysis_forAsset_andDatabase_error___block_invoke;
      v57[3] = &unk_1E6B15CC0;
      v42 = v10;
      v58 = v42;
      v40 = v33;
      v59 = v40;
      v60 = v38;
      v56 = 0;
      LODWORD(photoLibrary) = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v57, &v56);
      v43 = v56;
      if ((_DWORD)photoLibrary)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v42, "localIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v44;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "   [%@] Successfully published settling effect score to PHAssetPropertySetMediaAnalysis", buf, 0xCu);

        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v42, "localIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v63 = v45;
        v64 = 2112;
        v65 = v43;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "   [%@] Error publishing settling effect score to PHAssetPropertySetMediaAnalysis, error: %@", buf, 0x16u);

      }
    }

  }
  a3 = v28;

  v46 = (void *)a3;
LABEL_61:

  return v46;
}

void __81__VCPFullAnalysisAssetProcessingTask_requestAnalysis_forAsset_andDatabase_error___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vcp_modificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaAnalysisTimeStamp:", v2);

  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v5, "setSettlingEffectScore:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 44);
  objc_msgSend(v5, "setActivityScore:", v4);

}

- (id)analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  VCPPhotoAnalyzer *v18;
  void *v19;
  uint64_t v20;
  int v21;
  VCPMovieAnalyzer *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v41 = a5;
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "vcp_fullAnalysisTypesForResources:", v40);
  if (self->_allowStreaming)
  {
    v11 = v10;
    +[VCPInternetReachability sharedInstance](VCPInternetReachability, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasWifiOrEthernetConnection");
    if ((a4 & ~v11) != 0)
      v14 = v13;
    else
      v14 = 0;
    if (v14 == 1)
    {
      objc_msgSend(v9, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "vcp_eligibleForStreaming:", 0))
        v16 = objc_msgSend(v9, "vcp_eligibleForVideoDownload:", v40);
      else
        v16 = 0;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  v17 = (a4 >> 49) & 1 | objc_msgSend(v9, "isPhoto");
  if (v17 == 1)
  {
    v18 = -[VCPPhotoAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPPhotoAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", v9, v41, a4 & 0x261D900060000);
    -[VCPPhotoAnalyzer setAllowStreaming:](v18, "setAllowStreaming:", v16);
    -[VCPPhotoAnalyzer setOnDemand:](v18, "setOnDemand:", 1);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke;
    v43[3] = &unk_1E6B15CE8;
    v43[4] = self;
    -[VCPPhotoAnalyzer analyzeAsset:withOptions:](v18, "analyzeAsset:withOptions:", v43, self->_options);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VCPPhotoAnalyzer status](v18, "status");

  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  v21 = objc_msgSend(v9, "isVideo");
  if (v21)
  {
    v22 = -[VCPMovieAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPMovieAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", v9, v41, a4);
    -[VCPMovieAnalyzer setAllowStreaming:](v22, "setAllowStreaming:", v16);
    -[VCPMovieAnalyzer setOnDemand:](v22, "setOnDemand:", 1);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke_2;
    v42[3] = &unk_1E6B15CE8;
    v42[4] = self;
    -[VCPMovieAnalyzer analyzeAsset:streamed:](v22, "analyzeAsset:streamed:", v42, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VCPMovieAnalyzer status](v22, "status");

  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  MediaAnalysisMergeAnalysis(v23, v19, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v20 == 2)
    v27 = 0;
  else
    v27 = v17;
  if (v24 == 2)
    v28 = 0;
  else
    v28 = v21;
  if ((v27 & 1) != 0 || (v28 & 1) != 0)
  {
    if (v20 == 4 || v24 == 4)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v32;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Analysis cancelled", buf, 0xCu);

      }
      v31 = -128;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "localIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v30;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Analysis failed to complete", buf, 0xCu);

      }
      v31 = -18;
    }

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "localIdentifier");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("[%@] Failed to analyze on-demand"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v31, v37);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v26 = (void *)v35;
      goto LABEL_41;
    }
LABEL_42:
    v29 = 0;
    goto LABEL_43;
  }
  if (!v25)
    goto LABEL_42;
  MediaAnalysisStripKeyframeResourceResultsFromAnalysis(v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

LABEL_43:
  return v29;
}

uint64_t __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  return v1 & 1;
}

uint64_t __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  return v1 & 1;
}

- (int)main
{
  int v2;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  void *v25;
  NSArray *obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_assets, "count"))
    return -50;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_assets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v4)
    goto LABEL_36;
  v27 = *(_QWORD *)v29;
  *(_QWORD *)&v5 = 138412290;
  v24 = v5;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v29 != v27)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
      v8 = (void *)MEMORY[0x1BCCA1B2C]();
      v9 = atomic_load((unsigned __int8 *)&self->_cancel);
      if ((v9 & 1) != 0)
      {
        v2 = -128;
LABEL_22:
        v14 = 1;
        goto LABEL_23;
      }
      if (objc_msgSend(v7, "isPhoto") && (self->_analysisTypes & 0xFFFD9E26FFF9FFFFLL) != 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          MediaAnalysisTypeDescription(self->_analysisTypes & 0xFFFD9E26FFF9FFFFLL);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v33 = v10;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported photo analysis type %@", buf, 0xCu);

        }
LABEL_21:
        v2 = -18;
        goto LABEL_22;
      }
      v11 = objc_msgSend(v7, "isVideo", v24);
      if ((self->_analysisTypes & 0xFFFDDFFEFFFFFFFFLL) != 0)
        v12 = v11;
      else
        v12 = 0;
      if (v12 == 1)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          MediaAnalysisTypeDescription(self->_analysisTypes & 0xFFFDDFFEFFFFFFFFLL);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v33 = v13;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported movie analysis type %@", buf, 0xCu);

        }
        goto LABEL_21;
      }
      -[VCPFullAnalysisAssetProcessingTask requestAnalysis:forAsset:andDatabase:error:](self, "requestAnalysis:forAsset:andDatabase:error:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = v16;
      if (v16)
      {
        v2 = objc_msgSend(v16, "code");
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v33 = v18;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        v14 = 1;
      }
      else
      {
        if (v15)
        {
          objc_msgSend(v15, "vcp_results");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, v20);

        }
        v14 = 0;
      }

LABEL_23:
      objc_autoreleasePoolPop(v8);
      if (v14)
      {

        goto LABEL_42;
      }
      ++v6;
    }
    while (v4 != v6);
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    v4 = v21;
  }
  while (v21);
LABEL_36:

  if (objc_msgSend(v25, "count"))
  {
    v22 = v25;
  }
  else
  {

    v22 = 0;
  }
  v25 = v22;
  (*((void (**)(void))self->_completionHandler + 2))();
  v2 = 0;
LABEL_42:

  return v2;
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
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFullAnalysisAssetProcessingTask", ", v16, 2u);
  }

  v7 = -[VCPFullAnalysisAssetProcessingTask main](self, "main");
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_END, v4, "VCPFullAnalysisAssetProcessingTask", ", v16, 2u);
  }

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPFullAnalysisAssetProcessingTask processing failed", v16, 2u);
    }
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPFullAnalysisAssetProcessingTask processing failed"));
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
