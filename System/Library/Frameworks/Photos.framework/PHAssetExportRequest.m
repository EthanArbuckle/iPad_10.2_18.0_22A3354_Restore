@implementation PHAssetExportRequest

- (PHAssetExportRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 277, CFSTR("%s is not available as initializer"), "-[PHAssetExportRequest init]");

  abort();
}

- (PHAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4
{
  id v8;
  id v9;
  PHAssetExportRequest *v10;
  PHAssetExportRequest *v11;
  uint64_t v12;
  NSProgress *progress;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *exportUUID;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *resourceProcessingQueue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *serialQueue;
  NSObject *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variants.count"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PHAssetExportRequest;
  v10 = -[PHAssetExportRequest init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_asset, a3);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    progress = v11->_progress;
    v11->_progress = (NSProgress *)v12;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    exportUUID = v11->_exportUUID;
    v11->_exportUUID = (NSString *)v16;

    v11->_state = 0;
    objc_storeStrong((id *)&v11->_variants, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("PHAssetExportRequest.ResourceProcessingQueue", v18);
    resourceProcessingQueue = v11->_resourceProcessingQueue;
    v11->_resourceProcessingQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("PHAssetExportRequest.SerialQueue", v21);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v22;

    objc_msgSend((id)objc_opt_class(), "assetExportLog");
    v24 = objc_claimAutoreleasedReturnValue();
    v11->_signpostId = os_signpost_id_make_with_pointer(v24, v11->_exportUUID);

    v11->_prepareItemEventCPAnalyticsSignpostId = 0;
  }

  return v11;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t state;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      if (state > 6)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E35D6488[state];
      if (a3 > 6)
        v8 = CFSTR("unknown");
      else
        v8 = off_1E35D6488[a3];
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Changing state from \"%{public}@\" to \"%{public}@\", (uint8_t *)&v13, 0x16u);
    }

    v9 = self->_state;
    self->_state = a3;
    -[PHAssetExportRequest updateSignpostIntervalsChangingFromState:toState:](self, "updateSignpostIntervalsChangingFromState:toState:", v9, a3);
    -[PHAssetExportRequest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PHAssetExportRequest delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetExportRequest:didChangeToState:fromState:", self, a3, v9);

    }
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t state;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  state = self->_state;
  if (state > 6)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E35D6488[state];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, asset: %@, state: %@, progress: %@, variants: %@>"), v4, self, self->_asset, v6, self->_progress, self->_variants);
}

- (id)outputDirectory
{
  NSURL *outputDirectory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSURL *v9;
  NSURL *v10;

  outputDirectory = self->_outputDirectory;
  if (!outputDirectory)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.mobileslideshow.export-request"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v10 = self->_outputDirectory;
    self->_outputDirectory = v9;

    outputDirectory = self->_outputDirectory;
  }
  return outputDirectory;
}

- (PFMetadata)assetMetadata
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  PFMetadata *v7;
  PFMetadata *assetMetadata;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_assetMetadata
    && !-[PHAssetExportRequest assetMetadataRetrievalAttempted](self, "assetMetadataRetrievalAttempted"))
  {
    PLPhotoKitGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PHAssetExportRequest asset](self, "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Retrieving metadata for asset %{public}@", (uint8_t *)&v13, 0xCu);

    }
    -[PHAssetExportRequest asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PHAssetOriginalMetadataOfAsset(v6);
    v7 = (PFMetadata *)objc_claimAutoreleasedReturnValue();
    assetMetadata = self->_assetMetadata;
    self->_assetMetadata = v7;

    -[PHAssetExportRequest setAssetMetadataRetrievalAttempted:](self, "setAssetMetadataRetrievalAttempted:", 1);
    if (!self->_assetMetadata)
    {
      PLPhotoKitGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PHAssetExportRequest asset](self, "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Metadata retrieved was nil for asset %{public}@", (uint8_t *)&v13, 0xCu);

      }
    }
  }
  return self->_assetMetadata;
}

