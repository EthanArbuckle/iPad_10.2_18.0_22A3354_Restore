@implementation VCPMovieAnalyzer

+ (void)purgeCachedModels
{
  +[VCPAudioClassifier purgeCachedModels](VCPAudioClassifier, "purgeCachedModels");
}

+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4
{
  id v5;
  id v6;
  char v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "vcp_isVideoSlowmo"))
    v7 = objc_msgSend(v6, "vcp_hasLocalSlowmo:", objc_msgSend(v5, "vcp_hasAdjustments:", v6));
  else
    v7 = objc_msgSend(v6, "vcp_hasLocalMovie:", objc_msgSend(v5, "hasAdjustments"));
  v8 = v7;

  return v8;
}

+ (float)getMaximumHighlightInSec
{
  unsigned __int8 v2;
  uint64_t *v3;
  int v5;

  v3 = &qword_1ED261000;
  if ((v2 & 1) == 0)
  {
    v3 = &qword_1ED261000;
    if (v5)
    {
      +[VCPMovieAnalyzer getMaximumHighlightInSec]::length = 1092616192;
      v3 = &qword_1ED261000;
    }
  }
  return *((float *)v3 + 202);
}

+ (BOOL)enableAudioVideoFusion
{
  unsigned __int8 v2;

  {
    +[VCPMovieAnalyzer enableAudioVideoFusion]::enable = +[VCPAudioVideoEmbeddingFuser supportFusionForVersion:](VCPAudioVideoEmbeddingFuser, "supportFusionForVersion:", objc_msgSend((id)objc_opt_class(), "embeddingVersion"));
  }
  return +[VCPMovieAnalyzer enableAudioVideoFusion]::enable;
}

+ (BOOL)getEnableMovieHumanAction
{
  return 0;
}

+ (BOOL)isHeuristicStickerScoreEnabled
{
  return 0;
}

+ (BOOL)persistAudioEmbedding
{
  return 0;
}

- (VCPMovieAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  VCPMovieAnalyzer *v14;
  void *v15;
  BOOL v16;
  float v17;
  id *p_asset;
  uint64_t v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  NSMutableDictionary *privateResults;
  char v23;
  NSMutableDictionary *analysis;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSDictionary *v29;
  NSDictionary *existingAnalysis;
  NSMutableDictionary *v31;
  void *v32;
  unint64_t requestedAnalyses;
  int v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)VCPMovieAnalyzer;
  v14 = -[VCPMovieAnalyzer init](&v41, sel_init);
  if (!v14)
    goto LABEL_38;
  objc_msgSend(v11, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    v14->_status = 3;
    analysis = v14->_analysis;
    v14->_analysis = 0;

    goto LABEL_38;
  }
  *(_WORD *)&v14->_allowStreaming = 0;
  objc_msgSend((id)objc_opt_class(), "getMaximumHighlightInSec");
  v14->_maxHighlightDuration = v17;
  v14->_status = 1;
  v14->_requestedAnalyses = a5;
  p_asset = (id *)&v14->_asset;
  objc_storeStrong((id *)&v14->_asset, a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v14->_analysis;
  v14->_analysis = (NSMutableDictionary *)v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = objc_claimAutoreleasedReturnValue();
  privateResults = v14->_privateResults;
  v14->_privateResults = (NSMutableDictionary *)v21;

  v14->_prepareLivePhotoScenes = 0;
  if ((int)SocType() < 247)
    v23 = 0;
  else
    v23 = objc_msgSend(v11, "isLivePhoto") ^ 1;
  v14->_supportConditionalAnalysis = v23;
  objc_storeStrong((id *)&v14->_options, a6);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*p_asset, "localIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v25;
    v44 = 2112;
    v45 = v26;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][MovieAnalyzer] Initialize to process (%@)", buf, 0x16u);

  }
  if (!v12)
  {
    v28 = 69;
    goto LABEL_14;
  }
  v27 = objc_msgSend(v12, "vcp_version");
  v28 = 69;
  if ((_DWORD)v27 != 69)
  {
LABEL_14:
    existingAnalysis = v14->_existingAnalysis;
    v14->_existingAnalysis = 0;
    goto LABEL_15;
  }
  v29 = (NSDictionary *)v12;
  existingAnalysis = v14->_existingAnalysis;
  v14->_existingAnalysis = v29;
  v28 = v27;
LABEL_15:

  -[NSMutableDictionary vcp_setVersion:](v14->_analysis, "vcp_setVersion:", v28);
  v31 = v14->_analysis;
  objc_msgSend(v11, "modificationDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary vcp_setDateModified:](v31, "vcp_setDateModified:", v32);

  -[NSMutableDictionary vcp_setStatsFlags:](v14->_analysis, "vcp_setStatsFlags:", 0);
  requestedAnalyses = v14->_requestedAnalyses;
  if ((requestedAnalyses & 0x40000) != 0)
  {
    requestedAnalyses |= 0x40142089CuLL;
    v14->_requestedAnalyses = requestedAnalyses;
  }
  if ((requestedAnalyses & 0x80000000000) != 0)
  {
    v34 = objc_msgSend((id)objc_opt_class(), "enableAudioVideoFusion");
    requestedAnalyses = v14->_requestedAnalyses;
    if (v34)
    {
      requestedAnalyses |= 0x800000000000uLL;
      v14->_requestedAnalyses = requestedAnalyses;
    }
  }
  if ((requestedAnalyses & 0x200000000000) != 0)
  {
    v35 = objc_msgSend(v11, "isLivePhoto");
    v36 = 0x40000000;
    if (!v35)
      v36 = 0x80000000000;
    requestedAnalyses = v14->_requestedAnalyses | v36;
    v14->_requestedAnalyses = requestedAnalyses;
  }
  if ((requestedAnalyses & 0x8000) != 0 && v14->_supportConditionalAnalysis)
  {
    requestedAnalyses |= 0x4088uLL;
    v14->_requestedAnalyses = requestedAnalyses;
  }
  v37 = (requestedAnalyses >> 7) & 0x80 | (requestedAnalyses >> 20) & 0x20000 | requestedAnalyses;
  if ((requestedAnalyses & 0x2000004000) != 0)
    v14->_requestedAnalyses = v37;
  if ((requestedAnalyses >> 7) & 0x80 | requestedAnalyses & 0x80)
  {
    v14->_requestedAnalyses = v37 | 0x1018;
    if (v14->_supportConditionalAnalysis)
    {
      v37 |= 0x5018uLL;
      v14->_requestedAnalyses = v37;
    }
    else
    {
      v37 |= 0x1018uLL;
    }
  }
  if ((v37 & 0x4000004000) != 0)
    v14->_requestedAnalyses = (v37 << 28) & 0x40000000000 | (((v37 >> 38) & 1) << 40) | v37;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*p_asset, "localIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v38;
    v44 = 2112;
    v45 = v39;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][MovieAnalyzer] Initialized to process (%@)", buf, 0x16u);

  }
LABEL_38:

  return v14;
}

+ (id)analyzerWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v9, v10, a5, v11);

  return v12;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withPausedAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  VCPMovieAnalyzer *v15;
  uint64_t v16;
  NSMutableDictionary *analysis;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  _BYTE v24[24];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_phAsset, a3);
  if (!v10)
  {
LABEL_9:
    +[VCPPhotosAsset assetWithPHAsset:](VCPPhotosAsset, "assetWithPHAsset:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[VCPMovieAnalyzer initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](self, "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v22, 0, a5, 0);

    goto LABEL_10;
  }
  if (objc_msgSend(v10, "vcp_version") != 69
    || (objc_msgSend(v10, "vcp_dateModified"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "vcp_modificationDate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "isEqualToDate:", v12),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Existing analysis outdated; dropping",
        buf,
        0xCu);

    }
    goto LABEL_9;
  }
  +[VCPPhotosAsset assetWithPHAsset:](VCPPhotosAsset, "assetWithPHAsset:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VCPMovieAnalyzer initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](self, "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v14, 0, a5, 0);

  if (v15)
  {
    v16 = objc_msgSend(v10, "vcp_types");
    analysis = v15->_analysis;
    v15->_requestedAnalyses &= ~v16;
    -[NSMutableDictionary vcp_setTypes:](analysis, "vcp_setTypes:", objc_msgSend(v10, "vcp_types"));
    -[NSMutableDictionary vcp_setFlags:](v15->_analysis, "vcp_setFlags:", objc_msgSend(v10, "vcp_flags"));
    -[NSMutableDictionary vcp_setStatsFlags:](v15->_analysis, "vcp_setStatsFlags:", objc_msgSend(v10, "vcp_statsFlags"));
    v18 = v15->_analysis;
    objc_msgSend(v10, "vcp_results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary vcp_addEntriesFromResults:](v18, "vcp_addEntriesFromResults:", v19);

    v20 = v15->_analysis;
    objc_msgSend(v10, "vcp_syncPoint");
    -[NSMutableDictionary vcp_setSyncPoint:](v20, "vcp_setSyncPoint:", v24);
  }
LABEL_10:

  return v15;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  VCPMovieAnalyzer *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_storeStrong((id *)&self->_phAsset, a3);
  if (!v12)
  {
LABEL_8:
    +[VCPPhotosAsset assetWithPHAsset:downloadedData:](VCPPhotosAsset, "assetWithPHAsset:downloadedData:", v11, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[VCPMovieAnalyzer initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](self, "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v21, 0, a5, 0);

    goto LABEL_9;
  }
  if (objc_msgSend(v12, "vcp_version") != 69
    || (objc_msgSend(v12, "vcp_dateModified"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "vcp_modificationDate"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "isEqualToDate:", v15),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] Existing analysis outdated; dropping",
        (uint8_t *)&v23,
        0xCu);

    }
    goto LABEL_8;
  }
  +[VCPPhotosAsset assetWithPHAsset:downloadedData:](VCPPhotosAsset, "assetWithPHAsset:downloadedData:", v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MediaAnalysisStripOutdatedAnalysis(v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[VCPMovieAnalyzer initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](self, "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v17, v18, a5, 0);

LABEL_9:
  return v19;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  return -[VCPMovieAnalyzer initWithPHAsset:existingAnalysis:analysisTypes:downloadedData:](self, "initWithPHAsset:existingAnalysis:analysisTypes:downloadedData:", a3, a4, a5, 0);
}

- (id)privateResults
{
  return self->_privateResults;
}

- (void)loadPropertiesForAsset:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_group_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  dispatch_group_t v15;
  NSObject *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C8A7D0];
  v17[0] = *MEMORY[0x1E0C8A7A0];
  v17[1] = v4;
  v18[0] = &unk_1E6B76770;
  v18[1] = &unk_1E6B76788;
  v17[2] = *MEMORY[0x1E0C8A808];
  v18[2] = &unk_1E6B767A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v7 = dispatch_group_create();
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke;
  v12[3] = &unk_1E6B180E8;
  v13 = v5;
  v8 = v3;
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E6B767B8, v12);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_2;
  v3[3] = &unk_1E6B18CE8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaType:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_3;
        v12[3] = &unk_1E6B15468;
        v13 = *(id *)(a1 + 40);
        objc_msgSend(v11, "loadValuesAsynchronouslyForKeys:completionHandler:", v5, v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)processExistingAnalysisForTimeRange:(id *)a3 analysisTypes:(unint64_t *)a4
{
  NSDictionary *existingAnalysis;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CMTime *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  CMTime time2;
  CMTimeRange v35;
  CMTimeRange v36;
  CMTimeRange v37;
  CMTime time1;
  CMTimeRange v39;
  CMTimeRange v40;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTimeRange v43;
  CMTimeRange v44;
  CMTimeRange v45;
  CMTimeRange v46;
  CMTimeRange v47;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v50;
  CMTimeRange buf;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSDictionary vcp_degraded](self->_existingAnalysis, "vcp_degraded"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Existing analysis degraded, skip", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    existingAnalysis = self->_existingAnalysis;
    if (existingAnalysis)
    {
      -[NSDictionary objectForKey:](existingAnalysis, "objectForKey:", CFSTR("performedAnalysisTypes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        *a4 = self->_requestedAnalyses & -[NSDictionary vcp_types](self->_existingAnalysis, "vcp_types");
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[NSDictionary vcp_results](self->_existingAnalysis, "vcp_results");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v8;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v9)
        {
          v30 = *(_QWORD *)v57;
          v10 = (CMTime *)MEMORY[0x1E0CA2E68];
          do
          {
            v11 = 0;
            v31 = v9;
            do
            {
              if (*(_QWORD *)v57 != v30)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v11);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              -[NSDictionary vcp_results](self->_existingAnalysis, "vcp_results");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v33 = v12;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v53;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v53 != v17)
                      objc_enumerationMutation(v15);
                    v19 = *(const __CFDictionary **)(*((_QWORD *)&v52 + 1) + 8 * v18);
                    memset(&buf, 0, sizeof(buf));
                    CMTimeRangeMakeFromDictionary(&buf, v19);
                    if ((buf.start.flags & 1) == 0)
                      goto LABEL_18;
                    if ((buf.duration.flags & 1) == 0)
                      goto LABEL_18;
                    if (buf.duration.epoch)
                      goto LABEL_18;
                    if (buf.duration.value < 0)
                      goto LABEL_18;
                    range = buf;
                    v20 = *(_OWORD *)&a3->var0.var3;
                    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
                    *(_OWORD *)&otherRange.start.epoch = v20;
                    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
                    CMTimeRangeGetIntersection(&v50, &range, &otherRange);
                    if ((v50.start.flags & 1) == 0)
                      goto LABEL_18;
                    v46 = buf;
                    v21 = *(_OWORD *)&a3->var0.var3;
                    *(_OWORD *)&v45.start.value = *(_OWORD *)&a3->var0.var0;
                    *(_OWORD *)&v45.start.epoch = v21;
                    *(_OWORD *)&v45.duration.timescale = *(_OWORD *)&a3->var1.var1;
                    CMTimeRangeGetIntersection(&v47, &v46, &v45);
                    if ((v47.duration.flags & 1) == 0)
                      goto LABEL_18;
                    v43 = buf;
                    v22 = *(_OWORD *)&a3->var0.var3;
                    *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0.var0;
                    *(_OWORD *)&v42.start.epoch = v22;
                    *(_OWORD *)&v42.duration.timescale = *(_OWORD *)&a3->var1.var1;
                    CMTimeRangeGetIntersection(&v44, &v43, &v42);
                    if (v44.duration.epoch)
                      goto LABEL_18;
                    v40 = buf;
                    v23 = *(_OWORD *)&a3->var0.var3;
                    *(_OWORD *)&v39.start.value = *(_OWORD *)&a3->var0.var0;
                    *(_OWORD *)&v39.start.epoch = v23;
                    *(_OWORD *)&v39.duration.timescale = *(_OWORD *)&a3->var1.var1;
                    CMTimeRangeGetIntersection(&v41, &v40, &v39);
                    if (v41.duration.value < 0)
                      goto LABEL_18;
                    v36 = buf;
                    v24 = *(_OWORD *)&a3->var0.var3;
                    *(_OWORD *)&v35.start.value = *(_OWORD *)&a3->var0.var0;
                    *(_OWORD *)&v35.start.epoch = v24;
                    *(_OWORD *)&v35.duration.timescale = *(_OWORD *)&a3->var1.var1;
                    CMTimeRangeGetIntersection(&v37, &v36, &v35);
                    time1 = v37.duration;
                    time2 = *v10;
                    if (CMTimeCompare(&time1, &time2))
LABEL_18:
                      objc_msgSend(v13, "addObject:", v19);
                    ++v18;
                  }
                  while (v16 != v18);
                  v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                  v16 = v25;
                }
                while (v25);
              }

              if (objc_msgSend(v13, "count"))
                objc_msgSend(v29, "setObject:forKey:", v13, v33);
              else
                *a4 &= ~MediaAnalysisResultsKeyToAnalysisType(v33);

              ++v11;
            }
            while (v11 != v31);
            v8 = obj;
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          }
          while (v9);
        }

      }
    }
  }
  return v29;
}

