@implementation HFCameraImageManager

+ (id)sharedManager
{
  if (qword_1ED378C00 != -1)
    dispatch_once(&qword_1ED378C00, &__block_literal_global_5);
  return (id)_MergedGlobals_210;
}

void __37__HFCameraImageManager_sharedManager__block_invoke()
{
  HFCameraImageManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFCameraImageManager);
  v1 = (void *)_MergedGlobals_210;
  _MergedGlobals_210 = (uint64_t)v0;

}

- (HFCameraImageManager)init
{
  HFCameraImageManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *posterFrameQueue;
  HFCameraImageCache *v5;
  HFCameraImageCache *imageCache;
  NSMutableDictionary *v7;
  NSMutableDictionary *imageObservers;
  NSMutableDictionary *v9;
  NSMutableDictionary *generationObservers;
  NSMutableDictionary *v11;
  NSMutableDictionary *inProgressOperations;
  HFCameraClipVideoAssetOperationCache *v13;
  HFCameraClipVideoAssetOperationCache *fetchCache;
  NSMutableDictionary *v15;
  NSMutableDictionary *requestedHeroFrameCache;
  NSMutableDictionary *v17;
  NSMutableDictionary *requestedFaceCropCache;
  NSMutableDictionary *v19;
  NSMutableDictionary *requestedPosterFrameCache;
  NSMutableDictionary *v21;
  NSMutableDictionary *offsetsForFile;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)HFCameraImageManager;
  v2 = -[HFCameraImageManager init](&v25, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    posterFrameQueue = v2->_posterFrameQueue;
    v2->_posterFrameQueue = v3;

    v5 = objc_alloc_init(HFCameraImageCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imageObservers = v2->_imageObservers;
    v2->_imageObservers = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    generationObservers = v2->_generationObservers;
    v2->_generationObservers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inProgressOperations = v2->_inProgressOperations;
    v2->_inProgressOperations = v11;

    v13 = objc_alloc_init(HFCameraClipVideoAssetOperationCache);
    fetchCache = v2->_fetchCache;
    v2->_fetchCache = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestedHeroFrameCache = v2->_requestedHeroFrameCache;
    v2->_requestedHeroFrameCache = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestedFaceCropCache = v2->_requestedFaceCropCache;
    v2->_requestedFaceCropCache = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestedPosterFrameCache = v2->_requestedPosterFrameCache;
    v2->_requestedPosterFrameCache = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    offsetsForFile = v2->_offsetsForFile;
    v2->_offsetsForFile = v21;

    if (+[HFCameraUtilities shouldPurgePosterFrameCache](HFCameraUtilities, "shouldPurgePosterFrameCache"))
    {
      -[HFCameraImageManager purgePosterFrames](v2, "purgePosterFrames");
    }
    +[HFCameraImageManager purgeVideoFiles](HFCameraImageManager, "purgeVideoFiles");
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HFCameraImageManager posterFrameQueue](self, "posterFrameQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  v5.receiver = self;
  v5.super_class = (Class)HFCameraImageManager;
  -[HFCameraImageManager dealloc](&v5, sel_dealloc);
}

- (id)heroFrameImageForClip:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:](HFCameraImageCache, "heroFrameKeyForCameraClipIdentifierString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)faceCropForClip:(id)a3 atOffset:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hf_faceCropNameAtOffset:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[HFCameraImageCache faceCropKeyForPersonName:](HFCameraImageCache, "faceCropKeyForPersonName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x15uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v15, 0xCu);
    }

    -[HFCameraImageManager imageCache](self, "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0x15uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v14;
      v17 = 2048;
      v18 = a4;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to find name for UUID:%@ at offset:%.2f.", (uint8_t *)&v15, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)faceCropForPersonName:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[HFCameraImageCache faceCropKeyForPersonName:](HFCameraImageCache, "faceCropKeyForPersonName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x15uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v9, 0xCu);
  }

  -[HFCameraImageManager imageCache](self, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)faceCropImagesForClip:(id)a3 atOffset:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  HFCameraImageManager *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_faceCropNamesAtOffset:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __55__HFCameraImageManager_faceCropImagesForClip_atOffset___block_invoke;
  v18 = &unk_1EA727050;
  v19 = self;
  v9 = v7;
  v20 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  HFLogForCategory(0x15uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uniqueIdentifier", v15, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEBUG, "Returning faceCropImages:%@ for clipUUID:%@", buf, 0x16u);

  }
  v11 = v20;
  v12 = v9;

  return v12;
}

void __55__HFCameraImageManager_faceCropImagesForClip_atOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[HFCameraImageCache faceCropKeyForPersonName:](HFCameraImageCache, "faceCropKeyForPersonName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x15uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)cachedPosterFrameImageForClip:(id)a3 offset:(double)a4 requestor:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[HFCameraImageManager _timeScaleAdjustedOffset:](self, "_timeScaleAdjustedOffset:", a4);
  v11 = v10;
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = v11;
  +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageCache](self, "imageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x15uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Poster Frame hit for key:%@ requester:%@", (uint8_t *)&v22, 0x16u);
    }

    v20 = v17;
  }
  else
  {
    if (v19)
    {
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Poster Frame miss for key:%@ requestor:%@", (uint8_t *)&v22, 0x16u);
    }

  }
  return v17;
}

- (id)representativeImageForClip:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraImageManager heroFrameImageForClip:](self, "heroFrameImageForClip:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    HFLogForCategory(0x15uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Image cache hit for representative image (Hero frame) for UUID:%@.", (uint8_t *)&v12, 0xCu);

    }
    v9 = v5;
  }
  else
  {
    -[HFCameraImageManager firstPosterFrameImageForClip:](self, "firstPosterFrameImageForClip:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)firstPosterFrameImageForClip:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageCache](self, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x15uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Image cache hit for first poster frame image for key:%@.", (uint8_t *)&v14, 0xCu);
    }

    v12 = v9;
  }
  else
  {
    if (v11)
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Image cache miss for first poster frame image for key:%@.", (uint8_t *)&v14, 0xCu);
    }

  }
  return v9;
}

