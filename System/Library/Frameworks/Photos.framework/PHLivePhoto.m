@implementation PHLivePhoto

- (PHLivePhoto)initWithBundleAtURL:(id)a3
{
  return -[PHLivePhoto initWithBundleAtURL:prefersHDR:](self, "initWithBundleAtURL:prefersHDR:", a3, 0);
}

- (PHLivePhoto)initWithBundleAtURL:(id)a3 prefersHDR:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHLivePhoto *v13;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D75318];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBundleAtURL:", v7);

  objc_msgSend(v8, "imagePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = (PHLivePhoto *)-[PHLivePhoto _initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:](self, "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:", v11, v12, 0, 0, v4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v9 = *a6;
  return (PHLivePhoto *)-[PHLivePhoto _initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:](self, "_initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:", a3, a4, a5, &v9, a7, 0, a8, 0);
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a6;
  return -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:options:](self, "initWithImage:uiOrientation:videoAsset:photoTime:asset:options:", a3, a4, a5, &v8, a7, 0);
}

- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 prefersHDR:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  PHLivePhoto *v19;
  PHLivePhoto *v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v24;
  int64_t v25;

  height = a6.height;
  width = a6.width;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = -[PHLivePhoto init](self, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageURL, a3);
    objc_storeStrong((id *)&v20->_videoURL, a4);
    v20->_targetSize.width = width;
    v20->_targetSize.height = height;
    v20->_contentMode = a7;
    v20->_audioVolume = 1.0;
    v20->_prefersHDR = a8;
    if (v18)
    {
      objc_msgSend(v18, "imageDisplayTime");
      *(_OWORD *)&v20->_photoTime.value = v24;
      v20->_photoTime.epoch = v25;
    }
    -[PHLivePhoto _ensureConstituentData](v20, "_ensureConstituentData");
    DCIM_sizeFromPLImage();
    v20->_size.width = v21;
    v20->_size.height = v22;
  }

  return v20;
}

- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9
{
  CGFloat height;
  CGFloat width;
  id v18;
  id v19;
  id v20;
  PHLivePhoto *v21;
  PHLivePhoto *v22;
  CGFloat v23;
  CGFloat v24;
  __int128 v26;
  int64_t v27;

  height = a6.height;
  width = a6.width;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = -[PHLivePhoto init](self, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageURL, a3);
    objc_storeStrong((id *)&v22->_videoURL, a4);
    v22->_targetSize.width = width;
    v22->_targetSize.height = height;
    v22->_contentMode = a7;
    v22->_audioVolume = 1.0;
    v22->_skipInstantiatingImageAndAVAsset = a8;
    v22->_prefersHDR = a9;
    if (v20)
    {
      objc_msgSend(v20, "imageDisplayTime");
      *(_OWORD *)&v22->_photoTime.value = v26;
      v22->_photoTime.epoch = v27;
    }
    -[PHLivePhoto _ensureConstituentData](v22, "_ensureConstituentData");
    DCIM_sizeFromPLImage();
    v22->_size.width = v23;
    v22->_size.height = v24;
  }

  return v22;
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a6;
  return (PHLivePhoto *)-[PHLivePhoto _initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:](self, "_initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:", a3, a4, a5, &v10, a7, 0, a8, a9);
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 assetUUID:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a6;
  return (PHLivePhoto *)-[PHLivePhoto _initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:](self, "_initWithImage:uiOrientation:videoAsset:photoTime:asset:assetUUID:options:videoComposition:", a3, a4, a5, &v10, 0, a7, a8, a9);
}

- (id)_initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 assetUUID:(id)a8 options:(unint64_t)a9 videoComposition:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  PHLivePhoto *v20;
  double Width;
  double Height;
  uint64_t v23;
  NSObject *plImage;
  __int128 v25;
  uint64_t v26;
  NSString *assetUUID;
  uint64_t v28;
  AVVideoComposition *videoComposition;

  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  v20 = -[PHLivePhoto init](self, "init");
  if (v20)
  {
    Width = (double)CGImageGetWidth(a3);
    Height = (double)CGImageGetHeight(a3);
    if (a3)
    {
      v23 = DCIM_newPLImageWithCGImage();
      plImage = v20->_plImage;
      v20->_plImage = v23;
    }
    else
    {
      plImage = v20->_plImage;
      v20->_plImage = 0;
    }

    v20->_size.width = Width;
    v20->_size.height = Height;
    objc_storeStrong((id *)&v20->_videoAsset, a5);
    v25 = *(_OWORD *)&a6->var0;
    v20->_photoTime.epoch = a6->var3;
    *(_OWORD *)&v20->_photoTime.value = v25;
    objc_storeStrong((id *)&v20->_asset, a7);
    v26 = objc_msgSend(v18, "copy");
    assetUUID = v20->_assetUUID;
    v20->_assetUUID = (NSString *)v26;

    v20->_options = a9;
    v28 = objc_msgSend(v19, "copy");
    videoComposition = v20->_videoComposition;
    v20->_videoComposition = (AVVideoComposition *)v28;

    v20->_audioVolume = 1.0;
  }

  return v20;
}

