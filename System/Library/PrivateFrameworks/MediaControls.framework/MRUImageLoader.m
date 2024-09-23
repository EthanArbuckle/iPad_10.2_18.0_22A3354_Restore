@implementation MRUImageLoader

- (MRUImageLoader)initWithDestination:(id)a3 imageHandler:(id)a4
{
  id v6;
  id v7;
  MRUImageLoader *v8;
  MRUImageLoader *v9;
  uint64_t v10;
  id imageHandler;
  CGSize v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MRUImageLoader;
  v8 = -[MRUImageLoader init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_destination, v6);
    v10 = objc_msgSend(v7, "copy");
    imageHandler = v9->_imageHandler;
    v9->_imageHandler = (id)v10;

    v9->_cacheImages = +[MRUFeatureFlagProvider isImageCachingEnabled](MRUFeatureFlagProvider, "isImageCachingEnabled");
    v9->_formatImages = 1;
    v9->_state = 1;
    v12 = (CGSize)*MEMORY[0x1E0C9D820];
    v9->_lastVendedScaledFittingSize = (CGSize)*MEMORY[0x1E0C9D820];
    v9->_fittingSize = v12;
    v9->_failedLoadingCount = 0;
    v9->_scale = 1.0;
    if (+[MRUFeatureFlagProvider isImageCachingEnabled](MRUFeatureFlagProvider, "isImageCachingEnabled"))
    {
      +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerLoader:", v9);

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  MRUImageLoader *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verboseImageLoadingLogging");

  if (v4)
  {
    MCLogCategoryImageLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = objc_opt_class();
      v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> deallocating.", buf, 0x16u);
    }

  }
  +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterLoader:", self);

  v7.receiver = self;
  v7.super_class = (Class)MRUImageLoader;
  -[MRUImageLoader dealloc](&v7, sel_dealloc);
}

- (BOOL)wouldLoadNewImageForCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  double v30;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRUImageLoader destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[MRUImageLoader state](self, "state") == 2)
    {
      if (NSClassFromString(CFSTR("MPCMRContentItemArtworkDataToken"))
        && ((objc_opt_isKindOfClass() & 1) != 0
         || (objc_msgSend(v5, "artworkCatalog"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             isKindOfClass = objc_opt_isKindOfClass(),
             v6,
             (isKindOfClass & 1) != 0)))
      {
        objc_msgSend(v5, "artworkCatalog");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isArtworkVisuallyIdenticalToCatalog:", v8))
        {
          objc_msgSend(v4, "visualIdenticalityIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "artworkCatalog");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "visualIdenticalityIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 == v11)
            v12 = 1;
          else
            v12 = objc_msgSend(v9, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        objc_msgSend(v5, "artworkCatalog");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "isArtworkVisuallyIdenticalToCatalog:", v4);
      }

      -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
      v25 = v24;
      v27 = v26;
      -[MRUImageLoader targetFittingSizeForCurrentCatalogConfiguration](self, "targetFittingSizeForCurrentCatalogConfiguration");
      v29 = v12 ^ 1;
      if (v25 != v30)
        v29 = 1;
      if (v27 == v28)
        LOBYTE(v13) = v29;
      else
        LOBYTE(v13) = 1;
    }
    else
    {
      -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
      v15 = v14;
      v17 = v16;
      -[MRUImageLoader lastVendedScaledFittingSize](self, "lastVendedScaledFittingSize");
      LOBYTE(v13) = 1;
      if (v15 == v19 && v17 == v18)
      {
        objc_msgSend(v4, "visualIdenticalityIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRUImageLoader lastVendedArtworkIdentifier](self, "lastVendedArtworkIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 == v23)
          LOBYTE(v13) = 0;
        else
          v13 = objc_msgSend(v21, "isEqual:", v23) ^ 1;

      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)updateCatalog:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  uint64_t v13;
  __int16 v14;
  MRUImageLoader *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRUImageLoader catalog](self, "catalog");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[MRUImageLoader setCatalog:](self, "setCatalog:", v4);
    if (-[MRUImageLoader wouldLoadNewImageForCatalog:](self, "wouldLoadNewImageForCatalog:", v4))
    {
      -[MRUImageLoader destination](self, "destination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (v4)
        {
          if (!-[MRUImageLoader vendCachedImageIfPossible](self, "vendCachedImageIfPossible"))
            -[MRUImageLoader configureCatalog](self, "configureCatalog");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "verboseImageLoadingLogging");

          if (v8)
          {
            MCLogCategoryImageLoading();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v12 = 138412546;
              v13 = objc_opt_class();
              v14 = 2048;
              v15 = self;
              _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update with nil catalog.", (uint8_t *)&v12, 0x16u);
            }

          }
          -[MRUImageLoader destination](self, "destination");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "clearArtworkCatalogs");

          -[MRUImageLoader setState:](self, "setState:", 1);
          -[MRUImageLoader setFailedLoadingCount:](self, "setFailedLoadingCount:", 0);
          -[MRUImageLoader setLastFailedArtworkIdentifier:](self, "setLastFailedArtworkIdentifier:", 0);
          -[MRUImageLoader setLastVendedScaledFittingSize:](self, "setLastVendedScaledFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          -[MRUImageLoader setLastVendedArtworkIdentifier:](self, "setLastVendedArtworkIdentifier:", 0);
          -[MRUImageLoader imageHandler](self, "imageHandler");
          v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v11[2](v11, 0, 0);

        }
      }

    }
  }

}

