@implementation CKSearchThumbnailPreviewGenerator

+ (void)__setSingleton__im:(id)a3
{
  objc_storeStrong((id *)&sCKSearchThumbnailPreviewGenerator_sharedInstance, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKSearchThumbnailPreviewGenerator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, block);
  return (id)sCKSearchThumbnailPreviewGenerator_sharedInstance;
}

void __51__CKSearchThumbnailPreviewGenerator_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (!sCKSearchThumbnailPreviewGenerator_sharedInstance)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_createSingleton__im");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "__setSingleton__im:", v3);

  }
  objc_sync_exit(obj);

}

- (CKSearchThumbnailPreviewGenerator)init
{
  CKSearchThumbnailPreviewGenerator *v2;
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
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSearchThumbnailPreviewGenerator;
  v2 = -[CKSearchThumbnailPreviewGenerator init](&v17, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setThumbnailCache:](v2, "setThumbnailCache:", v3);

    v4 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setLivePhotoStatusCache:](v2, "setLivePhotoStatusCache:", v4);

    v5 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setSpatialStatusCache:](v2, "setSpatialStatusCache:", v5);

    v6 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setVideoDurationCache:](v2, "setVideoDurationCache:", v6);

    v7 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setLpLinkMetadataCache:](v2, "setLpLinkMetadataCache:", v7);

    v8 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setMapHashesCache:](v2, "setMapHashesCache:", v8);

    v9 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setLpWalletItemPropertiesMetadataCache:](v2, "setLpWalletItemPropertiesMetadataCache:", v9);

    v10 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightGeneration:](v2, "setKeysWithInFlightGeneration:", v10);

    v11 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightLivePhotoStatus:](v2, "setKeysWithInFlightLivePhotoStatus:", v11);

    v12 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightVideoDurationCalculation:](v2, "setKeysWithInFlightVideoDurationCalculation:", v12);

    v13 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightSpatialStatus:](v2, "setKeysWithInFlightSpatialStatus:", v13);

    v14 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightLPLinkMetadataGeneration:](v2, "setKeysWithInFlightLPLinkMetadataGeneration:", v14);

    v15 = (void *)objc_opt_new();
    -[CKSearchThumbnailPreviewGenerator setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:](v2, "setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:", v15);

  }
  return v2;
}

- (id)_previewLoadQueue
{
  char v2;
  uint64_t *v3;

  if (_previewLoadQueue_once != -1)
    dispatch_once(&_previewLoadQueue_once, &__block_literal_global_147);
  v2 = arc4random();
  v3 = &_previewLoadQueue_sPreviewLoadQueue1;
  if ((v2 & 1) == 0)
    v3 = &_previewLoadQueue_sPreviewLoadQueue2;
  return (id)*v3;
}

void __54__CKSearchThumbnailPreviewGenerator__previewLoadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)_previewLoadQueue_sPreviewLoadQueue1;
  _previewLoadQueue_sPreviewLoadQueue1 = (uint64_t)v0;

  v2 = _previewLoadQueue_sPreviewLoadQueue1;
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v5);

  v3 = dispatch_queue_create(0, 0);
  v4 = (void *)_previewLoadQueue_sPreviewLoadQueue2;
  _previewLoadQueue_sPreviewLoadQueue2 = (uint64_t)v3;

  dispatch_set_target_queue((dispatch_object_t)_previewLoadQueue_sPreviewLoadQueue2, v5);
}

- (id)_lpPreviewLoadQueue
{
  if (_lpPreviewLoadQueue_once != -1)
    dispatch_once(&_lpPreviewLoadQueue_once, &__block_literal_global_138_2);
  return (id)_lpPreviewLoadQueue_sLPPreviewLoadQueue;
}

void __56__CKSearchThumbnailPreviewGenerator__lpPreviewLoadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)_lpPreviewLoadQueue_sLPPreviewLoadQueue;
  _lpPreviewLoadQueue_sLPPreviewLoadQueue = (uint64_t)v0;

  v2 = _lpPreviewLoadQueue_sLPPreviewLoadQueue;
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

- (id)_lpWalletItemLinkPreviewLoadQueue
{
  if (_lpWalletItemLinkPreviewLoadQueue_once != -1)
    dispatch_once(&_lpWalletItemLinkPreviewLoadQueue_once, &__block_literal_global_139_1);
  return (id)_lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue;
}

void __70__CKSearchThumbnailPreviewGenerator__lpWalletItemLinkPreviewLoadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)_lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue;
  _lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue = (uint64_t)v0;

  v2 = _lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue;
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

- (void)generatePreviewForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  if (v4
    && !-[CKSearchThumbnailPreviewGenerator hasCachedPreviewForQueryResult:](self, "hasCachedPreviewForQueryResult:", v4))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v8)
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightGeneration](self, "keysWithInFlightGeneration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v5);

      if ((v10 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightGeneration](self, "keysWithInFlightGeneration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v5);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchPhotosThumbnailWidth");
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = v16;

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD32C8]), "initWithFileAtURL:size:scale:representationTypes:", v8, 4, v14, v14, v17);
      -[NSObject setShouldUseRestrictedExtension:](v18, "setShouldUseRestrictedExtension:", 1);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke;
      v19[3] = &unk_1E2756520;
      v19[4] = self;
      v20 = v5;
      v21 = v8;
      v22 = v4;
      -[CKSearchThumbnailPreviewGenerator generateAndCacheThumbnailWithURL:request:key:completion:](self, "generateAndCacheThumbnailWithURL:request:key:completion:", v21, v18, v20, v19);

    }
    else
    {
      IMLogHandleForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CKSearchThumbnailPreviewGenerator generatePreviewForQueryResult:].cold.1();
    }

    goto LABEL_10;
  }