- (id)imageObserversForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFCameraImageManager imageObservers](self, "imageObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraImageManager imageObservers](self, "imageObservers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (void)addFaceCropImageObserver:(id)a3 forClip:(id)a4 usingSignificantEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  HFCameraImageManager *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "faceClassification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraImageCache faceCropKeyForPersonName:](HFCameraImageCache, "faceCropKeyForPersonName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageCache](self, "imageCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[HFCameraImageManager imageObserversForKey:](self, "imageObserversForKey:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraImageManager requestedFaceCropCache](self, "requestedFaceCropCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (objc_msgSend(v20, "integerValue") == 1)
      {
        HFLogForCategory(0x15uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v8;
          v43 = 2112;
          v44 = v14;
          _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Face crop request is pending. Adding observer:%@ for key:%@", buf, 0x16u);
        }

        objc_msgSend(v18, "addObject:", v8);
        goto LABEL_20;
      }
      if (objc_msgSend(v20, "integerValue") == 3)
      {
        HFLogForCategory(0x15uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v14;
          v43 = 2112;
          v44 = v8;
          _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "Face crop request failed for key:%@. Unable to add observer:%@", buf, 0x16u);
        }

        v25 = v8;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "faceClassification");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "person");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "manager:failedToFindFaceCropForPersonName:", self, v26);

        }
        goto LABEL_20;
      }
    }
    else
    {
      -[HFCameraImageManager requestedFaceCropCache](self, "requestedFaceCropCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA7CB6C8, v14);

      HFLogForCategory(0x15uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v8;
        v43 = 2112;
        v44 = v14;
        _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "Face crop request initiated. Adding observer:%@ for key:%@", buf, 0x16u);
      }

      objc_msgSend(v18, "addObject:", v8);
    }
    dispatch_get_global_queue(0, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_15;
    v30[3] = &unk_1EA727078;
    v30[4] = self;
    v31 = v10;
    v32 = v9;
    v33 = v14;
    v34 = v18;
    dispatch_async(v27, v30);

LABEL_20:
    goto LABEL_21;
  }
  HFLogForCategory(0x15uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v14;
    _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Found face crop in cache for key:%@.", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke;
  block[3] = &unk_1EA727078;
  v36 = v8;
  v37 = self;
  v38 = v16;
  v39 = v9;
  v40 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v18 = v36;
LABEL_21:

}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "faceClassification");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "manager:didFindFaceCrop:forClip:usingPersonName:", v2, v3, v4, v6);

}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_15(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  objc_msgSend(a1[4], "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "faceClassification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personManagerUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "personManagerWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1[4]);
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1[5], "faceClassification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2;
  v13[3] = &unk_1EA727138;
  objc_copyWeak(&v18, &location);
  v14 = a1[6];
  v15 = a1[7];
  v16 = a1[8];
  v17 = a1[5];
  objc_msgSend(v7, "fetchFaceCropsForPersonsWithUUIDs:completion:", v12, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (v6)
  {
    HFLogForCategory(0x15uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = a1[4];
      *(_DWORD *)buf = 138412546;
      v33 = v17;
      v34 = 2112;
      v35 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Unable to add face crop for key:%@ - error:%@", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_17;
    block[3] = &unk_1EA7270A0;
    block[4] = WeakRetained;
    v30 = a1[4];
    v31 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(v5, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "dataRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v13);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_24;
      v19[3] = &unk_1EA727110;
      v20 = v14;
      v21 = a1[5];
      v22 = WeakRetained;
      v23 = a1[6];
      v24 = a1[4];
      v25 = a1[7];
      v15 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], v19);

    }
    else
    {
      HFLogForCategory(0x15uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = a1[4];
        *(_DWORD *)buf = 138412546;
        v33 = v18;
        v34 = 2112;
        v35 = 0;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Unable to add face crop for key:%@ - error:%@", buf, 0x16u);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_22;
      v26[3] = &unk_1EA7270A0;
      v26[4] = WeakRetained;
      v27 = a1[4];
      v28 = a1[5];
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
  }

}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "failedToFindFaceCropForClip:withKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_18(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
  if (!v7)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v9 = 0;
  }

  v12 = objc_opt_class();
  v13 = v5;
  if (!v13)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  objc_msgSend(v9, "dateCreated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateCreated");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "compare:", v19);

  return v20;
}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "failedToFindFaceCropForClip:withKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_24(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  HFLogForCategory(0x15uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Caching face crop for key:%@ and notifying observers.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "imageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addImage:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "requestedFaceCropCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CB6E0, *(_QWORD *)(a1 + 40));

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_26;
    v10[3] = &unk_1EA7270E8;
    v8 = *(void **)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 72);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failure to generate image for face crop for key:%@.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "failedToFindFaceCropForClip:withKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  }
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_26(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = (void *)a1[7];
  v6 = a2;
  objc_msgSend(v5, "faceClassification");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager:didFindFaceCrop:forClip:usingPersonName:", v2, v3, v4, v8);

}