- (PHLivePhoto)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  CMTime v21;
  id v22;
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHLivePhoto;
  v5 = -[PHLivePhoto init](&v24, sel_init);
  if (v5)
  {
    v23 = 0;
    objc_msgSend(v4, "ph_decodeSandboxedURLForKey:sandboxExtensionWrapper:", CFSTR("imageURL"), &v23);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v23;
    v8 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v6;

    v9 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v7;
    v10 = v7;

    v22 = 0;
    objc_msgSend(v4, "ph_decodeSandboxedURLForKey:sandboxExtensionWrapper:", CFSTR("videoURL"), &v22);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v13 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v11;

    v14 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v12;

    CMTimeMake(&v21, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoTime.value")), objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("photoTime.timescale")));
    *(CMTime *)(v5 + 160) = v21;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("targetSize"));
    *((_QWORD *)v5 + 18) = v15;
    *((_QWORD *)v5 + 19) = v16;
    *((_QWORD *)v5 + 14) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentMode"));
    *((_QWORD *)v5 + 7) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
    *((_QWORD *)v5 + 16) = v17;
    *((_QWORD *)v5 + 17) = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("audioVolume"));
    *((_DWORD *)v5 + 7) = v19;
    objc_msgSend(v5, "_ensureConstituentData");

  }
  return (PHLivePhoto *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  double v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  PHLivePhoto *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = 0;
  v11 = 0;
  v4 = a3;
  v5 = -[PHLivePhoto _synchronouslyLoadImageURL:videoURL:error:](self, "_synchronouslyLoadImageURL:videoURL:error:", &v13, &v12, &v11);
  v6 = v13;
  v7 = v12;
  v8 = v11;
  if (!v5)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to encode Live Photo %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "ph_encodeSandboxedURL:forKey:", v6, CFSTR("imageURL"));
  objc_msgSend(v4, "ph_encodeSandboxedURL:forKey:", v7, CFSTR("videoURL"));
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("targetSize"), self->_targetSize.width, self->_targetSize.height);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentMode, CFSTR("contentMode"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_photoTime.value, CFSTR("photoTime.value"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_photoTime.timescale, CFSTR("photoTime.timescale"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  *(float *)&v10 = self->_audioVolume;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("audioVolume"), v10);

}

- (BOOL)_synchronouslyLoadImageURL:(id *)a3 videoURL:(id *)a4 error:(id *)a5
{
  dispatch_semaphore_t v9;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__25110;
  v35 = __Block_byref_object_dispose__25111;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__25110;
  v29 = __Block_byref_object_dispose__25111;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__25110;
  v23 = __Block_byref_object_dispose__25111;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PHLivePhoto__synchronouslyLoadImageURL_videoURL_error___block_invoke;
  v13[3] = &unk_1E35DB598;
  v15 = &v37;
  v16 = &v19;
  v17 = &v31;
  v18 = &v25;
  v10 = v9;
  v14 = v10;
  -[PHLivePhoto _loadConstituentURLsWithNetworkAccessAllowed:completionHandler:](self, "_loadConstituentURLsWithNetworkAccessAllowed:completionHandler:", 1, v13);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v32[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v26[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v11;
}

- (id)image
{
  return self->_plImage;
}

- (void)_ensureConstituentData
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *plImage;
  void *v7;
  AVAsset *v8;
  AVAsset *videoAsset;
  __int128 v10;
  int64_t v11;

  if (!self->_skipInstantiatingImageAndAVAsset)
  {
    if (!self->_plImage)
    {
      -[PHLivePhoto imageURL](self, "imageURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[PHLivePhoto imageURL](self, "imageURL");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHLivePhoto prefersHDR](self, "prefersHDR");
        DCIM_newPLImageWithContentsOfFileURL();
        v5 = objc_claimAutoreleasedReturnValue();
        plImage = self->_plImage;
        self->_plImage = v5;

      }
    }
    if (!self->_videoAsset)
    {
      -[PHLivePhoto videoURL](self, "videoURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v7);
        v8 = (AVAsset *)objc_claimAutoreleasedReturnValue();
        videoAsset = self->_videoAsset;
        self->_videoAsset = v8;

      }
    }
  }
  if ((self->_photoTime.flags & 0x1D) != 1)
  {
    +[PHLivePhoto _photoTimeForLivePhotoWithImageURL:videoURL:](PHLivePhoto, "_photoTimeForLivePhotoWithImageURL:videoURL:", self->_imageURL, self->_videoURL);
    *(_OWORD *)&self->_photoTime.value = v10;
    self->_photoTime.epoch = v11;
  }
}

- (NSString)uniqueIdentifier
{
  PHLivePhoto *v2;
  NSString *uniqueIdentifier;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;

  v2 = self;
  objc_sync_enter(v2);
  uniqueIdentifier = v2->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v7;

    uniqueIdentifier = v2->_uniqueIdentifier;
  }
  v9 = uniqueIdentifier;
  objc_sync_exit(v2);

  return v9;
}

- (BOOL)hasPhotoColorAdjustments
{
  return self->_options & 1;
}

- (NSString)originalFilename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PHLivePhoto imageURL](self, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
  }
  else
  {
    -[PHLivePhoto asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filename");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)imageTypeIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHLivePhoto imageURL](self, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeWithFilenameExtension:conformingToType:", v6, *MEMORY[0x1E0CEC520]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHLivePhoto asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniformTypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)videoTypeIdentifier
{
  return (NSString *)objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "identifier");
}

