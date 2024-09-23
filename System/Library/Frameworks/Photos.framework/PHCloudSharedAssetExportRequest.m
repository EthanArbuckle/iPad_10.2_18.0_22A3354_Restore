@implementation PHCloudSharedAssetExportRequest

- (PHCloudSharedAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4
{
  PHCloudSharedAssetExportRequest *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *imageManagerResultHandlerQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHCloudSharedAssetExportRequest;
  v4 = -[PHAssetExportRequest initWithAsset:variants:](&v9, sel_initWithAsset_variants_, a3, a4);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("PHCloudSharedAssetExportRequest.ImageManagerResultHandlerQueue", v5);
    imageManagerResultHandlerQueue = v4->_imageManagerResultHandlerQueue;
    v4->_imageManagerResultHandlerQueue = (OS_dispatch_queue *)v6;

  }
  return v4;
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetAvailability || isProcessingRequired"));

  }
  if (objc_msgSend(v13, "variant") != 1)
  {
    -[PHAssetExportRequest variants](self, "variants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "variant"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]"));

    }
  }
  if (a5)
    *a5 = 0;
  if (a4 || a6 || a7)
  {
    v18 = dispatch_semaphore_create(0);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__31499;
    v38 = __Block_byref_object_dispose__31500;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__31499;
    v32 = __Block_byref_object_dispose__31500;
    v33 = 0;
    -[PHAssetExportRequest asset](self, "asset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __115__PHCloudSharedAssetExportRequest_preflightExportWithOptions_assetAvailability_isProcessingRequired_fileURLs_info___block_invoke;
    v23[3] = &unk_1E35DD578;
    v25 = &v40;
    v26 = &v34;
    v27 = &v28;
    v20 = v18;
    v24 = v20;
    -[PHCloudSharedAssetExportRequest _requestFileURLsForAsset:withOptions:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestFileURLsForAsset:withOptions:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v19, v13, 0, 0, v23, self->_imageManagerResultHandlerQueue);

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
      *a4 = v41[3];
    if (a6)
      *a6 = objc_retainAutorelease((id)v35[5]);
    if (a7)
      *a7 = objc_retainAutorelease((id)v29[5]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }

}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
  -[PHCloudSharedAssetExportRequest exportWithOptions:networkAccessAllowed:completionHandler:](self, "exportWithOptions:networkAccessAllowed:completionHandler:", a3, 1, a4);
}

- (void)exportWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  if (objc_msgSend(v9, "variant") != 1)
  {
    -[PHAssetExportRequest variants](self, "variants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "variant"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]"));

    }
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAssetExportRequest.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[PHAssetExportRequest asset](self, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v16;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "[PHCloudSharedAssetExportRequest] Will export asset: %@, options: %@", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "_resourceRetrievingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke;
  block[3] = &unk_1E35DD5F0;
  block[4] = self;
  v23 = v9;
  v25 = a4;
  v24 = v10;
  v18 = v10;
  v19 = v9;
  dispatch_async(v17, block);

}

- (void)_requestFileURLsForAsset:(id)a3 withOptions:(id)a4 networkAccessAllowed:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7 resultHandlerQueue:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v21;

  v11 = a5;
  v21 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = objc_msgSend(v21, "playbackStyle");
  if ((unint64_t)(v18 - 1) < 2)
  {
LABEL_7:
    v19 = -[PHCloudSharedAssetExportRequest _requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v21, v11, v15, v16, v17);
    v20 = 136;
    goto LABEL_8;
  }
  if ((unint64_t)(v18 - 4) < 2)
  {
    v19 = -[PHCloudSharedAssetExportRequest _requestVideoURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestVideoURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v21, v11, v15, v16, v17);
    v20 = 140;
LABEL_8:
    *(_DWORD *)((char *)&self->super.super.isa + v20) = v19;
    goto LABEL_9;
  }
  if (v18 == 3)
  {
    if (v14 && (objc_msgSend(v14, "treatLivePhotoAsStill") & 1) == 0)
    {
      -[PHCloudSharedAssetExportRequest _requestLivePhotoURLsForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestLivePhotoURLsForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v21, v11, v15, v16, v17);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (int)_requestImageURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  PHImageRequestOptions *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  v15 = objc_alloc_init(PHImageRequestOptions);
  -[PHImageRequestOptions setVersion:](v15, "setVersion:", 0);
  -[PHImageRequestOptions setDeliveryMode:](v15, "setDeliveryMode:", 1);
  -[PHImageRequestOptions setNetworkAccessAllowed:](v15, "setNetworkAccessAllowed:", v9);
  -[PHImageRequestOptions setLoadingMode:](v15, "setLoadingMode:", 0x10000);
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  v23[3] = &unk_1E35DDA28;
  v24 = v11;
  v17 = v11;
  -[PHImageRequestOptions setProgressHandler:](v15, "setProgressHandler:", v23);
  -[PHImageRequestOptions setResultHandlerQueue:](v15, "setResultHandlerQueue:", v13);

  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v21[3] = &unk_1E35DD618;
  v22 = v12;
  v19 = v12;
  LODWORD(v16) = objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, 0, v15, v21, -1.0, -1.0);

  return v16;
}