- (void)failedToFindFaceCropForClip:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke;
  v7[3] = &unk_1EA727188;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "requestedFaceCropCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA7CB6F8, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "imageObserversForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HFCameraImageCache personNameForFaceCropKey:](HFCameraImageCache, "personNameForFaceCropKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke_30;
  v7[3] = &unk_1EA727160;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v4 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(v6, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "imageObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "manager:failedToFindFaceCropForPersonName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeFaceCropImageObserver:(id)a3 forPersonName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HFCameraImageCache faceCropKeyForPersonName:](HFCameraImageCache, "faceCropKeyForPersonName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraImageManager imageObservers](self, "imageObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HFLogForCategory(0x15uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Remove face crop observer:%@ for key:%@.", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(v9, "removeObject:", v6);
  }
  if (!objc_msgSend(v9, "count"))
  {
    HFLogForCategory(0x15uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "All face crop observers have been removed for key:%@.", (uint8_t *)&v13, 0xCu);
    }

    -[HFCameraImageManager imageObservers](self, "imageObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v7);

  }
}

- (void)addHeroFrameImageObserver:(id)a3 forClip:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HFCameraImageManager *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  HFCameraImageManager *v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  HFCameraImageManager *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[HFCameraUtilities shouldDisableHeroFrameDownloads](HFCameraUtilities, "shouldDisableHeroFrameDownloads"))
  {
    if (!v7)
    {
      HFLogForCategory(0x15uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "Hero frame can't be located for missing clip.", buf, 2u);
      }

      v10 = v6;
      v11 = self;
      v12 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:](HFCameraImageCache, "heroFrameKeyForCameraClipIdentifierString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraImageManager imageCache](self, "imageCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageForKey:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x15uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v43 = v15;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Found hero frame in cache for key:%@.", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke;
      block[3] = &unk_1EA7271B0;
      v38 = v6;
      v39 = self;
      v40 = v17;
      v41 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v20 = v38;
      goto LABEL_30;
    }
    if (v19)
    {
      -[HFCameraImageManager cameraProfile](self, "cameraProfile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v6;
      v44 = 2112;
      v45 = v15;
      v46 = 2112;
      v47 = v22;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Adding observer:%@ for hero frame key:%@ with profile:%@", buf, 0x20u);

    }
    -[HFCameraImageManager imageObserversForKey:](self, "imageObserversForKey:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraImageManager requestedHeroFrameCache](self, "requestedHeroFrameCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (objc_msgSend(v24, "integerValue") == 1)
      {
        HFLogForCategory(0x15uLL);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v6;
          v44 = 2112;
          v45 = v15;
          _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "Hero frame request is pending. Adding observer:%@ for key:%@", buf, 0x16u);
        }

        objc_msgSend(v20, "addObject:", v6);
        goto LABEL_29;
      }
      if (objc_msgSend(v24, "integerValue") == 3)
      {
        HFLogForCategory(0x15uLL);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v15;
          v44 = 2112;
          v45 = v6;
          _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Hero frame request failed for key:%@. Unable to add observer:%@", buf, 0x16u);
        }

        objc_msgSend(v6, "manager:failedToFindHeroFrameforClip:", self, v7);
        goto LABEL_29;
      }
    }
    else
    {
      HFLogForCategory(0x15uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v6;
        v44 = 2112;
        v45 = v15;
        _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Hero frame request initiated. Adding observer:%@ for key:%@", buf, 0x16u);
      }

      -[HFCameraImageManager requestedHeroFrameCache](self, "requestedHeroFrameCache");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1EA7CB6C8, v15);

      objc_msgSend(v20, "addObject:", v6);
    }
    -[HFCameraImageManager cameraProfile](self, "cameraProfile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "clipManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_33;
    v32[3] = &unk_1EA727200;
    v33 = v15;
    v34 = self;
    v35 = v7;
    v36 = v20;
    objc_msgSend(v30, "fetchHeroFrameDataRepresentationForClipWithUUID:completion:", v31, v32);

LABEL_29:
LABEL_30:

    goto LABEL_31;
  }
  HFLogForCategory(0x15uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Hero frame downloads disabled for clip:%@.", buf, 0xCu);

  }
  v10 = v6;
  v11 = self;
  v12 = v7;
LABEL_13:
  objc_msgSend(v10, "manager:failedToFindHeroFrameforClip:", v11, v12);
LABEL_31:

}

uint64_t __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "manager:didFindHeroFrame:forClip:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int8x16_t v17;
  _QWORD block[4];
  int8x16_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x15uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Unable to add hero frame for key:%@ - data:%@ error:%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "failToFindHeroFrameForClip:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v5);
    HFLogForCategory(0x15uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Caching hero frame for key:%@ and notifying observers:%@.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "imageCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addImage:forKey:", v8, *(_QWORD *)(a1 + 32));

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_34;
      block[3] = &unk_1EA727078;
      v17 = *(int8x16_t *)(a1 + 32);
      v14 = (id)v17.i64[0];
      v19 = vextq_s8(v17, v17, 8uLL);
      v20 = *(id *)(a1 + 56);
      v21 = v8;
      v22 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v24 = v16;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = 0;
        _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Failure to generate image for hero frame for key:%@ - data:%@ error:%@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "failToFindHeroFrameForClip:", *(_QWORD *)(a1 + 48));
    }

  }
}

void __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "requestedHeroFrameCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA7CB6E0, *(_QWORD *)(a1 + 40));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_2;
  v5[3] = &unk_1EA7271D8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "imageObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

uint64_t __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "manager:didFindHeroFrame:forClip:", a1[4], a1[5], a1[6]);
}

- (void)failToFindHeroFrameForClip:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HFCameraImageManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke;
  v6[3] = &unk_1EA727188;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int8x16_t v8;
  id v9;
  _QWORD v10[4];
  int8x16_t v11;

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:](HFCameraImageCache, "heroFrameKeyForCameraClipIdentifierString:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "requestedHeroFrameCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CB6F8, v9);

  objc_msgSend(*(id *)(a1 + 40), "imageObserversForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke_2;
  v10[3] = &unk_1EA727160;
  v8 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v8.i64[0];
  v11 = vextq_s8(v8, v8, 8uLL);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v5, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "imageObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v9);

}

