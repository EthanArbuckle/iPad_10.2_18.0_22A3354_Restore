@implementation PHAsset(MediaAnalysisComputeSync)

+ (uint64_t)mad_disableComputeSync
{
  return 0;
}

- (uint64_t)mad_isEligibleForComputeSync
{
  uint64_t v2;
  void *v3;

  if (!_os_feature_enabled_impl()
    || (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSync") & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(a1, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "isSystemPhotoLibrary");

  return v2;
}

- (uint64_t)mad_isEligibleForComputeSyncIngestion
{
  unsigned __int8 v1;
  void *v4;
  char v5;

  if ((v1 & 1) == 0
  {
    objc_msgSend(a1, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCloudPhotoLibraryEnabled");

    -[PHAsset(MediaAnalysisComputeSync) mad_isEligibleForComputeSyncIngestion]::eligible = v5;
  }
  return -[PHAsset(MediaAnalysisComputeSync) mad_isEligibleForComputeSyncIngestion]::eligible;
}

+ (void)vcp_requiredAnalysisForNextAnalysisStage:()MediaAnalysisComputeSync
{
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 100:
      return &unk_1E6B766F8;
    case 900:
      return &unk_1E6B76728;
    case 200:
      return &unk_1E6B76710;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown analysis stage (%d), no analysis required", (uint8_t *)v5, 8u);
  }
  return 0;
}

- (uint64_t)mad_isEligibleForAnalysis:()MediaAnalysisComputeSync
{
  int v3;
  uint64_t result;
  int v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
    case 4:
    case 6:
    case 7:
    case 8:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
      goto LABEL_2;
    case 2:
      if (((objc_msgSend(a1, "sourceType") & 1) != 0
         || (objc_msgSend(a1, "sourceType") & 4) != 0
         || (objc_msgSend(a1, "sourceType") & 0x20) != 0)
        && (objc_msgSend(a1, "isPartOfBurst") & 1) == 0)
      {
        goto LABEL_50;
      }
      return 0;
    case 3:
      if ((objc_msgSend(a1, "sourceType") & 1) == 0
        && (objc_msgSend(a1, "sourceType") & 4) == 0
        && (objc_msgSend(a1, "sourceType") & 0x20) == 0
        || (objc_msgSend(a1, "isPartOfBurst") & 1) != 0)
      {
        return 0;
      }
      objc_msgSend(a1, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isSystemPhotoLibrary"))
      {
        v8 = objc_msgSend(a1, "isGuestAsset");

        if ((v8 & 1) != 0)
          return 0;
      }
      else
      {

      }
      goto LABEL_50;
    case 5:
      return (objc_msgSend(a1, "sourceType") & 1) != 0
          || (objc_msgSend(a1, "sourceType") & 4) != 0
          || (objc_msgSend(a1, "sourceType") & 0x20) != 0;
    case 9:
      goto LABEL_13;
    case 10:
      if (((objc_msgSend(a1, "sourceType") & 1) != 0
         || (objc_msgSend(a1, "sourceType") & 4) != 0
         || (objc_msgSend(a1, "sourceType") & 0x20) != 0)
        && (objc_msgSend(a1, "isPartOfBurst") & 1) == 0
        && (objc_msgSend(a1, "vcp_isPano") & 1) == 0)
      {
        goto LABEL_50;
      }
      return 0;
    case 11:
      if ((objc_msgSend(a1, "sourceType") & 1) == 0
        && (objc_msgSend(a1, "sourceType") & 4) == 0
        && (objc_msgSend(a1, "sourceType") & 0x20) == 0)
      {
        return 0;
      }
      if ((objc_msgSend(a1, "vcp_isLivePhoto") & 1) == 0)
      {
        result = objc_msgSend(a1, "isVideo");
        if (!(_DWORD)result)
          return result;
      }
      objc_msgSend(a1, "mediaAnalysisProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "mediaAnalysisVersion");

      if (v10 >= 0x27)
        return 0;
      goto LABEL_50;
    case 12:
    case 16:
      if ((objc_msgSend(a1, "sourceType") & 1) == 0
        && (objc_msgSend(a1, "sourceType") & 4) == 0
        && (objc_msgSend(a1, "sourceType") & 0x20) == 0
        || (objc_msgSend(a1, "isPartOfBurst") & 1) != 0)
      {
        return 0;
      }
      result = objc_msgSend(a1, "isPhoto");
      if (!(_DWORD)result)
        return result;
      goto LABEL_50;
    default:
      if (a3 == 0x7FFFFFFF)
      {
LABEL_2:
        if ((objc_msgSend(a1, "sourceType") & 1) != 0
          || (objc_msgSend(a1, "sourceType") & 4) != 0
          || (objc_msgSend(a1, "sourceType") & 0x20) != 0)
        {
LABEL_50:
          v6 = objc_msgSend(a1, "isTrashed");
          return v6 ^ 1u;
        }
        return 0;
      }
LABEL_13:
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11[0] = 67109120;
        v11[1] = v3;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown taskID (%d), any untrashed asset will be considered eligible", (uint8_t *)v11, 8u);
      }
      if ((objc_msgSend(a1, "sourceType") & 1) == 0
        && (objc_msgSend(a1, "sourceType") & 4) == 0
        && (objc_msgSend(a1, "sourceType") & 0x20) == 0)
      {
        return 0;
      }
      v6 = objc_msgSend(a1, "isTrashed");
      return v6 ^ 1u;
  }
}

- (BOOL)mad_isEligibleForComputeSyncDownloadWithAnalysisTask:()MediaAnalysisComputeSync
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    switch(a3)
    {
      case 1:
        v7 = objc_msgSend(v5, "cloudAnalysisStage");
        goto LABEL_9;
      case 2:
        if (objc_msgSend(v5, "cloudAnalysisStage") == 100
          || objc_msgSend(v6, "cloudAnalysisStage") == 200)
        {
          goto LABEL_12;
        }
        goto LABEL_4;
      case 3:
      case 10:
      case 12:
        if (objc_msgSend(v5, "cloudAnalysisStage") == 200)
        {
LABEL_12:
          v9 = 1;
        }
        else
        {
LABEL_4:
          v7 = objc_msgSend(v6, "cloudAnalysisStage");
LABEL_9:
          v9 = v7 == 900;
        }
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a1, "localIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v10;
          v14 = 1024;
          v15 = a3;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Unsupported taskID (%d), ineligible for compute sync analysis download", (uint8_t *)&v12, 0x12u);

        }
        goto LABEL_16;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] missing MediaAnalysisProperties, ineligible for compute sync analysis download", (uint8_t *)&v12, 0xCu);

    }
LABEL_16:
    v9 = 0;
  }

  return v9;
}

