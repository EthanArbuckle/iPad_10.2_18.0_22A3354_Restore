@implementation PHResourceLocalAvailabilityRequest

- (PHResourceLocalAvailabilityRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHResourceLocalAvailabilityRequest.m"), 179, CFSTR("%s is not available as initializer"), "-[PHResourceLocalAvailabilityRequest init]");

  abort();
}

- (PHResourceLocalAvailabilityRequest)initWithAsset:(id)a3 requestType:(int64_t)a4
{
  id v8;
  PHResourceLocalAvailabilityRequest *v9;
  PHResourceLocalAvailabilityRequest *v10;
  uint64_t v11;
  NSProgress *progress;
  uint64_t v13;
  NSMutableArray *activeAssetResourcesRequest;
  PHResourceLocalAvailabilityRequest *v15;
  NSObject *v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHResourceLocalAvailabilityRequest.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (a4 == 1 && (unint64_t)(objc_msgSend(v8, "mediaType") - 1) >= 2)
  {
    PLPhotoKitGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Invalid asset passed to initializer: %@", (uint8_t *)location, 0xCu);
    }

    v15 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PHResourceLocalAvailabilityRequest;
    v9 = -[PHResourceLocalAvailabilityRequest init](&v21, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_asset, a3);
      v10->_requestType = a4;
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
      v11 = objc_claimAutoreleasedReturnValue();
      progress = v10->_progress;
      v10->_progress = (NSProgress *)v11;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = objc_claimAutoreleasedReturnValue();
      activeAssetResourcesRequest = v10->__activeAssetResourcesRequest;
      v10->__activeAssetResourcesRequest = (NSMutableArray *)v13;

      objc_initWeak(location, v10);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke;
      v19[3] = &unk_1E35DE1F8;
      objc_copyWeak(&v20, location);
      -[NSProgress setCancellationHandler:](v10->_progress, "setCancellationHandler:", v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    self = v10;
    v15 = self;
  }

  return v15;
}

- (void)fetchResourceAvailabilityWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PHResourceLocalAvailabilityRequestOptions *v9;
  void *v10;
  PHResourceLocalAvailabilityRequestOptions *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHResourceLocalAvailabilityRequest.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    v9 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (PHResourceLocalAvailabilityRequestOptions *)v7;
LABEL_6:
  v11 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PHResourceLocalAvailabilityRequest_fetchResourceAvailabilityWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E35D7DF0;
  v14 = v8;
  v12 = v8;
  -[PHResourceLocalAvailabilityRequest _fetchResourcesWithOptions:networkAccessAllowed:handler:](self, "_fetchResourcesWithOptions:networkAccessAllowed:handler:", v11, 0, v13);

}

- (void)retrieveRequiredResourcesWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id downloadCompletionHandler;
  PHResourceLocalAvailabilityRequestOptions *v10;
  PHResourceLocalAvailabilityRequestOptions *v11;
  PHResourceLocalAvailabilityRequestOptions *v12;
  _QWORD v13[4];
  PHResourceLocalAvailabilityRequestOptions *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "copy");
  downloadCompletionHandler = self->_downloadCompletionHandler;
  self->_downloadCompletionHandler = v8;

  objc_initWeak(&location, self);
  if (v6)
    v10 = (PHResourceLocalAvailabilityRequestOptions *)v6;
  else
    v10 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  v11 = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E35D7E40;
  objc_copyWeak(&v15, &location);
  v12 = v11;
  v14 = v12;
  -[PHResourceLocalAvailabilityRequest _fetchResourcesWithOptions:networkAccessAllowed:handler:](self, "_fetchResourcesWithOptions:networkAccessAllowed:handler:", v12, 1, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_fetchResourcesWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  double v24;
  void *v25;
  int64_t v26;
  void *v27;
  int v28;
  PHResourceLocalAvailabilityRequest *v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!MEMORY[0x19AEBDEDC]())
    goto LABEL_13;
  v10 = (void *)CFPreferencesCopyAppValue(CFSTR("PHRootSettings"), CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("archive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("resourceDownloadSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("simulateDownload"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("simulateDownloadFailure"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      goto LABEL_10;
    }

LABEL_13:
    v26 = -[PHResourceLocalAvailabilityRequest requestType](self, "requestType");
    if (v26 == 2)
    {
      -[PHResourceLocalAvailabilityRequest asset](self, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHResourceLocalAvailabilityRequest _fetchResourcesForDuplicatingAsset:options:networkAccessAllowed:handler:](self, "_fetchResourcesForDuplicatingAsset:options:networkAccessAllowed:handler:", v27, v8, v6, v9);
    }
    else if (v26 == 1)
    {
      -[PHResourceLocalAvailabilityRequest asset](self, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHResourceLocalAvailabilityRequest _fetchResourcesForSharingAsset:options:networkAccessAllowed:handler:](self, "_fetchResourcesForSharingAsset:options:networkAccessAllowed:handler:", v27, v8, v6, v9);
    }
    else
    {
      if (v26)
        goto LABEL_20;
      -[PHResourceLocalAvailabilityRequest asset](self, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHResourceLocalAvailabilityRequest _fetchResourcesForPickerAsset:options:networkAccessAllowed:handler:](self, "_fetchResourcesForPickerAsset:options:networkAccessAllowed:handler:", v27, v8, v6, v9);
    }

    goto LABEL_20;
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  v18 = (void *)CFPreferencesCopyAppValue(CFSTR("SimulateDownloads"), CFSTR("com.apple.mobileslideshow"));
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("no")) ^ 1;

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v19, "lowercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v22, "isEqualToString:", CFSTR("failure"));

  if (!v21)
    goto LABEL_13;
LABEL_10:
  PLPhotoKitGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Simulating download", (uint8_t *)&v28, 0xCu);
  }

  v24 = (double)arc4random_uniform(0x64u) / 20.0 + 5.0;
  objc_msgSend(v8, "resultHandlerQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHResourceLocalAvailabilityRequest _simulateFetchResourcesWithDuration:success:networkAccessAllowed:queue:handler:](self, "_simulateFetchResourcesWithDuration:success:networkAccessAllowed:queue:handler:", v17 ^ 1u, v6, v25, v9, v24);

LABEL_20:
}

- (void)_fetchResourcesForPickerAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  uint64_t v12;
  PHImageRequestOptions *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  PHVideoRequestOptions *v18;
  id *v19;
  id v20;
  id *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *group;
  id *v33;
  id *v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  BOOL v46;
  _QWORD aBlock[4];
  id v48;
  BOOL v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  id v56;
  BOOL v57;
  _QWORD v58[4];
  id v59;
  BOOL v60;
  _QWORD v61[4];
  NSObject *v62;
  _QWORD v63[4];
  id v64;
  BOOL v65;
  _QWORD v66[4];
  id v67;
  BOOL v68;
  id location;
  _QWORD v70[5];
  id v71;
  _QWORD v72[4];
  _QWORD v73[3];
  char v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v7 = a5;
  v81 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = a4;
  v36 = a6;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 1;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__10890;
  v70[4] = __Block_byref_object_dispose__10891;
  v71 = 0;
  objc_initWeak(&location, self);
  v11 = dispatch_group_create();
  v12 = objc_msgSend(v10, "mediaType");
  if (v12 == 1)
  {
    dispatch_group_enter(v11);
    v13 = objc_alloc_init(PHImageRequestOptions);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v13, "setNetworkAccessAllowed:", v7);
    -[PHImageRequestOptions setVersion:](v13, "setVersion:", 0);
    -[PHImageRequestOptions setLoadingMode:](v13, "setLoadingMode:", 0x10000);
    -[PHImageRequestOptions setDeliveryMode:](v13, "setDeliveryMode:", 1);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke;
    v66[3] = &unk_1E35D7E70;
    v34 = &v67;
    objc_copyWeak(&v67, &location);
    v68 = v7;
    v22 = _Block_copy(v66);
    -[PHImageRequestOptions setProgressHandler:](v13, "setProgressHandler:", v22);
    if (v7)
    {
      PLPhotoKitGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        v76 = v24;
        v77 = 2112;
        v78 = v10;
        v79 = 2112;
        v80 = v35;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current image for asset: %@, options: %@", buf, 0x20u);

      }
    }
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_163;
    v61[3] = &unk_1E35D7E98;
    v63[1] = v73;
    v63[2] = v70;
    v63[3] = v72;
    v19 = &v64;
    v65 = v7;
    objc_copyWeak(&v64, &location);
    v20 = v22;
    v63[0] = v20;
    group = v11;
    v62 = group;
    objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v13, v61, -1.0, -1.0);

    LODWORD(v25) = objc_msgSend(v35, "treatLivePhotoAsStill");
    v33 = (id *)v63;
    v21 = (id *)&v62;
    if (((objc_msgSend(v10, "canPlayPhotoIris") ^ 1 | v25) & 1) != 0)
      goto LABEL_19;
    dispatch_group_enter(group);
    v18 = objc_alloc_init(PHVideoRequestOptions);
    -[PHVideoRequestOptions setNetworkAccessAllowed:](v18, "setNetworkAccessAllowed:", v7);
    -[PHVideoRequestOptions setVersion:](v18, "setVersion:", 0);
    -[PHVideoRequestOptions setDeliveryMode:](v18, "setDeliveryMode:", 1);
    -[PHVideoRequestOptions setVideoComplementAllowed:](v18, "setVideoComplementAllowed:", 1);
    -[PHVideoRequestOptions setRestrictToPlayableOnCurrentDevice:](v18, "setRestrictToPlayableOnCurrentDevice:", 1);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_170;
    v58[3] = &unk_1E35D7E70;
    objc_copyWeak(&v59, &location);
    v60 = v7;
    v31 = _Block_copy(v58);
    -[PHVideoRequestOptions setProgressHandler:](v18, "setProgressHandler:", v31);
    if (v7)
    {
      PLPhotoKitGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        v76 = v27;
        v77 = 2112;
        v78 = v10;
        v79 = 2112;
        v80 = v35;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current video for asset: %@, options: %@", buf, 0x20u);

      }
    }
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_173;
    v50[3] = &unk_1E35D7EC0;
    v57 = v7;
    v53 = v73;
    v54 = v70;
    v55 = v72;
    objc_copyWeak(&v56, &location);
    v29 = v31;
    v52 = v29;
    v51 = group;
    objc_msgSend(v28, "requestAVAssetForVideo:options:resultHandler:", v10, v18, v50);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v59);
  }
  else
  {
    if (v12 != 2)
      goto LABEL_20;
    dispatch_group_enter(v11);
    v13 = objc_alloc_init(PHVideoRequestOptions);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v13, "setNetworkAccessAllowed:", v7);
    -[PHImageRequestOptions setVersion:](v13, "setVersion:", 0);
    -[PHImageRequestOptions setDeliveryMode:](v13, "setDeliveryMode:", 1);
    -[PHImageRequestOptions setRestrictToPlayableOnCurrentDevice:](v13, "setRestrictToPlayableOnCurrentDevice:", 1);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_175;
    aBlock[3] = &unk_1E35D7E70;
    v34 = &v48;
    objc_copyWeak(&v48, &location);
    v49 = v7;
    v15 = _Block_copy(aBlock);
    -[PHImageRequestOptions setProgressHandler:](v13, "setProgressHandler:", v15);
    if (v7)
    {
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        v76 = v17;
        v77 = 2112;
        v78 = v10;
        v79 = 2112;
        v80 = v35;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current video for asset: %@, options: %@", buf, 0x20u);

      }
    }
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v18 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    v42[0] = v14;
    v42[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_176;
    v42[3] = &unk_1E35D7EC0;
    v46 = v7;
    v44[1] = v73;
    v44[2] = v70;
    v44[3] = v72;
    v19 = &v45;
    v42[1] = 3221225472;
    objc_copyWeak(&v45, &location);
    v20 = v15;
    v44[0] = v20;
    v43 = v11;
    -[PHVideoRequestOptions requestAVAssetForVideo:options:resultHandler:](v18, "requestAVAssetForVideo:options:resultHandler:", v10, v13, v42);
    v33 = (id *)v44;
    v21 = (id *)&v43;
  }

