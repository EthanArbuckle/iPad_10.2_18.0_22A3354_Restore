@implementation PHPTPAssetManager

- (PHPTPAssetManager)init
{
  PHPhotoLibrary *v3;
  void *v4;
  PHPhotoLibrary *v5;
  BOOL v6;
  id v7;
  PHPTPAssetManager *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = [PHPhotoLibrary alloc];
  +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHPhotoLibrary initWithPhotoLibraryURL:](v3, "initWithPhotoLibraryURL:", v4);

  v11 = 0;
  v6 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v5, "openAndWaitWithUpgrade:error:", 0, &v11);
  v7 = v11;
  if (v6)
  {
    self = -[PHPTPAssetManager initWithLibrary:](self, "initWithLibrary:", v5);
    v8 = self;
  }
  else
  {
    PLPTPGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to open photo library (ERROR: %@)", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (PHPTPAssetManager)initWithLibrary:(id)a3
{
  id v5;
  PHPTPAssetManager *v6;
  PHPTPAssetManager *v7;
  NSFileManager *v8;
  NSFileManager *fileManager;
  PHPTPFormatConversionManager *v10;
  PHPTPFormatConversionManager *formatConversionManager;
  dispatch_group_t v12;
  OS_dispatch_group *analyticsAsyncDataGroup;
  uint64_t v14;
  NSMutableArray *finalizationRequestLock_deferredAssets;
  uint64_t v16;
  NSMutableArray *finalizationRequestLock_inflightAssetsRequiringFinalization;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  uint64_t v21;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHPTPAssetManager;
  v6 = -[PHPTPAssetManager init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_libraryAvailabilityStatus = 2;
    v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = v7->_fileManager;
    v7->_fileManager = v8;

    v10 = objc_alloc_init(PHPTPFormatConversionManager);
    formatConversionManager = v7->_formatConversionManager;
    v7->_formatConversionManager = v10;

    v7->_sortAscending = 1;
    if (MKBDeviceUnlockedSinceBoot() != 1)
      -[PHPTPAssetManager _registerForFirstUnlockNotification](v7, "_registerForFirstUnlockNotification");
    v7->_vendedAssetsLock._os_unfair_lock_opaque = 0;
    v7->_analyticsDataLock._os_unfair_lock_opaque = 0;
    v12 = dispatch_group_create();
    analyticsAsyncDataGroup = v7->_analyticsAsyncDataGroup;
    v7->_analyticsAsyncDataGroup = (OS_dispatch_group *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    finalizationRequestLock_deferredAssets = v7->_finalizationRequestLock_deferredAssets;
    v7->_finalizationRequestLock_deferredAssets = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    finalizationRequestLock_inflightAssetsRequiringFinalization = v7->_finalizationRequestLock_inflightAssetsRequiringFinalization;
    v7->_finalizationRequestLock_inflightAssetsRequiringFinalization = (NSMutableArray *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = dispatch_queue_create("com.apple.photos.PHPTPAssetManager.finalizationrequestqueue", v19);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", v20, v7);
    cameraWatcher = v7->_cameraWatcher;
    v7->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v21;

    v7->_finalizationRequestLock._os_unfair_lock_opaque = 0;
    v7->_provideDiagnosticFile = objc_msgSend((id)objc_opt_class(), "_shouldIncludeDiagnosticFile");
    -[PHPhotoLibrary registerChangeObserver:](v7->_photoLibrary, "registerChangeObserver:", v7);
    -[PHPhotoLibrary registerAvailabilityObserver:](v7->_photoLibrary, "registerAvailabilityObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PHPTPFormatConversionManager invalidate](self->_formatConversionManager, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHPTPAssetManager;
  -[PHPTPAssetManager dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  PFCameraViewfinderSessionWatcher *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PFCameraViewfinderSessionWatcher *v14;
  PFCameraViewfinderSessionWatcher *v15;
  int v16;
  PFCameraViewfinderSessionWatcher *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (PFCameraViewfinderSessionWatcher *)a3;
  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "setDelegate: %@", (uint8_t *)&v16, 0xCu);
  }

  v6 = objc_storeWeak((id *)&self->_delegate, v4);
  if (v4)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cameraWatcher = self->_cameraWatcher;
      v16 = 134217984;
      v17 = cameraWatcher;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Starting camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    -[PFCameraViewfinderSessionWatcher startWatching](self->_cameraWatcher, "startWatching");
    -[PHPTPAssetManager _startAnalyticsCollection](self, "_startAnalyticsCollection");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PFCameraViewfinderSessionWatcher libraryDidBecomeAvailable](v4, "libraryDidBecomeAvailable");
  }
  else
  {
    -[PHPhotoLibrary unregisterChangeObserver:](self->_photoLibrary, "unregisterChangeObserver:", self);
    -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibraryBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsdClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems");

    -[PHPTPAssetManager _stopAnalyticsCollectionAndReport](self, "_stopAnalyticsCollectionAndReport");
    PLPTPGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = self->_cameraWatcher;
      v16 = 134217984;
      v17 = v14;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "Stopping camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    -[PFCameraViewfinderSessionWatcher stopWatching](self->_cameraWatcher, "stopWatching");
    v15 = self->_cameraWatcher;
    self->_cameraWatcher = 0;

  }
}

- (void)setPeerMediaCapabilities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Set peer media capabilities: %@", buf, 0xCu);
  }

  -[PHPTPFormatConversionManager setPeerMediaCapabilities:](self->_formatConversionManager, "setPeerMediaCapabilities:", v4);
  v7 = MEMORY[0x1E0C809B0];
  v8 = v4;
  v6 = v4;
  PLRunWithUnfairLock();
  self->_sortAscending = objc_msgSend(v6, "sortSourceEnumerationAscending", v7, 3221225472, __46__PHPTPAssetManager_setPeerMediaCapabilities___block_invoke, &unk_1E35DF9E8, self);

}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return -[PHPTPFormatConversionManager peerMediaCapabilities](self->_formatConversionManager, "peerMediaCapabilities");
}

- (void)setHostCharacteristics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyMake"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D754E0]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyOS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D754B8]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyOSVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D75500]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyTransport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D754D8]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("YES"), *MEMORY[0x1E0D75490]);
  v10 = v5;
  PLRunWithUnfairLock();

}

- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3
{
  id v4;
  PHPTPDebugAnalytics *v5;
  PHPTPDebugAnalytics *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  PHPTPDebugAnalytics *v11;
  id v12;

  v4 = a3;
  -[PHPTPAssetManager _ensureDeferredRenderingIsComplete](self, "_ensureDeferredRenderingIsComplete");
  v5 = objc_alloc_init(PHPTPDebugAnalytics);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke;
  v10[3] = &unk_1E35D9450;
  v11 = v5;
  v12 = v4;
  v10[4] = self;
  v6 = v5;
  v7 = v4;
  -[PHPTPAssetManager _enumerateAssetsWithLocalIdentifiers:usingBlock:](self, "_enumerateAssetsWithLocalIdentifiers:usingBlock:", 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPDebugAnalytics reportResourceCounts](v6, "reportResourceCounts");
  v9 = v8;
  PLRunWithUnfairLock();

}

- (void)ptpEnumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PHPTPAssetManager_ptpEnumerateAssetsWithLocalIdentifiers_usingBlock___block_invoke;
  v9[3] = &unk_1E35D9478;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  v8 = -[PHPTPAssetManager _enumerateAssetsWithLocalIdentifiers:usingBlock:](self, "_enumerateAssetsWithLocalIdentifiers:usingBlock:", a3, v9);

}

- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  double height;
  double width;
  id v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  __CFData *v16;
  __CFData *v17;
  PHImageRequestOptions *v18;
  id v19;
  id v20;
  PHImageRequestOptions *v21;
  __CFString *v22;
  CGImageDestination *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFDictionary *v28;
  double v29;
  NSObject *v30;
  void *v31;
  CGImageDestination *v32;
  char v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  PHImageRequestOptions *v45;
  __int128 *p_buf;
  double v47;
  double v48;
  uint8_t v49[4];
  CGImageDestination *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  _QWORD v55[3];
  _QWORD v56[3];
  __int128 buf;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  height = a4.height;
  width = a4.width;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[ptpAssetHandle isKindOfClass:[PHPTPAssetHandle class]]"));

  }
  v11 = -[PHPTPAssetManager _isThumbnailSupportedForResourceType:](self, "_isThumbnailSupportedForResourceType:", objc_msgSend(v10, "resourceType"));
  PLPTPGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "Requesting thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
    }

    if (width >= height)
      height = width;
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PHPTPAssetManager _photosAssetForPTPAssetHandle:](self, "_photosAssetForPTPAssetHandle:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v17 = 0;
LABEL_42:

      goto LABEL_43;
    }
    if (objc_msgSend(v10, "resourceType") == 2 && objc_msgSend(v14, "hasAdjustments"))
    {
      *(float *)&v15 = a5;
      -[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoAsset:size:compressionQuality:", v14, height, height, v15);
      v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = objc_alloc_init(PHImageRequestOptions);
      -[PHImageRequestOptions setVersion:](v18, "setVersion:", -[PHPTPAssetManager _imageVersionForAsset:resourceType:](self, "_imageVersionForAsset:resourceType:", v14, objc_msgSend(v10, "resourceType")));
      -[PHImageRequestOptions setSynchronous:](v18, "setSynchronous:", 1);
      -[PHImageRequestOptions setResizeMode:](v18, "setResizeMode:", 1);
      -[PHImageRequestOptions setDeliveryMode:](v18, "setDeliveryMode:", 1);
      -[PHImageRequestOptions setNetworkAccessAllowed:](v18, "setNetworkAccessAllowed:", 0);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x2020000000;
      v59 = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __72__PHPTPAssetManager_ptpThumbnailForAssetHandle_size_compressionQuality___block_invoke;
      v42[3] = &unk_1E35D94A0;
      v42[4] = self;
      v19 = v10;
      v43 = v19;
      v20 = v14;
      v44 = v20;
      v47 = height;
      v48 = height;
      v21 = v18;
      v45 = v21;
      p_buf = &buf;
      -[NSObject requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:](v12, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v20, 0, v21, v42, height, height);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = CGImageDestinationCreateWithData(v16, v22, 1uLL, 0);

        if (v23)
        {
          objc_msgSend(v19, "orientation");
          if (PLIsRotatedExifOrientation())
          {
            v55[0] = *MEMORY[0x1E0CBC778];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *MEMORY[0x1E0CBD190];
            v56[0] = v40;
            v56[1] = MEMORY[0x1E0C9AAB0];
            v25 = *MEMORY[0x1E0CBCFF0];
            v55[1] = v24;
            v55[2] = v25;
            v26 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v19, "orientation");
            objc_msgSend(v26, "numberWithInteger:", PFOrientationInverse());
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v56[2] = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
            v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v28 = 0;
          }
          CGImageDestinationAddImage(v23, *(CGImageRef *)(*((_QWORD *)&buf + 1) + 24), v28);
          if (!CGImageDestinationFinalize(v23))
          {
            PLPTPGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v20, "objectID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "pl_shortURI");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v19, "resourceType");
              *(_DWORD *)v49 = 134218498;
              v50 = v23;
              v51 = 2114;
              v52 = v35;
              v53 = 2048;
              v54 = v36;
              _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_ERROR, "Failed to finalize CGImageDestinationRef (%p) for asset %{public}@ and resource %ld", v49, 0x20u);

            }
          }
          CFRelease(v23);
          CGImageRelease(*(CGImageRef *)(*((_QWORD *)&buf + 1) + 24));
          v33 = 1;
        }
        else
        {
          PLPTPGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "objectID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "pl_shortURI");
            v32 = (CGImageDestination *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v49 = 138543362;
            v50 = v32;
            _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "Failed to create a CGImageDestinationRef for asset %{public}@", v49, 0xCu);

          }
          CGImageRelease(*(CGImageRef *)(*((_QWORD *)&buf + 1) + 24));
          v33 = 0;
          v28 = v16;
          v16 = 0;
        }

      }
      else
      {
        if (-[PHPTPAssetManager _isPhotoAssetResourceType:](self, "_isPhotoAssetResourceType:", objc_msgSend(v19, "resourceType")))
        {
          v16 = 0;
        }
        else
        {
          *(float *)&v29 = a5;
          -[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoAsset:size:compressionQuality:", v20, height, height, v29);
          v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
        }
        v33 = 1;
      }

      _Block_object_dispose(&buf, 8);
      if ((v33 & 1) == 0)
      {
        v17 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    if (!-[__CFData length](v16, "length"))
    {

      PLPTPGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_ERROR, "No thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
      }

      v16 = 0;
    }
    v16 = v16;
    v17 = v16;
    goto LABEL_41;
  }
  if (v13)
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "No thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
  }
  v17 = 0;
LABEL_43:

  return v17;
}

- (id)ptpImagePropertiesForAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PHPTPAssetManager _isThumbnailSupportedForResourceType:](self, "_isThumbnailSupportedForResourceType:", objc_msgSend(v4, "resourceType")))
  {
    -[PHPTPAssetManager _photosAssetForPTPAssetHandle:](self, "_photosAssetForPTPAssetHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPTPAssetManager _resourceOfType:fromResources:](self, "_resourceOfType:fromResources:", objc_msgSend(v4, "resourceType"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v7, "privateFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithMediaURL:detail:timeZoneLookup:shouldCache:", v9, 2, 0, 0);

    objc_msgSend(v10, "ptpMediaMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPTPGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = objc_msgSend(v4, "resourceType");
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "Resource type %ld doe snot support image properties", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)ptpCanDeleteFiles
{
  void *v2;
  char v3;

  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled") ^ 1;

  return v3;
}

- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPTPAssetManager _photosAssetForPTPAssetHandle:](self, "_photosAssetForPTPAssetHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ptpProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ptpTrashedState");

  PLPTPGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v4, "resourceType");
    objc_msgSend(v5, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pl_shortURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v29 = v9;
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Attempting to delete resource (%lu) for asset: %{public}@", buf, 0x16u);

  }
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __50__PHPTPAssetManager_ptpDeletePhotoForAssetHandle___block_invoke;
  v24[3] = &unk_1E35DE118;
  v13 = v4;
  v25 = v13;
  v26 = v5;
  v27 = v7;
  v23 = 0;
  v14 = v5;
  v15 = objc_msgSend(v12, "performChangesAndWait:error:", v24, &v23);
  v16 = v23;

  -[PHPTPAssetManager _photosAssetForPTPAssetHandle:](self, "_photosAssetForPTPAssetHandle:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PHPTPUtilities shouldExpungeAsset:](PHPTPUtilities, "shouldExpungeAsset:", v17))
  {
    PLPTPGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pl_shortURI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "resourceType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = (uint64_t)v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_INFO, "Expunge asset %{public}@ for asset resource: %@", buf, 0x16u);

    }
    -[PHPTPAssetManager _expungeAsset:withReason:](self, "_expungeAsset:withReason:", v17, CFSTR("PTP client deleted the asset"));
  }

  return v15;
}

- (id)ptpAssetReaderForAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PHPTPAssetReader *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49[6];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49[1] = (id)MEMORY[0x1E0C809B0];
  v49[2] = (id)3221225472;
  v49[3] = __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke;
  v49[4] = &unk_1E35DF110;
  v49[5] = self;
  PLRunWithUnfairLock();
  -[PHPTPAssetManager _photosAssetForPTPAssetHandle:](self, "_photosAssetForPTPAssetHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _resourceOfType:fromResources:](self, "_resourceOfType:fromResources:", objc_msgSend(v4, "resourceType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:](self, "_createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:", v5, v6, self->_formatConversionManager, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", objc_msgSend(v4, "resourceType"), v8, objc_msgSend(v4, "requiresConversion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "privateFileURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v9;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "Requesting path provider for ptpAsset: %@", buf, 0xCu);
  }

  objc_msgSend(v9, "resourceHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  if (objc_msgSend(v11, "resourceType") == 7)
  {
    objc_msgSend(v9, "overflowURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v27 = 0;
      goto LABEL_14;
    }
    v43 = v7;
    v44 = v6;
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@-reassembled-data-%@"), v15, v16, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fileURLWithPath:isDirectory:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0D750B0];
    v42 = v18;
    objc_msgSend(v18, "url");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = 0;
    v27 = objc_msgSend(v25, "writeReassembleAdjustmentsPropertyListAtURL:toURL:error:", v26, v24, v49);
    v28 = v49[0];

    if (v27)
    {
      v29 = v24;
      v7 = v43;
      v6 = v44;
    }
    else
    {
      PLPTPGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v28;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "Error writing combined adjustment data file (%@)", buf, 0xCu);
      }

      v29 = 0;
      v7 = v43;
      v6 = v44;
    }

    v47 = v29;
    v8 = v46;
    v9 = v42;
  }
  else
  {
    v27 = 0;
  }

