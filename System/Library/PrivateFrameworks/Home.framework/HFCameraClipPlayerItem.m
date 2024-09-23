@implementation HFCameraClipPlayerItem

+ (id)playlistURL
{
  if (_MergedGlobals_3_1 != -1)
    dispatch_once(&_MergedGlobals_3_1, &__block_literal_global_2_12);
  return (id)qword_1ED378648;
}

void __37__HFCameraClipPlayerItem_playlistURL__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("HFCC://clipPlaylist.m3u8"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378648;
  qword_1ED378648 = v0;

}

+ (id)_assetOptionsForClip:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "videoAssetRequiredHTTPHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C8AD68]);
  return v4;
}

- (HFCameraClipPlayerItem)initWithClipManager:(id)a3 clip:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  HFCameraClipPlayerItem *v20;
  void *v21;
  uint64_t v22;
  HFCameraClipVideoAssetContextProvider *videoContextProvider;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  const __CFString *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraClipPlayerItem.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clipManager != nil"));

    if (v10)
      goto LABEL_3;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraClipPlayerItem.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clip != nil"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_28;
LABEL_3:
  if (+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")|| +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    v11 = 0;
  }
  else
  {
    +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0))
    {
      HFLogForCategory(0xDuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "relativePath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hf_prettyDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = "-[HFCameraClipPlayerItem initWithClipManager:clip:]";
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "%s instantiating with cached file: %@; clip: %@",
          buf,
          0x20u);

      }
      -[HFCameraClipPlayerItem setIsUsingCachedVideoOnDisk:](self, "setIsUsingCachedVideoOnDisk:", 1);
    }
  }
  if (-[HFCameraClipPlayerItem isUsingCachedVideoOnDisk](self, "isUsingCachedVideoOnDisk"))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "playlistURL");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_assetOptionsForClip:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0xDuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "hf_prettyDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[HFCameraClipPlayerItem initWithClipManager:clip:]";
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%s: instantiating with HLS playlist for clip: %@", buf, 0x16u);

    }
    v11 = (void *)v13;
  }
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    objc_msgSend(v10, "clipURL");
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v11 = (void *)v16;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v11, v12);
  if (-[HFCameraClipPlayerItem isUsingCachedVideoOnDisk](self, "isUsingCachedVideoOnDisk"))
  {
    v18 = 0;
  }
  else
  {
    if (qword_1ED378650 != -1)
      dispatch_once(&qword_1ED378650, &__block_literal_global_18_2);
    v18 = (id)qword_1ED378658;
  }
  v31 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)HFCameraClipPlayerItem;
  v20 = -[HFCameraClipPlayerItem initWithAsset:automaticallyLoadedAssetKeys:](&v30, sel_initWithAsset_automaticallyLoadedAssetKeys_, v17, v19);

  if (v20)
  {
    if (!-[HFCameraClipPlayerItem isUsingCachedVideoOnDisk](v20, "isUsingCachedVideoOnDisk"))
    {
      objc_msgSend(v17, "resourceLoader");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDelegate:queue:", v20, v18);

      objc_storeStrong((id *)&v20->_resourceLoaderQueue, v18);
      +[HFCameraClipVideoAssetContextProvider defaultProvider](HFCameraClipVideoAssetContextProvider, "defaultProvider");
      v22 = objc_claimAutoreleasedReturnValue();
      videoContextProvider = v20->_videoContextProvider;
      v20->_videoContextProvider = (HFCameraClipVideoAssetContextProvider *)v22;

    }
    objc_storeStrong((id *)&v20->_clipManager, a3);
    objc_storeStrong((id *)&v20->_clip, a4);
  }

  return v20;
}

void __51__HFCameraClipPlayerItem_initWithClipManager_clip___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.Home.cameraClipPlayerResourceLoaderQueue", v2);
  v1 = (void *)qword_1ED378658;
  qword_1ED378658 = (uint64_t)v0;

}