void __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "manager:failedToFindHeroFrameforClip:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeHeroFrameImageObserver:(id)a3 forClip:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:](HFCameraImageCache, "heroFrameKeyForCameraClipIdentifierString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageObservers](self, "imageObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x15uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Remove hero frame observer:%@ for key:%@.", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(v11, "removeObject:", v6);
  }
  else
  {
    if (v13)
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Already removed hero frame observer:%@ for key:%@.", (uint8_t *)&v16, 0x16u);
    }

  }
  if (!objc_msgSend(v11, "count"))
  {
    HFLogForCategory(0x15uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "All hero frame observers have been removed for key:%@.", (uint8_t *)&v16, 0xCu);
    }

    -[HFCameraImageManager imageObservers](self, "imageObservers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v9);

  }
}

- (HFCameraPosterFrameProvider)cameraPosterFrameProvider
{
  HFCameraPosterFrameProvider *cameraPosterFrameProvider;
  HFCameraPosterFrameProvider *v4;
  void *v5;
  void *v6;
  HFCameraPosterFrameProvider *v7;
  HFCameraPosterFrameProvider *v8;

  cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  if (!cameraPosterFrameProvider)
  {
    v4 = [HFCameraPosterFrameProvider alloc];
    -[HFCameraImageManager imageCache](self, "imageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraTimelapseClipManager sharedManager](HFCameraTimelapseClipManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFCameraPosterFrameProvider initWithImageCache:andTimelapseClipInfoProvider:](v4, "initWithImageCache:andTimelapseClipInfoProvider:", v5, v6);
    v8 = self->_cameraPosterFrameProvider;
    self->_cameraPosterFrameProvider = v7;

    cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  }
  return cameraPosterFrameProvider;
}

- (void)getPosterFrameImage:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[HFCameraImageManager cameraPosterFrameProvider](self, "cameraPosterFrameProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getPosterFrameForDelegate:forHighQualityClip:atOffset:", v9, v8, a5);

}

- (void)addPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  double v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager imageCache](self, "imageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    HFLogForCategory(0x15uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218498;
      v19 = a5;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Found image in cache at offset:%.0f from key:%@ observer:%@", (uint8_t *)&v18, 0x20u);
    }

    v17 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "manager:didFindImage:atTimeOffset:forClip:", self, v15, v9, a5);

  }
  else
  {
    -[HFCameraImageManager generatePosterFrameImageForClip:atOffset:observer:](self, "generatePosterFrameImageForClip:atOffset:observer:", v9, v8, a5);
  }

}

- (void)removePosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HFCameraImageManager keyForClip:timeOffset:](self, "keyForClip:timeOffset:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraImageManager imageObservers](self, "imageObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v8;
      v22 = 2112;
      v23 = *(double *)&v15;
      v24 = 2048;
      v25 = a5;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Remove observer:%@ for clip:%@ at offset:%.0f", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v12, "removeObject:", v8);
  }
  if (!objc_msgSend(v12, "count"))
  {
    HFLogForCategory(0x15uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 2048;
      v23 = a5;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "All observers have been removed for clip:%@ at offset:%.0f", (uint8_t *)&v20, 0x16u);

    }
    -[HFCameraImageManager imageObservers](self, "imageObservers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v10);

  }
}

- (void)addDemoPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HFCameraImageManager cachedPosterFrameImageForClip:offset:requestor:](self, "cachedPosterFrameImageForClip:offset:requestor:", v9, self, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "manager:didFindImage:atTimeOffset:forClip:", self, v10, v9, a5);
  }
  else
  {
    HFLogForCategory(0x20uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 1024;
      v20 = 1;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Requesting addition to generation observers for clip:%@ for count:%d.", (uint8_t *)&v17, 0x12u);

    }
    -[HFCameraImageManager _timeScaleAdjustedOffset:](self, "_timeScaleAdjustedOffset:", a5);
    -[HFCameraImageManager keyForClip:timeOffset:](self, "keyForClip:timeOffset:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[HFCameraImageManager generationObservers](self, "generationObservers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[HFCameraImageManager generationObservers](self, "generationObservers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v15, v11);

    }
    objc_msgSend(v15, "addObject:", v8);

  }
}

- (void)generateImageUsingAsset:(id)a3 clip:(id)a4 offset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18[2];
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime buf;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v23, 1, 1);
  v22 = v23;
  objc_msgSend(v10, "setRequestedTimeToleranceBefore:", &v22);
  CMTimeMake(&v21, 1, 1);
  v20 = v21;
  objc_msgSend(v10, "setRequestedTimeToleranceAfter:", &v20);
  -[HFCameraImageManager posterFrameSize](self, "posterFrameSize");
  objc_msgSend(v10, "setMaximumSize:");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeWithSeconds(&v19, a5, 1);
  buf = v19;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &buf);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);
  HFLogForCategory(0x15uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412802;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v11;
    HIWORD(buf.epoch) = 2112;
    v25 = v8;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Generating 1 image for key:%@ with timeValues:%@ using asset:%@.", (uint8_t *)&buf, 0x20u);

  }
  objc_initWeak((id *)&buf, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke;
  v16[3] = &unk_1EA727278;
  objc_copyWeak(v18, (id *)&buf);
  v18[1] = *(id *)&a5;
  v15 = v9;
  v17 = v15;
  objc_msgSend(v10, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v11, v16);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)&buf);

}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, CMTime *a4, uint64_t a5, void *a6)
{
  id v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  CMTimeValue v16;
  Float64 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  Float64 Seconds;
  Float64 v25;
  Float64 v26;
  Float64 v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  CMTime time;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a5)
  {
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      time = *a2;
      Seconds = CMTimeGetSeconds(&time);
      time = *a4;
      v25 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = Seconds;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v25;
      HIWORD(time.epoch) = 2048;
      v33 = a5;
      v34 = 2112;
      v35 = v11;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&time, 0x2Au);
    }