- (id)imageFileLoader
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHLivePhoto_imageFileLoader__block_invoke;
  aBlock[3] = &unk_1E35DB5E8;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (id)videoFileLoader
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHLivePhoto_videoFileLoader__block_invoke;
  aBlock[3] = &unk_1E35DB5E8;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (PHAsset)asset
{
  PHAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_asset;
  if (!v3)
  {
    -[PHLivePhoto assetUUID](self, "assetUUID");
    v3 = (PHAsset *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PHLivePhoto assetUUID](self, "assetUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "librarySpecificFetchOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v3 = (PHAsset *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

- (id)_imageManager
{
  void *v2;

  -[PHLivePhoto imageManager](self, "imageManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_loadConstituentURLsWithNetworkAccessAllowed:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__25110;
  v36[4] = __Block_byref_object_dispose__25111;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__25110;
  v34[4] = __Block_byref_object_dispose__25111;
  v35 = 0;
  dispatch_group_enter(v7);
  -[PHLivePhoto imageFileLoader](self, "imageFileLoader");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke;
  v30[3] = &unk_1E35DB610;
  v32 = v36;
  v33 = v34;
  v9 = v7;
  v31 = v9;
  ((void (**)(_QWORD, _BOOL8, _QWORD, _QWORD *))v8)[2](v8, v4, 0, v30);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__25110;
  v28[4] = __Block_byref_object_dispose__25111;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__25110;
  v26[4] = __Block_byref_object_dispose__25111;
  v27 = 0;
  dispatch_group_enter(v9);
  -[PHLivePhoto videoFileLoader](self, "videoFileLoader");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_2;
  v22[3] = &unk_1E35DB610;
  v24 = v28;
  v25 = v26;
  v13 = v9;
  v23 = v13;
  ((void (**)(_QWORD, _BOOL8, _QWORD, _QWORD *))v12)[2](v12, v4, 0, v22);

  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_3;
  v16[3] = &unk_1E35DB638;
  v19 = v28;
  v20 = v34;
  v21 = v26;
  v17 = v6;
  v18 = v36;
  v15 = v6;
  dispatch_group_notify(v13, v14, v16);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

- (id)videoComplement
{
  BOOL v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  PHLivePhoto *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = 0;
  v12 = 0;
  v3 = -[PHLivePhoto _synchronouslyLoadImageURL:videoURL:error:](self, "_synchronouslyLoadImageURL:videoURL:error:", &v14, &v13, &v12);
  v4 = v14;
  v5 = v13;
  v6 = v12;
  if (!v3)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to load video complement for Live Photo %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithPathToVideo:pathToImage:", v9, v8);

  return v10;
}

- (void)saveToPhotoLibraryWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E35DBB00;
  aBlock[4] = self;
  v11 = v4;
  v6 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_87;
  v8[3] = &unk_1E35DB660;
  v9 = _Block_copy(aBlock);
  v7 = v9;
  -[PHLivePhoto _loadConstituentURLsWithNetworkAccessAllowed:completionHandler:](self, "_loadConstituentURLsWithNetworkAccessAllowed:completionHandler:", 1, v8);

}

- (NSNumber)srlCompensationValue
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PHLivePhoto asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLivePhoto imageURL](self, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "livePhotoSRLCompensationAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLLivePhotoPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "Read SRL compensation amount %{public}@ from live photo asset.", (uint8_t *)&v14, 0xCu);
  }

  if (!v5)
  {
LABEL_7:
    if (!v4)
      goto LABEL_15;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageURL:contentType:timeZoneLookup:", v4, 0, 0);
    PLLivePhotoPlaybackGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = 0;
        v10 = "Read SRL compensation amount %{public}@ from live photo image URL.";
        v11 = v9;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_1991EC000, v11, v12, v10, (uint8_t *)&v14, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      v10 = "Failed to read SRL compensation metadata from image URL %@.";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    objc_msgSend(v7, "srlCompensationValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:

  return (NSNumber *)v5;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 160);
  return self;
}

- (unint64_t)options
{
  return self->_options;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (PHSandboxExtensionWrapper)imageURLSandboxExtensionWrapper
{
  return self->_imageURLSandboxExtensionWrapper;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (PHSandboxExtensionWrapper)videoURLSandboxExtensionWrapper
{
  return self->_videoURLSandboxExtensionWrapper;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (BOOL)skipInstantiatingImageAndAVAsset
{
  return self->_skipInstantiatingImageAndAVAsset;
}

- (void)setSkipInstantiatingImageAndAVAsset:(BOOL)a3
{
  self->_skipInstantiatingImageAndAVAsset = a3;
}

- (BOOL)prefersHDR
{
  return self->_prefersHDR;
}

- (PHImageManager)imageManager
{
  return (PHImageManager *)objc_loadWeakRetained((id *)&self->_imageManager);
}

- (void)setImageManager:(id)a3
{
  objc_storeWeak((id *)&self->_imageManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageManager);
  objc_storeStrong((id *)&self->_videoURLSandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_imageURLSandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_plImage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  else if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "Failed to save Live Photo (%@) to Photo Library: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_87(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  PHPhotoLibrary *v9;
  void *v10;
  PHPhotoLibrary *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    v9 = [PHPhotoLibrary alloc];
    +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHPhotoLibrary initWithPhotoLibraryURL:](v9, "initWithPhotoLibraryURL:", v10);

    -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v11, "openAndWaitWithUpgrade:error:", 0, 0);
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E35DF9E8;
    v16 = v7;
    v17 = v8;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_3;
    v13[3] = &unk_1E35DF058;
    v14 = *(id *)(a1 + 32);
    -[PHPhotoLibrary performChanges:completionHandler:](v11, "performChanges:completionHandler:", v15, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  +[PHAssetCreationRequest creationRequestForAsset](PHAssetCreationRequest, "creationRequestForAsset");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addResourceWithType:fileURL:options:", 1, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v2, "addResourceWithType:fileURL:options:", 9, *(_QWORD *)(a1 + 40), 0);

}

uint64_t __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_QWORD *__78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_3(_QWORD *result)
{
  _BOOL8 v1;
  uint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40))
    v1 = *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40) != 0;
  else
    v1 = 0;
  v2 = result[4];
  if (v2)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _BOOL8))(v2 + 16))(result[4], v1);
  return result;
}

void __30__PHLivePhoto_videoFileLoader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  PHVideoRequestOptions *v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(id, void *, _QWORD);
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "videoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      v8[2](v8, v9, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PHVideoRequestOptions);
    -[PHVideoRequestOptions setNetworkAccessAllowed:](v12, "setNetworkAccessAllowed:", a2);
    v13 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__PHLivePhoto_videoFileLoader__block_invoke_2;
      v16[3] = &unk_1E35DDA28;
      v17 = v7;
      -[PHVideoRequestOptions setProgressHandler:](v12, "setProgressHandler:", v16);

    }
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __30__PHLivePhoto_videoFileLoader__block_invoke_3;
    v14[3] = &unk_1E35DD640;
    v15 = v8;
    objc_msgSend(v10, "requestURLForVideo:options:resultHandler:", v11, v12, v14);

  }
}

