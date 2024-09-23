@implementation CKMediaObjectImageProvider

- (CKMediaObjectImageProvider)init
{
  CKMediaObjectImageProvider *v2;
  CKMediaObjectImageProvider *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lock_requestDetailsByRequestID;
  NSMutableDictionary *v6;
  NSMutableDictionary *lock_mediaObjectsPendingTransferFinalizationByRequestID;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_activeRequestIDsByTransferGUID;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKMediaObjectImageProvider;
  v2 = -[CKMediaObjectImageProvider init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_requestDetailsByRequestID = v3->_lock_requestDetailsByRequestID;
    v3->_lock_requestDetailsByRequestID = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_mediaObjectsPendingTransferFinalizationByRequestID = v3->_lock_mediaObjectsPendingTransferFinalizationByRequestID;
    v3->_lock_mediaObjectsPendingTransferFinalizationByRequestID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_activeRequestIDsByTransferGUID = v3->_lock_activeRequestIDsByTransferGUID;
    v3->_lock_activeRequestIDsByTransferGUID = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__handlePreviewDidChangeNotification_, CFSTR("CKPreviewDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__handleFileTransferDidChangeNotification_, CFSTR("CKFileTransferUpdatedNotification"), 0);

  }
  return v3;
}

- (int64_t)numberOfOutstandingHandlers
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_lock_requestDetailsByRequestID, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  id v16;
  void *v17;
  void *v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  os_unfair_lock_s *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  CKMediaRequestDetails *v32;
  CKMediaRequestDetails *v33;
  NSMutableDictionary *lock_requestDetailsByRequestID;
  void *v35;
  id v37;
  os_unfair_lock_t locka;
  os_unfair_lock_t lock;
  char *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  void (**v45)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  os_unfair_lock_t v49;
  uint64_t v50;
  _QWORD v51[3];

  height = a4.height;
  width = a4.width;
  v51[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v13;
    _PhotoKitAssetForMediaObjectAsset(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      _PhotoKitMediaProvider();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, a5, v14, v15, width, height);

    }
    else
    {
      do
        LODWORD(v19) = __ldaxr((unsigned int *)&_makeNextRequestID_lastRequestID);
      while (__stlxr(v19 + 1, (unsigned int *)&_makeNextRequestID_lastRequestID));
      objc_msgSend(v16, "mediaObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (int)v19;
      -[CKMediaObjectImageProvider _imagePreviewForMediaObject:isSynchronous:requestID:](self, "_imagePreviewForMediaObject:isSynchronous:requestID:", v42, objc_msgSend(v14, "isSynchronous"), (int)v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v19);
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "transferGUID");
            v24 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v23;
            v48 = 2112;
            v49 = v24;
            _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Got non-nil UIImage preview for %@-%@, calling result handler", buf, 0x16u);

          }
        }
        v15[2](v15, v21, 0);
      }
      else if ((objc_msgSend(v14, "isSynchronous") & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v19);
            v40 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "transferGUID");
            *(_DWORD *)buf = 138412546;
            v47 = v40;
            v48 = 2112;
            locka = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();
            v49 = locka;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Got nil preview for %@-%@, deferring result handler", buf, 0x16u);

          }
        }
        lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        objc_msgSend(v42, "transferGUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_activeRequestIDsByTransferGUID, "objectForKeyedSubscript:", v41);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "addIndex:", (int)v19);
          }
          else
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", (int)v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_activeRequestIDsByTransferGUID, "setObject:forKeyedSubscript:", v27, v41);
          }

        }
        objc_msgSend(v14, "resultHandlerQueue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          v30 = (id)MEMORY[0x1E0C80D38];
          v31 = MEMORY[0x1E0C80D38];
        }

        v32 = [CKMediaRequestDetails alloc];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v43[3] = &unk_1E2759FC8;
        v44 = v30;
        v45 = v15;
        v37 = v30;
        v33 = -[CKMediaRequestDetails initWithRequestID:transferGUID:resultHandler:](v32, "initWithRequestID:transferGUID:resultHandler:", (int)v19, v41, v43);
        lock_requestDetailsByRequestID = self->_lock_requestDetailsByRequestID;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v19);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](lock_requestDetailsByRequestID, "setObject:forKeyedSubscript:", v33, v35);

        os_unfair_lock_unlock(lock);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[CKMediaObjectImageProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:]";
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "%s got non-CKMediaObjectBackedAsset PXDisplayAsset!", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXDisplayAsset %@ is not a CKMediaObjectBackedAsset"), v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x1E0CD1BE8];
    v51[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v17);
    v19 = 0;
  }

  return v19;
}

void __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  block[3] = &unk_1E274CF30;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  signed int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKMediaObjectImageProvider requestPlayerItemForVideo:options:resultHandler:]";
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%s got non-CKMediaObjectBackedAsset PXDisplayAsset!", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXDisplayAsset %@ is not a CKMediaObjectBackedAsset"), v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CD1BE8];
    v30 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
    goto LABEL_9;
  }
  v10 = v7;
  _PhotoKitAssetForMediaObjectAsset(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    _PhotoKitMediaProvider();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "requestPlayerItemForVideo:options:resultHandler:", v11, v8, v9);

    goto LABEL_10;
  }
  objc_msgSend(v10, "mediaObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKMediaObjectImageProvider requestPlayerItemForVideo:options:resultHandler:]";
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "%s got non-CKMovieMediaObject for movie request!", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObject %@ is not a CKMovieMediaObject"), v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0CD1BE8];
    v28 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v23);

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v16, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKMediaObjectImageProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  block[3] = &unk_1E274DA38;
  v25 = v18;
  v26 = v9;
  v19 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  do
    v20 = __ldaxr((unsigned int *)&_makeNextRequestID_lastRequestID);
  while (__stlxr(v20 + 1, (unsigned int *)&_makeNextRequestID_lastRequestID));

  v13 = v20;