LABEL_19:
  objc_destroyWeak(v19);

  objc_destroyWeak(v34);
LABEL_20:
  if (v36)
  {
    objc_msgSend(v35, "resultHandlerQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_177;
    block[3] = &unk_1E35D7EE8;
    v38 = v36;
    v39 = v73;
    v40 = v72;
    v41 = v70;
    dispatch_group_notify(v11, v30, block);

  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);

}

- (void)_fetchResourcesForSharingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  dispatch_group_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _BOOL8 v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD block[4];
  id v34;
  PHResourceLocalAvailabilityRequest *v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  _BYTE *v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  id v45;
  PHResourceLocalAvailabilityRequest *v46;
  _QWORD *v47;
  _BYTE *v48;
  id v49;
  BOOL v50;
  id location;
  _QWORD v52[3];
  char v53;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  id v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v64 = 0;
  objc_msgSend((id)objc_opt_class(), "_resourcesToShareForAsset:options:error:", v10, v11, &v64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v64;
  if (v13)
  {
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 1;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke;
    v59[3] = &unk_1E35D7F10;
    v59[4] = &v60;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v59);
    objc_msgSend(v13, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHResourceLocalAvailabilityRequest _setAssetResources:](self, "_setAssetResources:", v15);

    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    if (!*((_BYTE *)v61 + 24))
    {
      v58 = 1;
      v16 = objc_msgSend(v10, "deferredProcessingNeeded");
      if (v16 == 9)
      {
        PLPhotoKitGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "deferredProcessingNeeded");
          PLManagedAssetDeferredProcessingNeededDescription();
          v18 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 2114;
          v30 = (void *)v18;
          v66 = (uint64_t (*)(uint64_t, uint64_t))v18;
          _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset %@'s deferred processing state reports that it failed: %{public}@", buf, 0x20u);

        }
      }
      v19 = objc_msgSend(v10, "needsDeferredProcessing") ^ 1;
      if (v16 == 9)
        LOBYTE(v19) = 0;
      if ((v19 & 1) == 0)
        v56[3] = 2;
    }
    if (a5)
    {
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v53 = 1;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v66 = __Block_byref_object_copy__10890;
      v67 = __Block_byref_object_dispose__10891;
      v68 = 0;
      objc_initWeak(&location, self);
      v20 = dispatch_group_create();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_179;
      v42[3] = &unk_1E35D7FF0;
      objc_copyWeak(&v49, &location);
      v31 = v14;
      v21 = v10;
      v43 = v21;
      v22 = v20;
      v50 = a5;
      v44 = v22;
      v47 = v52;
      v48 = buf;
      v23 = v11;
      v24 = v11;
      v45 = v24;
      v46 = self;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v42);
      dispatch_get_global_queue(25, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_194;
      block[3] = &unk_1E35D8040;
      v39 = v52;
      v34 = v24;
      v35 = self;
      v36 = v21;
      v37 = v13;
      v40 = buf;
      v41 = &v55;
      v38 = v12;
      dispatch_group_notify(v22, v25, block);

      v11 = v23;
      v14 = v31;

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v52, 8);
    }
    else if (v12)
    {
      if (*((_BYTE *)v61 + 24))
      {
        v26 = _AssetVersionFromRequestOptions(v11);
        v54 = 0;
        objc_msgSend((id)objc_opt_class(), "_resourceInfoForAsset:resourcesToShare:assetVersion:fulfillOnDemandResources:error:", v10, v13, v26, 1, &v54);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v54;
        v29 = *((_BYTE *)v61 + 24) != 0;
      }
      else
      {
        v29 = 0;
        v28 = 0;
        v27 = (void *)MEMORY[0x1E0C9AA70];
      }
      (*((void (**)(id, _BOOL8, uint64_t, void *, id))v12 + 2))(v12, v29, v56[3], v27, v28);

    }
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v60, 8);
  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, 0, v14);
  }

}

- (void)_fetchResourcesForDuplicatingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PHAssetResourceRequestOptions *v24;
  void (**v25)(_QWORD, double);
  void *v26;
  void (**v27)(_QWORD, double);
  NSObject *v28;
  PHResourceLocalAvailabilityRequest *v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  PHResourceLocalAvailabilityRequest *v39;
  id obj;
  id v42;
  id v43;
  id v44;
  PHAssetResourceRequestOptions *v45;
  uint64_t i;
  _QWORD block[4];
  id v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t *v59;
  _QWORD *v60;
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  int v65;
  _QWORD aBlock[4];
  id v67;
  uint64_t *v68;
  id v69;
  BOOL v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  id location;
  _QWORD v85[5];
  id v86;
  _QWORD v87[3];
  char v88;
  uint8_t buf[4];
  PHResourceLocalAvailabilityRequest *v90;
  __int16 v91;
  _BYTE v92[24];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v42 = a4;
  v38 = a6;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v88 = 1;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = __Block_byref_object_copy__10890;
  v85[4] = __Block_byref_object_dispose__10891;
  v86 = 0;
  v39 = self;
  objc_initWeak(&location, self);
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 1;
  _FetchableResourcesForAsset(v43, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke;
  v79[3] = &unk_1E35D8068;
  v79[4] = &v80;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v79);
  -[PHResourceLocalAvailabilityRequest _setAssetResources:](self, "_setAssetResources:", v9);
  v37 = v9;
  if (*((_BYTE *)v81 + 24))
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_msgSend(v43, "deferredProcessingNeeded");
    if (v11 == 9)
    {
      PLPhotoKitGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v43, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "deferredProcessingNeeded");
        PLManagedAssetDeferredProcessingNeededDescription();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v90 = v39;
        v91 = 2112;
        *(_QWORD *)v92 = v13;
        *(_WORD *)&v92[8] = 2114;
        *(_QWORD *)&v92[10] = v14;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset %@'s deferred processing state reports that it failed: %{public}@", buf, 0x20u);

      }
    }
    v15 = objc_msgSend(v43, "needsDeferredProcessing");
    if (v11 == 9)
      v16 = 1;
    else
      v16 = v15;
    if (v16)
      v10 = 2;
    else
      v10 = 1;
  }
  if (a5)
  {
    v36 = v10;
    v17 = dispatch_group_create();
    v18 = objc_msgSend(v42, "treatLivePhotoAsStill");
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v37;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v76 != v20)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          if (!v18 || objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "type") != 9)
          {
            dispatch_group_enter(v17);
            v22 = objc_msgSend(v21, "type");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssetResourceRequest-Type%li"), v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_alloc_init(PHAssetResourceRequestOptions);
            -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v24, "setNetworkAccessAllowed:", 1);
            -[PHAssetResourceRequestOptions setResistentToPrune:](v24, "setResistentToPrune:", 1);
            v45 = v24;
            v71 = 0;
            v72 = &v71;
            v73 = 0x2020000000;
            v74 = 0;
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_199;
            aBlock[3] = &unk_1E35D7F38;
            v68 = &v71;
            objc_copyWeak(&v69, &location);
            v44 = v23;
            v67 = v44;
            v70 = a5;
            v25 = (void (**)(_QWORD, double))_Block_copy(aBlock);
            -[PHAssetResourceRequestOptions setProgressHandler:](v24, "setProgressHandler:", v25);
            v25[2](v25, 0.0);
            v62 = 0;
            v63 = &v62;
            v64 = 0x2020000000;
            v65 = 0;
            +[PHAssetResourceManager defaultManager](PHAssetResourceManager, "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_3;
            v52[3] = &unk_1E35D7FC8;
            v57 = v87;
            objc_copyWeak(&v61, &location);
            v58 = &v62;
            v52[4] = v21;
            v53 = v43;
            v59 = &v71;
            v60 = v85;
            v27 = v25;
            v56 = v27;
            v54 = v17;
            v55 = v42;
            LODWORD(v25) = objc_msgSend(v26, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v21, v45, &__block_literal_global_200, v52);

            *((_DWORD *)v63 + 6) = (_DWORD)v25;
            PLPhotoKitGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = (PHResourceLocalAvailabilityRequest *)objc_loadWeakRetained(&location);
              v30 = v17;
              v31 = *((_DWORD *)v63 + 6);
              objc_msgSend(v21, "originalFilename");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v90 = v29;
              v91 = 1026;
              *(_DWORD *)v92 = v31;
              *(_WORD *)&v92[4] = 2114;
              *(_QWORD *)&v92[6] = v32;
              *(_WORD *)&v92[14] = 2114;
              *(_QWORD *)&v92[16] = v43;
              _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_INFO, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Requesting asset resource: %{public}@ for asset %{public}@", buf, 0x26u);

              v17 = v30;
            }

            if (!*((_BYTE *)v72 + 24))
            {
              -[PHResourceLocalAvailabilityRequest _activeAssetResourcesRequest](v39, "_activeAssetResourcesRequest");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v63 + 6));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v34);

            }
            _Block_object_dispose(&v62, 8);

            objc_destroyWeak(&v61);
            objc_destroyWeak(&v69);
            _Block_object_dispose(&v71, 8);

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      }
      while (v19);
    }

    if (v38)
    {
      objc_msgSend(v42, "resultHandlerQueue");
      v35 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_202;
      block[3] = &unk_1E35D80B0;
      v48 = v38;
      v49 = v87;
      v50 = v85;
      v51 = v36;
      dispatch_group_notify(v17, v35, block);

    }
  }
  else if (v38)
  {
    (*((void (**)(id, _QWORD, uint64_t, _QWORD, _QWORD))v38 + 2))(v38, *((unsigned __int8 *)v81 + 24), v10, MEMORY[0x1E0C9AA70], 0);
  }

  _Block_object_dispose(&v80, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v85, 8);

  _Block_object_dispose(v87, 8);
}

- (void)_handleCompletionOfAssetResourceDataRequestWithId:(int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  PHResourceLocalAvailabilityRequest *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218498;
      v10 = self;
      v11 = 1024;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Failure in asset resource data request with identifier: %i, error: %@", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else
  {
    -[PHResourceLocalAvailabilityRequest _activeAssetResourcesRequest](self, "_activeAssetResourcesRequest");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v7, "removeObject:", v8);

  }
}

- (void)_simulateFetchResourcesWithDuration:(double)a3 success:(BOOL)a4 networkAccessAllowed:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  _QWORD v17[5];
  NSObject *v18;
  id v19;
  double v20;
  BOOL v21;
  _QWORD block[4];
  NSObject *v23;

  v12 = a6;
  v13 = a7;
  if (a5)
  {
    dispatch_get_global_queue(-2, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_2;
    v17[3] = &unk_1E35D8100;
    v20 = a3;
    v17[4] = self;
    v18 = v12;
    v19 = v13;
    v21 = a4;
    dispatch_async(v14, v17);

    v15 = v18;
  }
  else
  {
    v16 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke;
    block[3] = &unk_1E35DF948;
    v23 = v13;
    dispatch_after(v16, v12, block);
    v15 = v23;
  }

}

- (void)_didFinishDownloadWithSuccess:(BOOL)a3 resourceInfo:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**downloadCompletionHandler)(id, _BOOL8, BOOL, id, id);
  id v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  if (v6)
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
  downloadCompletionHandler = (void (**)(id, _BOOL8, BOOL, id, id))self->_downloadCompletionHandler;
  if (downloadCompletionHandler)
  {
    downloadCompletionHandler[2](downloadCompletionHandler, v6, -[PHResourceLocalAvailabilityRequest _isDownloadCancelled](self, "_isDownloadCancelled"), v11, v8);
    v10 = self->_downloadCompletionHandler;
  }
  else
  {
    v10 = 0;
  }
  self->_downloadCompletionHandler = 0;

}

- (void)_cancelActiveAssetResourceRequests
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);
  _QWORD aBlock[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke;
  aBlock[3] = &unk_1E35DE1F8;
  objc_copyWeak(&v7, &location);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3[2](v3);
  }
  else
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke_2;
    block[3] = &unk_1E35DF948;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)cancelRetrievalRequest
{
  NSObject *v3;
  int v4;
  PHResourceLocalAvailabilityRequest *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[PHResourceLocalAvailabilityRequest _setDownloadCancelled:](self, "_setDownloadCancelled:", 1);
  -[PHResourceLocalAvailabilityRequest _cancelActiveAssetResourceRequests](self, "_cancelActiveAssetResourceRequests");
  PLPhotoKitGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Download request cancelled", (uint8_t *)&v4, 0xCu);
  }

  -[PHResourceLocalAvailabilityRequest _didFinishDownloadWithSuccess:resourceInfo:error:](self, "_didFinishDownloadWithSuccess:resourceInfo:error:", 0, MEMORY[0x1E0C9AA70], 0);
}

- (void)_updateCombinedProgressWithValue:(double)a3 forRequestIdentifier:(id)a4 networkAccessAllowed:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  double v12;

  v5 = a5;
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke;
    block[3] = &unk_1E35DE118;
    block[4] = self;
    v12 = a3;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_setProgressFraction:(double)a3
{
  NSObject *v5;
  int v6;
  PHResourceLocalAvailabilityRequest *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_progressFraction != a3)
  {
    self->_progressFraction = a3;
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", vcvtmd_s64_f64((double)-[NSProgress totalUnitCount](self->_progress, "totalUnitCount") * a3));
    if (self->_progressChangeHandler)
    {
      PLPhotoKitGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134218240;
        v7 = self;
        v8 = 2048;
        v9 = a3;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Updating progress: %f", (uint8_t *)&v6, 0x16u);
      }

      (*((void (**)(void))self->_progressChangeHandler + 2))();
    }
  }
}