- (int)performMetadataAnalysisOnAsset:(id)a3 withCancelBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t requestedAnalyses;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  VCPLightVideoAnalyzer *v21;
  int v22;
  NSMutableDictionary *analysis;
  void *v24;
  NSMutableDictionary *privateResults;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  id v33;
  os_signpost_id_t spid;
  uint8_t v35[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPMovieAnalyzer_Metadata", ", buf, 2u);
  }

  requestedAnalyses = self->_requestedAnalyses;
  v13 = -[NSMutableDictionary vcp_types](self->_analysis, "vcp_types");
  v14 = requestedAnalyses & 0x40 | (4 * ((requestedAnalyses & 0xC) == 4));
  if ((requestedAnalyses & 0x880) != 0)
    v14 |= 0x80uLL;
  v15 = (v14 | requestedAnalyses & 0x4000014030000200) & ~v13;
  if (v15)
  {
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMovieAnalyzer_Metadata_VCPLightVideoAnalyzer", ", buf, 2u);
    }

    v21 = -[VCPLightVideoAnalyzer initWithAVAsset:forAnalysisTypes:]([VCPLightVideoAnalyzer alloc], "initWithAVAsset:forAnalysisTypes:", v6, v15);
    -[VCPAsset photoOffsetSeconds](self->_asset, "photoOffsetSeconds");
    -[VCPLightVideoAnalyzer setPhotoOffset:](v21, "setPhotoOffset:");
    if (v21)
    {
      spid = v17;
      *(_QWORD *)buf = 0;
      v22 = -[VCPLightVideoAnalyzer analyzeAsset:flags:](v21, "analyzeAsset:flags:", v7, buf);
      if (!v22)
      {
        v32 = v7;
        v33 = v6;
        analysis = self->_analysis;
        -[VCPLightVideoAnalyzer publicResults](v21, "publicResults");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_addEntriesFromResults:](analysis, "vcp_addEntriesFromResults:", v24);

        -[NSMutableDictionary vcp_addFlags:](self->_analysis, "vcp_addFlags:", *(_QWORD *)buf);
        -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", v15 & 0xBFFFFEFFCFFFFDFFLL);
        privateResults = self->_privateResults;
        -[VCPLightVideoAnalyzer privateResults](v21, "privateResults");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary addEntriesFromDictionary:](privateResults, "addEntriesFromDictionary:", v26);

        v7 = v32;
        v6 = v33;
        VCPSignPostLog();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer_Metadata_VCPLightVideoAnalyzer", ", v35, 2u);
        }

        VCPSignPostLog();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v9, "VCPMovieAnalyzer_Metadata", ", v35, 2u);
        }

      }
    }
    else
    {
      v22 = -108;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)createDecoderForTrack:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 decodedFrameRate:(float *)a6 withLossySetting:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  VCPVideoTrackStandardDecoder *v19;
  float v20;
  float v21;
  VCPVideoTrackStandardDecoder *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  VCPVideoTrackStandardDecoder *v27;
  int v29;
  CMTime v30;
  CMTime time;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  void *v37;
  _QWORD v38[3];

  v7 = a7;
  v38[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if ((a5 & 0x4004000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704422);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704438);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = *MEMORY[0x1E0CA9040];
    v37 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nominalFrameRate");
    *(_DWORD *)a6 = v18;
    v19 = -[VCPVideoTrackStandardDecoder initWithTrack:timerange:withSettings:applyTransform:]([VCPVideoTrackStandardDecoder alloc], "initWithTrack:timerange:withSettings:applyTransform:", v13, a4, v17, 0);
  }
  else
  {
    if ((a5 & 0x20000000) == 0)
    {
      objc_msgSend(v12, "nominalFrameRate");
      time.epoch = 0;
      *(_OWORD *)&time.value = kSampleInterval;
      if (1.25 / CMTimeGetSeconds(&time) >= v20)
      {
        objc_msgSend(v13, "nominalFrameRate");
        *(_DWORD *)a6 = v29;
        if (-[VCPAsset isSlowmo](self->_asset, "isSlowmo"))
        {
          v27 = 0;
          goto LABEL_11;
        }
        v22 = -[VCPVideoTrackStandardDecoder initWithTrack:timerange:]([VCPVideoTrackStandardDecoder alloc], "initWithTrack:timerange:", v13, a4);
      }
      else
      {
        v30.epoch = 0;
        *(_OWORD *)&v30.value = kSampleInterval;
        v21 = 1.0 / CMTimeGetSeconds(&v30);
        *a6 = v21;
        v22 = -[VCPVideoTrackSubsamplingDecoder initWithTrack:timerange:atInterval:]([VCPVideoTrackSubsamplingDecoder alloc], "initWithTrack:timerange:atInterval:", v13, a4, &kSampleInterval);
      }
      v27 = v22;
      goto LABEL_11;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 758670896);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 758674992);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704422);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704438);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v25;

    v32 = *MEMORY[0x1E0CA9040];
    v33 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nominalFrameRate");
    *(_DWORD *)a6 = v26;
    v19 = -[VCPVideoTrackStandardDecoder initWithTrack:timerange:withSettings:applyTransform:]([VCPVideoTrackStandardDecoder alloc], "initWithTrack:timerange:withSettings:applyTransform:", v13, a4, v17, 0);
  }
  v27 = v19;

LABEL_11:
  return v27;
}

- (id)createVideoAnalyzerWithOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 embeddings:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  VCPFullVideoAnalyzer *v10;
  __int128 v11;
  NSMutableDictionary *privateResults;
  _BOOL8 v13;
  BOOL v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  VCPFullVideoAnalyzer *v23;
  uint64_t v25;
  _OWORD v26[3];

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[NSMutableDictionary objectForKey:](self->_privateResults, "objectForKey:", CFSTR("OrientationResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [VCPFullVideoAnalyzer alloc];
  v11 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v11;
  v26[2] = *(_OWORD *)&a4->tx;
  privateResults = self->_privateResults;
  v13 = -[VCPAsset isTimelapse](self->_asset, "isTimelapse");
  v14 = -[VCPAsset isLivePhoto](self->_asset, "isLivePhoto");
  -[VCPAsset photoOffsetSeconds](self->_asset, "photoOffsetSeconds");
  v16 = v15;
  -[VCPAsset exposureTimeSeconds](self->_asset, "exposureTimeSeconds");
  v18 = v17;
  -[VCPAsset slowmoRate](self->_asset, "slowmoRate");
  LODWORD(v20) = v19;
  BYTE1(v25) = self->_faceDominated;
  LOBYTE(v25) = v14;
  LODWORD(v21) = v16;
  LODWORD(v22) = v18;
  v23 = -[VCPFullVideoAnalyzer initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:](v10, "initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:", v6, v26, v9, privateResults, v8, v13, v21, v22, v20, v25);

  return v23;
}

- (int)analyzeVideoSegment:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6
{
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  VCPVideoEmbeddings *v17;
  void *v18;
  unint64_t v19;
  VCPSettlingEffectAnalyzer *v20;
  __int128 v21;
  VCPVideoPetsActionAnalyzer *v22;
  VCPMovieCurationAnalyzer *v23;
  int v24;
  int v25;
  int v26;
  VCPVideoInterpolator *v27;
  NSMutableDictionary *privateResults;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  VCPSettlingEffectAnalyzer *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  uint64_t v42;
  VCPVideoSaliencyAnalyzer *v43;
  __int128 v44;
  VCPVideoPetsAnalyzer *v45;
  __int128 v46;
  uint64_t v47;
  NSMutableDictionary *v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  VCPMovieCurationAnalyzer *v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  void *v64;
  BOOL v65;
  VCPAsset *asset;
  void *v67;
  double v68;
  double v69;
  uint64_t v70;
  char HasANE;
  int v72;
  NSObject *v73;
  os_signpost_id_t v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  os_signpost_id_t v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  __int128 v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  int v91;
  void *v92;
  void *v93;
  BOOL v94;
  double v95;
  float v96;
  void *v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t j;
  void *v107;
  void *v108;
  float v109;
  _BOOL4 v110;
  void *v111;
  float v112;
  uint64_t v113;
  PHAsset *phAsset;
  VCPVideoCaptionAnalyzer *v115;
  int v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  os_signpost_id_t v125;
  NSObject *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  int v132;
  void *v133;
  NSObject *v134;
  NSObject *v135;
  VCPVideoCaptionAnalyzer *v137;
  int v138;
  double v139;
  uint64_t v140;
  void *v141;
  NSObject *v142;
  NSObject *v143;
  char v144;
  VCPVideoCNNAnalyzer *v145;
  int v146;
  uint64_t v147;
  int v148;
  double v149;
  double v150;
  int v151;
  VCPAudioVideoEmbeddingFuser *v152;
  uint64_t v153;
  MADVideoSafetyClassifier *v154;
  VCPVideoCNNAnalyzer *v155;
  MADVideoSafetyClassifier *v156;
  BOOL v157;
  char v158;
  VCPVideoCNNHighlightTimeRangePredictor *v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  int v163;
  double v164;
  VCPVideoCNNHighlightTimeRangePredictor *v165;
  uint64_t v166;
  id v167;
  VCPVideoInterpolator *v168;
  id v169;
  id v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  VCPVideoAnalysisPipelineManager *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  NSObject *v179;
  int v180;
  NSObject *v181;
  id v182;
  id v183;
  VCPVideoAnalysisPipelineFrameResource *v184;
  uint64_t v185;
  id v186;
  VCPVideoAnalysisPipelineFrameResource *v187;
  int v188;
  NSObject *v189;
  id v190;
  id v191;
  NSObject *v192;
  id v193;
  id v194;
  NSObject *v195;
  id v196;
  id v197;
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  NSObject *v201;
  NSObject *v202;
  os_signpost_id_t v203;
  NSObject *v204;
  NSObject *v205;
  __int128 v206;
  void *v207;
  NSObject *v208;
  NSObject *v209;
  NSObject *v210;
  os_signpost_id_t v211;
  NSObject *v212;
  NSObject *v213;
  __int128 v214;
  void *v215;
  NSMutableDictionary *v216;
  void *v217;
  NSObject *v218;
  NSObject *v219;
  NSObject *v220;
  os_signpost_id_t v221;
  NSObject *v222;
  NSObject *v223;
  void *v224;
  void *v225;
  __int128 v226;
  void *v227;
  NSObject *v228;
  NSObject *v229;
  NSObject *v230;
  NSObject *v231;
  NSObject *v232;
  _BOOL4 v233;
  VCPAsset *v234;
  unsigned int v235;
  NSObject *v236;
  id v237;
  NSObject *v238;
  os_signpost_id_t v239;
  NSObject *v240;
  NSObject *v241;
  VCPPhotosQuickFaceDetectionManager *v242;
  void *v243;
  VCPPhotosQuickFaceDetectionManager *v244;
  char v245;
  unsigned int v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  __int128 v252;
  void *v253;
  NSObject *v254;
  NSObject *v255;
  NSObject *v256;
  os_signpost_id_t v257;
  NSObject *v258;
  NSObject *v259;
  __int128 v260;
  void *v261;
  NSObject *v262;
  NSObject *v263;
  NSObject *v264;
  os_signpost_id_t v265;
  NSObject *v266;
  NSObject *v267;
  __int128 v268;
  void *v269;
  NSMutableDictionary *v270;
  void *v271;
  NSObject *v272;
  NSObject *v273;
  NSObject *v274;
  os_signpost_id_t v275;
  NSObject *v276;
  NSObject *v277;
  __int128 v278;
  void *v279;
  NSObject *v280;
  NSObject *v281;
  NSObject *v282;
  os_signpost_id_t v283;
  NSObject *v284;
  NSObject *v285;
  __int128 v286;
  void *v287;
  NSObject *v288;
  NSObject *v289;
  NSObject *v290;
  os_signpost_id_t v291;
  NSObject *v292;
  NSObject *v293;
  __int128 v294;
  void *v295;
  NSObject *v296;
  NSObject *v297;
  NSObject *v298;
  os_signpost_id_t v299;
  NSObject *v300;
  NSObject *v301;
  double v302;
  double v303;
  __int128 v304;
  NSObject *v305;
  NSObject *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  NSObject *v311;
  NSObject *v312;
  NSObject *v313;
  os_signpost_id_t v314;
  NSObject *v315;
  NSObject *v316;
  __int128 v317;
  void *v318;
  NSObject *v319;
  NSObject *v320;
  NSObject *v321;
  os_signpost_id_t v322;
  NSObject *v323;
  NSObject *v324;
  __int128 v325;
  void *v326;
  NSObject *v327;
  NSObject *v328;
  NSObject *v329;
  os_signpost_id_t v330;
  NSObject *v331;
  NSObject *v332;
  void *v333;
  NSObject *v334;
  NSObject *v335;
  NSObject *v336;
  os_signpost_id_t v337;
  NSObject *v338;
  NSObject *v339;
  __int128 v340;
  void *v341;
  NSObject *v342;
  NSObject *v343;
  NSObject *v344;
  NSObject *v345;
  double v346;
  double v347;
  double v348;
  double v349;
  void *v350;
  BOOL v351;
  void *v352;
  const __CFDictionary *v353;
  double v354;
  __CVBuffer *v355;
  double v356;
  uint64_t v357;
  uint64_t v358;
  VCPVideoInterpolator *v359;
  VCPSettlingEffectAnalyzer *v360;
  id v361;
  VCPMovieCurationAnalyzer *v362;
  VCPVideoPetsActionAnalyzer *v363;
  id v364;
  id v365;
  VCPVideoActivityAnalyzer *v366;
  VCPVideoSceneClassifier *v367;
  os_signpost_id_t v368;
  os_signpost_id_t v369[2];
  id v370;
  float64x2_t v371;
  id v372;
  VCPVideoCNNHighlightTimeRangePredictor *v373;
  void *v374;
  os_signpost_id_t v375;
  MADVideoSafetyClassifier *v376;
  VCPVideoCNNAnalyzer *v377;
  id v378;
  VCPVideoHumanActionAnalyzer *v379;
  uint64_t (**v380)(void *, NSObject *, uint64_t);
  uint64_t (**v381)(void *, NSObject *, uint64_t);
  uint64_t (**v382)(void *, id, uint64_t);
  void *v383;
  void *v384;
  MADVideoSafetyClassifier *v385;
  unint64_t v386;
  os_signpost_id_t spid;
  uint64_t v388;
  os_signpost_id_t v389;
  double v390;
  int v391;
  void *v392;
  double v393;
  void *v394;
  void *context;
  void *v396;
  VCPSettlingEffectAnalyzer *v397;
  void *v398;
  void *v399;
  void *v400;
  id v401;
  VCPVideoEmbeddings *v402;
  void *v403;
  VCPAudioVideoEmbeddingFuser *v404;
  VCPVideoHumanActionAnalyzer *v405;
  VCPVideoInterpolator *v406;
  void *v407;
  VCPVideoCNNAnalyzer *v408;
  char v409;
  void *v410;
  id v411;
  id obj;
  unsigned int obja;
  id objb;
  VCPMovieAnalyzer *v415;
  VCPVideoActivityAnalyzer *v416;
  void *v417;
  VCPVideoSceneClassifier *v418;
  uint64_t v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  _OWORD v428[3];
  _OWORD v429[3];
  char v430[48];
  CMTime v431;
  _OWORD v432[3];
  _OWORD v433[3];
  float64x2_t v434;
  __int128 v435;
  __int128 v436;
  _OWORD v437[3];
  _OWORD v438[3];
  _OWORD v439[3];
  _OWORD v440[3];
  _OWORD v441[3];
  _OWORD v442[2];
  __int128 v443;
  _OWORD v444[3];
  _OWORD v445[3];
  _OWORD v446[3];
  _QWORD v447[4];
  VCPVideoInterpolator *v448;
  VCPVideoActivityAnalyzer *v449;
  VCPMovieCurationAnalyzer *v450;
  VCPMovieAnalyzer *v451;
  VCPVideoCNNAnalyzer *v452;
  id v453;
  VCPSettlingEffectAnalyzer *v454;
  MADVideoSafetyClassifier *v455;
  id v456;
  _QWORD v457[4];
  id v458;
  VCPMovieAnalyzer *v459;
  id v460;
  char v461;
  _QWORD aBlock[4];
  VCPVideoInterpolator *v463;
  id v464;
  VCPVideoSceneClassifier *v465;
  id v466;
  VCPVideoCNNHighlightTimeRangePredictor *v467;
  VCPVideoHumanActionAnalyzer *v468;
  id v469;
  id v470;
  VCPVideoPetsActionAnalyzer *v471;
  id v472;
  char v473[24];
  __int128 v474;
  int64_t var3;
  _OWORD v476[3];
  _OWORD v477[3];
  _OWORD v478[3];
  _OWORD v479[3];
  _OWORD v480[3];
  _OWORD v481[3];
  _OWORD v482[3];
  _OWORD v483[3];
  _OWORD v484[3];
  _OWORD v485[3];
  int v486;
  _OWORD v487[3];
  uint64_t v488;
  _QWORD v489[2];
  _QWORD v490[2];
  const __CFString *v491;
  void *v492;
  void *v493;
  const __CFString *v494;
  void *v495;
  _BYTE v496[128];
  _BYTE v497[128];
  _QWORD v498[3];
  uint8_t buf[16];
  __int128 v500;
  __int128 v501;
  uint64_t v502;

  v502 = *MEMORY[0x1E0C80C00];
  v411 = a3;
  v401 = a6;
  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v415 = self;
  v386 = v11 - 1;
  spid = v11;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPMovieAnalyzer_AnalyzeVideoSegment", ", buf, 2u);
  }

  v488 = 0;
  v14 = *(_OWORD *)&a4->var0.var3;
  v487[0] = *(_OWORD *)&a4->var0.var0;
  v487[1] = v14;
  v487[2] = *(_OWORD *)&a4->var1.var1;
  -[VCPMovieAnalyzer processExistingAnalysisForTimeRange:analysisTypes:](self, "processExistingAnalysisForTimeRange:analysisTypes:", v487, &v488);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v488;
  v407 = (void *)v15;
  v394 = (void *)MEMORY[0x1BCCA1B2C](-[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", v488));
  context = (void *)MEMORY[0x1BCCA1B2C]();
  v17 = [VCPVideoEmbeddings alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v402 = -[VCPVideoEmbeddings initWithEmbeddingType:version:](v17, "initWithEmbeddingType:version:", 2, v18);

  v19 = a5 & ~v16;
  v486 = 0;
  if ((v19 & 0x20000000) == 0)
  {
    v406 = 0;
    v417 = 0;
    if ((v19 & 0x4000000000) == 0)
    {
LABEL_6:
      v20 = 0;
LABEL_7:
      v21 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)buf = *(_OWORD *)&a4->var0.var0;
      v500 = v21;
      v501 = *(_OWORD *)&a4->var1.var1;
      goto LABEL_8;
    }
    goto LABEL_25;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v415->_privateResults, "objectForKeyedSubscript:", CFSTR("MetaInterpolatedFrameKey"));
  v385 = (MADVideoSafetyClassifier *)objc_claimAutoreleasedReturnValue();
  if (-[MADVideoSafetyClassifier count](v385, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video has already been FRC processed", buf, 2u);
    }
    v417 = 0;
    v418 = 0;
    v22 = 0;
    obj = 0;
    v396 = 0;
    v397 = 0;
    v405 = 0;
    v406 = 0;
    v23 = 0;
    v399 = 0;
    v400 = 0;
    v416 = 0;
    v398 = 0;
    v403 = 0;
    v404 = 0;
    v408 = 0;
    v388 = 0;
    v25 = -18;
    goto LABEL_15;
  }
  v27 = [VCPVideoInterpolator alloc];
  privateResults = v415->_privateResults;
  -[VCPAsset localIdentifier](v415->_asset, "localIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v406 = -[VCPVideoInterpolator initWithTimestamps:andIdentifier:andTrack:](v27, "initWithTimestamps:andIdentifier:andTrack:", privateResults, v29, v411);

  if (!v406)
  {
    v417 = 0;
    v418 = 0;
    v22 = 0;
    obj = 0;
    v396 = 0;
    v397 = 0;
    v405 = 0;
    v406 = 0;
    v23 = 0;
    v399 = 0;
    v400 = 0;
    v416 = 0;
    v398 = 0;
    v403 = 0;
    v404 = 0;
    v408 = 0;
    v388 = 0;
    v25 = -108;
LABEL_15:
    v391 = v25;
LABEL_16:
    v26 = 6;
LABEL_17:

    goto LABEL_91;
  }
  if (v415->_requestedAnalyses == 0x20000000 && -[VCPVideoInterpolator processAborted](v406, "processAborted"))
  {
    v417 = 0;
    v418 = 0;
    v22 = 0;
    obj = 0;
    v396 = 0;
    v397 = 0;
    v404 = 0;
    v405 = 0;
    v23 = 0;
    v399 = 0;
    v400 = 0;
    v416 = 0;
    v398 = 0;
    v403 = 0;
    v408 = 0;
    v388 = 0;
    v391 = 0;
    goto LABEL_16;
  }
  -[VCPVideoInterpolator adjustedTimeRange](v406, "adjustedTimeRange");
  -[VCPMovieAnalyzer createDecoderForTrack:timerange:forAnalysisTypes:decodedFrameRate:withLossySetting:](v415, "createDecoderForTrack:timerange:forAnalysisTypes:decodedFrameRate:withLossySetting:", v411, buf, v19, &v486, -[VCPVideoInterpolator enableStyle](v406, "enableStyle"));
  v417 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v19 & 0x4000000000) == 0)
  {
    if (v417)
    {
      v20 = 0;
      goto LABEL_28;
    }
    goto LABEL_6;
  }
LABEL_25:
  -[NSMutableDictionary objectForKeyedSubscript:](v415->_analysis, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("VideoStabilizationResults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("attributes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("stabilizationRecipe"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = -[VCPSettlingEffectAnalyzer initWithTimestamps:andTrack:andRecipe:withOptions:]([VCPSettlingEffectAnalyzer alloc], "initWithTimestamps:andTrack:andRecipe:withOptions:", v415->_privateResults, v411, v34, v415->_options);
  if (!v35)
  {
    v22 = 0;
    obj = 0;
    v397 = 0;
    goto LABEL_62;
  }
  if (v417)
  {
    v20 = v35;
    goto LABEL_28;
  }
  v20 = v35;
  if (-[VCPSettlingEffectAnalyzer processAborted](v35, "processAborted"))
    goto LABEL_7;
  -[VCPSettlingEffectAnalyzer adjustedTimeRange](v35, "adjustedTimeRange");
LABEL_8:
  -[VCPMovieAnalyzer createDecoderForTrack:timerange:forAnalysisTypes:decodedFrameRate:withLossySetting:](v415, "createDecoderForTrack:timerange:forAnalysisTypes:decodedFrameRate:withLossySetting:", v411, buf, v19, &v486, 0);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  if (v417)
  {
LABEL_28:
    v397 = v20;
    if ((v19 & 0x880) == 0)
    {
      v37 = 0;
      goto LABEL_35;
    }
    v36 = objc_msgSend(v411, "vcp_orientation");
    if (v411)
      objc_msgSend(v411, "preferredTransform");
    else
      memset(v485, 0, sizeof(v485));
    -[VCPMovieAnalyzer createVideoAnalyzerWithOrientation:preferredTransform:embeddings:](v415, "createVideoAnalyzerWithOrientation:preferredTransform:embeddings:", v36, v485, v402);
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
LABEL_35:
      v403 = (void *)v37;
      if ((v19 & 8) != 0)
      {
        -[NSMutableDictionary vcp_results](v415->_analysis, "vcp_results");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("FacePrintResults"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v484[0] = *MEMORY[0x1E0C9BAA8];
        v484[1] = v41;
        v484[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        +[VCPVideoFaceDetector faceDetectorWithTransform:withExistingFaceprints:tracking:faceDominated:cancel:](VCPVideoFaceDetector, "faceDetectorWithTransform:withExistingFaceprints:tracking:faceDominated:cancel:", v484, v40, -[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto") ^ 1, v415->_faceDominated, v401);
        v38 = objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          v22 = 0;
          obj = 0;
          v396 = 0;
          v405 = 0;
          v23 = 0;
          v399 = 0;
          v400 = 0;
          v418 = 0;
          v416 = 0;
          v398 = 0;
          goto LABEL_89;
        }
      }
      else
      {
        v38 = 0;
      }
      v398 = (void *)v38;
      if ((v19 & 0x8000) != 0)
      {
        if ((int)SocType() < 247 || -[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto"))
        {
          v416 = 0;
        }
        else
        {
          v416 = objc_alloc_init(VCPVideoActivityAnalyzer);
          if (!v416)
          {
            v22 = 0;
            obj = 0;
            v396 = 0;
            v405 = 0;
            v23 = 0;
            v399 = 0;
            v400 = 0;
            v418 = 0;
            v416 = 0;
            goto LABEL_89;
          }
        }
      }
      else
      {
        v416 = 0;
      }
      if ((v19 & 0x4000) != 0)
      {
        v418 = objc_alloc_init(VCPVideoSceneClassifier);
        if (!v418)
        {
          v22 = 0;
          obj = 0;
          v396 = 0;
          v405 = 0;
          v23 = 0;
          v399 = 0;
          v400 = 0;
          v418 = 0;
          goto LABEL_89;
        }
      }
      else
      {
        v418 = 0;
      }
      if ((v19 & 0x1000) != 0)
      {
        v43 = [VCPVideoSaliencyAnalyzer alloc];
        v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v483[0] = *MEMORY[0x1E0C9BAA8];
        v483[1] = v44;
        v483[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v42 = -[VCPVideoSaliencyAnalyzer initWithTransform:](v43, "initWithTransform:", v483);
        if (!v42)
        {
          v22 = 0;
          obj = 0;
          v396 = 0;
          v405 = 0;
          v23 = 0;
          v399 = 0;
          v400 = 0;
          goto LABEL_89;
        }
      }
      else
      {
        v42 = 0;
      }
      v399 = (void *)v42;
      if ((v19 & 0x20000) != 0 && DeviceHasANE())
      {
        v45 = [VCPVideoPetsAnalyzer alloc];
        v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v482[0] = *MEMORY[0x1E0C9BAA8];
        v482[1] = v46;
        v482[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v47 = -[VCPVideoPetsAnalyzer initWithTransform:](v45, "initWithTransform:", v482);
        if (!v47)
        {
          v22 = 0;
          obj = 0;
          v396 = 0;
          v405 = 0;
          v23 = 0;
          v400 = 0;
LABEL_89:
          v404 = 0;
          v408 = 0;
          v388 = 0;
          v24 = -108;
          goto LABEL_90;
        }
      }
      else
      {
        v47 = 0;
      }
      v400 = (void *)v47;
      if ((v19 & 0x2000000000) != 0 && DeviceHasANE())
      {
        v22 = -[VCPVideoPetsActionAnalyzer initWithTimeOfInterest:]([VCPVideoPetsActionAnalyzer alloc], "initWithTimeOfInterest:", 0);
        if (!v22)
        {
          obj = 0;
          v396 = 0;
          v405 = 0;
          v23 = 0;
          goto LABEL_89;
        }
      }
      else
      {
        v22 = 0;
      }
      if ((v19 & 0x40000) != 0)
      {
        v48 = v415->_privateResults;
        if (!v48
          || (-[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("MetaLensSwitchResults")), v49 = (void *)objc_claimAutoreleasedReturnValue(), v50 = objc_msgSend(v49, "count") == 0, v49, v48 = v415->_privateResults, v50))
        {
          obja = 0;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("MetaLensSwitchResults"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("quality"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          obja = objc_msgSend(v53, "BOOLValue");

          v48 = v415->_privateResults;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("MetaLensSwitchResults"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ZoomChangeScore"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v409 = objc_msgSend(v56, "BOOLValue");

        v57 = [VCPMovieCurationAnalyzer alloc];
        v58 = -[NSMutableDictionary vcp_types](v415->_analysis, "vcp_types");
        if (v411)
          objc_msgSend(v411, "preferredTransform");
        else
          memset(v481, 0, sizeof(v481));
        v59 = *(_OWORD *)&a4->var0.var3;
        v480[0] = *(_OWORD *)&a4->var0.var0;
        v480[1] = v59;
        v480[2] = *(_OWORD *)&a4->var1.var1;
        v60 = -[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto");
        -[VCPAsset photoOffsetSeconds](v415->_asset, "photoOffsetSeconds");
        v62 = v61;
        v63 = -[VCPAsset hadFlash](v415->_asset, "hadFlash");
        objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = -[VCPAsset isTimelapse](v415->_asset, "isTimelapse");
        asset = v415->_asset;
        if (asset)
          -[VCPAsset slomoRange](asset, "slomoRange");
        else
          memset(v479, 0, sizeof(v479));
        objc_msgSend(v411, "asset");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v358) = v65;
        LOBYTE(v357) = v409;
        LODWORD(v68) = v62;
        v23 = -[VCPMovieCurationAnalyzer initWithAnalysisTypes:transform:timeRange:isLivePhoto:photoOffset:hadFlash:hadZoom:settlingHadZoom:keyFrameResults:isTimelapse:preferredTimeRange:asset:](v57, "initWithAnalysisTypes:transform:timeRange:isLivePhoto:photoOffset:hadFlash:hadZoom:settlingHadZoom:keyFrameResults:isTimelapse:preferredTimeRange:asset:", v58 | v19, v481, v480, v60, v63, obja, v68, v357, v64, v358, v479, v67);

        if (!v23)
          goto LABEL_88;
        *(float *)&v69 = v415->_maxHighlightDuration;
        -[VCPMovieCurationAnalyzer setMaxHighlightDuration:](v23, "setMaxHighlightDuration:", v69);
      }
      else
      {
        v23 = 0;
      }
      if ((v19 & 0x4000000) == 0)
      {
        v70 = 0;
LABEL_86:
        v396 = (void *)v70;
        if (+[VCPMovieAnalyzer getEnableMovieHumanAction](VCPMovieAnalyzer, "getEnableMovieHumanAction"))
          HasANE = 1;
        else
          HasANE = DeviceHasANE();
        if ((v19 & 0x80040040000) == 0)
          goto LABEL_142;
        if (-[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto"))
        {
          -[VCPAsset faces](v415->_asset, "faces");
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = (void *)MEMORY[0x1E0CB37E8];
          -[VCPAsset photoOffsetSeconds](v415->_asset, "photoOffsetSeconds");
          objc_msgSend(v85, "numberWithFloat:");
          v391 = 0;
          HasANE = 1;
          v383 = (void *)v84;
          v384 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_143;
        }
        if ((v19 & 0x40000000) == 0
          || !-[VCPAsset isMovie](v415->_asset, "isMovie")
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (phAsset = v415->_phAsset) == 0
          || -[PHAsset vcp_quickFaceClassificationDone](phAsset, "vcp_quickFaceClassificationDone"))
        {
LABEL_142:
          v383 = 0;
          v384 = 0;
          v391 = 0;
          goto LABEL_143;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v236 = MEMORY[0x1E0C81028];
          v237 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v236, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Movie analyzer perform VCPPhotosQuickFaceDetection", buf, 2u);
          }

        }
        v410 = (void *)MEMORY[0x1BCCA1B2C]();
        VCPSignPostLog();
        v238 = objc_claimAutoreleasedReturnValue();
        v239 = os_signpost_id_generate(v238);

        VCPSignPostLog();
        v240 = objc_claimAutoreleasedReturnValue();
        v241 = v240;
        if (v239 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v240))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v241, OS_SIGNPOST_INTERVAL_BEGIN, v239, "VCPMovieAnalyzer_Video_VCPPhotosQuickFaceDetection", ", buf, 2u);
        }

        v242 = [VCPPhotosQuickFaceDetectionManager alloc];
        -[PHAsset photoLibrary](v415->_phAsset, "photoLibrary");
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        v244 = -[VCPPhotosQuickFaceDetectionManager initWithPhotoLibrary:](v242, "initWithPhotoLibrary:", v243);

        if (v244)
        {
          v391 = -[VCPPhotosQuickFaceDetectionManager processAsset:](v244, "processAsset:", v415->_phAsset);
          if (!v391)
          {
            VCPSignPostLog();
            v305 = objc_claimAutoreleasedReturnValue();
            v306 = v305;
            if (v239 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v305))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v306, OS_SIGNPOST_INTERVAL_END, v239, "VCPMovieAnalyzer_Video_VCPPhotosQuickFaceDetection", ", buf, 2u);
            }

            v26 = 0;
            v391 = 0;
            v245 = 1;
            goto LABEL_381;
          }
          v245 = 0;
        }
        else
        {
          v245 = 0;
          v391 = -18;
        }
        v26 = 6;
LABEL_381:

        objc_autoreleasePoolPop(v410);
        if ((v245 & 1) == 0)
        {
          v383 = 0;
          v385 = 0;
          obj = 0;
          v404 = 0;
          v405 = 0;
          v408 = 0;
          v388 = 0;

          goto LABEL_295;
        }
        v383 = 0;
        v384 = 0;
LABEL_143:
        if ((v19 & 0x40400000) != 0
          && +[VCPCNNEspressoContext supportGPU](VCPCNNEspressoContext, "supportGPU")
          && !v415->_faceDominated)
        {
          v405 = -[VCPVideoHumanActionAnalyzer initWithTimeOfInterest:phFaces:]([VCPVideoHumanActionAnalyzer alloc], "initWithTimeOfInterest:phFaces:", v384, v383);
          if (!v405)
          {
            v385 = 0;
            obj = 0;
            v405 = 0;
            goto LABEL_243;
          }
        }
        else
        {
          v405 = 0;
        }
        if ((v19 & 0x200000000000) != 0)
        {
          v115 = [VCPVideoCaptionAnalyzer alloc];
          v116 = v486;
          if (v411)
          {
            objc_msgSend(v411, "timeRange");
          }
          else
          {
            HIDWORD(v117) = 0;
            memset(v478, 0, sizeof(v478));
          }
          LODWORD(v117) = v116;
          v140 = -[VCPVideoCaptionAnalyzer initWithModelType:frameRate:timeRange:](v115, "initWithModelType:frameRate:timeRange:", 2, v478, v117);
        }
        else
        {
          if ((v19 & 0x100000000) == 0)
          {
            obj = 0;
LABEL_185:
            v144 = HasANE ^ 1;
            if ((v19 & 0x240040000) == 0)
              v144 = 1;
            if ((v19 & 0x80000000000) == 0 && (v144 & 1) != 0)
            {
              v408 = 0;
              goto LABEL_195;
            }
            v145 = [VCPVideoCNNAnalyzer alloc];
            v146 = v486;
            v147 = -[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto");
            if (v411)
              objc_msgSend(v411, "timeRange");
            else
              memset(v476, 0, sizeof(v476));
            -[VCPAsset photoOffsetSeconds](v415->_asset, "photoOffsetSeconds");
            LODWORD(v149) = v148;
            LODWORD(v150) = v146;
            v408 = -[VCPVideoCNNAnalyzer initWithTimeOfInteret:frameRate:isLivePhoto:phFaces:timeRange:withEmbeddings:requestedAnalyses:photoOffset:](v145, "initWithTimeOfInteret:frameRate:isLivePhoto:phFaces:timeRange:withEmbeddings:requestedAnalyses:photoOffset:", v384, v147, v383, v476, v402, v19, v150, v149);
            if (v408)
            {
LABEL_195:
              if ((~v415->_requestedAnalyses & 0x880000000000) != 0
                || !objc_msgSend((id)objc_opt_class(), "enableAudioVideoFusion"))
              {
                v404 = 0;
              }
              else
              {
                v151 = _os_feature_enabled_impl();
                v152 = [VCPAudioVideoEmbeddingFuser alloc];
                if (v151)
                  v153 = 5;
                else
                  v153 = 4;
                v404 = -[VCPAudioVideoEmbeddingFuser initWithEmbeddingVersion:](v152, "initWithEmbeddingVersion:", v153);
                if (!v404)
                {
                  v385 = 0;
                  v404 = 0;
LABEL_244:
                  v388 = 0;
                  v391 = -108;
                  v26 = 6;
LABEL_294:

LABEL_295:
                  goto LABEL_17;
                }
              }
              if ((v19 & 0x40000000000) != 0)
              {
                v156 = objc_alloc_init(MADVideoSafetyClassifier);
                v154 = v156;
                if (!v156)
                {
                  v385 = 0;
                  v388 = 0;
                  v391 = -108;
                  v26 = 6;
                  goto LABEL_294;
                }
                v474 = *(_OWORD *)&a4->var1.var0;
                var3 = a4->var1.var3;
                v155 = v408;
                -[MADVideoSafetyClassifier configureProcessTimeIntervalFrom:](v156, "configureProcessTimeIntervalFrom:", &v474);
              }
              else
              {
                v154 = 0;
                v155 = v408;
              }
              v376 = v154;
              v157 = !v415->_supportConditionalAnalysis || v418 == 0;
              v158 = !v157;
              if (v155)
              {
                v159 = [VCPVideoCNNHighlightTimeRangePredictor alloc];
                v160 = -[VCPVideoCNNAnalyzer highlightEnabled](v408, "highlightEnabled");
                v161 = -[VCPVideoCNNAnalyzer postInference](v408, "postInference");
                -[VCPVideoCNNAnalyzer minProcessingInterval](v408, "minProcessingInterval");
                v163 = v162;
                -[VCPVideoCNNAnalyzer timeStart](v408, "timeStart");
                LODWORD(v164) = v163;
                v165 = -[VCPVideoCNNHighlightTimeRangePredictor initWithHightlightEnabled:postInference:minProcessingInterval:startTime:](v159, "initWithHightlightEnabled:postInference:minProcessingInterval:startTime:", v160, v161, v473, v164);
              }
              else
              {
                v165 = 0;
              }
              v166 = MEMORY[0x1E0C809B0];
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke;
              aBlock[3] = &unk_1E6B19A10;
              v167 = v401;
              v472 = v167;
              v168 = v406;
              v463 = v168;
              v372 = v398;
              v464 = v372;
              v367 = v418;
              v465 = v367;
              v365 = v399;
              v466 = v365;
              v373 = v165;
              v467 = v373;
              v379 = v405;
              v468 = v379;
              v378 = obj;
              v469 = v378;
              v364 = v400;
              v470 = v364;
              v363 = v22;
              v471 = v363;
              v382 = (uint64_t (**)(void *, id, uint64_t))_Block_copy(aBlock);
              v457[0] = v166;
              v457[1] = 3221225472;
              v457[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_398;
              v457[3] = &unk_1E6B19A38;
              v169 = v167;
              v460 = v169;
              v370 = v403;
              v458 = v370;
              v459 = v415;
              v461 = v158;
              v381 = (uint64_t (**)(void *, NSObject *, uint64_t))_Block_copy(v457);
              v447[0] = v166;
              v447[1] = 3221225472;
              v447[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_404;
              v447[3] = &unk_1E6B19A60;
              v170 = v169;
              v456 = v170;
              v359 = v168;
              v448 = v359;
              v366 = v416;
              v449 = v366;
              v362 = v23;
              v450 = v362;
              v451 = v415;
              v377 = v408;
              v452 = v377;
              v361 = v396;
              v453 = v361;
              v360 = v397;
              v454 = v360;
              v385 = v376;
              v455 = v385;
              v380 = (uint64_t (**)(void *, NSObject *, uint64_t))_Block_copy(v447);
              v374 = (void *)MEMORY[0x1BCCA1B2C]();
              VCPSignPostLog();
              v171 = objc_claimAutoreleasedReturnValue();
              v389 = os_signpost_id_generate(v171);

              VCPSignPostLog();
              v172 = objc_claimAutoreleasedReturnValue();
              v173 = v172;
              if (v389 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v172))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v173, OS_SIGNPOST_INTERVAL_BEGIN, v389, "VCPMovieAnalyzer_AnalyzeVideoSegment_FrameProcessing", ", buf, 2u);
              }

              if (!DeviceHasANE() || (_os_feature_enabled_impl() & 1) == 0)
              {
                v184 = 0;
                v179 = 0;
                v388 = 0;
                while (1)
                {
                  v185 = objc_msgSend(v417, "copyNextSampleBuffer");
                  v186 = v184;

                  v179 = v186;
                  if (v185)
                  {
                    v187 = -[VCPVideoAnalysisPipelineFrameResource initWithSampleBuffer:]([VCPVideoAnalysisPipelineFrameResource alloc], "initWithSampleBuffer:", v185);

                    v184 = v187;
                  }
                  else
                  {
                    v184 = 0;
                    v187 = (VCPVideoAnalysisPipelineFrameResource *)v186;
                  }

                  if ((unint64_t)v186 | (unint64_t)v184)
                    v188 = 0;
                  else
                    v188 = 54;
                  if (v186)
                  {
                    v180 = v382[2](v382, v186, (uint64_t)-[VCPVideoAnalysisPipelineFrameResource frameSampleBuffer](v184, "frameSampleBuffer"));
                    if (v180)
                    {
                      if ((int)MediaAnalysisLogLevel() < 3)
                        goto LABEL_257;
                      v189 = MEMORY[0x1E0C81028];
                      v190 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                      {
                        v191 = (id)objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v191;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock0, bail out.", buf, 0xCu);

                      }
LABEL_255:

                      goto LABEL_257;
                    }
                    v180 = v381[2](v381, v179, (uint64_t)-[VCPVideoAnalysisPipelineFrameResource frameSampleBuffer](v184, "frameSampleBuffer"));
                    if (v180)
                    {
                      if ((int)MediaAnalysisLogLevel() < 3)
                        goto LABEL_257;
                      v192 = MEMORY[0x1E0C81028];
                      v193 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                      {
                        v194 = (id)objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v194;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock1, bail out.", buf, 0xCu);

                      }
                      goto LABEL_255;
                    }
                    v180 = v380[2](v380, v179, (uint64_t)-[VCPVideoAnalysisPipelineFrameResource frameSampleBuffer](v184, "frameSampleBuffer"));
                    if (v180)
                    {
                      if ((int)MediaAnalysisLogLevel() < 3)
                        goto LABEL_257;
                      v195 = MEMORY[0x1E0C81028];
                      v196 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
                      {
                        v197 = (id)objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v197;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock2, bail out.", buf, 0xCu);

                      }
                      goto LABEL_255;
                    }
                    v188 = 0;
                    v388 |= -[NSObject frameFlags](v179, "frameFlags");
                  }
                  if (v188)
                  {
                    if (objc_msgSend(v417, "status") == 2)
                    {

                      goto LABEL_260;
                    }
                    v180 = -19;
LABEL_257:

LABEL_258:
                    v26 = 6;
                    goto LABEL_264;
                  }
                }
              }
              v174 = [VCPVideoAnalysisPipelineManager alloc];
              v175 = _Block_copy(v382);
              v498[0] = v175;
              v176 = _Block_copy(v381);
              v498[1] = v176;
              v177 = _Block_copy(v380);
              v498[2] = v177;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v498, 3);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              v179 = -[VCPVideoAnalysisPipelineManager initWithVideoAnalysisBlocks:videoDecoder:maxBufferedFrames:cancelBlock:](v174, "initWithVideoAnalysisBlocks:videoDecoder:maxBufferedFrames:cancelBlock:", v178, v417, 20, v170);

              v180 = -[NSObject run](v179, "run");
              if (v180)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v181 = MEMORY[0x1E0C81028];
                  v182 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                  {
                    v183 = (id)objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v183;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed on running VCPVideoAnalysisPipelineManager, bail out.", buf, 0xCu);

                  }
                }
                v388 = 0;
                goto LABEL_258;
              }
              v388 = -[NSObject flags](v179, "flags");
LABEL_260:

              VCPSignPostLog();
              v198 = objc_claimAutoreleasedReturnValue();
              v179 = v198;
              if (v389 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v198))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v179, OS_SIGNPOST_INTERVAL_END, v389, "VCPMovieAnalyzer_AnalyzeVideoSegment_FrameProcessing", ", buf, 2u);
              }
              v26 = 0;
              v180 = v391;
LABEL_264:

              objc_autoreleasePoolPop(v374);
              if (v26)
              {
                v391 = v180;
LABEL_293:

                obj = v378;
                v405 = v379;
                v408 = v377;
                goto LABEL_294;
              }
              VCPSignPostLog();
              v199 = objc_claimAutoreleasedReturnValue();
              v375 = os_signpost_id_generate(v199);

              VCPSignPostLog();
              v200 = objc_claimAutoreleasedReturnValue();
              v201 = v200;
              if (v375 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v200))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v201, OS_SIGNPOST_INTERVAL_BEGIN, v375, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", ", buf, 2u);
              }

              if (v372)
              {
                VCPSignPostLog();
                v202 = objc_claimAutoreleasedReturnValue();
                v203 = os_signpost_id_generate(v202);

                VCPSignPostLog();
                v204 = objc_claimAutoreleasedReturnValue();
                v205 = v204;
                if (v203 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v204))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v205, OS_SIGNPOST_INTERVAL_BEGIN, v203, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", ", buf, 2u);
                }

                v206 = *(_OWORD *)&a4->var0.var3;
                v446[0] = *(_OWORD *)&a4->var0.var0;
                v446[1] = v206;
                v446[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v372, "finishAnalysisPass:", v446);
                if (v391)
                  goto LABEL_292;
                objc_msgSend(v372, "results");
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v207);

                VCPSignPostLog();
                v208 = objc_claimAutoreleasedReturnValue();
                v209 = v208;
                if (v203 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v208))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v209, OS_SIGNPOST_INTERVAL_END, v203, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", ", buf, 2u);
                }

              }
              if (v370)
              {
                VCPSignPostLog();
                v210 = objc_claimAutoreleasedReturnValue();
                v211 = os_signpost_id_generate(v210);

                VCPSignPostLog();
                v212 = objc_claimAutoreleasedReturnValue();
                v213 = v212;
                if (v211 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v212))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v213, OS_SIGNPOST_INTERVAL_BEGIN, v211, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", ", buf, 2u);
                }

                v214 = *(_OWORD *)&a4->var0.var3;
                v445[0] = *(_OWORD *)&a4->var0.var0;
                v445[1] = v214;
                v445[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v370, "finishAnalysisPass:", v445);
                if (v391)
                  goto LABEL_292;
                objc_msgSend(v370, "results");
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v215);

                v216 = v415->_privateResults;
                objc_msgSend(v370, "privateResults");
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary addEntriesFromDictionary:](v216, "addEntriesFromDictionary:", v217);

                VCPSignPostLog();
                v218 = objc_claimAutoreleasedReturnValue();
                v219 = v218;
                if (v211 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v218))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v219, OS_SIGNPOST_INTERVAL_END, v211, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", ", buf, 2u);
                }

              }
              if (v418)
              {
                VCPSignPostLog();
                v220 = objc_claimAutoreleasedReturnValue();
                v221 = os_signpost_id_generate(v220);

                VCPSignPostLog();
                v222 = objc_claimAutoreleasedReturnValue();
                v223 = v222;
                if (v221 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v222))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v223, OS_SIGNPOST_INTERVAL_BEGIN, v221, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", ", buf, 2u);
                }

                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("SceneResults"));
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPVideoSceneClassifier setSceneResults:](v367, "setSceneResults:", v224);

                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("QualityResults"));
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPVideoSceneClassifier setQualityResults:](v367, "setQualityResults:", v225);

                v226 = *(_OWORD *)&a4->var0.var3;
                v444[0] = *(_OWORD *)&a4->var0.var0;
                v444[1] = v226;
                v444[2] = *(_OWORD *)&a4->var1.var1;
                v391 = -[VCPVideoSceneClassifier finishAnalysisPass:](v367, "finishAnalysisPass:", v444);
                if (v391)
                {
LABEL_292:
                  v26 = 6;
                  goto LABEL_293;
                }
                -[VCPVideoSceneClassifier results](v367, "results");
                v227 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v227);

                VCPSignPostLog();
                v228 = objc_claimAutoreleasedReturnValue();
                v229 = v228;
                if (v221 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v228))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v229, OS_SIGNPOST_INTERVAL_END, v221, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", ", buf, 2u);
                }

              }
              if (v366)
              {
                VCPSignPostLog();
                v230 = objc_claimAutoreleasedReturnValue();
                v368 = os_signpost_id_generate(v230);

                VCPSignPostLog();
                v231 = objc_claimAutoreleasedReturnValue();
                v232 = v231;
                if (v368 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v231))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v232, OS_SIGNPOST_INTERVAL_BEGIN, v368, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", ", buf, 2u);
                }

                v233 = -[VCPAsset isSlowmo](v415->_asset, "isSlowmo");
                v234 = v415->_asset;
                if (v233)
                  -[VCPAsset slowmoRate](v234, "slowmoRate");
                else
                  -[VCPAsset timelapseRate](v234, "timelapseRate");
                v246 = v235;
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("QualityResults"));
                v392 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
                v247 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("ObstructionResults"));
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("ClassificationResults"));
                v249 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("FineSubjectMotionResults"));
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("FaceResults"));
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v370, "getSceneSwichFrequency");
                -[VCPVideoActivityAnalyzer preProcessQualityResults:interestingnessResults:obstructionResults:classificationResults:fineActionResults:faceResults:sceneSwitchFrequency:](v366, "preProcessQualityResults:interestingnessResults:obstructionResults:classificationResults:fineActionResults:faceResults:sceneSwitchFrequency:", v392, v247, v248, v249, v250, v251);

                v252 = *(_OWORD *)&a4->var0.var3;
                v442[0] = *(_OWORD *)&a4->var0.var0;
                v442[1] = v252;
                v443 = *(_OWORD *)&a4->var1.var1;
                LODWORD(v389) = -[VCPVideoActivityAnalyzer finishAnalysisPass:fpsRate:](v366, "finishAnalysisPass:fpsRate:", v442, COERCE_DOUBLE(__PAIR64__(DWORD1(v443), v246)));
                if ((_DWORD)v389)
                {
                  v26 = 1;
LABEL_319:
                  v391 = v180;
                  goto LABEL_293;
                }
                -[VCPVideoActivityAnalyzer results](v366, "results");
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v253);

                VCPSignPostLog();
                v254 = objc_claimAutoreleasedReturnValue();
                v255 = v254;
                if (v368 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v254))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v255, OS_SIGNPOST_INTERVAL_END, v368, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", ", buf, 2u);
                }

              }
              if (v365)
              {
                VCPSignPostLog();
                v256 = objc_claimAutoreleasedReturnValue();
                v257 = os_signpost_id_generate(v256);

                VCPSignPostLog();
                v258 = objc_claimAutoreleasedReturnValue();
                v259 = v258;
                if (v257 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v258))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v259, OS_SIGNPOST_INTERVAL_BEGIN, v257, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", ", buf, 2u);
                }

                v260 = *(_OWORD *)&a4->var0.var3;
                v441[0] = *(_OWORD *)&a4->var0.var0;
                v441[1] = v260;
                v441[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v365, "finishAnalysisPass:", v441);
                if (v391)
                  goto LABEL_442;
                objc_msgSend(v365, "results");
                v261 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v261);

                VCPSignPostLog();
                v262 = objc_claimAutoreleasedReturnValue();
                v263 = v262;
                if (v257 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v262))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v263, OS_SIGNPOST_INTERVAL_END, v257, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", ", buf, 2u);
                }

              }
              if (v379)
              {
                VCPSignPostLog();
                v264 = objc_claimAutoreleasedReturnValue();
                v265 = os_signpost_id_generate(v264);

                VCPSignPostLog();
                v266 = objc_claimAutoreleasedReturnValue();
                v267 = v266;
                if (v265 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v266))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v267, OS_SIGNPOST_INTERVAL_BEGIN, v265, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", ", buf, 2u);
                }

                v268 = *(_OWORD *)&a4->var0.var3;
                v440[0] = *(_OWORD *)&a4->var0.var0;
                v440[1] = v268;
                v440[2] = *(_OWORD *)&a4->var1.var1;
                v391 = -[VCPVideoHumanActionAnalyzer finishAnalysisPass:](v379, "finishAnalysisPass:", v440);
                if (v391)
                  goto LABEL_442;
                -[VCPVideoHumanActionAnalyzer results](v379, "results");
                v269 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v269);

                v270 = v415->_privateResults;
                -[VCPVideoHumanActionAnalyzer privateResults](v379, "privateResults");
                v271 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary addEntriesFromDictionary:](v270, "addEntriesFromDictionary:", v271);

                VCPSignPostLog();
                v272 = objc_claimAutoreleasedReturnValue();
                v273 = v272;
                if (v265 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v272))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v273, OS_SIGNPOST_INTERVAL_END, v265, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", ", buf, 2u);
                }

              }
              if (v378)
              {
                VCPSignPostLog();
                v274 = objc_claimAutoreleasedReturnValue();
                v275 = os_signpost_id_generate(v274);

                VCPSignPostLog();
                v276 = objc_claimAutoreleasedReturnValue();
                v277 = v276;
                if (v275 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v276))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v277, OS_SIGNPOST_INTERVAL_BEGIN, v275, "VCPMovieAnalyzer_Video_videoCaptionAnalyzer", ", buf, 2u);
                }

                v278 = *(_OWORD *)&a4->var0.var3;
                v439[0] = *(_OWORD *)&a4->var0.var0;
                v439[1] = v278;
                v439[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v378, "finishAnalysisPass:", v439);
                if (v391)
                  goto LABEL_442;
                objc_msgSend(v378, "results");
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v279);

                VCPSignPostLog();
                v280 = objc_claimAutoreleasedReturnValue();
                v281 = v280;
                if (v275 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v280))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v281, OS_SIGNPOST_INTERVAL_END, v275, "VCPMovieAnalyzer_Video_videoCaptionAnalyzer", ", buf, 2u);
                }

              }
              if (v364)
              {
                VCPSignPostLog();
                v282 = objc_claimAutoreleasedReturnValue();
                v283 = os_signpost_id_generate(v282);

                VCPSignPostLog();
                v284 = objc_claimAutoreleasedReturnValue();
                v285 = v284;
                if (v283 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v284))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v285, OS_SIGNPOST_INTERVAL_BEGIN, v283, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", ", buf, 2u);
                }

                v286 = *(_OWORD *)&a4->var0.var3;
                v438[0] = *(_OWORD *)&a4->var0.var0;
                v438[1] = v286;
                v438[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v364, "finishAnalysisPass:", v438);
                if (v391)
                  goto LABEL_442;
                objc_msgSend(v364, "results");
                v287 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v287);

                VCPSignPostLog();
                v288 = objc_claimAutoreleasedReturnValue();
                v289 = v288;
                if (v283 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v288))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v289, OS_SIGNPOST_INTERVAL_END, v283, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", ", buf, 2u);
                }

              }
              if (v363)
              {
                VCPSignPostLog();
                v290 = objc_claimAutoreleasedReturnValue();
                v291 = os_signpost_id_generate(v290);

                VCPSignPostLog();
                v292 = objc_claimAutoreleasedReturnValue();
                v293 = v292;
                if (v291 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v292))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v293, OS_SIGNPOST_INTERVAL_BEGIN, v291, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", ", buf, 2u);
                }

                v294 = *(_OWORD *)&a4->var0.var3;
                v437[0] = *(_OWORD *)&a4->var0.var0;
                v437[1] = v294;
                v437[2] = *(_OWORD *)&a4->var1.var1;
                v391 = -[VCPVideoPetsActionAnalyzer finishAnalysisPass:](v363, "finishAnalysisPass:", v437);
                if (v391)
                  goto LABEL_442;
                -[VCPVideoPetsActionAnalyzer results](v363, "results");
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v295);

                VCPSignPostLog();
                v296 = objc_claimAutoreleasedReturnValue();
                v297 = v296;
                if (v291 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v296))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v297, OS_SIGNPOST_INTERVAL_END, v291, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", ", buf, 2u);
                }

              }
              if (v362)
              {
                VCPSignPostLog();
                v298 = objc_claimAutoreleasedReturnValue();
                v299 = os_signpost_id_generate(v298);

                VCPSignPostLog();
                v300 = objc_claimAutoreleasedReturnValue();
                v301 = v300;
                if (v299 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v300))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v301, OS_SIGNPOST_INTERVAL_BEGIN, v299, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", ", buf, 2u);
                }

                objc_msgSend(v411, "naturalSize");
                v390 = v303;
                v393 = v302;
                if (v411)
                {
                  objc_msgSend(v411, "preferredTransform");
                  v371 = v434;
                  v304 = v435;
                }
                else
                {
                  v435 = 0u;
                  v436 = 0u;
                  v304 = 0uLL;
                  v371 = 0u;
                  v434 = 0u;
                }
                *(_OWORD *)v369 = v304;
                -[NSMutableDictionary vcp_results](v415->_analysis, "vcp_results");
                v307 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPVideoCNNAnalyzer privateResults](v377, "privateResults");
                v308 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v372, "faceRanges");
                v309 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPMovieCurationAnalyzer loadVideoAnalysisResults:audioAnalysisResults:videoCNNResults:andFaceRanges:frameSize:](v362, "loadVideoAnalysisResults:audioAnalysisResults:videoCNNResults:andFaceRanges:frameSize:", v407, v307, v308, v309, vabsq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)v369, v390), v371, v393)));

                v391 = -[VCPMovieCurationAnalyzer generateMovieCurations](v362, "generateMovieCurations");
                if (v391)
                  goto LABEL_442;
                -[VCPMovieCurationAnalyzer results](v362, "results");
                v310 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v310);

                VCPSignPostLog();
                v311 = objc_claimAutoreleasedReturnValue();
                v312 = v311;
                if (v299 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v311))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v312, OS_SIGNPOST_INTERVAL_END, v299, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", ", buf, 2u);
                }

              }
              if (v361)
              {
                VCPSignPostLog();
                v313 = objc_claimAutoreleasedReturnValue();
                v314 = os_signpost_id_generate(v313);

                VCPSignPostLog();
                v315 = objc_claimAutoreleasedReturnValue();
                v316 = v315;
                if (v314 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v315))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v316, OS_SIGNPOST_INTERVAL_BEGIN, v314, "VCPMovieAnalyzer_Video_VCPVideoStabilizer", ", buf, 2u);
                }

                v391 = objc_msgSend(v361, "convertAnalysisResult");
                if (v391)
                  goto LABEL_442;
                v317 = *(_OWORD *)&a4->var0.var3;
                v433[0] = *(_OWORD *)&a4->var0.var0;
                v433[1] = v317;
                v433[2] = *(_OWORD *)&a4->var1.var1;
                v391 = objc_msgSend(v361, "finishAnalysisPass:", v433);
                if (v391)
                  goto LABEL_442;
                objc_msgSend(v361, "results");
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v318);

                VCPSignPostLog();
                v319 = objc_claimAutoreleasedReturnValue();
                v320 = v319;
                if (v314 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v319))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v320, OS_SIGNPOST_INTERVAL_END, v314, "VCPMovieAnalyzer_Video_VCPVideoStabilizer", ", buf, 2u);
                }

              }
              if (v359 && !-[VCPVideoInterpolator processAborted](v359, "processAborted"))
              {
                VCPSignPostLog();
                v321 = objc_claimAutoreleasedReturnValue();
                v322 = os_signpost_id_generate(v321);

                VCPSignPostLog();
                v323 = objc_claimAutoreleasedReturnValue();
                v324 = v323;
                if (v322 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v323))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v324, OS_SIGNPOST_INTERVAL_BEGIN, v322, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", ", buf, 2u);
                }

                v325 = *(_OWORD *)&a4->var0.var3;
                v432[0] = *(_OWORD *)&a4->var0.var0;
                v432[1] = v325;
                v432[2] = *(_OWORD *)&a4->var1.var1;
                v391 = -[VCPVideoInterpolator finishAnalysisPass:](v359, "finishAnalysisPass:", v432);
                if (v391)
                  goto LABEL_442;
                -[VCPVideoInterpolator results](v359, "results");
                v326 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v326);

                VCPSignPostLog();
                v327 = objc_claimAutoreleasedReturnValue();
                v328 = v327;
                if (v322 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v327))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v328, OS_SIGNPOST_INTERVAL_END, v322, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", ", buf, 2u);
                }

              }
              if (v360)
              {
                VCPSignPostLog();
                v329 = objc_claimAutoreleasedReturnValue();
                v330 = os_signpost_id_generate(v329);

                VCPSignPostLog();
                v331 = objc_claimAutoreleasedReturnValue();
                v332 = v331;
                if (v330 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v331))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v332, OS_SIGNPOST_INTERVAL_BEGIN, v330, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", ", buf, 2u);
                }

                if (!-[VCPSettlingEffectAnalyzer processAborted](v360, "processAborted"))
                {
                  objc_msgSend(v411, "vcp_fullFrameSize");
                  v347 = v346;
                  v349 = v348;
                  *(_DWORD *)buf = 0;
                  -[NSDictionary objectForKeyedSubscript:](v415->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
                  v350 = (void *)objc_claimAutoreleasedReturnValue();
                  v351 = v350 == 0;

                  if (v351)
                  {
                    if (v347 >= v349)
                      v356 = v347;
                    else
                      v356 = v349;
                    v355 = -[VCPAsset imageWithPreferredDimension:orientation:](v415->_asset, "imageWithPreferredDimension:orientation:", (unint64_t)v356, buf);
                  }
                  else
                  {
                    objc_msgSend(v411, "asset");
                    v352 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSDictionary objectForKeyedSubscript:](v415->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
                    v353 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                    CMTimeMakeFromDictionary(&v431, v353);
                    if (v347 >= v349)
                      v354 = v347;
                    else
                      v354 = v349;
                    v355 = (__CVBuffer *)objc_msgSend(v352, "vcp_frameAtTimeStamp:withMaxDimension:", &v431, (unint64_t)v354);

                  }
                  -[VCPSettlingEffectAnalyzer adjustedTimeRange](v360, "adjustedTimeRange");
                  v391 = -[VCPSettlingEffectAnalyzer finishAnalysisPass:withStillImageBuffer:](v360, "finishAnalysisPass:withStillImageBuffer:", v430, v355);
                  if (v391)
                    goto LABEL_442;
                  if (v355)
                    CFRelease(v355);
                }
                -[VCPSettlingEffectAnalyzer results](v360, "results");
                v333 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v333);

                VCPSignPostLog();
                v334 = objc_claimAutoreleasedReturnValue();
                v335 = v334;
                if (v330 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v334))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v335, OS_SIGNPOST_INTERVAL_END, v330, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", ", buf, 2u);
                }

              }
              if (!v385)
              {
LABEL_428:
                VCPSignPostLog();
                v344 = objc_claimAutoreleasedReturnValue();
                v345 = v344;
                if (v375 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v344))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v345, OS_SIGNPOST_INTERVAL_END, v375, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", ", buf, 2u);
                }

                v26 = 0;
                LODWORD(v389) = 0;
                goto LABEL_319;
              }
              VCPSignPostLog();
              v336 = objc_claimAutoreleasedReturnValue();
              v337 = os_signpost_id_generate(v336);

              VCPSignPostLog();
              v338 = objc_claimAutoreleasedReturnValue();
              v339 = v338;
              if (v337 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v338))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v339, OS_SIGNPOST_INTERVAL_BEGIN, v337, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", ", buf, 2u);
              }

              v340 = *(_OWORD *)&a4->var0.var3;
              v429[0] = *(_OWORD *)&a4->var0.var0;
              v429[1] = v340;
              v429[2] = *(_OWORD *)&a4->var1.var1;
              v391 = -[MADVideoSafetyClassifier finishAnalysisPass:](v385, "finishAnalysisPass:", v429);
              if (!v391)
              {
                -[MADVideoSafetyClassifier results](v385, "results");
                v341 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v341);

                VCPSignPostLog();
                v342 = objc_claimAutoreleasedReturnValue();
                v343 = v342;
                if (v337 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v342))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v343, OS_SIGNPOST_INTERVAL_END, v337, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", ", buf, 2u);
                }

                goto LABEL_428;
              }