LABEL_11:

}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_previewURLForKey:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v11 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138412290;
            v24 = v11;
            _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Generated preview thumbnail OK for URL: %@", buf, 0xCu);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "_persistPreview:atURL:", v7, v9);
      }
      else
      {
        IMLogHandleForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_cold_1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightGeneration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("CKSearchThumbnailDidChange"), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145;
    v18[3] = &unk_1E27564F8;
    v18[4] = v14;
    v19 = v12;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = v8;
    objc_msgSend(v14, "generateAndCacheIconWithURL:key:completion:", v13, v19, v18);

  }
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightGeneration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Generated preview icon OK for URL: %@", (uint8_t *)&v9, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v7, "postNotificationName:object:", CFSTR("CKSearchThumbnailDidChange"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145_cold_2(a1, v8);

    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145_cold_1();
  }

}

- (id)cachedPreviewForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CKSearchThumbnailPreviewGenerator cachedPreviewOrNullForKey:](self, "cachedPreviewOrNullForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v4;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Returning nil cached thumbnail. Previous attempt at generating thumbnail failed for key %@", (uint8_t *)&v9, 0xCu);
        }

      }
      v7 = 0;
    }
    else
    {
      v7 = v5;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)cachedPreviewOrNullForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[CKSearchThumbnailPreviewGenerator thumbnailCache](self, "thumbnailCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)hasCachedPreviewForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKSearchThumbnailPreviewGenerator cachedPreviewOrNullForKey:](self, "cachedPreviewOrNullForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasCachedPreviewForQueryResult:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchThumbnailPreviewGenerator cachedPreviewOrNullForKey:](self, "cachedPreviewOrNullForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)cachedPreviewForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchThumbnailPreviewGenerator cachedPreviewOrNullForKey:](self, "cachedPreviewOrNullForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v7;
        goto LABEL_11;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v5;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Returning nil cached thumbnail. Previous attempt at generating thumbnail failed for search result: %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
    v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)queryResultHasLivePhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator queryResultHasLivePhoto:].cold.1();
    goto LABEL_8;
  }
  -[CKSearchThumbnailPreviewGenerator livePhotoStatusCache](self, "livePhotoStatusCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CKSearchThumbnailPreviewGenerator keysWithInFlightLivePhotoStatus](self, "keysWithInFlightLivePhotoStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if ((v10 & 1) == 0)
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightLivePhotoStatus](self, "keysWithInFlightLivePhotoStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v5);

      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke;
      block[3] = &unk_1E274A0B8;
      block[4] = self;
      v15 = v4;
      v16 = v5;
      dispatch_async(v12, block);

    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = -[NSObject BOOLValue](v7, "BOOLValue");
LABEL_9:

  return v8;
}

void __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke(id *a1)
{
  char v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = objc_msgSend(a1[4], "_checkResultForLivePhotoComplement:", a1[5]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke_2;
  v3[3] = &unk_1E2754888;
  v3[4] = a1[4];
  v4 = a1[6];
  v6 = v2;
  v5 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightLivePhotoStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "livePhotoStatusCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  if (objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CKSearchLivePhotoStatusDidChange"), *(_QWORD *)(a1 + 48));

  }
}

- (BOOL)_checkResultForLivePhotoComplement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;

  if (!a3)
    return 0;
  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "classForFilename:", v6);

    if (objc_msgSend(v8, "isEqual:", objc_opt_class()))
    {
      +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:](CKLivePhotoBundleUtilities, "calculateLivePhotoVideoPath:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator _checkResultForLivePhotoComplement:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (BOOL)queryResultIsSpatial:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator queryResultIsSpatial:].cold.1();
    goto LABEL_8;
  }
  -[CKSearchThumbnailPreviewGenerator spatialStatusCache](self, "spatialStatusCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CKSearchThumbnailPreviewGenerator keysWithInFlightSpatialStatus](self, "keysWithInFlightSpatialStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if ((v10 & 1) == 0)
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightSpatialStatus](self, "keysWithInFlightSpatialStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v5);

      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke;
      block[3] = &unk_1E274A0B8;
      block[4] = self;
      v15 = v4;
      v16 = v5;
      dispatch_async(v12, block);

    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = -[NSObject BOOLValue](v7, "BOOLValue");
LABEL_9:

  return v8;
}

void __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke(id *a1)
{
  char v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = objc_msgSend(a1[4], "_checkResultForSpatialMedia:", a1[5]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke_2;
  v3[3] = &unk_1E2754888;
  v3[4] = a1[4];
  v4 = a1[6];
  v6 = v2;
  v5 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightSpatialStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "spatialStatusCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  if (objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CKSearchSpatialStatusDidChange"), *(_QWORD *)(a1 + 48));

  }
}

- (BOOL)_checkResultForSpatialMedia:(id)a3
{
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
  char v13;
  NSObject *v14;

  if (a3)
  {
    objc_msgSend(a3, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    IMPreviewExtension();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewFileURL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v9);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D380C8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

      }
      else
      {
        v13 = 0;
      }

      if (!v5)
      {
LABEL_10:
        IMLogHandleForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CKSearchThumbnailPreviewGenerator _checkResultForSpatialMedia:].cold.1();

        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      if (!v5)
        goto LABEL_10;
    }

    return v13;
  }
  return 0;
}

