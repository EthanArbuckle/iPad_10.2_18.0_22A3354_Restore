@implementation HFWallpaperImageCache

- (HFWallpaperImageCache)initWithIdentifier:(id)a3
{
  id v4;
  HFWallpaperImageCache *v5;
  uint64_t v6;
  BSUIMappedImageCache *imageCache;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFWallpaperImageCache;
  v5 = -[HFWallpaperImageCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", v4);
    imageCache = v5->_imageCache;
    v5->_imageCache = (BSUIMappedImageCache *)v6;

  }
  return v5;
}

- (void)setProcessedWallpaperSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)imageForVariant:(int64_t)a3 wallpaper:(id)a4 withOriginalImageGenerator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "type") == 4)
  {
    -[HFWallpaperImageCache _cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:](self, "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", v8, a3, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperImageCache _cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:](self, "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", v8, a3, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke;
    v24[3] = &unk_1EA73CD10;
    v13 = v9;
    v25 = v13;
    -[HFWallpaperImageCache _imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:](self, "_imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:", a3, v8, v10, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v20 = 3221225472;
    v21 = __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke_2;
    v22 = &unk_1EA73CD10;
    v23 = v13;
    -[HFWallpaperImageCache _imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:](self, "_imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:", a3, v8, v11, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageAsset", v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerImage:withTraitCollection:", v15, v17);

  }
  else
  {
    if (objc_msgSend(v8, "type") == 6)
      -[HFWallpaperImageCache _cacheKeyForCustomBlurWallpaper:withVariant:](self, "_cacheKeyForCustomBlurWallpaper:withVariant:", v8, a3);
    else
      -[HFWallpaperImageCache _cacheKeyForWallpaper:withVariant:](self, "_cacheKeyForWallpaper:withVariant:", v8, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperImageCache _imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:](self, "_imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:", a3, v8, v10, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_imageForVariant:(int64_t)a3 wallpaper:(id)a4 imageKey:(id)a5 withOriginalImageGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  HFWallpaperImageCache *v23;
  id v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    NSLog(CFSTR("Must register processed wallpaper source before use!"));
  HFLogForCategory(0x47uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHFWallpaperVariant(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Retrieving cached \"%@\" image from wallpaper %@", buf, 0x16u);

  }
  -[HFWallpaperImageCache imageCache](self, "imageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__HFWallpaperImageCache__imageForVariant_wallpaper_imageKey_withOriginalImageGenerator___block_invoke;
  v21[3] = &unk_1EA73CD38;
  v22 = v10;
  v23 = self;
  v24 = v11;
  v25 = a3;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v16, "imageForKey:generatingIfNecessaryWithBlock:", v12, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BSUIMappedImageCache)imageCache
{
  return self->_imageCache;
}

- (id)_cacheKeyForWallpaper:(id)a3 withVariant:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "sliceIdentifierForVariant:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_v%ld"), v6, objc_msgSend(v7, "processVersionNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFProcessedWallpaperSource)processedWallpaperSource
{
  return (HFProcessedWallpaperSource *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)supportedProcessedVariants
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedVariants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

id __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __88__HFWallpaperImageCache__imageForVariant_wallpaper_imageKey_withOriginalImageGenerator___block_invoke(uint64_t a1, _QWORD *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *a2 = 4 * (objc_msgSend(*(id *)(a1 + 32), "type") != 2);
  HFLogForCategory(0x47uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHFWallpaperVariant(*(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Recreating evicted \"%@\" slice from wallpaper %@", buf, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v6 - 2) >= 3)
  {
    if (v6 != 1)
    {
      NSLog(CFSTR("Unexpected wallpaper variant %ld"), *(_QWORD *)(a1 + 56));
      return 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "processedWallpaperSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processedImageForVariant:wallpaper:image:", v11, v10, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "imageForVariant:wallpaper:withOriginalImageGenerator:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "processedWallpaperSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processedImageForVariant:wallpaper:image:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)saveVariantsForWallpaper:(id)a3 originalImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  HFWallpaperImageCache *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HFWallpaper *v23;
  void *v24;
  void *v25;
  HFWallpaper *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("Must register processed wallpaper source before use!"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportedVariants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v34)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(obj);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v11), "unsignedIntegerValue");
        if (objc_msgSend(v6, "type") == 4)
        {
          -[HFWallpaperImageCache _cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:](self, "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", v6, v12, 1);
          v31 = objc_claimAutoreleasedReturnValue();
          -[HFWallpaperImageCache _cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:](self, "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", v6, v12, 2);
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "imageAsset");
          v13 = v6;
          v14 = self;
          v15 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "imageWithTraitCollection:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "imageAsset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "imageWithTraitCollection:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v15;
          self = v14;
          v6 = v13;
          v22 = (void *)v31;

          -[HFWallpaperImageCache _saveVariants:forWallpaper:originalImage:withImageKey:](self, "_saveVariants:forWallpaper:originalImage:withImageKey:", v12, v6, v18, v31);
          v23 = (HFWallpaper *)v32;
          -[HFWallpaperImageCache _saveVariants:forWallpaper:originalImage:withImageKey:](self, "_saveVariants:forWallpaper:originalImage:withImageKey:", v12, v6, v21, v32);

LABEL_12:
          goto LABEL_14;
        }
        if (objc_msgSend(v6, "type") == 6)
        {
          -[HFWallpaperImageCache processedWallpaperSource](self, "processedWallpaperSource");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "generateFilteredImageForWallpaper:image:", v6, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[HFWallpaperImageCache _cacheKeyForCustomBlurWallpaper:withVariant:](self, "_cacheKeyForCustomBlurWallpaper:withVariant:", v6, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFWallpaperImageCache _saveVariants:forWallpaper:originalImage:withImageKey:](self, "_saveVariants:forWallpaper:originalImage:withImageKey:", v12, v6, v22, v25);

          v26 = [HFWallpaper alloc];
          objc_msgSend(v6, "assetIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "cropInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[HFWallpaper initWithType:assetIdentifier:cropInfo:](v26, "initWithType:assetIdentifier:cropInfo:", 1, v27, v28);

          -[HFWallpaperImageCache _cacheKeyForWallpaper:withVariant:](self, "_cacheKeyForWallpaper:withVariant:", v23, v12);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFWallpaperImageCache _saveVariants:forWallpaper:originalImage:withImageKey:](self, "_saveVariants:forWallpaper:originalImage:withImageKey:", v12, v23, v33, v29);

          goto LABEL_12;
        }
        -[HFWallpaperImageCache _cacheKeyForWallpaper:withVariant:](self, "_cacheKeyForWallpaper:withVariant:", v6, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFWallpaperImageCache _saveVariants:forWallpaper:originalImage:withImageKey:](self, "_saveVariants:forWallpaper:originalImage:withImageKey:", v12, v6, v33, v22);
LABEL_14:

        ++v11;
      }
      while (v34 != v11);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v34);
  }

}

- (void)_saveVariants:(int64_t)a3 forWallpaper:(id)a4 originalImage:(id)a5 withImageKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HFWallpaperImageCache__saveVariants_forWallpaper_originalImage_withImageKey___block_invoke;
  v13[3] = &unk_1EA73CD60;
  v14 = v10;
  v11 = v10;
  v12 = -[HFWallpaperImageCache _imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:](self, "_imageForVariant:wallpaper:imageKey:withOriginalImageGenerator:", a3, a4, a6, v13);

}

