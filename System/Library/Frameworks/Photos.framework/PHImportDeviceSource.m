@implementation PHImportDeviceSource

- (PHImportDeviceSource)initWithDevice:(id)a3
{
  id v5;
  PHImportDeviceSource *v6;
  PHImportDeviceSource *v7;
  uint64_t v8;
  NSMutableDictionary *assetByCameraFile;
  dispatch_queue_t v10;
  OS_dispatch_queue *assetByCameraFileAccess;
  ICCameraDeviceRemovedItemsCoalescer *v12;
  uint64_t v13;
  ICCameraDeviceRemovedItemsCoalescer *removalCoalescer;
  dispatch_queue_t v15;
  OS_dispatch_queue *deleteEjectQueue;
  NSMutableArray *v17;
  NSMutableArray *assetThumbnailRequests;
  NSMutableArray *v19;
  NSMutableArray *assetMetadataRequests;
  NSMutableArray *v21;
  NSMutableArray *assetThumbnailHighPriorityRequests;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *assetDataRequestQueue;
  uint64_t v27;
  NSMapTable *assetDataRequestsByCameraItem;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id location;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PHImportDeviceSource;
  v6 = -[PHImportSource init](&v36, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_camera, a3);
    objc_msgSend(v5, "setDelegate:", v7);
    v8 = objc_opt_new();
    assetByCameraFile = v7->_assetByCameraFile;
    v7->_assetByCameraFile = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_create("assetByCameraFile access", 0);
    assetByCameraFileAccess = v7->_assetByCameraFileAccess;
    v7->_assetByCameraFileAccess = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v7);
    v12 = [ICCameraDeviceRemovedItemsCoalescer alloc];
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __39__PHImportDeviceSource_initWithDevice___block_invoke;
    v33 = &unk_1E35DAD98;
    objc_copyWeak(&v34, &location);
    v13 = -[ICCameraDeviceRemovedItemsCoalescer initWithSource:block:](v12, "initWithSource:block:", v7, &v30);
    removalCoalescer = v7->_removalCoalescer;
    v7->_removalCoalescer = (ICCameraDeviceRemovedItemsCoalescer *)v13;

    v15 = dispatch_queue_create("Import Asset Delete/Eject", 0);
    deleteEjectQueue = v7->_deleteEjectQueue;
    v7->_deleteEjectQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetThumbnailRequests = v7->_assetThumbnailRequests;
    v7->_assetThumbnailRequests = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetMetadataRequests = v7->_assetMetadataRequests;
    v7->_assetMetadataRequests = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetThumbnailHighPriorityRequests = v7->_assetThumbnailHighPriorityRequests;
    v7->_assetThumbnailHighPriorityRequests = v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, -1);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.photos.import.devicesource.assetdatarequests", v24);
    assetDataRequestQueue = v7->_assetDataRequestQueue;
    v7->_assetDataRequestQueue = (OS_dispatch_queue *)v25;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v30, v31, v32, v33);
    v27 = objc_claimAutoreleasedReturnValue();
    assetDataRequestsByCameraItem = v7->_assetDataRequestsByCameraItem;
    v7->_assetDataRequestsByCameraItem = (NSMapTable *)v27;

    -[PHImportSource setSourceAccessState:](v7, "setSourceAccessState:", 0);
    -[PHImportSource setOpen:](v7, "setOpen:", 1);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)uuid
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[ICCameraDevice UUIDString](self->_camera, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceSource;
    -[PHImportSource uuid](&v8, sel_uuid);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)fetchThumbnailDataUsingRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *assetDataRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PHImportDeviceSource *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  assetDataRequestQueue = self->_assetDataRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PHImportDeviceSource_fetchThumbnailDataUsingRequest_withCompletion___block_invoke;
  block[3] = &unk_1E35DF3B8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(assetDataRequestQueue, block);

}