LABEL_5:
    v14 = 0;
    goto LABEL_10;
  }
  if (!a3)
  {
    HFLogForCategory(0x15uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      time = *a2;
      v26 = CMTimeGetSeconds(&time);
      time = *a4;
      v27 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = v26;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v27;
      HIWORD(time.epoch) = 2048;
      v33 = 0;
      v34 = 2112;
      v35 = v11;
      _os_log_error_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail after file download with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&time, 0x2Au);
    }

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x15uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 48);
    time = *a4;
    v17 = CMTimeGetSeconds(&time);
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 48);
    LODWORD(time.value) = 134219266;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = v17;
    HIWORD(time.epoch) = 2048;
    v33 = 0;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v19;
    v38 = 2048;
    v39 = v20;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Finished image generation with requested time:%.0f, actual time:%.0f result:%ld, error:%@, key:%@-%.0f", (uint8_t *)&time, 0x3Eu);

  }
  objc_msgSend(WeakRetained, "_addPosterFrameImage:forClip:withOffset:", v14, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
LABEL_10:
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_44;
  v28[3] = &unk_1EA727250;
  v28[4] = WeakRetained;
  v21 = *(id *)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 48);
  v29 = v21;
  v30 = v14;
  v22 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v28);

}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_44(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "keyForClip:timeOffset:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "generationObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_2;
    v9[3] = &unk_1EA727228;
    v10 = *(id *)(a1 + 48);
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v11 = v4;
    v12 = v5;
    v14 = *(_QWORD *)(a1 + 56);
    v13 = v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "generationObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_2(double *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x15uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((_QWORD *)a1 + 5);
    v6 = *((_QWORD *)a1 + 4) != 0;
    v10[0] = 67109634;
    v10[1] = v6;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Image generation completed:%{BOOL}d for key:%@ notifying observer %@", (uint8_t *)v10, 0x1Cu);
  }

  v7 = *((_QWORD *)a1 + 4);
  v8 = a1[8];
  v9 = *((_QWORD *)a1 + 6);
  if (v7)
    objc_msgSend(v3, "manager:didGenerateImage:atOffset:forClip:", v9, v7, *((_QWORD *)a1 + 7), v8);
  else
    objc_msgSend(v3, "manager:failedToGenerateImageAtOffset:forClip:", v9, *((_QWORD *)a1 + 7), v8);

}

- (void)setVideoSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (self->_videoSize.width >= 1.0 && self->_videoSize.height >= 1.0)
    self->_videoSize = a3;
  else
    self->_videoSize = (CGSize)xmmword_1DD6693C0;
  -[HFCameraImageManager videoSize](self, "videoSize");
  v5 = v4;
  v7 = v6;
  -[HFCameraImageManager cameraPosterFrameProvider](self, "cameraPosterFrameProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosterFrameSize:", v5, v7);

}

- (void)generatePosterFrameImageForClip:(id)a3 atOffset:(double)a4 observer:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[5];
  NSObject *v32;
  double v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8
    && (-[HFCameraImageManager cameraProfile](self, "cameraProfile"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "clipManager"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[HFCameraImageManager keyForClip:timeOffset:](self, "keyForClip:timeOffset:", v8, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    -[HFCameraImageManager generationObservers](self, "generationObservers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x15uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Image generation previously requested for key:%@. Adding observer:%@.", buf, 0x16u);
      }

      objc_msgSend(v14, "addObject:", v9);
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Image generation requested for key:%@. Adding observer:%@.", buf, 0x16u);
      }

      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v14, "addObject:", v9);
      -[HFCameraImageManager generationObservers](self, "generationObservers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v14, v12);

      +[HFCameraTimelapseClipManager sharedManager](HFCameraTimelapseClipManager, "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject startDate](v8, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timelapseClipPositionForDate:inHighQualityClip:", v21, v8);
      v22 = objc_claimAutoreleasedReturnValue();

      -[NSObject clip](v22, "clip");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HFCameraImageManager offsetsForFile](self, "offsetsForFile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFCameraImageManager offsetsForFile](self, "offsetsForFile");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v12);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v27);
        +[HFCameraTimelapseVideoProvider sharedProvider](HFCameraTimelapseVideoProvider, "sharedProvider");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject clip](v22, "clip");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "getVideoForTimelapseClip:taskType:delegate:", v29, 0, self);

      }
      else
      {
        HFLogForCategory(0x15uLL);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v35 = v22;
          v36 = 2112;
          v37 = v12;
          v38 = 2112;
          v39 = v9;
          _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "Missing timelapse clip. Don't generate image for clipPosition:%@ request using key:%@ for observer:%@", buf, 0x20u);
        }

        if (objc_msgSend(v14, "count"))
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __74__HFCameraImageManager_generatePosterFrameImageForClip_atOffset_observer___block_invoke;
          v31[3] = &unk_1EA7272A0;
          v31[4] = self;
          v33 = a4;
          v32 = v8;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v31);

        }
        -[HFCameraImageManager generationObservers](self, "generationObservers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeObjectForKey:", v12);
      }

    }
  }
  else
  {
    HFLogForCategory(0x15uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HFCameraImageManager cameraProfile](self, "cameraProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clipManager");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v8;
      v36 = 2112;
      v37 = v18;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Unable to generate missing poster frame for invalid clip/clipManager parameters: (%@,%@).", buf, 0x16u);

    }
  }

}

uint64_t __74__HFCameraImageManager_generatePosterFrameImageForClip_atOffset_observer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "manager:failedToGenerateImageAtOffset:forClip:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (double)_timeScaleAdjustedOffset:(double)a3
{
  double v3;

  v3 = round(a3 * 0.5);
  return (double)(int)(v3 + v3);
}