LABEL_442:
              LODWORD(v389) = 0;
              v26 = 6;
              goto LABEL_293;
            }
            v385 = 0;
LABEL_243:
            v404 = 0;
            v408 = 0;
            goto LABEL_244;
          }
          v137 = [VCPVideoCaptionAnalyzer alloc];
          v138 = v486;
          if (v411)
          {
            objc_msgSend(v411, "timeRange");
          }
          else
          {
            HIDWORD(v139) = 0;
            memset(v477, 0, sizeof(v477));
          }
          LODWORD(v139) = v138;
          v140 = -[VCPVideoCaptionAnalyzer initWithModelType:frameRate:timeRange:](v137, "initWithModelType:frameRate:timeRange:", 1, v477, v139);
        }
        obj = (id)v140;
        if (!v140)
        {
          v385 = 0;
          obj = 0;
          goto LABEL_243;
        }
        goto LABEL_185;
      }
      +[VCPVideoStabilizer videoStabilizerforAnalysisType:withMetadata:sourceSize:cropRect:](VCPVideoStabilizer, "videoStabilizerforAnalysisType:withMetadata:sourceSize:cropRect:", 0x4000000, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v70 = objc_claimAutoreleasedReturnValue();
      if (v70)
        goto LABEL_86;
LABEL_88:
      obj = 0;
      v396 = 0;
      v405 = 0;
      goto LABEL_89;
    }
    v22 = 0;
    obj = 0;
