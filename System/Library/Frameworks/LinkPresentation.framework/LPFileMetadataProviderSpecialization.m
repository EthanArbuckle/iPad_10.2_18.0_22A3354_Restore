@implementation LPFileMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 2;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  char v5;
  LPFileMetadataProviderSpecialization *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "fetchIsNotUserInitiated") & 1) != 0
    || (objc_msgSend(v3, "URL"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isFileURL"),
        v4,
        (v5 & 1) == 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPFileMetadataProviderSpecialization alloc], "initWithContext:", v3);
  }

  return v6;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  LPFileMetadataProviderSpecialization *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "fetchIsNotUserInitiated") & 1) != 0
    || !objc_msgSend(v3, "hasLoadedResource")
    || (objc_msgSend(v3, "MIMEType"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = +[LPMIMETypeRegistry isWebPageType:](LPMIMETypeRegistry, "isWebPageType:", v4),
        v4,
        v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPFileMetadataProviderSpecialization alloc], "initWithContext:", v3);
  }

  return v6;
}

+ (id)_thumbnailQueue
{
  if (+[LPFileMetadataProviderSpecialization _thumbnailQueue]::onceToken != -1)
    dispatch_once(&+[LPFileMetadataProviderSpecialization _thumbnailQueue]::onceToken, &__block_literal_global_26);
  return (id)+[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue;
}

void __55__LPFileMetadataProviderSpecialization__thumbnailQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.LinkPresentation.FileThumbnailQueue", v2);
  v1 = (void *)+[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue;
  +[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue = (uint64_t)v0;

}

- (void)start
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD block[5];

  -[LPMetadataProviderSpecialization context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fetchIsNotUserInitiated");

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__LPFileMetadataProviderSpecialization_start__block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[LPMetadataProviderSpecialization context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasLoadedResource");

    if ((v6 & 1) != 0)
    {
      -[LPMetadataProviderSpecialization context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "webView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __45__LPFileMetadataProviderSpecialization_start__block_invoke_2;
      v10[3] = &unk_1E44AA310;
      v10[4] = self;
      objc_msgSend(v8, "_getMainResourceDataWithCompletionHandler:", v10);

    }
    else
    {
      -[LPMetadataProviderSpecialization URL](self, "URL");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[LPFileMetadataProviderSpecialization fetchMetadataFromURL:](self, "fetchMetadataFromURL:");

    }
  }
}

void __45__LPFileMetadataProviderSpecialization_start__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecializationDidFail:", *(_QWORD *)(a1 + 32));

}

void __45__LPFileMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  LPImage *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMEType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

  +[LPMIMETypeRegistry fileExtensionForMIMEType:](LPMIMETypeRegistry, "fileExtensionForMIMEType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 32);
  *(_QWORD *)(v16 + 32) = v15;

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "URLByAppendingPathExtension:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 32);
    *(_QWORD *)(v19 + 32) = v18;

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "webView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_isDisplayingStandaloneImageDocument");

  if (v23)
  {
    v24 = -[LPImage initWithData:MIMEType:]([LPImage alloc], "initWithData:MIMEType:", v27, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  objc_msgSend(v27, "writeToURL:atomically:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "fetchMetadataFromURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

- (void)requestQuickLookThumbnailForURL:(id)a3 size:(CGSize)a4 badgeType:(unint64_t)a5 image:(id *)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32C8]), "initWithFileAtURL:size:scale:representationTypes:", v11, 4, width, height, 3.0);
  objc_msgSend(v12, "setBadgeType:", a5);
  dispatch_group_enter((dispatch_group_t)self->_fetchGroup);
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke;
  v14[3] = &unk_1E44AA338;
  v14[4] = self;
  v14[5] = a6;
  objc_msgSend(v13, "generateBestRepresentationForRequest:completionHandler:", v12, v14);

}

void __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void **v16;
  void *v17;
  uint8_t v18[16];

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "CGImage"))
  {
    v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v14 = LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPFileMetadataProviderSpecialization retrieved a thumbnail from QuickLookThumbnailing", v18, 2u);
    }
    v15 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", objc_msgSend(v5, "CGImage"));
    v16 = *(void ***)(a1 + 40);
    v17 = *v16;
    *v16 = v15;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));

}