uint64_t __30__PHLivePhoto_videoFileLoader__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__PHLivePhoto_videoFileLoader__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v5 = (objc_class *)MEMORY[0x1E0D732D0];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "initWithURL:sandboxExtensionToken:consume:", v6, v8, 1);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!(v9 | v10))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3164, CFSTR("resource not available locally, retry with network access allowed"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("resource not available"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, v9, v10);

}

void __30__PHLivePhoto_imageFileLoader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  PHImageRequestOptions *v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(id, void *, _QWORD);
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "imageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      v8[2](v8, v9, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PHImageRequestOptions);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v12, "setNetworkAccessAllowed:", a2);
    -[PHImageRequestOptions setSynchronous:](v12, "setSynchronous:", 1);
    v13 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__PHLivePhoto_imageFileLoader__block_invoke_2;
      v16[3] = &unk_1E35DDA28;
      v17 = v7;
      -[PHImageRequestOptions setProgressHandler:](v12, "setProgressHandler:", v16);

    }
    -[PHImageRequestOptions setLoadingMode:](v12, "setLoadingMode:", 0x10000);
    -[PHImageRequestOptions setDeliveryMode:](v12, "setDeliveryMode:", 1);
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __30__PHLivePhoto_imageFileLoader__block_invoke_3;
    v14[3] = &unk_1E35DB5C0;
    v15 = v8;
    objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 0, v12, v14, -1.0, -1.0);

  }
}