- (BOOL)queryResultIsVideo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;

  if (!a3)
    return 0;
  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "classForFilename:", v6);

    v9 = objc_msgSend(v8, "isEqual:", objc_opt_class());
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator queryResultIsVideo:].cold.1();

    v9 = 0;
  }

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVideoResult:(SEL)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  int64_t v21;

  v6 = a4;
  v7 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
  v20 = *(_OWORD *)v7;
  v21 = *(_QWORD *)(v7 + 16);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CKSearchThumbnailPreviewGenerator videoDurationCache](self, "videoDurationCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "duration");
    }
    else
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightVideoDurationCalculation](self, "keysWithInFlightVideoDurationCalculation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v8);

      if ((v13 & 1) == 0)
      {
        -[CKSearchThumbnailPreviewGenerator keysWithInFlightVideoDurationCalculation](self, "keysWithInFlightVideoDurationCalculation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v8);

        dispatch_get_global_queue(0, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke;
        block[3] = &unk_1E274A0B8;
        block[4] = self;
        v18 = v6;
        v19 = v8;
        dispatch_async(v15, block);

      }
      *(_OWORD *)&retstr->var0 = v20;
      retstr->var3 = v21;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator durationForVideoResult:].cold.1();

    *(_OWORD *)&retstr->var0 = v20;
    retstr->var3 = v21;
  }

  return result;
}

void __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = 0uLL;
  v9 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "_calculateDurationForVideoResult:", *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke_2;
  block[3] = &unk_1E2756548;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  v6 = v8;
  v7 = v9;
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  CKSearchVideoDuration *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightVideoDurationCalculation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  v3 = objc_alloc_init(CKSearchVideoDuration);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  -[CKSearchVideoDuration setDuration:](v3, "setDuration:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "videoDurationCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CKSearchVideoDurationDidChange"), *(_QWORD *)(a1 + 48));

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_calculateDurationForVideoResult:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int64_t var3;
  NSObject *v15;
  uint64_t v16;
  int64_t v17;
  NSObject *v18;
  uint64_t v19;
  int64_t v20;

  if (!a4)
  {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
    var3 = result->var3;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var0;
    retstr->var3 = var3;
    return result;
  }
  objc_msgSend(a4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator queryResultIsVideo:].cold.1();

    v16 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
    v17 = *(_QWORD *)(v16 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v16;
    retstr->var3 = v17;
    goto LABEL_15;
  }
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "classForFilename:", v8);

  if (!objc_msgSend(v10, "isEqual:", objc_opt_class()))
    goto LABEL_13;
  CKAVURLAssetForURL(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator _calculateDurationForVideoResult:].cold.2();

LABEL_13:
    v19 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
    v20 = *(_QWORD *)(v19 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v19;
    retstr->var3 = v20;
    goto LABEL_14;
  }
  v12 = v11;
  objc_msgSend(v11, "duration");

LABEL_14:
LABEL_15:

  return result;
}

- (void)generateAndCacheThumbnailWithURL:(id)a3 request:(id)a4 key:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__46;
  v30[4] = __Block_byref_object_dispose__46;
  v15 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke;
  v27[3] = &unk_1E2756570;
  v29 = v30;
  v16 = v14;
  v28 = v16;
  -[CKSearchThumbnailPreviewGenerator _asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:](self, "_asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:", v12, v27);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_2;
  v21[3] = &unk_1E2756610;
  v21[4] = self;
  v22 = v12;
  v25 = v13;
  v26 = v30;
  v23 = v10;
  v24 = v11;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  v20 = v12;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v21);

  _Block_object_dispose(v30, 8);
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));

    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMUTITypeForFilename();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "classForUTIType:", v5);

    if (objc_msgSend(v7, "isEqual:", objc_opt_class()))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_3;
      v19[3] = &unk_1E2756598;
      v20 = *(id *)(a1 + 64);
      objc_msgSend(v10, "generateAndCachePassWithURL:forKey:completion:", v8, v9, v19);
      v11 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_5;
      v15[3] = &unk_1E27565E8;
      v14 = *(void **)(a1 + 40);
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v14;
      v18 = *(id *)(a1 + 64);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v12, "generateBestRepresentationForRequest:completionHandler:", v13, v15);

      v11 = v16;
    }

  }
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_3(uint64_t a1, void *a2)
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
  v6[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_4;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0, 0);
  return result;
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6;
  v11[3] = &unk_1E27565C0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v17 = *(id *)(a1 + 56);
  v15 = v5;
  v16 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "UIImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
    }
    else
    {
      IMLogHandleForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6_cold_1();

      objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));

    }
    v9 = *(_QWORD *)(a1 + 72);
    if (v9)
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v9 + 16))(v9, v5, 0, *(_QWORD *)(a1 + 32));

  }
}

- (void)generateAndCacheIconWithURL:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  CKSearchThumbnailPreviewGenerator *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchPhotosThumbnailWidth");
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  objc_msgSend(v11, "setSize:", v14, v14);
  objc_msgSend(v11, "setScale:", v17);
  objc_msgSend(v11, "setVariantOptions:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithURL:", v8);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke;
  v22[3] = &unk_1E2756638;
  v23 = v8;
  v24 = self;
  v25 = v9;
  v26 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  objc_msgSend(v18, "getImageForImageDescriptor:completion:", v11, v22);

}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_1();
    goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = objc_msgSend(v3, "CGImage");
  objc_msgSend(v4, "scale");
  objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_2();