- (void)fetchIconAndThumbnailFromQuickLookForURL:(id)a3
{
  NSString *UTI;
  NSString *v5;
  NSString *v6;
  double v7;
  id v8;

  v8 = a3;
  if (!self->_originalImage)
  {
    UTI = self->_UTI;
    v5 = self->_MIMEType;
    v6 = UTI;
    if (+[LPMIMETypeRegistry isARAssetType:](LPMIMETypeRegistry, "isARAssetType:", v5))
    {
      v7 = 225.0;
    }
    else if (-[NSString _lp_isEqualIgnoringCase:](v6, "_lp_isEqualIgnoringCase:", CFSTR("com.apple.watchface")))
    {
      v7 = 300.0;
    }
    else
    {
      v7 = 600.0;
    }

    -[LPFileMetadataProviderSpecialization requestQuickLookThumbnailForURL:size:badgeType:image:](self, "requestQuickLookThumbnailForURL:size:badgeType:image:", v8, 0, &self->_quickLookThumbnail, 300.0, v7);
    if (+[LPMIMETypeRegistry isARAssetType:](LPMIMETypeRegistry, "isARAssetType:", self->_MIMEType))
      -[LPFileMetadataProviderSpecialization requestQuickLookThumbnailForURL:size:badgeType:image:](self, "requestQuickLookThumbnailForURL:size:badgeType:image:", v8, 1, &self->_smallQuickLookThumbnail, 75.0, 75.0);
  }

}

- (void)fetchMetadataFromURL:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  LPLinkMetadata *metadata;
  void *v7;
  void *v8;
  LPFileMetadata *v9;
  LPFileMetadata *fileMetadata;
  OS_dispatch_group *v11;
  OS_dispatch_group *fetchGroup;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[4];
  id v20;
  LPFileMetadataProviderSpecialization *v21;

  v4 = a3;
  v5 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v5;

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](self->_metadata, "setURL:", v7);

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", v8);

  v9 = objc_alloc_init(LPFileMetadata);
  fileMetadata = self->_fileMetadata;
  self->_fileMetadata = v9;

  if (self->_originalImage)
    -[LPFileMetadata setThumbnail:](self->_fileMetadata, "setThumbnail:");
  v11 = (OS_dispatch_group *)dispatch_group_create();
  fetchGroup = self->_fetchGroup;
  self->_fetchGroup = v11;

  v13 = self->_fetchGroup;
  +[LPFileMetadataProviderSpecialization _thumbnailQueue](LPFileMetadataProviderSpecialization, "_thumbnailQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke;
  block[3] = &unk_1E44A7D10;
  v20 = v4;
  v21 = self;
  v16 = v4;
  dispatch_group_async(v13, v14, block);

  v17 = self->_fetchGroup;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke_2;
  v18[3] = &unk_1E44A7CE8;
  v18[4] = self;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], v18);

}

void __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "URLByResolvingSymlinksInPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "checkPromisedItemIsReachableAndReturnError:", 0);
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "fetchMetadataForReachableFile:", v4);
  else
    objc_msgSend(v3, "generateFallbackMetadataForUnreachableFile:", v4);

}