uint64_t __30__PHLivePhoto_imageFileLoader__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__PHLivePhoto_imageFileLoader__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D732D0]);
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileURLKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithURL:sandboxExtensionToken:consume:", v5, v6, 1);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!(v7 | v8))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3164, CFSTR("resource not available locally, retry with network access allowed"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("resource not available"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v7, v8);

}

void __57__PHLivePhoto__synchronouslyLoadImageURL_videoURL_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    v13 = a1 + 64;
    v14 = v10;
  }
  else
  {
    v13 = a1 + 48;
    v14 = v11;
  }
  v15 = *(_QWORD *)(*(_QWORD *)v13 + 8);
  v16 = v14;
  v17 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v16;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (PHLivePhotoRequestID)requestLivePhotoWithResourceFileURLs:(NSArray *)fileURLs placeholderImage:(UIImage *)image targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode resultHandler:(void *)resultHandler
{
  return objc_msgSend(a1, "requestLivePhotoWithResourceFileURLs:placeholderImage:targetSize:contentMode:prefersHDR:resultHandler:", fileURLs, image, contentMode, 0, resultHandler, targetSize.width, targetSize.height);
}

+ (int)requestLivePhotoWithResourceFileURLs:(id)a3 placeholderImage:(id)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 prefersHDR:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v9;
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  PHLivePhoto *v22;
  PHLivePhoto *v23;
  id v24;
  PHLivePhoto *v25;
  PHLivePhotoCreationOperation *v26;
  id v27;
  PHLivePhotoCreationOperation *v28;
  NSObject *v29;
  PHLivePhotoCreationOperation *v30;
  _QWORD v32[4];
  PHLivePhotoCreationOperation *v33;
  unsigned int v34;
  _QWORD v35[4];
  id v36;
  unsigned int v37;
  _QWORD block[4];
  PHLivePhoto *v39;
  id v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  const __CFString *v44;
  _QWORD v45[3];

  v9 = a7;
  height = a5.height;
  width = a5.width;
  v45[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__onceToken != -1)
    dispatch_once(&requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__onceToken, &__block_literal_global_25208);
  do
    v17 = __ldaxr((unsigned int *)&sCreationRequestCounter);
  while (__stlxr(v17 + 1, (unsigned int *)&sCreationRequestCounter));
  v18 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v19 = v15;
    v20 = DCIM_CGImageRefFromPLImage();
    v21 = MEMORY[0x19AEBDA80](v19);

    v22 = [PHLivePhoto alloc];
    v42 = *MEMORY[0x1E0CA2E18];
    v43 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v18 = MEMORY[0x1E0C809B0];
    v23 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:](v22, "initWithImage:uiOrientation:videoAsset:photoTime:asset:", v20, v21, 0, &v42, 0);
    v44 = CFSTR("PHLivePhotoInfoIsDegradedKey");
    v45[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_2;
    block[3] = &unk_1E35DF3B8;
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v16;
    v39 = v23;
    v24 = v40;
    v25 = v23;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v26 = [PHLivePhotoCreationOperation alloc];
  v35[0] = v18;
  v35[1] = 3221225472;
  v35[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_3;
  v35[3] = &unk_1E35DB570;
  v37 = v17 + 1;
  v36 = v16;
  v27 = v16;
  v28 = -[PHLivePhotoCreationOperation initWithResourceURLs:targetSize:contentMode:prefersHDR:resultHandler:](v26, "initWithResourceURLs:targetSize:contentMode:prefersHDR:resultHandler:", v14, a6, v9, v35, width, height);
  v29 = sOperationsByRequestQueue;
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_6;
  v32[3] = &unk_1E35DC3E8;
  v34 = v17 + 1;
  v33 = v28;
  v30 = v28;
  dispatch_sync(v29, v32);
  objc_msgSend((id)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue, "addOperation:", v30);

  return v17 + 1;
}

+ (void)cancelLivePhotoRequestWithRequestID:(PHLivePhotoRequestID)requestID
{
  _QWORD block[4];
  PHLivePhotoRequestID v4;

  if (sOperationsByRequestQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PHLivePhoto_cancelLivePhotoRequestWithRequestID___block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v4 = requestID;
    dispatch_sync((dispatch_queue_t)sOperationsByRequestQueue, block);
  }
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 error:(id *)a4
{
  return (PHLivePhoto *)objc_msgSend(a1, "livePhotoWithResourceFileURLs:prefersHDR:error:", a3, 0, a4);
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 prefersHDR:(BOOL)a4 error:(id *)a5
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 error:(id *)a7
{
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a5;
  v9 = *a6;
  BYTE2(v8) = 0;
  LOWORD(v8) = 0;
  objc_msgSend(a1, "_livePhotoWithResourceFileURLs:pairingIdentifier:videoDuration:photoTime:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, a4, &v10, &v9, 1, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v8, a7);
  return (PHLivePhoto *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)loopingLivePhotoWithResourceFileURLs:(id)a3 skipInstantiatingImageAndAVAsset:(BOOL)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, 1, a4, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), a5);
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 error:(id *)a7
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, a6, 0, a7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8
{
  return (id)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, 0, a6, a7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), a8);
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, a5, a6, 0, 0, a7, a4.width, a4.height, a8);
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 isLooping:(BOOL)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9 error:(id *)a10
{
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v14 = *MEMORY[0x1E0CA2E18];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v12 = v14;
  v13 = v15;
  BYTE2(v11) = a9;
  BYTE1(v11) = a8;
  LOBYTE(v11) = a7;
  objc_msgSend(a1, "_livePhotoWithResourceFileURLs:pairingIdentifier:videoDuration:photoTime:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 0, &v14, &v12, a5, a6, a4.width, a4.height, v11, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 skipValidation:(BOOL)a9 isLooping:(BOOL)a10 skipInstantiatingImageAndAVAsset:(BOOL)a11 prefersHDR:(BOOL)a12 error:(id *)a13
{
  double height;
  double width;
  id *v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id *v37;
  objc_class *v38;
  char v39;
  void *v40;
  unint64_t v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *v46;
  id v47;
  _BOOL4 v48;
  os_signpost_id_t spid;
  unint64_t v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  int64_t v55;
  uint8_t buf[16];
  int64_t var3;
  id v58;
  id v59;
  id v60;
  id v61[2];

  v48 = a9;
  height = a7.height;
  width = a7.width;
  v19 = a13;
  v20 = a3;
  v51 = a4;
  PLPhotoKitGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_make_with_pointer(v21, v20);

  PLPhotoKitGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v50 = v22 - 1;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "com.apple.photos.photokit.phlivephoto", ", buf, 2u);
  }
  spid = v22;

  v60 = 0;
  v61[0] = 0;
  v59 = 0;
  v25 = objc_msgSend(a1, "_identifyResourceURLs:outImageURL:outVideoURL:error:", v20, v61, &v60, &v59);
  v26 = v61[0];
  v27 = v60;
  v28 = v59;
  if (v25)
  {
    v46 = (objc_class *)a1;
    v47 = v27;
    v29 = (void *)MEMORY[0x1E0C8AF90];
    v30 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v27, "path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fileURLWithPath:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "assetWithURL:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v33;
    v58 = v28;
    *(_OWORD *)buf = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v54 = *(_OWORD *)&a6->var0;
    v55 = a6->var3;
    PFVideoComplementMetadataForVideoAVAssetWithKnownValues();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v58;

    if (v35)
    {
      if (a10)
      {
        v53 = v36;
        v37 = &v53;
        v38 = v46;
        v39 = -[objc_class _canCreateLoopingLivePhotoWithURLs:videoComplementMetadata:outError:](v46, "_canCreateLoopingLivePhotoWithURLs:videoComplementMetadata:outError:", v20, v35, &v53);
      }
      else
      {
        v52 = v36;
        v37 = &v52;
        v38 = v46;
        v39 = -[objc_class _canCreateLivePhotoWithURLs:videoComplementMetadata:outError:](v46, "_canCreateLivePhotoWithURLs:videoComplementMetadata:outError:", v20, v35, &v52);
      }
      v42 = v39;
      v41 = v50;
      v28 = *v37;

      if ((v42 & 1) != 0 || v48)
      {
        v27 = v47;
        v40 = (void *)objc_msgSend([v38 alloc], "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:", v26, v47, v35, 1, a11, a12, width, height);
        v19 = a13;
      }
      else
      {
        v40 = 0;
        v27 = v47;
        v19 = a13;
      }
    }
    else
    {
      v40 = 0;
      v28 = v36;
      v27 = v47;
      v19 = a13;
      v41 = v50;
    }

  }
  else
  {
    v40 = 0;
    v41 = v50;
  }
  PLPhotoKitGetLog();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v44, OS_SIGNPOST_INTERVAL_END, spid, "com.apple.photos.photokit.phlivephoto", ", buf, 2u);
  }

  if (v19)
    *v19 = objc_retainAutorelease(v28);

  return v40;
}

+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6
{
  id v6;
  void (**v7)(void *, void *);
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v22;
  void *v23;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__25110;
  v40 = __Block_byref_object_dispose__25111;
  v41 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PHLivePhoto__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke;
  aBlock[3] = &unk_1E35DF858;
  aBlock[4] = &v36;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (!v8)
  {

    v28 = 0;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing image fileURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20);

    v29 = 0;
    goto LABEL_22;
  }
  v28 = 0;
  v29 = 0;
  v9 = *(_QWORD *)v32;
  v10 = *MEMORY[0x1E0CEC520];
  v11 = *MEMORY[0x1E0CEC568];
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      v14 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v13, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "typeWithFilenameExtension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (objc_msgSend(v16, "conformsToType:", v10))
        {
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Multiple image fileURLs"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v17);

          }
          else
          {
            v29 = v13;
          }
        }
        else if (objc_msgSend(v16, "conformsToType:", v11))
        {
          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Multiple video fileURLs"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v18);

          }
          else
          {
            v28 = v13;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unknown type for fileURL %@"), v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v19);

        }
      }

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  }
  while (v8);

  if (!v29)
    goto LABEL_21;