- (void)handleResultWithFileURLs:(id)a3 cancelled:(BOOL)a4 withError:(id)a5 forAsset:(id)a6 withOptions:(id)a7 progress:(id)a8 processingUnitCount:(int64_t)a9 completionHandler:(id)a10
{
  _BOOL4 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *resourceProcessingQueue;
  NSObject *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  PHAssetExportRequest *v47;
  id v48;
  id v49;
  int64_t v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  _QWORD block[5];
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v14 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  if (v14)
  {
    PHAssetExportRequestError(1, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v18;
      v61 = 2112;
      v62 = v22;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Cancelled download asset for export: %@, error: %@", buf, 0x16u);
    }

    objc_msgSend(v19, "resultHandlerQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke;
    block[3] = &unk_1E35DF520;
    block[4] = self;
    v56 = v19;
    v57 = v22;
    v58 = v21;
    v25 = v22;
    dispatch_async(v24, block);

    v26 = v56;
    goto LABEL_25;
  }
  if (!v16 || v17)
  {
    if (v17)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (!objc_msgSend(v16, "count"))
  {
LABEL_12:
    PHAssetExportRequestError(0, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    PLPhotoKitGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v18;
      v61 = 2112;
      v62 = v17;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to download asset for export: %@, error: %@", buf, 0x16u);
    }

    objc_msgSend(v17, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D11268]);

    if (v31)
    {
      if (objc_msgSend(v17, "code") != 81 && objc_msgSend(v17, "code") != 80 && objc_msgSend(v17, "code") != 82)
      {
        if (objc_msgSend(v17, "code") == 1005)
        {
          v32 = 3;
        }
        else
        {
          if (objc_msgSend(v17, "code") != 1006)
            goto LABEL_24;
          v32 = 4;
        }
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v17, "domain");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

      if ((v34 & 1) == 0)
      {
        objc_msgSend(v17, "domain");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("PHAssetExportRequestErrorDomain"));

        if ((v38 & 1) != 0)
          goto LABEL_24;
        -[PHAssetExportRequest asset](self, "asset");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "photoLibrary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "wellKnownPhotoLibraryIdentifier") == 3)
        {

          v32 = 5;
        }
        else
        {
          -[PHAssetExportRequest asset](self, "asset");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isGuestAsset");

          if (v42)
            v32 = 5;
          else
            v32 = 0;
        }
LABEL_23:
        PHAssetExportRequestError(v32, v17);
        v35 = objc_claimAutoreleasedReturnValue();

        v17 = (id)v35;
LABEL_24:
        objc_msgSend(v19, "resultHandlerQueue");
        v36 = objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_332;
        v51[3] = &unk_1E35DF520;
        v51[4] = self;
        v52 = v19;
        v53 = v17;
        v54 = v21;
        v25 = v17;
        dispatch_async(v36, v51);

        v26 = v52;
LABEL_25:

        goto LABEL_26;
      }
    }
    v32 = 2;
    goto LABEL_23;
  }
  PLPhotoKitGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v60 = v18;
    v61 = 2112;
    v62 = v16;
    _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Did download asset for export: %@, urls: %@", buf, 0x16u);
  }

  -[PHAssetExportRequest setState:](self, "setState:", 2);
  resourceProcessingQueue = self->_resourceProcessingQueue;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_333;
  v43[3] = &unk_1E35D78E8;
  v44 = v16;
  v45 = v18;
  v46 = v19;
  v47 = self;
  v48 = v20;
  v50 = a9;
  v49 = v21;
  dispatch_async(resourceProcessingQueue, v43);

  v25 = v44;
LABEL_26:

}

- (void)processResourcesAtFileURLs:(id)a3 forAsset:(id)a4 withOptions:(id)a5 progress:(id)a6 processingUnitCount:(int64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  int64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *serialQueue;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(id, void *);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  _QWORD block[4];
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  id v67;
  NSObject *v68;
  _QWORD v69[5];
  id v70;
  id v71;
  NSObject *v72;
  _QWORD v73[5];
  id v74;
  id v75;
  NSObject *v76;
  _QWORD v77[5];
  id v78;
  id v79;
  NSObject *v80;
  id v81;
  id v82;
  id v83;
  id v84[2];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v60 = a6;
  v44 = (void (**)(id, void *))a8;
  v17 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v18;
  v45 = (objc_msgSend(v15, "isCloudSharedAsset") & 1) == 0 && objc_msgSend(v16, "variant") == 2;
  -[PHAssetExportRequest assetMetadata](self, "assetMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = 0;
  v48 = PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(v15, v16, v20, v84);
  v55 = v84[0];
  v83 = 0;
  v47 = PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(v15, v16, v20, &v83);
  v57 = v83;
  v82 = 0;
  v43 = v20;
  v46 = PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(v15, v16, v20, &v82);
  v56 = v82;
  v81 = 0;
  PHAssetExportRequestCustomDateForAssetWithOptions(v15, v16, &v81);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v81;
  objc_msgSend(v16, "videoExportPreset");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestPhotoFileURLKey"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v21;
  if (v21)
    v23 = v22 == 0;
  else
    v23 = 1;
  v24 = v23;
  -[PHAssetExportRequest outputDirectory](self, "outputDirectory");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v51 = v14;
  v42 = (void *)v22;
  v25 = (void *)v19;
  if (objc_msgSend(v15, "playbackStyle") == 3 && (v24 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v51;
  }
  objc_msgSend(v15, "fetchPropertySetsIfNeeded");
  PHAssetExportRequestFilenameForAsset(v15, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 >= 0)
    v28 = a7;
  else
    v28 = a7 + 1;
  v29 = v28 >> 1;
  if (!v24)
    a7 = v29;
  if (v54)
  {
    v30 = v17;
    v31 = v17;
    v32 = MEMORY[0x1E0C809B0];
    dispatch_group_enter(v31);
    objc_msgSend(MEMORY[0x1E0D47C50], "imageSourceForFileURL:", v54);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v32;
    v77[1] = 3221225472;
    v77[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke;
    v77[3] = &unk_1E35D63B8;
    v77[4] = self;
    v78 = v59;
    v79 = v25;
    v17 = v30;
    v80 = v30;
    PHAssetExportRequestPerformMediaConversion(v33, 0, v45, v48, v55, v53, v52, v47, v57, v46, v56, 0, v60, a7, v58, v27, v61, v77);

    v14 = v51;
  }
  if (v42)
  {
    if (PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(v15, v16))
    {
      dispatch_group_enter(v17);
      objc_msgSend(v16, "videoExportPreset");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "videoExportFileType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_3;
      v73[3] = &unk_1E35D63B8;
      v73[4] = self;
      v74 = v59;
      v75 = v25;
      v76 = v17;
      PHAssetExportRequestPerformSlomoFlattening(v42, v50, v60, a7, v58, v27, v34, v35, v45, v48, v55, v47, v57, v46, v56, v73);

      v14 = v51;
      v36 = v74;
    }
    else
    {
      v37 = objc_msgSend(v16, "variant");
      dispatch_group_enter(v17);
      v23 = v37 == 3;
      v38 = MEMORY[0x1E0C809B0];
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v42);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v38;
        v65[1] = 3221225472;
        v65[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_7;
        v65[3] = &unk_1E35D63B8;
        v65[4] = self;
        v66 = v59;
        v67 = v25;
        v68 = v17;
        PHAssetExportRequestPerformMediaConversion(v39, 0, v45, v48, v55, v53, v52, v47, v57, v46, v56, v49, v60, a7, v58, v27, v61, v65);

        v14 = v51;
        goto LABEL_27;
      }
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_5;
      v69[3] = &unk_1E35D63B8;
      v69[4] = self;
      v70 = v59;
      v71 = v25;
      v72 = v17;
      PHAssetExportRequestPerformGifConversion(v42, v60, a7, v58, v27, v69);

      v36 = v70;
    }

  }
LABEL_27:
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (v44)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_9;
    block[3] = &unk_1E35DF9E8;
    v63 = v14;
    v64 = v59;
    dispatch_sync(serialQueue, block);
    objc_msgSend(v25, "anyObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2](v44, v41);

  }
}

- (BOOL)reassembleAdjustmentsPropertyListIfNeeded:(id)a3 toOutputDirectory:(id)a4 outputURL:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  int v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9
    && objc_msgSend(MEMORY[0x1E0D750B0], "adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:predictedSize:", v9, 0))
  {
    objc_msgSend(v9, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v13 = PHAssetExportRequestCreateOutputDirectory(v10, &v22);
    v14 = v22;
    if (v13)
    {
      v21 = v14;
      v15 = objc_msgSend(MEMORY[0x1E0D750B0], "writeReassembleAdjustmentsPropertyListAtURL:toURL:error:", v9, v12, &v21);
      v16 = v21;

      if (!v15)
        goto LABEL_13;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      if (a6)
      {
        v14 = objc_retainAutorelease(v16);
        *a6 = v14;
      }
      else
      {
LABEL_13:
        v14 = v16;
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v19;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to create output directory %@: %@", buf, 0x16u);

      }
    }

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)bundleResourcesIfNeededForAsset:(id)a3 withFileURLs:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  PHAssetBundleExportSession *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PHLivePhotoExportSession *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PHAssetExportRequest.m"), 1417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_27:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PHAssetExportRequest.m"), 1419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

      if (v13)
        goto LABEL_5;
      goto LABEL_28;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PHAssetExportRequest.m"), 1418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURLs"));

  if (!v12)
    goto LABEL_27;