LABEL_14:
  v31 = v47;
  if (v47)
  {
    -[PHPTPAssetManager _logGreenTeaStatusForPTPAssetHandle:photosAsset:](self, "_logGreenTeaStatusForPTPAssetHandle:photosAsset:", v4, v5);
    if (objc_msgSend(v4, "requiresConversion"))
    {
      -[PHPTPAssetManager _primaryResourceForAsset:fromResources:](self, "_primaryResourceForAsset:fromResources:", v5, v6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "path");
      v45 = v6;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "privateFileURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "path");
      v35 = v7;
      v36 = v9;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPTPAssetManager _ptpAssetReaderForFormatConvertedPTPAsset:ofPhotosAsset:resourcePath:originalResourcePath:](self, "_ptpAssetReaderForFormatConvertedPTPAsset:ofPhotosAsset:resourcePath:originalResourcePath:", v36, v5, v33, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v36;
      v7 = v35;
      v31 = v47;

      v6 = v45;
      v48 = v5;
      PLRunWithUnfairLock();

    }
    else
    {
      v39 = [PHPTPAssetReader alloc];
      objc_msgSend(v47, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v40 = -[PHPTPAssetReader initWithTemporaryFileDeletedOnDeallocPath:](v39, "initWithTemporaryFileDeletedOnDeallocPath:", v32);
      else
        v40 = -[PHPTPAssetReader initWithPath:](v39, "initWithPath:", v32);
      v38 = (void *)v40;
    }

    v8 = v46;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  int v59;
  unsigned int v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  int v74;
  const __CFString *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id WeakRetained;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  PHPTPAssetManager *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *obj;
  uint64_t obja;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t);
  void *v100;
  PHPTPAssetManager *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(uint64_t);
  void *v114;
  PHPTPAssetManager *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t);
  void *v120;
  PHPTPAssetManager *v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint8_t v135[128];
  uint8_t buf[4];
  _BYTE v137[38];
  _BYTE v138[128];
  void *v139;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__17296;
  v133 = __Block_byref_object_dispose__17297;
  v134 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__17296;
  v127 = __Block_byref_object_dispose__17297;
  v128 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v117 = MEMORY[0x1E0C809B0];
  v118 = 3221225472;
  v119 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke;
  v120 = &unk_1E35DF920;
  v122 = &v123;
  v121 = self;
  PLRunWithUnfairLock();
  v111 = v4;
  v112 = 3221225472;
  v113 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_2;
  v114 = &unk_1E35DF920;
  v116 = &v129;
  v115 = self;
  PLRunWithUnfairLock();
  v85 = self;
  if (!v130[5])
    goto LABEL_87;
  if ((photoLibraryDidChange__completedInitialChangeHandling & 1) != 0)
  {
    objc_msgSend(v91, "changeDetailsForFetchResult:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasIncrementalChanges") & 1) != 0)
      goto LABEL_7;
    -[PHPTPAssetManager _fetchAssetsForIdentifiers:includeTrash:](self, "_fetchAssetsForIdentifiers:includeTrash:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchResultChangeDetails changeDetailsFromFetchResult:toFetchResult:changedObjects:](PHFetchResultChangeDetails, "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v130[5], v6, MEMORY[0x1E0C9AA60]);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHPTPAssetManager _fetchAssetsForIdentifiers:includeTrash:](self, "_fetchAssetsForIdentifiers:includeTrash:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchResultChangeDetails changeDetailsFromFetchResult:toFetchResult:changedObjects:](PHFetchResultChangeDetails, "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v130[5], v6, MEMORY[0x1E0C9AA60]);
    v7 = objc_claimAutoreleasedReturnValue();
    photoLibraryDidChange__completedInitialChangeHandling = 1;
  }

  v5 = (void *)v7;
LABEL_7:
  if (v5)
  {
    PLPTPGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "insertedObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      objc_msgSend(v5, "changedObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      objc_msgSend(v5, "removedObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v137 = v10;
      *(_WORD *)&v137[8] = 2048;
      *(_QWORD *)&v137[10] = v12;
      *(_WORD *)&v137[18] = 2048;
      *(_QWORD *)&v137[20] = v14;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Inserted IDs: %lu, Changed IDs: %lu, Deleted IDs: %lu", buf, 0x20u);

    }
    v15 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(v5, "insertedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v107, v140, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v108;
      obj = v16;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v108 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "deferredProcessingNeeded");
          PLPTPGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "objectID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "pl_shortURI");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v137 = v24;
            *(_WORD *)&v137[8] = 2048;
            *(_QWORD *)&v137[10] = v21;
            _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEBUG, "Processing insert for asset (%{public}@) (deferredProcessingNeeded: %lu)", buf, 0x16u);

            v15 = 0x1E0C99000uLL;
          }

          if ((unsigned __int16)(v21 - 1) > 1u)
          {
            objc_msgSend(v86, "addObject:", v20);
          }
          else
          {
            PLPTPGetLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "objectID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "pl_shortURI");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "filename");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v20, "savedAssetType");
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v137 = v21;
              *(_WORD *)&v137[4] = 2114;
              *(_QWORD *)&v137[6] = v27;
              *(_WORD *)&v137[14] = 2112;
              *(_QWORD *)&v137[16] = v28;
              *(_WORD *)&v137[24] = 2048;
              *(_QWORD *)&v137[26] = v29;
              _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "Requires camera deferred processing (%d) for asset (%{public}@) (filename: %@, savedAssetType: %ld)", buf, 0x26u);

              v15 = 0x1E0C99000;
            }

            v139 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHPTPAssetManager _addAssetsNeedingFinalization:](v85, "_addAssetsNeedingFinalization:", v30);

          }
        }
        v16 = obj;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v140, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(v15 + 3560), "array");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v15 + 3560), "array");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v5, "changedObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
    if (v32)
    {
      v88 = *(_QWORD *)v104;
      v84 = v31;
      do
      {
        obja = v32;
        for (j = 0; j != obja; ++j)
        {
          if (*(_QWORD *)v104 != v88)
            objc_enumerationMutation(v84);
          v34 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
          objc_msgSend(v34, "objectID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v91, "trashedStateChangedForPHAssetOID:", v35);

          objc_msgSend(v34, "objectID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v91, "deferredProcessingNeededChangedForPHAssetOID:", v37);

          objc_msgSend(v34, "objectID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v91, "contentOrThumbnailChangedForPHAssetOID:", v39);

          PLPTPGetLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v34, "objectID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "pl_shortURI");
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = (void *)v43;
            v45 = CFSTR("N");
            if (v38)
              v46 = CFSTR("Y");
            else
              v46 = CFSTR("N");
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v137 = v43;
            if (v36)
              v47 = CFSTR("Y");
            else
              v47 = CFSTR("N");
            *(_WORD *)&v137[8] = 2112;
            if (v40)
              v45 = CFSTR("Y");
            *(_QWORD *)&v137[10] = v46;
            *(_WORD *)&v137[18] = 2112;
            *(_QWORD *)&v137[20] = v47;
            *(_WORD *)&v137[28] = 2112;
            *(_QWORD *)&v137[30] = v45;
            _os_log_impl(&dword_1991EC000, v41, OS_LOG_TYPE_DEBUG, "Processing change for asset (%{public}@) (deferredProcessingNeededChanged: %@, isTrashedChanged: %@, contentChanged: %@)", buf, 0x2Au);

          }
          if (v36)
          {
            if ((objc_msgSend((id)v124[5], "containsObject:", v34) & 1) != 0)
            {
              PLPTPGetLog();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v34, "objectID");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "pl_shortURI");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)v137 = v50;
                _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_DEBUG, "Not adding changed asset (%{public}@) to delegate", buf, 0xCu);

              }
            }
            else
            {
              v51 = objc_msgSend(v34, "isTrashed");
              v52 = v87;
              if ((v51 & 1) == 0)
              {
                PLPTPGetLog();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectID");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "pl_shortURI");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v137 = v55;
                  _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_DEBUG, "Adding changed asset (%{public}@) to delegate", buf, 0xCu);

                }
                v52 = v86;
              }
              objc_msgSend(v52, "addObject:", v34);
            }
          }
          if (v40)
          {
            if (objc_msgSend((id)v124[5], "containsObject:", v34))
            {
              if ((objc_msgSend(v34, "isTrashed") & 1) != 0
                || objc_msgSend(v34, "deferredProcessingNeeded") == 1
                || objc_msgSend(v34, "deferredProcessingNeeded") == 2)
              {
                PLPTPGetLog();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectID");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "pl_shortURI");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v34, "isTrashed");
                  v60 = objc_msgSend(v34, "deferredProcessingNeeded");
                  v61 = CFSTR("N");
                  if (v59)
                    v61 = CFSTR("Y");
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)v137 = v58;
                  *(_WORD *)&v137[8] = 2112;
                  *(_QWORD *)&v137[10] = v61;
                  *(_WORD *)&v137[18] = 2048;
                  *(_QWORD *)&v137[20] = v60;
                  _os_log_impl(&dword_1991EC000, v56, OS_LOG_TYPE_DEBUG, "Not adding changed asset (%{public}@) to delegate (isTrashed: %@, deferredProcessingNeeded: %lu)", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v86, "addObject:", v34);
                v97 = MEMORY[0x1E0C809B0];
                v98 = 3221225472;
                v99 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_90;
                v100 = &unk_1E35DF9E8;
                v101 = v85;
                v102 = v34;
                PLRunWithUnfairLock();
              }
            }
            else
            {
              objc_msgSend(v83, "addObject:", v34);
            }
          }
        }
        v31 = v84;
        v32 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
      }
      while (v32);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v5, "removedObjects");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v93, v135, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v94;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v94 != v64)
            objc_enumerationMutation(v62);
          v66 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
          PLPTPGetLog();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v66, "objectID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "pl_shortURI");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v137 = v69;
            _os_log_impl(&dword_1991EC000, v67, OS_LOG_TYPE_DEBUG, "Processing remove for asset (%{public}@)", buf, 0xCu);

          }
          if ((objc_msgSend((id)v124[5], "containsObject:", v66) & 1) != 0)
          {
            PLPTPGetLog();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v66, "objectID");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "pl_shortURI");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v66, "deferredProcessingNeeded");
              v74 = objc_msgSend(v66, "isTrashed");
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)v137 = v72;
              v75 = CFSTR("N");
              if (v74)
                v75 = CFSTR("Y");
              *(_WORD *)&v137[8] = 2048;
              *(_QWORD *)&v137[10] = v73;
              *(_WORD *)&v137[18] = 2112;
              *(_QWORD *)&v137[20] = v75;
              _os_log_impl(&dword_1991EC000, v70, OS_LOG_TYPE_DEBUG, "Not removing deleted asset (%{public}@) from delegate (deferredProcessingNeeded: %lu, isTrashed: %@)", buf, 0x20u);

            }
          }
          else
          {
            PLPTPGetLog();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v66, "objectID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "pl_shortURI");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v137 = v78;
              _os_log_impl(&dword_1991EC000, v76, OS_LOG_TYPE_DEBUG, "Removing asset (%{public}@) from delegate", buf, 0xCu);

            }
            objc_msgSend(v87, "addObject:", v66);
          }
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v93, v135, 16);
      }
      while (v63);
    }

    if (objc_msgSend(v86, "count") || objc_msgSend(v83, "count") || objc_msgSend(v87, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v85->_delegate);
      objc_msgSend(v86, "valueForKey:", CFSTR("localIdentifier"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "valueForKey:", CFSTR("localIdentifier"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "valueForKey:", CFSTR("localIdentifier"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "addedPhotoKeys:deletedPhotoKeys:changedPhotoKeys:changePendingPhotoKeys:", v80, v81, v82, 0);

    }
    v92 = v5;
    PLRunWithUnfairLock();

  }
LABEL_87:
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  PHPTPDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "libraryDidBecomeUnavailable");

  }
}