LABEL_62:
    v396 = 0;
    v405 = 0;
    v23 = 0;
    v399 = 0;
    v400 = 0;
    v418 = 0;
    v416 = 0;
    v398 = 0;
    v403 = 0;
    goto LABEL_89;
  }
  v396 = 0;
  v397 = v20;
  v417 = 0;
  v418 = 0;
  v22 = 0;
  obj = 0;
  v404 = 0;
  v405 = 0;
  v23 = 0;
  v399 = 0;
  v400 = 0;
  v416 = 0;
  v398 = 0;
  v403 = 0;
  v408 = 0;
  v388 = 0;
  v24 = -18;
LABEL_90:
  v391 = v24;
  v26 = 6;
LABEL_91:

  objc_autoreleasePoolPop(context);
  if (v26)
  {
LABEL_92:
    v72 = v391;
    goto LABEL_164;
  }
  if (v408)
  {
    VCPSignPostLog();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = os_signpost_id_generate(v73);

    VCPSignPostLog();
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v74, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", ", buf, 2u);
    }

    VCPSignPostLog();
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = os_signpost_id_generate(v77);

    VCPSignPostLog();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v80, OS_SIGNPOST_INTERVAL_BEGIN, v78, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", ", buf, 2u);
    }

    -[NSMutableDictionary vcp_results](v415->_analysis, "vcp_results");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("VoiceResults"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[VCPVideoCNNAnalyzer loadAnalysisResults:audioResults:](v408, "loadAnalysisResults:audioResults:", v407, v82);

    if (v72
      || (v83 = *(_OWORD *)&a4->var0.var3,
          v428[0] = *(_OWORD *)&a4->var0.var0,
          v428[1] = v83,
          v428[2] = *(_OWORD *)&a4->var1.var1,
          (v72 = -[VCPVideoCNNAnalyzer finishAnalysisPass:](v408, "finishAnalysisPass:", v428)) != 0))
    {
      v26 = 6;
      goto LABEL_164;
    }
    -[VCPVideoCNNAnalyzer results](v408, "results");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v407, "addEntriesFromDictionary:", v86);

    VCPSignPostLog();
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = v87;
    if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v88, OS_SIGNPOST_INTERVAL_END, v78, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", ", buf, 2u);
    }

    VCPSignPostLog();
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v90, OS_SIGNPOST_INTERVAL_END, v74, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", ", buf, 2u);
    }

  }
  v91 = !-[VCPAsset isLivePhoto](v415->_asset, "isLivePhoto");
  if ((v19 & 0x200000000000) == 0)
    LOBYTE(v91) = 1;
  if ((v91 & 1) == 0)
  {
    -[VCPVideoCNNAnalyzer results](v408, "results");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93 == 0;

    v96 = 0.0;
    if (!v94)
    {
      v426 = 0u;
      v427 = 0u;
      v424 = 0u;
      v425 = 0u;
      -[VCPVideoCNNAnalyzer results](v408, "results");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
      objb = (id)objc_claimAutoreleasedReturnValue();

      v98 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v424, v497, 16);
      if (v98)
      {
        v419 = *(_QWORD *)v425;
        do
        {
          for (i = 0; i != v98; ++i)
          {
            if (*(_QWORD *)v425 != v419)
              objc_enumerationMutation(objb);
            objc_msgSend(*(id *)(*((_QWORD *)&v424 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("humanActions"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v101, "allKeys");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v422 = 0u;
            v423 = 0u;
            v420 = 0u;
            v421 = 0u;
            v103 = v102;
            v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v420, v496, 16);
            if (v104)
            {
              v105 = *(_QWORD *)v421;
              do
              {
                for (j = 0; j != v104; ++j)
                {
                  if (*(_QWORD *)v421 != v105)
                    objc_enumerationMutation(v103);
                  v107 = *(void **)(*((_QWORD *)&v420 + 1) + 8 * j);
                  if (objc_msgSend(v107, "intValue"))
                  {
                    objc_msgSend(v101, "objectForKeyedSubscript:", v107);
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "floatValue");
                    v110 = v109 > v96;

                    if (v110)
                    {
                      objc_msgSend(v101, "objectForKeyedSubscript:", v107);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "floatValue");
                      v96 = v112;

                    }
                  }
                }
                v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v420, v496, 16);
              }
              while (v104);
            }

          }
          v98 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v424, v497, 16);
        }
        while (v98);

        if (v96 > 0.1)
        {
          v113 = 1;
LABEL_154:
          v494 = CFSTR("VideoCaptionPreferenceResults");
          v491 = CFSTR("attributes");
          v489[0] = CFSTR("videoCaptionPreferenceScore");
          *(float *)&v95 = v96;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v490[0] = v118;
          v489[1] = CFSTR("videoCaptionPreference");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v113);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v490[1] = v119;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v490, v489, 2);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v492 = v120;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v492, &v491, 1);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v493 = v121;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v493, 1);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v495 = v122;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v495, &v494, 1);
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v407, "addEntriesFromDictionary:", v123);
          goto LABEL_155;
        }
      }
      else
      {

      }
    }
    v113 = 0;
    goto LABEL_154;
  }
LABEL_155:
  v72 = v391;
  if (v404)
  {
    VCPSignPostLog();
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = os_signpost_id_generate(v124);

    VCPSignPostLog();
    v126 = objc_claimAutoreleasedReturnValue();
    v127 = v126;
    if (v125 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v126))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v127, OS_SIGNPOST_INTERVAL_BEGIN, v125, "VCPMovieAnalyzer_Video_VCPAudioVideoEmbeddingFuser", ", buf, 2u);
    }

    -[NSMutableDictionary vcp_results](v415->_analysis, "vcp_results");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("AudioEmbeddingResults"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = -[VCPAudioVideoEmbeddingFuser loadAudioEmbeddingResults:andVideoEmbeddingResults:](v404, "loadAudioEmbeddingResults:andVideoEmbeddingResults:", v129, v130);

    if (v131)
    {
      v26 = 1;
      v72 = v391;
      LODWORD(v389) = v131;
    }
    else
    {
      v132 = -[VCPAudioVideoEmbeddingFuser fuse:](v404, "fuse:", v401);
      v72 = v391;
      if (!v132)
      {
        -[VCPAudioVideoEmbeddingFuser results](v404, "results");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v407, "addEntriesFromDictionary:", v141);

        VCPSignPostLog();
        v142 = objc_claimAutoreleasedReturnValue();
        v143 = v142;
        if (v125 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v143, OS_SIGNPOST_INTERVAL_END, v125, "VCPMovieAnalyzer_Video_VCPAudioVideoEmbeddingFuser", ", buf, 2u);
        }

        v26 = 0;
        goto LABEL_92;
      }
      v26 = 1;
      LODWORD(v389) = v132;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_164:

  v133 = v407;
  objc_autoreleasePoolPop(v394);
  if (v26 == 6)
  {
LABEL_170:
    LODWORD(v389) = v72;
    goto LABEL_171;
  }
  if (!v26)
  {
    -[VCPMovieAnalyzer postProcessAutoPlayable:](v415, "postProcessAutoPlayable:", v407);
    -[NSMutableDictionary vcp_addFlags:](v415->_analysis, "vcp_addFlags:", v388);
    -[NSMutableDictionary vcp_appendResults:](v415->_analysis, "vcp_appendResults:", v407);
    VCPSignPostLog();
    v134 = objc_claimAutoreleasedReturnValue();
    v135 = v134;
    if (v386 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v135, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer_AnalyzeVideoSegment", ", buf, 2u);
    }

    v133 = v407;
    goto LABEL_170;
  }
LABEL_171:

  return v389;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  __CVBuffer *ImageBuffer;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  __int128 v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  NSObject *v74;
  __int128 v76;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  _BYTE v82[48];
  CMTimeRange range2;
  CMTimeRange range1;
  CMTime v85;
  CMTime v86;
  CMTime v87;
  _OWORD v88[3];
  CMTime v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CMTime v93;
  CMTime v94;
  CMTime v95;
  CMTime v96;
  CMTime v97;
  CMTime v98;
  uint64_t v99;
  CMTime v100;
  CMTime buf;
  CMTime v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock0", ", (uint8_t *)&buf, 2u);
  }

  v99 = 0;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 104) + 16))() & 1) != 0)
  {
    v8 = 4294967168;
    goto LABEL_85;
  }
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_84;
    LODWORD(v102.value) = 138412290;
    *(CMTimeValue *)((char *)&v102.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock0]");
    v71 = MEMORY[0x1E0C81028];
    v72 = "%@ Invalid currFrameResource.";
    goto LABEL_83;
  }
  v9 = (opaqueCMSampleBuffer *)objc_msgSend(v3, "frameSampleBuffer");
  v10 = v9;
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_84;
    LODWORD(v102.value) = 138412290;
    *(CMTimeValue *)((char *)&v102.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock0]");
    v71 = MEMORY[0x1E0C81028];
    v72 = "%@ Invalid frameSampleBuffer.";
LABEL_83:
    _os_log_impl(&dword_1B6C4A000, v71, OS_LOG_TYPE_ERROR, v72, (uint8_t *)&v102, 0xCu);