- (id)keyForClip:(id)a3 timeOffset:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%.0f"), v7, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)keyForClip:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)purgeVideoFiles
{
  id v3;

  +[HFCameraUtilities videoCachesDirectoryURL](HFCameraUtilities, "videoCachesDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "purgeVideoFilesAtURL:completionHandler:", v3, 0);

}

+ (void)purgeVideoFilesAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(-32768, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke;
  v10[3] = &unk_1EA727308;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C99A18];
  v36[0] = *MEMORY[0x1E0C998E8];
  v36[1] = v3;
  v21 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = a1;
  v20 = v2;
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(_QWORD *)(a1 + 32), v4, 22, &__block_literal_global_54);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v24 = 0;
        objc_msgSend(v9, "resourceValuesForKeys:error:", v4, &v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v24;
        if (!objc_msgSend(v10, "count"))
        {
          HFLogForCategory(0x15uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v30 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke";
            v31 = 2112;
            v32 = v4;
            v33 = 2112;
            v34 = v11;
            _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "%s: missing resource values for keys: %@; error: %@",
              buf,
              0x20u);
          }
          goto LABEL_19;
        }
        if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
          && (+[HFCameraUtilities shouldPurgeVideoFileCache](HFCameraUtilities, "shouldPurgeVideoFileCache")|| +[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching"))|| +[HFCameraUtilities compareCreationDateOfFileAtURL:toDaysFromNow:](HFCameraUtilities, "compareCreationDateOfFileAtURL:toDaysFromNow:", v9, -10) == -1)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v21);
          v12 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject BOOLValue](v12, "BOOLValue"))
          {
            v13 = +[HFCameraUtilities isMP4FileAtURL:](HFCameraUtilities, "isMP4FileAtURL:", v9);

            if (!v13)
              goto LABEL_22;
            v23 = v11;
            v14 = objc_msgSend(v20, "removeItemAtURL:error:", v9, &v23);
            v15 = v23;

            if ((v14 & 1) == 0)
            {
              HFLogForCategory(0x15uLL);
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v9, "path");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v30 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke";
                v31 = 2112;
                v32 = v15;
                v33 = 2112;
                v34 = v16;
                _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "%s: %@; %@", buf, 0x20u);

              }
LABEL_20:

            }
            v11 = v15;
            goto LABEL_22;
          }
LABEL_19:
          v15 = v11;
          goto LABEL_20;
        }
LABEL_22:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v6);
  }
  HFLogForCategory(0x15uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Purged cached video files.", buf, 2u);
  }

  v18 = *(_QWORD *)(v19 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

uint64_t __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  HFLogForCategory(0x15uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke_2";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s: %@; %@", (uint8_t *)&v9, 0x20u);

  }
  return 1;
}

- (void)purgePosterFrames
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HFLogForCategory(0x15uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Purged poster frames from image cache.", v5, 2u);
  }

  -[HFCameraImageManager imageCache](self, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeAllImages");

}

- (void)_addPosterFrameImage:(id)a3 forClip:(id)a4 withOffset:(double)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    -[NSObject uniqueIdentifier](v9, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = a5;
    +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x15uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Adding poster frame image for key:%@", (uint8_t *)&v17, 0xCu);
    }

    -[HFCameraImageManager imageCache](self, "imageCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addImage:forKey:", v8, v14);

  }
  else
  {
    HFLogForCategory(0x15uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Poster frames already generated for clip:%@", (uint8_t *)&v17, 0xCu);
    }
  }

}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  HFLogForCategory(0x15uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Purging the image cache since we're being backgrounded", v6, 2u);
  }

  -[HFCameraImageManager imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAllImages");

}

- (void)generateDemoPosterFramesForAsset:(id)a3 forClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  double v13;
  unint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  NSObject *v21;
  CMTimeValue v22;
  void *v23;
  id v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CMTime *v29;
  id v30;
  int v31;
  CMTime location;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  CMTime v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7
    && (-[HFCameraImageManager cameraProfile](self, "cameraProfile"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clipManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x1E0CA2E68];
    v25 = v35;
    v36 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v11 = v36;
    -[NSObject setRequestedTimeToleranceBefore:](v10, "setRequestedTimeToleranceBefore:", &v35);
    v33 = v25;
    v34 = v11;
    -[NSObject setRequestedTimeToleranceAfter:](v10, "setRequestedTimeToleranceAfter:", &v33);
    -[HFCameraImageManager posterFrameSize](self, "posterFrameSize");
    -[NSObject setMaximumSize:](v10, "setMaximumSize:");
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "duration");
    if (v13 <= 0.0)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0.0;
      do
      {
        memset(&v37, 0, sizeof(v37));
        CMTimeMakeWithSeconds(&v37, v15, 1);
        location = v37;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &location);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v16);

        objc_msgSend(v7, "duration");
        v18 = v17;
        v15 = (double)++v14;
      }
      while (v18 > (double)v14);
    }
    HFLogForCategory(0x20uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v12, "count");
      objc_msgSend(v7, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37.value) = 134218242;
      *(CMTimeValue *)((char *)&v37.value + 4) = v22;
      LOWORD(v37.flags) = 2112;
      *(_QWORD *)((char *)&v37.flags + 2) = v23;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Started generating images (%lu) for key:%@", (uint8_t *)&v37, 0x16u);

    }
    v37.value = 0;
    *(_QWORD *)&v37.timescale = &v37;
    v37.epoch = 0x2020000000;
    v38 = 0;
    objc_initWeak((id *)&location, self);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __65__HFCameraImageManager_generateDemoPosterFramesForAsset_forClip___block_invoke;
    v26[3] = &unk_1EA727330;
    objc_copyWeak(&v30, (id *)&location);
    v27 = v7;
    v29 = &v37;
    v31 = v14;
    v24 = v12;
    v28 = v24;
    -[NSObject generateCGImagesAsynchronouslyForTimes:completionHandler:](v10, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v24, v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)&location);
    _Block_object_dispose(&v37, 8);

  }
  else
  {
    HFLogForCategory(0x20uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[HFCameraImageManager cameraProfile](self, "cameraProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clipManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37.value) = 138412546;
      *(CMTimeValue *)((char *)&v37.value + 4) = (CMTimeValue)v7;
      LOWORD(v37.flags) = 2112;
      *(_QWORD *)((char *)&v37.flags + 2) = v20;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Invalid demo mode configuration. Unable to generate poster frames for invalid clip:%@ clipManager:%@", (uint8_t *)&v37, 0x16u);

    }
  }

}

