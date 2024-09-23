@implementation PHAsset(MediaAnalysis)

+ (float)mad_sceneConfidenceThresholdForTask:()MediaAnalysis
{
  if (a4 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CD1398], "vcp_ocrGatingThreshold");
    *(float *)&a1 = a1;
  }
  else
  {
    LODWORD(a1) = 0;
    if (a4 == 3)
      objc_msgSend(MEMORY[0x1E0CD1398], "mad_peopleThreshold", a1);
  }
  return *(float *)&a1;
}

+ (uint64_t)vcp_longMovieDurationThreshold
{
  return 60;
}

+ (uint64_t)vcp_shortMovieDurationThreshold
{
  return 1;
}

- (const)vcp_typeDescription
{
  char v2;
  const __CFString *v3;
  const __CFString *v4;
  BOOL v5;
  uint64_t v6;

  if (objc_msgSend(a1, "mediaType") == 1)
  {
    if ((objc_msgSend(a1, "mediaSubtypes") & 8) != 0)
      return CFSTR("Live Photo");
    if ((objc_msgSend(a1, "mediaSubtypes") & 1) != 0)
      return CFSTR("Pano Photo");
    if ((objc_msgSend(a1, "mediaSubtypes") & 4) != 0)
      return CFSTR("Screenshot");
    if ((objc_msgSend(a1, "mediaSubtypes") & 2) != 0)
      return CFSTR("HDR Photo");
    v2 = objc_msgSend(a1, "mediaSubtypes");
    v3 = CFSTR("SDOF Photo");
    v4 = CFSTR("Photo");
    v5 = (v2 & 0x10) == 0;
  }
  else
  {
    if (objc_msgSend(a1, "mediaType") != 2)
      return CFSTR("Unknown");
    if ((objc_msgSend(a1, "mediaSubtypes") & 0x20000) != 0)
      return CFSTR("Slow-mo Movie");
    v6 = objc_msgSend(a1, "mediaSubtypes");
    v3 = CFSTR("Timelapse Movie");
    v4 = CFSTR("Movie");
    v5 = (v6 & 0x40000) == 0;
  }
  if (v5)
    return v4;
  else
    return v3;
}

- (double)vcp_originalSize
{
  double v2;

  v2 = (double)(unint64_t)objc_msgSend(a1, "pixelWidth");
  objc_msgSend(a1, "pixelHeight");
  return v2;
}

- (id)vcp_modificationDate
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "adjustmentTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "adjustmentTimestamp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "creationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(a1, "creationDate");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)vcp_eligibleForVideoDownload:()MediaAnalysis
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (((objc_msgSend(a1, "isVideo") & 1) != 0 || (objc_msgSend(a1, "vcp_isLivePhoto") & 1) != 0)
    && (objc_msgSend(a1, "vcp_isVideoSlowmo") & 1) == 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", a1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "vcp_smallMovieDerivativeResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Asset has no small video derivative; skipping",
          (uint8_t *)&v12,
          0xCu);

      }
      goto LABEL_16;
    }
    if (objc_msgSend(a1, "isVideo"))
    {
      v7 = objc_msgSend(v6, "fileSize");
      if (v7 > +[VCPDownloadManager maxSizeBytes](VCPDownloadManager, "maxSizeBytes"))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a1, "localIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] File size exceeds streaming threshold; skipping",
            (uint8_t *)&v12,
            0xCu);

        }
LABEL_16:
        v5 = 0;
LABEL_23:

        goto LABEL_24;
      }
      if (!v7 && objc_msgSend(a1, "vcp_isLongMovie"))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a1, "localIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Duration exceeds streaming threshold; skipping",
            (uint8_t *)&v12,
            0xCu);

        }
        goto LABEL_16;
      }
    }
    v5 = 1;
    goto LABEL_23;
  }
  v5 = 0;
LABEL_24:

  return v5;
}

+ (id)vcp_fetchOptionsForLibrary:()MediaAnalysis forTaskID:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[4];
  _QWORD v51[6];
  _QWORD v52[3];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[6];
  _QWORD v56[2];
  _QWORD v57[6];
  _QWORD v58[7];
  uint64_t v59;
  _QWORD v60[8];
  _QWORD v61[2];
  _QWORD v62[2];
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4 - 1;
  if ((unint64_t)(a4 - 1) < 0x10 && ((0x8EBFu >> v6) & 1) != 0)
  {
    v7 = qword_1B6FBF2B8[v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v64 = a4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unknown VCPTaskID (%lu); redirect to VCPTaskID_MediaAnalysis",
        buf,
        0xCu);
    }
    v7 = 1;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CD1578]);
  objc_msgSend(v8, "setIncludeAssetSourceTypes:", 5);
  if (v7 > 11)
  {
    if (v7 == 12 || v7 == 16)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB3880], "vcp_imagesPredicate:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPredicate:", v9);
      goto LABEL_16;
    }
  }
  else
  {
    if ((unint64_t)(v7 - 2) < 2)
      goto LABEL_17;
    if (v7 == 10)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3880], "vcp_nonPanoPredicate:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPredicate:", v9);
