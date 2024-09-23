@implementation HFWallpaperManager

void __36__HFWallpaperManager_sharedInstance__block_invoke()
{
  HFWallpaperManager *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp"))
  {
    v0 = objc_alloc_init(HFWallpaperManager);
    v1 = (void *)_MergedGlobals_317;
    _MergedGlobals_317 = (uint64_t)v0;

  }
  else
  {
    HFLogForCategory(0x47uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v6 = objc_msgSend(v4, "hostProcess");
      _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "HFWallpaperManager shouldn't ever be created or used outside of Home App currentProcess:%ld", buf, 0xCu);

    }
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("HFWallpaperManager shouldn't ever be created or used outside of Home App currentProcess:%ld"), objc_msgSend(v3, "hostProcess"));

  }
}

- (HFWallpaperManager)init
{
  HFWallpaperManager *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  HFReaderWriterCache *v5;
  HFReaderWriterCache *wallpapersCache;
  HFWallpaperImageCache *v7;
  uint64_t v8;
  HFWallpaperImageCache *imageCache;
  HFWallpaperFileManager *v10;
  HFWallpaperFileManager *fileManager;
  HFWallpaperLegacyFileManager *v12;
  HFWallpaperLegacyFileManager *legacyFileManager;
  HFWallpaperManager *v14;
  objc_super v16;
  _QWORD block[4];
  HFWallpaperManager *v18;

  v16.receiver = self;
  v16.super_class = (Class)HFWallpaperManager;
  v2 = -[HFWallpaperManager init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Home.wallpaper"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    v5 = objc_alloc_init(HFReaderWriterCache);
    wallpapersCache = v2->_wallpapersCache;
    v2->_wallpapersCache = v5;

    v7 = [HFWallpaperImageCache alloc];
    v8 = -[HFWallpaperImageCache initWithIdentifier:](v7, "initWithIdentifier:", HFWallpaperImageCacheIdentifier);
    imageCache = v2->_imageCache;
    v2->_imageCache = (HFWallpaperImageCache *)v8;

    v10 = objc_alloc_init(HFWallpaperFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v10;

    v12 = objc_alloc_init(HFWallpaperLegacyFileManager);
    legacyFileManager = v2->_legacyFileManager;
    v2->_legacyFileManager = v12;

    v14 = v2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __HFWallpaperManagerRegisterWithDispatcher_block_invoke;
    block[3] = &unk_1EA727DD8;
    v18 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v2;
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  void *v4;
  id v5;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFWallpaperManager _migrateToSunriseWallpaperIfNeeded](self, "_migrateToSunriseWallpaperIfNeeded");
    -[HFWallpaperManager _preloadWallpaperForHomeKitObject:](self, "_preloadWallpaperForHomeKitObject:", v5);
  }

}

- (id)wallpaperImageForWallpaper:(id)a3 variant:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  if (a4)
  {
    -[HFWallpaperManager imageCache](self, "imageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HFWallpaperManager_wallpaperImageForWallpaper_variant___block_invoke;
    v10[3] = &unk_1EA73EB40;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v7, "imageForVariant:wallpaper:withOriginalImageGenerator:", a4, v11, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFWallpaperManager _originalImageForWallpaper:forProcessingGenerator:](self, "_originalImageForWallpaper:forProcessingGenerator:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)registerWallpaperSource:(id)a3 processedSource:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[HFWallpaperManager setNamedWallpaperSource:](self, "setNamedWallpaperSource:", a3);
  -[HFWallpaperManager imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProcessedWallpaperSource:", v6);

  self->_wallpaperSourceRegistered = a3 != 0;
  -[HFWallpaperManager _migrateIfNeeded](self, "_migrateIfNeeded");
  -[HFWallpaperManager _migrateToSunriseWallpaperIfNeeded](self, "_migrateToSunriseWallpaperIfNeeded");
}

- (HFWallpaperImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setNamedWallpaperSource:(id)a3
{
  objc_storeStrong((id *)&self->_namedWallpaperSource, a3);
}

void __38__HFWallpaperManager__migrateIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("Version"));

  HFLogForCategory(0x47uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v10 = 2;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Wallpaper cache up-to-date (v%ld)", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Migrating wallpaper cache...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "legacyFileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__HFWallpaperManager__migrateIfNeeded__block_invoke_27;
    v8[3] = &unk_1EA73EB68;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "migrateCache:", v8);

    HFLogForCategory(0x47uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Wallpaper cache migration complete", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "userDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setInteger:forKey:](v4, "setInteger:forKey:", 2, CFSTR("Version"));
  }

}