- (void)_addAssetsNeedingFinalization:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  PLRunWithUnfairLock();
  -[PHPTPAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset");

}

- (void)_requestFinalizationOfNextAsset
{
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[8];
  uint8_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (-[PFCameraViewfinderSessionWatcher isCameraRunning](self->_cameraWatcher, "isCameraRunning"))
  {
    PLPTPGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_INFO, "Camera view finder is running, skipping finalization requests", buf, 2u);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    v6 = buf;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__17296;
    v9 = __Block_byref_object_dispose__17297;
    v10 = 0;
    v4 = MEMORY[0x1E0C809B0];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v6 + 5), "objectValue", v4, 3221225472, __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke, &unk_1E35DF920, self, buf);

    _Block_object_dispose(buf, 8);
  }
}

- (id)_sendFinalizationRequestForAsset:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  PHPTPAssetManager *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__17296;
  v25 = __Block_byref_object_dispose__17297;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v10 = v7;
  v17 = v10;
  v18 = self;
  v20 = &v21;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v11, "performBlockAndWait:", v16);
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithObjectIDs:options:](PHAsset, "fetchAssetsWithObjectIDs:options:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v21 = MEMORY[0x1E0C809B0];
    v22 = v14;
    v23 = v18;
    PLRunWithUnfairLock();
    PLPTPGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = v25[3];
      *(_DWORD *)buf = 138412546;
      v29 = v11;
      v30 = 2048;
      v31 = v20;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "Re-enqueued finalization for asset (uuid: %@, pending: %lu)", buf, 0x16u);
    }

    -[PHPTPAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset", v21, 3221225472, __90__PHPTPAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke, &unk_1E35DEB38);
    _Block_object_dispose(&v24, 8);
  }

}

- (BOOL)libraryIsAvailable
{
  void *v2;
  BOOL v3;

  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)cplStorageState
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudPhotoLibraryEnabled");

  if (!v4)
    return 0;
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeepOriginalsEnabled");

  if (v6)
    return 2;
  else
    return 1;
}

- (id)_enumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, unsigned __int8 *);
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v31;
  void *context;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a4;
  v37 = 0;
  -[PHPTPAssetManager _fetchAssetsForIdentifiers:includeTrash:](self, "_fetchAssetsForIdentifiers:includeTrash:", v6, v6 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v31 = v6;
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        context = (void *)MEMORY[0x19AEBEADC]();
        v10 = (void *)MEMORY[0x1E0CB36B8];
        v11 = objc_msgSend(v8, "count");
        if (v11 - v9 >= 0xC8)
          v12 = 200;
        else
          v12 = v11 - v9;
        objc_msgSend(v10, "indexSetWithIndexesInRange:", v9, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v8;
        objc_msgSend(v8, "objectsAtIndexes:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PHAssetResource assetResourcesForAssets:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAssets:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v15, 0, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v17 = v15;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v34;
LABEL_9:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21);
            objc_msgSend(v16, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v22, v23, &v37);

            if (v37)
              break;
            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
              if (v19)
                goto LABEL_9;
              break;
            }
          }
        }

        v24 = v37;
        objc_autoreleasePoolPop(context);
        v8 = v14;
        if (v24)
          break;
        v9 += 200;
      }
      while (v9 < objc_msgSend(v14, "count"));
    }
    v25 = v8;
    v6 = v31;
  }
  else
  {
    v26 = objc_msgSend(v6, "count");
    PLPTPGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch asset for identifiers: %@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEBUG, "No assets to enumerate", buf, 2u);
    }

    buf[0] = 0;
    v7[2](v7, 0, 0, buf);
    v25 = 0;
  }

  return v25;
}

- (id)_fetchAssetsForIdentifiers:(id)a3 includeTrash:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[3];

  v4 = a4;
  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setChunkSizeForFetch:", 200);
  v15[0] = CFSTR("PHAssetPropertySetIdentifier");
  v15[1] = CFSTR("PHAssetPropertySetPTP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v9);

  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 1);
  objc_msgSend(v8, "setIncludeTrashedAssets:", v4);
  objc_msgSend(v8, "setCacheSizeForFetch:", 200);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), self->_sortAscending);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  if (objc_msgSend(v6, "count"))
    +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v6, v8);
  else
    +[PHAsset fetchAssetsForPTPWithOptions:](PHAsset, "fetchAssetsForPTPWithOptions:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_ensureDeferredRenderingIsComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHAsset fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:](PHAsset, "fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v9, "photoLibraryBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetsdClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems");

  }
}

- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7
{
  return -[PHPTPAssetManager _createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:debugAnalytics:](self, "_createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:debugAnalytics:", a3, a4, a5, a6, a7, 0);
}

- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7 debugAnalytics:(id)a8
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  PHMutablePTPAsset *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v12 = a4;
  v71 = a5;
  v13 = a8;
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v72 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v75, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pl_shortURI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v81 = (uint64_t)v16;
    v82 = 2112;
    v83 = (uint64_t)v12;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "Creating PLPTPAssets for asset (%@) resources: %@", buf, 0x16u);

    v13 = v72;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  v20 = v71;
  v74 = v17;
  if (v18)
  {
    v21 = v18;
    v22 = *(_QWORD *)v77;
    *(_QWORD *)&v19 = 138543618;
    v70 = v19;
LABEL_5:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v77 != v22)
        objc_enumerationMutation(v17);
      v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v23);
      v25 = +[PHPTPAssetManager _isPrimaryAssetResourceType:](PHPTPAssetManager, "_isPrimaryAssetResourceType:", objc_msgSend(v24, "type", v70));
      if (v25 && (objc_msgSend(v24, "isLocallyAvailable") & 1) == 0)
        break;
      if (!-[PHPTPAssetManager _shouldSkipResource:forAsset:conversionSupport:debugAnalytics:](self, "_shouldSkipResource:forAsset:conversionSupport:debugAnalytics:", v24, v75, v20, v13))
      {
        v26 = -[PHPTPAsset initWithPhotosAsset:photosResource:]([PHMutablePTPAsset alloc], "initWithPhotosAsset:photosResource:", v75, v24);
        if (v26)
        {
          objc_msgSend(v73, "addObject:", v26);
        }
        else
        {
          PLPTPGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (v28)
            {
              objc_msgSend(v75, "objectID");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "pl_shortURI");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v24, "type");
              *(_DWORD *)buf = v70;
              v81 = (uint64_t)v63;
              v82 = 2048;
              v83 = v64;
              _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "Error: unable to create PHPTPAsset for PHAssetResource of asset (%{public}@) of type %ld (skipping asset)", buf, 0x16u);

            }
            v61 = 0;
            v17 = v74;
LABEL_46:
            v35 = v17;
            v57 = v73;
            goto LABEL_51;
          }
          if (v28)
          {
            objc_msgSend(v75, "objectID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "pl_shortURI");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v24, "type");
            *(_DWORD *)buf = v70;
            v81 = (uint64_t)v30;
            v82 = 2048;
            v83 = v31;
            _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "Error: unable to create PHPTPAsset for PHAssetResource of asset (%{public}@) of type %ld (skipping resource)", buf, 0x16u);

            v20 = v71;
          }

          v13 = v72;
        }

        v17 = v74;
      }
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v21)
          goto LABEL_5;
        goto LABEL_20;
      }
    }
    PLPTPGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v58 = objc_msgSend(v24, "type");
      objc_msgSend(v75, "objectID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "pl_shortURI");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v81 = v58;
      v82 = 2114;
      v83 = (uint64_t)v60;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_INFO, "PHPTPAsset creation: skipping asset because non-local original resource (%ld) for asset (%{public}@)", buf, 0x16u);

    }
    v61 = 0;
    goto LABEL_46;
  }
LABEL_20:

  PLPTPGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = objc_msgSend(v73, "count");
    v34 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218498;
    v81 = v33;
    v20 = v71;
    v82 = 2048;
    v83 = v34;
    v84 = 2112;
    v85 = v73;
    _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEBUG, "Created %lu PHPTPAssets for %lu resources: %@", buf, 0x20u);
  }

  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 7, v73, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 108, v73, 0);
  v36 = objc_claimAutoreleasedReturnValue();
  v27 = v36;
  if (v35 && v36)
  {
    PLPTPGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEBUG, "Combining adjustment resource with overflow adjustment resource. Removing overflow adjustment resource from created PHPTPAssets", buf, 2u);
    }

    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "objectCompressedSize");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedIntegerValue");
    -[NSObject objectCompressedSize](v27, "objectCompressedSize");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v41, "unsignedIntegerValue") + v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObjectCompressedSize:", v42);

    -[NSObject url](v27, "url");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setOverflowURL:", v43);

    objc_msgSend(v73, "removeObject:", v27);
    v20 = v71;
  }
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 5, v73, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    PLPTPGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v75, "objectID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "pl_shortURI");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = (uint64_t)v47;
      v82 = 2112;
      v83 = (uint64_t)v48;
      _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_INFO, "Skipping full size render video due to missing full size render image: %{public}@ (UUID: %@)", buf, 0x16u);

    }
    -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 10, v73, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "removeObject:", v49);

    v20 = v71;
  }
  -[PHPTPAssetManager _updateConversionResultForPTPAssets:conversionSupport:](self, "_updateConversionResultForPTPAssets:conversionSupport:", v73, v20);
  -[PHPTPAssetManager _ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:withConversionSupport:](self, "_ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:withConversionSupport:", v73, v20);
  if (objc_msgSend(v75, "isPhoto"))
    v50 = 1;
  else
    v50 = 2;
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", v50, v73, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _createDiagnosticPTPAssetFromAsset:primaryPTPAsset:](self, "_createDiagnosticPTPAssetFromAsset:primaryPTPAsset:", v75, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    PLPTPGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v75, "objectID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "pl_shortURI");
      v55 = v44;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v81 = (uint64_t)v56;
      _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_DEBUG, "Adding diagnostic resource for asset %@", buf, 0xCu);

      v44 = v55;
      v20 = v71;
    }

    objc_msgSend(v73, "addObject:", v52);
  }
  if (objc_msgSend(v73, "count"))
  {
    v57 = v73;
  }
  else
  {
    PLPTPGetLog();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v75, "objectID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "pl_shortURI");
      v67 = v44;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v81 = (uint64_t)v68;
      _os_log_impl(&dword_1991EC000, v65, OS_LOG_TYPE_ERROR, "Failed to create PHPTPAssets for library asset '%{public}@'", buf, 0xCu);

      v44 = v67;
      v20 = v71;
    }

    v57 = 0;
  }

  v61 = v57;
  v17 = v74;
LABEL_51:

  return v61;
}

- (BOOL)_shouldSkipResource:(id)a3 forAsset:(id)a4 conversionSupport:(id)a5 debugAnalytics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v10, "isLocallyAvailable") & 1) != 0)
  {
    if (!+[PHPTPAsset isSupportedResourceType:](PHPTPAsset, "isSupportedResourceType:", objc_msgSend(v10, "type")))
    {
      PLPTPGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = objc_msgSend(v10, "type");
        objc_msgSend(v11, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pl_shortURI");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = 134218242;
        v34 = v20;
        v35 = 2114;
        v36 = v17;
        v18 = "PTP asset resource creation: skipping unsupported type (%lu) for asset (%{public}@)";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (objc_msgSend(v11, "isVideo")
      && -[PHPTPAssetManager _isPhotoAssetResourceType:](self, "_isPhotoAssetResourceType:", objc_msgSend(v10, "type")))
    {
      PLPTPGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(v10, "type");
        objc_msgSend(v11, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pl_shortURI");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = 134218242;
        v34 = v15;
        v35 = 2114;
        v36 = v17;
        v18 = "PTP asset resource creation: skipping photo type (%lu) for video asset (%{public}@)";
LABEL_11:
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v33, 0x16u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (objc_msgSend(v11, "isPartOfBurst") && objc_msgSend(v10, "type") == 5)
    {
      PLPTPGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      objc_msgSend(v11, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pl_shortURI");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = (uint64_t)v24;
      v25 = "PTP asset resource creation: skipping full size resource for burst asset (%{public}@)";
      goto LABEL_35;
    }
    if (-[PHPTPAssetManager _isPenultimateAssetResource:](self, "_isPenultimateAssetResource:", v10)
      && (!objc_msgSend(v12, "peerSupportsAdjustmentBaseResources")
       || (objc_msgSend(v12, "penultimateIsPublic") & 1) == 0))
    {
      PLPTPGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      if (objc_msgSend(v12, "peerSupportsAdjustmentBaseResources"))
        v27 = CFSTR("Y");
      else
        v27 = CFSTR("N");
      if (objc_msgSend(v12, "penultimateIsPublic"))
        v28 = CFSTR("Y");
      else
        v28 = CFSTR("N");
      objc_msgSend(v11, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pl_shortURI");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      v34 = (uint64_t)v27;
      v35 = 2112;
      v36 = v28;
      v37 = 2114;
      v38 = v24;
      v25 = "PTP asset resource creation: skipping penultimate resource (peer support: %@, is public: %@) for asset (%{public}@)";
      v29 = v14;
      v30 = 32;
LABEL_36:
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, v30);

      goto LABEL_12;
    }
    objc_msgSend(v11, "filename");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      objc_msgSend(v11, "ptpProperties");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "originalFilename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        PLPTPGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        objc_msgSend(v11, "objectID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pl_shortURI");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = (uint64_t)v24;
        v25 = "PTP asset resource creation: skipping resource with missing filename AND originalFilename for asset (%{public}@)";
LABEL_35:
        v29 = v14;
        v30 = 12;
        goto LABEL_36;
      }
    }
    v21 = 0;
    goto LABEL_13;
  }
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v10, "type");
    objc_msgSend(v11, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pl_shortURI");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = 134218242;
    v34 = v19;
    v35 = 2114;
    v36 = v17;
    v18 = "PTP asset resource creation: skipping non-local resource (%ld) for asset (%{public}@)";
    goto LABEL_11;
  }
LABEL_12:

  objc_msgSend(v13, "addSkippedResource:", v10);
  v21 = 1;
LABEL_13:

  return v21;
}

- (void)_updateConversionResultForPTPAssets:(id)a3 conversionSupport:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isPhoto") & 1) != 0 || objc_msgSend(v11, "isMovie"))
        {
          v12 = v11;
          v13 = v12;
          if (objc_msgSend(v12, "isMovie"))
          {
            v13 = v12;
            if (objc_msgSend(v12, "isPartOfLivePhoto"))
            {
              v14 = objc_msgSend(v12, "isRender") ? 5 : 1;
              -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", v14, v6, 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v13)
              {
                PLPTPGetLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v12, "resourceHandle");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "localIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v39 = (uint64_t)v17;
                  _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unexpected nil assetForSourceHints for live photo still image for asset %{public}@", buf, 0xCu);

                }
                v13 = 0;
              }
            }
          }
          +[PHPTPConversionSourceHints hintsForPTPAsset:isVideo:isRender:](PHPTPConversionSourceHints, "hintsForPTPAsset:isVideo:isRender:", v13, objc_msgSend(v12, "isMovie"), objc_msgSend(v12, "isRender"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "resourceHandle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHPTPAssetManager _assetTypeTranscodeLabelForType:](self, "_assetTypeTranscodeLabelForType:", objc_msgSend(v19, "resourceType"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "conversionResultForPTPAsset:sourceHints:forceLegacyConversion:assetTypeLabel:", v12, v18, 0, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            PLPTPGetLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "resourceHandle");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "resourceType");
              objc_msgSend(v12, "relatedUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v39 = v28;
              v40 = 2114;
              v41 = v29;
              _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "No PHPTPConversionResult for conversion for original asset resource %ld for asset %{public}@", buf, 0x16u);

            }
            v25 = v31;
            goto LABEL_34;
          }
          if (objc_msgSend(v21, "requiresConversion"))
          {
            if (objc_msgSend(v33, "peerSupportsTranscodeChoice"))
            {
              objc_msgSend(v12, "updateForTranscodeChoiceWithConversionResult:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                objc_msgSend(v31, "addObject:", v22);
              }
              else
              {
                PLPTPGetLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v12, "resourceHandle");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "localIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v39 = (uint64_t)v24;
                  _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Failed to make converted asset for asset %{public}@", buf, 0xCu);

                }
              }

            }
            else
            {
              objc_msgSend(v12, "updateWithConversionResult:", v21);
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v8)
        continue;
      break;
    }
  }

  v25 = v31;
  objc_msgSend(v6, "addObjectsFromArray:", v31);