- (void)updateFittingSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  MRUImageLoader *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  uint64_t v27;
  CGSize v28;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRUImageLoader deferredFittingSize](self, "deferredFittingSize");
  v10 = v9 == width && v8 == height;
  if (!v10 || (-[MRUImageLoader deferredScale](self, "deferredScale"), v11 != a4))
  {
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "verboseImageLoadingLogging");

    if (v13)
    {
      MCLogCategoryImageLoading();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_opt_class();
        v28.width = width;
        v28.height = height;
        NSStringFromCGSize(v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v20 = v15;
        v21 = 2048;
        v22 = self;
        v23 = 2112;
        v24 = v16;
        v25 = 2048;
        v26 = a4;
        _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update deferred fitting size: %@, scale: %lf.", buf, 0x2Au);

      }
    }
    -[MRUImageLoader setDeferredFittingSize:](self, "setDeferredFittingSize:", width, height);
    -[MRUImageLoader setDeferredScale:](self, "setDeferredScale:", a4);
    if (!-[MRUImageLoader fittingSizeUpdateScheduled](self, "fittingSizeUpdateScheduled"))
    {
      -[MRUImageLoader setFittingSizeUpdateScheduled:](self, "setFittingSizeUpdateScheduled:", 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__MRUImageLoader_updateFittingSize_scale___block_invoke;
      block[3] = &unk_1E5818C88;
      block[4] = self;
      v17 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

uint64_t __42__MRUImageLoader_updateFittingSize_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deferredUpdateFittingSize");
}

- (void)deferredUpdateFittingSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  CGFloat v39;
  CGFloat v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  MRUImageLoader *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  CGSize v50;
  CGSize v51;

  v49 = *MEMORY[0x1E0C80C00];
  -[MRUImageLoader deferredFittingSize](self, "deferredFittingSize");
  v4 = v3;
  v6 = v5;
  -[MRUImageLoader deferredScale](self, "deferredScale");
  v8 = v7;
  -[MRUImageLoader setFittingSizeUpdateScheduled:](self, "setFittingSizeUpdateScheduled:", 0);
  v9 = floor(v4);
  v10 = floor(v6);
  -[MRUImageLoader fittingSize](self, "fittingSize");
  v13 = v12 == v9 && v11 == v10;
  if (!v13 || (-[MRUImageLoader scale](self, "scale"), v14 != v8))
  {
    -[MRUImageLoader setFittingSize:](self, "setFittingSize:", v9, v10);
    -[MRUImageLoader setScale:](self, "setScale:", v8);
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "verboseImageLoadingLogging");

    if (v16)
    {
      MCLogCategoryImageLoading();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_opt_class();
        -[MRUImageLoader fittingSize](self, "fittingSize");
        NSStringFromCGSize(v50);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRUImageLoader scale](self, "scale");
        *(_DWORD *)buf = 138413058;
        v42 = v18;
        v43 = 2048;
        v44 = self;
        v45 = 2112;
        v46 = v19;
        v47 = 2048;
        v48 = v20;
        _os_log_impl(&dword_1AA991000, v17, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update fitting size: %@, scale: %lf.", buf, 0x2Au);

      }
    }
    -[MRUImageLoader destination](self, "destination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registeredLoaderFittingSizeDidChange:", self);

    if (v21 && !-[MRUImageLoader vendCachedImageIfPossible](self, "vendCachedImageIfPossible"))
    {
      objc_msgSend(v21, "artworkCatalog");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUImageLoader catalog](self, "catalog");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 == v23)
      {
        if (v23)
        {
          if (+[MRUFeatureFlagProvider isImageCachingEnabled](MRUFeatureFlagProvider, "isImageCachingEnabled"))
          {
            +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "requestSize");
            v27 = v26;
            v29 = v28;

          }
          else
          {
            -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
            v27 = v30;
            v29 = v31;
          }
          objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "verboseImageLoadingLogging");

          if (v33)
          {
            MCLogCategoryImageLoading();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = objc_opt_class();
              v51.width = v27;
              v51.height = v29;
              NSStringFromCGSize(v51);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v42 = v35;
              v43 = 2048;
              v44 = self;
              v45 = 2112;
              v46 = v36;
              v47 = 2048;
              v48 = v23;
              _os_log_impl(&dword_1AA991000, v34, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update fitting size: %@ on associated catalog: %p", buf, 0x2Au);

            }
          }
          -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
          -[MRUImageLoader setTargetFittingSizeForCurrentCatalogConfiguration:](self, "setTargetFittingSizeForCurrentCatalogConfiguration:");
          -[MRUImageLoader setState:](self, "setState:", 2);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __43__MRUImageLoader_deferredUpdateFittingSize__block_invoke;
          v37[3] = &unk_1E581B750;
          v38 = v23;
          v39 = v27;
          v40 = v29;
          -[MRUImageLoader withNoEscapeCheck:](self, "withNoEscapeCheck:", v37);

        }
      }
      else
      {
        -[MRUImageLoader configureCatalog](self, "configureCatalog");
      }

    }
  }
}