void __64__HFWallpaperManager__wallpaperForHomeKitObject_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFWallpaper *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    goto LABEL_16;
  objc_msgSend(*(id *)(a1 + 40), "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "fileManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "originalImageExistsForWallpaper:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    if ((v15 & 1) != 0)
      goto LABEL_14;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      HFLogForCategory(0x47uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v46 = 138412290;
        v47 = v17;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Unable to locate original image for wallpaper %@", (uint8_t *)&v46, 0xCu);
      }
    }
    else
    {
LABEL_10:
      HFLogForCategory(0x47uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "UUIDString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412546;
        v47 = v45;
        v48 = 2112;
        v49 = v10;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Failed to create wallpaper for HomeKit identifier %@ from dict %@", (uint8_t *)&v46, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 40), "userDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObjectForKey:", v25);

    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(NSObject **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = 0;
  }
  else
  {
    HFLogForCategory(0x47uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "userDefaults");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138412546;
      v47 = v20;
      v48 = 2112;
      v49 = v22;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "No content in user default for HomeKit identifier %@. \nCurrent Content of user default %@", (uint8_t *)&v46, 0x16u);

    }
  }

LABEL_14:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && *(_BYTE *)(a1 + 56))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "defaultWallpaperForCollectionType:", (objc_opt_isKindOfClass() & 1) == 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    HFLogForCategory(0x47uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v34 = *(void **)(a1 + 32);
      v46 = 138412546;
      v47 = v33;
      v48 = 2112;
      v49 = v34;
      _os_log_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEFAULT, "Using default wallpaper \"%@\" for HomeKit object %@", (uint8_t *)&v46, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "userDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v36, v38);

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "type") != 1
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "type") != 6)
    {
      objc_msgSend(*(id *)(a1 + 40), "namedWallpaperSource");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "imageForWallpaper:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = *(void **)(a1 + 40);
      v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "_setImageCacheForWallpaper:image:forHomeKitIdentifier:", v42, v40, v43);

    }
    objc_msgSend(*(id *)(a1 + 40), "_dispatchWallpaperChangedforHomeKitObject:", *(_QWORD *)(a1 + 32));
    if (!+[HFUtilities isAMac](HFUtilities, "isAMac"))
      objc_msgSend(*(id *)(a1 + 40), "_pruneUnusedWallpapers");
  }
  v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v27, v28);

LABEL_16:
}

- (void)_migrateToSunriseWallpaperIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  -[HFWallpaperManager userDefaults](self, "userDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLForKey:", CFSTR("hasUpdatedToSunrise")))
  {

  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "homes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke;
      v12[3] = &unk_1EA73EBB8;
      v12[4] = self;
      objc_msgSend(v9, "na_each:", v12);

      -[HFWallpaperManager userDefaults](self, "userDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBool:forKey:", 1, CFSTR("hasUpdatedToSunrise"));

    }
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HFWallpaperFileManager)fileManager
{
  return self->_fileManager;
}

- (id)wallpaperObjectForWallpaper:(id)a3 currentUserInterfaceStyle:(int64_t)a4
{
  return -[HFWallpaperManager wallpaperImageForWallpaper:variant:](self, "wallpaperImageForWallpaper:variant:", a3, 1);
}

+ (id)sharedInstance
{
  if (qword_1ED379D70 != -1)
    dispatch_once(&qword_1ED379D70, &__block_literal_global_216);
  return (id)_MergedGlobals_317;
}

- (void)preheatCache
{
  void *v3;
  void *v4;
  id v5;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    -[HFWallpaperManager _preloadWallpaperForHomeKitObject:](self, "_preloadWallpaperForHomeKitObject:", v5);
    v4 = v5;
  }

}

void __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[6];
  _QWORD block[6];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cachedWallpaperForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_2;
    block[3] = &unk_1EA727188;
    block[4] = a1[6];
    v5 = v4;
    block[5] = v5;
    v6 = (id *)block;
  }
  else
  {
    HFLogForCategory(0x47uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Loading wallpaper for HomeKit object %@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "_wallpaperForHomeKitObject:createIfNeeded:", a1[5], 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      NSLog(CFSTR("Failed to load wallpaper for HomeKit object %@"), a1[5]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_22;
    v10[3] = &unk_1EA727188;
    v10[4] = a1[6];
    v5 = v9;
    v10[5] = v5;
    v6 = (id *)v10;
  }
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)_cachedWallpaperForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFWallpaperManager wallpapersCache](self, "wallpapersCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__HFWallpaperManager__preloadWallpaperForHomeKitObject___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x47uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Preloading wallpaper slices for key: %@", (uint8_t *)&v5, 0xCu);

  }
  return (id)objc_msgSend(*(id *)(a1 + 40), "wallpaperForHomeKitObject:", *(_QWORD *)(a1 + 32));
}