- (int)_requestVideoURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  PHVideoRequestOptions *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  v15 = objc_alloc_init(PHVideoRequestOptions);
  -[PHVideoRequestOptions setVersion:](v15, "setVersion:", 0);
  -[PHVideoRequestOptions setRestrictToPlayableOnCurrentDevice:](v15, "setRestrictToPlayableOnCurrentDevice:", 1);
  -[PHVideoRequestOptions setDeliveryMode:](v15, "setDeliveryMode:", 1);
  -[PHVideoRequestOptions setNetworkAccessAllowed:](v15, "setNetworkAccessAllowed:", v9);
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  v23[3] = &unk_1E35DDA28;
  v24 = v11;
  v17 = v11;
  -[PHVideoRequestOptions setProgressHandler:](v15, "setProgressHandler:", v23);
  -[PHVideoRequestOptions setResultHandlerQueue:](v15, "setResultHandlerQueue:", v13);

  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v21[3] = &unk_1E35DD640;
  v22 = v12;
  v19 = v12;
  LODWORD(v16) = objc_msgSend(v18, "requestURLForVideo:options:resultHandler:", v14, v15, v21);

  return v16;
}

- (void)_requestLivePhotoURLsForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _BOOL4 v32;
  _QWORD block[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, void *, void *);
  void *v53;
  id v54;
  _QWORD v55[4];
  NSObject *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD v60[4];
  id v61;
  _QWORD *v62;
  _QWORD aBlock[4];
  id v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[4];
  _QWORD v76[5];

  v32 = a4;
  v11 = a3;
  v12 = a5;
  v31 = a6;
  v13 = a7;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v76[3] = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__31499;
  v73[4] = __Block_byref_object_dispose__31500;
  v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__31499;
  v71[4] = __Block_byref_object_dispose__31500;
  v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__31499;
  v69[4] = __Block_byref_object_dispose__31500;
  v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__31499;
  v67[4] = __Block_byref_object_dispose__31500;
  v68 = 0;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  aBlock[3] = &unk_1E35DD668;
  v65 = v76;
  v66 = v75;
  v15 = v12;
  v64 = v15;
  v16 = _Block_copy(aBlock);
  v17 = dispatch_group_create();
  v60[0] = v14;
  v60[1] = 3221225472;
  v60[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v60[3] = &unk_1E35DD690;
  v62 = v76;
  v18 = v16;
  v61 = v18;
  v19 = _Block_copy(v60);
  dispatch_group_enter(v17);
  v55[0] = v14;
  v55[1] = 3221225472;
  v55[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_3;
  v55[3] = &unk_1E35DD6B8;
  v57 = v76;
  v58 = v69;
  v59 = v73;
  v20 = v17;
  v56 = v20;
  v50 = v14;
  v51 = 3221225472;
  v52 = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_4;
  v53 = &unk_1E35DD6E0;
  v29 = _Block_copy(v55);
  v30 = v19;
  v54 = v29;
  v21 = v11;
  v22 = v13;
  self->_imageManagerImageRequestId = -[PHCloudSharedAssetExportRequest _requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v11);
  v47[0] = v14;
  v47[1] = 3221225472;
  v47[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_5;
  v47[3] = &unk_1E35DD690;
  v49 = v75;
  v23 = v18;
  v48 = v23;
  v24 = _Block_copy(v47);
  dispatch_group_enter(v20);
  v42[0] = v14;
  v42[1] = 3221225472;
  v42[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_6;
  v42[3] = &unk_1E35DD6B8;
  v44 = v75;
  v45 = v67;
  v46 = v71;
  v25 = v20;
  v43 = v25;
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_7;
  v40[3] = &unk_1E35DD6E0;
  v26 = _Block_copy(v42);
  v41 = v26;
  self->_imageManagerVideoRequestId = -[PHCloudSharedAssetExportRequest _requestVideoURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestVideoURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v21, v32, v24, v40, v22);
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_8;
  block[3] = &unk_1E35DD708;
  v36 = v73;
  v37 = v71;
  v38 = v69;
  v39 = v67;
  v34 = v15;
  v35 = v31;
  v27 = v31;
  v28 = v15;
  dispatch_group_notify(v25, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);

}

- (void)_handleImageManagerResultForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progress:(id)a5 processingUnitCount:(unint64_t)a6 options:(id)a7 withFileUrls:(id)a8 info:(id)a9 completionHandler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  const __CFString *v33;
  unint64_t v34;
  _BOOL4 v35;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v35 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHImageCancelledKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHImageCancelledKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

  }
  else
  {
    v22 = 0;
  }

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (__CFString *)v23;
  if (!v17 || v23 || !objc_msgSend(v17, "count"))
  {
    v34 = a6;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v35 || !v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v38 = v14;
        v39 = 2112;
        if (v35)
          v33 = CFSTR("YES");
        v40 = v33;
        v41 = 2112;
        v42 = v24;
        v29 = "[PHCloudSharedAssetExportRequest] Failed to download asset for export: %@, networkAccessAllowed: %@, error: %@";
        v30 = v28;
        v31 = OS_LOG_TYPE_ERROR;
        v32 = 32;
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v14;
      v39 = 2112;
      v40 = v24;
      v29 = "[PHCloudSharedAssetExportRequest] Asset available in cloud, but export request options specified no network "
            "access. Export: %@, error: %@";
      v30 = v28;
      v31 = OS_LOG_TYPE_DEFAULT;
      v32 = 22;
LABEL_15:
      _os_log_impl(&dword_1991EC000, v30, v31, v29, buf, v32);
    }

    a6 = v34;
  }
  -[PHAssetExportRequest handleResultWithFileURLs:cancelled:withError:forAsset:withOptions:progress:processingUnitCount:completionHandler:](self, "handleResultWithFileURLs:cancelled:withError:forAsset:withOptions:progress:processingUnitCount:completionHandler:", v17, v22, v24, v14, v16, v15, a6, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageManagerResultHandlerQueue, 0);
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (*(double *)(*(_QWORD *)(a1[5] + 8) + 24) + *(double *)(*(_QWORD *)(a1[6] + 8) + 24) < 1.0)
  {
    v4 = a1[4];
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

uint64_t __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 * 0.3;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x3FD3333333333333;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestPhotoFileURLKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_5(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 * 0.7;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x3FE6666666666666;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v2 = a1[4];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, char *, double))(v2 + 16))(v2, 0, &v19, 1.0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v3 && (v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)) != 0)
  {
    v21[0] = CFSTR("PHAssetExportRequestPhotoFileURLKey");
    v21[1] = CFSTR("PHAssetExportRequestVideoFileURLKey");
    v22[0] = v3;
    v22[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1[9] + 8) + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = CFSTR("PHAssetExportRequestVideoFileURLKey");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHImageFileURLKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PHAssetExportRequestPhotoFileURLKey"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, _QWORD, char *, double);
  id v12;
  id v13;
  void (**v14)(void *, id, id);
  uint64_t v15;
  _QWORD v16[5];
  char v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[3];
  char v24;
  id location;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "shouldStripLocation"))
    v4 = 10;
  else
    v4 = 0;
  objc_msgSend(v2, "setTotalUnitCount:", 100);
  v29 = 0;
  v30 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v28 = 0;
  objc_msgSend(v5, "preflightExportWithOptions:assetAvailability:isProcessingRequired:fileURLs:info:", v6, &v30, 0, &v29, &v28);
  v7 = v29;
  v8 = v28;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 140) = 0;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E35DD5A0;
  v10 = v2;
  v27 = v10;
  v11 = (void (**)(void *, _QWORD, char *, double))_Block_copy(aBlock);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_3;
  v18[3] = &unk_1E35DD5C8;
  v12 = v10;
  v19 = v12;
  v23[1] = (id)(100 - v4);
  objc_copyWeak(v23, &location);
  v13 = v3;
  v24 = *(_BYTE *)(a1 + 56);
  v20 = v13;
  v23[2] = (id)v4;
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v14 = (void (**)(void *, id, id))_Block_copy(v18);
  if (v30 == 1)
    v15 = 3;
  else
    v15 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", v15);
  if (!v30 && v7 && objc_msgSend(v7, "count"))
  {
    v17 = 0;
    v11[2](v11, 0, &v17, 1.0);
    v14[2](v14, v7, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestFileURLsForAsset:withOptions:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v13, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), v11, v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_4;
    v16[3] = &unk_1E35DF110;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "setCancellationHandler:", v16);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