LABEL_7:

    v7 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_166;
  v12[3] = &unk_1E274CF80;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v13 = v7;
  v14 = v9;
  v15 = v10;
  v16 = *(id *)(a1 + 56);
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_166(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)generateAndCachePassWithURL:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKSearchThumbnailPreviewGenerator *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(2, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke;
  v15[3] = &unk_1E274CF80;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 8, &v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("PKPass"), CFSTR("PassKit"))), "initWithData:error:", v3, 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_172;
    v18[3] = &unk_1E274CC88;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v19 = v11;
    v20 = v12;
    v21 = v13;
    v22 = *(id *)(a1 + 32);
    v23 = *(id *)(a1 + 56);
    v14 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));

    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      _os_log_error_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_ERROR, "Failed to load pass data with for key: %@, URL: %@, error: %@", buf, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }

}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_172(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;

  +[CKPassKitHelper passViewForPass:content:](CKPassKitHelper, "passViewForPass:content:", *(_QWORD *)(a1 + 32), 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotOfFrontFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_172_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "thumbnailCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));

  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);

}

- (void)_asyncLoadCachedDiskPreviewForKeyIfAvailable:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  double v21;

  v6 = a3;
  v7 = a4;
  -[CKSearchThumbnailPreviewGenerator _previewURLForKey:](self, "_previewURLForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchPhotosThumbnailWidth");
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = v13;

    -[CKSearchThumbnailPreviewGenerator _previewLoadQueue](self, "_previewLoadQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke;
    v17[3] = &unk_1E2754F98;
    v18 = v8;
    v21 = v11 * v14;
    v20 = v7;
    v19 = v6;
    dispatch_async(v15, v17);

  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator _asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:].cold.1();

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  const __CFData *v4;
  id v5;
  void *v6;
  CGImageSourceRef v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  v3 = a1[4];
  v23 = 0;
  v4 = (const __CFData *)objc_msgSend(v2, "initWithContentsOfURL:options:error:", v3, 1, &v23);
  v5 = v23;
  v6 = v5;
  if (v4)
  {
    v7 = CGImageSourceCreateWithData(v4, 0);
    v8 = (const void *)IMCreateThumbnailWithImageSourceAtIndexForMaxDimension();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_5;
    }
    else
    {
      v9 = 0;
      if (!v7)
      {
LABEL_5:
        if (v8)
          CFRelease(v8);
        IMLogHandleForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v12 = a1[4];
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Created preview OK for previewURL: %@", buf, 0xCu);
          }

          v13 = a1[6];
          if (!v13)
            goto LABEL_22;
          v14 = *(void (**)(void))(v13 + 16);
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke_cold_1();

          v17 = a1[6];
          if (!v17)
            goto LABEL_22;
          v14 = *(void (**)(void))(v17 + 16);
        }
        v14();
LABEL_22:

        goto LABEL_29;
      }
    }
    CFRelease(v7);
    goto LABEL_5;
  }
  objc_msgSend(v5, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_24;
  }
  v16 = objc_msgSend(v6, "code");

  if (v16 != 260)
  {
LABEL_24:
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = a1[4];
      v20 = a1[5];
      objc_msgSend(v6, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_error_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_ERROR, "Failed to load preview from disk for key: %@, url: %@ error: %@", buf, 0x20u);

    }
  }
  v19 = a1[6];
  if (v19)
    (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);
LABEL_29:

}

- (void)generateMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6
    && !-[CKSearchThumbnailPreviewGenerator hasCachedMapPreviewForQueryResult:traitCollection:](self, "hasCachedMapPreviewForQueryResult:traitCollection:", v6, v7))
  {
    -[CKSearchThumbnailPreviewGenerator mapKeyForQueryResult:traitCollection:](self, "mapKeyForQueryResult:traitCollection:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightGeneration](self, "keysWithInFlightGeneration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if ((v10 & 1) == 0)
      {
        -[CKSearchThumbnailPreviewGenerator keysWithInFlightGeneration](self, "keysWithInFlightGeneration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v8);

        objc_msgSend(v6, "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attributeSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke;
        v15[3] = &unk_1E2756660;
        v15[4] = self;
        v16 = v8;
        v17 = v6;
        -[CKSearchThumbnailPreviewGenerator _generateMapThumbnailForKey:attributes:traitCollection:completion:](self, "_generateMapThumbnailForKey:attributes:traitCollection:completion:", v16, v13, v7, v15);

      }
    }
    else
    {
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CKSearchThumbnailPreviewGenerator generateMapPreviewForQueryResult:traitCollection:].cold.1();

    }
  }

}

void __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightGeneration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));

  if (!v7 || v8)
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "thumbnailCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

    if ((a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_previewURLForKey:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_persistPreview:atURL:", v7, v11);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("CKSearchThumbnailDidChange"), *(_QWORD *)(a1 + 48));
  }

}