- (int64_t)resourceAvailabilityForOptions:(id)a3 resourceInfo:(id *)a4
{
  id v7;
  PHResourceLocalAvailabilityRequestOptions *v8;
  PHResourceLocalAvailabilityRequestOptions *v9;
  id v10;
  int64_t v11;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v7 = a3;
  if ((unint64_t)(self->_requestType - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1772, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_requestType == PHResourceRequestTypeForSharing || _requestType == PHResourceRequestTypeForDuplicating"));

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10890;
  v28 = __Block_byref_object_dispose__10891;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (v7)
    v8 = (PHResourceLocalAvailabilityRequestOptions *)v7;
  else
    v8 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  v9 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__PHResourceLocalAvailabilityRequest_resourceAvailabilityForOptions_resourceInfo___block_invoke;
  v15[3] = &unk_1E35D81F8;
  v17 = &v20;
  v18 = &v24;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  v19 = &v30;
  -[PHResourceLocalAvailabilityRequest _fetchResourcesWithOptions:networkAccessAllowed:handler:](self, "_fetchResourcesWithOptions:networkAccessAllowed:handler:", v9, 0, v15);
  if (!*((_BYTE *)v21 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1795, CFSTR("The completion handler for -[PHResourceLocalAvailabilityRequest _fetchResourcesForSharingAsset:networkAccessAllowed:handler:] was not called back synchronously!"));

    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease((id)v25[5]);
LABEL_9:
  v11 = v31[3];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (double)progressFraction
{
  return self->_progressFraction;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (id)progressChangeHandler
{
  return self->_progressChangeHandler;
}

- (void)setProgressChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_isDownloadCancelled
{
  return self->__downloadCancelled;
}

- (void)_setDownloadCancelled:(BOOL)a3
{
  self->__downloadCancelled = a3;
}

- (NSArray)_assetResources
{
  return self->__assetResources;
}

- (void)_setAssetResources:(id)a3
{
  objc_storeStrong((id *)&self->__assetResources, a3);
}

- (NSMutableArray)_activeAssetResourcesRequest
{
  return self->__activeAssetResourcesRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAssetResourcesRequest, 0);
  objc_storeStrong((id *)&self->__assetResources, 0);
  objc_storeStrong(&self->_progressChangeHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_progressByRequestIdentifier, 0);
}

void __82__PHResourceLocalAvailabilityRequest_resourceAvailabilityForOptions_resourceInfo___block_invoke(_QWORD *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  if (a2)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  if (v11)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[5];
      v14 = *(_QWORD *)(a1[4] + 32);
      v15 = 138412802;
      v16 = v14;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Failed to determine if downloading is required for asset: %@, options: %@, error: %@", (uint8_t *)&v15, 0x20u);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;

}

void __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke_2;
  v11[3] = &unk_1E35D8128;
  v11[4] = &v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v13[3];
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v13[3] = v8 / (double)v9;
  objc_msgSend(*(id *)(a1 + 32), "progressFraction");
  if (v10 < v13[3])
    v10 = v13[3];
  objc_msgSend(*(id *)(a1 + 32), "_setProgressFraction:", v10);
  _Block_object_dispose(&v12, 8);
}

double __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  float v4;
  uint64_t v5;
  double result;

  objc_msgSend(a3, "floatValue");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v5 + 24) + v4;
  *(double *)(v5 + 24) = result;
  return result;
}

void __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "_activeAssetResourcesRequest", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(WeakRetained, "_activeAssetResourcesRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObject:", v8);

        +[PHAssetResourceManager defaultManager](PHAssetResourceManager, "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelDataRequest:", objc_msgSend(v8, "intValue"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

uint64_t __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 1, MEMORY[0x1E0C9AA70], 0);
  return result;
}

void __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  _QWORD block[6];

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = MEMORY[0x1E0C80D38];
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = (v6 - v3) / *(double *)(a1 + 56);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_3;
    block[3] = &unk_1E35DE140;
    v8 = v7 <= 1.0 ? v7 : 1.0;
    block[4] = *(_QWORD *)(a1 + 32);
    *(double *)&block[5] = v8;
    dispatch_async(v5, block);
    if (v8 >= 1.0)
      break;
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.5);
  }
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_4;
  v10[3] = &unk_1E35D80D8;
  v9 = *(NSObject **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 64);
  dispatch_async(v9, v10);

}

uint64_t __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setProgressFraction:", *(double *)(a1 + 40));
}

void __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, 1, 0, MEMORY[0x1E0C9AA70], 0);
    }
    else
    {
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v4 = *MEMORY[0x1E0CB2D50];
      v12[0] = *MEMORY[0x1E0CB2D68];
      v12[1] = v4;
      v13[0] = CFSTR("Simulated Download Failure");
      v13[1] = CFSTR("Simulated Download Failure in PHResourceLocalAvailabilityRequest");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PHResourceLocalAvailabilityRequestErrorDomain"), -1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB3388];
      v11 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PHResourceLocalAvailabilityRequestErrorDomain"), 3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = AssetResourceIsReallyLocallyAvailable(a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_199(uint64_t a1, double a2)
{
  double v3;
  double v4;
  id WeakRetained;

  v3 = 0.99;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v3 = 1.0;
  if (v3 <= a2)
    a2 = v3;
  v4 = fmax(a2, 0.0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateCombinedProgressWithValue:forRequestIdentifier:networkAccessAllowed:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v4);

}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD block[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3 == 0;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_4;
  aBlock[3] = &unk_1E35D7FA0;
  objc_copyWeak(&v22, (id *)(a1 + 104));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 80);
  aBlock[4] = v5;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 72);
  v15 = v7;
  v20 = v8;
  v9 = v3;
  v16 = v9;
  v21 = *(_OWORD *)(a1 + 88);
  v18 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v10[2](v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "resultHandlerQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_201;
    block[3] = &unk_1E35DF948;
    v13 = v10;
    dispatch_async(v11, block);

  }
  objc_destroyWeak(&v22);

}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_202(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), a1[7], MEMORY[0x1E0C9AA70], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "originalFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = *(_QWORD *)(a1 + 48);
    v12 = 134219266;
    v13 = WeakRetained;
    v14 = 1026;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_INFO, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Finished request for asset resource: %{public}@ for asset %{public}@. Success: %{public}@. Error: %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  v10 = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(v10, "_handleCompletionOfAssetResourceDataRequestWithId:error:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 48));

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = AssetResourceIsReallyLocallyAvailable(a3);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  PHAssetResourceRequestOptions *v15;
  uint64_t v16;
  void (**v17)(_QWORD, double);
  void *v18;
  id v19;
  void (**v20)(_QWORD, double);
  NSObject *v21;
  id v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  _QWORD aBlock[4];
  id v46;
  uint64_t *v47;
  id v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  _BYTE v57[24];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isLocallyAvailable"))
  {
    objc_msgSend(v5, "privateFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "privateFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0);

      if ((v8 & 1) != 0)
      {
        objc_msgSend(v5, "privateFileLoader");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_14;
      }
      else
      {
        PLPhotoKitGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          objc_msgSend(v5, "originalFilename");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v55 = WeakRetained;
          v56 = 2114;
          *(_QWORD *)v57 = v12;
          *(_WORD *)&v57[8] = 2114;
          *(_QWORD *)&v57[10] = v13;
          _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset resource %{public}@ for asset %{public}@ marked locally available, but doesn't exist in file system. Possibly purged due to CacheDelete. Requesting download.", buf, 0x20u);

        }
      }
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssetResourceRequest-Type%@"), v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v15, "setNetworkAccessAllowed:", *(unsigned __int8 *)(a1 + 88));
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_183;
  aBlock[3] = &unk_1E35D7F38;
  v47 = &v50;
  objc_copyWeak(&v48, (id *)(a1 + 80));
  v28 = v14;
  v46 = v28;
  v49 = *(_BYTE *)(a1 + 88);
  v17 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  -[PHAssetResourceRequestOptions setProgressHandler:](v15, "setProgressHandler:", v17);
  v17[2](v17, 0.0);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  +[PHAssetResourceManager defaultManager](PHAssetResourceManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_3;
  v30[3] = &unk_1E35D7FC8;
  v36 = *(_QWORD *)(a1 + 64);
  objc_copyWeak(&v40, (id *)(a1 + 80));
  v37 = &v41;
  v19 = v5;
  v31 = v19;
  v32 = *(id *)(a1 + 32);
  v38 = &v50;
  v39 = *(_QWORD *)(a1 + 72);
  v20 = v17;
  v35 = v20;
  v33 = *(id *)(a1 + 40);
  v34 = *(id *)(a1 + 48);
  LODWORD(v17) = objc_msgSend(v18, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v19, v15, &__block_literal_global_10931, v30);

  *((_DWORD *)v42 + 6) = (_DWORD)v17;
  PLPhotoKitGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_loadWeakRetained((id *)(a1 + 80));
    v23 = *((_DWORD *)v42 + 6);
    objc_msgSend(v19, "originalFilename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v55 = v22;
    v56 = 1026;
    *(_DWORD *)v57 = v23;
    *(_WORD *)&v57[4] = 2114;
    *(_QWORD *)&v57[6] = v24;
    *(_WORD *)&v57[14] = 2114;
    *(_QWORD *)&v57[16] = v25;
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Requesting asset resource: %{public}@ for asset %{public}@", buf, 0x26u);

  }
  if (!*((_BYTE *)v51 + 24))
  {
    objc_msgSend(*(id *)(a1 + 56), "_activeAssetResourcesRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v42 + 6));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

  }
  _Block_object_dispose(&v41, 8);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v48);
  _Block_object_dispose(&v50, 8);

LABEL_14:
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_194(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  id v15;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v2 = _AssetVersionFromRequestOptions(*(void **)(a1 + 32));
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(id *)(v6 + 40);
    objc_msgSend(v3, "_resourceInfoForAsset:resourcesToShare:assetVersion:fulfillOnDemandResources:error:", v4, v5, v2, 0, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), v15);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "resultHandlerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_2_195;
  block[3] = &unk_1E35D8018;
  v14 = *(_OWORD *)(a1 + 80);
  v9 = *(id *)(a1 + 64);
  v12 = v7;
  v13 = v9;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_2_195(_QWORD *a1)
{
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[5] + 16))(a1[5], a1[4] != 0, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_183(uint64_t a1, double a2)
{
  double v3;
  double v4;
  id WeakRetained;

  v3 = 0.99;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v3 = 1.0;
  if (v3 <= a2)
    a2 = v3;
  v4 = fmax(a2, 0.0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateCombinedProgressWithValue:forRequestIdentifier:networkAccessAllowed:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v4);

}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  _QWORD block[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3 == 0;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_4;
  aBlock[3] = &unk_1E35D7FA0;
  objc_copyWeak(&v21, (id *)(a1 + 104));
  v18 = *(_QWORD *)(a1 + 80);
  v13 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v14 = v5;
  v19 = v6;
  v7 = v3;
  v15 = v7;
  v20 = *(_OWORD *)(a1 + 88);
  v17 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v8[2](v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "resultHandlerQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_191;
    block[3] = &unk_1E35DF948;
    v11 = v8;
    dispatch_async(v9, block);

  }
  objc_destroyWeak(&v21);

}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "originalFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = *(_QWORD *)(a1 + 48);
    v12 = 134219266;
    v13 = WeakRetained;
    v14 = 1026;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Finished request for asset resource: %{public}@ for asset %{public}@. Success: %{public}@. Error: %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  v10 = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(v10, "_handleCompletionOfAssetResourceDataRequestWithId:error:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 48));

  v11 = *(void **)(a1 + 48);
  if (v11)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v11);
  else
    (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(1.0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, double a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  int v12;

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCombinedProgressWithValue:forRequestIdentifier:networkAccessAllowed:", CFSTR("ImageCurrentVersion"), *(unsigned __int8 *)(a1 + 40), a2);

  v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (v10 = v9,
        v11 = objc_loadWeakRetained(v7),
        v12 = objc_msgSend(v11, "_isDownloadCancelled"),
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_163(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id WeakRetained;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[12];
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHImageFileURLKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = 4;
      else
        v7 = 3;
      _PHResourceLocalAvailabilityRequestError(v7, v6, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (*(_BYTE *)(a1 + 80))
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v15 = CFSTR("Y");
      else
        v15 = CFSTR("N");
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                               + 8)
                                                                                   + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 134218754;
      *(_QWORD *)&v20[4] = WeakRetained;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current image finished with success: %@, error: %@, availability: %@", v20, 0x2Au);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v20[0] = 0;
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"), *(_QWORD *)v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _BYTE *, id, double))(v18 + 16))(v18, v19, v20, v4, 1.0);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_170(uint64_t a1, double a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  int v12;

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCombinedProgressWithValue:forRequestIdentifier:networkAccessAllowed:", CFSTR("VideoCurrentVersion"), *(unsigned __int8 *)(a1 + 40), a2);

  v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (v10 = v9,
        v11 = objc_loadWeakRetained(v7),
        v12 = objc_msgSend(v11, "_isDownloadCancelled"),
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_173(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id WeakRetained;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[12];
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 4;
      else
        v12 = 3;
      _PHResourceLocalAvailabilityRequestError(v12, v11, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (*(_BYTE *)(a1 + 80))
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v20 = CFSTR("Y");
      else
        v20 = CFSTR("N");
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                               + 8)
                                                                                   + 24));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 134218754;
      *(_QWORD *)&v25[4] = WeakRetained;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current video finished with success: %@, error: %@, availability: %@", v25, 0x2Au);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v25[0] = 0;
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"), *(_QWORD *)v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _BYTE *, void *, double))(v23 + 16))(v23, v24, v25, v10, 1.0);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_175(uint64_t a1, double a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  int v12;

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCombinedProgressWithValue:forRequestIdentifier:networkAccessAllowed:", CFSTR("VideoCurrentVersion"), *(unsigned __int8 *)(a1 + 40), a2);

  v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (v10 = v9,
        v11 = objc_loadWeakRetained(v7),
        v12 = objc_msgSend(v11, "_isDownloadCancelled"),
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_176(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id WeakRetained;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[12];
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 4;
      else
        v12 = 3;
      _PHResourceLocalAvailabilityRequestError(v12, v11, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (*(_BYTE *)(a1 + 80))
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v20 = CFSTR("Y");
      else
        v20 = CFSTR("N");
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                               + 8)
                                                                                   + 24));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 134218754;
      *(_QWORD *)&v25[4] = WeakRetained;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current video finished with success: %@, error: %@, availability: %@", v25, 0x2Au);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v25[0] = 0;
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"), *(_QWORD *)v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _BYTE *, void *, double))(v23 + 16))(v23, v24, v25, v10, 1.0);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_177(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), MEMORY[0x1E0C9AA70], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_didFinishDownloadWithSuccess:resourceInfo:error:", a2, v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resultHandlerQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke_2;
    v12[3] = &unk_1E35D7E18;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    v16 = a2;
    v13 = v8;
    v14 = v9;
    dispatch_async(v11, v12);

    objc_destroyWeak(&v15);
  }

}

void __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didFinishDownloadWithSuccess:resourceInfo:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __93__PHResourceLocalAvailabilityRequest_fetchResourceAvailabilityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[4];
  id v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "cancelRetrievalRequest");

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke_2;
    block[3] = &unk_1E35DE1F8;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v4);
  }
}