LABEL_34:

}

- (BOOL)_ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:(id)a3 withConversionSupport:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 1;
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 1, v6, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 9, v6, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v9 && v10)
  {
    -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", 1, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPTPConversionSourceHints hintsForPTPAsset:isVideo:isRender:](PHPTPConversionSourceHints, "hintsForPTPAsset:isVideo:isRender:", v9, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversionResultForPTPAsset:sourceHints:forceLegacyConversion:assetTypeLabel:", v9, v12, 1, CFSTR("originalAssetFromVideoComplement"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      if (objc_msgSend(v7, "peerSupportsTranscodeChoice"))
      {
        objc_msgSend(v9, "updateForTranscodeChoiceWithConversionResult:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      else
      {
        objc_msgSend(v9, "updateWithConversionResult:", v14);
      }

      v8 = 1;
    }
    else
    {
      PLPTPGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "resourceHandle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "resourceType");
        objc_msgSend(v9, "relatedUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = v18;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Unexpected nil PHPTPConversionResult for forced conversion for original asset resource %ld for asset %{public}@", (uint8_t *)&v21, 0x16u);

      }
      v8 = 0;
    }
  }

  return v8;
}

- (id)_ptpAssetWithType:(int64_t)a3 fromPTPAssets:(id)a4 requiresConversion:(BOOL)a5
{
  int v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "resourceHandle", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "resourceType") == a3)
        {
          objc_msgSend(v12, "resourceHandle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "requiresConversion");

          if (v15 == v5)
          {
            v16 = v12;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)_createDiagnosticPTPAssetFromAsset:(id)a3 primaryPTPAsset:(id)a4
{
  id v6;
  PHPhotoLibrary *photoLibrary;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PHMutablePTPAsset *v12;
  void *v13;
  PHMutablePTPAsset *v14;
  void *v15;
  stat v17;

  v6 = a3;
  if (self->_provideDiagnosticFile)
  {
    photoLibrary = self->_photoLibrary;
    objc_msgSend(a4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPTPAssetManager _diagnosticFilePathForLibrary:mainFilename:createIfNeeded:](self, "_diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", photoLibrary, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v17, 0, sizeof(v17));
    v11 = objc_retainAutorelease(v10);
    if (lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0),
           &v17)
      || (v17.st_mode & 0xF000) != 0x8000)
    {
      v14 = 0;
    }
    else
    {
      v12 = [PHMutablePTPAsset alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PHPTPAsset initWithPhotosAsset:url:resourceType:orientation:](v12, "initWithPhotosAsset:url:resourceType:orientation:", v6, v13, 113, 1);

      objc_msgSend(v11, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMutablePTPAsset setDcfFilename:](v14, "setDcfFilename:", v15);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_diagnosticFilePathForLibrary:(id)a3 mainFilename:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  objc_msgSend(a3, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateDirectoryWithSubType:createIfNeeded:error:", 8, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("DBG"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_expungeAsset:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPTPGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pl_shortURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "Expunging asset: %{public}@, reason: %{public}@", buf, 0x16u);

  }
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__PHPTPAssetManager__expungeAsset_withReason___block_invoke;
  v19[3] = &unk_1E35DF110;
  v12 = v6;
  v20 = v12;
  v18 = 0;
  v13 = objc_msgSend(v11, "performChangesAndWait:error:", v19, &v18);
  v14 = v18;

  if ((v13 & 1) == 0)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pl_shortURI");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Error trying to expunge asset: %{public}@ (%@)", buf, 0x16u);

    }
  }

}

- (id)_photosAssetForPTPAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = CFSTR("PHAssetPropertySetPTP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend(v6, "setIncludeAllBurstAssets:", 1);
  objc_msgSend(v4, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    PLPTPGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Unable to find asset for asset local identifier: %@", (uint8_t *)&v17, 0xCu);

    }
  }

  return v12;
}

- (id)_ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, v10);

  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v22 = 138412290;
    v23 = v11;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PTP transcode", "PTP format converted asset reader for %@", (uint8_t *)&v22, 0xCu);
  }

  -[PHPTPFormatConversionManager ptpAssetReaderForFormatConvertedPTPAsset:ofPhotosAsset:resourcePath:originalResourcePath:](self->_formatConversionManager, "ptpAssetReaderForFormatConvertedPTPAsset:ofPhotosAsset:resourcePath:originalResourcePath:", v13, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PLPTPGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_END, v15, "PTP transcode", ", (uint8_t *)&v22, 2u);
  }

  return v18;
}

- (void)_handlePhotoLibraryAvailableNotification
{
  void *v3;
  PHPTPDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_libraryAvailabilityStatus <= 1 && v3 != 0)
  {
    v9 = v3;
    objc_msgSend(v3, "registerChangeObserver:", self);
    self->_libraryAvailabilityStatus = 2;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    v3 = v9;
    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "libraryDidBecomeAvailable");

      v3 = v9;
    }
  }

}

- (void)_registerForFirstUnlockNotification
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  uint8_t buf[16];
  _QWORD aBlock[6];
  _QWORD v10[3];
  int v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke;
  aBlock[3] = &unk_1E35DF920;
  aBlock[4] = self;
  aBlock[5] = v10;
  v2 = _Block_copy(aBlock);
  PLPTPGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_INFO, "Registering for first unlock", buf, 2u);
  }

  v4 = MEMORY[0x1E0C80D38];
  v5 = v2;
  v6 = pl_notify_register_dispatch();

  if (v6)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to wait for first unlock", buf, 2u);
    }

  }
  _Block_object_dispose(v10, 8);
}