- (id)mapKeyForQueryResult:(id)a3 traitCollection:(id)a4
{
  void *v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a4;
    objc_msgSend(a3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "userInterfaceStyle");

    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%ld"), v8, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)hasCachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  CKSearchThumbnailPreviewGenerator *v4;
  void *v5;

  v4 = self;
  -[CKSearchThumbnailPreviewGenerator mapKeyForQueryResult:traitCollection:](self, "mapKeyForQueryResult:traitCollection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[CKSearchThumbnailPreviewGenerator hasCachedPreviewForKey:](v4, "hasCachedPreviewForKey:", v5);

  return (char)v4;
}

- (id)cachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  void *v5;
  void *v6;

  if (a3)
  {
    -[CKSearchThumbnailPreviewGenerator mapKeyForQueryResult:traitCollection:](self, "mapKeyForQueryResult:traitCollection:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchThumbnailPreviewGenerator cachedPreviewForKey:](self, "cachedPreviewForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_generateMapThumbnailForKey:(id)a3 attributes:(id)a4 traitCollection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__46;
  v28[4] = __Block_byref_object_dispose__46;
  v15 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke;
  v25[3] = &unk_1E2756570;
  v27 = v28;
  v16 = v14;
  v26 = v16;
  -[CKSearchThumbnailPreviewGenerator _asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:](self, "_asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:", v10, v25);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2;
  block[3] = &unk_1E27566B0;
  v23 = v13;
  v24 = v28;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v17 = v11;
  v18 = v13;
  v19 = v10;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v28, 8);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_class *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));

    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1, 0);
    return;
  }
  if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_178_2);
  if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DMakeCoreLocation != -1)
    dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_182_1);
  objc_msgSend(*(id *)(a1 + 48), "latitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 48), "longitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v10 = sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DMake(v6, v9);
  v12 = v11;
  if ((sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DIsValid() & 1) != 0)
  {
    v13 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
    if (v13)
    {
      v14 = objc_alloc_init(v13);
      objc_msgSend(v14, "setMapType:", 0);
      objc_msgSend(v14, "_setUseSnapshotService:", 1);
      v15 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotFeatureAnnotation"), CFSTR("MapKit"));
      if (v15)
      {
        v16 = (void *)objc_msgSend([v15 alloc], "initWithCoordinate:title:representation:", 0, 2, v10, v12);
        v37[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setCustomFeatureAnnotations:", v17);

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "searchPhotosThumbnailWidth");
        objc_msgSend(v18, "mapThumbnailFillSizeForWidth:");
        v21 = v20;
        v23 = v22;

        if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_MKCoordinateRegionMakeWithDistanceMapKit != -1)
          dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_192_1);
        sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__MKCoordinateRegionMakeWithDistance(v10, v12, 500.0, 500.0);
        if (v25 < -180.0
          || v25 > 180.0
          || v24 < -90.0
          || v24 > 90.0
          || v26 < 0.0
          || v26 > 180.0
          || v27 < 0.0
          || v27 > 360.0)
        {
          IMLogHandleForCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_4();
        }
        else
        {
          objc_msgSend(v14, "setRegion:");
          objc_msgSend(v14, "setSize:", v21, v23);
          v28 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
          if (v28)
          {
            v29 = (void *)objc_msgSend([v28 alloc], "initWithOptions:", v14);
            +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_197;
            v35[3] = &unk_1E2756688;
            v36 = *(id *)(a1 + 56);
            objc_msgSend(v29, "startWithQueue:completionHandler:", v30, v35);

LABEL_35:
            return;
          }
          IMLogHandleForCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3();
        }
      }
      else
      {
        IMLogHandleForCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_2();
      }

      v34 = *(_QWORD *)(a1 + 56);
      if (v34)
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v34 + 16))(v34, 0, 0, 0);
      goto LABEL_35;
    }
    IMLogHandleForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1();
  }
  else
  {
    IMLogHandleForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_5();
  }

  v32 = *(_QWORD *)(a1 + 56);
  if (v32)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v32 + 16))(v32, 0, 0, 0);
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_3()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_4()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DMake", CFSTR("CoreLocation"));
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DMake = result;
  return result;
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_191()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKCoordinateRegionMakeWithDistance", CFSTR("MapKit"));
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_198;
  block[3] = &unk_1E27509A0;
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_198(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (id)mapPlaceholderImageForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_class *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  CKSearchThumbnailPreviewGenerator *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hash-%ld"), objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchThumbnailPreviewGenerator mapHashesCache](self, "mapHashesCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKSearchThumbnailPreviewGenerator mapHashesCache](self, "mapHashesCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKSearchThumbnailPreviewGenerator _previewURLForKey:](self, "_previewURLForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v10, 1, 0)) != 0
      && (v12 = (void *)v11,
          objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v11),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v12,
          v9))
    {
      -[CKSearchThumbnailPreviewGenerator mapHashesCache](self, "mapHashesCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v9, v5);

    }
    else
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__46;
      v39 = __Block_byref_object_dispose__46;
      v40 = 0;
      v14 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
      if (v14)
      {
        v15 = objc_alloc_init(v14);
        -[NSObject setMapType:](v15, "setMapType:", 105);
        -[NSObject setTraitCollection:](v15, "setTraitCollection:", v4);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "searchPhotosThumbnailWidth");
        objc_msgSend(v16, "mapThumbnailFillSizeForWidth:");
        v19 = v18;
        v21 = v20;

        -[NSObject setSize:](v15, "setSize:", v19, v21);
        v22 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
        if (v22)
        {
          v23 = objc_msgSend([v22 alloc], "initWithOptions:", v15);
          v24 = dispatch_group_create();
          dispatch_group_enter(v24);
          +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke;
          v32[3] = &unk_1E274A498;
          v34 = &v35;
          v26 = v24;
          v33 = v26;
          -[NSObject startWithQueue:completionHandler:](v23, "startWithQueue:completionHandler:", v25, v32);

          v27 = dispatch_time(0, 5000000000);
          if (dispatch_group_wait(v26, v27))
          {
            if (IMOSLoggingEnabled())
            {
              CKLogCStringForType(2);
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v42 = self;
                _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
              }

            }
            if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
              _CKLogExternal();
          }
          v29 = (void *)v36[5];
          if (v29)
          {
            -[CKSearchThumbnailPreviewGenerator mapHashesCache](self, "mapHashesCache");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v36[5], v5);

            -[CKSearchThumbnailPreviewGenerator _persistPreview:atURL:](self, "_persistPreview:atURL:", v36[5], v10);
            v29 = (void *)v36[5];
          }
          v9 = v29;

        }
        else
        {
          IMLogHandleForCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3();
          v9 = 0;
        }

      }
      else
      {
        IMLogHandleForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1();
        v9 = 0;
      }

      _Block_object_dispose(&v35, 8);
    }

  }
  return v9;
}