void __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelRetrievalRequest");

}

+ (id)fetchResourcesToShareForAsset:(id)a3 requestOptions:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestOptions"));

LABEL_3:
  if ((unint64_t)(objc_msgSend(v9, "mediaType") - 1) >= 2)
  {
    PLPhotoKitGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Cannot fetch resources to share for invalid asset: %@", buf, 0xCu);
    }

    if (a5)
    {
      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v20 = 0;
    objc_msgSend((id)objc_opt_class(), "_resourcesToShareForAsset:options:error:", v9, v11, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    v14 = v13;
    if (a5 && v13)
      *a5 = objc_retainAutorelease(v13);
    objc_msgSend(v12, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (id)_resourcesToShareForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  PHResourceLocalAvailabilityRequestOptions *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  -[PHResourceLocalAvailabilityRequestOptions setAllowMissingVideoComplement:](v9, "setAllowMissingVideoComplement:", 1);
  if (v6)
    -[PHResourceLocalAvailabilityRequestOptions setIncludeOriginalResourcesOnly:](v9, "setIncludeOriginalResourcesOnly:", 1);
  objc_msgSend(a1, "_resourcesToShareForAsset:options:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_resourcesToShareForAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  int v34;
  void *v35;
  void *v36;
  id *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  BOOL v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  id v57;
  os_signpost_id_t spid;
  unsigned int v60;
  unint64_t v61;
  NSObject *v62;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE buf[48];
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "resourceLocalAvailabilityRequestLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  spid = v10;
  v61 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = v12;
    objc_msgSend(v7, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ResourcesToShareLookup", "localIdentifier==%{public}@", buf, 0xCu);

    v12 = v13;
  }
  v62 = v12;

  if (objc_msgSend(a1, "isKnownUnsupportedFormatForAsset:", v7)
    && !objc_msgSend(v8, "includeOriginalResourcesOnly"))
  {
    v15 = 1;
    v60 = 1;
  }
  else
  {
    v15 = objc_msgSend(v7, "isCloudSharedAsset");
    v60 = 0;
    if (!objc_msgSend(v7, "hasAdjustments"))
    {
      v16 = 1;
      goto LABEL_10;
    }
  }
  v16 = objc_msgSend(v8, "includeOriginalResourcesOnly");
LABEL_10:
  if ((objc_msgSend(v7, "isRAW") & 1) != 0)
  {
    v17 = 1;
    if (!(_DWORD)v16)
      goto LABEL_17;
  }
  else
  {
    v17 = objc_msgSend(v7, "isProRes");
    if (!(_DWORD)v16)
      goto LABEL_17;
  }
  if ((objc_msgSend(v8, "dontAllowRAW") & v17) == 1)
  {
    v16 = objc_msgSend(v8, "includeOriginalResourcesOnly");
    v15 = v16 ^ 1 | v15;
  }
  else
  {
    v16 = 1;
  }
LABEL_17:
  PLPhotoKitGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "hasAdjustments");
    v21 = objc_msgSend(v8, "dontAllowRAW");
    v22 = objc_msgSend(v8, "includeOriginalResourcesOnly");
    *(_DWORD *)buf = 134219778;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    *(_WORD *)&buf[18] = 2114;
    *(_QWORD *)&buf[20] = v19;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v20;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v60;
    *(_WORD *)&buf[40] = 1024;
    *(_DWORD *)&buf[42] = v17;
    *(_WORD *)&buf[46] = 1024;
    LODWORD(v73) = v21;
    WORD2(v73) = 1024;
    *(_DWORD *)((char *)&v73 + 6) = v22;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Using original/primary resource(s): %{BOOL}d for asset %{public}@ because it is edited: %{BOOL}d, known unsupported: %{BOOL}d, isRAW: %{BOOL}d, dontAllowRAW: %{BOOL}d, should use unmodified original: %{BOOL}d", buf, 0x3Au);

  }
  _FetchableResourcesForAsset(v7, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7;
  v25 = v23;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__10890;
  v70 = __Block_byref_object_dispose__10891;
  v71 = 0;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CollectAssetResourcesByCplResourceType_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E35D8270;
  v27 = v24;
  *(_QWORD *)&buf[32] = v27;
  v28 = v26;
  *(_QWORD *)&buf[40] = v28;
  v29 = v25;
  *(_QWORD *)&v73 = v29;
  *((_QWORD *)&v73 + 1) = &v66;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", buf);
  if (v67[5])
  {

    v30 = objc_retainAutorelease((id)v67[5]);
    v28 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = (void *)v73;
  v32 = v28;

  _Block_object_dispose(&v66, 8);
  v33 = v30;
  if (!objc_msgSend(v32, "count"))
  {
    PLPhotoKitGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v8;
      *(_WORD *)&buf[32] = 2112;
      *(_QWORD *)&buf[34] = v33;
      _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest:%p] No candidate resources found for sharing asset: %@, options: %@, error: %@", buf, 0x2Au);
    }
    v36 = 0;
    goto LABEL_43;
  }
  v34 = objc_msgSend(v8, "includeAllAssetResources");
  v35 = (void *)objc_opt_class();
  if (v34)
  {
    v65 = v33;
    objc_msgSend(v35, "_originalsAndFullSizeResourcesToShareForAsset:fromAvailableResources:options:error:", v27, v32, v8, &v65);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = &v65;
  }
  else
  {
    v64 = v33;
    objc_msgSend(v35, "_singularResourcesToShareForAsset:fromAvailableResources:options:useOriginalResources:knownUnsupported:error:", v27, v32, v8, v16, v60, &v64);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = &v64;
  }
  v39 = *v37;

  if (objc_msgSend(v36, "count"))
  {
    v33 = v39;
  }
  else
  {
    PLPhotoKitGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v8;
      _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest:%p] Found no photo or video resources to share for asset: %@, options: %@", buf, 0x20u);
    }

    _PHResourceLocalAvailabilityRequestError(0, v39, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E3655288);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (!v42)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E3655288);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v43, &unk_1E3655288);

  }
  objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552A0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (!v45)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552A0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, &unk_1E36552A0);

  }
  if (v34)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552B8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47 == 0;

    if (!v48)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552B8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v49, &unk_1E36552B8);

    }
    objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552D0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (!v51)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E36552D0);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, &unk_1E36552D0);