LABEL_22:
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing video fileURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v21);

  }
  v22 = v37[5];
  if (v22)
  {
    v23 = (void *)v37[5];
    a5 = a6;
    if (!a6)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v29);
  v23 = v28;
  if (a5)
LABEL_30:
    *a5 = objc_retainAutorelease(v23);
LABEL_31:

  _Block_object_dispose(&v36, 8);
  return v22 == 0;
}

+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5
{
  return objc_msgSend(a1, "_validateFileURLs:validationOptions:videoComplementMetadata:outError:", a3, 66, a4, a5);
}

+ (BOOL)_canCreateLoopingLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5
{
  return objc_msgSend(a1, "_validateFileURLs:validationOptions:videoComplementMetadata:outError:", a3, 2, a4, a5);
}

+ (BOOL)_validateFileURLs:(id)a3 validationOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  PHValidator *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;

  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(PHValidator);
  v16 = 0;
  v12 = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](v11, "validateURLs:withOptions:videoComplementMetadata:error:", v10, a4, v9, &v16);

  v13 = v16;
  v14 = v13;
  if (a6 && !v12)
    *a6 = objc_retainAutorelease(v13);

  return v12;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_photoTimeForLivePhotoWithImageURL:(SEL)a3 videoURL:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v13;
  int64_t v14;

  v7 = a5;
  objc_msgSend(a4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (v8 && v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithPathToVideo:pathToImage:", v9, v8);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "imageDisplayTime");
    }
    else
    {
      v13 = 0uLL;
      v14 = 0;
    }
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var3 = v14;

  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __67__PHLivePhoto__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Failed to create live photo: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v5 + 40))
  {
    if (v3)
    {
      v6 = v3;
      v7 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
    }

  }
}

