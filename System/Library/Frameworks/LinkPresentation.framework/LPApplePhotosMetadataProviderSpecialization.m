@implementation LPApplePhotosMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 128;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  LPApplePhotosMetadataProviderSpecialization *v6;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPPresentationSpecializations isiCloudPhotoShareURL:](LPPresentationSpecializations, "isiCloudPhotoShareURL:", v4);

  if (v5)
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPApplePhotosMetadataProviderSpecialization alloc], "initWithContext:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)LPApplePhotosMetadataProviderSpecialization;
  -[LPApplePhotosMetadataProviderSpecialization dealloc](&v3, sel_dealloc);
}

- (void)start
{
  void *v3;
  uint64_t v4;
  id v5;
  PHPhotoLibrary *v6;
  PHPhotoLibrary *photoLibrary;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void *v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void (*v21)(uint64_t);
  void *v22;
  void **v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (TCCAccessPreflight())
  {
    -[LPApplePhotosMetadataProviderSpecialization fail](self, "fail");
  }
  else
  {
    v16 = 0;
    if (!PhotosUICoreLibraryCore(char **)::frameworkLibrary)
    {
      v20 = xmmword_1E44A9268;
      v21 = 0;
      PhotosUICoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    }
    if (!PhotosUICoreLibraryCore(char **)::frameworkLibrary)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosUICoreLibrary()");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("LPApplePhotosMetadataProviderSpecialization.mm"), 29, CFSTR("%s"), v16);

      __break(1u);
      free(v14);
    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v3 = (void *)getPHPhotoLibraryClass(void)::softClass;
    v19 = getPHPhotoLibraryClass(void)::softClass;
    v4 = MEMORY[0x1E0C809B0];
    if (!getPHPhotoLibraryClass(void)::softClass)
    {
      *(_QWORD *)&v20 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v20 + 1) = 3221225472;
      v21 = ___ZL22getPHPhotoLibraryClassv_block_invoke;
      v22 = &unk_1E44A7DB0;
      v23 = &v16;
      ___ZL22getPHPhotoLibraryClassv_block_invoke((uint64_t)&v20);
      v3 = v17[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v5, "sharedMomentSharePhotoLibrary");
    v6 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    photoLibrary = self->_photoLibrary;
    self->_photoLibrary = v6;

    -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v9 = (void *)getPHMomentShareClass(void)::softClass;
    v19 = getPHMomentShareClass(void)::softClass;
    if (!getPHMomentShareClass(void)::softClass)
    {
      *(_QWORD *)&v20 = v4;
      *((_QWORD *)&v20 + 1) = 3221225472;
      v21 = ___ZL21getPHMomentShareClassv_block_invoke;
      v22 = &unk_1E44A7DB0;
      v23 = &v16;
      ___ZL21getPHMomentShareClassv_block_invoke((uint64_t)&v20);
      v9 = v17[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v16, 8);
    -[LPMetadataProviderSpecialization URL](self, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke;
    v15[3] = &unk_1E44A9220;
    v15[4] = self;
    objc_msgSend(v10, "fetchMomentShareFromShareURL:options:completionHandler:", v11, v8, v15);

  }
}

void __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *v7;
  LPApplePhotosMomentMetadata *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_BYTE **)(a1 + 32);
  if (!v7[24])
  {
    if (!v5 || v6)
    {
      objc_msgSend(v7, "fail");
    }
    else
    {
      v8 = objc_alloc_init(LPApplePhotosMomentMetadata);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

      objc_msgSend(v5, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTitle:", v11);

      objc_msgSend(v5, "expiryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setExpirationDate:", v12);

      objc_msgSend(v5, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setEarliestAssetDate:", v13);

      objc_msgSend(v5, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setLatestAssetDate:", v14);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setPhotoCount:", objc_msgSend(v5, "photosCount"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setVideoCount:", objc_msgSend(v5, "videosCount"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setOtherItemCount:", objc_msgSend(v5, "assetCount") - (objc_msgSend(v5, "photosCount") + objc_msgSend(v5, "videosCount")));
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke_2;
      v15[3] = &unk_1E44A7D10;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }

}

void __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)getPHFetchOptionsClass(void)::softClass;
  v20 = getPHFetchOptionsClass(void)::softClass;
  if (!getPHFetchOptionsClass(void)::softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___ZL22getPHFetchOptionsClassv_block_invoke;
    v16[3] = &unk_1E44A7DB0;
    v16[4] = &v17;
    ___ZL22getPHFetchOptionsClassv_block_invoke((uint64_t)v16);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "init");
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPhotoLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(getPHAssetClass(), "fetchKeyAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(id **)(a1 + 32);
    objc_msgSend(v9[5], "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didFetchAsset:", v10);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(getPHAssetClass(), "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(id **)(a1 + 32);
    objc_msgSend(v15[6], "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didFetchAsset:", v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)cancel
{
  id v3;

  self->_cancelled = 1;
  if (self->_pendingImageRequest)
  {
    objc_msgSend(getPHImageManagerClass(), "defaultManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelImageRequest:", self->_pendingImageRequest);

  }
}

- (void)fail
{
  _QWORD block[5];

  -[LPApplePhotosMetadataProviderSpecialization cancel](self, "cancel");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LPApplePhotosMetadataProviderSpecialization_fail__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__LPApplePhotosMetadataProviderSpecialization_fail__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecializationDidFail:", *(_QWORD *)(a1 + 32));

}

- (void)completeWithMetadata:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  void *v6;
  void *v7;
  LPLinkMetadata *v8;
  _QWORD v9[5];
  LPLinkMetadata *v10;

  v4 = a3;
  v5 = objc_alloc_init(LPLinkMetadata);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](v5, "setURL:", v6);

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](v5, "setOriginalURL:", v7);

  -[LPLinkMetadata setSpecialization:](v5, "setSpecialization:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__LPApplePhotosMetadataProviderSpecialization_completeWithMetadata___block_invoke;
  v9[3] = &unk_1E44A7D10;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __68__LPApplePhotosMetadataProviderSpecialization_completeWithMetadata___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecialization:didCompleteWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didFetchAsset:(id)a3
{
  id v4;
  PHFetchResult *keyAssetFetch;
  PHFetchResult *anyAssetFetch;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  keyAssetFetch = self->_keyAssetFetch;
  if (*(_OWORD *)&self->_keyAssetFetch != 0)
  {
    self->_keyAssetFetch = 0;

    anyAssetFetch = self->_anyAssetFetch;
    self->_anyAssetFetch = 0;

    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v7 = (void *)getPHImageRequestOptionsClass(void)::softClass;
    v17 = getPHImageRequestOptionsClass(void)::softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getPHImageRequestOptionsClass(void)::softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = ___ZL29getPHImageRequestOptionsClassv_block_invoke;
      v13[3] = &unk_1E44A7DB0;
      v13[4] = &v14;
      ___ZL29getPHImageRequestOptionsClassv_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v14, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "init");
    objc_msgSend(v10, "setNetworkAccessAllowed:", 1);
    objc_msgSend(getPHImageManagerClass(), "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __61__LPApplePhotosMetadataProviderSpecialization_didFetchAsset___block_invoke;
    v12[3] = &unk_1E44A9248;
    v12[4] = self;
    self->_pendingImageRequest = objc_msgSend(v11, "requestImageDataAndOrientationForAsset:options:resultHandler:", v4, v10, v12);

  }
}

void __61__LPApplePhotosMetadataProviderSpecialization_didFetchAsset___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  LPImage *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v11 + 24))
  {
    *(_DWORD *)(v11 + 28) = 0;
    if (v8)
    {
      +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[LPImage initWithData:MIMEType:]([LPImage alloc], "initWithData:MIMEType:", v8, v12);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setKeyPhoto:", v13);

      }
      else
      {
        v14 = LPLogChannelFetching();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412290;
          v16 = v9;
          _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "Failed to determine MIME type for image with type %@", (uint8_t *)&v15, 0xCu);
        }
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "completeWithMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PHFetchResult *v7;
  PHFetchResult *keyAssetFetch;
  void *v9;
  void *v10;
  void *v11;
  PHFetchResult *v12;
  PHFetchResult *anyAssetFetch;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_keyAssetFetch)
  {
    objc_msgSend(v4, "changeDetailsForFetchResult:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "fetchResultAfterChanges");
      v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
      keyAssetFetch = self->_keyAssetFetch;
      self->_keyAssetFetch = v7;

      -[PHFetchResult firstObject](self->_keyAssetFetch, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[LPApplePhotosMetadataProviderSpecialization didFetchAsset:](self, "didFetchAsset:", v9);

    }
    v4 = v15;
  }
  if (self->_anyAssetFetch)
  {
    objc_msgSend(v4, "changeDetailsForFetchResult:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "fetchResultAfterChanges");
      v12 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
      anyAssetFetch = self->_anyAssetFetch;
      self->_anyAssetFetch = v12;

      -[PHFetchResult firstObject](self->_anyAssetFetch, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[LPApplePhotosMetadataProviderSpecialization didFetchAsset:](self, "didFetchAsset:", v14);

    }
    v4 = v15;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_anyAssetFetch, 0);
  objc_storeStrong((id *)&self->_keyAssetFetch, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