LABEL_43:

    }
  }
  v52 = v62;
  if (a5 && v33)
  {
    v53 = objc_retainAutorelease(v33);
    v52 = v62;
    *a5 = v53;
  }
  v54 = v52;
  v55 = v54;
  if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v55, OS_SIGNPOST_INTERVAL_END, spid, "ResourcesToShareLookup", ", buf, 2u);
  }

  if (v33)
    v56 = 0;
  else
    v56 = v36;
  v57 = v56;

  return v57;
}

+ (BOOL)isKnownUnsupportedFormatForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  BOOL v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[10];

  v56[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v41 = v3;
    v42 = v4;
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v6;
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v7;
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v8;
    v56[3] = CFSTR("com.adobe.raw-image");
    objc_msgSend((id)*MEMORY[0x1E0CEC4F8], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v9;
    objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v10;
    objc_msgSend((id)*MEMORY[0x1E0CEC510], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v11;
    objc_msgSend((id)*MEMORY[0x1E0CEC558], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CEC5B8];
    v55[0] = *MEMORY[0x1E0CEC698];
    v55[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0D752F0], "supportedMovieTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    objc_msgSend(v17, "removeObject:", *MEMORY[0x1E0CEC5B0]);
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D71650], "H264fourCharCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v20;
    objc_msgSend(MEMORY[0x1E0D71650], "HEVCfourCharCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (isKnownUnsupportedFormatForAsset__onceToken != -1)
      dispatch_once(&isKnownUnsupportedFormatForAsset__onceToken, &__block_literal_global_223);
    v4 = v42;
    objc_msgSend(v14, "member:", v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v41;
    if (v24)
    {
      v25 = 0;
LABEL_6:
      v26 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v30 = v17;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          if ((objc_msgSend(v29, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i)) & 1) != 0)
          {

            v25 = 0;
            v26 = 0;
            v4 = v42;
            goto LABEL_29;
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v32)
          continue;
        break;
      }
    }

    if (objc_msgSend(v41, "playbackStyle") == 4)
    {
      objc_msgSend(v41, "fetchPropertySetsIfNeeded");
      objc_msgSend(v41, "photosInfoPanelExtendedProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "codec");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v42;
      if (v25)
      {
        objc_msgSend(v23, "member:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          goto LABEL_6;
        objc_msgSend((id)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs, "member:", v25);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          goto LABEL_6;
        if (objc_msgSend(MEMORY[0x1E0D71650], "isPlayableFourCharCodecName:", v25))
        {
          objc_msgSend((id)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs, "addObject:", v25);
          goto LABEL_6;
        }
      }
    }
    else
    {
      v25 = 0;
      v4 = v42;
    }
    PLPhotoKitGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v41, "uuid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v39;
      v49 = 2114;
      v50 = v4;
      v51 = 2114;
      v52 = v25;
      _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Slower \"known unsupported formats\" lookup for asset: %{public}@. Type identifier: %{public}@, codec (if video): %{public}@", buf, 0x20u);

    }
    v26 = +[PHAsset isOriginalKnownUnsupportedFormatForAsset:failureInfo:](PHAsset, "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", v41, 0);
    goto LABEL_29;
  }
  PLPhotoKitGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v4;
    v49 = 2114;
    v50 = v28;
    _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Unexpected empty uniformTypeIdentifier (%{public}@) on asset: %{public}@. Falling back to \"known unsupported formats\" lookup", buf, 0x16u);

  }
  v26 = +[PHAsset isOriginalKnownUnsupportedFormatForAsset:failureInfo:](PHAsset, "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", v3, 0);
LABEL_30:

  return v26;
}

+ (id)resourceLocalAvailabilityRequestLog
{
  if (resourceLocalAvailabilityRequestLog_onceToken != -1)
    dispatch_once(&resourceLocalAvailabilityRequestLog_onceToken, &__block_literal_global_226);
  return (id)resourceLocalAvailabilityRequestLog_log;
}

+ (BOOL)setValuesInDictionary:(id)a3 fromDictionary:(id)a4 keysToCopy:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v15);

          v12 = 1;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12 & 1;
}

+ (id)_originalsAndFullSizeResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  id v18;
  void *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "mediaType");
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      if ((objc_msgSend((id)objc_opt_class(), "setValuesInDictionary:fromDictionary:keysToCopy:", v14, v12, &unk_1E36571E0) & 1) == 0)
      {
        PLPhotoKitGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v21 = 138412802;
          v22 = v11;
          v23 = 2112;
          v24 = v12;
          v25 = 2112;
          v26 = v13;
          v17 = "[PHResourceLocalAvailabilityRequest] Found no photo or video complement resources to share for asset: %@"
                ", resources: %@, options: %@";
LABEL_9:
          _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x20u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1171, CFSTR("Code which should be unreachable has been reached"));

    }
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend((id)objc_opt_class(), "setValuesInDictionary:fromDictionary:keysToCopy:", v14, v12, &unk_1E36571F8) & 1) != 0)
    goto LABEL_14;
  PLPhotoKitGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v21 = 138412802;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v17 = "[PHResourceLocalAvailabilityRequest] Found no video resource to share for asset: %@, resources: %@, options: %@";
    goto LABEL_9;
  }
LABEL_10:

  _PHResourceLocalAvailabilityRequestError(0, 0, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (a6 && v18)
  {
    v18 = objc_retainAutorelease(v18);
    *a6 = v18;
  }
LABEL_15:

  return v14;
}

+ (id)_singularResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 useOriginalResources:(BOOL)a6 knownUnsupported:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  uint64_t v26;
  int v27;
  int v28;
  _QWORD *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  _QWORD *v61;
  _BOOL4 v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  _BYTE v70[10];
  _BOOL4 v71;
  __int16 v72;
  _BOOL4 v73;
  uint64_t v74;

  v62 = a7;
  v8 = a6;
  v74 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "includeOriginalResourcesOnly");
  v18 = objc_msgSend(v15, "dontAllowRAW");
  v19 = objc_msgSend(v15, "treatLivePhotoAsStill");
  if (v17)
  {
    v18 = 0;
    v20 = 0;
    v62 = 0;
    v8 = 1;
  }
  else
  {
    v20 = v19;
  }
  switch(objc_msgSend(v13, "mediaType", a8))
  {
    case 0:
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1292, CFSTR("Code which should be unreachable has been reached"));

      goto LABEL_6;
    case 1:
      v25 = objc_msgSend(v13, "canPlayLoopingVideo");
      v26 = objc_msgSend(v13, "playbackStyle");
      v27 = v8 & v17 & objc_msgSend(v13, "isMediaSubtype:", 8) ^ 1;
      if (v26 == 3)
        v28 = 1;
      else
        v28 = v27;
      if (v28 == 1 && (v25 & 1) != 0)
      {
        v22 = 0;
        v23 = 0;
        v24 = v16;
        v29 = v61;
        goto LABEL_47;
      }
      if (v8)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36552E8);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v22 = (void *)v33;
          v34 = &unk_1E36552E8;
LABEL_42:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v34);
          v23 = 0;
          goto LABEL_43;
        }
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655318);
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v22 = (void *)v36;
        v34 = &unk_1E3655318;
        goto LABEL_42;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36553F0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v22 = (void *)v38;
        v34 = &unk_1E36553F0;
        goto LABEL_42;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655408);
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v22 = (void *)v40;
        v34 = &unk_1E3655408;
        goto LABEL_42;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655420);
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v22 = (void *)v42;
        v34 = &unk_1E3655420;
        goto LABEL_42;
      }
      if (v8 || (objc_msgSend(v13, "isRAW") & v18) != 1)
      {
        PLPhotoKitGetLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413314;
          v64 = v13;
          v65 = 2112;
          v66 = v14;
          v67 = 2112;
          v68 = v15;
          v69 = 1024;
          *(_DWORD *)v70 = v8;
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)&v70[6] = v62;
          _os_log_impl(&dword_1991EC000, v58, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no photo resource to share for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
        }

        _PHResourceLocalAvailabilityRequestError(0, 0, 0);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36552E8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v56, &unk_1E36552E8);

        v23 = 0;
      }
      v22 = 0;