uint64_t __43__MRUImageLoader_deferredUpdateFittingSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFittingSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)vendCachedImageIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  int v20;
  uint64_t v21;
  __int16 v22;
  MRUImageLoader *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MRUImageLoader catalog](self, "catalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[MRUImageUtilities clearCache](MRUImageUtilities, "clearCache");
    LOBYTE(v5) = 0;
  }
  else
  {
    -[MRUImageLoader destination](self, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUImageLoader catalog](self, "catalog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualIdenticalityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v5) = 0;
    if (v6)
    {
      if (v8)
      {
        -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
        v10 = v9;
        v12 = v11;
        +[MRUImageUtilities formattedImageForIdentifier:size:](MRUImageUtilities, "formattedImageForIdentifier:size:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(v6, "clearArtworkCatalogs");
          objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "verboseImageLoadingLogging");

          if (v14)
          {
            MCLogCategoryImageLoading();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v20 = 138413058;
              v21 = objc_opt_class();
              v22 = 2048;
              v23 = self;
              v24 = 2112;
              v25 = v5;
              v26 = 2112;
              v27 = v6;
              _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> Vending cached image %@ to destination %@.", (uint8_t *)&v20, 0x2Au);
            }

          }
          -[MRUImageLoader setState:](self, "setState:", 6);
          -[MRUImageLoader setFailedLoadingCount:](self, "setFailedLoadingCount:", 0);
          -[MRUImageLoader setLastFailedArtworkIdentifier:](self, "setLastFailedArtworkIdentifier:", 0);
          -[MRUImageLoader catalog](self, "catalog");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "visualIdenticalityIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRUImageLoader setLastVendedArtworkIdentifier:](self, "setLastVendedArtworkIdentifier:", v17);

          -[MRUImageLoader setLastVendedScaledFittingSize:](self, "setLastVendedScaledFittingSize:", v10, v12);
          -[MRUImageLoader imageHandler](self, "imageHandler");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v5, 0);

          LOBYTE(v5) = 1;
        }
      }
    }

  }
  return (char)v5;
}