- (uint64_t)mad_needsProcessingForComputeSyncWithAnalysis:()MediaAnalysisComputeSync
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a3 != 10)
    return objc_msgSend(a1, "vcp_needsProcessingForTask:");
  objc_msgSend(a1, "characterRecognitionProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "algorithmVersion") == 8 || objc_msgSend(v4, "algorithmVersion") == 0x7FFF)
  {
    objc_msgSend(v4, "adjustmentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDate:", v6) ^ 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (uint64_t)mad_analysisStageAfterCompletingAnalysis:()MediaAnalysisComputeSync
{
  __int128 v5;
  uint64_t i;
  void *v7;
  __int16 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  __int16 v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  void *context;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[14];
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = objc_msgSend(&unk_1E6B76740, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v26)
  {
    v27 = 0;
    v25 = *(_QWORD *)v34;
    *(_QWORD *)&v5 = 138413314;
    v23 = v5;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(&unk_1E6B76740);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        context = (void *)MEMORY[0x1BCCA1B2C]();
        v8 = objc_msgSend(v7, "intValue");
        objc_msgSend((id)objc_opt_class(), "vcp_requiredAnalysisForNextAnalysisStage:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v10);
              v14 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "unsignedIntegerValue", v23);
              if (v14 != a3
                && objc_msgSend(a1, "mad_isEligibleForAnalysis:", v14)
                && objc_msgSend(a1, "mad_needsProcessingForComputeSyncWithAnalysis:", v14))
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(a1, "localIdentifier");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  VCPTaskIDDescription(a3);
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  VCPTaskIDDescription(v14);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v23;
                  v38 = v16;
                  v39 = 1024;
                  v40 = v8;
                  v41 = 1024;
                  *(_DWORD *)v42 = v27;
                  *(_WORD *)&v42[4] = 2112;
                  *(_QWORD *)&v42[6] = v17;
                  v43 = 2112;
                  v44 = v18;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Unable to reach next stage %d (current stage %d) after completing %@ due to incomplete %@", buf, 0x2Cu);

                }
                v15 = 0;
                v24 = v27;
                goto LABEL_21;
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
            if (v11)
              continue;
            break;
          }
        }
        v15 = 1;
LABEL_21:

        objc_autoreleasePoolPop(context);
        if (!v15)
          return v24;
        v27 = v8;
      }
      v26 = objc_msgSend(&unk_1E6B76740, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      v27 = v8;
      if (v26)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  if ((int)MediaAnalysisLogLevel() < 7)
    return v8;
  v19 = v8;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    VCPTaskIDDescription(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = v20;
    v39 = 1024;
    v40 = v8;
    v41 = 2112;
    *(_QWORD *)v42 = v21;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Reaching stage %d after completing %@", buf, 0x1Cu);

    return v8;
  }
  return v19;
}