LABEL_16:

      goto LABEL_17;
    }
  }
  objc_msgSend(v8, "setIncludeAllBurstAssets:", 1);
  switch(v7)
  {
    case 10:
      goto LABEL_11;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB3880], "vcp_fullAnalysisPredatesVersionInternalPredicate:", 39);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "vcp_livePhotosPredicate:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "vcp_moviesPredicate:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0CB3528];
      v62[0] = v48;
      v62[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "orPredicateWithSubpredicates:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = (void *)MEMORY[0x1E0CB3528];
      v61[0] = v9;
      v61[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "andPredicateWithSubpredicates:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setInternalPredicate:", v47);

      goto LABEL_16;
    case 12:
    case 16:
      goto LABEL_15;
    default:
      break;
  }
LABEL_17:
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "isMultiLibraryModeEnabled"))
  {
    v10 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setPhotoLibrary:", v10);
    if (!v5)

  }
  objc_msgSend(v8, "setIncludeGuestAssets:", 1);
  switch(v7)
  {
    case 1:
      v11 = *MEMORY[0x1E0CD1A00];
      v60[0] = *MEMORY[0x1E0CD19F8];
      v60[1] = v11;
      v12 = *MEMORY[0x1E0CD1A58];
      v60[2] = *MEMORY[0x1E0CD1A20];
      v60[3] = v12;
      v13 = *MEMORY[0x1E0CD1990];
      v60[4] = *MEMORY[0x1E0CD1A68];
      v60[5] = v13;
      v14 = *MEMORY[0x1E0CD1A90];
      v60[6] = *MEMORY[0x1E0CD1948];
      v60[7] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v15);

      if (objc_msgSend(v5, "vcp_isSyndicationLibrary"))
      {
        v59 = *MEMORY[0x1E0CD1970];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addFetchPropertySets:", v16);
        goto LABEL_38;
      }
      goto LABEL_39;
    case 2:
      v17 = *MEMORY[0x1E0CD1A58];
      v58[0] = *MEMORY[0x1E0CD1A00];
      v58[1] = v17;
      v18 = *MEMORY[0x1E0CD1990];
      v58[2] = *MEMORY[0x1E0CD19A8];
      v58[3] = v18;
      v19 = *MEMORY[0x1E0CD1A90];
      v58[4] = *MEMORY[0x1E0CD1948];
      v58[5] = v19;
      v58[6] = *MEMORY[0x1E0CD19F8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 3:
      if (objc_msgSend(v5, "isSystemPhotoLibrary"))
        objc_msgSend(v8, "setIncludeGuestAssets:", 0);
      v20 = *MEMORY[0x1E0CD1990];
      v57[0] = *MEMORY[0x1E0CD1A00];
      v57[1] = v20;
      v21 = *MEMORY[0x1E0CD1948];
      v57[2] = *MEMORY[0x1E0CD1A58];
      v57[3] = v21;
      v22 = *MEMORY[0x1E0CD19F8];
      v57[4] = *MEMORY[0x1E0CD1A90];
      v57[5] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 4:
      v23 = *MEMORY[0x1E0CD1A00];
      v55[0] = *MEMORY[0x1E0CD19F8];
      v55[1] = v23;
      v24 = *MEMORY[0x1E0CD1A58];
      v55[2] = *MEMORY[0x1E0CD1A20];
      v55[3] = v24;
      v25 = *MEMORY[0x1E0CD1990];
      v55[4] = *MEMORY[0x1E0CD1A68];
      v55[5] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 5:
      objc_msgSend(v8, "setIncludeTrashedAssets:", 1);
      goto LABEL_31;
    case 6:
      v27 = *MEMORY[0x1E0CD1A00];
      v54[0] = *MEMORY[0x1E0CD19F8];
      v54[1] = v27;
      v28 = *MEMORY[0x1E0CD1A58];
      v54[2] = *MEMORY[0x1E0CD1A20];
      v54[3] = v28;
      v29 = *MEMORY[0x1E0CD1990];
      v54[4] = *MEMORY[0x1E0CD1A68];
      v54[5] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 8:
      v30 = *MEMORY[0x1E0CD1990];
      v56[0] = *MEMORY[0x1E0CD1A00];
      v56[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 10:
      v31 = *MEMORY[0x1E0CD1A00];
      v53[0] = *MEMORY[0x1E0CD1948];
      v53[1] = v31;
      v32 = *MEMORY[0x1E0CD1990];
      v53[2] = *MEMORY[0x1E0CD1A58];
      v53[3] = v32;
      v33 = *MEMORY[0x1E0CD19F8];
      v53[4] = *MEMORY[0x1E0CD1A90];
      v53[5] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 11:
      v34 = *MEMORY[0x1E0CD1A00];
      v52[0] = *MEMORY[0x1E0CD19F8];
      v52[1] = v34;
      v52[2] = *MEMORY[0x1E0CD1990];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 12:
      v35 = *MEMORY[0x1E0CD1A58];
      v51[0] = *MEMORY[0x1E0CD1A00];
      v51[1] = v35;
      v36 = *MEMORY[0x1E0CD1990];
      v51[2] = *MEMORY[0x1E0CD1A90];
      v51[3] = v36;
      v37 = *MEMORY[0x1E0CD19F8];
      v51[4] = *MEMORY[0x1E0CD1948];
      v51[5] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    case 16:
      v38 = *MEMORY[0x1E0CD1A58];
      v50[0] = *MEMORY[0x1E0CD1A00];
      v50[1] = v38;
      v39 = *MEMORY[0x1E0CD1990];
      v50[2] = *MEMORY[0x1E0CD1A90];
      v50[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
      goto LABEL_38;
    default:
LABEL_31:
      v26 = *MEMORY[0x1E0CD1990];
      v49[0] = *MEMORY[0x1E0CD1A00];
      v49[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v16);
LABEL_38:

LABEL_39:
      return v8;
  }
}

- (uint64_t)vcp_hasAdjustments:()MediaAnalysis
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "vcp_isVideoSlowmo") & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "type", (_QWORD)v10) == 6)
          {
            v6 = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v6 = objc_msgSend(a1, "hasAdjustments");
  }

  return v6;
}