- (CGSize)scaledFittingSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  CGSize result;

  -[MRUImageLoader fittingSize](self, "fittingSize");
  v4 = v3;
  v6 = v5;
  -[MRUImageLoader scale](self, "scale");
  v8 = v7;
  -[MRUImageLoader scale](self, "scale");
  CGAffineTransformMakeScale(&v12, v8, v9);
  v10 = v6 * v12.c + v12.a * v4;
  v11 = v6 * v12.d + v12.b * v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  MRUImageLoader *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verboseImageLoadingLogging");

  if (v6)
  {
    MCLogCategoryImageLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      v9 = self->_state - 2;
      if (v9 > 4)
        v10 = CFSTR("initial");
      else
        v10 = off_1E581BB20[v9];
      if ((unint64_t)(a3 - 2) > 4)
        v11 = CFSTR("initial");
      else
        v11 = off_1E581BB20[a3 - 2];
      v12 = 138413058;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> transition %@ -> %@.", (uint8_t *)&v12, 0x2Au);
    }

  }
  self->_state = a3;
}

- (void)setLastVendedArtworkIdentifier:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_lastVendedArtworkIdentifier, a3);
  v5 = a3;
  +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registeredLoaderArtworkIdentifierDidChange:", self);
}

- (void)configureCatalog
{
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  MRUImageLoader *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  CGSize v45;
  CGSize v46;

  v44 = *MEMORY[0x1E0C80C00];
  -[MRUImageLoader destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUImageLoader catalog](self, "catalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualIdenticalityIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MRUImageLoader state](self, "state") == 4)
  {
    objc_msgSend(v6, "stringRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUImageLoader lastFailedArtworkIdentifier](self, "lastFailedArtworkIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "stringRepresentation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "isEqual:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "verboseImageLoadingLogging");

    if (!v18)
      goto LABEL_31;
    MCLogCategoryImageLoading();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = objc_opt_class();
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> will not configure catalog %p vending oversized artwork.", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_4:
  -[MRUImageLoader lastFailedArtworkIdentifier](self, "lastFailedArtworkIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v11)
  {

  }
  else
  {
    v12 = v11;
    v2 = objc_msgSend(v6, "isEqual:", v11);

    if ((v2 & 1) == 0)
    {
      -[MRUImageLoader setFailedLoadingCount:](self, "setFailedLoadingCount:", 0);
      goto LABEL_14;
    }
  }
  if (-[MRUImageLoader state](self, "state") == 3
    && -[MRUImageLoader failedLoadingCount](self, "failedLoadingCount") >= 3)
  {
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "verboseImageLoadingLogging");

    if (!v14)
      goto LABEL_31;
    MCLogCategoryImageLoading();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = objc_opt_class();
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> exhausted retries, will not configure catalog %p.", buf, 0x20u);
    }
LABEL_13:

    goto LABEL_31;
  }
LABEL_14:
  if (v4 && v5)
  {
    objc_initWeak(&location, self);
    -[MRUImageLoader setState:](self, "setState:", 2);
    -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
    -[MRUImageLoader setTargetFittingSizeForCurrentCatalogConfiguration:](self, "setTargetFittingSizeForCurrentCatalogConfiguration:");
    v16 = +[MRUFeatureFlagProvider isImageCachingEnabled](MRUFeatureFlagProvider, "isImageCachingEnabled");
    if (v16)
    {
      +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "requestSize");
    }
    else
    {
      -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
    }
    objc_msgSend(v5, "setFittingSize:");
    if (v16)

    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "verboseImageLoadingLogging");

    if (v20)
    {
      MCLogCategoryImageLoading();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        objc_msgSend(v5, "visualIdenticalityIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringRepresentation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fittingSize");
        NSStringFromCGSize(v45);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[MRUImageLoader scaledFittingSize](self, "scaledFittingSize");
        NSStringFromCGSize(v46);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v33 = v22;
        v34 = 2048;
        v35 = self;
        v36 = 2048;
        v37 = v5;
        v38 = 2112;
        v39 = v24;
        v40 = 2112;
        v41 = v25;
        v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> configuring catalog %p, with identifier: %@, request size: %@, scaled fitting size: %@.", buf, 0x3Eu);

      }
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __34__MRUImageLoader_configureCatalog__block_invoke;
    v27[3] = &unk_1E581BB00;
    v28 = v5;
    v29 = v4;
    objc_copyWeak(&v30, &location);
    -[MRUImageLoader withNoEscapeCheck:](self, "withNoEscapeCheck:", v27);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }
LABEL_31:

}

void __34__MRUImageLoader_configureCatalog__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__MRUImageLoader_configureCatalog__block_invoke_2;
  v3[3] = &unk_1E581BAD8;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "setDestination:configurationBlock:", v2, v3);
  objc_destroyWeak(&v4);
}

void __34__MRUImageLoader_configureCatalog__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "artworkCatalog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "size");
      v10 = v9;
      objc_msgSend(v6, "scale");
      v12 = v10 * v11;
      objc_msgSend(v6, "size");
      v14 = v13;
      objc_msgSend(v6, "scale");
      if (v12 <= 3000.0 && v14 * v15 <= 3000.0)
      {
        objc_msgSend(WeakRetained, "scaledFittingSize");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v8, "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSClassFromString(CFSTR("_MPArtworkCatalogStaticDataSource"));
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v8, "overlayDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 || (isKindOfClass & 1) != 0)
        {

        }
        else if (objc_msgSend(WeakRetained, "cacheImages"))
        {
          if (!objc_msgSend(WeakRetained, "runningSynchronously"))
          {
            v35 = 1;
LABEL_24:
            if (objc_msgSend(WeakRetained, "formatImages"))
            {
              objc_msgSend(v8, "visualIdenticalityIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringRepresentation");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", v6, v37, v35, v17, v19);
              v28 = (id)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
LABEL_30:
                objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "verboseImageLoadingLogging");

                if (v41)
                {
                  MCLogCategoryImageLoading();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    v43 = objc_opt_class();
                    v45 = 138413058;
                    v46 = v43;
                    v47 = 2048;
                    v48 = WeakRetained;
                    v49 = 2112;
                    v50 = v28;
                    v51 = 2112;
                    v52 = v5;
                    _os_log_impl(&dword_1AA991000, v42, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> Vending formatted image %@ to destination %@.", (uint8_t *)&v45, 0x2Au);
                  }

                }
                objc_msgSend(WeakRetained, "setState:", 5);
                objc_msgSend(WeakRetained, "setFailedLoadingCount:", 0);
                objc_msgSend(WeakRetained, "setLastFailedArtworkIdentifier:", 0);
                objc_msgSend(v8, "visualIdenticalityIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "setLastVendedArtworkIdentifier:", v44);

                objc_msgSend(WeakRetained, "setLastVendedScaledFittingSize:", v17, v19);
                objc_msgSend(WeakRetained, "imageHandler");
                v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v28, 0);
                goto LABEL_35;
              }
              MCLogCategoryImageLoading();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                v39 = objc_opt_class();
                v45 = 138412546;
                v46 = v39;
                v47 = 2048;
                v48 = WeakRetained;
                _os_log_impl(&dword_1AA991000, v38, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Failed to format image. Will use original.", (uint8_t *)&v45, 0x16u);
              }

            }
            v28 = v6;
            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "verboseImageLoadingLogging");

          if (v24)
          {
            MCLogCategoryImageLoading();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = objc_opt_class();
              v47 = 2048;
              v48 = WeakRetained;
              v49 = 2112;
              v50 = v6;
              _os_log_impl(&dword_1AA991000, v25, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> skip caching for image that is already cached in catalog: %@.", (uint8_t *)&v45, 0x20u);
            }

          }
        }
        v35 = 0;
        goto LABEL_24;
      }
      objc_msgSend(WeakRetained, "setLastVendedArtworkIdentifier:", 0);
      objc_msgSend(v8, "visualIdenticalityIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLastFailedArtworkIdentifier:", v32);

      objc_msgSend(WeakRetained, "setState:", 4);
      MCLogCategoryImageLoading();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v45 = 138412802;
        v46 = objc_opt_class();
        v47 = 2048;
        v48 = WeakRetained;
        v49 = 2048;
        v50 = v8;
        _os_log_impl(&dword_1AA991000, v33, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Disassociating catalog %p due to oversized artwork.", (uint8_t *)&v45, 0x20u);
      }

      objc_msgSend(v5, "clearArtworkCatalogs");
      objc_msgSend(WeakRetained, "imageHandler");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = CFSTR("Image exceeds max allowed size.");
      v31 = 200;
    }
    else
    {
      objc_msgSend(WeakRetained, "setLastVendedArtworkIdentifier:", 0);
      objc_msgSend(v8, "visualIdenticalityIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLastFailedArtworkIdentifier:", v26);

      objc_msgSend(WeakRetained, "setState:", 3);
      objc_msgSend(WeakRetained, "setFailedLoadingCount:", objc_msgSend(WeakRetained, "failedLoadingCount") + 1);
      if (objc_msgSend(WeakRetained, "failedLoadingCount") >= 3)
      {
        MCLogCategoryImageLoading();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v45 = 138412802;
          v46 = objc_opt_class();
          v47 = 2048;
          v48 = WeakRetained;
          v49 = 2048;
          v50 = v8;
          _os_log_impl(&dword_1AA991000, v27, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Disassociating catalog %p due to repeated failures.", (uint8_t *)&v45, 0x20u);
        }

        objc_msgSend(v5, "clearArtworkCatalogs");
      }
      objc_msgSend(WeakRetained, "imageHandler");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = CFSTR("Catalog returned nil image.");
      v31 = 100;
    }
    objc_msgSend(v29, "msv_errorWithDomain:code:debugDescription:", CFSTR("MRUImageLoaderError"), v31, v30);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v28 + 2))(v28, 0, v34);
