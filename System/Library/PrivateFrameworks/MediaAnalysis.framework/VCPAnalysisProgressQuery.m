@implementation VCPAnalysisProgressQuery

+ (unint64_t)countAllAssetsForTaskID:(unint64_t)a3 withPhotoLibrary:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  float v8;
  float v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CD1398];
  v7 = a4;
  objc_msgSend(v6, "mad_sceneConfidenceThresholdForTask:", a3);
  v9 = v8;
  v10 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  v18 = 0;
  *(float *)&v11 = v9;
  v12 = objc_msgSend(v7, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", v10, 0, &v18, v11);

  v13 = v18;
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      VCPTaskIDDescription(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "UTF8String");
      *(_DWORD *)buf = 138412802;
      v20 = v14;
      v21 = 2048;
      v22 = v9;
      v23 = 2080;
      v24 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to query total asset count - scene threshold %.2f: %s\n", buf, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

+ (unint64_t)countProcessedAssetsForTaskID:(unint64_t)a3 withPhotoLibrary:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  void *v15;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CD1628];
  v8 = a4;
  objc_msgSend(v7, "mad_sharedVersionProviderWithPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "mad_sceneConfidenceThresholdForTask:", a3);
  v11 = v10;
  v12 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  LODWORD(v13) = v11;
  v14 = objc_msgSend(v8, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", v12, 0, v9, a5, v13);

  if (*a5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      VCPTaskIDDescription(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a5;
      v18 = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to fetch processed assets: %@", (uint8_t *)&v18, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

+ (void)_countMediaAnalysisWithAssetBatch:(id)a3 andDatabase:(id)a4 analyzedCount:(unint64_t *)a5 completeAnalyzedCount:(unint64_t *)a6 partialAnalyzedCount:(unint64_t *)a7
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v13);
  }

  v39 = v10;
  v40 = v9;
  objc_msgSend(v9, "queryAnalysisPropertiesForAssets:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v11;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v18)
  {
    v19 = v18;
    v44 = 0;
    v45 = 0;
    v20 = 0;
    v21 = 0;
    v22 = *(_QWORD *)v49;
    while (1)
    {
      v23 = 0;
      v46 = v19;
      do
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v23);
        objc_msgSend(v24, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          ++v20;
          goto LABEL_26;
        }
        objc_msgSend(v26, "vcp_dateModified");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "vcp_modificationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "isEqualToDate:", v28))
        {

LABEL_25:
          ++v21;
          goto LABEL_26;
        }
        v29 = v22;
        v30 = v21;
        v31 = v17;
        v32 = v20;
        v33 = objc_msgSend(v26, "vcp_version");

        v34 = v33 < 69;
        v20 = v32;
        v17 = v31;
        v21 = v30;
        v22 = v29;
        v19 = v46;
        if (v34)
          goto LABEL_25;
        if (objc_msgSend(v26, "vcp_version") == 69)
        {
          v35 = objc_msgSend(v24, "vcp_fullAnalysisTypes") & 0xFFFFFFFFFFEFFFFFLL;
          v36 = objc_msgSend(v26, "vcp_types");
          if ((v36 & v35) == v35)
            v37 = v45;
          else
            v37 = v45 + 1;
          v38 = v44;
          if ((v36 & v35) == v35)
            v38 = v44 + 1;
          v44 = v38;
          v45 = v37;
        }
LABEL_26:

        ++v23;
      }
      while (v19 != v23);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (!v19)
        goto LABEL_30;
    }
  }
  v44 = 0;
  v45 = 0;
  v20 = 0;
  v21 = 0;
LABEL_30:

  *a5 = objc_msgSend(obj, "count") - (v21 + v20);
  *a6 = v44;
  *a7 = v45;

}