- (id)_wallpaperForHomeKitObject:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HFWallpaperManager *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  -[HFWallpaperManager wallpapersCache](self, "wallpapersCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tryObjectForKey:", v8);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)v19[5];
  if (!v9)
  {
    -[HFWallpaperManager wallpapersCache](self, "wallpapersCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__HFWallpaperManager__wallpaperForHomeKitObject_createIfNeeded___block_invoke;
    v13[3] = &unk_1EA73EC30;
    v16 = &v18;
    v14 = v6;
    v15 = self;
    v17 = a4;
    objc_msgSend(v10, "performBlockWithWriteLock:", v13);

    v9 = (void *)v19[5];
  }
  v11 = v9;
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)wallpaperForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  -[HFWallpaperManager wallpapersCache](self, "wallpapersCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tryObjectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v10 = (void *)MEMORY[0x1E0CB34C8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke;
    v16[3] = &unk_1EA7270A0;
    v16[4] = self;
    v17 = v4;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v10, "blockOperationWithBlock:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQueuePriority:", 4);
    objc_msgSend(v12, "setQualityOfService:", 33);
    objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "performOperation:", v12);

    v8 = v11;
  }

  return v8;
}

- (HFReaderWriterCache)wallpapersCache
{
  return self->_wallpapersCache;
}

- (void)_migrateIfNeeded
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HFWallpaperManager__migrateIfNeeded__block_invoke;
  v5[3] = &unk_1EA727DD8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueuePriority:", 4);
  objc_msgSend(v2, "setQualityOfService:", 17);
  objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "performOperation:", v2);

}

- (void)_preloadWallpaperForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  HFWallpaperManager *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__HFWallpaperManager__preloadWallpaperForHomeKitObject___block_invoke;
  v13 = &unk_1EA727188;
  v14 = v4;
  v15 = self;
  v6 = v4;
  objc_msgSend(v5, "blockOperationWithBlock:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueuePriority:", -4, v10, v11, v12, v13);
  objc_msgSend(v7, "setQualityOfService:", 33);
  objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "performOperation:", v7);

}

- (id)defaultUserSelectableWallpaperForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HFWallpaperManager _wallpaperForHomeKitObject:createIfNeeded:](self, "_wallpaperForHomeKitObject:createIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_opt_class();
    -[HFWallpaperManager defaultUserSelectableWallpaperForWallpaperCollectionType:](self, "defaultUserSelectableWallpaperForWallpaperCollectionType:", (objc_opt_isKindOfClass() & 1) == 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)defaultUserSelectableWallpaperForWallpaperCollectionType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWallpaperForCollection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__HFWallpaperManager_wallpaperImageForWallpaper_variant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_originalImageForWallpaper:forProcessingGenerator:", *(_QWORD *)(a1 + 40), 1);
}

- (id)generateProcessedImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v7 && v8 == 6)
  {
    -[HFWallpaperManager imageCache](self, "imageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processedWallpaperSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateFilteredImageForWallpaper:image:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  -[HFWallpaperManager imageCache](self, "imageCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processedWallpaperSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processedImageForVariant:wallpaper:image:", 1, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)processOriginalImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v7 && v8 == 1)
  {
    -[HFWallpaperManager imageCache](self, "imageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processedWallpaperSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateFilteredImageForWallpaper:image:", v6, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)processOriginalBlurredImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  v9 = 0;
  if (v7 && v8 == 6)
  {
    -[HFWallpaperManager imageCache](self, "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processedWallpaperSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generateFilteredImageForWallpaper:image:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)allNamedWallpapersForWallpaperCollectionType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Must register named wallpaper source before use!"));
  -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allWallpapersForCollection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allNamedWallpaperThumbnailsForWallpaperCollectionType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Must register named wallpaper source before use!"));
  -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allWallpaperThumbnailsForCollection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __38__HFWallpaperManager__migrateIfNeeded__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWallpaper:image:forHomeKitIdentifier:", a3, a4, a2);
}

void __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_migrateWallpaperDict:forHomeKitIdentifier:", v6, v8);
  objc_msgSend(v3, "hf_allRooms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke_2;
  v9[3] = &unk_1EA73EB90;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "na_each:", v9);

}

void __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_migrateWallpaperDict:forHomeKitIdentifier:", v5, v6);
}