uint64_t __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    objc_msgSend(*(id *)(v2 + 88), "setThumbnail:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 56))
  {
    objc_msgSend(*(id *)(v2 + 88), "setSmallThumbnail:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 80), "setSpecialization:", *(_QWORD *)(v2 + 88));
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

- (BOOL)shouldUseQuickLookForFileType
{
  return !+[LPMIMETypeRegistry isAudioType:](LPMIMETypeRegistry, "isAudioType:", self->_MIMEType);
}

- (void)fetchMetadataForReachableFile:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  char v8;
  LPImageProperties *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  NSString *MIMEType;
  NSString *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  CGImage *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  void *v50;
  uint64_t v51;
  id v52;
  NSString *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  id v69;
  void *v70;
  LPMetadataProviderSpecializationContext *v71;
  NSString *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  LPMetadataProviderSpecializationContext *v80;
  void *v81;
  id v82;
  NSString *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id *location;
  id *locationa;
  id v89;
  void *v90;
  _QWORD block[4];
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  _BYTE v100[128];
  _QWORD v101[2];
  _QWORD v102[5];

  v102[3] = *MEMORY[0x1E0C80C00];
  location = (id *)&self->_UTI;
  v89 = a3;
  if (!*location)
  {
    if (!self->_MIMEType
      || (+[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:"),
          v11 = objc_claimAutoreleasedReturnValue(),
          v12 = *location,
          *location = (id)v11,
          v12,
          !*location))
    {
      v99 = 0;
      objc_msgSend(v89, "getPromisedItemResourceValue:forKey:error:", &v99, *MEMORY[0x1E0C99AD0], 0);
      v13 = v99;
      v14 = v99;
      objc_storeStrong(location, v13);
      MIMEType = self->_MIMEType;
      if (MIMEType)
      {
        v16 = MIMEType;
      }
      else
      {
        +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", v14);
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v49 = self->_MIMEType;
      self->_MIMEType = v16;

      if (!*location)
      {
        objc_msgSend(v89, "pathExtension");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPMIMETypeRegistry UTIForFileExtension:](LPMIMETypeRegistry, "UTIForFileExtension:", v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = *location;
        *location = (id)v51;

        v53 = self->_MIMEType;
        if (v53)
        {
          v54 = v53;
        }
        else
        {
          +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", *location);
          v54 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v83 = self->_MIMEType;
        self->_MIMEType = v54;

      }
    }
  }
  -[LPMetadataProviderSpecialization context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldFetchSubresources"))
  {
    v5 = -[LPFileMetadataProviderSpecialization shouldUseQuickLookForFileType](self, "shouldUseQuickLookForFileType");

    if (v5)
      -[LPFileMetadataProviderSpecialization fetchIconAndThumbnailFromQuickLookForURL:](self, "fetchIconAndThumbnailFromQuickLookForURL:", v89);
  }
  else
  {

  }
  v6 = *location;
  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA538], "interactionControllerWithURL:", v89);
    v9 = (LPImageProperties *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata icon](self->_fileMetadata, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

LABEL_16:
      goto LABEL_17;
    }
    -[LPMetadataProviderSpecialization context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldFetchSubresources");

    if (!v18)
      goto LABEL_16;
    -[LPImageProperties icons](v9, "icons");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CGImageRetain((CGImageRef)objc_msgSend(v20, "_lp_CGImage"));

    if (v21)
    {
      v9 = objc_alloc_init(LPImageProperties);
      -[LPImageProperties setType:](v9, "setType:", 5);
      v22 = -[LPImage _initWithCGImage:properties:]([LPImage alloc], "_initWithCGImage:properties:", v21, v9);
      -[LPFileMetadata setIcon:](self->_fileMetadata, "setIcon:", v22);

      CGImageRelease(v21);
      goto LABEL_16;
    }
  }
LABEL_17:
  v23 = *MEMORY[0x1E0C99998];
  v24 = *MEMORY[0x1E0C998E8];
  v102[0] = *MEMORY[0x1E0C99998];
  v102[1] = v24;
  v85 = *MEMORY[0x1E0C999D0];
  v102[2] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  objc_msgSend(v89, "promisedItemResourceValuesForKeys:error:", v25, &v98);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v98;

  if (!v90)
  {
    v26 = LPLogChannelFetching();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[LPFileMetadataProviderSpecialization fetchMetadataForReachableFile:].cold.1((uint64_t)v86, v26, v27, v28, v29, v30, v31, v32);
  }
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isFileURL");

  if (!v34)
  {
    -[LPMetadataProviderSpecialization URL](self, "URL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "lastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringByDeletingPathExtension");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setName:](self->_fileMetadata, "setName:", v44);
LABEL_26:

    goto LABEL_37;
  }
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0C999B0];
  v101[0] = *MEMORY[0x1E0C99A70];
  v36 = v101[0];
  v101[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "promisedItemResourceValuesForKeys:error:", v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "objectForKey:", v36);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMetadataProviderSpecialization URL](self, "URL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "displayNameAtPath:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setName:](self->_fileMetadata, "setName:", v46);

    v42 = 0;
    goto LABEL_26;
  }
  if ((v8 & 1) != 0)
  {
    v42 = (void *)v40;
  }
  else
  {
    objc_msgSend(v39, "objectForKey:", v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47 && (objc_msgSend(v47, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v41, "stringByDeletingPathExtension");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = v41;
    }

  }
  -[LPFileMetadata setName:](self->_fileMetadata, "setName:", v42);
LABEL_37:

  -[LPFileMetadata setType:](self->_fileMetadata, "setType:", *location);
  objc_msgSend(v90, "objectForKeyedSubscript:", v24);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata setCreationDate:](self->_fileMetadata, "setCreationDate:", v55);

  objc_msgSend(v90, "objectForKeyedSubscript:", v23);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata setSize:](self->_fileMetadata, "setSize:", objc_msgSend(v56, "unsignedLongLongValue"));

  if (!-[LPFileMetadata size](self->_fileMetadata, "size"))
  {
    objc_msgSend(v90, "objectForKeyedSubscript:", v85);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "BOOLValue");

    if (v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v89, v60, 0, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v62 = v61;
      v63 = 0;
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
      if (v64)
      {
        v65 = *(_QWORD *)v95;
        do
        {
          v66 = 0;
          do
          {
            if (*(_QWORD *)v95 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v66);
            v93 = 0;
            v68 = objc_msgSend(v67, "getResourceValue:forKey:error:", &v93, v23, 0);
            v69 = v93;
            v70 = v69;
            if (v68)
              v63 += objc_msgSend(v69, "integerValue");

            ++v66;
          }
          while (v64 != v66);
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
        }
        while (v64);
      }

      -[LPFileMetadata setSize:](self->_fileMetadata, "setSize:", v63);
    }
  }
  -[LPLinkMetadata setSpecialization:](self->_metadata, "setSpecialization:", self->_fileMetadata);
  -[LPFileMetadataProviderSpecialization updatePreliminaryMetadata](self, "updatePreliminaryMetadata");
  if (+[LPMIMETypeRegistry isMediaType:](LPMIMETypeRegistry, "isMediaType:", self->_MIMEType))
  {
    v71 = [LPMetadataProviderSpecializationContext alloc];
    -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
    locationa = (id *)objc_claimAutoreleasedReturnValue();
    v72 = self->_MIMEType;
    -[LPMetadataProviderSpecialization context](self, "context");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "webView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMetadataProviderSpecialization context](self, "context");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "shouldFetchSubresources");
    -[LPMetadataProviderSpecialization context](self, "context");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "allowedSpecializations");
    -[LPMetadataProviderSpecialization context](self, "context");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v84) = objc_msgSend(v79, "fetchIsNotUserInitiated");
    v80 = -[LPMetadataProviderSpecializationContext initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:](v71, "initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:", locationa, v89, v72, v74, 1, v76, v78, v84);

    +[LPStreamingMediaMetadataProviderSpecialization specializedMetadataProviderForResourceWithContext:](LPStreamingMediaMetadataProviderSpecialization, "specializedMetadataProviderForResourceWithContext:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setDelegate:", self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__LPFileMetadataProviderSpecialization_fetchMetadataForReachableFile___block_invoke;
    block[3] = &unk_1E44A7CE8;
    v92 = v81;
    v82 = v81;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    dispatch_group_enter((dispatch_group_t)self->_fetchGroup);

  }
}