- (id)_ptpThumbnailForOriginalVideoAsset:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  NSObject *v9;
  __uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  CGFloat v19;
  CGFloat v20;
  __uint64_t v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:]";
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__17296;
  v25 = __Block_byref_object_dispose__17297;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PHPTPAssetManager__ptpThumbnailForOriginalVideoAsset_size_compressionQuality___block_invoke;
  v16[3] = &unk_1E35D9540;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  p_buf = &buf;
  v19 = width;
  v20 = height;
  v21 = v10;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)_isPenultimateAssetResource:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (v6 > 0x14)
    goto LABEL_9;
  if (((1 << v6) & 0x306FE) != 0)
  {
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if (((1 << v6) & 0x18E000) != 0)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v5, "type");
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (((1 << v6) & 0x1900) == 0)
  {
LABEL_9:
    if (v6 - 108 > 5 || ((1 << (v6 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1033, CFSTR("Unhandled resource type (%lu) in %s"), objc_msgSend(v5, "type"), "-[PHPTPAssetManager _isPenultimateAssetResource:]");

    }
    goto LABEL_15;
  }
  v8 = 1;
LABEL_16:

  return v8;
}

- (BOOL)_isPhotoAssetResourceType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 > 0x14)
    goto LABEL_6;
  if (((1 << a3) & 0x9DECC) != 0)
    return 0;
  if (((1 << a3) & 0x102132) == 0)
  {
LABEL_6:
    if (a3 != 110)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1063, CFSTR("Unhandled resource type (%lu) in %s"), a3, "-[PHPTPAssetManager _isPhotoAssetResourceType:]");

    }
    return 0;
  }
  return 1;
}

- (id)_assetTypeTranscodeLabelForType:(int64_t)a3
{
  id result;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = CFSTR("original");
  switch(a3)
  {
    case 1:
    case 2:
      return result;
    case 3:
    case 4:
    case 7:
    case 16:
    case 17:
      return CFSTR("non-transcoded resource type");
    case 5:
      return CFSTR("full size render image");
    case 6:
      return CFSTR("full size render video");
    case 8:
    case 12:
      return CFSTR("adjustment base original");
    case 9:
      return CFSTR("video complement sidecar");
    case 10:
      return CFSTR("full size render video complement sidecar");
    case 11:
      return CFSTR("spatial over capture video complement");
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      PLPTPGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a3;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    case 18:
      goto LABEL_9;
    default:
      if ((unint64_t)(a3 - 108) <= 5 && ((1 << (a3 - 108)) & 0x25) != 0)
        return CFSTR("non-transcoded resource type");
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1104, CFSTR("Unhandled resource type (%lu) in %s"), a3, "-[PHPTPAssetManager _assetTypeTranscodeLabelForType:]");

      return CFSTR("unkown");
  }
}

- (BOOL)_isThumbnailSupportedForResourceType:(int64_t)a3
{
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x14)
    goto LABEL_10;
  if (((1 << a3) & 0x1F76) != 0)
    return 1;
  if (((1 << a3) & 0x18E000) != 0)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
    }

    return 0;
  }
  if (((1 << a3) & 0x30088) == 0)
  {
LABEL_10:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1139, CFSTR("Unhandled resource type (%lu) in %s"), a3, "-[PHPTPAssetManager _isThumbnailSupportedForResourceType:]");

    }
  }
  return 0;
}

- (int64_t)_imageVersionForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 0;
  switch(a4)
  {
    case 1:
    case 2:
    case 4:
    case 8:
    case 9:
    case 11:
    case 12:
      goto LABEL_9;
    case 3:
    case 7:
    case 16:
    case 17:
      goto LABEL_6;
    case 5:
    case 6:
    case 10:
      goto LABEL_10;
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      PLPTPGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v14 = a4;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }
      goto LABEL_8;
    case 18:
      goto LABEL_11;
    default:
      if ((unint64_t)(a4 - 108) <= 5 && ((1 << (a4 - 108)) & 0x25) != 0)
      {
LABEL_6:
        PLPTPGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v14 = (int64_t)v10;
          _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "Unexpected request for an image version for resource type %@", buf, 0xCu);

        }
LABEL_8:

LABEL_9:
        v8 = 2;
      }
      else
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1176, CFSTR("Unhandled resource type (%lu) in %s"), a4, "-[PHPTPAssetManager _imageVersionForAsset:resourceType:]");

        v8 = 0;
      }
LABEL_10:

      return v8;
  }
}

- (void)_logGreenTeaStatusForPTPAssetHandle:(id)a3 photosAsset:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!MEMORY[0x19AEBEEFC]())
    goto LABEL_15;
  v9 = objc_msgSend(v7, "resourceType");
  if (v9 <= 0x14)
  {
    if (((1 << v9) & 0x1F76) != 0)
    {
      objc_msgSend(v8, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        plslogGreenTea();
      plslogGreenTeaTransmittingPhotosOrVideos();
      goto LABEL_15;
    }
    if (((1 << v9) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v14 = objc_msgSend(v7, "resourceType");
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      goto LABEL_15;
    }
    if (((1 << v9) & 0x30088) != 0)
      goto LABEL_15;
  }
  if (v9 - 108 > 5 || ((1 << (v9 - 108)) & 0x25) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1217, CFSTR("Unhandled resource type (%lu) in %s"), objc_msgSend(v7, "resourceType"), "-[PHPTPAssetManager _logGreenTeaStatusForPTPAssetHandle:photosAsset:]");

  }
LABEL_15:

}

- (id)_primaryResourceForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPAssetManager _primaryResourceForAsset:fromResources:](self, "_primaryResourceForAsset:fromResources:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_primaryResourceForAsset:(id)a3 fromResources:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        if (v12 <= 0x14)
        {
          if (((1 << v12) & 0x31FF8) != 0)
            continue;
          if (((1 << v12) & 0x18E000) != 0)
          {
            PLPTPGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v14 = objc_msgSend(v11, "type");
              *(_DWORD *)buf = 134217984;
              v25 = v14;
              _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
            }
            goto LABEL_19;
          }
          if (((1 << v12) & 6) != 0)
          {
            v13 = v8;
            v8 = v11;
LABEL_19:

            continue;
          }
        }
        if (v12 - 108 > 5 || ((1 << (v12 - 108)) & 0x25) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAssetManager.m"), 1260, CFSTR("Unhandled resource type (%lu) in %s"), objc_msgSend(v11, "type"), "-[PHPTPAssetManager _primaryResourceForAsset:fromResources:]");
          goto LABEL_19;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (!v7)
        goto LABEL_24;
    }
  }
  v8 = 0;
LABEL_24:

  return v8;
}

- (id)_resourceOfType:(int64_t)a3 fromResources:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v5 = -[PFCameraViewfinderSessionWatcher isCameraRunning](self->_cameraWatcher, "isCameraRunning");
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to running. Canceling inflight request.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v10 = buf;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__17296;
    v13 = __Block_byref_object_dispose__17297;
    v14 = 0;
    v8 = MEMORY[0x1E0C809B0];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v10 + 5), "invalidateWithHandler:", &__block_literal_global_17311, v8, 3221225472, __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke, &unk_1E35DF920, self, buf);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to NOT running.", buf, 2u);
    }

    -[PHPTPAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset");
  }

}

- (void)_startAnalyticsCollection
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PHPTPAssetManager *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  PHPTPAssetManager *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  PHPTPAssetManager *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__17296;
  v22[4] = __Block_byref_object_dispose__17297;
  v23 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke;
  v19 = &unk_1E35DF920;
  v20 = self;
  v21 = v22;
  PLRunWithUnfairLock();
  -[PHPTPAssetManager photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2;
  v12[3] = &unk_1E35DEE50;
  v6 = v5;
  v13 = v6;
  v14 = self;
  v15 = v22;
  objc_msgSend(v6, "performBlock:withPriority:", v12, 0);
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_158;
  v8[3] = &unk_1E35DEE50;
  v7 = v6;
  v9 = v7;
  v10 = self;
  v11 = v22;
  objc_msgSend(v7, "performBlock:withPriority:", v8, 0);

  _Block_object_dispose(v22, 8);
}