void __65__HFCameraImageManager_generateDemoPosterFramesForAsset_forClip___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, CMTime *a4, uint64_t a5, void *a6)
{
  id v11;
  id WeakRetained;
  NSObject *v13;
  Float64 Seconds;
  Float64 v15;
  double v16;
  NSObject *v17;
  CMTimeValue v18;
  CMTimeValue v19;
  uint64_t v20;
  uint64_t v21;
  Float64 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  CMTimeValue v27;
  void *v28;
  Float64 v29;
  Float64 v30;
  CMTime v31;
  double v32;
  __int16 v33;
  Float64 v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a5)
  {
    HFLogForCategory(0x20uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v31 = *a2;
      Seconds = CMTimeGetSeconds(&v31);
      v31 = *a4;
      v15 = CMTimeGetSeconds(&v31);
      LODWORD(v31.value) = 134218754;
      *(Float64 *)((char *)&v31.value + 4) = Seconds;
      LOWORD(v31.flags) = 2048;
      *(Float64 *)((char *)&v31.flags + 2) = v15;
      HIWORD(v31.epoch) = 2048;
      v32 = *(double *)&a5;
      v33 = 2112;
      v34 = *(double *)&v11;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&v31, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v31 = *a2;
      v16 = CMTimeGetSeconds(&v31);
      HFLogForCategory(0x20uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject size](v13, "size");
        v19 = v18;
        -[NSObject size](v13, "size");
        v21 = v20;
        v31 = *a4;
        v22 = CMTimeGetSeconds(&v31);
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31.value) = 134219522;
        *(CMTimeValue *)((char *)&v31.value + 4) = v19;
        LOWORD(v31.flags) = 2048;
        *(_QWORD *)((char *)&v31.flags + 2) = v21;
        HIWORD(v31.epoch) = 2048;
        v32 = v16;
        v33 = 2048;
        v34 = v22;
        v35 = 2048;
        v36 = 0;
        v37 = 2112;
        v38 = v11;
        v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Finished image generation with image {%.0f, %.0f}, requested time:%.0f, actual time:%.0f result:%ld, error:%@, key:%@", (uint8_t *)&v31, 0x48u);

      }
      objc_msgSend(WeakRetained, "_addPosterFrameImage:forClip:withOffset:", v13, *(_QWORD *)(a1 + 32), v16);
      objc_msgSend(WeakRetained, "_updateDemoObserversForImage:forClip:withOffset:", v13, *(_QWORD *)(a1 + 32), v16);
    }
    else
    {
      HFLogForCategory(0x20uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v31 = *a2;
        v29 = CMTimeGetSeconds(&v31);
        v31 = *a4;
        v30 = CMTimeGetSeconds(&v31);
        LODWORD(v31.value) = 134218754;
        *(Float64 *)((char *)&v31.value + 4) = v29;
        LOWORD(v31.flags) = 2048;
        *(Float64 *)((char *)&v31.flags + 2) = v30;
        HIWORD(v31.epoch) = 2048;
        v32 = 0.0;
        v33 = 2112;
        v34 = *(double *)&v11;
        _os_log_error_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail after generation succeeded with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&v31, 0x2Au);
      }

    }
  }

  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 64))
  {
    HFLogForCategory(0x20uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31.value) = 134218242;
      *(CMTimeValue *)((char *)&v31.value + 4) = v27;
      LOWORD(v31.flags) = 2112;
      *(_QWORD *)((char *)&v31.flags + 2) = v28;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Finished generating images (%lu) for key:%@", (uint8_t *)&v31, 0x16u);

    }
  }

}

- (void)_updateDemoObserversForImage:(id)a3 forClip:(id)a4 withOffset:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke;
  v12[3] = &unk_1EA727250;
  v12[4] = self;
  v13 = v9;
  v15 = a5;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "keyForClip:timeOffset:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "generationObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke_2;
    v9[3] = &unk_1EA727228;
    v10 = *(id *)(a1 + 48);
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v11 = v4;
    v12 = v5;
    v14 = *(_QWORD *)(a1 + 56);
    v13 = v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "generationObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

void __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke_2(double *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x20uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((_QWORD *)a1 + 5);
    v6 = *((_QWORD *)a1 + 4) != 0;
    v10[0] = 67109634;
    v10[1] = v6;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Image generation completed:%{BOOL}d for key:%@ notifying observer %@", (uint8_t *)v10, 0x1Cu);
  }

  v7 = *((_QWORD *)a1 + 4);
  v8 = a1[8];
  v9 = *((_QWORD *)a1 + 6);
  if (v7)
    objc_msgSend(v3, "manager:didGenerateImage:atOffset:forClip:", v9, v7, *((_QWORD *)a1 + 7), v8);
  else
    objc_msgSend(v3, "manager:failedToGenerateImageAtOffset:forClip:", v9, *((_QWORD *)a1 + 7), v8);

}

