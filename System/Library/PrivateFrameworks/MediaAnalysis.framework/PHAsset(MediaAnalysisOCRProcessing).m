@implementation PHAsset(MediaAnalysisOCRProcessing)

- (uint64_t)vcp_needsOCRProcessing
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "characterRecognitionProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "algorithmVersion") < 8 || objc_msgSend(v2, "algorithmVersion") == 0x7FFF)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "adjustmentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToDate:", v5) ^ 1;

  }
  return v3;
}

- (BOOL)vcp_isDownloadGated
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "characterRecognitionProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "algorithmVersion") == 0x7FFF;

  return v2;
}

+ (double)vcp_ocrGatingThreshold
{
  return 0.11;
}

- (id)vcp_passedOCRGating
{
  void *v2;
  int v3;
  __int16 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  _BOOL4 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sceneAnalysisVersion");
  if (VCPPhotosSceneProcessingVersionInternal() != v3)
  {
    v4 = objc_msgSend(v2, "sceneAnalysisVersion");
    if (*MEMORY[0x1E0D75710] != v4)
      goto LABEL_27;
  }
  objc_msgSend(v2, "sceneAnalysisTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if (v7)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "sceneClassifications", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v12, "extendedSceneIdentifier") == 2147482063)
          {
            objc_msgSend(v12, "confidence");
            v17 = v16;
            objc_msgSend(MEMORY[0x1E0CD1398], "vcp_ocrGatingThreshold");
            v19 = v18;
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(a1, "localIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "confidence");
              *(_DWORD *)buf = 138412802;
              v28 = v20;
              v29 = 2048;
              v30 = v21;
              v31 = 1024;
              v32 = v17 >= v19;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Text Confidence: %0.2f Passed Gating: %d", buf, 0x1Cu);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 >= v19);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v9)
          continue;
        break;
      }
    }

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "localIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Text Confidence: 0.00f Passed Gating: 0 [Absent]", buf, 0xCu);

    }
    v14 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
LABEL_27:
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Asset scene properties unavailable or out-of-date", buf, 0xCu);

    }
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (uint64_t)vcp_ocrMajorDimensionForResource:()MediaAnalysisOCRProcessing
{
  id v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "pixelWidth");
  v6 = objc_msgSend(v4, "pixelHeight");
  v7 = v6;
  if (v5 && v6)
    goto LABEL_8;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v8;
    v15 = 1024;
    v16 = objc_msgSend(v4, "type");
    v17 = 1024;
    v18 = v5;
    v19 = 1024;
    v20 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
      (uint8_t *)&v13,
      0x1Eu);

  }
  v5 = objc_msgSend(a1, "pixelWidth");
  v9 = objc_msgSend(a1, "pixelHeight");
  v7 = v9;
  if (v5 && v9)
  {
LABEL_8:
    v10 = objc_msgSend(a1, "vcp_targetMajorDimensionForImageWithWidth:height:andMinPreferredMinorDimension:", v5, v7, 1210);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 1024;
      v16 = v5;
      v17 = 1024;
      v18 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Asset has invalid dimensions (%dx%d)", (uint8_t *)&v13, 0x18u);

    }
    v10 = 0;
  }

  return v10;
}

@end
