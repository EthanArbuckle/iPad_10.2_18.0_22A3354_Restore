@implementation NTKCompanionCustomPhotosEditor

- (NTKCompanionCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  NTKCompanionCustomPhotosEditor *v4;
  uint64_t v5;
  NSMutableDictionary *pickedPhotos;
  uint64_t v7;
  NSMutableDictionary *newPhotos;
  uint64_t v9;
  NSMutableArray *orderList;
  uint64_t v11;
  NSCache *scaledImageCache;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKCompanionCustomPhotosEditor;
  v4 = -[NTKCompanionResourceDirectoryEditor initWithResourceDirectory:forDevice:](&v16, sel_initWithResourceDirectory_forDevice_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    pickedPhotos = v4->_pickedPhotos;
    v4->_pickedPhotos = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    newPhotos = v4->_newPhotos;
    v4->_newPhotos = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    orderList = v4->_orderList;
    v4->_orderList = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    scaledImageCache = v4->_scaledImageCache;
    v4->_scaledImageCache = (NSCache *)v11;

    v4->_previewIsValid = 0;
    -[NTKCompanionResourceDirectoryEditor resourceDirectory](v4, "resourceDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NTKCompanionResourceDirectoryEditor resourceDirectory](v4, "resourceDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCompanionCustomPhotosEditor _readPickedPhotosFrom:](v4, "_readPickedPhotosFrom:", v14);

      -[NTKCompanionCustomPhotosEditor _fetchAssetsForPickedPhotos](v4, "_fetchAssetsForPickedPhotos");
    }
    -[NTKCompanionResourceDirectoryEditor setState:](v4, "setState:", 1);
  }
  return v4;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  uint8_t *v16;
  _QWORD aBlock[5];
  id v18;
  uint8_t *v19;
  int64_t v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for CustomPhotosEditor", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v6 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BD0010;
  v19 = buf;
  v20 = v6;
  aBlock[4] = self;
  v8 = v4;
  v18 = v8;
  v9 = _Block_copy(aBlock);
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2)
  {
    if (-[NTKCompanionResourceDirectoryEditor state](self, "state") == 1)
    {
      -[NTKCompanionResourceDirectoryEditor resourceDirectory](self, "resourceDirectory");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_previewIsValid)
      {
        -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 3);
        dispatch_get_global_queue(2, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
        block[3] = &unk_1E6BD0038;
        v16 = buf;
        block[4] = self;
        v15 = v9;
        dispatch_async(v13, block);

        goto LABEL_12;
      }
      -[NTKCompanionResourceDirectoryEditor galleryPreviewResourceDirectory](self, "galleryPreviewResourceDirectory");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)*((_QWORD *)v22 + 5);
    *((_QWORD *)v22 + 5) = v11;

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  (*((void (**)(void *, uint64_t))v9 + 2))(v9, v10);
LABEL_12:

  _Block_object_dispose(buf, 8);
}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  __int128 v12;
  uint64_t v13;
  char v14;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

      v4 = 0;
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
  block[3] = &unk_1E6BCFFE8;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = a2;
  block[4] = v8;
  v13 = v4;
  v10 = *(_OWORD *)(a1 + 40);
  v9 = (id)v10;
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = *(_BYTE *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "galleryPreviewResourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  NTKPhotosCreateResourceDirectory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(a1[5] + 16))(a1[5], 0);
    return;
  }
  objc_msgSend(*(id *)(a1[4] + 64), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v11 = *(void (**)(void))(a1[5] + 16);
LABEL_12:
    v11();
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_linkPhoto:to:previewOnly:", v9, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_11:
      v11 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_12;
    }
    v13 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "crop");
    objc_msgSend(v13, "_transcodeAsset:withCrop:into:previewOnly:", v9, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v10)
    goto LABEL_11;
  objc_msgSend(v10, "encodeAsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  NTKPhotosWriteImageList(v16, *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
  (*(void (**)(void))(a1[5] + 16))();

LABEL_13:
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    if (-[NTKCompanionResourceDirectoryEditor state](self, "state") == 1)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_2;
      v9[3] = &unk_1E6BCE3C8;
      v9[4] = self;
      v10 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v5 = v10;
    }
    else
    {
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 4);
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_3;
      v7[3] = &unk_1E6BD00B0;
      v7[4] = self;
      v8 = v4;
      dispatch_async(v6, v7);

      v5 = v8;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v12;
  }

}