LABEL_35:

  }
}

- (void)withNoEscapeCheck:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[MRUImageLoader setRunningSynchronously:](self, "setRunningSynchronously:", 1);
  v4[2](v4);

  -[MRUImageLoader setRunningSynchronously:](self, "setRunningSynchronously:", 0);
}

- (UIView)destination
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_destination);
}

- (id)imageHandler
{
  return self->_imageHandler;
}

- (BOOL)cacheImages
{
  return self->_cacheImages;
}

- (void)setCacheImages:(BOOL)a3
{
  self->_cacheImages = a3;
}

- (BOOL)formatImages
{
  return self->_formatImages;
}

- (void)setFormatImages:(BOOL)a3
{
  self->_formatImages = a3;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_catalog, a3);
}

- (MPArtworkDataSourceVisualIdenticality)lastVendedArtworkIdentifier
{
  return self->_lastVendedArtworkIdentifier;
}

- (CGSize)targetFittingSizeForCurrentCatalogConfiguration
{
  double width;
  double height;
  CGSize result;

  width = self->_targetFittingSizeForCurrentCatalogConfiguration.width;
  height = self->_targetFittingSizeForCurrentCatalogConfiguration.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetFittingSizeForCurrentCatalogConfiguration:(CGSize)a3
{
  self->_targetFittingSizeForCurrentCatalogConfiguration = a3;
}

- (CGSize)lastVendedScaledFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastVendedScaledFittingSize.width;
  height = self->_lastVendedScaledFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastVendedScaledFittingSize:(CGSize)a3
{
  self->_lastVendedScaledFittingSize = a3;
}

- (MPArtworkDataSourceVisualIdenticality)lastFailedArtworkIdentifier
{
  return self->_lastFailedArtworkIdentifier;
}

- (void)setLastFailedArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastFailedArtworkIdentifier, a3);
}

- (int64_t)failedLoadingCount
{
  return self->_failedLoadingCount;
}

- (void)setFailedLoadingCount:(int64_t)a3
{
  self->_failedLoadingCount = a3;
}

- (CGSize)fittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fittingSize.width;
  height = self->_fittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFittingSize:(CGSize)a3
{
  self->_fittingSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)deferredFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_deferredFittingSize.width;
  height = self->_deferredFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDeferredFittingSize:(CGSize)a3
{
  self->_deferredFittingSize = a3;
}

- (double)deferredScale
{
  return self->_deferredScale;
}

- (void)setDeferredScale:(double)a3
{
  self->_deferredScale = a3;
}

- (BOOL)fittingSizeUpdateScheduled
{
  return self->_fittingSizeUpdateScheduled;
}

- (void)setFittingSizeUpdateScheduled:(BOOL)a3
{
  self->_fittingSizeUpdateScheduled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)runningSynchronously
{
  return self->_runningSynchronously;
}

- (void)setRunningSynchronously:(BOOL)a3
{
  self->_runningSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailedArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_lastVendedArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong(&self->_imageHandler, 0);
  objc_destroyWeak((id *)&self->_destination);
}

@end