LABEL_84:
    v8 = 4294967278;
    goto LABEL_85;
  }
  CMSampleBufferGetPresentationTimeStamp(&v102, v9);
  buf = v102;
  CMSampleBufferGetDuration(&v102, v10);
  v100 = v102;
  ImageBuffer = CMSampleBufferGetImageBuffer(v10);
  v99 = objc_msgSend(v3, "frameFlags");
  if (!*(_QWORD *)(a1 + 32))
  {
    v8 = CVPixelBufferFillExtendedPixels(ImageBuffer);
    if ((_DWORD)v8)
      goto LABEL_89;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", ", (uint8_t *)&v102, 2u);
    }

    v16 = *(void **)(a1 + 40);
    v98 = buf;
    v97 = v100;
    objc_msgSend(v3, "frameStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v16, "analyzeFrame:timestamp:duration:frameStats:flags:", ImageBuffer, &v98, &v97, v17, &v99);

    if ((_DWORD)v8)
      goto LABEL_85;
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v13, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", ", (uint8_t *)&v102, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 48))
  {
    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", ", (uint8_t *)&v102, 2u);
    }

    v24 = *(void **)(a1 + 48);
    v96 = buf;
    v95 = v100;
    v8 = objc_msgSend(v24, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v96, &v95, &v99);
    if ((_DWORD)v8)
      goto LABEL_85;
    objc_msgSend(*(id *)(a1 + 48), "frameScenes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSceneAnalysisResults:", v25);

    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v21, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", ", (uint8_t *)&v102, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 56))
  {
    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_id_generate(v28);

    VCPSignPostLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", ", (uint8_t *)&v102, 2u);
    }

    v32 = *(void **)(a1 + 56);
    v94 = buf;
    v93 = v100;
    v8 = objc_msgSend(v32, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v94, &v93, &v99);
    if ((_DWORD)v8)
      goto LABEL_85;
    VCPSignPostLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v29, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", ", (uint8_t *)&v102, 2u);
    }

  }
  v35 = *(void **)(a1 + 64);
  if (v35)
  {
    v89 = buf;
    objc_msgSend(v35, "timeRangeAtTime:", &v89);
    v88[0] = v90;
    v88[1] = v91;
    v88[2] = v92;
    objc_msgSend(v3, "setPredictedTimeRange:", v88);
    v36 = *(void **)(a1 + 64);
    v87 = buf;
    objc_msgSend(v36, "updateForTime:", &v87);
  }
  if (*(_QWORD *)(a1 + 72))
  {
    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_signpost_id_generate(v37);

    VCPSignPostLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

    v41 = *(void **)(a1 + 72);
    v86 = buf;
    v85 = v100;
    objc_msgSend(v3, "frameStats");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v41, "analyzeFrame:timestamp:duration:frameStats:flags:", ImageBuffer, &v86, &v85, v42, &v99);

    if ((_DWORD)v8)
      goto LABEL_85;
    objc_msgSend(v3, "predictedTimeRange");
    v43 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&range2.start.epoch = v43;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    if (!CMTimeRangeEqual(&range1, &range2))
    {
      v44 = *(void **)(a1 + 72);
      objc_msgSend(v3, "predictedTimeRange");
      objc_msgSend(v44, "clipResults:", v82);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setActionAnalysisResults:", v45);

    }
    VCPSignPostLog();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v47, OS_SIGNPOST_INTERVAL_END, v38, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 80))
  {
    VCPSignPostLog();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_signpost_id_generate(v48);

    VCPSignPostLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VCPMovieAnalyzer_Video_VCPVideoCaptionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

    v52 = *(void **)(a1 + 80);
    v81 = buf;
    v80 = v100;
    v8 = objc_msgSend(v52, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v81, &v80, &v99);
    if ((_DWORD)v8)
      goto LABEL_85;
    VCPSignPostLog();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v54, OS_SIGNPOST_INTERVAL_END, v49, "VCPMovieAnalyzer_Video_VCPVideoCaptionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 88))
  {
    VCPSignPostLog();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_signpost_id_generate(v55);

    VCPSignPostLog();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", ", (uint8_t *)&v102, 2u);
    }

    v59 = *(void **)(a1 + 88);
    v79 = buf;
    v78 = v100;
    objc_msgSend(v3, "frameStats");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v59, "analyzeFrame:withTimestamp:andDuration:flags:frameStats:", ImageBuffer, &v79, &v78, &v99, v60);

    if ((_DWORD)v8)
      goto LABEL_85;
    VCPSignPostLog();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v62, OS_SIGNPOST_INTERVAL_END, v56, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", ", (uint8_t *)&v102, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 96))
  {
    VCPSignPostLog();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = os_signpost_id_generate(v63);

    VCPSignPostLog();
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

    v67 = *(void **)(a1 + 96);
    v77 = buf;
    objc_msgSend(v3, "frameStats", *(_OWORD *)&v100.value, v100.epoch);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v67, "analyzeFrame:timestamp:duration:frameStats:flags:", ImageBuffer, &v77, &v76, v68, &v99);

    if ((_DWORD)v8)
      goto LABEL_85;
    VCPSignPostLog();
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(v102.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v70, OS_SIGNPOST_INTERVAL_END, v64, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", ", (uint8_t *)&v102, 2u);
    }

  }
  objc_msgSend(v3, "setFrameFlags:", v99);
  v8 = 0;
LABEL_85:
  VCPSignPostLog();
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    LOWORD(v102.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v74, OS_SIGNPOST_INTERVAL_END, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock0", ", (uint8_t *)&v102, 2u);
  }

LABEL_89:
  return v8;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_398(uint64_t a1, void *a2, opaqueCMSampleBuffer *a3)
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  opaqueCMSampleBuffer *v11;
  opaqueCMSampleBuffer *v12;
  CVImageBufferRef ImageBuffer;
  uint64_t v14;
  CVImageBufferRef v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v41;
  CMTimeRange range2;
  CMTimeRange range1;
  CMTime v44;
  CMTime v45;
  uint64_t v46;
  CMTime v47;
  CMTime buf;
  CMTime v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock1", ", (uint8_t *)&buf, 2u);
  }

  v46 = 0;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
  {
    v10 = 4294967168;
    goto LABEL_40;
  }
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    LODWORD(v49.value) = 138412290;
    *(CMTimeValue *)((char *)&v49.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock1]");
    v16 = MEMORY[0x1E0C81028];
    v17 = "%@ Invalid currFrameResource.";
    goto LABEL_18;
  }
  v11 = (opaqueCMSampleBuffer *)objc_msgSend(v5, "frameSampleBuffer");
  v12 = v11;
  if (!v11)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    LODWORD(v49.value) = 138412290;
    *(CMTimeValue *)((char *)&v49.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock1]");
    v16 = MEMORY[0x1E0C81028];
    v17 = "%@ Invalid frameSampleBuffer.";
LABEL_18:
    _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v49, 0xCu);
LABEL_19:
    v10 = 4294967278;
    goto LABEL_40;
  }
  CMSampleBufferGetPresentationTimeStamp(&v49, v11);
  buf = v49;
  CMSampleBufferGetDuration(&v49, v12);
  v47 = v49;
  ImageBuffer = CMSampleBufferGetImageBuffer(v12);
  v14 = objc_msgSend(v5, "frameFlags");
  v46 = v14;
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_39:
    objc_msgSend(v5, "setFrameFlags:", v14);
    v10 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isSlowmo", v14))
  {
    if (a3)
      v15 = CMSampleBufferGetImageBuffer(a3);
    else
      v15 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setNextCaptureFrame:", v15);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sceneAnalysisResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepareVideoAnalysisByScenes:", v19);

  }
  v20 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v20 + 56) && objc_msgSend(*(id *)(v20 + 32), "isLivePhoto"))
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v21 + 57))
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(v21 + 32), "scenes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "prepareLivePhotoAnalysisByScenes:", v23);

      v21 = *(_QWORD *)(a1 + 40);
    }
    v24 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(v21 + 32), "scenes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prepareVideoAnalysisByScenes:", v25);

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 1;
  }
  +[VCPSaliencyRegion salientRegionsFromPixelBuffer:](VCPSaliencyRegion, "salientRegionsFromPixelBuffer:", ImageBuffer);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPSaliencyRegion attachSalientRegions:toPixelBuffer:](VCPSaliencyRegion, "attachSalientRegions:toPixelBuffer:", v26, ImageBuffer);

  VCPSignPostLog();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_signpost_id_generate(v27);

  VCPSignPostLog();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    LOWORD(v49.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", ", (uint8_t *)&v49, 2u);
  }

  v31 = *(void **)(a1 + 32);
  v45 = buf;
  v44 = v47;
  objc_msgSend(v5, "frameStats");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v31, "analyzeFrame:timestamp:duration:frameStats:flags:cancel:", ImageBuffer, &v45, &v44, v32, &v46, *(_QWORD *)(a1 + 48));

  if (!(_DWORD)v10)
  {
    objc_msgSend(v5, "predictedTimeRange");
    v33 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&range2.start.epoch = v33;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    if (!CMTimeRangeEqual(&range1, &range2))
    {
      v34 = *(void **)(a1 + 32);
      objc_msgSend(v5, "predictedTimeRange");
      objc_msgSend(v34, "clipResults:", &v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFullAnalysisResults:", v35);

    }
    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      LOWORD(v49.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v28, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", ", (uint8_t *)&v49, 2u);
    }

    v14 = v46;
    goto LABEL_39;
  }
LABEL_40:
  VCPSignPostLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(v49.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v39, OS_SIGNPOST_INTERVAL_END, v7, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock1", ", (uint8_t *)&v49, 2u);
  }

  return v10;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_404(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  os_signpost_id_t v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  os_signpost_id_t v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  NSObject *v70;
  NSObject *v71;
  CVImageBufferRef ImageBuffer;
  CMTime v74;
  CMTime v75;
  CMTime v76;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime v82;
  CMTime v83;
  CMTime v84;
  _BYTE v85[48];
  CMTime v86;
  CMTime v87;
  CMTime v88;
  CMTime v89;
  uint64_t v90;
  CMTime v91;
  CMTime buf;
  CMTime v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock2", ", (uint8_t *)&buf, 2u);
  }

  v90 = 0;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 96) + 16))())
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
      objc_msgSend(v8, "setCancelled:", 1);
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 16))() & 1) != 0)
  {
    v9 = 4294967168;
    goto LABEL_90;
  }
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_89;
    LODWORD(v93.value) = 138412290;
    *(CMTimeValue *)((char *)&v93.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock2]");
    v68 = MEMORY[0x1E0C81028];
    v69 = "%@ Invalid currFrameResource.";
    goto LABEL_88;
  }
  v10 = (opaqueCMSampleBuffer *)objc_msgSend(v3, "frameSampleBuffer");
  v11 = v10;
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_89;
    LODWORD(v93.value) = 138412290;
    *(CMTimeValue *)((char *)&v93.value + 4) = (CMTimeValue)CFSTR("[pipelineBlock2]");
    v68 = MEMORY[0x1E0C81028];
    v69 = "%@ Invalid frameSampleBuffer.";
LABEL_88:
    _os_log_impl(&dword_1B6C4A000, v68, OS_LOG_TYPE_ERROR, v69, (uint8_t *)&v93, 0xCu);
LABEL_89:
    v9 = 4294967278;
    goto LABEL_90;
  }
  CMSampleBufferGetPresentationTimeStamp(&v93, v10);
  buf = v93;
  CMSampleBufferGetDuration(&v93, v11);
  v91 = v93;
  ImageBuffer = CMSampleBufferGetImageBuffer(v11);
  v90 = objc_msgSend(v3, "frameFlags");
  if (*(_QWORD *)(a1 + 40))
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", ", (uint8_t *)&v93, 2u);
    }

    v16 = *(void **)(a1 + 40);
    v89 = buf;
    v88 = v91;
    objc_msgSend(v3, "frameStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v16, "analyzeFrame:timestamp:duration:frameStats:flags:", ImageBuffer, &v89, &v88, v17, &v90);

    if ((_DWORD)v9)
      goto LABEL_90;
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v13, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", ", (uint8_t *)&v93, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 48))
  {
    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", ", (uint8_t *)&v93, 2u);
    }

    v24 = *(void **)(a1 + 48);
    v87 = buf;
    v86 = v91;
    objc_msgSend(v3, "frameStats");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "photoOffsetSeconds");
    v9 = objc_msgSend(v24, "analyzeKeyFrame:timestamp:duration:frameStats:flags:photoOffset:", ImageBuffer, &v87, &v86, v25, &v90);

    if ((_DWORD)v9)
      goto LABEL_90;
    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v21, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", ", (uint8_t *)&v93, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 64))
  {
    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_id_generate(v28);

    VCPSignPostLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", ", (uint8_t *)&v93, 2u);
    }

    v32 = *(void **)(a1 + 64);
    objc_msgSend(v3, "fullAnalysisResults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionAnalysisResults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictedTimeRange");
    v84 = buf;
    v9 = objc_msgSend(v32, "loadFullAnalysisResults:actionAnalysisResults:predictedTimeRange:timestamp:", v33, v34, v85, &v84);

    if ((_DWORD)v9)
      goto LABEL_90;
    v35 = *(void **)(a1 + 64);
    v83 = buf;
    v82 = v91;
    v9 = objc_msgSend(v35, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v83, &v82, &v90);
    if ((_DWORD)v9)
      goto LABEL_90;
    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v29, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", ", (uint8_t *)&v93, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 72))
  {
    VCPSignPostLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_signpost_id_generate(v38);

    VCPSignPostLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "VCPMovieAnalyzer_Video_VCPVideoStabilizerPixel", ", (uint8_t *)&v93, 2u);
    }

    v42 = *(void **)(a1 + 72);
    v81 = buf;
    v80 = v91;
    v9 = objc_msgSend(v42, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v81, &v80, &v90);
    if ((_DWORD)v9)
      goto LABEL_90;
    VCPSignPostLog();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v44, OS_SIGNPOST_INTERVAL_END, v39, "VCPMovieAnalyzer_Video_VCPVideoStabilizerPixel", ", (uint8_t *)&v93, 2u);
    }

  }
  v45 = *(void **)(a1 + 32);
  if (v45 && (objc_msgSend(v45, "processAborted") & 1) == 0)
  {
    VCPSignPostLog();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_signpost_id_generate(v46);

    VCPSignPostLog();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", ", (uint8_t *)&v93, 2u);
    }

    v50 = *(void **)(a1 + 32);
    v79 = buf;
    v78 = v91;
    v9 = objc_msgSend(v50, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v79, &v78, &v90);
    if ((_DWORD)v9)
      goto LABEL_90;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) == 0x20000000
      && (objc_msgSend(*(id *)(a1 + 32), "processAborted") & 1) != 0)
    {
      goto LABEL_81;
    }
    VCPSignPostLog();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v52, OS_SIGNPOST_INTERVAL_END, v47, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", ", (uint8_t *)&v93, 2u);
    }

  }
  v53 = *(void **)(a1 + 80);
  if (!v53 || (objc_msgSend(v53, "processAborted") & 1) != 0)
    goto LABEL_72;
  VCPSignPostLog();
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = os_signpost_id_generate(v54);

  VCPSignPostLog();
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    LOWORD(v93.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v55, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", ", (uint8_t *)&v93, 2u);
  }

  v58 = *(void **)(a1 + 80);
  v77 = buf;
  v76 = v91;
  v9 = objc_msgSend(v58, "analyzeFrame:withTimestamp:andDuration:flags:", ImageBuffer, &v77, &v76, &v90);
  if ((_DWORD)v9)
    goto LABEL_90;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) == 0x4000000000
    && (objc_msgSend(*(id *)(a1 + 80), "processAborted") & 1) != 0)
  {
LABEL_81:
    objc_msgSend(v3, "setFrameFlags:", v90);
    v9 = 0;
    goto LABEL_90;
  }
  VCPSignPostLog();
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
  {
    LOWORD(v93.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v60, OS_SIGNPOST_INTERVAL_END, v55, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", ", (uint8_t *)&v93, 2u);
  }

LABEL_72:
  if (!*(_QWORD *)(a1 + 88))
    goto LABEL_81;
  VCPSignPostLog();
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = os_signpost_id_generate(v61);

  VCPSignPostLog();
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    LOWORD(v93.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", ", (uint8_t *)&v93, 2u);
  }

  v65 = *(void **)(a1 + 88);
  v75 = buf;
  v74 = v91;
  v9 = objc_msgSend(v65, "analyzeFrameWithSampleBuffer:timestamp:duration:andFlags:", v11, &v75, &v74, &v90);
  if (!(_DWORD)v9)
  {
    VCPSignPostLog();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      LOWORD(v93.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v67, OS_SIGNPOST_INTERVAL_END, v62, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", ", (uint8_t *)&v93, 2u);
    }

    goto LABEL_81;
  }
LABEL_90:
  VCPSignPostLog();
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    LOWORD(v93.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v71, OS_SIGNPOST_INTERVAL_END, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock2", ", (uint8_t *)&v93, 2u);
  }

  return v9;
}

- (int)postProcessAutoPlayable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "intValue") & 0x80000) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quality"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;

      if (v11 <= 0.5)
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flags"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", (int)(objc_msgSend(v13, "intValue") & 0xFFF7FFFF));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("flags"));

        v25[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("MovieSummaryResults"));

      }
    }
    else
    {

    }
    if (!+[VCPMovieAnalyzer isHeuristicStickerScoreEnabled](VCPMovieAnalyzer, "isHeuristicStickerScoreEnabled"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AnimatedStickerResults"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (!v17)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AnimatedStickerResults"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quality"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("quality"));

        v24 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("AnimatedStickerResults"));

      }
    }

  }
  return 0;
}