id __79__HFWallpaperImageCache__saveVariants_forWallpaper_originalImage_withImageKey___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)pruneUnusedWallpaperVariants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HFWallpaperImageCache *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[HFWallpaperImageCache imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke;
  v14[3] = &unk_1EA736588;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v4, "na_each:", v14);

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_3;
  v11[3] = &unk_1EA73C0C8;
  v12 = v8;
  v13 = self;
  v9 = v8;
  objc_msgSend(v10, "na_each:", v11);

}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "processedWallpaperSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_2;
  v9[3] = &unk_1EA73CD88;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "na_each:", v9);

}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(a1[4], "type") == 4)
  {
    objc_msgSend(a1[5], "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"), 2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(a1[4], "type");
    v7 = a1[4];
    v6 = a1[5];
    v8 = objc_msgSend(v10, "unsignedIntegerValue");
    if (v5 != 6)
    {
      objc_msgSend(v6, "_cacheKeyForWallpaper:withVariant:", v7, v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "na_safeAddObject:", v3);
      goto LABEL_7;
    }
    objc_msgSend(v6, "_cacheKeyForCustomBlurWallpaper:withVariant:", v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_cacheKeyForWallpaper:withVariant:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v4;
  objc_msgSend(a1[6], "na_safeAddObject:", v3);
  objc_msgSend(a1[6], "na_safeAddObject:", v9);

LABEL_7:
}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    HFLogForCategory(0x47uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Removed unused image variant at key %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeImageForKey:", v3);

  }
}

- (id)_cacheKeyForDefaultBlurWallpaper:(id)a3 withVariant:(int64_t)a4 forUserInterfaceStyle:(int64_t)a5
{
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[HFWallpaperImageCache _cacheKeyForWallpaper:withVariant:](self, "_cacheKeyForWallpaper:withVariant:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a5 == 1)
    v8 = CFSTR("_light");
  else
    v8 = CFSTR("_dark");
  objc_msgSend(v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_cacheKeyForCustomBlurWallpaper:(id)a3 withVariant:(int64_t)a4
{
  void *v4;
  void *v5;

  -[HFWallpaperImageCache _cacheKeyForWallpaper:withVariant:](self, "_cacheKeyForWallpaper:withVariant:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("_blur"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_processedWallpaperSource, 0);
}

@end