+ (unint64_t)_countFaceAnalysisWithAssetBatch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "faceAdjustmentVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "adjustmentVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToDate:", v11);

        v6 += v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_countSceneAnalysisWithAssetBatch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "vcp_needSceneProcessing") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_countOCRAnalysisWithAssetBatch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "vcp_needsOCRProcessing") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_countVisualSearchAnalysisWithAssetBatch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "vcp_needsVisualSearchProcessing") & 1) == 0)
          v6 += objc_msgSend(v9, "vcp_needsStickerGatingProcessing") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_countPECAnalysisWithAssetBatch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "vcp_needsPECProcessing") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_countAnalysisWithAssetBatch:(id)a3 andDatabase:(id)a4 andTaskID:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((uint64_t)a5 <= 9)
  {
    if (a5 == 2)
    {
      v9 = +[VCPAnalysisProgressQuery _countSceneAnalysisWithAssetBatch:](VCPAnalysisProgressQuery, "_countSceneAnalysisWithAssetBatch:", v7);
      goto LABEL_12;
    }
    if (a5 == 3)
    {
      v9 = +[VCPAnalysisProgressQuery _countFaceAnalysisWithAssetBatch:](VCPAnalysisProgressQuery, "_countFaceAnalysisWithAssetBatch:", v7);
      goto LABEL_12;
    }
  }
  else
  {
    switch(a5)
    {
      case 0xAuLL:
        v9 = +[VCPAnalysisProgressQuery _countOCRAnalysisWithAssetBatch:](VCPAnalysisProgressQuery, "_countOCRAnalysisWithAssetBatch:", v7);
        goto LABEL_12;
      case 0xCuLL:
        v9 = +[VCPAnalysisProgressQuery _countVisualSearchAnalysisWithAssetBatch:](VCPAnalysisProgressQuery, "_countVisualSearchAnalysisWithAssetBatch:", v7);
        goto LABEL_12;
      case 0x10uLL:
        v9 = +[VCPAnalysisProgressQuery _countPECAnalysisWithAssetBatch:](VCPAnalysisProgressQuery, "_countPECAnalysisWithAssetBatch:", v7);
LABEL_12:
        v10 = v9;
        goto LABEL_13;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    VCPTaskIDDescription(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = a5;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query progress: unsupport taskID %lu - %@", (uint8_t *)&v13, 0x16u);

  }
  v10 = 0;
LABEL_13:

  return v10;
}

+ (unint64_t)_countFailuresWithAssetBatch:(id)a3 andDatabase:(id)a4 andTaskID:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 <= 0x10)
  {
    if (((1 << a5) & 0x1140C) != 0)
    {
      objc_msgSend(v8, "queryFailedProcessingStatusFromAssets:forTaskID:", v7, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v11 = v10;
      v12 = objc_msgSend(v10, "count");

      goto LABEL_5;
    }
    if (a5 == 1)
    {
      objc_msgSend(v8, "blacklistedLocalIdentifiersFromAssets:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    VCPTaskIDDescription(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = a5;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query progress: unsupport taskID %lu - %@", (uint8_t *)&v15, 0x16u);

  }
  v12 = 0;
LABEL_5:

  return v12;
}

+ (unint64_t)_vipStatusForPhotoLibrary:(id)a3 andType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  v5 = a3;
  objc_msgSend(v5, "vcp_vipModelLastGenerationDateForVIPType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  objc_msgSend(v5, "vcp_vipModelFilepathForVIPType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", v10, a4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 2;
  if (v9 >= (double)0x15180uLL)
    v12 = 1;
  if (v11)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

+ (int)_scanPhotoLibrary:(id)a3 withTaskID:(unint64_t)a4 statistics:(id *)a5 andExtendTimeoutBlock:(id)a6
{
  id v10;
  void (**v11)(void);
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void (**v54)(void);
  unint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[3];
  _BYTE buf[12];
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(void))a6;
  v12 = MediaAnalysisLogLevel();
  if (a5)
  {
    v53 = a1;
    v54 = v11;
    if (v12 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      VCPTaskIDDescription(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = a4;
      v67 = 2112;
      v68 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Query progress: scan library for %lu - %@", buf, 0x16u);

    }
    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v10;
    objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", v10, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = mach_absolute_time();
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPAnalysisProgressQueryScanPhotoLibraryFetch", ", buf, 2u);
    }

    v48 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v17, "VCPAnalysisProgressQueryScanPhotoLibraryFetch", ", buf, 2u);
    }

    v23 = v53;
    if (v15)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v55 = a4;
    if (objc_msgSend(v20, "count", a5))
    {
      v24 = 0;
      v25 = 0;
      v51 = 0;
      v52 = 0;
      v26 = 0;
      v27 = 0;
      v50 = v20;
      do
      {
        v28 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v29);

        if ((unint64_t)objc_msgSend(v49, "count") >= 0x3E8)
        {
          v57 = v27;
          if (v54)
            v54[2]();
          v30 = objc_msgSend(v49, "count");
          v31 = objc_msgSend(v23, "_countFailuresWithAssetBatch:andDatabase:andTaskID:", v49, v56, v55);
          if (v55 == 1)
          {
            *(_QWORD *)buf = 0;
            v58 = 0;
            v59 = 0;
            +[VCPAnalysisProgressQuery _countMediaAnalysisWithAssetBatch:andDatabase:analyzedCount:completeAnalyzedCount:partialAnalyzedCount:](VCPAnalysisProgressQuery, "_countMediaAnalysisWithAssetBatch:andDatabase:analyzedCount:completeAnalyzedCount:partialAnalyzedCount:", v49, v56, buf, &v59, &v58);
            v32 = *(_QWORD *)buf;
            v51 += v59;
            v52 += v58;
          }
          else
          {
            v32 = objc_msgSend(v23, "_countAnalysisWithAssetBatch:andDatabase:andTaskID:", v49, v56, v55);
          }
          v26 += v30;
          v25 += v31;
          v27 = v32 + v57;
          objc_msgSend(v49, "removeAllObjects");
          v23 = v53;
          v20 = v50;
        }
        objc_autoreleasePoolPop(v28);
        ++v24;
      }
      while (v24 < objc_msgSend(v20, "count"));
    }
    else
    {
      v27 = 0;
      v26 = 0;
      v51 = 0;
      v52 = 0;
      v25 = 0;
    }
    if (objc_msgSend(v49, "count"))
    {
      v26 += objc_msgSend(v49, "count");
      v25 += objc_msgSend(v23, "_countFailuresWithAssetBatch:andDatabase:andTaskID:", v49, v56, v55);
      if (v55 == 1)
      {
        *(_QWORD *)buf = 0;
        v58 = 0;
        v59 = 0;
        +[VCPAnalysisProgressQuery _countMediaAnalysisWithAssetBatch:andDatabase:analyzedCount:completeAnalyzedCount:partialAnalyzedCount:](VCPAnalysisProgressQuery, "_countMediaAnalysisWithAssetBatch:andDatabase:analyzedCount:completeAnalyzedCount:partialAnalyzedCount:", v49, v56, buf, &v59, &v58);
        v27 += *(_QWORD *)buf;
        v51 += v59;
        v52 += v58;
      }
      else
      {
        v27 += objc_msgSend(v23, "_countAnalysisWithAssetBatch:andDatabase:andTaskID:", v49, v56, v55);
      }
    }
    v34 = (void *)MEMORY[0x1E0C99E08];
    v64[0] = CFSTR("failed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v35;
    v64[1] = CFSTR("processed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v36;
    v64[2] = CFSTR("total-allowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryWithDictionary:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55 == 1)
    {
      v60[0] = CFSTR("full-analysis-complete-processed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v41;
      v60[1] = CFSTR("full-analysis-partial-processed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v46;
      v10 = v47;
    }
    else
    {
      v40 = v46;
      v10 = v47;
      if (v55 != 3)
      {
LABEL_38:
        v44 = objc_retainAutorelease(v39);
        *v40 = v44;

        v33 = 0;
        v11 = v54;
        goto LABEL_39;
      }
      v62[0] = CFSTR("pet-vip-status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "_vipStatusForPhotoLibrary:andType:", v47, 1));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v41;
      v62[1] = CFSTR("person-vip-status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "_vipStatusForPhotoLibrary:andType:", v47, 0));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v39, "addEntriesFromDictionary:", v43);

    goto LABEL_38;
  }
  if (v12 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query progress: output parameter statistics must be non-nil", buf, 2u);
  }
  v33 = -50;
LABEL_39:

  return v33;
}

+ (id)_processedPredicateForTaskID:(unint64_t)a3
{
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  if ((uint64_t)a3 > 11)
  {
    if (a3 == 12)
    {
      v3 = (void *)MEMORY[0x1E0CB3880];
      v7 = VCPPhotosVisualSearchAlgorithmVersion();
      v8 = 1;
      v4 = CFSTR("mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion >= %d && mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceAlgorithmVersion >= %d");
      goto LABEL_11;
    }
    if (a3 == 16)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaAnalysisAttributes.vaAnalysisVersion >= %d"), 5, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_8:
    v3 = (void *)MEMORY[0x1E0CB3880];
    v7 = VCPPhotosSceneProcessingVersionInternal();
    v8 = (__int16)*MEMORY[0x1E0D75710];
    v4 = CFSTR("additionalAttributes.sceneAnalysisVersion >= %d &&  additionalAttributes.sceneAnalysisVersion != %d");
LABEL_11:
    v5 = v3;
    goto LABEL_12;
  }
  if (a3 == 3)
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    v4 = CFSTR("faceAdjustmentVersion != nil");
LABEL_12:
    objc_msgSend(v5, "predicateWithFormat:", v4, v7, v8);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3 != 10)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion >= %d"), 8, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)_queryProgressDetailExpress:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 extendedTimeoutBlock:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  int v56;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void (**v63)(_QWORD);
  _QWORD v64[6];
  _QWORD v65[6];
  _QWORD v66[2];
  _QWORD v67[3];
  _QWORD v68[3];
  uint8_t buf[4];
  unint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (a5 <= 0x10 && ((1 << a5) & 0x1140C) != 0)
  {
    v12 = mach_absolute_time();
    VCPSignPostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);

    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPAnalysisProgressQueryExpressPathFetchTotalCount", ", buf, 2u);
    }

    v17 = objc_msgSend(v10, "vcp_assetCountForTaskID:", a5);
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v14, "VCPAnalysisProgressQueryExpressPathFetchTotalCount", ", buf, 2u);
    }

    if (v12)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v61 = a1;
    objc_msgSend(a1, "_processedPredicateForTaskID:", a5);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = mach_absolute_time();
    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_generate(v22);

    VCPSignPostLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "VCPAnalysisProgressQueryExpressPathFetchProcessedCount", ", buf, 2u);
    }

    v26 = objc_msgSend(v10, "vcp_assetCountWithInternalPredicate:forTaskID:", v20, a5);
    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_END, v23, "VCPAnalysisProgressQueryExpressPathFetchProcessedCount", ", buf, 2u);
    }
    v62 = (void *)v20;
    v63 = v11;

    if (v21)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countForTaskID:withProcessingStatus:", a5, 2);
    v31 = objc_msgSend(v29, "countForTaskID:withProcessingStatus:", a5, 7);
    v32 = objc_msgSend(v29, "countForTaskID:withProcessingStatus:", a5, 3);
    v33 = objc_msgSend(v29, "countForTaskID:withProcessingStatus:", a5, 4);
    if (v31 + v30 + v32 + v33 >= (unint64_t)(v17 - v26))
      v34 = v17 - v26;
    else
      v34 = v31 + v30 + v32 + v33;
    v35 = (void *)MEMORY[0x1E0C99E08];
    v67[0] = CFSTR("failed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v36;
    v67[1] = CFSTR("processed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v37;
    v67[2] = CFSTR("total-allowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryWithDictionary:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 == 3)
    {
      v60 = v40;
      if (v63)
        v63[2](v63);
      objc_msgSend(MEMORY[0x1E0CB3880], "mad_prioritizedAssetsForFaceDetectionInternalPredicate");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v10, "vcp_assetCountWithInternalPredicate:forTaskID:", v41, 3);
      if (v63)
        v63[2](v63);
      v43 = (void *)MEMORY[0x1E0CB3528];
      v66[0] = v62;
      v66[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "andPredicateWithSubpredicates:", v44);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v10, "vcp_assetCountWithInternalPredicate:forTaskID:", v59, 3);
      v58 = (void *)v41;
      v46 = objc_msgSend(v29, "valueForKey:", CFSTR("NumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing"));
      v47 = objc_msgSend(v29, "valueForKey:", CFSTR("VCPKeyValueLastPromoterTimestamp"));
      v64[0] = CFSTR("prioritized-processed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v48;
      v64[1] = CFSTR("prioritized-total-allowed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v49;
      v64[2] = CFSTR("pet-vip-status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v61, "_vipStatusForPhotoLibrary:andType:", v10, 1));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v50;
      v64[3] = CFSTR("person-vip-status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v61, "_vipStatusForPhotoLibrary:andType:", v10, 0));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] = v51;
      v64[4] = CFSTR("processed-assets-with-promoter");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v65[4] = v52;
      v64[5] = CFSTR("last-promoter-timestamp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v47);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v65[5] = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addEntriesFromDictionary:", v54);

      v40 = v60;
    }
    v55 = objc_retainAutorelease(v40);
    *a3 = v55;

    v56 = 0;
    v11 = v63;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v70 = a5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query progress: unsupported taskID (%lu)", buf, 0xCu);
    }
    v56 = -50;
  }

  return v56;
}

+ (BOOL)_screenProgress
{
  return 0;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
    (*((void (**)(id))v11 + 2))(v11);
  v13 = mach_absolute_time();
  VCPSignPostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPAnalysisProgressQueryProgressDetail", ", buf, 2u);
  }

  if (a5 <= 0x10)
  {
    if (((1 << a5) & 0x1140C) != 0)
    {
      if ((objc_msgSend(a1, "_screenProgress") & 1) == 0)
      {
        v18 = objc_msgSend(a1, "_queryProgressDetailExpress:forPhotoLibrary:andTaskID:extendedTimeoutBlock:", a3, v10, a5, v12);
        goto LABEL_22;
      }
      goto LABEL_11;
    }
    if (a5 == 1)
    {
LABEL_11:
      v25 = 0;
      v18 = +[VCPAnalysisProgressQuery _scanPhotoLibrary:withTaskID:statistics:andExtendTimeoutBlock:](VCPAnalysisProgressQuery, "_scanPhotoLibrary:withTaskID:statistics:andExtendTimeoutBlock:", v10, a5, &v25, v12);
      v19 = v25;
      v20 = v19;
      if (!v18)
      {
        *a3 = objc_retainAutorelease(v19);
        VCPSignPostLog();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v15, "VCPAnalysisProgressQueryProgressDetail", ", buf, 2u);
        }

        if (v13)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
      }

      goto LABEL_22;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    VCPTaskIDDescription(a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query progress: unsupported taskID (%@)", buf, 0xCu);

  }
  v18 = -50;
LABEL_22:

  return v18;
}

+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  float v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t v27[8];
  id v28;
  uint8_t buf[16];

  v9 = a6;
  v10 = a4;
  v11 = mach_absolute_time();
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  VCPSignPostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPAnalysisProgressQueryProgress", ", buf, 2u);
  }

  v28 = 0;
  v16 = +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", &v28, v10, a5, v9);

  v17 = v28;
  v18 = v17;
  if (!v16)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("processed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("total-allowed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v22)
      v23 = (float)v20 / (float)v22;
    else
      v23 = 1.0;
    *a3 = v23;
    VCPSignPostLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, v13, "VCPAnalysisProgressQueryProgress", ", v27, 2u);
    }

    if (v11)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }

  return v16;
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4 withExtendTimeoutBlock:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  os_signpost_id_t spid;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[6];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v7 = mach_absolute_time();
    VCPSignPostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);

    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPAnalysisProgressQueryCachedFaceAnalysisProgress", ", buf, 2u);
    }

    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[CachedProgress] Failed to open MediaAnalysis database", buf, 2u);
      }
      v28 = -18;
      goto LABEL_27;
    }
    v15 = objc_msgSend(v13, "valueForKey:", CFSTR("NumberOfAssetsAllowedForPhotosFaceProcessing"));
    if (v15)
    {
      v16 = v15;
      spid = v9;
      v33 = v7;
      v17 = objc_msgSend(v14, "valueForKey:", CFSTR("NumberOfAssetsAnalyzedForPhotosFaceProcessing"));
      v18 = objc_msgSend(v14, "valueForKey:", CFSTR("NumberOfPrioritizedAssetsAnalyzedForPhotosFaceProcessing"));
      v19 = objc_msgSend(v14, "valueForKey:", CFSTR("NumberOfPrioritizedAssetsAllowedForPhotosFaceProcessing"));
      v31 = objc_msgSend(v14, "valueForKey:", CFSTR("NumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing"));
      v32 = objc_msgSend(v14, "valueForKey:", CFSTR("VCPKeyValueLastPromoterTimestamp"));
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v37 = v17;
        v38 = 2048;
        v39 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CachedProgress] Query cached face progress: %ld out of %ld", buf, 0x16u);
      }
      v34[0] = CFSTR("prioritized-processed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v20;
      v34[1] = CFSTR("prioritized-total-allowed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v21;
      v34[2] = CFSTR("processed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v22;
      v34[3] = CFSTR("total-allowed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v23;
      v34[4] = CFSTR("processed-assets-with-promoter");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v24;
      v34[5] = CFSTR("last-promoter-timestamp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[5] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, spid, "VCPAnalysisProgressQueryCachedFaceAnalysisProgress", ", buf, 2u);
      }

      v28 = v33;
      if (!v33)
        goto LABEL_27;
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[CachedProgress] No cached values", buf, 2u);
    }
    v28 = 0;
LABEL_27:

    goto LABEL_28;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[CachedProgress] Nil input parameter 'progress'", buf, 2u);
  }
  v28 = -50;
LABEL_28:

  return v28;
}

@end
