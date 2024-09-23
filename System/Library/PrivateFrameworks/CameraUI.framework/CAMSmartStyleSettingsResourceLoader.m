@implementation CAMSmartStyleSettingsResourceLoader

- (CAMSmartStyleSettingsResourceLoader)initWithDelegate:(id)a3 loadingQueue:(id)a4 assetIdentifier:(id)a5 logIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CAMSmartStyleSettingsResourceLoader *v14;
  CAMSmartStyleSettingsResourceLoader *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CAMSmartStyleSettingsResourceLoader;
  v14 = -[CAMSmartStyleSettingsResourceLoader init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->__resourceLoadingQueue, a4);
    objc_storeStrong((id *)&v15->_assetIdentifier, a5);
    objc_storeStrong((id *)&v15->_logIdentifier, a6);
    v15->_status = 0;
  }

  return v15;
}

- (void)_setStatus:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_status != a3)
  {
    self->_status = a3;
    v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if ((unint64_t)a3 > 4)
        v8 = 0;
      else
        v8 = off_1EA32DA58[a3];
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): status changed to %{public}@", (uint8_t *)&v10, 0x16u);

    }
    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x1A) != 0)
    {
      -[CAMSmartStyleSettingsResourceLoader delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "smartStyleSettingsResourceLoaderDidFinishLoading:", self);

    }
  }
}

- (void)startLoading
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  NSObject *resourceLoadingQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[CAMSmartStyleSettingsResourceLoader status](self, "status"))
  {
    v3 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CAMSmartStyleSettingsResourceLoader status](self, "status");
      if (v5 > 4)
        v6 = 0;
      else
        v6 = off_1EA32DA58[v5];
      *(_DWORD *)buf = 138543618;
      v10 = v4;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): ignoring call to startLoading since status is %{public}@", buf, 0x16u);

    }
  }
  else
  {
    self->__startTime = CFAbsoluteTimeGetCurrent();
    resourceLoadingQueue = self->__resourceLoadingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__CAMSmartStyleSettingsResourceLoader_startLoading__block_invoke;
    block[3] = &unk_1EA328868;
    block[4] = self;
    dispatch_async(resourceLoadingQueue, block);
  }
}

uint64_t __51__CAMSmartStyleSettingsResourceLoader_startLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_fetchAsset");
}

- (void)_loadingQueue_fetchAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double Current;
  double startTime;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  double v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__resourceLoadingQueue);
  v3 = (void *)MEMORY[0x1E0CD1390];
  -[CAMSmartStyleSettingsResourceLoader assetIdentifier](self, "assetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsWithLocalIdentifiers:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  startTime = self->__startTime;
  v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2048;
    v18 = Current - startTime;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): asset fetch took %.3f", buf, 0x16u);

  }
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__CAMSmartStyleSettingsResourceLoader__loadingQueue_fetchAsset__block_invoke;
  v13[3] = &unk_1EA328A40;
  v13[4] = self;
  v14 = v11;
  v12 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __63__CAMSmartStyleSettingsResourceLoader__loadingQueue_fetchAsset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadWithAsset:", *(_QWORD *)(a1 + 40));
}

- (void)_loadWithAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PEResourceLoader *resourceLoader;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D7CB20]);
    objc_msgSend(v5, "setRequireLocalResources:", 1);
    objc_msgSend(v5, "setVersion:", 1);
    objc_msgSend(v5, "setSkipLivePhotoImageAndAVAsset:", 1);
    objc_msgSend(v5, "setDelegate:", self);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CB28]), "initWithAsset:loadingQueue:", v4, self->__resourceLoadingQueue);
    objc_msgSend(v6, "setSkipDisplaySizeImage:", 1);
    -[CAMSmartStyleSettingsResourceLoader _setStatus:](self, "_setStatus:", 2);
    objc_msgSend(v6, "enqueueRequest:", v5);
    resourceLoader = self->__resourceLoader;
    self->__resourceLoader = (PEResourceLoader *)v6;

  }
  else
  {
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): failed to load asset", (uint8_t *)&v10, 0xCu);

    }
    -[CAMSmartStyleSettingsResourceLoader _setStatus:](self, "_setStatus:", 1);
  }

}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  id v6;
  double Current;
  double startTime;
  NSObject *v9;
  void *v10;
  CAMSmartStyleSettingsResourceLoadResult *v11;
  void *v12;
  CAMSmartStyleSettingsResourceLoadResult *v13;
  CAMSmartStyleSettingsResourceLoadResult *resourceLoadResult;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  startTime = self->__startTime;
  v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2048;
    v18 = Current - startTime;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): loading took %.3f seconds", (uint8_t *)&v15, 0x16u);

  }
  v11 = [CAMSmartStyleSettingsResourceLoadResult alloc];
  -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CAMSmartStyleSettingsResourceLoadResult initWithResourceLoadResult:logIdentifier:](v11, "initWithResourceLoadResult:logIdentifier:", v6, v12);

  resourceLoadResult = self->_resourceLoadResult;
  self->_resourceLoadResult = v13;

  -[CAMSmartStyleSettingsResourceLoader _setStatus:](self, "_setStatus:", 3);
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): failed to load resource: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[CAMSmartStyleSettingsResourceLoader _setStatus:](self, "_setStatus:", 4);

}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMSmartStyleSettingsResourceLoader logIdentifier](self, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a5;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): download progress: %.3f", (uint8_t *)&v9, 0x16u);

  }
}

- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __137__CAMSmartStyleSettingsResourceLoader_photoEditResourceLoadRequestResourcesAvailabilityChanged_previousAvailability_currentAvailability___block_invoke;
  v5[3] = &unk_1EA32B498;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  cam_perform_on_main_asap(v5);
}

void __137__CAMSmartStyleSettingsResourceLoader_photoEditResourceLoadRequestResourcesAvailabilityChanged_previousAvailability_currentAvailability___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 > 4)
      v6 = 0;
    else
      v6 = off_1EA32DA80[v5];
    v7 = *(_QWORD *)(a1 + 48);
    if (v7 > 4)
      v8 = 0;
    else
      v8 = off_1EA32DA80[v7];
    v9 = 138543874;
    v10 = v3;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): availability changed from %{public}@ to %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (CAMSmartStyleSettingsResourceLoaderDelegate)delegate
{
  return (CAMSmartStyleSettingsResourceLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (OS_dispatch_queue)_resourceLoadingQueue
{
  return self->__resourceLoadingQueue;
}

- (PEResourceLoader)_resourceLoader
{
  return self->__resourceLoader;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resourceLoader, 0);
  objc_storeStrong((id *)&self->__resourceLoadingQueue, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