uint64_t __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD aBlock[4];
  id v12;
  uint64_t v13;
  id v14;

  NTKPhotosCreateResourceDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_4;
  aBlock[3] = &unk_1E6BD0088;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v6 = _Block_copy(aBlock);
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (v3)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyOrTranscodePhotosTo:", v3);
    v9 = v8;
    if (v8 && NTKPhotosWriteImageList(v8, v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "_reinitializeWithImageList:andResourceDirectory:", v9, v3);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    v7[2](v7, v10);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }

}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemAtPath:error:", v5, 0);

      v5 = 0;
    }
    v6 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_5;
  v10[3] = &unk_1E6BD0060;
  v13 = v6;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setResourceDirectory:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (int64_t)photosCount
{
  return -[NSMutableArray count](self->_orderList, "count");
}

- (BOOL)addPhotosFromUIImagePicker:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  void *v8;

  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2
    && (v5 = -[NTKCompanionCustomPhotosEditor photosCount](self, "photosCount"),
        (unint64_t)(objc_msgSend(v4, "count") + v5) <= 0x18))
  {
    -[NTKCompanionCustomPhotosEditor _fetchAssetsForNewPhotos:](self, "_fetchAssetsForNewPhotos:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKCompanionCustomPhotosEditor addAssetsFromAssetList:](self, "addAssetsFromAssetList:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  return -[NTKCompanionCustomPhotosEditor addAssetsFromAssetList:maxPhotosCount:](self, "addAssetsFromAssetList:maxPhotosCount:", a3, 24);
}

- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[NTKCompanionResourceDirectoryEditor state](self, "state")
    || -[NTKCompanionResourceDirectoryEditor state](self, "state") > 2
    || (v7 = -[NTKCompanionCustomPhotosEditor photosCount](self, "photosCount"), objc_msgSend(v6, "count") + v7 > a4))
  {
    v8 = 0;
    goto LABEL_5;
  }
  -[NSMutableArray firstObject](self->_orderList, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v6;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (!v10)
    goto LABEL_28;
  v11 = v10;
  v42 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v44 != v42)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v13, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_new();
      -[NTKCompanionResourceDirectoryEditor device](self, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NTKPhotosDefaultCropForAsset(v13, v16);
      objc_msgSend(v15, "setCrop:");

      objc_msgSend(v15, "setAsset:", v13);
      objc_msgSend(v15, "setSubsampleFactor:", _subsampleFactorForAsset(v13));
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "photo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "modificationDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "modificationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        v23 = v22;
        objc_msgSend(v21, "timeIntervalSince1970");
        v25 = vabdd_f64(v23, v24);

        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25 > 2.0)
        {
          if (v27)
          {
            objc_msgSend(v18, "photo");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "imageURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v48 = v29;
            _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: replacing existing photo %@ because it was modified", buf, 0xCu);

          }
          -[NSMutableDictionary removeObjectForKey:](self->_pickedPhotos, "removeObjectForKey:", v14);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newPhotos, "setObject:forKeyedSubscript:", v15, v14);
          goto LABEL_26;
        }
        if (v27)
        {
          objc_msgSend(v18, "photo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "imageURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v33;
          v34 = v26;
          v35 = "addAssetsFromAssetList: not adding existing photo %@";
LABEL_21:
          _os_log_impl(&dword_1B72A3000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);

        }
        goto LABEL_22;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v14);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v26 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v31)
        {
          objc_msgSend(v15, "asset");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "localIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v33;
          v34 = v26;
          v35 = "addAssetsFromAssetList: not adding new asset again %@";
          goto LABEL_21;
        }
LABEL_22:

        goto LABEL_26;
      }
      if (v31)
      {
        objc_msgSend(v15, "asset");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v37;
        _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: adding new asset %@", buf, 0xCu);

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newPhotos, "setObject:forKeyedSubscript:", v15, v14);
      -[NSMutableArray addObject:](self->_orderList, "addObject:", v14);
LABEL_26:

    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  }
  while (v11);
LABEL_28:

  if (self->_previewIsValid)
  {
    -[NSMutableArray firstObject](self->_orderList, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    self->_previewIsValid = NTKEqualStrings(v39, v38);

  }
  -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);

  v8 = 1;
  v6 = v40;
