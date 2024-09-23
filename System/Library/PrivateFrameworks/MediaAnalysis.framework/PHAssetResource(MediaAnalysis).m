@implementation PHAssetResource(MediaAnalysis)

+ (id)vcp_allowedBundlesForSyndicationLibrary
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v4[0] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  v4[1] = CFSTR("com.apple.FileProvider.LocalStorage");
  v4[2] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  v4[3] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  v4[4] = CFSTR("com.apple.photos.filesPlaceholder");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilenotes"));
  return v2;
}

+ (id)vcp_allResourcesForAsset:()MediaAnalysis
{
  objc_msgSend(MEMORY[0x1E0CD1440], "assetResourcesForAsset:includeDerivatives:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vcp_allAcceptableResourcesForAsset:()MediaAnalysis
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allResourcesForAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isGuestAsset"))
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSystemPhotoLibrary");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "vcp_isSyndicationLibrary");

  if (!v8)
  {
    if (v6)
      goto LABEL_15;
LABEL_10:
    v13 = v4;
    goto LABEL_27;
  }
  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  objc_msgSend(v3, "curationProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "importedByBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend((id)objc_opt_class(), "vcp_allowedBundlesForSyndicationLibrary"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v10),
        v11,
        (v12 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v14;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][%@] Syndication library asset not from Notes / Files; skipping original resource",
        buf,
        0x16u);

    }
    goto LABEL_15;
  }

  if ((v6 & 1) == 0)
    goto LABEL_10;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v19, "type", (_QWORD)v21) != 2
          && objc_msgSend(v19, "type") != 1
          && objc_msgSend(v19, "type") != 9)
        {
          objc_msgSend(v13, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

LABEL_27:
  return v13;
}

- (id)vcp_uniformTypeIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(a1, "uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "typeWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)vcp_isMovie
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "vcp_uniformTypeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC640]);

  }
  return v3;
}

- (uint64_t)vcp_isPhoto
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v2;
}

- (BOOL)vcp_isVideoResourceUsable:()MediaAnalysis
{
  return objc_msgSend(a1, "type") != 14
      && objc_msgSend(a1, "type") != 15
      && (!a3
       || objc_msgSend(a1, "type") != 9
       && objc_msgSend(a1, "type") != 2
       && objc_msgSend(a1, "type") != 11
       && objc_msgSend(a1, "type") != 12);
}

- (BOOL)vcp_isPhotoResourceUsable:()MediaAnalysis
{
  return objc_msgSend(a1, "type") != 13
      && objc_msgSend(a1, "type") != 101
      && (!a3 || objc_msgSend(a1, "type") != 1 && objc_msgSend(a1, "type") != 8);
}

- (BOOL)vcp_isDecodable
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:](VCPImageManager, "canDecodeAcceleratedUniformTypeIdentifier:", v1);

  return v2;
}

- (uint64_t)vcp_isLocallyAvailable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_isLocallyAvailable))
    return objc_msgSend(a1, "isLocallyAvailable");
  objc_msgSend(a1, "privateFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)vcp_hasExtremeAbnormalDimensionForScene
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;

  if (objc_msgSend(a1, "pixelHeight") < 1)
  {
    v3 = 1.0;
  }
  else
  {
    v2 = (double)objc_msgSend(a1, "pixelWidth");
    v3 = v2 / (double)objc_msgSend(a1, "pixelHeight");
  }
  v4 = objc_msgSend(a1, "pixelWidth");
  v5 = objc_msgSend(a1, "pixelHeight");
  if (v3 <= 10.0 && v3 >= 0.1)
    return 0;
  if (v4 >= v5)
    v7 = v5;
  else
    v7 = v4;
  return v7 < 0x32;
}

- (uint64_t)vcp_fileSize
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "privateFileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileSize");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)vcp_size
{
  double v2;

  v2 = (double)(uint64_t)((objc_msgSend(a1, "pixelWidth") + 1) & 0xFFFFFFFFFFFFFFFELL);
  objc_msgSend(a1, "pixelHeight");
  return v2;
}

+ (void)vcp_ascendingSizeComparator
{
  return &__block_literal_global_49;
}

+ (void)vcp_descendingSizeComparator
{
  return &__block_literal_global_170_0;
}

+ (uint64_t)mad_disableComputeSyncDownload
{
  return 0;
}