LABEL_4:
  if (v13)
    goto LABEL_5;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PHAssetExportRequest.m"), 1420, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_5:
  if (!objc_msgSend(v12, "shouldBundleComplexAssetResources"))
    goto LABEL_23;
  PHAssetExportRequestFilenameForAsset(v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "includeAllAssetResources"))
  {
    if (PHAssetExportRequestCanCreateLivePhotoBundleForAssetWithOptions(v10, v11, v12))
    {
      PLPhotoKitGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Creating live photo bundle from asset resources", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v16 = (PHAssetBundleExportSession *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestPhotoFileURLKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestPhotoFileURLKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetBundleExportSession addObject:](v16, "addObject:", v20);

      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetBundleExportSession addObject:](v16, "addObject:", v22);

      }
      v39 = -[PHLivePhotoExportSession initWithResourceFileURLs:]([PHLivePhotoExportSession alloc], "initWithResourceFileURLs:", v16);
      -[PHAssetExportRequest outputDirectory](self, "outputDirectory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLByAppendingPathExtension:", *MEMORY[0x1E0D75488]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0] = 0;
      objc_msgSend(v25, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "fileExistsAtPath:isDirectory:", v27, buf);

      if ((v28 & 1) != 0 || buf[0])
        objc_msgSend(v26, "removeItemAtURL:error:", v25, 0);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke_352;
      v40[3] = &unk_1E35D6408;
      v41 = v25;
      v42 = v13;
      v29 = v25;
      v30 = -[PHLivePhotoExportSession writeToFileURL:options:completionHandler:](v39, "writeToFileURL:options:completionHandler:", v29, 0, v40);

      goto LABEL_21;
    }

LABEL_23:
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, MEMORY[0x1E0C9AA70], 0);
    goto LABEL_24;
  }
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Creating asset bundle from asset resources", buf, 2u);
  }

  v16 = -[PHAssetBundleExportSession initWithAsset:withAssetExportRequestFileURLs:]([PHAssetBundleExportSession alloc], "initWithAsset:withAssetExportRequestFileURLs:", v10, v11);
  -[PHAssetBundleExportSession setCustomFilenameBase:](v16, "setCustomFilenameBase:", v14);
  -[PHAssetExportRequest outputDirectory](self, "outputDirectory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke;
  v43[3] = &unk_1E35D63E0;
  v43[4] = self;
  v44 = v13;
  -[PHAssetBundleExportSession writeToDirectoryURL:completionHandler:](v16, "writeToDirectoryURL:completionHandler:", v17, v43);

LABEL_21:
LABEL_24:

}