- (void)sendNextThumbnailRequest
{
  NSMutableArray **p_assetThumbnailHighPriorityRequests;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PHImportDeviceSource *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  PHImportDeviceSource *v38;
  id v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetDataRequestQueue);
  v34 = self;
  p_assetThumbnailHighPriorityRequests = &self->_assetThumbnailHighPriorityRequests;
  if (!-[NSMutableArray count](*p_assetThumbnailHighPriorityRequests, "count"))
    p_assetThumbnailHighPriorityRequests = &v34->_assetThumbnailRequests;
  v4 = *p_assetThumbnailHighPriorityRequests;
  v33 = *MEMORY[0x1E0CBC248];
  v32 = *MEMORY[0x1E0CBC240];
  v31 = *MEMORY[0x1E0CB2938];
  while (-[NSMutableArray count](v4, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](v4, "removeObjectAtIndex:", 0);
    objc_msgSend(v5, "requestAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completionHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
    if (!v7 || !v8)
    {
      PLImportGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = _Block_copy(v9);
        *(_DWORD *)buf = 138412546;
        v47 = v7;
        v48 = 2112;
        v49 = (uint64_t)v11;
        _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Expect to have non-nil cameraFile and completionHandler: %@, %@", buf, 0x16u);

      }
    }
    v12 = objc_msgSend(v5, "isCanceled");
    PLImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14)
      {
        objc_msgSend(v7, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "longestSide");
        *(_DWORD *)buf = 138412802;
        v47 = v15;
        v48 = 2048;
        v49 = v16;
        v50 = 2048;
        v51 = v5;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "THMB CNCL: %@ (%lu) <%p>", buf, 0x20u);

      }
      if (!v9)
        goto LABEL_19;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v44 = v31;
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "fileName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Request for thumbnail for %@ was canceled."), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, void *))v9)[2](v9, 0, v5, v22);

    }
    else
    {
      if (v14)
      {
        objc_msgSend(v7, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v5, "longestSide");
        *(_DWORD *)buf = 138412802;
        v47 = v23;
        v48 = 2048;
        v49 = v24;
        v50 = 2048;
        v51 = v5;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "THMB SEND: %@ (%lu) <%p>", buf, 0x20u);

      }
      v34->_waitingForAssetThumbnailRequest = 1;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v26 = v25;
      v42[0] = v33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "longestSide"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v32;
      v43[0] = v27;
      v43[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke;
      v35[3] = &unk_1E35DADF0;
      v29 = v7;
      v36 = v29;
      v30 = v5;
      v41 = v26;
      v37 = v30;
      v38 = v34;
      v39 = v6;
      v40 = v9;
      objc_msgSend(v29, "requestThumbnailDataWithOptions:completion:", v28, v35);

      v19 = v36;
    }

LABEL_19:
    if ((v12 & 1) == 0)
      break;
  }

}

- (void)fetchMetadataUsingRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *assetDataRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PHImportDeviceSource *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  assetDataRequestQueue = self->_assetDataRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PHImportDeviceSource_fetchMetadataUsingRequest_withCompletion___block_invoke;
  block[3] = &unk_1E35DF3B8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(assetDataRequestQueue, block);

}

- (void)sendNextMetadataRequest
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetDataRequestQueue);
  v27 = *MEMORY[0x1E0CB2938];
  do
  {
    if (!-[NSMutableArray count](self->_assetMetadataRequests, "count"))
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_assetMetadataRequests, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_assetMetadataRequests, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "requestAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "representedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isCanceled");
    v8 = v7;
    if (v7)
    {
      PLImportGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v10;
        v34 = 2048;
        v35 = v3;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "META CNCL: %@ <%p>", buf, 0x16u);

      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v30 = v27;
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "fileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Request for metadata for %@ was canceled."), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -4, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, void *))v6)[2](v6, 0, v3, v16);

    }
    else
    {
      objc_msgSend(v3, "requestAsset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_12;
      PLImportGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "requestAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "representedObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v22;
        v34 = 2048;
        v35 = v3;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "META CACH: %@ <%p>", buf, 0x16u);

      }
      if (v6)
      {
        objc_msgSend(v3, "requestAsset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "metadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, _QWORD))v6)[2](v6, v24, v3, 0);

      }
      else
      {
LABEL_12:
        PLImportGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          v34 = 2048;
          v35 = v3;
          _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "META SEND: %@ <%p>", buf, 0x16u);

        }
        self->_waitingForAssetMetadataRequest = 1;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke;
        v28[3] = &unk_1E35DAE18;
        v28[4] = self;
        v29 = v6;
        -[PHImportDeviceSource fetchMetadataForRequest:importAsset:completion:](self, "fetchMetadataForRequest:importAsset:completion:", v3, v4, v28);

      }
    }

  }
  while ((v8 & 1) != 0);
}