- (id)mad_existingAnalysisFromComputeSyncForAsset:()MediaAnalysis allowDownload:cancel:
{
  id v8;
  unsigned int (**v9)(_QWORD);
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  VCPProtoAssetAnalysis *v16;
  VCPProtoAssetAnalysis *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "mad_isEligibleForComputeSync") & 1) != 0
    && objc_msgSend(v8, "mad_isEligibleForComputeSyncIngestion"))
  {
    if (objc_msgSend(a1, "type") != 112)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v11;
        v48 = 1024;
        LODWORD(v49) = objc_msgSend(a1, "type");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid resource type (%d), unable to extract analysis results from compute sync", buf, 0x12u);

      }
      goto LABEL_12;
    }
    if (v9 && v9[2](v9))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Analysis extraction from compute sync resource cancelled", buf, 0xCu);

      }
      goto LABEL_12;
    }
    objc_msgSend(a1, "privateFileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 && (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSyncDownload") & 1) == 0)
    {
      if ((objc_msgSend(v8, "mad_isEligibleForComputeSyncDownloadWithAnalysisTask:", 1) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "localIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v32;
          v48 = 1024;
          LODWORD(v49) = 1;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Ineligible for compute sync downalod with taskID %d", buf, 0x12u);

        }
        goto LABEL_50;
      }
      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_generate(v23);

      VCPSignPostLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "MADDownloadComputeSyncResource", ", buf, 2u);
      }

      v45 = v14;
      v27 = objc_msgSend(MEMORY[0x1E0CD1450], "vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:", a1, 1, &v45, v9);
      v28 = v45;

      VCPSignPostLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v24, "MADDownloadComputeSyncResource", ", buf, 2u);
      }

      if (v27)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "localIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v31;
          v48 = 1024;
          LODWORD(v49) = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to download compute sync resource (%d)", buf, 0x12u);

        }
        v12 = 0;
        v14 = v28;
        goto LABEL_61;
      }
      v14 = v28;
      if (v28)
        goto LABEL_17;
    }
    else if (v14)
    {
LABEL_17:
      if ((objc_msgSend(a1, "isLocallyAvailable") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CD1440], "computeSyncMediaAnalysisPayloadDataForResourceURL:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "localIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v33;
            v48 = 2112;
            v49 = v34;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] No MediaAnalysis payload data in compute sync resource at %@", buf, 0x16u);

          }
          v12 = 0;
          goto LABEL_60;
        }
        v16 = -[VCPProtoAssetAnalysis initWithData:]([VCPProtoAssetAnalysis alloc], "initWithData:", v15);
        v17 = v16;
        if (!v16)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "localIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v15, "length");
            *(_DWORD *)buf = 138412802;
            v47 = v35;
            v48 = 2112;
            v49 = v36;
            v50 = 1024;
            LODWORD(v51) = v37;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to recover proto from payload data (compute sync resource: %@, MediaAnalysis payload: %d bytes)", buf, 0x1Cu);

          }
          v12 = 0;
          goto LABEL_59;
        }
        -[VCPProtoAssetAnalysis exportToLegacyDictionary](v16, "exportToLegacyDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "vcp_dateModified");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "vcp_modificationDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToDate:", v21);

          if ((v22 & 1) != 0)
          {
            v12 = v19;
LABEL_58:

LABEL_59:
LABEL_60:

            goto LABEL_61;
          }
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "localIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "vcp_dateModified");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "vcp_modificationDate");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v47 = v42;
            v48 = 2112;
            v49 = v43;
            v50 = 2112;
            v51 = v44;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Analysis results from compute sync is outdated (modification date in analysis: %@ vs asset: %@)", buf, 0x20u);

          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "localIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v15, "length");
          *(_DWORD *)buf = 138412802;
          v47 = v39;
          v48 = 2112;
          v49 = v40;
          v50 = 1024;
          LODWORD(v51) = v41;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to deserialize analysis results from proto (compute sync resource: %@, MediaAnalysis payload: %d bytes)", buf, 0x1Cu);

        }
        v12 = 0;
        goto LABEL_58;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "localIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v38;
      v48 = 1024;
      LODWORD(v49) = a4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Compute sync resource not locally available (allowDownload: %d)", buf, 0x12u);

    }
LABEL_50:
    v12 = 0;
LABEL_61:

    goto LABEL_13;
  }
LABEL_12:
  v12 = 0;
LABEL_13:

  return v12;
}

- (uint64_t)mad_isAnalysisCompleteFromComputeSyncForAsset:()MediaAnalysis taskID:allowDownload:cancel:
{
  id v10;
  unsigned int (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "mad_isEligibleForComputeSync") & 1) != 0)
  {
    if (objc_msgSend(a1, "type") != 112)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v13;
        v37 = 1024;
        LODWORD(v38) = objc_msgSend(a1, "type");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid resource type (%d), unable to extract analysis results from compute sync", buf, 0x12u);

      }
      goto LABEL_11;
    }
    if (v11 && v11[2](v11))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Analysis extraction from compute sync resource cancelled", buf, 0xCu);

      }
      goto LABEL_11;
    }
    objc_msgSend(a1, "privateFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5 || (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSyncDownload") & 1) != 0)
      goto LABEL_15;
    if ((objc_msgSend(v10, "mad_isEligibleForComputeSyncDownloadWithAnalysisTask:", a4) & 1) != 0)
    {
      VCPSignPostLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_signpost_id_generate(v22);

      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADDownloadComputeSyncResource", ", buf, 2u);
      }

      v34 = v16;
      v26 = objc_msgSend(MEMORY[0x1E0CD1450], "vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:", a1, a4, &v34, v11);
      v27 = v34;

      v16 = v27;
      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v23, "MADDownloadComputeSyncResource", ", buf, 2u);
      }

      if (!v26 && v16 && (objc_msgSend(a1, "isLocallyAvailable") & 1) != 0)
      {
        objc_msgSend(v10, "mad_refetchAsset");
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {

          v10 = (id)v30;
LABEL_15:
          v17 = objc_msgSend(v10, "vcp_needsProcessingForTask:", a4);
          v14 = v17 ^ 1u;
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "localIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            VCPTaskIDDescription(a4);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            v21 = CFSTR("complete");
            *(_DWORD *)buf = 138413314;
            v36 = v18;
            v37 = 2112;
            if (v17)
              v21 = CFSTR("incomplete");
            v38 = v19;
            v39 = 2112;
            v40 = v21;
            v41 = 2112;
            v42 = v16;
            v43 = 1024;
            v44 = a5;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] %@ %@ with compute sync resource at %@ (allowDownload: %d)", buf, 0x30u);

          }
          goto LABEL_42;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "localIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v33;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to re-fetch asset after compute sync download attempt", buf, 0xCu);

        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v32;
        v37 = 1024;
        LODWORD(v38) = v26;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to download compute sync resource (%d)", buf, 0x12u);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "localIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v31;
      v37 = 1024;
      LODWORD(v38) = a4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Ineligible for compute sync downalod with taskID %d", buf, 0x12u);

    }
    v14 = 0;
LABEL_42:

    goto LABEL_12;
  }
LABEL_11:
  v14 = 0;
LABEL_12:

  return v14;
}

@end