- (id)copyFileURLsIfNeeded:(id)a3 toOutputDirectory:(id)a4 options:(id)a5 originalFilenameBase:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  _BYTE v57[14];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2315;
  v52 = __Block_byref_object_dispose__2316;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2315;
  v46 = __Block_byref_object_dispose__2316;
  v47 = 0;
  if ((objc_msgSend(v14, "disableUpdatingFileCreationDatesOnExportedFileURLs") & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(v14, "shouldExportUnmodifiedOriginalResources"))
  {
    if ((objc_msgSend(v14, "disableMetadataCorrections") & 1) != 0)
    {
LABEL_2:
      v16 = 0;
      goto LABEL_14;
    }
    -[PHAssetExportRequest asset](self, "asset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "creationDate");
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v16 = (void *)v23;

    if (!v16)
      goto LABEL_14;
    goto LABEL_11;
  }
  -[PHAssetExportRequest asset](self, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "originalCreationDateWithTimeZone:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[PHAssetExportRequest asset](self, "asset");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest asset](self, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "creationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v55 = v19;
      v56 = 2113;
      *(_QWORD *)v57 = v21;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to retrieve original creation date for asset: %{public}@. Falling back to creation date: %{private}@", buf, 0x16u);

    }
    -[PHAssetExportRequest asset](self, "asset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "creationDate");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  PLPhotoKitGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v14, "shouldExportUnmodifiedOriginalResources");
    -[PHAssetExportRequest asset](self, "asset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v55 = v16;
    v56 = 1024;
    *(_DWORD *)v57 = v25;
    *(_WORD *)&v57[4] = 2112;
    *(_QWORD *)&v57[6] = v27;
    _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Setting file creation date %{private}@ for exported files of asset (unmodified originals = %{BOOL}d): %@", buf, 0x1Cu);

  }
LABEL_14:
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __98__PHAssetExportRequest_copyFileURLsIfNeeded_toOutputDirectory_options_originalFilenameBase_error___block_invoke;
  v35[3] = &unk_1E35D6430;
  v28 = v15;
  v36 = v28;
  v29 = v14;
  v37 = v29;
  v30 = v13;
  v38 = v30;
  v31 = v16;
  v39 = v31;
  v40 = &v48;
  v41 = &v42;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v35);
  if (a7)
    *a7 = objc_retainAutorelease((id)v43[5]);
  v32 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v32;
}

- (void)performCompletionWithFileURLs:(id)a3 preparationOptions:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  unint64_t v11;
  id v12;
  unint64_t v13;
  void (**v14)(id, id, id);
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = (unint64_t)a3;
  v12 = a4;
  v13 = (unint64_t)a5;
  v14 = (void (**)(id, id, id))a6;
  if (!(v11 | v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 1543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURLs || error"));
LABEL_23:

    goto LABEL_4;
  }
  if (v11 && !objc_msgSend((id)v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 1544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!fileURLs || fileURLs.count"));
    goto LABEL_23;
  }
LABEL_4:
  -[PHAssetExportRequest setState:](self, "setState:", 0);
  -[PHAssetExportRequest finalizeTotalPreparationDurationTimingInfoDictionary](self, "finalizeTotalPreparationDurationTimingInfoDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoKitGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v15;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Preparation timing: %{public}@", buf, 0xCu);
  }

  v17 = objc_msgSend(MEMORY[0x1E0D09910], "isAllowed");
  if (-[PHAssetExportRequest shouldSendTimingIntervalsToAnalytics](self, "shouldSendTimingIntervalsToAnalytics") && v17)
  {
    v18 = objc_msgSend((id)v13, "code");
    v19 = v18 == 1;
    if (v18 == 1)
      v20 = 0;
    else
      v20 = (void *)v13;
    v21 = v20;
    -[PHAssetExportRequest analyticsActivityType](self, "analyticsActivityType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetExportRequest sendPreparationCompletedEventWithPreparationTimingInfo:forActivityType:preparationOptions:withError:didCancel:](self, "sendPreparationCompletedEventWithPreparationTimingInfo:forActivityType:preparationOptions:withError:didCancel:", v15, v22, v12, v21, v19);

  }
  -[PHAssetExportRequest setPreparationStepTimingInfo:](self, "setPreparationStepTimingInfo:", 0);
  v14[2](v14, (id)v11, (id)v13);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = objc_claimAutoreleasedReturnValue();
  -[PHAssetExportRequest outputDirectory](self, "outputDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v25 = -[NSObject removeItemAtURL:error:](v23, "removeItemAtURL:error:", v24, &v31);
  v26 = v31;
  v27 = v26;
  if (v25)
    goto LABEL_15;
  objc_msgSend(v26, "domain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

LABEL_15:
    goto LABEL_16;
  }
  v29 = objc_msgSend(v27, "code");

  if (v29 == 2)
    goto LABEL_17;
  PLPhotoKitGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to remove output directory: %@", buf, 0xCu);
  }
LABEL_16:

LABEL_17:
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  objc_class *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 1575, CFSTR("Method %s is a responsibility of subclasses of %@"), "-[PHAssetExportRequest preflightExportWithOptions:assetAvailability:isProcessingRequired:fileURLs:info:]", v10);

}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
  objc_class *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetExportRequest.m"), 1580, CFSTR("Method %s is a responsibility of subclasses of %@"), "-[PHAssetExportRequest exportWithOptions:completionHandler:]", v7);

}

- (void)updateSignpostIntervalsChangingFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  void *v7;
  os_signpost_id_t v8;
  int v9;
  int64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  os_signpost_type_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  uint8_t v44[16];

  objc_msgSend((id)objc_opt_class(), "assetExportLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHAssetExportRequest signpostId](self, "signpostId");
  v9 = objc_msgSend(MEMORY[0x1E0D09910], "isAllowed");
  if (-[PHAssetExportRequest shouldSendTimingIntervalsToAnalytics](self, "shouldSendTimingIntervalsToAnalytics"))
  {
    if (v9)
    {
      v10 = -[PHAssetExportRequest prepareItemEventCPAnalyticsSignpostId](self, "prepareItemEventCPAnalyticsSignpostId");
      if (a4)
      {
        if (!v10)
          -[PHAssetExportRequest setPrepareItemEventCPAnalyticsSignpostId:](self, "setPrepareItemEventCPAnalyticsSignpostId:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
      }
    }
  }
  switch(a3)
  {
    case 1uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_assetExportPreflight"), v11);

      v12 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v12;
      if (!os_signpost_enabled(v12))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "PerformingAssetExportPreflight";
      break;
    case 2uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_retrievingFromDisk"), v15);

      v16 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v16;
      if (!os_signpost_enabled(v16))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "RetrievingFromDisk";
      break;
    case 3uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_downloading"), v17);

      v18 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v18;
      if (!os_signpost_enabled(v18))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "Downloading";
      break;
    case 4uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_generatingDeferredResources"), v19);

      v20 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v20;
      if (!os_signpost_enabled(v20))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "GeneratingDeferredResources";
      break;
    case 5uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_additionalProcessing"), v21);

      v22 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v22;
      if (!os_signpost_enabled(v22))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "AdditionalProcessing";
      break;
    case 6uLL:
      -[PHAssetExportRequest preparationStepSignpostIntervalStartTime](self, "preparationStepSignpostIntervalStartTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:](self, "commitTimingInfoForPreparationStep:fromStartTime:", CFSTR("time_bundling"), v23);

      v24 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
      v13 = v24;
      if (!os_signpost_enabled(v24))
        goto LABEL_26;
      *(_WORD *)v44 = 0;
      v14 = "Bundling";
      break;
    default:
      goto LABEL_27;
  }
  _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_END, v8, v14, " enableTelemetry=YES ", v44, 2u);
LABEL_26:

LABEL_27:
  switch(a4)
  {
    case 0uLL:
      v25 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v26 = v25;
      if (!os_signpost_enabled(v25))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "AssetExportInactive";
      v28 = "";
      v29 = v26;
      v30 = OS_SIGNPOST_EVENT;
      goto LABEL_50;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v31);

      v32 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v32;
      if (!os_signpost_enabled(v32))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "PerformingAssetExportPreflight";
      v28 = " enableTelemetry=YES ";
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v34);

      v35 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v35;
      if (!os_signpost_enabled(v35))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "RetrievingFromDisk";
      v28 = " enableTelemetry=YES ";
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v36);

      v37 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v37;
      if (!os_signpost_enabled(v37))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "Downloading";
      v28 = " enableTelemetry=YES ";
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v38);

      v39 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v39;
      if (!os_signpost_enabled(v39))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "GeneratingDeferredResources";
      v28 = " enableTelemetry=YES ";
      break;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v40);

      v41 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v41;
      if (!os_signpost_enabled(v41))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "AdditionalProcessing";
      v28 = " enableTelemetry=YES ";
      break;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetExportRequest setPreparationStepSignpostIntervalStartTime:](self, "setPreparationStepSignpostIntervalStartTime:", v42);

      v43 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_51;
      v33 = v43;
      if (!os_signpost_enabled(v43))
        goto LABEL_51;
      *(_WORD *)v44 = 0;
      v27 = "Bundling";
      v28 = " enableTelemetry=YES ";
      break;
    default:
      goto LABEL_52;
  }
  v29 = v33;
  v30 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_50:
  _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, v30, v8, v27, v28, v44, 2u);
LABEL_51:

LABEL_52:
}

- (void)commitTimingInfoForPreparationStep:(id)a3 fromStartTime:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (v21)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PHAssetExportRequest.m"), 1680, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preparationStep"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PHAssetExportRequest.m"), 1681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startTime"));