- (void)fetchMetadataForRequest:(id)a3 importAsset:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  PHImportDeviceSource *v21;
  id v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "representedObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke;
  v17[3] = &unk_1E35DAE68;
  v18 = v11;
  v19 = v8;
  v23 = v12;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  objc_msgSend(v16, "requestMetadataDictionaryWithOptions:completion:", MEMORY[0x1E0C9AA70], v17);

}

- (void)cameraDevice:(id)a3 setAccessState:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  PHImportDeviceSource *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  PHImportDeviceSource *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4 == 2)
  {
    if (-[PHImportSource sourceAccessState](self, "sourceAccessState") != 2)
    {
      PLImportGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[PHImportDeviceSource camera](self, "camera");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v13;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "Notifying observers that %@ is unlocked", buf, 0xCu);

      }
      -[PHImportSource setSourceAccessState:](self, "setSourceAccessState:", 2);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke_63;
      v17 = &unk_1E35DAE90;
      v18 = self;
      v10 = &v14;
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 != 1)
    {
      -[PHImportSource setSourceAccessState:](self, "setSourceAccessState:", 0);
      goto LABEL_13;
    }
    if (-[PHImportSource sourceAccessState](self, "sourceAccessState") != 1)
    {
      PLImportGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[PHImportDeviceSource camera](self, "camera");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Notifying observers that %@ is locked", buf, 0xCu);

      }
      -[PHImportSource setSourceAccessState:](self, "setSourceAccessState:", 1);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke;
      v22 = &unk_1E35DAE90;
      v23 = self;
      v10 = &v19;
LABEL_11:
      -[PHImportSource notifyObserversUsingBlock:](self, "notifyObserversUsingBlock:", v10, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
LABEL_13:

}

- (void)beginProcessingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ICEnumerationPrioritizeSpeed"));
  if (-[PHImportSource assetLoadOrder](self, "assetLoadOrder"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportSource assetLoadOrder](self, "assetLoadOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ICEnumerationChronologicalOrder"));

  }
  PLImportGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[PHImportDeviceSource camera](self, "camera");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_INFO, "Requesting session open for device %@", buf, 0xCu);

  }
  -[PHImportDeviceSource camera](self, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaPresentation:", 2);

  -[PHImportDeviceSource camera](self, "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PHImportDeviceSource_beginProcessingWithCompletion___block_invoke;
  v13[3] = &unk_1E35DAEB8;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "requestOpenSessionWithOptions:completion:", v5, v13);

}