void __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke_cold_1();

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_previewURLForKey:(id)a3
{
  return CKSpotlightPreviewCachesFileURL(a3, (uint64_t)CFSTR("png"));
}

- (void)_persistPreview:(id)a3 atURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke;
    v17[3] = &unk_1E274A108;
    v18 = v5;
    v19 = v7;
    dispatch_async(v8, v17);

    v9 = v18;
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator _persistPreview:atURL:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  UIImagePNGRepresentation(*(UIImage **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = (id *)(a1 + 40);
    v12 = 0;
    v6 = objc_msgSend(v2, "writeToURL:options:error:", v5, 1, &v12);
    v7 = v12;
    if (v7)
      v8 = 0;
    else
      v8 = v6;
    if ((v8 & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *v4;
          *(_DWORD *)buf = 138412290;
          v14 = v10;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Persisted preview to URL OK: %@", buf, 0xCu);
        }

      }
      objc_msgSend(*v4, "path");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject im_markFileAsPurgeable:](v11, "im_markFileAsPurgeable:", 1);
    }
    else
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_2((uint64_t)v4, v7, v11);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_1();
  }

}

- (void)beginFetchingLinkMetadataForQueryResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  NSObject *v15;
  id v16;

  v4 = a3;
  if (!v4)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:].cold.1();
    goto LABEL_13;
  }
  if (!-[CKSearchThumbnailPreviewGenerator hasCachedLinkMetadataForQueryResult:](self, "hasCachedLinkMetadataForQueryResult:", v4))
  {
    objc_msgSend(v4, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v6)
    {
      -[CKSearchThumbnailPreviewGenerator keysWithInFlightLPLinkMetadataGeneration](self, "keysWithInFlightLPLinkMetadataGeneration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if ((v9 & 1) == 0)
      {
        -[CKSearchThumbnailPreviewGenerator keysWithInFlightLPLinkMetadataGeneration](self, "keysWithInFlightLPLinkMetadataGeneration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v7);

        objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke;
        v13[3] = &unk_1E27566D8;
        v13[4] = self;
        v14 = v4;
        v15 = v6;
        v16 = v7;
        objc_msgSend(v11, "loadMessageItemWithGUID:completionBlock:", v15, v13);

      }
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:].cold.2();

    }
LABEL_13:

  }
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[4], "_lpPreviewLoadQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2;
  block[3] = &unk_1E274D1B0;
  v9 = a1[5];
  v10 = v3;
  v5 = a1[6];
  v6 = a1[4];
  v11 = v5;
  v12 = v6;
  v13 = a1[7];
  v7 = v3;
  dispatch_async(v4, block);

}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("com_apple_mobilesms_lpPluginPaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_msgSend(v6, "dataSourceClassForBundleID:", *MEMORY[0x1E0D375F8]);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D358D8]), "initWithMessageItem:", *(_QWORD *)(a1 + 40));
    v9 = v8;
    if (v5)
      objc_msgSend(v8, "addAttachmentsFromFilePaths:", v5);
    v10 = (void *)objc_msgSend([v7 alloc], "initWithPluginPayload:", v9);
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "richLinkMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_cold_1(v7, a1, v12);

      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "_prewarmLinkMetadata:", v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_215;
    block[3] = &unk_1E274B060;
    v13 = *(void **)(a1 + 64);
    block[4] = *(_QWORD *)(a1 + 56);
    v20 = v13;
    v21 = v11;
    v22 = *(id *)(a1 + 32);
    v14 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_216;
    v16[3] = &unk_1E274A0B8;
    v15 = *(void **)(a1 + 64);
    v16[4] = *(_QWORD *)(a1 + 56);
    v17 = v15;
    v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_215(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightLPLinkMetadataGeneration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "lpLinkMetadataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKSearchLPLinkMetadataDidChange"), *(_QWORD *)(a1 + 56));

}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_216(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightLPLinkMetadataGeneration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "lpLinkMetadataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CKSearchLPLinkMetadataDidChange"), *(_QWORD *)(a1 + 48));

}

- (BOOL)hasCachedLinkMetadataForQueryResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchThumbnailPreviewGenerator lpLinkMetadataCache](self, "lpLinkMetadataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)cachedLinkMetadataForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchThumbnailPreviewGenerator lpLinkMetadataCache](self, "lpLinkMetadataCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = v8;
        goto LABEL_11;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v5;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Returning nil cached link metadata. Previous attempt at generating metadata failed for search result: %@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)_prewarmLinkMetadata:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchLinksThumbnailWidth");
    v7 = v6;

    v8 = 0.85;
    if (v4)
      v8 = 1.2;
    objc_msgSend(v9, "_decodeAllImagesWithMaximumSize:", v7, v8 * v7);
  }

}