LABEL_43:
      if (v26 == 3)
        v43 = 0;
      else
        v43 = v27;
      v44 = v43 | v20;
      v24 = v16;
      v29 = v61;
      if ((v44 & 1) != 0)
        goto LABEL_61;
LABEL_47:
      if (v8)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655360);
        v45 = objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v46 = &unk_1E3655360;
LABEL_53:
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v45, v46);
          v22 = (void *)v45;
          goto LABEL_61;
        }
        v22 = 0;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655378);
      v45 = objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = &unk_1E3655378;
        goto LABEL_53;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655438);
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v22 = (void *)v47;
        v48 = &unk_1E3655438;
LABEL_60:
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, v48);
        goto LABEL_61;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655450);
      v49 = objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v22 = (void *)v49;
        v48 = &unk_1E3655450;
        goto LABEL_60;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655468);
      v50 = objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        v22 = (void *)v50;
        v48 = &unk_1E3655468;
        goto LABEL_60;
      }
      PLPhotoKitGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "uuid");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v64 = v55;
        v65 = 2112;
        v66 = v13;
        v67 = 2112;
        v68 = v14;
        v69 = 2112;
        *(_QWORD *)v70 = v15;
        *(_WORD *)&v70[8] = 1024;
        v71 = v8;
        v72 = 1024;
        v73 = v62;
        _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no video complement resource to share for asset (uuid: %{public}@): %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x36u);

      }
      if ((objc_msgSend(v15, "allowMissingVideoComplement") & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        _PHResourceLocalAvailabilityRequestError(0, 0, 0);
        v57 = objc_claimAutoreleasedReturnValue();

        v22 = 0;
        v23 = (id)v57;
      }
      goto LABEL_61;
    case 2:
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36553C0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36552E8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        v31 = v62;
      else
        v31 = 1;
      if ((v31 & 1) == 0
        && (((v8 | objc_msgSend(v13, "hasAdjustments") ^ 1) & 1) != 0
         || objc_msgSend(v13, "isHighFrameRateVideo") && !v22))
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36552E8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, &unk_1E36552E8);

LABEL_39:
        v23 = 0;
        goto LABEL_64;
      }
      v24 = v16;
      if (v22)
      {
        v32 = &unk_1E36553C0;
LABEL_38:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v32);
        goto LABEL_39;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655438);
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v22 = (void *)v37;
        v32 = &unk_1E3655438;
        goto LABEL_38;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655450);
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v22 = (void *)v39;
        v32 = &unk_1E3655450;
        goto LABEL_38;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E3655468);
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v22 = (void *)v41;
        v32 = &unk_1E3655468;
        goto LABEL_38;
      }
      if (((v8 | objc_msgSend(v13, "hasAdjustments") ^ 1) & 1) != 0
        || objc_msgSend(v13, "isHighFrameRateVideo"))
      {
        PLPhotoKitGetLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413314;
          v64 = v13;
          v65 = 2112;
          v66 = v14;
          v67 = 2112;
          v68 = v15;
          v69 = 1024;
          *(_DWORD *)v70 = v8;
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)&v70[6] = v62;
          _os_log_impl(&dword_1991EC000, v52, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Falling back to possible unsupported original resource for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
        }

        objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E36552E8);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, &unk_1E36552E8);

        v22 = 0;
        goto LABEL_39;
      }
      PLPhotoKitGetLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        v64 = v13;
        v65 = 2112;
        v66 = v14;
        v67 = 2112;
        v68 = v15;
        v69 = 1024;
        *(_DWORD *)v70 = 0;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v62;
        _os_log_impl(&dword_1991EC000, v59, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no video resource to share for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
      }

      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v29 = v61;
LABEL_61:
      if (v29 && v23)
      {
        v23 = objc_retainAutorelease(v23);
        *v29 = v23;
      }
LABEL_64:

      return v24;
    default:
LABEL_6:
      v22 = 0;
      v23 = 0;
      v24 = v16;
      goto LABEL_64;
  }
}

+ (id)resourceInfoKeysForResourceTypesForPhotos
{
  if (resourceInfoKeysForResourceTypesForPhotos_onceToken != -1)
    dispatch_once(&resourceInfoKeysForResourceTypesForPhotos_onceToken, &__block_literal_global_250);
  return (id)resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys;
}

+ (id)resourceInfoKeysForResourceTypesForVideos
{
  if (resourceInfoKeysForResourceTypesForVideos_onceToken != -1)
    dispatch_once(&resourceInfoKeysForResourceTypesForVideos_onceToken, &__block_literal_global_251);
  return (id)resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys;
}

+ (id)utiKeysForURLKeys
{
  if (utiKeysForURLKeys_onceToken != -1)
    dispatch_once(&utiKeysForURLKeys_onceToken, &__block_literal_global_252);
  return (id)utiKeysForURLKeys_utiKeysForURLKeys;
}

+ (id)_resourceInfoForAsset:(id)a3 resourcesToShare:(id)a4 assetVersion:(int64_t)a5 fulfillOnDemandResources:(BOOL)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  int64_t v26;
  SEL v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v13 = a3;
  v14 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__10890;
  v34 = __Block_byref_object_dispose__10891;
  v35 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__PHResourceLocalAvailabilityRequest__resourceInfoForAsset_resourcesToShare_assetVersion_fulfillOnDemandResources_error___block_invoke;
  v22[3] = &unk_1E35D81D0;
  v29 = a6;
  v16 = v13;
  v23 = v16;
  v26 = a5;
  v17 = v15;
  v24 = v17;
  v25 = &v30;
  v27 = a2;
  v28 = a1;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);
  v18 = (void *)v31[5];
  if (a7 && v18)
  {
    *a7 = objc_retainAutorelease(v18);
    v18 = (void *)v31[5];
  }
  if (v18)
    v19 = 0;
  else
    v19 = v17;
  v20 = v19;

  _Block_object_dispose(&v30, 8);
  return v20;
}

+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4
{
  return (id)objc_msgSend(a1, "indexesForAssetsRequiringResourceRetrieval:requestType:options:", a3, a4, 0);
}

+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4 options:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets"));

  }
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1808, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestType == PHResourceRequestTypeForSharing"));

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke;
  v19[3] = &unk_1E35D8248;
  v22 = a1;
  v20 = v10;
  v12 = v11;
  v21 = v12;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
  v14 = v21;
  v15 = v12;

  return v15;
}

+ (id)indexesForAssetsWithoutThumbnails:(id)a3 requestType:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets"));

  }
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestType == PHResourceRequestTypeForSharing"));

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PHResourceLocalAvailabilityRequest_indexesForAssetsWithoutThumbnails_requestType___block_invoke;
  v13[3] = &unk_1E35DA078;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  return v9;
}

+ (id)resourceInfoForSharingAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if ((unint64_t)(objc_msgSend(v9, "mediaType") - 1) >= 2)
  {
    PLPhotoKitGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Returning nil for invalid asset: %@", buf, 0xCu);
    }

    if (a5)
    {
      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(a1, "_resourcesToShareForAsset:asUnmodifiedOriginal:error:", v9, v6, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v10);
    v15 = v14;
    if (objc_msgSend(v11, "count"))
    {
      if (v6)
        v16 = 2;
      else
        v16 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = objc_claimAutoreleasedReturnValue();
      v29 = v12;
      objc_msgSend(a1, "_resourceInfoForAsset:resourcesToShare:assetVersion:fulfillOnDemandResources:error:", v9, v11, v16, 1, &v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v29;

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v17);
      v22 = v21;
      PLPhotoKitGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v32 = v15;
        v33 = 2048;
        v34 = v22;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Resources to share duration %.5f, Resource info duration: %.5f", buf, 0x16u);
      }

      v12 = v19;
    }
    else
    {
      PLPhotoKitGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v9;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no resources to share for asset: %@ error: %@", buf, 0x16u);
      }
      v18 = 0;
    }

    if (a5 && v12)
      *a5 = objc_retainAutorelease(v12);
    if (v12)
      v26 = 0;
    else
      v26 = v18;
    v25 = v26;

  }
  return v25;
}