- (id)importAssetForCameraFile:(id)a3 create:(BOOL)a4
{
  id v6;
  NSObject *assetByCameraFileAccess;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PHImportDeviceSource *v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23598;
  v20 = __Block_byref_object_dispose__23599;
  v21 = 0;
  assetByCameraFileAccess = self->_assetByCameraFileAccess;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PHImportDeviceSource_importAssetForCameraFile_create___block_invoke;
  v11[3] = &unk_1E35DAEE0;
  v13 = self;
  v14 = &v16;
  v12 = v6;
  v15 = a4;
  v8 = v6;
  dispatch_sync(assetByCameraFileAccess, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)removeAssetForCameraFile:(id)a3
{
  id v4;
  NSObject *assetByCameraFileAccess;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  assetByCameraFileAccess = self->_assetByCameraFileAccess;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PHImportDeviceSource_removeAssetForCameraFile___block_invoke;
  block[3] = &unk_1E35DF9E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(assetByCameraFileAccess, block);

}

- (id)assetsByProcessingItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[PHImportDeviceSource importAssetForCameraFile:create:](self, "importAssetForCameraFile:create:", v4, 1),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "addObject:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "sidecarFiles", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          +[PHImportDeviceAsset assetFileForFile:source:](PHImportDeviceAsset, "assetFileForFile:source:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), self);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            if (objc_msgSend(v13, "isSidecar"))
            {
              if (objc_msgSend(v14, "resourceSubType") != 512)
                objc_msgSend(v5, "insertObject:atIndex:", v14, 0);
            }
            else
            {
              objc_msgSend(v5, "addObject:", v14);
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v10);
    }
  }
  else
  {
    PLImportGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "UNSUPPORTED asset '%@'", buf, 0xCu);

    }
    objc_msgSend(0, "fileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 1, v8, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceSource.m", 396);
    v7 = 0;
  }

LABEL_21:
  if (objc_msgSend(v5, "count"))
  {
    -[PHImportSource processAssets:](self, "processAssets:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[5];
  id v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v6 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLImportGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_msgSend(v8, "count");
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = _Block_copy(v9);
    *(_DWORD *)buf = 136316162;
    v35 = "-[PHImportDeviceSource deleteImportAssets:isConfirmed:atEnd:]";
    v36 = 2048;
    v37 = v8;
    v38 = 2048;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2048;
    v43 = v13;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "%s - %p[%lu], %@, %p", buf, 0x34u);

  }
  -[PHImportDeviceSource deleteProgress](self, "deleteProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2938];
    v33 = CFSTR("A delete action is already in progress.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = -7;
  }
  else if (v6)
  {
    if (objc_msgSend(v8, "count"))
    {
LABEL_16:
      -[PHImportDeviceSource deleteEjectQueue](self, "deleteEjectQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke;
      block[3] = &unk_1E35DF3B8;
      block[4] = self;
      v26 = v8;
      v27 = v9;
      dispatch_sync(v23, block);

      -[PHImportDeviceSource deleteProgress](self, "deleteProgress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      goto LABEL_17;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    v29 = CFSTR("Requested delete of content but provided no content");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    v18 = -2;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2938];
    v31 = CFSTR("Requested delete of content without indicating user confirmation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    v18 = -1;
  }
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), v18, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_16;
  if (v9)
    (*((void (**)(id, void *))v9 + 2))(v9, v21);
  v22 = 0;
LABEL_17:

  return v22;
}

- (id)cameraFilesForAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "cameraFiles", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)name
{
  void *v2;
  void *v3;

  -[PHImportDeviceSource camera](self, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)productKind
{
  return (id)-[ICCameraDevice productKind](self->_camera, "productKind");
}

- (BOOL)isCamera
{
  return 1;
}

- (id)path
{
  return 0;
}

- (CGImage)icon
{
  void *v2;
  CGImage *v3;

  -[PHImportDeviceSource camera](self, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "icon");

  return v3;
}

- (id)iconSymbolName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PHImportDeviceSource camera](self, "camera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemSymbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PHImportDeviceSource productKind](self, "productKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isAppleDevice
{
  void *v2;
  char v3;

  -[PHImportDeviceSource camera](self, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleDevice");

  return v3;
}

- (BOOL)canDeleteContent
{
  return !-[ICCameraDevice isLocked](self->_camera, "isLocked");
}

- (BOOL)isOptimizedCPLStorage
{
  return -[ICCameraDevice iCloudPhotosOptimizeStorageState](self->_camera, "iCloudPhotosOptimizeStorageState") == 1;
}

- (BOOL)canAutolaunch
{
  return 1;
}

- (BOOL)canEject
{
  void *v2;
  char v3;

  -[ICCameraDevice capabilities](self->_camera, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0CBC230]);

  return v3;
}

- (BOOL)isConnectedDevice
{
  return 1;
}

- (id)volumePath
{
  return 0;
}

- (BOOL)isDeleting
{
  void *v2;
  BOOL v3;

  -[PHImportDeviceSource deleteProgress](self, "deleteProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)eject
{
  NSObject *v3;
  _QWORD block[5];

  -[PHImportDeviceSource deleteEjectQueue](self, "deleteEjectQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PHImportDeviceSource_eject__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isAvailable
{
  void *v3;

  +[PHImportController sharedInstance](PHImportController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "sourceIsConnected:", self);

  return (char)self;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)containsSupportedMedia:(id *)a3
{
  return 1;
}

- (void)deviceDidBecomeReadyWithCompleteContentCatalog:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLImportGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PHImportDeviceSource deviceDidBecomeReadyWithCompleteContentCatalog:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "%s - %@", (uint8_t *)&v7, 0x16u);

  }
  -[PHImportSource stopAssetLoading](self, "stopAssetLoading");

}

- (void)didRemoveDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PHImportDeviceSource camera](self, "camera");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PHImportSource progress](self, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[PHImportDeviceSource camera](self, "camera");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaFiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportDeviceSource _removeCameraFiles:](self, "_removeCameraFiles:", v7);

  }
}