uint64_t __70__LPFileMetadataProviderSpecialization_fetchMetadataForReachableFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)generateFallbackMetadataForUnreachableFile:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *UTI;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CGImage *v15;
  LPImageProperties *v16;
  id v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPMIMETypeRegistry UTIForFileExtension:](LPMIMETypeRegistry, "UTIForFileExtension:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  UTI = self->_UTI;
  self->_UTI = v5;

  -[LPFileMetadata setType:](self->_fileMetadata, "setType:", self->_UTI);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata setName:](self->_fileMetadata, "setName:", v10);

  -[LPMetadataProviderSpecialization context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "shouldFetchSubresources");

  if ((_DWORD)v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CEA538]);
    objc_msgSend(v12, "setUTI:", self->_UTI);
    objc_msgSend(v12, "icons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CGImageRetain((CGImageRef)objc_msgSend(v14, "_lp_CGImage"));

    if (v15)
    {
      v16 = objc_alloc_init(LPImageProperties);
      -[LPImageProperties setType:](v16, "setType:", 5);
      v17 = -[LPImage _initWithCGImage:properties:]([LPImage alloc], "_initWithCGImage:properties:", v15, v16);
      -[LPFileMetadata setIcon:](self->_fileMetadata, "setIcon:", v17);

      CGImageRelease(v15);
    }

  }
}

- (void)cleanUpTemporaryFile
{
  id v3;

  if (self->_temporaryFileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", self->_temporaryFileURL, 0);

  }
}

- (void)cancel
{
  self->_cancelled = 1;
  -[LPFileMetadataProviderSpecialization cleanUpTemporaryFile](self, "cleanUpTemporaryFile");
}

- (void)updatePreliminaryMetadata
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)-[LPLinkMetadata copy](self->_metadata, "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__LPFileMetadataProviderSpecialization_updatePreliminaryMetadata__block_invoke;
  v5[3] = &unk_1E44A7D10;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __65__LPFileMetadataProviderSpecialization_updatePreliminaryMetadata__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecialization:didFetchPreliminaryMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)complete
{
  _QWORD block[5];

  -[LPFileMetadataProviderSpecialization cleanUpTemporaryFile](self, "cleanUpTemporaryFile");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__LPFileMetadataProviderSpecialization_complete__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __48__LPFileMetadataProviderSpecialization_complete__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecialization:didCompleteWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

}

- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setVideo:](self->_metadata, "setVideo:", v5);

  objc_msgSend(v9, "videoMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setVideoMetadata:](self->_metadata, "setVideoMetadata:", v6);

  objc_msgSend(v9, "audio");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setAudio:](self->_metadata, "setAudio:", v7);

  objc_msgSend(v9, "audioMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setAudioMetadata:](self->_metadata, "setAudioMetadata:", v8);

  dispatch_group_leave((dispatch_group_t)self->_fetchGroup);
}

- (void)metadataProviderSpecializationDidFail:(id)a3
{
  dispatch_group_leave((dispatch_group_t)self->_fetchGroup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_smallQuickLookThumbnail, 0);
  objc_storeStrong((id *)&self->_quickLookThumbnail, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

void __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "LPFileMetadataProviderSpecialization failed to retrieve a thumbnail from QuickLookThumbnailing (%@)", a5, a6, a7, a8, 2u);
}

- (void)fetchMetadataForReachableFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "Failed to retrieve size and creation date of file: %@", a5, a6, a7, a8, 2u);
}

@end