LABEL_3:
  -[PHAssetExportRequest preparationStepTimingInfo](self, "preparationStepTimingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PHAssetExportRequest resetPreparationStepTimingInfos](self, "resetPreparationStepTimingInfos");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;

  -[PHAssetExportRequest preparationStepTimingInfo](self, "preparationStepTimingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    if (v13 > 0.0)
    {
      objc_msgSend(v12, "doubleValue");
      v10 = v10 + v14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetExportRequest preparationStepTimingInfo](self, "preparationStepTimingInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v21);

}

- (void)resetPreparationStepTimingInfos
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *preparationStepTimingInfo;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("time_assetExportPreflight");
  v6[1] = CFSTR("time_retrievingFromDisk");
  v7[0] = &unk_1E36576F0;
  v7[1] = &unk_1E36576F0;
  v6[2] = CFSTR("time_downloading");
  v6[3] = CFSTR("time_generatingDeferredResources");
  v7[2] = &unk_1E36576F0;
  v7[3] = &unk_1E36576F0;
  v6[4] = CFSTR("time_additionalProcessing");
  v6[5] = CFSTR("time_bundling");
  v7[4] = &unk_1E36576F0;
  v7[5] = &unk_1E36576F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
  preparationStepTimingInfo = self->_preparationStepTimingInfo;
  self->_preparationStepTimingInfo = v4;

}

- (id)finalizeTotalPreparationDurationTimingInfoDictionary
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PHAssetExportRequest preparationStepTimingInfo](self, "preparationStepTimingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v8 = v8 + v11;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("time_total"));

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)sendPreparationCompletedEventWithPreparationTimingInfo:(id)a3 forActivityType:(id)a4 preparationOptions:(id)a5 withError:(id)a6 didCancel:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  int64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v7 = a7;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  -[PHAssetExportRequest _generateAnalyticsPayloadWithTimingInfo:preparationOptions:](self, "_generateAnalyticsPayloadWithTimingInfo:preparationOptions:", a3, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("activityType"));
  if (v13)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D09838]);
    v15 = CFSTR("Failed");
  }
  else if (v7)
  {
    v15 = CFSTR("Canceled");
  }
  else
  {
    v15 = CFSTR("Succeeded");
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("preparationOutcome"));
  PLPhotoKitGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138477827;
    v20 = v14;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] CPAnalytics item preparation payload: %{private}@", (uint8_t *)&v19, 0xCu);
  }

  v17 = (void *)MEMORY[0x1E0D09910];
  v18 = -[PHAssetExportRequest prepareItemEventCPAnalyticsSignpostId](self, "prepareItemEventCPAnalyticsSignpostId");
  objc_msgSend(v17, "endSignpost:forEventName:withPayload:", v18, *MEMORY[0x1E0D096C0], v14);
  -[PHAssetExportRequest setPrepareItemEventCPAnalyticsSignpostId:](self, "setPrepareItemEventCPAnalyticsSignpostId:", 0);

}

- (id)_generateAnalyticsPayloadWithTimingInfo:(id)a3 preparationOptions:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "treatLivePhotoAsStill");
  v8 = objc_msgSend(v6, "shouldStripLocation");
  v9 = objc_msgSend(v6, "shouldStripCaption");
  v10 = objc_msgSend(v6, "shouldStripAccessibilityDescription");
  v11 = objc_msgSend(v6, "includeAllAssetResources");
  v12 = (void *)MEMORY[0x1E0C99E08];
  v37[0] = *MEMORY[0x1E0D09830];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  v37[1] = CFSTR("excludeLiveness");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  v37[2] = CFSTR("excludeLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v16;
  v37[3] = CFSTR("excludeCaption");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  v37[4] = CFSTR("excludeAccessibilityDescription");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v18;
  v37[5] = CFSTR("sendAsOriginals");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAssetExportRequest asset](self, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D09828]);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v31;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKeyedSubscript:", v28, v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v25);
  }

  return v21;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (unint64_t)state
{
  return self->_state;
}

- (PHAssetExportRequestDelegate)delegate
{
  return (PHAssetExportRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)variants
{
  return self->_variants;
}

- (BOOL)shouldSendTimingIntervalsToAnalytics
{
  return self->_shouldSendTimingIntervalsToAnalytics;
}

- (void)setShouldSendTimingIntervalsToAnalytics:(BOOL)a3
{
  self->_shouldSendTimingIntervalsToAnalytics = a3;
}

- (NSString)analyticsActivityType
{
  return self->_analyticsActivityType;
}

- (void)setAnalyticsActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)assetMetadataRetrievalAttempted
{
  return self->_assetMetadataRetrievalAttempted;
}

- (void)setAssetMetadataRetrievalAttempted:(BOOL)a3
{
  self->_assetMetadataRetrievalAttempted = a3;
}

- (NSString)exportUUID
{
  return self->_exportUUID;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (NSMutableDictionary)preparationStepTimingInfo
{
  return self->_preparationStepTimingInfo;
}

- (void)setPreparationStepTimingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_preparationStepTimingInfo, a3);
}

- (NSDate)preparationStepSignpostIntervalStartTime
{
  return self->_preparationStepSignpostIntervalStartTime;
}

- (void)setPreparationStepSignpostIntervalStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_preparationStepSignpostIntervalStartTime, a3);
}

- (int64_t)prepareItemEventCPAnalyticsSignpostId
{
  return self->_prepareItemEventCPAnalyticsSignpostId;
}

- (void)setPrepareItemEventCPAnalyticsSignpostId:(int64_t)a3
{
  self->_prepareItemEventCPAnalyticsSignpostId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparationStepSignpostIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_preparationStepTimingInfo, 0);
  objc_storeStrong((id *)&self->_exportUUID, 0);
  objc_storeStrong((id *)&self->_analyticsActivityType, 0);
  objc_storeStrong((id *)&self->_variants, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resourceProcessingQueue, 0);
  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