- (uint64_t)mad_analysisStageAfterDroppingAnalysis:()MediaAnalysisComputeSync
{
  int v3;
  __int128 v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[14];
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v29 = objc_msgSend(&unk_1E6B76758, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v29)
  {
    v30 = 0;
    v28 = *(_QWORD *)v37;
    *(_QWORD *)&v6 = 138413314;
    v26 = v6;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(&unk_1E6B76758);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        context = (void *)MEMORY[0x1BCCA1B2C]();
        v9 = objc_msgSend(v8, "intValue");
        v10 = (__int16)v9;
        objc_msgSend((id)objc_opt_class(), "vcp_requiredAnalysisForNextAnalysisStage:", (__int16)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        if (v13)
        {
          v27 = v3;
          v14 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v12);
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "unsignedIntegerValue", v26);
              if (v16 == a3)
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(a1, "localIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  VCPTaskIDDescription(a3);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v41 = v18;
                  v42 = 1024;
                  v43 = (__int16)v30;
                  v44 = 2112;
                  *(_QWORD *)v45 = v19;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Falling to stage %d after dropping %@", buf, 0x1Cu);

                }
                goto LABEL_24;
              }
              if (objc_msgSend(a1, "mad_isEligibleForAnalysis:", v16)
                && objc_msgSend(a1, "mad_needsProcessingForComputeSyncWithAnalysis:", v16))
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(a1, "localIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  VCPTaskIDDescription(a3);
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                  VCPTaskIDDescription(v16);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v26;
                  v41 = v20;
                  v42 = 1024;
                  v43 = v10;
                  v44 = 1024;
                  *(_DWORD *)v45 = (__int16)v30;
                  *(_WORD *)&v45[4] = 2112;
                  *(_QWORD *)&v45[6] = v21;
                  v46 = 2112;
                  v47 = v22;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Unable to reach next stage %d (current stage %d) after dropping %@ due to incomplete %@", buf, 0x2Cu);

                }
LABEL_24:
                v17 = 0;
                v3 = v30;
                goto LABEL_25;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
            if (v13)
              continue;
            break;
          }
          v17 = 1;
          v30 = v9;
          v3 = v27;
        }
        else
        {
          v17 = 1;
          v30 = v9;
        }
LABEL_25:

        objc_autoreleasePoolPop(context);
        if (!v17)
        {
          LOWORD(v30) = v3;
          return (__int16)v30;
        }
      }
      v29 = objc_msgSend(&unk_1E6B76758, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v29)
        continue;
      break;
    }
  }
  else
  {
    LOWORD(v30) = 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "localIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    VCPTaskIDDescription(a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v23;
    v42 = 1024;
    v43 = (__int16)v30;
    v44 = 2112;
    *(_QWORD *)v45 = v24;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ComputeSyncStage][%@] Reaching stage %d after dropping %@", buf, 0x1Cu);

  }
  return (__int16)v30;
}

- (id)mad_refetchAsset
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  void *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD1578]);
  objc_msgSend(a1, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoLibrary:", v3);

  v4 = *MEMORY[0x1E0CD1A58];
  v28[0] = *MEMORY[0x1E0CD1A00];
  v28[1] = v4;
  v5 = *MEMORY[0x1E0CD1948];
  v28[2] = *MEMORY[0x1E0CD1990];
  v28[3] = v5;
  v6 = *MEMORY[0x1E0CD19F8];
  v28[4] = *MEMORY[0x1E0CD1A90];
  v28[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v7);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MADRefetchAsset", ", (uint8_t *)&v23, 2u);
  }

  v12 = (void *)MEMORY[0x1E0CD1398];
  objc_msgSend(a1, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v14, v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v9, "MADRefetchAsset", ", (uint8_t *)&v23, 2u);
  }

  if (objc_msgSend(v15, "count"))
  {
    if ((unint64_t)objc_msgSend(v15, "count") >= 2
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "count");
      v23 = 138412546;
      v24 = v18;
      v25 = 1024;
      v26 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Re-fetched %d assets, using first one", (uint8_t *)&v23, 0x12u);

    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to re-fetch asset to obtain updated properties", (uint8_t *)&v23, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

@end