+ (id)clipIdentifierStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED378C10;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED378C10, &__block_literal_global_56);
  objc_msgSend((id)qword_1ED378C08, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__HFCameraImageManager_clipIdentifierStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED378C08;
  qword_1ED378C08 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378C08, "setDateFormat:", CFSTR("YYYY:MM:dd HH:mm"));
}

- (void)resetForCameraDismissal
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFCameraPosterFrameProvider *cameraPosterFrameProvider;
  uint8_t v12[16];

  HFLogForCategory(0x15uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Purge image cache for camera dismissal.", v12, 2u);
  }

  -[HFCameraImageManager fetchCache](self, "fetchCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purge");

  -[HFCameraImageManager requestedHeroFrameCache](self, "requestedHeroFrameCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HFCameraImageManager requestedFaceCropCache](self, "requestedFaceCropCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[HFCameraImageManager imageObservers](self, "imageObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[HFCameraImageManager generationObservers](self, "generationObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[HFCameraImageManager inProgressOperations](self, "inProgressOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_61);

  -[HFCameraImageManager inProgressOperations](self, "inProgressOperations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  self->_cameraPosterFrameProvider = 0;

}

uint64_t __47__HFCameraImageManager_resetForCameraDismissal__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HFCameraImageManager_didDownloadVideoFileForClip_toURL___block_invoke;
  block[3] = &unk_1EA7270A0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__HFCameraImageManager_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateImagesForForTimelapseClip:atLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HFCameraImageManager_foundVideoFileForClip_atURL___block_invoke;
  block[3] = &unk_1EA7270A0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__HFCameraImageManager_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateImagesForForTimelapseClip:atLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0x15uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error fetching clip: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_generateImagesForForTimelapseClip:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v25;
  id v26;
  id v27[2];
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraImageManager offsetsForFile](self, "offsetsForFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  if (v12)
  {
    -[HFCameraImageManager offsetsForFile](self, "offsetsForFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    objc_msgSend(v13, "removeObjectForKey:", v9);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = v12;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v17 = MEMORY[0x1E0C80D38];
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18), "doubleValue", v21);
          -[HFCameraImageManager _timeScaleAdjustedOffset:](self, "_timeScaleAdjustedOffset:");
          v20 = v19;
          objc_initWeak(&location, self);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__HFCameraImageManager__generateImagesForForTimelapseClip_atLocation___block_invoke;
          block[3] = &unk_1EA7273B8;
          objc_copyWeak(v27, &location);
          v25 = v7;
          v26 = v6;
          v27[1] = v20;
          dispatch_async(v17, block);

          objc_destroyWeak(v27);
          objc_destroyWeak(&location);
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    v12 = v21;
    v9 = v22;
  }

}

void __70__HFCameraImageManager__generateImagesForForTimelapseClip_atLocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "generateImageUsingAsset:clip:offset:", v2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

}

- (HMCameraProfile)cameraProfile
{
  return (HMCameraProfile *)objc_loadWeakRetained((id *)&self->_cameraProfile);
}

- (void)setCameraProfile:(id)a3
{
  objc_storeWeak((id *)&self->_cameraProfile, a3);
}

- (HFCameraClipVideoAssetOperationCache)fetchCache
{
  return self->_fetchCache;
}

- (void)setFetchCache:(id)a3
{
  objc_storeStrong((id *)&self->_fetchCache, a3);
}

- (CGSize)videoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoSize.width;
  height = self->_videoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSOperationQueue)posterFrameQueue
{
  return self->_posterFrameQueue;
}

- (void)setPosterFrameQueue:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameQueue, a3);
}

- (HFCameraImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (NSMutableDictionary)imageObservers
{
  return self->_imageObservers;
}

- (void)setImageObservers:(id)a3
{
  objc_storeStrong((id *)&self->_imageObservers, a3);
}

- (NSMutableDictionary)generationObservers
{
  return self->_generationObservers;
}

- (void)setGenerationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_generationObservers, a3);
}

- (NSMutableDictionary)inProgressOperations
{
  return self->_inProgressOperations;
}

- (void)setInProgressOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressOperations, a3);
}

- (NSMutableDictionary)requestedHeroFrameCache
{
  return self->_requestedHeroFrameCache;
}

- (void)setRequestedHeroFrameCache:(id)a3
{
  objc_storeStrong((id *)&self->_requestedHeroFrameCache, a3);
}

- (NSMutableDictionary)requestedFaceCropCache
{
  return self->_requestedFaceCropCache;
}

- (void)setRequestedFaceCropCache:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFaceCropCache, a3);
}

- (NSMutableDictionary)requestedPosterFrameCache
{
  return self->_requestedPosterFrameCache;
}

- (void)setRequestedPosterFrameCache:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPosterFrameCache, a3);
}

- (void)setCameraPosterFrameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cameraPosterFrameProvider, a3);
}

- (NSMutableDictionary)offsetsForFile
{
  return self->_offsetsForFile;
}

- (void)setOffsetsForFile:(id)a3
{
  objc_storeStrong((id *)&self->_offsetsForFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetsForFile, 0);
  objc_storeStrong((id *)&self->_cameraPosterFrameProvider, 0);
  objc_storeStrong((id *)&self->_requestedPosterFrameCache, 0);
  objc_storeStrong((id *)&self->_requestedFaceCropCache, 0);
  objc_storeStrong((id *)&self->_requestedHeroFrameCache, 0);
  objc_storeStrong((id *)&self->_inProgressOperations, 0);
  objc_storeStrong((id *)&self->_generationObservers, 0);
  objc_storeStrong((id *)&self->_imageObservers, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_posterFrameQueue, 0);
  objc_storeStrong((id *)&self->_fetchCache, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
}

@end