void __51__PHLivePhoto_cancelLivePhotoRequestWithRequestID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sCreationOperationsByRequestID, "objectForKeyedSubscript:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");
  objc_msgSend((id)sCreationOperationsByRequestID, "removeObjectForKey:", v2);

}

uint64_t __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  int v18;

  v7 = a2;
  v8 = a3;
  v9 = MEMORY[0x1E0C809B0];
  if (a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_4;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v18 = *(_DWORD *)(a1 + 40);
    dispatch_sync((dispatch_queue_t)sOperationsByRequestQueue, block);
  }
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_5;
  v13[3] = &unk_1E35DF3B8;
  v10 = *(id *)(a1 + 32);
  v15 = v8;
  v16 = v10;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)sCreationOperationsByRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)sCreationOperationsByRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

uint64_t __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue;
  requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue = (uint64_t)v0;

  objc_msgSend((id)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue, "setQualityOfService:", 25);
  v2 = dispatch_queue_create("com.apple.livephoto.creationoperationsbyid", 0);
  v3 = (void *)sOperationsByRequestQueue;
  sOperationsByRequestQueue = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sCreationOperationsByRequestID;
  sCreationOperationsByRequestID = v4;

}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  PFCurrentPlatformLivePhotoBundleType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  PHLivePhoto *v27;
  PHLivePhoto *v28;
  int next_header;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  int data_block;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  uint64_t v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  id *v53;
  id v54;
  void *v55;
  id v56;
  id v57[5];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PFIsLivePhotoBundleType();

  if (!v10)
    goto LABEL_15;
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", *MEMORY[0x1E0D75488]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "temporaryDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("live-photo-bundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = 0;
  LODWORD(v16) = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, v57);
  v20 = v57[0];

  if (!(_DWORD)v16)
  {
    PLPhotoKitGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v59 = (uint64_t)v18;
      v60 = 2112;
      v61 = v20;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "Failed to create directory (%@) to unzip bundle: %@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  archive_read_new();
  archive_read_support_format_all();
  archive_read_support_filter_all();
  v21 = objc_retainAutorelease(v11);
  objc_msgSend(v21, "bytes");
  objc_msgSend(v21, "length");
  if (!archive_read_open_memory())
  {
    archive_write_disk_new();
    archive_write_disk_set_options();
    archive_write_disk_set_standard_lookup();
    v55 = v14;
    v56 = v18;
    v57[1] = 0;
    v53 = a5;
    v54 = v7;
    v52 = v8;
LABEL_20:
    next_header = archive_read_next_header();
    if (next_header)
    {
      v48 = next_header;
      if (next_header == 1)
      {
LABEL_37:

        archive_write_free();
        archive_read_free();
        if (v48 == 1)
          v25 = v56;
        else
          v25 = 0;
        goto LABEL_11;
      }
      PLPhotoKitGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v49 = archive_error_string();
        *(_DWORD *)buf = 136315138;
        v59 = v49;
        _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "Failed to read zipped bundle (unable to read header): %s", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject pathComponents](v31, "pathComponents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v32, "count") < 2)
    {
      PLPhotoKitGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = (uint64_t)v32;
        v44 = "Failed to read zipped bundle (invalid path components): %@";
LABEL_33:
        _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
      }
    }
    else
    {
      v33 = v18;
      v34 = v20;
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v32, "subarrayWithRange:", 1, objc_msgSend(v32, "count") - 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pathWithComponents:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v38 = v37;
      objc_msgSend(v56, "URLByAppendingPathComponent:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "path");
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v40, "fileSystemRepresentation");
      archive_entry_set_pathname();

      v41 = archive_write_header();
      if (v41)
      {
        v48 = v41;
        PLPhotoKitGetLog();
        v50 = objc_claimAutoreleasedReturnValue();
        v20 = v34;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = archive_error_string();
          *(_DWORD *)buf = 136315138;
          v59 = v51;
          _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_ERROR, "Failed to unzip bundle (unable to write header): %s", buf, 0xCu);
        }

        v18 = v33;
        a5 = v53;
        v7 = v54;
        v31 = v38;
        v8 = v52;
        goto LABEL_35;
      }
      v20 = v34;
      v18 = v33;
      a5 = v53;
      v7 = v54;
      v31 = v38;
      v8 = v52;
      do
      {
        memset(&v57[2], 0, 24);
        data_block = archive_read_data_block();
        if (data_block)
        {
          if (data_block == 1)
          {

            v14 = v55;
            goto LABEL_20;
          }
          PLPhotoKitGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v43 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            v59 = v43;
            v44 = "Failed to read zipped bundle (unable to read data): %s";
            goto LABEL_33;
          }
          goto LABEL_34;
        }
      }
      while (archive_write_data_block() != -1);
      PLPhotoKitGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v47 = archive_error_string();
        *(_DWORD *)buf = 136315138;
        v59 = v47;
        v44 = "Failed to unzip bundle (unable to write data): %s";
        goto LABEL_33;
      }
    }
LABEL_34:

    v48 = -25;
LABEL_35:

    v14 = v55;
    goto LABEL_36;
  }
  PLPhotoKitGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = archive_error_string();
    *(_DWORD *)buf = 136315138;
    v59 = v23;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Failed to open zipped bundle: %s", buf, 0xCu);
  }

  archive_read_free();
LABEL_10:
  v25 = 0;
LABEL_11:
  v26 = v25;

  if (v26)
  {
    v27 = -[PHLivePhoto initWithBundleAtURL:]([PHLivePhoto alloc], "initWithBundleAtURL:", v26);
    if (v27)
    {
      v28 = v27;

      goto LABEL_18;
    }
  }

LABEL_15:
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_18:

  return v28;
}

@end