LABEL_5:

  return v8;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSCache *scaledImageCache;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state"))
  {
    v5 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    if ((a3 & 0x8000000000000000) == 0
      && v5 <= 2
      && -[NSMutableArray count](self->_orderList, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](self->_orderList, "removeObject:", v6);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "photo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "imageURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v11;
          v22 = 2048;
          v23 = a3;
          _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting existing photo %@ at index %ld", (uint8_t *)&v20, 0x16u);

        }
        -[NSMutableDictionary removeObjectForKey:](self->_pickedPhotos, "removeObjectForKey:", v6);
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "asset");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v16;
          v22 = 2048;
          v23 = a3;
          _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting new asset id %@ at index %ld", (uint8_t *)&v20, 0x16u);

        }
        scaledImageCache = self->_scaledImageCache;
        objc_msgSend(v12, "asset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache removeObjectForKey:](scaledImageCache, "removeObjectForKey:", v19);

        -[NSMutableDictionary removeObjectForKey:](self->_newPhotos, "removeObjectForKey:", v6);
      }
      if (self->_previewIsValid)
        self->_previewIsValid = a3 != 0;
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);

    }
  }
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  BOOL v13;
  int v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state"))
  {
    v7 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    if ((a3 & 0x8000000000000000) == 0 && v7 <= 2)
    {
      v8 = -[NSMutableArray count](self->_orderList, "count");
      if ((a4 & 0x8000000000000000) == 0
        && v8 > a3
        && -[NSMutableArray count](self->_orderList, "count") > (unint64_t)a4)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 134218240;
          v15 = a3;
          v16 = 2048;
          v17 = a4;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v14, 0x16u);
        }

        -[NSMutableArray removeObjectAtIndex:](self->_orderList, "removeObjectAtIndex:", a3);
        -[NSMutableArray insertObject:atIndex:](self->_orderList, "insertObject:atIndex:", v9, a4);
        if (self->_previewIsValid)
        {
          if (a3)
            v11 = a4 == 0;
          else
            v11 = 1;
          v13 = !v11 || a3 == a4;
          self->_previewIsValid = v13;
        }
        -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);

      }
    }
  }
}

- (BOOL)setOriginalCrop:(CGRect)a3 forPhotoAtIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSCache *scaledImageCache;
  void *v20;
  void *v21;
  BOOL v22;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  if (v10)
  {
    v11 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    LOBYTE(v10) = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 <= 2)
    {
      if (-[NSMutableArray count](self->_orderList, "count") <= (unint64_t)a4)
      {
        LOBYTE(v10) = 0;
        return v10;
      }
      LODWORD(v10) = -[NTKCompanionCustomPhotosEditor canChangeOriginalCropOfPhotoAtIndex:](self, "canChangeOriginalCropOfPhotoAtIndex:", a4);
      if ((_DWORD)v10)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "photo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "originalCrop");
          v16 = CLKRectEqualsRect();

          if ((v16 & 1) != 0)
            goto LABEL_13;
          -[NSMutableDictionary removeObjectForKey:](self->_pickedPhotos, "removeObjectForKey:", v12);
          v17 = (void *)objc_opt_new();
          objc_msgSend(v14, "asset");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAsset:", v18);

          objc_msgSend(v17, "setSubsampleFactor:", objc_msgSend(v14, "subsampleFactor"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newPhotos, "setObject:forKeyedSubscript:", v17, v12);
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v17)
        {
          scaledImageCache = self->_scaledImageCache;
          objc_msgSend(v17, "asset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache removeObjectForKey:](scaledImageCache, "removeObjectForKey:", v21);

          CGAffineTransformMakeScale(&v24, (double)(unint64_t)objc_msgSend(v17, "subsampleFactor"), (double)(unint64_t)objc_msgSend(v17, "subsampleFactor"));
          v25.origin.x = x;
          v25.origin.y = y;
          v25.size.width = width;
          v25.size.height = height;
          v26 = CGRectApplyAffineTransform(v25, &v24);
          objc_msgSend(v17, "setCrop:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

          v22 = 0;
LABEL_14:
          if (self->_previewIsValid)
            self->_previewIsValid = v22;
          -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);

          LOBYTE(v10) = 1;
          return v10;
        }
LABEL_13:
        v22 = 1;
        goto LABEL_14;
      }
    }
  }
  return v10;
}

- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  if (a3 < 0 || -[NSMutableArray count](self->_orderList, "count") <= (unint64_t)a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v8;
}

- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSCache *scaledImageCache;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD block[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v6 = a4;
  if (a3 < 0 || -[NSMutableArray count](self->_orderList, "count") <= (unint64_t)a3)
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke;
    v51[3] = &unk_1E6BCDF60;
    v52 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v51);
    v7 = v52;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      NTKPhotosImageForPhoto(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2;
      block[3] = &unk_1E6BD00D8;
      v50 = v6;
      v48 = v10;
      v49 = v9;
      v11 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v12 = v50;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      scaledImageCache = self->_scaledImageCache;
      objc_msgSend(v11, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache objectForKey:](scaledImageCache, "objectForKey:", v15);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_watchPhotoImageSize");
      v17 = v16;
      v19 = v18;
      if (v12)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_3;
        v40[3] = &unk_1E6BD0100;
        v42 = v6;
        v12 = v12;
        v43 = 0;
        v44 = 0;
        v41 = v12;
        v45 = v17;
        v46 = v19;
        dispatch_async(MEMORY[0x1E0C80D38], v40);

        v20 = v42;
      }
      else
      {
        objc_msgSend(v11, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "crop");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_4;
        v33[3] = &unk_1E6BD0128;
        v33[4] = self;
        v11 = v11;
        v36 = 0;
        v37 = 0;
        v34 = v11;
        v38 = v17;
        v39 = v19;
        v35 = v6;
        v31 = v33;
        v53[0] = v30;
        v53[1] = 3221225472;
        v53[2] = ___watchSizeImageForAsset_block_invoke;
        v53[3] = &unk_1E6BD01F0;
        v56 = v23;
        v57 = v25;
        v58 = v27;
        v59 = v29;
        v54 = v21;
        v55 = v31;
        v32 = v21;
        +[NTKCompanionResourceDirectoryEditor _imageDataForAsset:completion:](NTKCompanionCustomPhotosEditor, "_imageDataForAsset:completion:", v32, v53);

        v20 = v34;
      }

    }
  }

}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "crop");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = a2;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *MEMORY[0x1E0C9D628];
  v17 = v4;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v7);

    v8 = *(_OWORD *)(a1 + 72);
    v16 = *(_OWORD *)(a1 + 56);
    v17 = v8;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_5;
  v11[3] = &unk_1E6BD0100;
  v9 = *(id *)(a1 + 48);
  v12 = v3;
  v13 = v9;
  v14 = v16;
  v15 = v17;
  v10 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v6 = a4;
  if (a3 < 0 || -[NSMutableArray count](self->_orderList, "count") <= (unint64_t)a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v21 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v21;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "subsampleFactor");

    if (v9)
      goto LABEL_5;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "subsampleFactor");

    if (v9)
    {
LABEL_5:
      v14 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_3;
      v16[3] = &unk_1E6BD0150;
      v17 = v6;
      v15 = v16;
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = ___fullSizeImageForAsset_block_invoke;
      v22[3] = &unk_1E6BD01A0;
      v23 = v15;
      v24 = v11;
      +[NTKCompanionResourceDirectoryEditor _imageDataForAsset:completion:](NTKCompanionCustomPhotosEditor, "_imageDataForAsset:completion:", v9, v22);

    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_2;
      v18[3] = &unk_1E6BCDF60;
      v19 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v18);
      v9 = v19;
    }

  }
}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_4;
  v6[3] = &unk_1E6BCE3C8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  if (a3 < 0 || -[NSMutableArray count](self->_orderList, "count") <= (unint64_t)a3)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_17;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    objc_msgSend(v6, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v36 = 1;
      goto LABEL_14;
    }
    objc_msgSend(v7, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v17 = v16;
    objc_msgSend(v15, "timeIntervalSince1970");
    v19 = vabdd_f64(v17, v18);

    if (v19 <= 2.0)
    {
      objc_msgSend(v7, "photo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "originalCrop");
      x = v21;
      y = v22;
      width = v23;
      height = v24;

    }
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    if (CGRectIsEmpty(v42))
    {
      -[NTKCompanionResourceDirectoryEditor device](self, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NTKPhotosDefaultCropForAsset(v12, v25);
      x = v26;
      y = v27;
      width = v28;
      height = v29;

    }
    v30 = v7;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "crop");
    x = v32;
    y = v33;
    width = v34;
    height = v35;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
  }
  v36 = objc_msgSend(v30, "subsampleFactor");
LABEL_14:

  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  if (!CGRectIsEmpty(v43))
  {
    CGAffineTransformMakeScale(&v41, 1.0 / (double)v36, 1.0 / (double)v36);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v45 = CGRectApplyAffineTransform(v44, &v41);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;
  }

LABEL_17:
  v37 = x;
  v38 = y;
  v39 = width;
  v40 = height;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  double v3;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v3 = 1.0;
  if (a3 < 0)
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 1.0;
    if (-[NSMutableArray count](self->_orderList, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_orderList, "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "subsampleFactor");

      if (v9)
        goto LABEL_5;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "subsampleFactor");

      if (v9)
      {
LABEL_5:
        v14 = (double)(unint64_t)objc_msgSend(v9, "pixelWidth");
        v15 = (double)(unint64_t)objc_msgSend(v9, "pixelHeight");
        objc_msgSend((id)objc_opt_class(), "_watchPhotoImageSize");
        v17 = v16 * (double)v11 / v14;
        v19 = v18 * (double)v11 / v15;
        if (NTKPhotosIsPHAssetIris(v9))
        {
          objc_msgSend((id)objc_opt_class(), "_videoAssetOf:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = NTKPhotosVideoDimensions(v20);
          v23 = v22;
          objc_msgSend((id)objc_opt_class(), "_watchPhotoVideoSize");
          v26 = v25 / v21;
          if (v17 < v26)
            v17 = v26;
          if (v19 < v24 / v23)
            v19 = v24 / v23;

        }
        if (v17 <= 1.0)
          v6 = v17;
        else
          v6 = 1.0;
        if (v19 <= 1.0)
          v3 = v19;
        else
          v3 = 1.0;

      }
    }
  }
  v27 = v6;
  v28 = v3;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)_readPickedPhotosFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setPhoto:", v8);
        objc_msgSend(v10, "setSubsampleFactor:", 1);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pickedPhotos, "setObject:forKeyedSubscript:", v10, v9);
        -[NSMutableArray addObject:](self->_orderList, "addObject:", v9);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_fetchAssetsForPickedPhotos
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableDictionary allValues](self->_pickedPhotos, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "photo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v6);
  }

  NTKPHAssetsForLocalIdentifiers(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v15);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMutableDictionary allValues](self->_pickedPhotos, "allValues", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
        objc_msgSend(v25, "photo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAsset:", v28);
          objc_msgSend(v25, "setSubsampleFactor:", _subsampleFactorForAsset(v28));

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v22);
  }

}