- (void)_stopAnalyticsCollectionAndReport
{
  NSObject *analyticsAsyncDataGroup;
  NSObject *v4;
  _QWORD block[5];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__17296;
  v6[4] = __Block_byref_object_dispose__17297;
  -[PHPTPAssetManager popAnalyticsData](self, "popAnalyticsData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  analyticsAsyncDataGroup = self->_analyticsAsyncDataGroup;
  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PHPTPAssetManager__stopAnalyticsCollectionAndReport__block_invoke;
  block[3] = &unk_1E35DB860;
  block[4] = v6;
  dispatch_group_notify(analyticsAsyncDataGroup, v4, block);

  _Block_object_dispose(v6, 8);
}

- (id)popAnalyticsData
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__17296;
  v8 = __Block_byref_object_dispose__17297;
  v9 = 0;
  PLRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setPenultimateIsPublic:(BOOL)a3
{
  -[PHPTPFormatConversionManager setPenultimateIsPublic:](self->_formatConversionManager, "setPenultimateIsPublic:", a3);
}

- (BOOL)penultimateIsPublic
{
  return -[PHPTPFormatConversionManager penultimateIsPublic](self->_formatConversionManager, "penultimateIsPublic");
}

- (PHPTPDelegate)delegate
{
  return (PHPTPDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)countOfAssets
{
  return self->_countOfAssets;
}

- (BOOL)canDeleteAssets
{
  return self->_canDeleteAssets;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)libraryAvailabilityStatus
{
  return self->_libraryAvailabilityStatus;
}

- (void)setLibraryAvailabilityStatus:(int64_t)a3
{
  self->_libraryAvailabilityStatus = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_requestInflight, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_inflightAssetsRequiringFinalization, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_deferredAssets, 0);
  objc_storeStrong((id *)&self->_vendedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_formatConversionManager, 0);
  objc_storeStrong((id *)&self->_analyticsAsyncDataGroup, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __37__PHPTPAssetManager_popAnalyticsData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTimeDisconnected:", (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

uint64_t __54__PHPTPAssetManager__stopAnalyticsCollectionAndReport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "report");
}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke(uint64_t a1)
{
  PHPTPAnalyticsData *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(PHPTPAnalyticsData);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTimeConnected:", (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCplState:", objc_msgSend(*(id *)(a1 + 32), "cplStorageState"));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "countForFetchRequest:error:", v4, &v9);
  v7 = v9;

  if (v6)
  {
    PLRunWithUnfairLock();
  }
  else if (v7)
  {
    PLPTPGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Error fetching count of library assets: %@", buf, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 40));

}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_158(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("deferredProcessingNeeded"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v4, &v10);
  v8 = v10;

  if (v7)
  {
    PLRunWithUnfairLock();
  }
  else if (v8)
  {
    PLPTPGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error fetching count for assets with pending deferred processing: %@", buf, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 40));

}

uint64_t __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2_164(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDeferredRenderCount:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setLibraryAssetCount:", *(_QWORD *)(a1 + 40));
}

void __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

}

uint64_t __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

void __80__PHPTPAssetManager__ptpThumbnailForOriginalVideoAsset_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  id v19;
  id obj;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEBEADC]();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetWithObjectID:inLibrary:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "pathForOriginalFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    v19 = 0;
    obj = v12;
    v13 = objc_msgSend(v9, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v10, &obj, &v19, *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_storeStrong((id *)(v11 + 40), obj);
    v14 = v19;

    if ((v13 & 1) == 0)
    {
      PLPTPGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = *(double *)&v14;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to generate video thumbnail (original video): %@", buf, 0xCu);
      }

    }
  }
  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 72)) / 1000000000.0;
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
    *(_DWORD *)buf = 134218499;
    v22 = v17;
    v23 = 2113;
    v24 = 0;
    v25 = 2048;
    v26 = v18;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result == 1)
  {
    notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "_handlePhotoLibraryAvailableNotification");
  }
  return result;
}

uint64_t __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke_130(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __46__PHPTPAssetManager__expungeAsset_withReason___block_invoke(uint64_t a1)
{
  PHAssetDeleteOptions *v1;
  id v2;

  +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHAssetDeleteRequest, "deleteRequestForObject:operation:", *(_QWORD *)(a1 + 32), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(PHAssetDeleteOptions);
  -[PHAssetDeleteOptions setExpungeSource:](v1, "setExpungeSource:", 8);
  objc_msgSend(v2, "setDeleteOptions:", v1);

}

void __90__PHPTPAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 3072)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "count");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

}

void __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_primaryResourceForAsset:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pl_shortURI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_INFO, "Requesting finalization of asset: %{public}@", buf, 0xCu);

  }
  v8 = objc_alloc(MEMORY[0x1E0D71A88]);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("ptp-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingResourceIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithTaskIdentifier:assetObjectID:resource:", v11, v3, v12);

  v14 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sharedAssetsdClientForPhotoLibraryURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "resourceAvailabilityClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke_108;
  v24[3] = &unk_1E35D94F0;
  v18 = *(void **)(a1 + 48);
  v24[4] = *(_QWORD *)(a1 + 40);
  v25 = v2;
  v26 = v3;
  v27 = v18;
  v19 = v3;
  v20 = v2;
  objc_msgSend(v17, "sendMakeResourceAvailableRequest:reply:", v13, v24);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

uint64_t __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke_108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMakeResourceReplyForAssetUUID:assetObjectID:moc:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a6);
}

void __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
    *(_DWORD *)buf = 134217984;
    v18 = v3;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_INFO, "Camera view finder is NOT running, sending finalization requests (pending:%lu)", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_initWeak((id *)buf, v5);

    v7 = objc_alloc(MEMORY[0x1E0D73248]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke_97;
    v14 = &unk_1E35D94C8;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    v8 = objc_msgSend(v7, "initWithBlock:", &v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectAtIndex:", 0, v11, v12, v13, v14);
  }

}

id __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke_97(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFinalizationRequestForAsset:moc:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __51__PHPTPAssetManager__addAssetsNeedingFinalization___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "Adding %lu assets to pending finalization queue.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "fetchResultAfterChanges");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

uint64_t __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDownloadedCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "downloadedCount") + 1);
}

uint64_t __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "incrementConversionCountForAssetType:", objc_msgSend(*(id *)(a1 + 40), "kind"));
}

void __50__PHPTPAssetManager_ptpDeletePhotoForAssetHandle___block_invoke(uint64_t a1)
{
  int64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = +[PHPTPAsset ptpTrashedStateForResourceType:](PHPTPAsset, "ptpTrashedStateForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
  +[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPtpTrashedState:", *(_QWORD *)(a1 + 48) | v2);
  PLPTPGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 134218240;
    v7 = v5;
    v8 = 2048;
    v9 = v2;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEFAULT, "Updated asset trashed state (old: 0x%llx, new: 0x%llx)", (uint8_t *)&v6, 0x16u);
  }

}

void __72__PHPTPAssetManager_ptpThumbnailForAssetHandle_size_compressionQuality___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a2
    && objc_msgSend(*(id *)(a1 + 32), "_isPhotoAssetResourceType:", objc_msgSend(*(id *)(a1 + 40), "resourceType")))
  {
    PLPTPGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pl_shortURI");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_NSStringFromCGSize();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v9 = 138543874;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Image manager did not return a thumbnail for asset %{public}@ for size %{public}@ with options %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
}

void __71__PHPTPAssetManager_ptpEnumerateAssetsWithLocalIdentifiers_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = v13;
  v9 = v7;
  if (!v13)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:", v8, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
  (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v12, a4);

}

void __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_msgSend(v8, "count");
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pl_shortURI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "Processing %lu resources for asset %@: %@", buf, 0x20u);

  }
  if (!v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v7, "ptpProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deferredProcessingNeeded");

  if (v14)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = (uint64_t)v16;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "Found asset requiring finalization (uuid: %@)", buf, 0xCu);

    }
    v17 = *(void **)(a1 + 32);
    v21 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_addAssetsNeedingFinalization:", v18);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_createPTPAssetsFromAsset:photosResources:withConversionSupport:includeMetadata:includeAdjustmentOverflowDataBlob:debugAnalytics:", v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, 1, *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 48);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v18, 1);
    (*(void (**)(uint64_t, void *, uint64_t))(v19 + 16))(v19, v20, a4);

    objc_msgSend(*(id *)(a1 + 40), "countResourceTypes:", v18);
  }

}

void __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_55(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

uint64_t __44__PHPTPAssetManager_setHostCharacteristics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateWithPlatformInformation:", *(_QWORD *)(a1 + 40));
}

void __46__PHPTPAssetManager_setPeerMediaCapabilities___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "platformInformation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithPlatformInformation:", v2);

}

+ (BOOL)_shouldIncludeDiagnosticFile
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("PLCameraProvideDiagnosticFile"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

+ (BOOL)_isPrimaryAssetResourceType:(int64_t)a3
{
  NSObject *v6;
  void *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x14)
    goto LABEL_9;
  if (((1 << a3) & 0x31FF8) == 0)
  {
    if (((1 << a3) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a3;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << a3) & 6) != 0)
      return 1;
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPTPAssetManager.m"), 998, CFSTR("Unhandled resource type (%lu) in %s"), a3, "+[PHPTPAssetManager _isPrimaryAssetResourceType:]");

    }
  }
  return 0;
}

@end