- (void)beginGeneratingWebLinkPresentationPropertiesForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  CKSearchThumbnailPreviewGenerator *v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentURL");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v8)
    {
      if (!-[CKSearchThumbnailPreviewGenerator hasCachedWalletItemLinkPropertiesForQueryResult:](self, "hasCachedWalletItemLinkPropertiesForQueryResult:", v5))
      {
        -[CKSearchThumbnailPreviewGenerator keysWithInFlightLPWalletItemPropertiesMetadataGeneration](self, "keysWithInFlightLPWalletItemPropertiesMetadataGeneration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v9);

        if ((v12 & 1) == 0)
        {
          -[CKSearchThumbnailPreviewGenerator keysWithInFlightLPWalletItemPropertiesMetadataGeneration](self, "keysWithInFlightLPWalletItemPropertiesMetadataGeneration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v9);

          -[CKSearchThumbnailPreviewGenerator _lpWalletItemLinkPreviewLoadQueue](self, "_lpWalletItemLinkPreviewLoadQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke;
          v15[3] = &unk_1E274B060;
          v16 = v8;
          v17 = self;
          v18 = v9;
          v19 = v5;
          dispatch_async(v14, v15);

        }
        goto LABEL_13;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_13:

        goto LABEL_14;
      }
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Request to generate webLinkPresentation properties but we already have a cached value. Doing nothing.", buf, 2u);
      }
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CKSearchThumbnailPreviewGenerator beginGeneratingWebLinkPresentationPropertiesForQueryResult:].cold.2();
    }

    goto LABEL_13;
  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:].cold.1();
LABEL_14:

}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  _QWORD v25[8];
  _QWORD v26[8];

  objc_msgSend(*(id *)(a1 + 32), "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("order"));

  if (v3)
  {
    v4 = -[CKOrderMediaObject _initWithOverrideFileURL:]([CKOrderMediaObject alloc], "_initWithOverrideFileURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "previewMetadataFilenameExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewMetadataFileURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if (!v9
      || (objc_msgSend(v4, "previewMetadataWithContentsOfURL:error:", v6, 0),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "generatePreviewMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writePreviewMetadata:toURL:error:", v10, v6, 0);
    }
    objc_msgSend(v4, "setOverrideMetadataProperties:", v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "previewMaxWidth");
    objc_msgSend(v4, "presentationPropertiesForWidth:orientation:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "image");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("shippingbox.fill"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v14);
        objc_msgSend(v12, "setImage:", v15);

        v16 = objc_alloc_init(MEMORY[0x1E0CC1188]);
        objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackgroundColor:", v17);

        objc_msgSend(v12, "setImageProperties:", v16);
      }
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_2;
    v26[3] = &unk_1E274B060;
    v26[4] = *(_QWORD *)(a1 + 40);
    v26[5] = v12;
    v18 = (id *)v26;
  }
  else
  {
    v4 = -[CKPassPreviewMediaObject _initWithOverrideFileURL:]([CKPassPreviewMediaObject alloc], "_initWithOverrideFileURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "previewMetadataFilenameExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewMetadataFileURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

    if (!v22
      || (objc_msgSend(v4, "previewMetadataWithContentsOfURL:error:", v6, 0),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "generatePreviewMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writePreviewMetadata:toURL:error:", v10, v6, 0);
    }
    objc_msgSend(v4, "setOverrideMetadataProperties:", v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "previewMaxWidth");
    objc_msgSend(v4, "presentationPropertiesForWidth:orientation:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_3;
    v25[3] = &unk_1E274B060;
    v25[4] = *(_QWORD *)(a1 + 40);
    v25[5] = v12;
    v18 = (id *)v25;
  }
  v18[6] = *(id *)(a1 + 48);
  v18[7] = *(id *)(a1 + 56);
  v24 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "lpWalletItemPropertiesMetadataCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightLPWalletItemPropertiesMetadataGeneration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKSearchLPWalletItemMetadataDidChange"), *(_QWORD *)(a1 + 56));

}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "lpWalletItemPropertiesMetadataCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "keysWithInFlightLPWalletItemPropertiesMetadataGeneration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKSearchLPWalletItemMetadataDidChange"), *(_QWORD *)(a1 + 56));

}

- (BOOL)hasCachedWalletItemLinkPropertiesForQueryResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchThumbnailPreviewGenerator lpWalletItemPropertiesMetadataCache](self, "lpWalletItemPropertiesMetadataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)cachedWalletItemLinkPropertiesForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchThumbnailPreviewGenerator lpWalletItemPropertiesMetadataCache](self, "lpWalletItemPropertiesMetadataCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = v8;
        goto LABEL_11;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v5;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Returning nil web link presentation properties. Previous attempt at generating this failed for search result: %@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (NSCache)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCache, a3);
}

- (NSCache)livePhotoStatusCache
{
  return self->_livePhotoStatusCache;
}

- (void)setLivePhotoStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoStatusCache, a3);
}

- (NSCache)spatialStatusCache
{
  return self->_spatialStatusCache;
}

- (void)setSpatialStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_spatialStatusCache, a3);
}

- (NSCache)videoDurationCache
{
  return self->_videoDurationCache;
}

- (void)setVideoDurationCache:(id)a3
{
  objc_storeStrong((id *)&self->_videoDurationCache, a3);
}

- (NSCache)lpLinkMetadataCache
{
  return self->_lpLinkMetadataCache;
}

- (void)setLpLinkMetadataCache:(id)a3
{
  objc_storeStrong((id *)&self->_lpLinkMetadataCache, a3);
}

- (NSCache)lpWalletItemPropertiesMetadataCache
{
  return self->_lpWalletItemPropertiesMetadataCache;
}