- (void)_migrateWallpaperDict:(id)a3 forHomeKitIdentifier:(id)a4
{
  id v6;
  id v7;
  HFWallpaper *v8;
  NSObject *v9;
  void *v10;
  int v11;
  HFWallpaper *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v7);

    if (!-[HFWallpaper isCustomType](v8, "isCustomType"))
    {
      HFLogForCategory(0x47uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Remove old default wallpaper: %@ for homeKitIdentifier: %@", (uint8_t *)&v11, 0x16u);
      }

      -[HFWallpaperManager userDefaults](self, "userDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v6);

    }
  }

}

- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  HFWallpaperManager *v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB34C8];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __59__HFWallpaperManager__setWallpaper_image_forHomeKitObject___block_invoke;
  v21 = &unk_1EA7271B0;
  v22 = self;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "blockOperationWithBlock:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setQueuePriority:", 4, v18, v19, v20, v21, v22);
  objc_msgSend(v15, "setQualityOfService:", 17);
  objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "performOperation:", v15);

}

uint64_t __59__HFWallpaperManager__setWallpaper_image_forHomeKitObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setWallpaper:image:forHomeKitIdentifier:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_dispatchWallpaperChangedforHomeKitObject:", *(_QWORD *)(a1 + 56));
  result = +[HFUtilities isAMac](HFUtilities, "isAMac");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_pruneUnusedWallpapers");
  return result;
}

- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[HFWallpaperManager _setWallpaper:forHomeKitIdentifier:](self, "_setWallpaper:forHomeKitIdentifier:", v10, v9);
  if (v8)
    -[HFWallpaperManager _setImageCacheForWallpaper:image:forHomeKitIdentifier:](self, "_setImageCacheForWallpaper:image:forHomeKitIdentifier:", v10, v8, v9);

}

- (void)_setWallpaper:(id)a3 forHomeKitIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x47uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Setting wallpaper %@ for HomeKit object %@", (uint8_t *)&v13, 0x16u);
  }

  -[HFWallpaperManager wallpapersCache](self, "wallpapersCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, v7);

  -[HFWallpaperManager userDefaults](self, "userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

  -[HFWallpaperManager _logUserMetricsAfterSettingWallpaper](self, "_logUserMetricsAfterSettingWallpaper");
}

- (void)_setImageCacheForWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  -[HFWallpaperManager imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveVariantsForWallpaper:originalImage:", v7, v8);

  v10 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__HFWallpaperManager__setImageCacheForWallpaper_image_forHomeKitIdentifier___block_invoke;
  v16[3] = &unk_1EA7270A0;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "blockOperationWithBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueuePriority:", 0);
  objc_msgSend(v13, "setQualityOfService:", 17);
  objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "performOperation:", v13);

}

void __76__HFWallpaperManager__setImageCacheForWallpaper_image_forHomeKitIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveOriginalImage:forWallpaper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_logUserMetricsAfterSettingWallpaper
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFWallpaperManager userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.Home.wallpaper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HFWallpaperManager__logUserMetricsAfterSettingWallpaper__block_invoke;
  v7[3] = &unk_1EA73EBE0;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v16[0] = CFSTR("NamedWallpaperCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("CustomWallpaperCount");
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 32, v6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void __58__HFWallpaperManager__logUserMetricsAfterSettingWallpaper__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  HFWallpaper *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  v10 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v10;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v6);
    v8 = -[HFWallpaper type](v7, "type");
    if (v8 <= 6)
    {
      if (((1 << v8) & 0x3D) != 0)
        v9 = *(_QWORD *)(a1 + 32);
      else
        v9 = *(_QWORD *)(a1 + 40);
      ++*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24);
    }

  }
}

- (void)_dispatchWallpaperChangedforHomeKitObject:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke;
  block[3] = &unk_1EA727DD8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id *v4;
  id v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(id *)(a1 + 32);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_2;
    v13[3] = &unk_1EA726918;
    v4 = &v14;
    v14 = v2;
    v5 = v2;
    v6 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    v7 = *(id *)(a1 + 32);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_3;
    v11 = &unk_1EA726918;
    v4 = &v12;
    v12 = v7;
    v5 = v7;
    v6 = &v8;
  }
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v6, 0, v8, v9, v10, v11);

}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidUpdateWallpaper:", *(_QWORD *)(a1 + 32));

}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateWallpaperForRoom:", v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)_pruneUnusedWallpapers
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHomesFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke;
  v6[3] = &unk_1EA730B78;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a2;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_2;
  v15[3] = &unk_1EA73EBB8;
  v7 = v5;
  v16 = v7;
  objc_msgSend(v4, "na_each:", v15);

  v8 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_4;
  v13[3] = &unk_1EA727188;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "blockOperationWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueuePriority:", -8);
  objc_msgSend(v10, "setQualityOfService:", 9);
  objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "performOperation:", v10);

}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v4, "hf_allRooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_3;
  v9[3] = &unk_1EA73EB90;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_each:", v9);

}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "addObject:", v4);

}