- (void)deviceDidBecomeReady:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PHImportDeviceSource_deviceDidBecomeReady___block_invoke;
  v3[3] = &unk_1E35DAE90;
  v3[4] = self;
  -[PHImportSource notifyObserversUsingBlock:](self, "notifyObserversUsingBlock:", v3);
}

- (void)cameraDevice:(id)a3 didAddItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[PHImportSource addItems:](self, "addItems:", v6);
}

- (void)cameraDevice:(id)a3 didRemoveItems:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PLImportGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = &stru_1E35DFFF8;
    if ((unint64_t)objc_msgSend(v7, "count") <= 1)
      v11 = &stru_1E35DFFF8;
    else
      v11 = CFSTR("s");
    v12 = objc_msgSend(v7, "count");
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "valueForKey:", CFSTR("name"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR(" [%@]"), v5);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 136315906;
    v18 = "-[PHImportDeviceSource cameraDevice:didRemoveItems:]";
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "%s - %lu asset%@ were removed%@", buf, 0x2Au);
    if (v12)
    {

    }
  }

  if (objc_msgSend(v7, "count"))
  {
    -[PHImportDeviceSource _removeCameraFiles:](self, "_removeCameraFiles:", v7);
  }
  else
  {
    PLImportGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[PHImportDeviceSource camera](self, "camera");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "ImageCapture told us that the device '%@' removed no items ... weird!", buf, 0xCu);

    }
  }

}

- (void)cameraDeviceDidChangeCapability:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PHImportDeviceSource_cameraDeviceDidChangeCapability___block_invoke;
  v3[3] = &unk_1E35DAE90;
  v3[4] = self;
  -[PHImportSource notifyObserversUsingBlock:](self, "notifyObserversUsingBlock:", v3);
}

- (void)cameraDeviceDidEnableAccessRestriction:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[PHImportDeviceSource camera](self, "camera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_INFO, "%@ state changed to passcode locked", (uint8_t *)&v8, 0xCu);

  }
  -[PHImportDeviceSource camera](self, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDeviceSource cameraDevice:setAccessState:](self, "cameraDevice:setAccessState:", v7, 1);

}

- (void)cameraDeviceDidRemoveAccessRestriction:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[PHImportDeviceSource camera](self, "camera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_INFO, "%@ state chaged to unlocked", (uint8_t *)&v8, 0xCu);

  }
  -[PHImportDeviceSource camera](self, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDeviceSource cameraDevice:setAccessState:](self, "cameraDevice:setAccessState:", v7, 2);

}

