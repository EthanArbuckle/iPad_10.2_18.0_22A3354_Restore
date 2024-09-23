@implementation VCPFaceProcessingVersionManager

- (VCPFaceProcessingVersionManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  VCPFaceProcessingVersionManager *v6;
  VCPFaceProcessingVersionManager *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSDictionary *versionState;
  VCPFaceProcessingVersionManager *v12;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPFaceProcessingVersionManager;
    v6 = -[VCPFaceProcessingVersionManager init](&v14, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_photoLibrary, a3);
      v8 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[VCPFaceProcessingVersionManager _versionStateURL](v7, "_versionStateURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithContentsOfURL:", v9);
      versionState = v7->_versionState;
      v7->_versionState = (NSDictionary *)v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)sharedManagerForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  objc_msgSend(v3, "photoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPFaceProcessingVersionManager-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__VCPFaceProcessingVersionManager_sharedManagerForPhotoLibrary___block_invoke;
  v11[3] = &unk_1E6B170E0;
  v8 = v3;
  v12 = v8;
  objc_msgSend(v7, "sharedInstanceWithIdentifier:andCreationBlock:", v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

VCPFaceProcessingVersionManager *__64__VCPFaceProcessingVersionManager_sharedManagerForPhotoLibrary___block_invoke(uint64_t a1)
{
  return -[VCPFaceProcessingVersionManager initWithPhotoLibrary:]([VCPFaceProcessingVersionManager alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
}

- (id)_versionStateURL
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("mediaAnalysisVersionState.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_updateVersionStateFileWithError:(id *)a3
{
  NSDictionary *versionState;
  void *v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  versionState = self->_versionState;
  -[VCPFaceProcessingVersionManager _versionStateURL](self, "_versionStateURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = -[NSDictionary writeToURL:error:](versionState, "writeToURL:error:", v5, &v10);
  v7 = v10;

  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to update version state - %@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v6;
}

- (int)defaultProcessingVersion
{
  int v3;
  void *v4;
  uint64_t v5;

  v3 = _os_feature_enabled_impl();
  if (-[PHPhotoLibrary isSystemPhotoLibrary](self->_photoLibrary, "isSystemPhotoLibrary")
    && (VCPMAIsAppleInternal() & v3) == 1
    && (!_os_feature_enabled_impl()
     || (+[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:](VCPPhotosAutoCounterWorker, "workerWithPhotoLibrary:", self->_photoLibrary), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "optInPersonCount"), v4, v5)))
  {
    if (!-[VCPFaceProcessingVersionManager currentProcessingVersion](self, "currentProcessingVersion"))
      -[VCPFaceProcessingVersionManager _updateCurrentProcessingVersion:](self, "_updateCurrentProcessingVersion:", 11);
    return -[VCPFaceProcessingVersionManager currentProcessingVersion](self, "currentProcessingVersion");
  }
  else if (_os_feature_enabled_impl())
  {
    return 15;
  }
  else
  {
    return 11;
  }
}

- (int)currentProcessingVersion
{
  void *v3;
  void *v4;
  int v5;

  -[NSDictionary objectForKeyedSubscript:](self->_versionState, "objectForKeyedSubscript:", CFSTR("FaceProcessingInternalVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_versionState, "objectForKeyedSubscript:", CFSTR("FaceProcessingInternalVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)_updateCurrentProcessingVersion:(int)a3
{
  uint64_t v3;
  VCPFaceProcessingVersionManager *v4;
  NSDictionary *versionState;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  char v12;
  void *v13;
  int v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  versionState = v4->_versionState;
  if (versionState)
  {
    v6 = -[NSDictionary mutableCopy](versionState, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("FaceProcessingInternalVersion"));

  -[VCPFaceProcessingVersionManager _versionStateURL](v4, "_versionStateURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16 = 0;
    v10 = objc_msgSend(v7, "writeToURL:error:", v9, &v16);
    v11 = v16;
    if (v11)
      v12 = 0;
    else
      v12 = v10;
    if ((v12 & 1) != 0)
    {
      objc_storeStrong((id *)&v4->_versionState, v7);
      v13 = 0;
      v14 = 0;
    }
    else
    {
      v13 = v11;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to update version state - %@", buf, 0xCu);
      }
      v14 = -20;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceModelBump] No persistentURL to update version state - %@", buf, 0xCu);
    }
    v13 = 0;
    v14 = -50;
  }

  objc_sync_exit(v4);
  return v14;
}

- (int)resetAnalysisDataWithResetLevel:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char, void *);
  void *v17;
  VCPFaceProcessingVersionManager *v18;
  NSObject *v19;
  __int128 *p_buf;
  id *v21;
  __int128 buf;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceModelBump] Resetting face data ... (%@)", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x2020000000;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke;
  v17 = &unk_1E6B17130;
  p_buf = &buf;
  v21 = a4;
  v18 = self;
  v10 = v9;
  v19 = v10;
  v11 = _Block_copy(&v14);
  -[PHPhotoLibrary resetFaceAnalysisWithResetLevel:completionHandler:](self->_photoLibrary, "resetFaceAnalysisWithResetLevel:completionHandler:", a3, v11, v14, v15, v16, v17, v18);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v12 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  _QWORD aBlock[5];

  v5 = a3;
  v6 = v5;
  if (v5 || (a2 & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -18;
    if (v5 && *(_QWORD *)(a1 + 56))
    {
      v12 = objc_msgSend(v5, "copy");
      v13 = *(void ***)(a1 + 56);
      v14 = *v13;
      *v13 = (void *)v12;

    }
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mad_useVUGallery"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke_2;
    aBlock[3] = &unk_1E6B17108;
    aBlock[4] = *(_QWORD *)(a1 + 48);
    v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vcp_visionCacheStorageDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite-shm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite-wal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceModelBump] Dropping %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v8 = objc_msgSend(v7, "removeItemAtURL:error:", v3, &v10);
      v9 = v10;

      if ((v8 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v12 = v3;
          v13 = 2112;
          v14 = v9;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to remove %@ - %@", buf, 0x16u);
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -18;
      }

    }
  }

}

- (int)migrateFaceProcessingToVersion:(int)a3
{
  uint64_t v3;
  int v5;
  int v6;
  VCPFaceProcessingVersionManager *v7;
  int v8;
  VCPFaceProcessingVersionManager *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[VCPFaceProcessingVersionManager currentProcessingVersion](self, "currentProcessingVersion");
  if (!v5 || (v6 = v5, v5 > (int)v3))
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = -[VCPFaceProcessingVersionManager _updateCurrentProcessingVersion:](v7, "_updateCurrentProcessingVersion:", 5);
    if (v8)
    {
      objc_sync_exit(v7);

      return v8;
    }
    v6 = -[VCPFaceProcessingVersionManager currentProcessingVersion](v7, "currentProcessingVersion");
    objc_sync_exit(v7);

  }
  if (v6 >= (int)v3)
    return 0;
  v9 = self;
  objc_sync_enter(v9);
  v12 = 0;
  v8 = -[VCPFaceProcessingVersionManager resetAnalysisDataWithResetLevel:error:](v9, "resetAnalysisDataWithResetLevel:error:", 2, &v12);
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to reset Face Analysis data for PhotoLibrary %@", buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v8 = -[VCPFaceProcessingVersionManager _updateCurrentProcessingVersion:](v9, "_updateCurrentProcessingVersion:", v3);
    v10 = v8 == 0;
  }

  objc_sync_exit(v9);
  if (v10)
    return 0;
  return v8;
}

+ (id)resetLevelDescription:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Reset none");
  if (a3 == 1)
    v3 = CFSTR("Reset faceAdjustmentVersion");
  if (a3 == 2)
    return CFSTR("Reset for Forward Compatible version bump (asset.faceAdjustmentVersion + facecrops)");
  else
    return (id)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
