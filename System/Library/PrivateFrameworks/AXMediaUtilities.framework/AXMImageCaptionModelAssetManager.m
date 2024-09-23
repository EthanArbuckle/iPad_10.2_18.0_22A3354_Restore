@implementation AXMImageCaptionModelAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  return (id)sharedInstance__Shared;
}

void __50__AXMImageCaptionModelAssetManager_sharedInstance__block_invoke()
{
  AXMImageCaptionModelAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXMImageCaptionModelAssetManager);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (AXMImageCaptionModelAssetManager)init
{
  AXMImageCaptionModelAssetManager *v2;
  AXMImageCaptionModelAssetManager *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  AXAssetController *assetController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXMImageCaptionModelAssetManager;
  v2 = -[AXMImageCaptionModelAssetManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E0CF2D70];
    objc_msgSend(MEMORY[0x1E0CF2DB0], "policy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetControllerWithPolicy:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    assetController = v3->_assetController;
    v3->_assetController = (AXAssetController *)v6;

    -[AXAssetController addObserver:](v3->_assetController, "addObserver:", v3);
    -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](v3->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 0, 0, 0);
  }
  return v3;
}

- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v11;
  double v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  const __CFString *v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke;
  v24[3] = &unk_1E625CA50;
  v24[4] = self;
  v24[5] = &v25;
  -[AXMImageCaptionModelAssetManager _performWithLock:](self, "_performWithLock:", v24);
  if (v26[5])
  {
    -[AXMImageCaptionModelAssetManager _modelURLForType:baseURL:](self, "_modelURLForType:baseURL:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  if (a4 == 0.0 || self->_didTryWaitingForAssetLookup)
  {
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v11;
  v13 = v26[5];
  v14 = v13 == 0;
  v15 = v11 - v11;
  if (!v13 && v15 < a4)
  {
    v16 = (const __CFString *)*MEMORY[0x1E0C9B280];
    do
    {
      CFRunLoopRunInMode(v16, 0.2, 0);
      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke_2;
      v23[3] = &unk_1E625CA50;
      v23[4] = self;
      v23[5] = &v25;
      -[AXMImageCaptionModelAssetManager _performWithLock:](self, "_performWithLock:", v23);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v17 = v26[5];
      v14 = v17 == 0;
      v15 = v18 - v12;
      if (v17)
        v19 = 0;
      else
        v19 = v15 < a4;
    }
    while (v19);
  }
  if (!v14)
  {
    -[AXMImageCaptionModelAssetManager _modelURLForType:baseURL:](self, "_modelURLForType:baseURL:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  AXLogAssetLoader();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[AXMImageCaptionModelAssetManager modelURLForType:timeout:].cold.1(v20, v15, a4, v21, v22);

  v9 = 0;
  self->_didTryWaitingForAssetLookup = 1;
LABEL_7:
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)infoForModelAtURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  id v12;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("model_info.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2DA8]), "initWithModelProperties:", v6);
    }
    else
    {
      AXLogAssetLoader();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXMImageCaptionModelAssetManager infoForModelAtURL:].cold.1();

      v8 = 0;
    }
  }
  else
  {
    AXLogAssetLoader();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMImageCaptionModelAssetManager infoForModelAtURL:].cold.1();
    v8 = 0;
    v7 = v5;
  }

  return v8;
}

- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (a3 == 1)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("VideoCaptionModel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v10, &v13);

    if (!v13)
    {
      v11 = 0;
      goto LABEL_11;
    }
    v7 = v9;
LABEL_8:
    v11 = v9;
    v9 = v7;
LABEL_11:

    goto LABEL_12;
  }
  if (!a3)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("ImageCaptionModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v8, &v13);

    if (v13)
      v9 = v7;
    else
      v9 = v5;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  AXMImageCaptionModelAssetManager *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  AXLogAssetLoader();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. didFinishRefreshingAssets: (%@). error: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF2D60], "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v8, CFSTR("Stable"), CFSTR("en"), 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CF2D78], "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordLastAssetAccess:", v11);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98__AXMImageCaptionModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
    v14[3] = &unk_1E625CB18;
    v15 = v11;
    v16 = self;
    -[AXMImageCaptionModelAssetManager _performWithLock:](self, "_performWithLock:", v14);
    v13 = v15;
  }
  else
  {
    AXLogAssetLoader();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. No compatible installed asset found", buf, 2u);
    }
  }

}

void __98__AXMImageCaptionModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  AXLogAssetLoader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "localURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. asset controller setting model baseURL after asset refresh: %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "localURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 40), "setBaseURL:", v5);

}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

- (void)modelURLForType:(double)a3 timeout:(uint64_t)a4 .cold.1(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, a1, a5, "Did time out waiting for image caption asset refresh. timeWaited:%.2f timeout:%.2f", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

- (void)infoForModelAtURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, v0, (uint64_t)v0, "Could not load AXImageCaptionModel at %@. error: %@", v1);
  OUTLINED_FUNCTION_1();
}

@end