- (BOOL)isPlayable
{
  void *v2;
  BOOL v3;

  -[HFCameraClipPlayerItem error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  BOOL v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  HFCameraClipPlayerItem *v48;
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x17uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraClipPlayerItem clip](self, "clip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v52 = v10;
    v53 = 2112;
    v54 = v6;
    v55 = 2112;
    v56 = v11;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Received resource loader request for clip %@: %@ loadingRequest:%@", buf, 0x20u);

  }
  objc_msgSend(v7, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB8408]);

  if (v15)
  {
    -[HFCameraClipPlayerItem clip](self, "clip");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encryptionKey");
    v17 = objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x17uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "request");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "URL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraClipPlayerItem clip](self, "clip");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v52 = v41;
        v53 = 2112;
        v54 = v42;
        _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Asked to load resource for URL %@ but clip has no encryption key: %@", buf, 0x16u);

      }
      v38 = 0;
      v17 = v19;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraClipPlayerItem clip](self, "clip");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v21;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Returning encryption key for clip:%@", buf, 0xCu);

    }
    v22 = *MEMORY[0x1E0C8AD20];
    objc_msgSend(v7, "contentInformationRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentType:", v22);

    v24 = -[NSObject length](v17, "length");
    objc_msgSend(v7, "contentInformationRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentLength:", v24);

    objc_msgSend(v7, "dataRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "respondWithData:", v17);

    objc_msgSend(v7, "finishLoading");
LABEL_10:
    v38 = 1;
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v7, "request");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "playlistURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if (v30)
  {
    -[HFCameraClipPlayerItem videoContextProvider](self, "videoContextProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayerItem clip](self, "clip");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayerItem clipManager](self, "clipManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchVideoAssetContextForClip:clipManager:", v32, v33);
    v17 = objc_claimAutoreleasedReturnValue();

    v34 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    v49[3] = &unk_1EA726360;
    v49[4] = self;
    v35 = v7;
    v50 = v35;
    v36 = (id)-[NSObject addFailureBlock:](v17, "addFailureBlock:", v49);
    v46[0] = v34;
    v46[1] = 3221225472;
    v46[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_25;
    v46[3] = &unk_1EA732768;
    v47 = v35;
    v48 = self;
    v37 = (id)-[NSObject addSuccessBlock:](v17, "addSuccessBlock:", v46);

    goto LABEL_10;
  }
  if (!+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    HFLogForCategory(0x17uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "request");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "URL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraClipPlayerItem clip](self, "clip");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v44;
      v53 = 2112;
      v54 = v45;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "Asked to load resource for unexpected URL %@ for clip: %@", buf, 0x16u);

    }
    v38 = 0;
    goto LABEL_19;
  }
  v38 = 1;
LABEL_20:

  return v38;
}

void __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x17uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "clip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch video context for clip:%@ with error: %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishLoadingWithError:", v3);

}

void __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[16];

  objc_msgSend(a2, "hlsPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    HFLogForCategory(0x17uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "HLS Playlist was nil", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC548], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentType:", v6);

    v8 = objc_msgSend(v3, "length");
    objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentLength:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "dataRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v14[0] = (id)MEMORY[0x1E0C809B0];
    v14[1] = (id)3221225472;
    v14[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_26;
    v14[3] = &unk_1EA732740;
    v15 = v3;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    v16 = v11;
    v17 = v12;
    __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_26(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondWithData:", v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishLoading");

}

id __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_26(id *a1)
{
  int64_t v2;
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  NSRange v21;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "length");
  v3 = objc_msgSend(a1[5], "requestedOffset");
  if (v2 >= v3)
    v2 = v3;
  v4 = objc_msgSend(a1[4], "length") - v2;
  if ((objc_msgSend(a1[5], "requestsAllDataToEndOfResource") & 1) == 0)
  {
    v5 = objc_msgSend(a1[5], "requestedLength");
    if (v5 < v4)
      v4 = v5;
  }
  HFLogForCategory(0x17uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1[4], "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21.location = v2;
    v21.length = v4;
    NSStringFromRange(v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "clip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "dataRequest: %@; playlistData.length: %@; range: %@; clip: %@",
      (uint8_t *)&v12,
      0x2Au);

  }
  objc_msgSend(a1[4], "subdataWithRange:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HFCameraClipPlayerItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:queue:", 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)HFCameraClipPlayerItem;
  -[HFCameraClipPlayerItem dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerItem clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("clip"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraClipPlayerItem isUsingCachedVideoOnDisk](self, "isUsingCachedVideoOnDisk"), CFSTR("usingCachedVideoOnDisk"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (OS_dispatch_queue)resourceLoaderQueue
{
  return self->_resourceLoaderQueue;
}

- (BOOL)isUsingCachedVideoOnDisk
{
  return self->_isUsingCachedVideoOnDisk;
}

- (void)setIsUsingCachedVideoOnDisk:(BOOL)a3
{
  self->_isUsingCachedVideoOnDisk = a3;
}

- (HMCameraClipManager)clipManager
{
  return self->_clipManager;
}

- (void)setClipManager:(id)a3
{
  objc_storeStrong((id *)&self->_clipManager, a3);
}

- (HFCameraClipVideoAssetContextProvider)videoContextProvider
{
  return self->_videoContextProvider;
}

- (void)setVideoContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_videoContextProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContextProvider, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_resourceLoaderQueue, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