- (uint64_t)vcp_targetMajorDimensionForImageWithWidth:()MediaAnalysis height:andMinPreferredMinorDimension:
{
  double v7;
  int v8;
  int v10;
  int v11;
  signed int v12;
  signed int v13;
  double v14;
  signed int v15;
  signed int v16;
  void *v17;
  int v19;
  void *v20;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  signed int v26;
  __int16 v27;
  signed int v28;
  uint64_t v29;

  v7 = (double)a5;
  v29 = *MEMORY[0x1E0C80C00];
  if (a3 >= a4)
    v8 = a4;
  else
    v8 = a3;
  if ((double)v8 > v7)
  {
    v10 = vcvtmd_s64_f64(log2((double)v8 / v7));
    v11 = 1 << (v10 - 1);
    if (!v10)
      v11 = 0;
    v12 = ((v11 + a3) >> v10) & 0xFFFFFFFE;
    v13 = ((v11 + a4) >> v10) & 0xFFFFFFFE;
    if (v12 * v13 >= 3657831)
    {
      v14 = (double)a3;
      v15 = (int)(sqrt((double)a3 * 3048192.0 / (double)a4) + 0.5) & 0xFFFFFFFE;
      v16 = (int)(sqrt((double)a4 * 3048192.0 / v14) + 0.5) & 0xFFFFFFFE;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v17;
        v25 = 1024;
        v26 = v15;
        v27 = 1024;
        v28 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at scaled resolution (%dx%d)", (uint8_t *)&v23, 0x18u);

      }
      if (v15 <= v16)
        return v16;
      else
        return v15;
    }
    v19 = MediaAnalysisLogLevel();
    if (v10 >= 1)
    {
      if (v19 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v20;
        v25 = 1024;
        v26 = v12;
        v27 = 1024;
        v28 = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at subsampled resolution (%dx%d)", (uint8_t *)&v23, 0x18u);

      }
      if (v12 <= v13)
        return v13;
      else
        return v12;
    }
    if (v19 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v22;
      v25 = 1024;
      v26 = a3;
      v27 = 1024;
      v28 = a4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at full resolution (%dx%d)", (uint8_t *)&v23, 0x18u);

    }
  }
  return 0;
}