- (int)analyzeVideoTrack:(id)a3 start:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6
{
  id v10;
  id v11;
  unsigned __int8 v12;
  float *p_maxAnalysisLength;
  float maxAnalysisLength;
  int v15;
  __int128 *v16;
  unint64_t v17;
  char v18;
  const __CFDictionary *v19;
  __int128 v20;
  int32_t v21;
  CMTime *v22;
  const __CFDictionary *v24;
  __int128 v25;
  unint64_t v26;
  __int128 *v27;
  int v28;
  CMTimeValue value;
  CMTimeScale timescale;
  Float64 Seconds;
  CMTimeValue v32;
  CMTimeScale v33;
  Float64 v34;
  uint64_t v35;
  NSMutableDictionary *analysis;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  char v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  _OWORD v48[3];
  __int128 v49;
  uint64_t v50;
  CMTime v51;
  CMTime start;
  CMTimeRange v53;
  CMTimeRange v54;
  CMTime v55;
  CMTimeRange v56;
  CMTimeRange otherRange;
  CMTimeRange v58;
  CMTimeRange time2;
  CMTimeRange time1;
  CMTime v61;
  __int128 v62;
  CMTimeEpoch v63;
  CMTime time;
  CMTimeRange range;
  CMTime duration;
  CMTime rhs;
  _BYTE lhs[50];
  __int16 v69;
  Float64 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (v10)
    objc_msgSend(v10, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  time = (CMTime)*a4;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    v15 = -50;
    goto LABEL_52;
  }
  if ((v12 & 1) == 0
  {
    CMTimeMake((CMTime *)&-[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration, 300, 1);
  }
  v62 = 0uLL;
  v63 = 0;
  if (v10)
  {
    objc_msgSend(v10, "vcp_endTime");
    p_maxAnalysisLength = &self->_maxAnalysisLength;
    maxAnalysisLength = self->_maxAnalysisLength;
    if (maxAnalysisLength <= 0.0)
      goto LABEL_14;
    objc_msgSend(v10, "vcp_endTime");
  }
  else
  {
    p_maxAnalysisLength = &self->_maxAnalysisLength;
    maxAnalysisLength = self->_maxAnalysisLength;
    if (maxAnalysisLength <= 0.0)
      goto LABEL_14;
    memset(&v61, 0, sizeof(v61));
  }
  if (CMTimeGetSeconds(&v61) > maxAnalysisLength)
  {
    CMTimeMakeWithSeconds((CMTime *)lhs, *p_maxAnalysisLength, 600);
    v62 = *(_OWORD *)lhs;
    v63 = *(_QWORD *)&lhs[16];
  }
LABEL_14:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateResults, "objectForKeyedSubscript:", CFSTR("MetaSegmentResults"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v10;
  v46 = v11;
  if (v10)
    objc_msgSend(v10, "timeRange");
  else
    memset(lhs, 0, 48);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&lhs[24];
  time1.start.epoch = *(_QWORD *)&lhs[40];
  v16 = &-[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration;
  *(_OWORD *)&time2.start.value = -[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration;
  time2.start.epoch = qword_1ED261388;
  if (CMTimeCompare(&time1.start, &time2.start) < 1 && (unint64_t)objc_msgSend(v47, "count") < 2)
  {
    v18 = 0;
    v17 = a5;
  }
  else
  {
    v17 = a5 & 0xFFFFFBFFFFFFFFFFLL;
    v18 = 1;
  }
  memset(&time1, 0, sizeof(time1));
  v43 = a5;
  v42 = v18;
  if ((unint64_t)objc_msgSend(v47, "count") < 2)
  {
    v20 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&time1.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&time1.start.epoch = v20;
    *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  }
  else
  {
    objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&time1, v19);

  }
  v44 = 0;
  while (1)
  {
    *(_OWORD *)lhs = *(_OWORD *)&a4->var0;
    *(_QWORD *)&lhs[16] = a4->var3;
    *(_OWORD *)&time2.start.value = v62;
    time2.start.epoch = v63;
    if ((CMTimeCompare((CMTime *)lhs, &time2.start) & 0x80000000) == 0)
      break;
    memset(&time2.duration, 0, sizeof(time2.duration));
    *(_OWORD *)&time2.start.value = *(_OWORD *)&a4->var0;
    time2.start.epoch = a4->var3;
    *(_OWORD *)lhs = v62;
    *(_QWORD *)&lhs[16] = v63;
    rhs = (CMTime)*a4;
    CMTimeSubtract(&duration, (CMTime *)lhs, &rhs);
    *(CMTime *)lhs = duration;
    *(_OWORD *)&rhs.value = *v16;
    rhs.epoch = *((_QWORD *)v16 + 2);
    v21 = CMTimeCompare((CMTime *)lhs, &rhs);
    v22 = &duration;
    if (v21 >= 0)
      v22 = (CMTime *)v16;
    time2.duration = *v22;
    if ((time1.start.flags & 1) != 0
      && (time1.duration.flags & 1) != 0
      && !time1.duration.epoch
      && (time1.duration.value & 0x8000000000000000) == 0)
    {
      v58 = time2;
      otherRange = time1;
      CMTimeRangeGetIntersection((CMTimeRange *)lhs, &v58, &otherRange);
      time2 = *(CMTimeRange *)lhs;
      v56 = *(CMTimeRange *)lhs;
      CMTimeRangeGetEnd(&duration, &v56);
      v54 = time1;
      CMTimeRangeGetEnd(&v55, &v54);
      *(CMTime *)lhs = duration;
      rhs = v55;
      if (!CMTimeCompare((CMTime *)lhs, &rhs))
      {
        if (objc_msgSend(v47, "count") > (unint64_t)++v44)
        {
          objc_msgSend(v47, "objectAtIndexedSubscript:");
          v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeRangeMakeFromDictionary((CMTimeRange *)lhs, v24);
          time1 = *(CMTimeRange *)lhs;

        }
        else
        {
          v25 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
          *(_OWORD *)&time1.start.value = *MEMORY[0x1E0CA2E40];
          *(_OWORD *)&time1.start.epoch = v25;
          *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
        }
      }
    }
    memset(&v55, 0, sizeof(v55));
    v53 = time2;
    CMTimeRangeGetEnd(&v55, &v53);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v26 = v17;
      v27 = v16;
      v28 = objc_msgSend(v10, "trackID");
      value = time2.start.value;
      timescale = time2.start.timescale;
      start = time2.start;
      Seconds = CMTimeGetSeconds(&start);
      v32 = v55.value;
      v33 = v55.timescale;
      v51 = v55;
      v34 = CMTimeGetSeconds(&v51);
      *(_DWORD *)lhs = 67110656;
      *(_DWORD *)&lhs[4] = v28;
      *(_WORD *)&lhs[8] = 2048;
      *(_QWORD *)&lhs[10] = value;
      *(_WORD *)&lhs[18] = 1024;
      *(_DWORD *)&lhs[20] = timescale;
      *(_WORD *)&lhs[24] = 2048;
      *(Float64 *)&lhs[26] = Seconds;
      *(_WORD *)&lhs[34] = 2048;
      *(_QWORD *)&lhs[36] = v32;
      *(_WORD *)&lhs[44] = 1024;
      *(_DWORD *)&lhs[46] = v33;
      v69 = 2048;
      v70 = v34;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "    Analyzing Video Segment - Track ID: %d Start: %lld/%d (%0.3fs) End: %lld/%d (%0.3fs)", lhs, 0x3Cu);
      v10 = v45;
      v11 = v46;
      v16 = v27;
      v17 = v26;
    }
    v15 = -[VCPMovieAnalyzer analyzeVideoSegment:timerange:forAnalysisTypes:cancel:](self, "analyzeVideoSegment:timerange:forAnalysisTypes:cancel:", v10, &time2, v17, v11);
    if (v15)
      goto LABEL_51;
    rhs = (CMTime)*a4;
    duration = time2.duration;
    CMTimeAdd((CMTime *)lhs, &rhs, &duration);
    *(_OWORD *)&a4->var0 = *(_OWORD *)lhs;
    v35 = *(_QWORD *)&lhs[16];
    a4->var3 = *(_QWORD *)&lhs[16];
    analysis = self->_analysis;
    v49 = *(_OWORD *)&a4->var0;
    v50 = v35;
    -[NSMutableDictionary vcp_setSyncPoint:](analysis, "vcp_setSyncPoint:", &v49);
  }
  v37 = v42 ^ 1;
  if ((v43 & 0x40000000000) == 0)
    v37 = 1;
  if ((v37 & 1) == 0)
  {
    -[VCPAsset mainFileURL](self->_asset, "mainFileURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v10, "timeRange");
    else
      memset(v48, 0, sizeof(v48));
    +[MADVideoSafetyClassifier analyzeVideoAssetOnDemandWithURL:localIdentifier:timeRange:cancelBlock:andProgressHandler:](MADVideoSafetyClassifier, "analyzeVideoAssetOnDemandWithURL:localIdentifier:timeRange:cancelBlock:andProgressHandler:", v38, v39, v48, v11, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary vcp_appendResults:](self->_analysis, "vcp_appendResults:", v40);
  }
  if ((objc_msgSend((id)objc_opt_class(), "persistAudioEmbedding") & 1) == 0)
    -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("AudioEmbeddingResults"));
  v15 = 0;
LABEL_51:

LABEL_52:
  return v15;
}

- (id)analyzeAsset:(id)a3 streamed:(BOOL *)a4
{
  uint64_t v4;
  uint64_t (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t requestedAnalyses;
  void *v13;
  double v14;
  NSMutableDictionary *analysis;
  void *v16;
  int v17;
  _BOOL8 v18;
  int v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  VCPAudioAnalyzer *v30;
  VCPAudioAnalyzer *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  VCPVideoGlobalAnalyzer *v40;
  _BOOL4 v41;
  VCPAsset *asset;
  float v43;
  double v44;
  void *v45;
  void *v46;
  BOOL v47;
  VCPVideoGlobalAnalyzer *v48;
  void *v49;
  int v50;
  NSMutableDictionary *v51;
  NSMutableDictionary **p_analysis;
  NSMutableDictionary *v53;
  NSObject *v54;
  NSObject *v55;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  id v61;
  void *v62;
  BOOL v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int32_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double x;
  double y;
  double width;
  double height;
  NSObject *v78;
  const char *v79;
  uint32_t v80;
  unint64_t v81;
  NSObject *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unint64_t v102;
  NSObject *v103;
  NSObject *v104;
  os_signpost_id_t v105;
  NSObject *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  float v113;
  NSMutableDictionary *v114;
  NSObject *v115;
  id v116;
  id v117;
  void *v118;
  uint64_t v119;
  void *v120;
  NSObject *v121;
  id v122;
  unint64_t v123;
  NSSize v124;
  __int128 v125;
  unint64_t v126;
  NSObject *v127;
  NSObject *v128;
  os_signpost_id_t v129;
  NSObject *v130;
  NSObject *v131;
  VCPVideoGyroStabilizer *v132;
  float v133;
  float v134;
  VCPVideoGyroStabilizer *v135;
  NSObject *v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  unint64_t v143;
  unint64_t v144;
  __int128 v145;
  NSMutableDictionary *v146;
  NSObject *v147;
  NSObject *v148;
  __int128 v149;
  NSMutableDictionary *v150;
  void *v151;
  void *v152;
  int v153;
  os_signpost_id_t v154;
  void *v155;
  void *context;
  os_signpost_id_t spid;
  unint64_t v158;
  CMTime v159;
  CMTime v160;
  CMTime time;
  CMTimeRange v162;
  _OWORD v163[3];
  _OWORD v164[3];
  _BYTE v165[48];
  _OWORD v166[3];
  CMTime v167;
  CMTimeRange range;
  CMTime v169;
  id v170;
  const __CFString *v171;
  uint64_t v172;
  const __CFString *v173;
  void *v174;
  const __CFString *v175;
  void *v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  const __CFString *v180;
  uint64_t v181;
  const __CFString *v182;
  void *v183;
  const __CFString *v184;
  void *v185;
  void *v186;
  const __CFString *v187;
  void *v188;
  _BYTE buf[32];
  __int128 v190;
  const __CFString *v191;
  uint64_t v192;
  const __CFString *v193;
  void *v194;
  const __CFString *v195;
  void *v196;
  void *v197;
  const __CFString *v198;
  void *v199;
  _QWORD v200[2];
  _QWORD v201[2];
  const __CFString *v202;
  uint64_t v203;
  CMTime time2;
  uint64_t v205;
  CGRect v206;

  v205 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (**)(_QWORD))a3;
  if (a4)
    *a4 = 0;
  if (self->_status != 1)
    goto LABEL_82;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  spid = v9;
  v158 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPMovieAnalyzer", ", buf, 2u);
  }

  requestedAnalyses = self->_requestedAnalyses;
  if (v7 && (v7[2](v7) & 1) != 0)
    goto LABEL_73;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  -[VCPAsset movie](self->_asset, "movie");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!-[VCPMovieAnalyzer allowStreaming](self, "allowStreaming"))
      goto LABEL_28;
    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMovieAnalyzer_ResourceDownload", ", buf, 2u);
    }

    -[NSMutableDictionary vcp_addFlags:](self->_analysis, "vcp_addFlags:", 0x20000000);
    if (a4)
      *a4 = 1;
    -[VCPAsset streamedMovie:](self->_asset, "streamedMovie:", -[VCPMovieAnalyzer onDemand](self, "onDemand"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[VCPMovieAnalyzer loadPropertiesForAsset:](self, "loadPropertiesForAsset:", v13);
    VCPSignPostLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v4 = (uint64_t)v24;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v21, "VCPMovieAnalyzer_ResourceDownload", ", buf, 2u);
    }

    if (!v13)
    {
LABEL_28:
      v13 = 0;
LABEL_29:
      v19 = 4;
      v18 = 1;
LABEL_30:
      v17 = -18;
      goto LABEL_50;
    }
  }
  if (-[VCPAsset isMovie](self->_asset, "isMovie") && (-[VCPAsset duration](self->_asset, "duration"), v14 < 1.0)
    || objc_msgSend(v13, "vcp_isMontage"))
  {
    analysis = self->_analysis;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary vcp_setDateAnalyzed:](analysis, "vcp_setDateAnalyzed:", v16);

    -[NSMutableDictionary vcp_setFlags:](self->_analysis, "vcp_setFlags:", 0);
    -[NSMutableDictionary vcp_setQuality:](self->_analysis, "vcp_setQuality:", 0.0);
    -[NSMutableDictionary vcp_setStatsFlags:](self->_analysis, "vcp_setStatsFlags:", 4);
    -[NSMutableDictionary vcp_setTypes:](self->_analysis, "vcp_setTypes:", 0x7FFFFFFFFFFFFFFFLL);
    self->_status = 2;
    if ((self->_requestedAnalyses & 0x20000000) != 0)
      +[VCPVideoInterpolator sendPreGatedAnalytics](VCPVideoInterpolator, "sendPreGatedAnalytics");
    v4 = self->_analysis;
    v17 = 0;
    v18 = 1;
    v19 = 1;
    goto LABEL_50;
  }
  v25 = requestedAnalyses & 0x820408A00010;
  if ((requestedAnalyses & 0x820408A00010) != 0)
  {
    v26 = (void *)MEMORY[0x1BCCA1B2C]();
    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_signpost_id_generate(v27);

    VCPSignPostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v4 = (uint64_t)v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VCPMovieAnalyzer_Audio", ", buf, 2u);
    }

    v30 = -[VCPAudioAnalyzer initWithAnalysisTypes:forStreaming:]([VCPAudioAnalyzer alloc], "initWithAnalysisTypes:forStreaming:", requestedAnalyses & 0x820408A00010, 0);
    v31 = v30;
    if (v30)
    {
      v170 = 0;
      v17 = -[VCPAudioAnalyzer analyzeAsset:cancel:results:](v30, "analyzeAsset:cancel:results:", v13, v7, &v170);
      v4 = (uint64_t)v170;
      if (v17)
      {
        v19 = 4;
      }
      else
      {
        -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v4);
        -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", v25);
        VCPSignPostLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v28, "VCPMovieAnalyzer_Audio", ", buf, 2u);
        }

        v19 = 0;
      }

    }
    else
    {
      v19 = 4;
      v17 = -18;
    }

    objc_autoreleasePoolPop(v26);
    if (v19)
      goto LABEL_49;
    v32 = v17;
  }
  else
  {
    v32 = 0;
  }
  v17 = -[VCPMovieAnalyzer performMetadataAnalysisOnAsset:withCancelBlock:](self, "performMetadataAnalysisOnAsset:withCancelBlock:", v13, v7);
  if (v17)
  {
LABEL_48:
    v19 = 4;
LABEL_49:
    v18 = 1;
    goto LABEL_50;
  }
  v57 = self->_requestedAnalyses;
  v153 = v32;
  if ((v57 & 0x4000010010000000) != 0)
  {
    VCPSignPostLog();
    v58 = objc_claimAutoreleasedReturnValue();
    v154 = os_signpost_id_generate(v58);

    VCPSignPostLog();
    v59 = objc_claimAutoreleasedReturnValue();
    v4 = (uint64_t)v59;
    if (v154 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v154, "VCPMovieAnalyzer_Stabilization", ", buf, 2u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_privateResults, "objectForKeyedSubscript:", CFSTR("MetaStabilizationResults"));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_requestedAnalyses & 0x10000000000) != 0)
    {
      v4 = (uint64_t)CFSTR("LivePhotoKeyFrameTimestamp");
      -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62 == 0;

      if (v63)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_privateResults, "objectForKeyedSubscript:", CFSTR("MetaStillImageHomographyResults"));
        v61 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v202 = CFSTR("attributes");
        v201[0] = &unk_1E6B767D0;
        v200[0] = CFSTR("MetaStillImagePerspectiveTransformResults");
        v200[1] = CFSTR("MetaPresentationTimeResults");
        -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v201[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v201, v200, 2);
        v4 = objc_claimAutoreleasedReturnValue();
        v203 = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v66);

        v61 = v64;
      }
      if (!objc_msgSend(v61, "count"))
        goto LABEL_105;
      v60 = objc_msgSend(v155, "count");
    }
    else
    {
      v60 = objc_msgSend(v155, "count");
      v61 = 0;
    }
    if (v60)
    {
      objc_msgSend(v13, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v67)
      {
LABEL_131:
        v17 = -18;
LABEL_132:

        goto LABEL_48;
      }
      v4 = (uint64_t)CFSTR("LivePhotoKeyFrameTimestamp");
      -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        v152 = v67;
        objc_msgSend(v67, "timeRange");
        CMTimeRangeGetEnd(&v169, &range);
        -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
        v4 = objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v167, (CFDictionaryRef)v4);
        *(CMTime *)buf = v169;
        time2 = v167;
        v69 = CMTimeCompare((CMTime *)buf, &time2);

        if (v69 < 0)
        {
          v198 = CFSTR("PathConstraintsStabilizationResults");
          v195 = CFSTR("attributes");
          v193 = CFSTR("settlingEffectStatus");
          v191 = CFSTR("settlingEffectLivePhotoKeyFrameTimeOutOfBoundFailure");
          v192 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = v97;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v196 = v98;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = v99;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = v100;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v101);
          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x10000000000);
          v102 = self->_requestedAnalyses;
          if ((v102 & 0x4000000000) != 0)
            self->_requestedAnalyses = v102 & 0xFFFFFFBFFFFFFFFFLL;
          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000);

          goto LABEL_136;
        }
      }
      objc_msgSend(v67, "vcp_fullFrameSize");
      v72 = v71;
      v73 = v70;
      if (v71 < 1.0 || v70 < 1.0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_131;
        v4 = 16;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_131;
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v73;
        v78 = MEMORY[0x1E0C81028];
        v79 = "    Video track has invalid full frame dimensions (%.f,%.f)";
        v80 = 22;
LABEL_130:
        _os_log_impl(&dword_1B6C4A000, v78, OS_LOG_TYPE_ERROR, v79, buf, v80);
        goto LABEL_131;
      }
      objc_msgSend(v67, "vcp_cleanApertureRect");
      x = v206.origin.x;
      y = v206.origin.y;
      width = v206.size.width;
      height = v206.size.height;
      if (CGRectIsEmpty(v206))
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_131;
        v4 = 16;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_131;
        *(_WORD *)buf = 0;
        v78 = MEMORY[0x1E0C81028];
        v79 = "    Video track has invalid clean aperture rect";
        v80 = 2;
        goto LABEL_130;
      }
      v152 = v67;
      objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("MetaHomographyDimensionResults"));
      v4 = objc_claimAutoreleasedReturnValue();
      v124 = NSSizeFromString((NSString *)v4);

      if (v124.width == *MEMORY[0x1E0C9D820] && v124.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v17 = -18;
LABEL_199:
        v67 = v152;
        goto LABEL_132;
      }
      v190 = 0u;
      memset(buf, 0, sizeof(buf));
      if ((self->_requestedAnalyses & 0x10000000000) != 0)
      {
        +[VCPSettlingEffectAnalyzer getSettlingEffectTimeRange:withOptions:](VCPSettlingEffectAnalyzer, "getSettlingEffectTimeRange:withOptions:", v67, self->_options);
        if ((self->_requestedAnalyses & 0x10000000000) != 0
          && ((buf[12] & 1) == 0
           || (BYTE4(v190) & 1) == 0
           || *((_QWORD *)&v190 + 1)
           || (*(_QWORD *)&buf[24] & 0x8000000000000000) != 0))
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v136 = MEMORY[0x1E0C81028];
            v137 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            {
              -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
              v138 = (id)objc_claimAutoreleasedReturnValue();
              LODWORD(time2.value) = 138412290;
              *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v138;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  [%@] Asset has invalid time range for path constraint stabilization", (uint8_t *)&time2, 0xCu);

            }
          }
          v187 = CFSTR("PathConstraintsStabilizationResults");
          v184 = CFSTR("attributes");
          v182 = CFSTR("settlingEffectStatus");
          v180 = CFSTR("settlingEffectInvalidTimeRange");
          v181 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v183 = v139;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = v140;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = v141;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = v142;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
          v135 = (VCPVideoGyroStabilizer *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v135);
          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x10000000000);
          v143 = self->_requestedAnalyses;
          if ((v143 & 0x4000000000) != 0)
            self->_requestedAnalyses = v143 & 0xFFFFFFBFFFFFFFFFLL;
          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000);
          goto LABEL_221;
        }
      }
      else
      {
        v125 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E40];
        *(_OWORD *)&buf[16] = v125;
        v190 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      }
      VCPSignPostLog();
      v128 = objc_claimAutoreleasedReturnValue();
      v129 = os_signpost_id_generate(v128);

      VCPSignPostLog();
      v130 = objc_claimAutoreleasedReturnValue();
      v131 = v130;
      if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
      {
        LOWORD(time2.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v131, OS_SIGNPOST_INTERVAL_BEGIN, v129, "VCPMovieAnalyzer_Stabilization_VCPVideoStabilizerGyro", ", (uint8_t *)&time2, 2u);
      }

      v132 = [VCPVideoGyroStabilizer alloc];
      objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("MetaStabilizationFrameResults"));
      v4 = objc_claimAutoreleasedReturnValue();
      v133 = v124.width / v72;
      v134 = v124.height / v73;
      v166[0] = *(_OWORD *)buf;
      v166[1] = *(_OWORD *)&buf[16];
      v166[2] = v190;
      v135 = -[VCPVideoGyroStabilizer initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:](v132, "initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:", v4, v61, v166, v124.width, v124.height, x * v133, y * v134, width * v133, height * v134);

      if (!v135)
      {
        v17 = -108;
        goto LABEL_199;
      }
      v17 = -[VCPVideoGyroStabilizer convertAnalysisResult](v135, "convertAnalysisResult");
      if (v17)
        goto LABEL_197;
      if ((self->_requestedAnalyses & 0x4000000000000000) != 0)
      {
        objc_msgSend(v152, "preferredTransform");
        -[VCPVideoGyroStabilizer storeAnalytics:isLivePhoto:](v135, "storeAnalytics:isLivePhoto:", v165, -[VCPAsset isLivePhoto](self->_asset, "isLivePhoto"));
      }
      -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000000000);
      v144 = self->_requestedAnalyses;
      if ((v144 & 0x10000000) != 0)
      {
        self->_requestedAnalyses = v144 & 0xFFFFFFFFFBFFFFFFLL;
        v145 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
        v164[0] = *MEMORY[0x1E0CA2E50];
        v164[1] = v145;
        v164[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
        v17 = -[VCPVideoStabilizer finishAnalysisPass:](v135, "finishAnalysisPass:", v164);
        if (v17)
          goto LABEL_197;
        v146 = self->_analysis;
        -[VCPVideoStabilizer results](v135, "results");
        v4 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_addEntriesFromResults:](v146, "vcp_addEntriesFromResults:", v4);

        -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 335544320);
        v144 = self->_requestedAnalyses;
      }
      if ((v144 & 0x10000000000) == 0)
      {
LABEL_217:
        VCPSignPostLog();
        v147 = objc_claimAutoreleasedReturnValue();
        v148 = v147;
        if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
        {
          LOWORD(time2.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v148, OS_SIGNPOST_INTERVAL_END, v129, "VCPMovieAnalyzer_Stabilization_VCPVideoStabilizerGyro", ", (uint8_t *)&time2, 2u);
        }

LABEL_221:
LABEL_136:
        v95 = v152;
        goto LABEL_137;
      }
      v149 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      v163[0] = *MEMORY[0x1E0CA2E50];
      v163[1] = v149;
      v163[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
      v17 = -[VCPVideoStabilizer finishAnalysisPass:](v135, "finishAnalysisPass:", v163);
      if (!v17)
      {
        v150 = self->_analysis;
        -[VCPVideoStabilizer results](v135, "results");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_addEntriesFromResults:](v150, "vcp_addEntriesFromResults:", v151);

        -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x10000000000);
        if ((self->_requestedAnalyses & 0x4000000000) != 0)
        {
          if (-[VCPVideoStabilizer stabilizationFaild](v135, "stabilizationFaild"))
            self->_requestedAnalyses &= ~0x4000000000uLL;
          -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000);
        }
        goto LABEL_217;
      }
