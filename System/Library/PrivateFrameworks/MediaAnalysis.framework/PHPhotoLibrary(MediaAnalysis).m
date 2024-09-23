@implementation PHPhotoLibrary(MediaAnalysis)

+ (id)vcp_defaultPhotoLibrary
{
  void *v0;
  void *v1;

  +[VCPDefaultPhotoLibraryManager sharedManager](VCPDefaultPhotoLibraryManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "defaultPhotoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)vcp_defaultURL
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "vcp_defaultPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "photoLibraryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)vcp_defaultMediaAnalysisDatabaseFilepath
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "vcp_defaultPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "vcp_mediaAnalysisDatabaseFilepath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (__CFString)vcp_mediaAnalysisDirectory
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(a1, "photoLibraryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(a1, "isSystemPhotoLibrary") & 1) != 0)
    {
      v3 = CFSTR("/var/mobile/Media/MediaAnalysis");
    }
    else
    {
      objc_msgSend(v2, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("private/com.apple.mediaanalysisd/MediaAnalysis"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vcp_mediaAnalysisDatabaseFilepath
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "vcp_mediaAnalysisDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("mediaanalysis.db"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)vcp_anyAssetsForTaskID:()MediaAnalysis
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (uint64_t)vcp_assetCountForTaskID:()MediaAnalysis
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (uint64_t)vcp_assetCountWithMediaType:()MediaAnalysis forTaskID:
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithMediaType:options:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (uint64_t)vcp_assetCountWithInternalPredicate:()MediaAnalysis forTaskID:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", a1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldPrefetchCount:", 1);
  if (a4 == 16 || a4 == 12)
  {
    objc_msgSend(v7, "setPredicate:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v8);
  }
  else
  {
    if (a4 != 10)
      goto LABEL_7;
    objc_msgSend(v7, "setPredicate:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype != %d"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v8);
  }

LABEL_7:
  objc_msgSend(v7, "internalPredicate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v16[0] = v6;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v12);

  }
  else
  {
    objc_msgSend(v7, "setInternalPredicate:", v6);
  }
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  return v14;
}

- (BOOL)mad_calculateProgressPercentage:()MediaAnalysis totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:
{
  int v12;
  int v17;
  int v18;
  unint64_t v19;
  id v20;
  void *v21;
  _BOOL8 v22;
  double v23;
  id v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v12 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1398], "mad_sceneConfidenceThresholdForTask:", a6);
  v18 = v17;
  v34 = 0;
  v19 = objc_msgSend(a1, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", a7, a8, &v34);
  v20 = v34;
  if (v20)
  {
    v21 = v20;
    if (a10)
      *a10 = (id)objc_msgSend(v20, "copy");
    if (a3)
      *a3 = 0;
    v22 = 0;
    if (a5)
      *a5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD1628], "mad_sharedVersionProviderWithPhotoLibrary:", a1);
    v33 = objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = v18;
    v32 = objc_msgSend(a1, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", a7, a8, v23);
    v24 = 0;
    v21 = v24;
    v22 = v24 == 0;
    if (v24)
    {
      if (a10)
        *a10 = (id)objc_msgSend(v24, "copy");
      if (a3)
        *a3 = 0;
      v25 = (void *)v33;
      if (a5)
        *a5 = 0;
    }
    else
    {
      if (a4)
        *a4 = v19;
      if (a3)
      {
        v26 = v19 ? 100 * v32 / v19 : 0;
        *a3 = v26;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v27 = *a3;
          *(_DWORD *)buf = 67109888;
          v36 = v27;
          v37 = 1024;
          v38 = v12;
          v39 = 1024;
          v40 = a7;
          v41 = 1024;
          v42 = a8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Progress percentage %d for task-%d, phTask-%d, priority-%d", buf, 0x1Au);
        }
      }
      v25 = (void *)v33;
      if (a5)
      {
        if (v19)
        {
          v28 = v32 + a9;
          if (v19 < v32 + a9)
            v28 = v19;
          v29 = 100 * v28 / v19;
        }
        else
        {
          v29 = 0;
        }
        *a5 = v29;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v30 = *a5;
          *(_DWORD *)buf = 67109888;
          v36 = v30;
          v37 = 1024;
          v38 = v12;
          v39 = 1024;
          v40 = a7;
          v41 = 1024;
          v42 = a8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Progress percentage with failure %d for task-%d, phTask-%d, priority-%d", buf, 0x1Au);
        }
      }
    }

  }
  return v22;
}