uint64_t __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HFLogForCategory(0x47uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Pruning unused wallpapers...", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_pruneUnusedWallpapersWithExistingHomeKitIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (void)_pruneUnusedWallpapersWithExistingHomeKitIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  HFWallpaperManager *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperManager userDefaults](self, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.Home.wallpaper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke;
  v12[3] = &unk_1EA73EC08;
  v13 = v4;
  v14 = v5;
  v15 = self;
  v8 = v5;
  v11 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[HFWallpaperManager fileManager](self, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pruneUnusedOriginalWallpaperImages:", v8);

  -[HFWallpaperManager imageCache](self, "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pruneUnusedWallpaperVariants:", v8);

}

void __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  HFWallpaper *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  if (v7)
  {
    if (objc_msgSend(a1[4], "containsObject:", v5))
    {
      objc_opt_class();
      v8 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        v11 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v10);
        objc_msgSend(a1[5], "na_safeAddObject:", v11);

      }
    }
    else
    {
      objc_msgSend(a1[6], "wallpapersCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(a1[6], "wallpapersCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke_2;
        v17[3] = &unk_1EA736940;
        v18 = v7;
        v15 = v5;
        v16 = a1[6];
        v19 = v15;
        v20 = v16;
        objc_msgSend(v14, "performBlockWithWriteLock:", v17);

      }
    }
  }

}

void __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x47uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Pruning wallpaper data for unknown HomeKit identifier %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (id)_originalImageForWallpaper:(id)a3 forProcessingGenerator:(BOOL)a4
{
  id v6;
  void *v7;
  HFWallpaper *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;

  v6 = a3;
  v7 = v6;
  if (!a4 && objc_msgSend(v6, "type") == 6)
  {
    v8 = [HFWallpaper alloc];
    objc_msgSend(v7, "assetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cropInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFWallpaper initWithType:assetIdentifier:cropInfo:](v8, "initWithType:assetIdentifier:cropInfo:", 1, v9, v10);

    v7 = (void *)v11;
  }
  -[HFWallpaperManager fileManager](self, "fileManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "originalImageExistsForWallpaper:", v7);

  if (v13)
  {
    -[HFWallpaperManager fileManager](self, "fileManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "originalImageForWallpaper:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (!objc_msgSend(v7, "type")
         || objc_msgSend(v7, "type") == 2
         || objc_msgSend(v7, "type") == 3
         || objc_msgSend(v7, "type") == 4
         || objc_msgSend(v7, "type") == 5)
  {
    -[HFWallpaperManager namedWallpaperSource](self, "namedWallpaperSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageForWallpaper:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "assetIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsString:", CFSTR("_Thumbnail"));

    if ((v18 & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB34C8];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __72__HFWallpaperManager__originalImageForWallpaper_forProcessingGenerator___block_invoke;
      v24[3] = &unk_1EA7270A0;
      v24[4] = self;
      v15 = v15;
      v25 = v15;
      v26 = v7;
      objc_msgSend(v19, "blockOperationWithBlock:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setQueuePriority:", 4);
      objc_msgSend(v20, "setQualityOfService:", 17);
      objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v21, "performOperation:", v20);

    }
  }
  else
  {
    NSLog(CFSTR("Unable to load original wallpaper image for custom wallpaper %@"), v7);
    v15 = 0;
  }

  return v15;
}

void __72__HFWallpaperManager__originalImageForWallpaper_forProcessingGenerator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveOriginalImage:forWallpaper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)wallpaperSourceRegistered
{
  return self->_wallpaperSourceRegistered;
}

- (void)setWallpapersCache:(id)a3
{
  objc_storeStrong((id *)&self->_wallpapersCache, a3);
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (HFNamedWallpaperSource)namedWallpaperSource
{
  return self->_namedWallpaperSource;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (HFWallpaperLegacyFileManager)legacyFileManager
{
  return self->_legacyFileManager;
}

- (void)setLegacyFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_legacyFileManager, a3);
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_legacyFileManager, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_namedWallpaperSource, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_wallpapersCache, 0);
}

@end