- (id)_fetchAssetsForNewPhotos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x1E0DC4CA8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "objectForKeyedSubscript:", v9, (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "localIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  NTKPHAssetsForLocalIdentifiers(v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (v15 != objc_msgSend(v4, "count"))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NTKCompanionCustomPhotosEditor _fetchAssetsForNewPhotos:].cold.1(v14, v4, v16);

  }
  if (objc_msgSend(v14, "count", (_QWORD)v20))
    v17 = v14;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)_copyOrTranscodePhotosTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *orderList;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v5 = (void *)objc_opt_new();
  orderList = self->_orderList;
  v18 = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__NTKCompanionCustomPhotosEditor__copyOrTranscodePhotosTo___block_invoke;
  v10[3] = &unk_1E6BD0178;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderList, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __59__NTKCompanionCustomPhotosEditor__copyOrTranscodePhotosTo___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v6, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_linkPhoto:to:previewOnly:", v8, a1[5], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v10, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "crop");
    objc_msgSend(v11, "_transcodeAsset:withCrop:into:previewOnly:", v12, a1[5], 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  if (v9)
  {
    objc_msgSend(v9, "encodeAsDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  else
  {
    *(_QWORD *)(v14 + 40) = 0;

    *a4 = 1;
  }

}

- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *orderList;
  NSMutableArray *v21;
  NSMutableDictionary *pickedPhotos;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *newPhotos;
  id obj;
  NSMutableDictionary *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v27 = (NSMutableDictionary *)objc_opt_new();
  v7 = (NSMutableArray *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        +[NTKPhoto decodeFromDictionary:forResourceDirectory:](NTKPhoto, "decodeFromDictionary:forResourceDirectory:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11), v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_pickedPhotos, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asset");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_newPhotos, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "asset");
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v18;
        }
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setPhoto:", v12);
        objc_msgSend(v19, "setAsset:", v14);
        objc_msgSend(v19, "setSubsampleFactor:", _subsampleFactorForAsset(v14));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v19, v13);
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  orderList = self->_orderList;
  self->_orderList = v7;
  v21 = v7;

  pickedPhotos = self->_pickedPhotos;
  self->_pickedPhotos = v27;
  v23 = v27;

  v24 = (NSMutableDictionary *)objc_opt_new();
  newPhotos = self->_newPhotos;
  self->_newPhotos = v24;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledImageCache, 0);
  objc_storeStrong((id *)&self->_orderList, 0);
  objc_storeStrong((id *)&self->_newPhotos, 0);
  objc_storeStrong((id *)&self->_pickedPhotos, 0);
}

- (void)_fetchAssetsForNewPhotos:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "_fetchAssetsForNewPhotos: could only retrieve %ld assets for %ld local identifiers", (uint8_t *)&v5, 0x16u);
}

@end