- (uint64_t)vcp_isCPLSyncComplete
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "cplStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSuccessfulSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "cplStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isExceedingQuota");

  }
  return v4;
}

- (uint64_t)vcp_isCPLDownloadComplete
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "cplStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastCompletePrefetchDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "cplStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isExceedingQuota");

  }
  return v4;
}

- (uint64_t)vcp_eligibleForStreaming:()MediaAnalysis
{
  uint64_t result;

  result = objc_msgSend(a1, "vcp_isCPLEnabled");
  if ((_DWORD)result)
  {
    if (!a3)
      return 1;
    result = objc_msgSend(a1, "vcp_isCPLDownloadComplete");
    if ((_DWORD)result)
      return 1;
  }
  return result;
}

- (uint64_t)vcp_supportsInMemoryDownload
{
  if ((objc_msgSend(a1, "isCloudPhotoLibraryEnabled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "vcp_isSyndicationLibrary");
}

- (uint64_t)vcp_allowInMemoryDownload
{
  void *v1;
  uint64_t v2;

  if (!objc_msgSend(a1, "vcp_supportsInMemoryDownload"))
    return 0;
  +[VCPInternetReachability sharedInstance](VCPInternetReachability, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasWifiOrEthernetConnection");

  return v2;
}

- (uint64_t)vcp_libraryScale
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;

  v2 = objc_msgSend(a1, "vcp_assetCountWithMediaType:forTaskID:", 1, 1);
  v3 = objc_msgSend(a1, "vcp_assetCountWithMediaType:forTaskID:", 2, 1);
  if (v3 >= 0x7D0 || v2 >= 0x7D0)
    v5 = 3;
  else
    v5 = 2;
  if (v3 >> 3 >= 0x271 || v2 >> 3 >= 0x271)
    return v5;
  else
    return 1;
}

- (const)vcp_libraryScaleShortDescription
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "vcp_libraryScale");
  if ((unint64_t)(v1 - 1) < 3)
    return off_1E6B17008[v1 - 1];
  v3 = v1;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown library scale %lu", (uint8_t *)&v4, 0xCu);
  }
  return CFSTR("L");
}

- (id)mad_cloudIdentifierForLocalIdentifier:()MediaAnalysis error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudIdentifierMappingsForLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v11)
  {
    objc_msgSend(v9, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v12, "copy");

  }
  return v11;
}

- (id)mad_localIdentifierForCloudIdentifier:()MediaAnalysis error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD14A8]), "initWithStringValue:", v6);
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localIdentifierMappingsForCloudIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a4 && !v11)
  {
    objc_msgSend(v10, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v13, "copy");

  }
  return v12;
}

- (id)vcp_visionCacheStorageDirectoryURL
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("mediaanalysisd")))
  {
    objc_msgSend(v1, "urlForApplicationDataFolderIdentifier:", 2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = v1;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retrieving Vision cache storage directory URL %@ for photoLibrary %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14);
      v7 = v14;

      if ((v6 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v4;
        v17 = 2112;
        v18 = v1;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create Vision cache storage directory URL %@ for photoLibrary %@ - %@", buf, 0x20u);
      }
      v8 = (void *)v4;
      goto LABEL_25;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = (uint64_t)v1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No Vision cache storage directory URL for photoLibrary %@", buf, 0xCu);
    }
    v8 = 0;
LABEL_24:
    v7 = 0;
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("mediaanalysisd-service")))
  {
    if (objc_msgSend(v1, "isSystemPhotoLibrary"))
    {
      objc_msgSend(v1, "urlForApplicationDataFolderIdentifier:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v1, "photoLibraryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("private/com.apple.mediaanalysisd/caches/vision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0D47780], "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "photoLibraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v9, "requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL:error:", v10, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  if (!v8 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = (uint64_t)v1;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to query Vision cache storage directory URL for photoLibrary %@ - %@", buf, 0x16u);
  }

LABEL_25:
  objc_sync_exit(v1);

  return v8;
}

- (id)_analysisPreferencesURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("PhotoAnalysisServicePreferences.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)vcp_analysisPreferences
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "_analysisPreferencesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  objc_sync_enter(v3);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_updateAnalysisPreferencesWithEntries:()MediaAnalysis keysToRemove:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_analysisPreferencesURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = a1;
    objc_sync_enter(v9);
    objc_msgSend(v9, "vcp_analysisPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v11, "addEntriesFromDictionary:", v10);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v11, "addEntriesFromDictionary:", v6);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v11, "removeObjectsForKeys:", v7);
    if ((objc_msgSend(v11, "isEqual:", v10) & 1) == 0)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, &v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v18;
      v14 = v13;
      if (v12)
      {
        v17 = v13;
        v15 = objc_msgSend(v12, "writeToURL:options:error:", v8, 1073741825, &v17);
        v16 = v17;

        if ((v15 & 1) == 0
          && (int)MediaAnalysisLogLevel() >= 3
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          v21 = 2112;
          v22 = v16;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to write library analysis preferences for %@: %@", buf, 0x16u);
        }
        v14 = v16;
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v9;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize library analysis preferences for %@: %@", buf, 0x16u);
      }

    }
    objc_sync_exit(v9);

  }
}