- (void)deviceFinishedEnumeratingItems:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2080;
    v9 = "-[PHImportDeviceSource deviceFinishedEnumeratingItems:]";
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "%@ [%s]", (uint8_t *)&v6, 0x16u);

  }
}

- (void)_removeCameraFiles:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDeviceSource deleteEjectQueue](self, "deleteEjectQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PHImportDeviceSource__removeCameraFiles___block_invoke;
  block[3] = &unk_1E35DFAF8;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (OS_dispatch_queue)deleteEjectQueue
{
  return self->_deleteEjectQueue;
}

- (void)setDeleteEjectQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deleteEjectQueue, a3);
}

- (ICCameraDeviceRemovedItemsCoalescer)removalCoalescer
{
  return self->_removalCoalescer;
}

- (void)setRemovalCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_removalCoalescer, a3);
}

- (NSMutableSet)removedCameraFiles
{
  return self->_removedCameraFiles;
}

- (void)setRemovedCameraFiles:(id)a3
{
  objc_storeStrong((id *)&self->_removedCameraFiles, a3);
}

- (BOOL)isEjecting
{
  return self->_isEjecting;
}

- (void)setIsEjecting:(BOOL)a3
{
  self->_isEjecting = a3;
}

- (BOOL)ejectAfterDelete
{
  return self->_ejectAfterDelete;
}

- (void)setEjectAfterDelete:(BOOL)a3
{
  self->_ejectAfterDelete = a3;
}

- (NSMutableDictionary)assetByCameraFile
{
  return self->_assetByCameraFile;
}

- (void)setAssetByCameraFile:(id)a3
{
  objc_storeStrong((id *)&self->_assetByCameraFile, a3);
}

- (OS_dispatch_queue)assetByCameraFileAccess
{
  return self->_assetByCameraFileAccess;
}

- (void)setAssetByCameraFileAccess:(id)a3
{
  objc_storeStrong((id *)&self->_assetByCameraFileAccess, a3);
}

- (NSProgress)deleteProgress
{
  return self->_deleteProgress;
}

- (void)setDeleteProgress:(id)a3
{
  objc_storeStrong((id *)&self->_deleteProgress, a3);
}

- (NSArray)avchdAssets
{
  return self->_avchdAssets;
}

- (void)setAvchdAssets:(id)a3
{
  objc_storeStrong((id *)&self->_avchdAssets, a3);
}

- (ICCameraDevice)camera
{
  return (ICCameraDevice *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCamera:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_avchdAssets, 0);
  objc_storeStrong((id *)&self->_deleteProgress, 0);
  objc_storeStrong((id *)&self->_assetByCameraFileAccess, 0);
  objc_storeStrong((id *)&self->_assetByCameraFile, 0);
  objc_storeStrong((id *)&self->_removedCameraFiles, 0);
  objc_storeStrong((id *)&self->_removalCoalescer, 0);
  objc_storeStrong((id *)&self->_deleteEjectQueue, 0);
  objc_storeStrong((id *)&self->_assetDataRequestQueue, 0);
  objc_storeStrong((id *)&self->_assetDataRequestsByCameraItem, 0);
  objc_storeStrong((id *)&self->_assetThumbnailHighPriorityRequests, 0);
  objc_storeStrong((id *)&self->_assetMetadataRequests, 0);
  objc_storeStrong((id *)&self->_assetThumbnailRequests, 0);
}

uint64_t __43__PHImportDeviceSource__removeCameraFiles___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t result;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "valueForKey:", CFSTR("PHImportFileUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSourceFileIdentifiersForRemovedFiles:", v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a1[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1[4], "importAssetForCameraFile:create:", v9, 0, (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(a1[6], "addObject:", v10);
            objc_msgSend(a1[4], "removeAssetForCameraFile:", v9);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(a1[6], "count"))
  {
    objc_msgSend(a1[4], "removalCoalescer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coalesceItems:", a1[6]);

  }
  result = objc_msgSend(a1[4], "isDeleting", (_QWORD)v14);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a1[4], "ejectAfterDelete");
    if ((_DWORD)result)
    {
      objc_msgSend(a1[4], "camera");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "requestEject");

      return objc_msgSend(a1[4], "setIsEjecting:", 1);
    }
  }
  return result;
}