- (void)setLpWalletItemPropertiesMetadataCache:(id)a3
{
  objc_storeStrong((id *)&self->_lpWalletItemPropertiesMetadataCache, a3);
}

- (NSMutableDictionary)mapHashesCache
{
  return self->_mapHashesCache;
}

- (void)setMapHashesCache:(id)a3
{
  objc_storeStrong((id *)&self->_mapHashesCache, a3);
}

- (NSMutableSet)keysWithInFlightGeneration
{
  return self->_keysWithInFlightGeneration;
}

- (void)setKeysWithInFlightGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightGeneration, a3);
}

- (NSMutableSet)keysWithInFlightLivePhotoStatus
{
  return self->_keysWithInFlightLivePhotoStatus;
}

- (void)setKeysWithInFlightLivePhotoStatus:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightLivePhotoStatus, a3);
}

- (NSMutableSet)keysWithInFlightSpatialStatus
{
  return self->_keysWithInFlightSpatialStatus;
}

- (void)setKeysWithInFlightSpatialStatus:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightSpatialStatus, a3);
}

- (NSMutableSet)keysWithInFlightVideoDurationCalculation
{
  return self->_keysWithInFlightVideoDurationCalculation;
}

- (void)setKeysWithInFlightVideoDurationCalculation:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightVideoDurationCalculation, a3);
}

- (NSMutableSet)keysWithInFlightLPLinkMetadataGeneration
{
  return self->_keysWithInFlightLPLinkMetadataGeneration;
}

- (void)setKeysWithInFlightLPLinkMetadataGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightLPLinkMetadataGeneration, a3);
}

- (NSMutableSet)keysWithInFlightLPWalletItemPropertiesMetadataGeneration
{
  return self->_keysWithInFlightLPWalletItemPropertiesMetadataGeneration;
}

- (void)setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithInFlightLPWalletItemPropertiesMetadataGeneration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysWithInFlightLPWalletItemPropertiesMetadataGeneration, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightLPLinkMetadataGeneration, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightVideoDurationCalculation, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightSpatialStatus, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightLivePhotoStatus, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightGeneration, 0);
  objc_storeStrong((id *)&self->_mapHashesCache, 0);
  objc_storeStrong((id *)&self->_lpWalletItemPropertiesMetadataCache, 0);
  objc_storeStrong((id *)&self->_lpLinkMetadataCache, 0);
  objc_storeStrong((id *)&self->_videoDurationCache, 0);
  objc_storeStrong((id *)&self->_spatialStatusCache, 0);
  objc_storeStrong((id *)&self->_livePhotoStatusCache, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
}

- (void)generatePreviewForQueryResult:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, (uint64_t)v0, "Cannot generate preview, key %@ url %@", v1);
  OUTLINED_FUNCTION_2();
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, (uint64_t)v0, "Failed to create preview thumbnail URL (preview NOT persisted) for key: %@, URL: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to generate icon for attachment for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_145_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 64), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a2, v4, "Failed to generate preview for attachment at URL, generating icon. URL: %@, error: %@", v5);

  OUTLINED_FUNCTION_13();
}

- (void)queryResultHasLivePhoto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot determine live photo status, no identifer on result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_checkResultForLivePhotoComplement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Cannot determine live photo status url %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)queryResultIsSpatial:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot determine spatial status, no identifer on result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_checkResultForSpatialMedia:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Cannot determine spatial status url %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)queryResultIsVideo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Cannot determine video url %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)durationForVideoResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot determine video duration, no identifer on result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_calculateDurationForVideoResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to generate AVURLAsset from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to get UIImage from QLThumbnailRepresentation for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to get icon image for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to get icon UIImage from SIImage for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_172_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v1, "Failed to passView preview for key: %@, URL: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to create preview URL for key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, (uint64_t)v0, "Failed to create preview image from image source data for key: %@, url: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)generateMapPreviewForQueryResult:traitCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot generate map preview, nil key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Got error back in CKSearchThumbnailPreviewGenerator for map snapshot: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_4_0();
  v3 = CFSTR("MapKit");
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_4_0();
  v3 = CFSTR("MapKit");
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_4_0();
  v3 = CFSTR("MapKit");
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Invalid MKCoordinateRegion, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "%@ has invalid coordinate. Abort preview generation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Got error back in CKLocationMediaObject for map snapshot: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_persistPreview:(uint64_t)a3 atURL:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a1, a3, "%s nil preview or url, preview NOT persisted", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to create data representation for preview at URL: %@. Preview NOT persisted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a3, v5, "Failed to persist preview data to disk for URL: %@, with error: %@", v6);

  OUTLINED_FUNCTION_13();
}

- (void)beginFetchingLinkMetadataForQueryResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Trying to get link meta data with nil result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)beginFetchingLinkMetadataForQueryResult:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, (uint64_t)v0, "Failed load key or guid for link meta data - key: %@, guid: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_cold_1(Class aClass, uint64_t a2, NSObject *a3)
{
  __CFString *v6;
  uint64_t v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (aClass)
  {
    NSStringFromClass(aClass);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("NULL");
  }
  v7 = *(_QWORD *)(a2 + 48);
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a3, (uint64_t)a3, "Rich links data source of type %@ did not provide linkMetaData for guid: %@", (uint8_t *)&v8);
  if (aClass)

  OUTLINED_FUNCTION_13();
}

- (void)beginGeneratingWebLinkPresentationPropertiesForQueryResult:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, (uint64_t)v0, "Failed load key or contentURL for link meta data - key: %@, guid: %@", v1);
  OUTLINED_FUNCTION_2();
}

@end