- (void)vcp_setAnalysisPreferencesValue:()MediaAnalysis forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v13 = v7;
      v14[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_updateAnalysisPreferencesWithEntries:keysToRemove:", v9, 0);

    }
    else
    {
      v12 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_updateAnalysisPreferencesWithEntries:keysToRemove:", 0, v10);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Key for setLibraryAnalysisPreferencesValue is nil", v11, 2u);
  }

}

- (id)vcp_vipModelFilepathForVIPType:()MediaAnalysis
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "vcp_isSyndicationLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vcp_visionCacheStorageDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a3 == 1)
  {
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPFaceIDModel petVIPModelFileName](VCPFaceIDModel, "petVIPModelFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a3)
  {
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPFaceIDModel personVIPModelFileName](VCPFaceIDModel, "personVIPModelFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v10;

    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to fetch VIP model file path with unknown VCPMAVIPType (%lu)", (uint8_t *)&v13, 0xCu);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)vcp_vipModelLastGenerationDateForVIPType:()MediaAnalysis
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "vcp_analysisPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetIDModelLastGenerationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_6:
    v7 = v6;
LABEL_12:
    v8 = v7;

    goto LABEL_13;
  }
  if (!a3)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FaceIDModelLastGenerationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_11;
    goto LABEL_6;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to fetch VIP model last generation date with unknown VCPMAVIPType (%lu)", (uint8_t *)&v10, 0xCu);
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (id)vcp_faceAnalysisStateFilepath
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("faceWorkerState.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)mad_clusterVideoFaces
{
  return 1;
}

- (uint64_t)mad_faceProcessingInternalVersion
{
  void *v1;
  uint64_t v2;

  +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:](VCPFaceProcessingVersionManager, "sharedManagerForPhotoLibrary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "currentProcessingVersion");

  return v2;
}

- (BOOL)mad_useVUGallery
{
  return (_os_feature_enabled_impl() & 1) != 0
      || objc_msgSend(a1, "mad_faceProcessingInternalVersion") == 15;
}

- (uint64_t)mad_pauseFCPeopleFurtherProcessing
{
  _os_feature_enabled_impl();
  return 0;
}

- (id)mad_unclusteredFacesFetchOptions
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v2, "setIncludeTorsoOnlyDetectionData:", 1);
  objc_msgSend(v2, "setIncludeOnlyFacesWithFaceprints:", 1);
  if (_os_feature_enabled_impl() && objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E6B762C0);
  v3 = objc_msgSend(a1, "mad_faceProcessingInternalVersion");
  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl())
      v4 = 14;
    else
      v4 = 11;
    if ((int)v3 >= v4)
      v3 = v4;
    else
      v3 = v3;
  }
  if (objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion >= %d) AND (vuObservationID = 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), v3, 0, 1, 2, 5);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (clusterSequenceNumber = 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), v3, 0, 1, 2, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v5);

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces"))
    objc_msgSend(v2, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  return v2;
}