uint64_t __56__PHImportDeviceSource_cameraDeviceDidChangeCapability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capabilitiesDidChangeForImportSource:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__PHImportDeviceSource_deviceDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capabilitiesDidChangeForImportSource:", *(_QWORD *)(a1 + 32));
}

void __29__PHImportDeviceSource_eject__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEjecting") & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "isDeleting");
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3, "setEjectAfterDelete:", 1);
    }
    else
    {
      objc_msgSend(v3, "camera");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "requestEject");

    }
  }
}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEjecting") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraFilesForAssets:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "DELETE: Requesting delete of %lu assets", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "camera");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_88;
    v9 = &unk_1E35DAF48;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v4, "requestDeleteFiles:deleteFailed:completion:", v2, &__block_literal_global_23582, &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDeleteProgress:", v5, v6, v7, v8, v9, v10);

  }
}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  int v23;
  __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0CBC228];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC228]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    PLImportGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "DELETE: %@\nThe following files failed to delete:\n%@", (uint8_t *)&v23, 0x16u);

    }
  }
  v14 = *MEMORY[0x1E0CBC220];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC220]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    PLImportGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "\nDELETE: %@\nThe following files were not deleted:\n%@", (uint8_t *)&v23, 0x16u);

    }
  }
  PLImportGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    v22 = CFSTR("none");
    if (v6)
      v22 = v6;
    v23 = 134218242;
    v24 = (__CFString *)v21;
    v25 = 2112;
    v26 = v22;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "DELETE: Deleted Count: %lu, Deleted Error: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDeleteProgress:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_86(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_ERROR, "Failed to delete %@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__PHImportDeviceSource_removeAssetForCameraFile___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "assetByCameraFile");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __56__PHImportDeviceSource_importAssetForCameraFile_create___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetByCameraFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && *(_BYTE *)(a1 + 56))
  {
    +[PHImportDeviceAsset assetFileForFile:source:](PHImportDeviceAsset, "assetFileForFile:source:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v9, "assetByCameraFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
}

void __54__PHImportDeviceSource_beginProcessingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v6;
    v9 = 2;
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "code") == -9943)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = 1;
LABEL_5:
    objc_msgSend(v7, "cameraDevice:setAccessState:", v8, v9);

    goto LABEL_9;
  }
  PLImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Received error from -[ICCameraDevice requestOpenSessionWithOptions:completion:]: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_9:
  PLImportGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "camera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "code");
    v16 = CFSTR("unlocked");
    if (v15 == -9943)
      v16 = CFSTR("locked");
    v17 = 138412546;
    v18 = v14;
    v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "Open session for %@ completed. Device is %{public}@", (uint8_t *)&v17, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userRequiredToTrustHostForImportSource:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke_63(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userHasTrustedHostForImportSource:", *(_QWORD *)(a1 + 32));
}

void __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  PLImportGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11 = v10 - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138412802;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 2048;
    v26 = v11;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "META COMP: %@ <%p> (%gs)", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "createMetadataFromProperties:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setMetadata:", v12);
  objc_msgSend(*(id *)(a1 + 32), "flushMetadataCache");
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == *(void **)(a1 + 48))
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(uint64_t, void *, _QWORD, id))(v16 + 16))(v16, v12, *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke_60;
    v17[3] = &unk_1E35DAE40;
    v15 = *(void **)(a1 + 56);
    v20 = *(id *)(a1 + 64);
    v18 = v12;
    v19 = v5;
    objc_msgSend(v15, "fetchMetadataForRequest:importAsset:completion:", v14, v13, v17);

  }
}

uint64_t __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke_60(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, a1[4], a3, a1[5]);
  return result;
}