LABEL_197:

      goto LABEL_199;
    }
LABEL_105:
    v81 = self->_requestedAnalyses;
    if ((v81 & 0x4000000000000000) != 0)
    {
      -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000000000);
      v81 = self->_requestedAnalyses;
    }
    if ((v81 & 0x10000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v82 = MEMORY[0x1E0C81028];
        v83 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
          v84 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v84;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have gyro metadata", buf, 0xCu);

        }
      }
      -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x10000000);
      v81 = self->_requestedAnalyses;
    }
    if ((v81 & 0x10000000000) == 0)
      goto LABEL_138;
    if (!objc_msgSend(v155, "count") && (int)MediaAnalysisLogLevel() >= 7)
    {
      v85 = MEMORY[0x1E0C81028];
      v86 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
        v87 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v87;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have gyro metadata", buf, 0xCu);

      }
    }
    if (!objc_msgSend(v61, "count") && (int)MediaAnalysisLogLevel() >= 7)
    {
      v88 = MEMORY[0x1E0C81028];
      v89 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
        v90 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v90;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have still image metadata", buf, 0xCu);

      }
    }
    v178 = CFSTR("PathConstraintsStabilizationResults");
    v175 = CFSTR("attributes");
    v173 = CFSTR("settlingEffectStatus");
    v171 = CFSTR("settlingEffectMissingMetadata");
    v172 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v91;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v92;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v93;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v177, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = v94;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v95);
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x10000000000);
    v96 = self->_requestedAnalyses;
    if ((v96 & 0x4000000000) != 0)
      self->_requestedAnalyses = v96 & 0xFFFFFFBFFFFFFFFFLL;
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x4000000000);
LABEL_137:

LABEL_138:
    VCPSignPostLog();
    v103 = objc_claimAutoreleasedReturnValue();
    v4 = (uint64_t)v103;
    if (v154 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v154, "VCPMovieAnalyzer_Stabilization", ", buf, 2u);
    }

    v57 = self->_requestedAnalyses;
    v32 = v153;
  }
  if ((v57 & 0x2C636446D888) == 0)
  {
    v19 = 0;
    v18 = 1;
    v17 = v32;
    goto LABEL_50;
  }
  VCPSignPostLog();
  v104 = objc_claimAutoreleasedReturnValue();
  v105 = os_signpost_id_generate(v104);

  VCPSignPostLog();
  v106 = objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t)v106;
  if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v105, "VCPMovieAnalyzer_Video", ", buf, 2u);
  }

  objc_msgSend(v13, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (!v107)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v115 = MEMORY[0x1E0C81028];
      v116 = MEMORY[0x1E0C81028];
      v4 = 16;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        -[VCPAsset localIdentifier](self->_asset, "localIdentifier");
        v117 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tracks");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v118, "count");
        objc_msgSend(v13, "tracks");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v117;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v119;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v120;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "  [%@] Asset does not have valid video track; all %lu tracks: %@",
          buf,
          0x20u);

      }
      goto LABEL_161;
    }
LABEL_162:

    goto LABEL_29;
  }
  objc_msgSend(v107, "naturalSize");
  v111 = v110;
  v112 = v109;
  if (v110 < 1.0 || v109 < 1.0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v121 = MEMORY[0x1E0C81028];
      v122 = MEMORY[0x1E0C81028];
      v4 = 16;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = v111;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v112;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "    Video track has invalid dimensions (%.f,%.f)", buf, 0x16u);
      }
LABEL_161:

      goto LABEL_162;
    }
    goto LABEL_162;
  }
  objc_msgSend(v108, "nominalFrameRate");
  v18 = v113 < 25.0;
  memset(&v169, 0, sizeof(v169));
  v114 = self->_analysis;
  if (v114)
    -[NSMutableDictionary vcp_syncPoint](v114, "vcp_syncPoint");
  *(CMTime *)buf = v169;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (CMTimeCompare((CMTime *)buf, &time2))
  {
    objc_msgSend(v108, "timeRange");
    time = v169;
    if (!CMTimeRangeContainsTime(&v162, &time))
    {

      v19 = 4;
      goto LABEL_30;
    }
  }
  else
  {
    objc_msgSend(v108, "vcp_startTime");
    v169 = *(CMTime *)buf;
  }
  v123 = self->_requestedAnalyses;
  if ((v123 & 0x4024000000) != 0)
  {
    v160 = v169;
    v17 = -[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:](self, "analyzeVideoTrack:start:forAnalysisTypes:cancel:", v108, &v160, v123 & 0x4024000000, v7);
    if (v17)
    {
LABEL_169:

      v19 = 4;
      goto LABEL_50;
    }
    v123 = self->_requestedAnalyses;
  }
  if ((v123 & 0x2C234046D888) != 0)
  {
    v159 = v169;
    v17 = -[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:](self, "analyzeVideoTrack:start:forAnalysisTypes:cancel:", v108, &v159, v123 & 0xFFFFFFBFDBFFFFFFLL, v7);
    if (v17)
      goto LABEL_169;
    v123 = self->_requestedAnalyses;
  }
  if ((v123 & 8) != 0)
  {
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 12);
    v123 = self->_requestedAnalyses;
  }
  if ((v123 & 0x880) != 0)
  {
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 192);
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 2048);
    v123 = self->_requestedAnalyses;
  }
  if ((v123 & 0x40000) != 0)
  {
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x40000);
    if (!-[VCPAsset isLivePhoto](self->_asset, "isLivePhoto"))
    {
      v17 = -[VCPMovieAnalyzer generateKeyFrameResource:](self, "generateKeyFrameResource:", v13);
      if (v17)
        goto LABEL_169;
    }
  }
  v126 = self->_requestedAnalyses;
  if ((v126 & 0x80000000000) != 0)
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x1000000000000);
  if ((v126 & 0x200000000000) != 0)
    -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x2000000000000);
  -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", v126 & 0x2C617542D000);
  VCPSignPostLog();
  v127 = objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t)v127;
  if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v105, "VCPMovieAnalyzer_Video", ", buf, 2u);
  }

  v19 = 0;
  v17 = v153;
LABEL_50:

  objc_autoreleasePoolPop(context);
  if (v19 == 4)
    goto LABEL_70;
  if (!v19)
  {
    -[NSMutableDictionary vcp_removeSyncPoint](self->_analysis, "vcp_removeSyncPoint");
    v35 = self->_analysis;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary vcp_setDateAnalyzed:](v35, "vcp_setDateAnalyzed:", v36);

    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", CFSTR("QualityResults"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count") == 0;

    if (!v39)
    {
      v40 = objc_alloc_init(VCPVideoGlobalAnalyzer);
      v41 = -[VCPAsset isSlowmo](self->_asset, "isSlowmo");
      asset = self->_asset;
      if (v41)
        -[VCPAsset slowmoRate](asset, "slowmoRate");
      else
        -[VCPAsset timelapseRate](asset, "timelapseRate");
      -[VCPVideoGlobalAnalyzer analyzeOverallQuality:withFpsRate:](v40, "analyzeOverallQuality:withFpsRate:", self->_analysis);
      v44 = v43;
      if (v44 != -1.0)
        -[NSMutableDictionary vcp_setQuality:](self->_analysis, "vcp_setQuality:", v44, -1.0);
      if ((self->_requestedAnalyses & 0x80000000) != 0)
      {
        if (-[VCPAsset isLivePhoto](self->_asset, "isLivePhoto") && !-[VCPAsset hadFlash](self->_asset, "hadFlash"))
        {
          -[NSMutableDictionary objectForKey:](self->_analysis, "objectForKey:", CFSTR("metadataRanges"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:](v40, "generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:", v45, self->_privateResults, v18);

        }
        -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", 0x80000000);
      }

    }
    if ((-[NSMutableDictionary vcp_types](self->_analysis, "vcp_types") & 0x80) != 0)
    {
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46 == 0;

      if (!v47)
      {
        v48 = objc_alloc_init(VCPVideoGlobalAnalyzer);
        -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[VCPVideoGlobalAnalyzer setActivityLevel:](v48, "setActivityLevel:", v49);

        if (v50)
        {
LABEL_71:
          if (!v50)
            goto LABEL_78;
          if (v50 != -128)
          {
            self->_status = 3;
            p_analysis = &self->_analysis;
LABEL_77:
            v53 = *p_analysis;
            *p_analysis = 0;

LABEL_78:
            VCPSignPostLog();
            v54 = objc_claimAutoreleasedReturnValue();
            v55 = v54;
            if (v158 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v55, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer", ", buf, 2u);
            }

LABEL_82:
            v4 = self->_analysis;
            goto LABEL_83;
          }
LABEL_73:
          self->_status = 4;
          p_analysis = &self->_analysis;
          v51 = self->_analysis;
          if (v51)
          {
            -[NSMutableDictionary vcp_syncPoint](v51, "vcp_syncPoint");
            if ((buf[12] & 1) != 0)
              goto LABEL_78;
          }
          goto LABEL_77;
        }
      }
    }
    if (-[VCPAsset isMovie](self->_asset, "isMovie"))
      -[NSMutableDictionary vcp_addStatsFlags:](self->_analysis, "vcp_addStatsFlags:", 4);
    self->_status = 2;
LABEL_70:
    v50 = v17;
    goto LABEL_71;
  }
LABEL_83:

  return (id)v4;
}

- (int)generateKeyFrameResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 *v11;
  void *v12;
  const __CFDictionary *v13;
  void *v14;
  NSMutableDictionary *analysis;
  void *v16;
  int v17;
  CMTime v19;
  CMTime v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = a3;
  -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count")
    || (objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v4),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        (v10 = v9) == 0))
  {
LABEL_8:

    v17 = -18;
    goto LABEL_9;
  }
  objc_msgSend(v9, "setAppliesPreferredTrackTransform:", 1);
  objc_msgSend(v10, "setMaximumSize:", (double)580, (double)580);
  v11 = (__int128 *)MEMORY[0x1E0CA2E68];
  v23 = *MEMORY[0x1E0CA2E68];
  v24 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v10, "setRequestedTimeToleranceAfter:", &v23);
  v21 = *v11;
  v22 = *((_QWORD *)v11 + 2);
  objc_msgSend(v10, "setRequestedTimeToleranceBefore:", &v21);
  memset(&v20, 0, sizeof(v20));
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("start"));
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v20, v13);

  v19 = v20;
  v14 = (void *)objc_msgSend(v10, "copyCGImageAtTime:actualTime:error:", &v19, 0, 0);
  if (!v14)
  {

    goto LABEL_8;
  }
  analysis = self->_analysis;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary vcp_appendResult:forKey:](analysis, "vcp_appendResult:forKey:", v16, CFSTR("KeyFrameResourceResults"));

LABEL_6:
  v17 = 0;
LABEL_9:

  return v17;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (BOOL)onDemand
{
  return self->_onDemand;
}

- (void)setOnDemand:(BOOL)a3
{
  self->_onDemand = a3;
}

- (float)maxHighlightDuration
{
  return self->_maxHighlightDuration;
}

- (void)setMaxHighlightDuration:(float)a3
{
  self->_maxHighlightDuration = a3;
}

- (BOOL)faceDominated
{
  return self->_faceDominated;
}

- (void)setFaceDominated:(BOOL)a3
{
  self->_faceDominated = a3;
}

- (float)maxAnalysisLength
{
  return self->_maxAnalysisLength;
}

- (void)setMaxAnalysisLength:(float)a3
{
  self->_maxAnalysisLength = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_phAsset, 0);
  objc_storeStrong((id *)&self->_existingAnalysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_privateResults, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end