uint64_t __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_2(uint64_t result, double a2)
{
  if ((uint64_t)llround(a2 * 100.0) <= 99)
    return objc_msgSend(*(id *)(result + 32), "setCompletedUnitCount:");
  return result;
}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "setCompletedUnitCount:", v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleImageManagerResultForAsset:networkAccessAllowed:progress:processingUnitCount:options:withFileUrls:info:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), v8, v7, *(_QWORD *)(a1 + 56));

}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelImageRequest:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 136));

  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 140));

}

void __115__PHCloudSharedAssetExportRequest_preflightExportWithOptions_assetAvailability_isProcessingRequired_fileURLs_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)_resourceRetrievingQueue
{
  if (_resourceRetrievingQueue_onceToken != -1)
    dispatch_once(&_resourceRetrievingQueue_onceToken, &__block_literal_global_31548);
  return (id)_resourceRetrievingQueue__sharedResourceRetrievingQueue;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  PHCloudSharedAssetExportRequest *v6;
  PHCloudSharedAssetExportRequest *v7;
  PHCloudSharedAssetExportRequest *v8;
  PHCloudSharedAssetExportRequest *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  PHCloudSharedAssetExportRequest *v17;
  __int16 v18;
  PHCloudSharedAssetExportRequest *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = (PHCloudSharedAssetExportRequest *)a3;
  v7 = v6;
  if (v6
    && ((-[PHCloudSharedAssetExportRequest isCloudSharedAsset](v6, "isCloudSharedAsset") & 1) != 0
     || (-[PHCloudSharedAssetExportRequest isStreamedVideo](v7, "isStreamedVideo") & 1) != 0))
  {
    objc_msgSend(a1, "variantsForAsset:asUnmodifiedOriginal:error:", v7, 0, 0);
    v8 = (PHCloudSharedAssetExportRequest *)objc_claimAutoreleasedReturnValue();
    v9 = -[PHCloudSharedAssetExportRequest initWithAsset:variants:]([PHCloudSharedAssetExportRequest alloc], "initWithAsset:variants:", v7, v8);
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "[PHCloudSharedAssetExportRequest] Created export request: %@ for asset: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Asset %@ is not available or not supported by PHCloudSharedAssetExportRequest.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PHAssetExportRequestCloudSharedAssetExportRequestErrorDomain"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PHAssetExportRequestError(0, v13);
    v8 = (PHCloudSharedAssetExportRequest *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "[PHCloudSharedAssetExportRequest] Failed to create export request for asset: %@, error: %@", (uint8_t *)&v16, 0x16u);
    }

    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHCloudSharedAssetExportRequest.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v12 = &unk_1E3655FC0;
  objc_msgSend(v7, "uniformTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __59__PHCloudSharedAssetExportRequest__resourceRetrievingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PHCloudSharedAssetExportRequest.SharedResourceRetrievingQueue", v2);
  v1 = (void *)_resourceRetrievingQueue__sharedResourceRetrievingQueue;
  _resourceRetrievingQueue__sharedResourceRetrievingQueue = (uint64_t)v0;

}

@end