- (unint64_t)vcp_majorDimensionForResource:()MediaAnalysis withTargetResolution:
{
  id v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  signed int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v25;
      v32 = 1024;
      v33 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid target resolution (%d)", (uint8_t *)&v30, 0x12u);

    }
    goto LABEL_39;
  }
  v8 = objc_msgSend(v6, "pixelWidth");
  v9 = objc_msgSend(v7, "pixelHeight");
  v10 = v9;
  if (!v8 || !v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413058;
      v31 = v11;
      v32 = 1024;
      v33 = objc_msgSend(v7, "type");
      v34 = 1024;
      v35 = v8;
      v36 = 1024;
      v37 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
        (uint8_t *)&v30,
        0x1Eu);

    }
    v8 = objc_msgSend(a1, "pixelWidth");
    v12 = objc_msgSend(a1, "pixelHeight");
    v10 = v12;
    if (!v8 || !v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v26;
        v32 = 1024;
        v33 = v8;
        v34 = 1024;
        v35 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Asset has invalid dimensions (%dx%d)", (uint8_t *)&v30, 0x18u);

      }
      goto LABEL_39;
    }
  }
  if (v8 * v10 <= a4)
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_39;
LABEL_38:
    objc_msgSend(a1, "localIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412802;
    v31 = v28;
    v32 = 1024;
    v33 = v8;
    v34 = 1024;
    v35 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at full resolution (%dx%d)", (uint8_t *)&v30, 0x18u);

LABEL_39:
    v24 = 0;
    goto LABEL_40;
  }
  v13 = (double)v8;
  v14 = (double)v10;
  v15 = (double)a4;
  v16 = vcvtmd_u64_f64(log2(sqrt((double)v10 * (double)v8 / ((double)a4 * 0.9))));
  v17 = 1 << (v16 - 1);
  if (!v16)
    v17 = 0;
  v18 = ((unint64_t)(v17 + v8) >> v16) & 0xFFFFFFFFFFFFFFFELL;
  v19 = ((unint64_t)(v17 + v10) >> v16) & 0xFFFFFFFFFFFFFFFELL;
  if (v18 * v19 > (unint64_t)(v15 * 6.0 / 5.0))
  {
    v20 = (int)(sqrt(v15 * v13 / v14) + 0.5) & 0xFFFFFFFE;
    v21 = (int)(sqrt(v15 * v14 / v13) + 0.5) & 0xFFFFFFFE;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v22;
      v32 = 1024;
      v33 = v20;
      v34 = 1024;
      v35 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at scaled resolution (%dx%d)", (uint8_t *)&v30, 0x18u);

    }
    if (v20 <= v21)
      v23 = v21;
    else
      v23 = v20;
    v24 = v23;
    goto LABEL_40;
  }
  if (!v16)
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_39;
    goto LABEL_38;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "localIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412802;
    v31 = v27;
    v32 = 1024;
    v33 = v18;
    v34 = 1024;
    v35 = v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Processing image at subsampled resolution (%dx%d)", (uint8_t *)&v30, 0x18u);

  }
  if (v18 <= v19)
    v24 = v19;
  else
    v24 = v18;
LABEL_40:

  return v24;
}

- (uint64_t)vcp_needsFullAnalysisProcessing
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "mad_isNonLivePhotoImage"))
  {
    if (v2 && (int)objc_msgSend(v2, "mediaAnalysisImageVersion") >= 69)
    {
LABEL_9:
      objc_msgSend(v2, "mediaAnalysisTimeStamp");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "vcp_modificationDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "isEqualToDate:", v5) ^ 1;

      goto LABEL_10;
    }
  }
  else if (v2
         && (unint64_t)objc_msgSend(v2, "mediaAnalysisVersion") >= 0x45
         && (int)objc_msgSend(v2, "mediaAnalysisImageVersion") >= 69)
  {
    goto LABEL_9;
  }
  v3 = 1;
LABEL_10:

  return v3;
}

- (BOOL)vcp_needsImageCaptionProcessing
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (+[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode") != 1)
    return 0;
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "imageCaptionVersion") < 69;
  else
    v4 = 1;

  return v4;
}

- (BOOL)vcp_needsVideoCaptionProcessing
{
  void *v2;
  _BOOL8 v3;

  if (+[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode") != 1)
    return 0;
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "mad_isNonLivePhotoImage") & 1) != 0)
  {
    v3 = 0;
  }
  else if (v2)
  {
    v3 = (int)objc_msgSend(v2, "videoCaptionVersion") < 69;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (uint64_t)vcp_needsProcessingForTask:()MediaAnalysis
{
  uint64_t result;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      return objc_msgSend(a1, "vcp_needsFullAnalysisProcessing");
    case 2:
      return objc_msgSend(a1, "vcp_needSceneProcessing");
    case 3:
      return objc_msgSend(a1, "vcp_needsFaceProcessing");
    case 10:
      return objc_msgSend(a1, "vcp_needsOCRProcessing");
    case 12:
      if ((objc_msgSend(a1, "vcp_needsVisualSearchProcessing") & 1) != 0)
        return 1;
      else
        return objc_msgSend(a1, "vcp_needsStickerGatingProcessing");
    default:
      if ((int)MediaAnalysisLogLevel() < 5)
        return 0;
      result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
      {
        VCPTaskIDDescription(a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "-[PHAsset vcp_needsProcessingForTask] not implemented for %@", (uint8_t *)&v7, 0xCu);

        return 0;
      }
      return result;
  }
}

- (uint64_t)vcp_isLongMovie
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "isVideo");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "duration");
    return v3 > (double)(unint64_t)objc_msgSend((id)objc_opt_class(), "vcp_longMovieDurationThreshold");
  }
  return result;
}

@end