- (id)mad_clusteredFacesFetchOptions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v2, "setIncludeTorsoOnlyDetectionData:", 1);
  objc_msgSend(v2, "setIncludeOnlyFacesWithFaceprints:", 1);
  if (_os_feature_enabled_impl() && objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E6B762D8);
  if (objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (vuObservationID != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (clusterSequenceNumber != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v3);

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces"))
    objc_msgSend(v2, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  return v2;
}

- (id)mad_clusteredAndUnidentifiedFacesFetchOptions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v2, "setIncludeTorsoOnlyDetectionData:", 1);
  objc_msgSend(v2, "setIncludeOnlyFacesWithFaceprints:", 1);
  if (_os_feature_enabled_impl() && objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E6B762F0);
  if (objc_msgSend(a1, "mad_useVUGallery"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (vuObservationID != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d))) AND (personForFace = nil AND personForTorso = nil AND personForTemporalDetectedFaces = nil)"), objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (clusterSequenceNumber != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d))) AND (personForFace = nil AND personForTorso = nil AND personForTemporalDetectedFaces = nil)"), objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v3);

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces"))
    objc_msgSend(v2, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  return v2;
}

- (uint64_t)mad_countOfUnclusteredFaces
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "mad_unclusteredFacesFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)mad_allFacesFetchOptions
{
  void *v1;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v1, "setIncludeTorsoOnlyDetectionData:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v1, "setIncludedDetectionTypes:", &unk_1E6B76308);
  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces"))
    objc_msgSend(v1, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  return v1;
}

- (id)mad_allPersonsFetchOptions
{
  void *v1;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v1, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v1, "setIncludeTorsoOnlyPerson:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v1, "setIncludedDetectionTypes:", &unk_1E6B76320);
  return v1;
}

- (id)mad_allPersonsFetchOptionsWithDetectionTypes:()MediaAnalysis andVerifiedTypes:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v7, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v7, "setIncludeTorsoOnlyPerson:", 1);
  v8 = v6;
  if (!v6)
  {
    if (!_os_feature_enabled_impl())
      goto LABEL_5;
    v8 = &unk_1E6B76338;
  }
  objc_msgSend(v7, "setIncludedDetectionTypes:", v8);
LABEL_5:
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v18;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("verifiedType = %@"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" OR "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v16);

  }
  return v7;
}

- (BOOL)vcp_isSyndicationLibrary
{
  return objc_msgSend(a1, "wellKnownPhotoLibraryIdentifier") == 3;
}

- (uint64_t)vcp_requiresProcessingForTask:()MediaAnalysis
{
  uint64_t result;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x10)
    goto LABEL_8;
  if (((1 << a3) & 0x140E) != 0)
    return 1;
  if (a3 != 16)
  {
LABEL_8:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      v5 = 134217984;
      v6 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not requiring processing for unknown taskID %lu", (uint8_t *)&v5, 0xCu);
    }
    return 0;
  }
  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return MADIsPECProcessingEnabled();
  return result;
}

- (uint64_t)vcp_requiredFaceLibraryProcessingSubTasks
{
  if (objc_msgSend(a1, "vcp_isSyndicationLibrary"))
    return 51;
  else
    return -1;
}

- (const)vcp_description
{
  if ((objc_msgSend(a1, "isSystemPhotoLibrary") & 1) != 0)
    return CFSTR("SPL");
  if (objc_msgSend(a1, "wellKnownPhotoLibraryIdentifier") == 3)
    return CFSTR("SyndPL");
  return CFSTR("PL");
}

- (uint64_t)vcp_requiresDownloadForTask:()MediaAnalysis
{
  uint64_t result;
  int v6;
  unsigned int v7;
  uint8_t v8[16];

  if (_os_feature_enabled_impl() && objc_msgSend(a1, "mad_pauseFCPeopleFurtherProcessing"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceProcessing] Pause streaming for FC people processing", v8, 2u);
    }
    LODWORD(result) = objc_msgSend(a1, "vcp_supportsInMemoryDownload");
    if (a3 == 10)
      return result;
    else
      return 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "vcp_supportsInMemoryDownload");
    v7 = (0x40Au >> a3) & 1;
    if (a3 > 0xA)
      v7 = 0;
    if (v6)
      return v7;
    else
      return 0;
  }
}

@end