LABEL_10:

  return v13;
}

uint64_t __78__CKMediaObjectImageProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  CKMediaObjectImageProvider *v4;
  os_unfair_lock_s *p_lock;
  id v6;

  v4 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v4) = -[CKMediaObjectImageProvider _lock_cancelImageRequest:](v4, "_lock_cancelImageRequest:", a3);
  os_unfair_lock_unlock(p_lock);
  if ((v4 & 1) == 0)
  {
    _PhotoKitMediaProvider();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelImageRequest:", a3);

  }
}

- (id)_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5
{
  _BOOL8 v6;
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  v6 = a4;
  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[CKMediaObjectImageProvider _lock_imagePreviewForMediaObject:isSynchronous:requestID:](self, "_lock_imagePreviewForMediaObject:isSynchronous:requestID:", v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[CKMediaObjectImageProvider testImage](self, "testImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CKMediaObjectImageProvider testImage](self, "testImage");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectImageProvider setTestImage:](self, "setTestImage:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transfer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isFromMomentShare") && objc_msgSend(v12, "transferState") <= 3)
    {
      if (!a4)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_mediaObjectsPendingTransferFinalizationByRequestID, "setObject:forKeyedSubscript:", v8, v11);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "transfer");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "guid");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            v19 = 138412546;
            v20 = v15;
            v21 = 2048;
            v22 = objc_msgSend(v12, "transferState");
            _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Transfer %@ is < finished %ld deferring preview generation", (uint8_t *)&v19, 0x16u);

          }
        }
      }
      v10 = 0;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_mediaObjectsPendingTransferFinalizationByRequestID, "setObject:forKeyedSubscript:", 0, v11);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "previewMaxWidth");
      objc_msgSend(v8, "previewForWidth:orientation:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v10 = v17;
      else
        v10 = 0;

    }
  }

  return v10;
}

- (BOOL)_lock_cancelImageRequest:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *lock_activeRequestIDsByTransferGUID;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_requestDetailsByRequestID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_requestDetailsByRequestID, "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend(v6, "transferGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      lock_activeRequestIDsByTransferGUID = self->_lock_activeRequestIDsByTransferGUID;
      objc_msgSend(v6, "transferGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](lock_activeRequestIDsByTransferGUID, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "removeIndex:", a3);
      if (v10 && !objc_msgSend(v10, "count"))
      {
        v11 = self->_lock_activeRequestIDsByTransferGUID;
        objc_msgSend(v6, "transferGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

      }
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_mediaObjectsPendingTransferFinalizationByRequestID, "setObject:forKeyedSubscript:", 0, v5);

  return v6 != 0;
}

- (void)_handlePreviewDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "transferGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_activeRequestIDsByTransferGUID, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__CKMediaObjectImageProvider__handlePreviewDidChangeNotification___block_invoke;
      v17[3] = &unk_1E274E480;
      v17[4] = self;
      v18 = v8;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v17);
      os_unfair_lock_unlock(&self->_lock);

    }
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("of type: %@"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("nil");
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Notification object received was %@ instead of expected type CKMediaObject, _handlePreviewDidChangeNotification does nothing", buf, 0xCu);
      }

    }
  }

}

void __66__CKMediaObjectImageProvider__handlePreviewDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "transferGUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got incoming preview change notification for pending handler %@ - %@", (uint8_t *)&v14, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_lock_imagePreviewForMediaObject:isSynchronous:requestID:", *(_QWORD *)(a1 + 40), 0, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "resultHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Got preview after preview change notification, returning handler", (uint8_t *)&v14, 2u);
          }

        }
        objc_msgSend(v6, "resultHandler");
        v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v10, 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "_lock_cancelImageRequest:", a2);
    }

  }
}

- (void)_handleFileTransferDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CKMediaObjectImageProvider *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke;
  v6[3] = &unk_1E274A108;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke_2;
    v6[3] = &unk_1E274F378;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));

  }
}

void __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Transfer state changed for %@, attempting generation", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_lock_imagePreviewForMediaObject:isSynchronous:requestID:", v6, 0, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resultHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Got preview after file transfer changed, returning handler", (uint8_t *)&v14, 2u);
          }

        }
        ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v8, 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "_lock_cancelImageRequest:", a2);

    }
  }

}

- (UIImage)testImage
{
  return self->_testImage;
}

- (void)setTestImage:(id)a3
{
  objc_storeStrong((id *)&self->_testImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testImage, 0);
  objc_storeStrong((id *)&self->_lock_activeRequestIDsByTransferGUID, 0);
  objc_storeStrong((id *)&self->_lock_mediaObjectsPendingTransferFinalizationByRequestID, 0);
  objc_storeStrong((id *)&self->_lock_requestDetailsByRequestID, 0);
}

@end