void __84__PHResourceLocalAvailabilityRequest_indexesForAssetsWithoutThumbnails_requestType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((unint64_t)(objc_msgSend(v5, "mediaType") - 1) >= 2)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Skipping invalid asset: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  else if (objc_msgSend(v5, "thumbnailIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

void __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((unint64_t)(objc_msgSend(v5, "mediaType") - 1) >= 2)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Skipping invalid asset: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_resourcesToShareForAsset:options:error:", v5, *(_QWORD *)(a1 + 32), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke_268;
    v8[3] = &unk_1E35D8220;
    v9 = *(id *)(a1 + 40);
    v10 = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke_268(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = AssetResourceIsReallyLocallyAvailable(a3);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "addIndex:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }
  return result;
}

void __121__PHResourceLocalAvailabilityRequest__resourceInfoForAsset_resourcesToShare_assetVersion_fulfillOnDemandResources_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  PHAssetResourceRequestOptions *v13;
  void *v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  uint64_t v27;
  __CFString *v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  __int128 v60;
  void (*v61)(uint64_t, void *);
  void *v62;
  id v63;
  NSObject *v64;
  uint64_t *v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v53 = a2;
  v6 = a3;
  v7 = v6;
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_14;
  v8 = v6;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__10890;
  v58 = __Block_byref_object_dispose__10891;
  v59 = 0;
  objc_msgSend(v8, "privateFileLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v8;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Will fulfill on-demand resource: %@", buf, 0xCu);
    }

    v12 = dispatch_semaphore_create(0);
    v13 = objc_alloc_init(PHAssetResourceRequestOptions);
    -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v13, "setNetworkAccessAllowed:", 0);
    +[PHAssetResourceManager defaultManager](PHAssetResourceManager, "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v60 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v60 + 1) = 3221225472;
    v61 = ___FulfillOnDemandResource_block_invoke_2;
    v62 = &unk_1E35D82B8;
    v15 = v8;
    v63 = v15;
    v65 = &v54;
    v16 = v12;
    v64 = v16;
    objc_msgSend(v14, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v15, v13, &__block_literal_global_477, &v60);

    v17 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out resolving on-demand resource: %@"), v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v18;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@", buf, 0xCu);
      }

      _PHResourceLocalAvailabilityRequestError(1, 0, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v55[5];
      v55[5] = v20;

    }
  }
  v22 = (void *)v55[5];
  if (!v22)
  {
    _Block_object_dispose(&v54, 8);

LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  v23 = objc_retainAutorelease(v22);
  v24 = v55[5] == 0;
  _Block_object_dispose(&v54, 8);

  v25 = v23;
  v26 = v25;
  if (!v24)
  {
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v26 = v25;
    v28 = *(__CFString **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
    goto LABEL_42;
  }
LABEL_15:
  v29 = objc_msgSend(v53, "integerValue");
  v30 = *(_QWORD *)(a1 + 56);
  v31 = *(id *)(a1 + 32);
  v32 = v31;
  if (v29 - 19 >= 4)
  {
    if (v30 != 1)
    {
      v28 = 0;
      if (v29 <= 0x11)
      {
        if (((1 << v29) & 0x235C0) != 0)
        {
          v28 = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
        }
        else if (((1 << v29) & 0x3C) != 0)
        {
          v28 = CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey");
        }
        else if (((1 << v29) & 0x10002) != 0)
        {
          v47 = objc_msgSend(v31, "mediaType");
          v28 = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
          if (v47 != 2)
          {
            if (v47 == 1)
            {
              if (((v30 != 2) & objc_msgSend(v32, "canPlayLoopingVideo")) == 0)
                v28 = CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHResourceLocalAvailabilityRequestResourceInfoKey _DictionaryKeyForResourceType(_PHResourceLocalAvailabilityRequestResourceType, PHAsset *__strong, _PHResourceLocalAvailabilityRequestAssetVersion)");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1661, CFSTR("Code which should be unreachable has been reached"));

              v28 = 0;
            }
          }
        }
      }
      goto LABEL_32;
    }
    v33 = objc_msgSend(v31, "mediaType");
    if (v33 == 2)
    {
      +[PHResourceLocalAvailabilityRequest resourceInfoKeysForResourceTypesForVideos](PHResourceLocalAvailabilityRequest, "resourceInfoKeysForResourceTypesForVideos");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v33 != 1)
      {
        v35 = 0;
        goto LABEL_29;
      }
      +[PHResourceLocalAvailabilityRequest resourceInfoKeysForResourceTypesForPhotos](PHResourceLocalAvailabilityRequest, "resourceInfoKeysForResourceTypesForPhotos");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v34;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHResourceLocalAvailabilityRequestResourceInfoKey _DictionaryKeyForResourceType(_PHResourceLocalAvailabilityRequestResourceType, PHAsset *__strong, _PHResourceLocalAvailabilityRequestAssetVersion)");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PHResourceLocalAvailabilityRequest.m"), 1640, CFSTR("Did not find a PHResourceLocalAvailabilityRequestResourceInfoKey for _PHResourceLocalAvailabilityRequestResourceType: %lu"), v29);

    }
    goto LABEL_32;
  }
  v28 = off_1E35D82F0[v29 - 19];
LABEL_32:

  +[PHResourceLocalAvailabilityRequest utiKeysForURLKeys](PHResourceLocalAvailabilityRequest, "utiKeysForURLKeys");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", v28);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "privateFileURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniformTypeIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && v39)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v39, v28);
  if (v38 && v40)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v40, v38);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", objc_msgSend(v53, "integerValue"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create resource info entry for asset:%@, resource:%@ (%@), url key:%@, url:%@, uti key:%@, uti:%@"), *(_QWORD *)(a1 + 32), v41, v53, v28, v39, v38, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v60) = 138412290;
      *(_QWORD *)((char *)&v60 + 4) = v42;
      _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@", (uint8_t *)&v60, 0xCu);
    }

    _PHResourceLocalAvailabilityRequestError(2, 0, v42);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v44;

  }
LABEL_42:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;

}

void __55__PHResourceLocalAvailabilityRequest_utiKeysForURLKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey");
  v2[1] = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
  v3[0] = CFSTR("PHResourceLocalAvailabilityRequestPhotoUTIKey");
  v3[1] = CFSTR("PHResourceLocalAvailabilityRequestVideoUTIKey");
  v2[2] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentDataURLKey");
  v2[3] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentDataBlobURLKey");
  v3[2] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentDataUTIKey");
  v3[3] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentDataBlobUTIKey");
  v2[4] = CFSTR("PHResourceLocalAvailabilityRequestOriginalAdjustmentDataURLKey");
  v2[5] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentSecondaryDataURLKey");
  v3[4] = CFSTR("PHResourceLocalAvailabilityRequestOriginalAdjustmentDataUTIKey");
  v3[5] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentSecondaryDataUTIKey");
  v2[6] = CFSTR("PHResourceLocalAvailabilityRequestAlternatePhotoURLKey");
  v2[7] = CFSTR("PHResourceLocalAvailabilityRequestFullSizePhotoURLKey");
  v3[6] = CFSTR("PHResourceLocalAvailabilityRequestAlternatePhotoUTIKey");
  v3[7] = CFSTR("PHResourceLocalAvailabilityRequestFullSizePhotoUTIKey");
  v2[8] = CFSTR("PHResourceLocalAvailabilityRequestFullSizeVideoURLKey");
  v2[9] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoURLKey");
  v3[8] = CFSTR("PHResourceLocalAvailabilityRequestFullSizeVideoUTIKey");
  v3[9] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoUTIKey");
  v2[10] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseVideoURLKey");
  v2[11] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoURLKey");
  v3[10] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseVideoUTIKey");
  v3[11] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoUTIKey");
  v2[12] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoURLKey");
  v2[13] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoURLKey");
  v3[12] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoUTIKey");
  v3[13] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoUTIKey");
  v2[14] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoURLKey");
  v3[14] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoUTIKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)utiKeysForURLKeys_utiKeysForURLKeys;
  utiKeysForURLKeys_utiKeysForURLKeys = v0;

}

void __79__PHResourceLocalAvailabilityRequest_resourceInfoKeysForResourceTypesForVideos__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E36552E8;
  v2[1] = &unk_1E36553C0;
  v3[0] = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
  v3[1] = CFSTR("PHResourceLocalAvailabilityRequestFullSizeVideoURLKey");
  v2[2] = &unk_1E36553D8;
  v2[3] = &unk_1E3655348;
  v3[2] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseVideoURLKey");
  v3[3] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoURLKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys;
  resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys = v0;

}

void __79__PHResourceLocalAvailabilityRequest_resourceInfoKeysForResourceTypesForPhotos__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E36552E8;
  v2[1] = &unk_1E3655300;
  v3[0] = CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey");
  v3[1] = CFSTR("PHResourceLocalAvailabilityRequestAlternatePhotoURLKey");
  v2[2] = &unk_1E3655318;
  v2[3] = &unk_1E3655330;
  v3[2] = CFSTR("PHResourceLocalAvailabilityRequestFullSizePhotoURLKey");
  v3[3] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoURLKey");
  v2[4] = &unk_1E3655348;
  v2[5] = &unk_1E3655360;
  v3[4] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoURLKey");
  v3[5] = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
  v2[6] = &unk_1E3655378;
  v2[7] = &unk_1E3655390;
  v3[6] = CFSTR("PHResourceLocalAvailabilityRequestFullSizeVideoURLKey");
  v3[7] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoURLKey");
  v2[8] = &unk_1E36553A8;
  v3[8] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoURLKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys;
  resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys = v0;

}

void __73__PHResourceLocalAvailabilityRequest_resourceLocalAvailabilityRequestLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos", "PHResourceLocalAvailabilityRequest");
  v1 = (void *)resourceLocalAvailabilityRequestLog_log;
  resourceLocalAvailabilityRequestLog_log = (uint64_t)v0;

}

void __71__PHResourceLocalAvailabilityRequest_isKnownUnsupportedFormatForAsset___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs;
  isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs = v0;

}

@end