void __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke_2;
  block[3] = &unk_1E35DF110;
  block[4] = v10;
  dispatch_async(v11, block);
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);

}

uint64_t __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 352) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendNextMetadataRequest");
}

void __65__PHImportDeviceSource_fetchMetadataUsingRequest_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    PLImportGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "requestAsset");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "representedObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v35 = v5;
      v36 = 2048;
      v37 = v6;
      _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "META CNCL: %@ <%p>", buf, 0x16u);

    }
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2938];
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Request for thumbnail for %@ was canceled."), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v7 + 16))(v7, 0, v8, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestAsset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_10;
    PLImportGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "requestAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "representedObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v35 = v21;
      v36 = 2048;
      v37 = v22;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "META CACH: %@ <%p>", buf, 0x16u);

    }
    v23 = *(_QWORD *)(a1 + 48);
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestAsset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "metadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v23 + 16))(v23, v25, *(_QWORD *)(a1 + 32), 0);

    }
    else
    {
LABEL_10:
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "requestAsset");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "representedObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v35 = v29;
        v36 = 2048;
        v37 = v30;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "META QUED: %@ <%p>", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "addObject:", *(_QWORD *)(a1 + 32));
      v31 = *(_BYTE **)(a1 + 40);
      if (!v31[352])
        objc_msgSend(v31, "sendNextMetadataRequest");
    }
  }
}

void __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLImportGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 40), "longestSide");
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12 = v11 - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138413058;
    v27 = v8;
    v28 = 2048;
    v29 = v9;
    v30 = 2048;
    v31 = v10;
    v32 = 2048;
    v33 = v12;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "THMB COMP: %@ (%lu) <%p> (%gs)", buf, 0x2Au);

  }
  if (!v5)
  {
    PLImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "WARNING: ICC returned nil image data for %@ <%p>", buf, 0x16u);

    }
  }
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_55;
  v22[3] = &unk_1E35DADC8;
  v22[4] = v16;
  v18 = *(_QWORD *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v24 = v6;
  v25 = v19;
  v23 = v5;
  v20 = v6;
  v21 = v5;
  objc_msgSend(v16, "fetchMetadataForRequest:importAsset:completion:", v17, v18, v22);

}

void __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_55(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[5];

  v4 = a3;
  v5 = a1[4];
  v6 = *(NSObject **)(v5 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_2;
  block[3] = &unk_1E35DF110;
  block[4] = v5;
  dispatch_async(v6, block);
  v7 = a1[7];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v7 + 16))(v7, a1[5], v4, a1[6]);

}

uint64_t __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendNextThumbnailRequest");
}

void __70__PHImportDeviceSource_fetchThumbnailDataUsingRequest_withCompletion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int *v25;
  _BYTE *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestAsset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "representedObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "longestSide");
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v30 = v7;
      v31 = 2048;
      v32 = v8;
      v33 = 2048;
      v34 = v9;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "THMB CNCL: %@ (%lu) <%p>", buf, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2938];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "asset");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Request for thumbnail for %@ was canceled."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v10 + 16))(v10, 0, v11, v18);

  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "representedObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(*(id *)(a1 + 32), "longestSide");
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v30 = v21;
      v31 = 2048;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "THMB QUED: %@ (%lu) <%p>", buf, 0x20u);

    }
    v24 = objc_msgSend(*(id *)(a1 + 32), "priority");
    v25 = &OBJC_IVAR___PHImportDeviceSource__assetThumbnailRequests;
    if (v24 == 1)
      v25 = &OBJC_IVAR___PHImportDeviceSource__assetThumbnailHighPriorityRequests;
    v14 = *(id *)(*(_QWORD *)(a1 + 40) + *v25);
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 32));
    v26 = *(_BYTE **)(a1 + 40);
    if (!v26[336])
      objc_msgSend(v26, "sendNextThumbnailRequest");
  }

}

void __39__PHImportDeviceSource_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "removeAssets:", v3);

}

@end