void __98__PHAssetExportRequest_copyFileURLsIfNeeded_toOutputDirectory_options_originalFilenameBase_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "includeAllAssetResources"))
  {
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingPathExtension");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  v12 = *(void **)(a1 + 48);
  v19 = 0;
  PHAssetExportRequestCopyFileURL(v8, v12, v9, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  v15 = v19;
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    objc_msgSend(MEMORY[0x1E0D73208], "setFileCreationDate:forFileURL:error:", v16, v13, 0);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  if (v13)
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, v7);
  }
  else
  {
    *(_QWORD *)(v17 + 40) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v14);
    *a4 = 1;
  }

}

void __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "outputDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to create asset bundle at directory '%@' due to following error '%@'", buf, 0x16u);

    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v11 = CFSTR("PHAssetExportRequestAssetBundleURLKey");
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

void __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke_352(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHLivePhotoExportSessionInfoBundleURLKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHLivePhotoExportSessionInfoErrorKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Unable to create live photo bundle at '%@' due to following error '%@'", buf, 0x16u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v10 = CFSTR("PHAssetExportRequestLivePhotoBundleURLKey");
    v11 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v5);
  }

}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_2;
  block[3] = &unk_1E35DE750;
  v12 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_4;
  block[3] = &unk_1E35DE750;
  v12 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_6;
  block[3] = &unk_1E35DE750;
  v12 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_8;
  block[3] = &unk_1E35DE750;
  v12 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v1, CFSTR("PHAssetExportRequestVideoFileURLKey"));
  else
    return objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v1, CFSTR("PHAssetExportRequestVideoFileURLKey"));
  else
    return objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
  }
  else
  {
    v1 = *(void **)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:");
    }
    else
    {
      v2 = (void *)MEMORY[0x1E0CB35C8];
      v3 = *MEMORY[0x1E0D75958];
      v7 = *MEMORY[0x1E0CB2D50];
      v8[0] = CFSTR("Failed to flatten slomo video.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PHAssetExportRequestError(0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v6);

    }
  }
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v1, CFSTR("PHAssetExportRequestPhotoFileURLKey"));
  else
    return objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
}

uint64_t __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCompletionWithFileURLs:preparationOptions:error:completionHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_332(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCompletionWithFileURLs:preparationOptions:error:completionHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_333(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  dispatch_semaphore_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  dispatch_semaphore_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  id *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  id v50;
  void *v51;
  int8x16_t v52;
  _QWORD block[4];
  id v54;
  id v55;
  int8x16_t v56;
  id v57;
  uint64_t *v58;
  id obj;
  _QWORD v60[4];
  NSObject *v61;
  uint64_t *v62;
  uint64_t *v63;
  _QWORD v64[5];
  NSObject *v65;
  uint64_t *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  id *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__2315;
  v80 = __Block_byref_object_dispose__2316;
  v81 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v70 = 0;
  v71 = (id *)&v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__2315;
  v74 = __Block_byref_object_dispose__2316;
  v75 = 0;
  objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsIfNeeded");
  PHAssetExportRequestFilenameForAsset(*(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "outputDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v4 = PHAssetExportRequestCreateOutputDirectory(v3, &v69);
  v5 = v69;
  v6 = v69;
  if ((v4 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v83 = v8;
      v84 = 2112;
      v85 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to create output directory %@: %@", buf, 0x16u);

    }
    objc_storeStrong(v71 + 5, v5);
  }
  if (!v71[5])
  {
    objc_msgSend((id)v77[5], "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      v11 = *(void **)(a1 + 56);
      objc_msgSend((id)v77[5], "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      v68 = 0;
      objc_msgSend(v11, "reassembleAdjustmentsPropertyListIfNeeded:toOutputDirectory:outputURL:error:", v12, v3, &v68, &v67);
      v13 = v68;
      v14 = v67;

      if (v13)
      {
        objc_msgSend((id)v77[5], "setObject:forKeyedSubscript:", v13, CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
      }
      else if (v14)
      {
        PLPhotoKitGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v14;
          _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Error trying to reassemble adjustments plist and data blob: %@", buf, 0xCu);
        }

        PHAssetExportRequestError(0, v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v71[5];
        v71[5] = (id)v16;

      }
    }
  }
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "assetMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v18, v19, v20);

  v22 = v71[5];
  if (v22)
    v23 = 0;
  else
    v23 = v21;
  v24 = MEMORY[0x1E0C809B0];
  if (v23 == 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "setState:", 5);
    PLPhotoKitGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Processing retrieved file urls for compatibility and/or metadata corrections", buf, 2u);
    }

    v51 = v3;
    v26 = v6;
    v27 = v24;
    v28 = v2;
    v29 = dispatch_semaphore_create(0);
    v30 = v77[5];
    v31 = *(_QWORD *)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(void **)(a1 + 56);
    v34 = *(_QWORD *)(a1 + 64);
    v35 = *(_QWORD *)(a1 + 80);
    v64[0] = v27;
    v64[1] = 3221225472;
    v64[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_334;
    v64[3] = &unk_1E35D82B8;
    v66 = &v70;
    v64[4] = v33;
    v36 = v29;
    v65 = v36;
    objc_msgSend(v33, "processResourcesAtFileURLs:forAsset:withOptions:progress:processingUnitCount:completion:", v30, v31, v32, v34, v35, v64);
    dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);

    v2 = v28;
    v6 = v26;
    v3 = v51;
    v24 = MEMORY[0x1E0C809B0];

    v22 = v71[5];
  }
  if (!v22)
  {
    objc_msgSend(*(id *)(a1 + 56), "setState:", 2);
    if (!v71[5])
    {
      if (objc_msgSend(*(id *)(a1 + 48), "shouldBundleComplexAssetResources"))
      {
        v37 = dispatch_semaphore_create(0);
        v39 = *(_QWORD *)(a1 + 48);
        v38 = *(void **)(a1 + 56);
        v40 = v77[5];
        v41 = *(_QWORD *)(a1 + 40);
        v60[0] = v24;
        v60[1] = 3221225472;
        v60[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_336;
        v60[3] = &unk_1E35D6368;
        v62 = &v76;
        v63 = &v70;
        v42 = v37;
        v61 = v42;
        objc_msgSend(v38, "bundleResourcesIfNeededForAsset:withFileURLs:options:completion:", v41, v40, v39, v60);
        dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);

      }
    }
  }
  v43 = v71 + 5;
  if (v71[5])
  {
    v44 = 0;
  }
  else
  {
    v45 = v77[5];
    v47 = *(_QWORD *)(a1 + 48);
    v46 = *(void **)(a1 + 56);
    obj = 0;
    v44 = (void *)objc_msgSend(v46, "copyFileURLsIfNeeded:toOutputDirectory:options:originalFilenameBase:error:", v45, v3, v47, v2, &obj);
    objc_storeStrong(v43, obj);
  }
  objc_msgSend(*(id *)(a1 + 48), "resultHandlerQueue", v51);
  v48 = objc_claimAutoreleasedReturnValue();
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_2;
  block[3] = &unk_1E35D6390;
  v58 = &v70;
  v54 = v44;
  v55 = *(id *)(a1 + 40);
  v52 = *(int8x16_t *)(a1 + 48);
  v49 = (id)v52.i64[0];
  v56 = vextq_s8(v52, v52, 8uLL);
  v57 = *(id *)(a1 + 72);
  v50 = v44;
  dispatch_async(v48, block);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_334(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D47DB0]) & 1) != 0)
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 3)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D75428]) & 1) != 0)
    {
      v8 = objc_msgSend(v4, "code");

      if (v8 == 3)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D75958]) & 1) != 0)
    {
      v10 = objc_msgSend(v4, "code");

      if (v10 == 1)
      {
LABEL_12:
        PLPhotoKitGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Cancelled while processing resources", (uint8_t *)&v19, 2u);
        }

        v12 = 1;
LABEL_23:
        PHAssetExportRequestError(v12, v4);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        goto LABEL_24;
      }
    }
    else
    {

    }
    v13 = objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceRelated:", v4);
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v19 = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Low disk space error while processing resources: %@", (uint8_t *)&v19, 0xCu);
      }

      v12 = 3;
    }
    else
    {
      if (v15)
      {
        v19 = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Error while processing resources: %@", (uint8_t *)&v19, 0xCu);
      }

      v12 = 0;
    }
    goto LABEL_23;
  }
LABEL_24:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_336(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "performCompletionWithFileURLs:preparationOptions:error:completionHandler:", 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "pathExtension");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v8;
          if (v8)
            v10 = (const __CFString *)v8;
          else
            v10 = &stru_1E35DFFF8;
          objc_msgSend(v2, "addObject:", v10);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      }
      while (v5);
    }

    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Did retrieve asset %{public}@ for export with urls: %@ (extensions: %{public}@)", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "performCompletionWithFileURLs:preparationOptions:error:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));

  }
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  __objc2_class **v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = off_1E35D2A68;
  if ((objc_msgSend(v7, "isCloudSharedAsset") & 1) == 0 && !objc_msgSend(v7, "isStreamedVideo"))
    v8 = off_1E35D2D10;
  -[__objc2_class variantsForAsset:asUnmodifiedOriginal:error:](*v8, "variantsForAsset:asUnmodifiedOriginal:error:", v7, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "exportRequestForAsset:variants:error:", a3, 0, a4);
}

+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetExportRequest.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if ((objc_msgSend(v9, "isCloudSharedAsset") & 1) != 0 || objc_msgSend(v9, "isStreamedVideo"))
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a shared-album asset. Creating a cloud shared export request.", buf, 0xCu);

    }
    +[PHCloudSharedAssetExportRequest exportRequestForAsset:error:](PHCloudSharedAssetExportRequest, "exportRequestForAsset:error:", v9, a5);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a regular, non-shared-album asset. Creating an internal asset export request.", buf, 0xCu);

    }
    +[PHInternalAssetExportRequest exportRequestForAsset:variants:error:](PHInternalAssetExportRequest, "exportRequestForAsset:variants:error:", v9, v10, a5);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v13;

  return v16;
}

+ (BOOL)errorIsLowDiskSpaceRelated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 28)
    {
      v7 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(a1, "errorIsLowDiskSpaceRelated:", v12);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
LABEL_11:

  return v7;
}

+ (id)assetExportLog
{
  if (assetExportLog_onceToken != -1)
    dispatch_once(&assetExportLog_onceToken, &__block_literal_global_363);
  return (id)assetExportLog_assetExportLog;
}

void __38__PHAssetExportRequest_assetExportLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos", "PHAssetExportRequest");
  v1 = (void *)assetExportLog_assetExportLog;
  assetExportLog_assetExportLog = (uint64_t)v0;

}

@end
