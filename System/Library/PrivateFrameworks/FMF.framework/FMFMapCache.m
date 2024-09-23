@implementation FMFMapCache

- (FMFMapCache)init
{
  FMFMapCache *v2;
  double v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  dispatch_queue_t v19;
  dispatch_queue_t v20;
  dispatch_queue_t v21;
  dispatch_queue_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)FMFMapCache;
  v2 = -[FMFMapCache init](&v28, sel_init);
  if (v2)
  {
    v3 = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("lastPruneTimestamp"), CFSTR("com.apple.findmy"));
    -[FMFMapCache setFileProtectionDeactivated:](v2, "setFileProtectionDeactivated:", objc_msgSend(MEMORY[0x1E0D20200], "BOOLForKey:inDomain:", CFSTR("fileProtectionDisabled"), CFSTR("com.apple.findmy")));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapCache setLastPruneDate:](v2, "setLastPruneDate:", v4);

    LogCategory_FMFMapXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[FMFMapCache fileProtectionDeactivated](v2, "fileProtectionDeactivated");
      -[FMFMapCache lastPruneDate](v2, "lastPruneDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapCache: File protection deactivated? %i last prune date? %@", buf, 0x12u);

    }
    -[FMFMapCache setMapLocationDistanceThreshold:](v2, "setMapLocationDistanceThreshold:", 50.0);
    v8 = (void *)objc_opt_new();
    -[FMFMapCache setCacheMetaData:](v2, "setCacheMetaData:", v8);

    v9 = (void *)objc_opt_new();
    -[FMFMapCache setGridImageMetaData:](v2, "setGridImageMetaData:", v9);

    v10 = (void *)objc_opt_new();
    -[FMFMapCache setNoLocationImageMetaData:](v2, "setNoLocationImageMetaData:", v10);

    v11 = (void *)objc_opt_new();
    -[FMFMapCache setMapImageMetaData:](v2, "setMapImageMetaData:", v11);

    v12 = (void *)objc_opt_new();
    -[FMFMapCache setPendingMapImageMetaData:](v2, "setPendingMapImageMetaData:", v12);

    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.FMF.FMFMapXPCService"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("FMFMapCacheMeta.data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapCache setCachePath:](v2, "setCachePath:", v16);

    -[FMFMapCache setImageCachePath:](v2, "setImageCachePath:", v15);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.icloud.FMF.CacheMetaIO", v17);
    -[FMFMapCache setCacheMetaQueue:](v2, "setCacheMetaQueue:", v18);

    v19 = dispatch_queue_create("com.apple.icloud.FMF.GridImageIO", v17);
    -[FMFMapCache setGridImageQueue:](v2, "setGridImageQueue:", v19);

    v20 = dispatch_queue_create("com.apple.icloud.FMF.NoLocationImageIO", v17);
    -[FMFMapCache setNoLocationImageQueue:](v2, "setNoLocationImageQueue:", v20);

    v21 = dispatch_queue_create("com.apple.icloud.FMF.MapImageIO", v17);
    -[FMFMapCache setMapImageQueue:](v2, "setMapImageQueue:", v21);

    v22 = dispatch_queue_create("com.apple.icloud.FMF.PendingImageQueue", v17);
    -[FMFMapCache setPendingImageQueue:](v2, "setPendingImageQueue:", v22);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "fileExistsAtPath:", v15);

    if ((v24 & 1) == 0)
    {
      LogCategory_FMFMapXPC();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC81B000, v25, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Creating cache folder", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

    }
    -[FMFMapCache readMetaData](v2, "readMetaData");

  }
  return v2;
}

- (id)cachedGridImageForWidth:(double)a3 andHeight:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FMFMapCache gridKeyForWidth:andHeight:](self, "gridKeyForWidth:andHeight:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapCache gridImageMetaData](self, "gridImageMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LogCategory_FMFMapXPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cachedGridImageForWidth data retreived: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheGridImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5
{
  id v8;
  FMFMapCache *v9;
  NSObject *v10;
  id v11;
  FMFMapCache *v12;
  _QWORD block[4];
  FMFMapCache *v14;
  id v15;
  FMFMapCache *v16;
  double v17;
  double v18;

  v8 = a3;
  v9 = self;
  -[FMFMapCache gridImageQueue](v9, "gridImageQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke;
  block[3] = &unk_1EA4F2AB0;
  v17 = a4;
  v18 = a5;
  v14 = v9;
  v15 = v8;
  v16 = v9;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

}

void __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  FMFMapCacheImage *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "gridKeyForWidth:andHeight:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("png"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1EA4F34A0;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v2, "imageCachePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0CB2AD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "writeToFile:atomically:", v9, 1);
  LogCategory_FMFMapXPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheGridImage %@", buf, 0xCu);
  }

  if ((v11 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "fileProtectionDeactivated") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = 0,
          objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v10, v9, &v17),
          v14 = (FMFMapCacheImage *)v17,
          v13,
          !v14))
    {
      v14 = -[FMFMapCacheImage initWithPath:]([FMFMapCacheImage alloc], "initWithPath:", v9);
      objc_msgSend(v2, "gridImageMetaData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v14, v3);

      objc_msgSend(v2, "saveMetaData");
    }
    else
    {
      LogCategory_FMFMapXPC();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();

    }
  }
  else
  {
    LogCategory_FMFMapXPC();
    v14 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1DC81B000, &v14->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write grid image to disk %@", buf, 0xCu);
    }
  }

}

- (id)cachedNoLocationImageForWidth:(double)a3 andHeight:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FMFMapCache noLocationKeyForWidth:andHeight:](self, "noLocationKeyForWidth:andHeight:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapCache noLocationImageMetaData](self, "noLocationImageMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LogCategory_FMFMapXPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: noLocationImageForWidth data retreived: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheNoLocationImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5
{
  id v8;
  FMFMapCache *v9;
  NSObject *v10;
  id v11;
  FMFMapCache *v12;
  _QWORD block[4];
  FMFMapCache *v14;
  id v15;
  FMFMapCache *v16;
  double v17;
  double v18;

  v8 = a3;
  v9 = self;
  -[FMFMapCache noLocationImageQueue](v9, "noLocationImageQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FMFMapCache_cacheNoLocationImage_forWidth_andHeight___block_invoke;
  block[3] = &unk_1EA4F2AB0;
  v17 = a4;
  v18 = a5;
  v14 = v9;
  v15 = v8;
  v16 = v9;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

}

void __55__FMFMapCache_cacheNoLocationImage_forWidth_andHeight___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  FMFMapCacheImage *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "noLocationKeyForWidth:andHeight:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("png"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1EA4F34A0;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v2, "imageCachePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0CB2AD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "writeToFile:atomically:", v9, 1);
  LogCategory_FMFMapXPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheNoLocationImage %@", buf, 0xCu);
  }

  if ((v11 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "fileProtectionDeactivated") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = 0,
          objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v10, v9, &v17),
          v14 = (FMFMapCacheImage *)v17,
          v13,
          !v14))
    {
      v14 = -[FMFMapCacheImage initWithPath:]([FMFMapCacheImage alloc], "initWithPath:", v9);
      objc_msgSend(v2, "noLocationImageMetaData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v14, v3);

      objc_msgSend(v2, "saveMetaData");
    }
    else
    {
      LogCategory_FMFMapXPC();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();

    }
  }
  else
  {
    LogCategory_FMFMapXPC();
    v14 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1DC81B000, &v14->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write grid image to disk %@", buf, 0xCu);
    }
  }

}

- (id)cachedMapImageForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FMFMapCache mapImageMetaData](self, "mapImageMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LogCategory_FMFMapXPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cachedMapImageForRequest data retreived: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cachedMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7
{
  id v12;
  FMFMapImageRequest *v13;
  void *v14;

  v12 = a3;
  v13 = -[FMFMapImageRequest initWithLocation:altitude:pitch:width:height:andCachingEnabled:]([FMFMapImageRequest alloc], "initWithLocation:altitude:pitch:width:height:andCachingEnabled:", v12, 1, a4, a5, a6, a7);

  -[FMFMapCache cachedMapImageForRequest:](self, "cachedMapImageForRequest:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)cacheMapImage:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  FMFMapCache *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FMFMapCache mapImageQueue](self, "mapImageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FMFMapCache_cacheMapImage_forRequest___block_invoke;
  block[3] = &unk_1EA4F2B00;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __40__FMFMapCache_cacheMapImage_forRequest___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v14;
  FMFMapCacheImage *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[4], "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("png"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1EA4F34A0;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(WeakRetained, "imageCachePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0CB2AD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1[5], "writeToFile:atomically:", v9, 1);
  LogCategory_FMFMapXPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheMapImage %@", buf, 0xCu);
  }

  if ((v11 & 1) == 0)
  {
    LogCategory_FMFMapXPC();
    v15 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = 0;
      _os_log_impl(&dword_1DC81B000, &v15->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write map image to disk %@ %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(a1[6], "fileProtectionDeactivated") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = 0,
        objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v10, v9, &v23),
        v14 = v23,
        v13,
        !v14))
  {
    v15 = -[FMFMapCacheImage initWithPath:]([FMFMapCacheImage alloc], "initWithPath:", v9);
    objc_msgSend(WeakRetained, "mapImageMetaData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v3);

    objc_msgSend(WeakRetained, "saveMetaData");
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  LogCategory_FMFMapXPC();
  v15 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
    __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();
LABEL_14:

  objc_msgSend(WeakRetained, "pendingImageQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FMFMapCache_cacheMapImage_forRequest___block_invoke_44;
  block[3] = &unk_1EA4F2AD8;
  v21 = WeakRetained;
  v22 = v3;
  v18 = v3;
  v19 = WeakRetained;
  dispatch_sync(v17, block);

}

void __40__FMFMapCache_cacheMapImage_forRequest___block_invoke_44(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingMapImageMetaData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingMapImageMetaData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

- (void)cacheMapImage:(id)a3 forLocation:(id)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 andHeight:(double)a8
{
  id v14;
  id v15;
  FMFMapImageRequest *v16;

  v14 = a4;
  v15 = a3;
  v16 = -[FMFMapImageRequest initWithLocation:altitude:pitch:width:height:andCachingEnabled:]([FMFMapImageRequest alloc], "initWithLocation:altitude:pitch:width:height:andCachingEnabled:", v14, 1, a5, a6, a7, a8);

  -[FMFMapCache cacheMapImage:forRequest:](self, "cacheMapImage:forRequest:", v15, v16);
}

- (BOOL)pendingMapImageForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[FMFMapCache pendingImageQueue](self, "pendingImageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__FMFMapCache_pendingMapImageForRequest___block_invoke;
  v8[3] = &unk_1EA4F2B28;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v10 = &v12;
  v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  objc_destroyWeak(&v11);
  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&location);
  return (char)v5;
}

void __41__FMFMapCache_pendingMapImageForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("png"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1EA4F34A0;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(WeakRetained, "imageCachePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "pendingMapImageMetaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(WeakRetained, "pendingMapImageMetaData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v2);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)pendingMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7
{
  id v12;
  FMFMapImageRequest *v13;

  v12 = a3;
  v13 = -[FMFMapImageRequest initWithLocation:altitude:pitch:width:height:andCachingEnabled:]([FMFMapImageRequest alloc], "initWithLocation:altitude:pitch:width:height:andCachingEnabled:", v12, 1, a4, a5, a6, a7);

  LOBYTE(self) = -[FMFMapCache pendingMapImageForRequest:](self, "pendingMapImageForRequest:", v13);
  return (char)self;
}

- (void)readMetaData
{
  FMFMapCache *v2;
  NSObject *v3;
  FMFMapCache *v4;
  _QWORD block[4];
  FMFMapCache *v6;
  FMFMapCache *v7;

  v2 = self;
  -[FMFMapCache cacheMetaQueue](v2, "cacheMetaQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__FMFMapCache_readMetaData__block_invoke;
  block[3] = &unk_1EA4F2AD8;
  v6 = v2;
  v7 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

void __27__FMFMapCache_readMetaData__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v2, "cachePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v6, v10, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v33;

  if (v12)
  {
    LogCategory_FMFMapXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __27__FMFMapCache_readMetaData__block_invoke_cold_2((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
  LogCategory_FMFMapXPC();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __27__FMFMapCache_readMetaData__block_invoke_cold_1((uint64_t)v11, v20);

  objc_msgSend(v11, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") == 4)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("2"));

    if (v23)
    {
      objc_msgSend(v2, "setCacheMetaData:", v11);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("gridImage"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setGridImageMetaData:", v24);

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("noLocationImage"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setNoLocationImageMetaData:", v25);

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mapImage"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mapImage"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setMapImageMetaData:", v27);

      }
      LogCategory_FMFMapXPC();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "mapImageMetaData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134217984;
        v35 = v31;
        _os_log_impl(&dword_1DC81B000, v28, OS_LOG_TYPE_DEFAULT, "FMFMapCache: found entries in cache %ld", buf, 0xCu);

      }
      goto LABEL_18;
    }
  }
  else
  {

  }
  LogCategory_FMFMapXPC();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v32, OS_LOG_TYPE_DEFAULT, "FMFMapCache: flushing cache because of version mismatch", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "flushCache");
LABEL_18:
  objc_msgSend(*(id *)(a1 + 40), "pruneCacheIfNeeded");

}

- (void)saveMetaData
{
  FMFMapCache *v2;
  NSObject *v3;
  FMFMapCache *v4;
  _QWORD block[4];
  FMFMapCache *v6;
  FMFMapCache *v7;

  v2 = self;
  -[FMFMapCache cacheMetaQueue](v2, "cacheMetaQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__FMFMapCache_saveMetaData__block_invoke;
  block[3] = &unk_1EA4F2AD8;
  v6 = v2;
  v7 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

void __27__FMFMapCache_saveMetaData__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  id v29;
  id v30;
  uint8_t buf[4];
  _DWORD v32[7];

  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", CFSTR("2"), CFSTR("version"));
  objc_msgSend(v2, "gridImageMetaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("gridImage"));

  objc_msgSend(v2, "noLocationImageMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("noLocationImage"));

  objc_msgSend(v2, "mapImageMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mapImage"));

  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  if (v8)
  {
    v9 = v8;
    LogCategory_FMFMapXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __27__FMFMapCache_saveMetaData__block_invoke_cold_2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_19;
  }
  objc_msgSend(v2, "cachePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v7, "writeToFile:atomically:", v17, 1);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0CB2AD8]);
  v10 = objc_claimAutoreleasedReturnValue();
  LogCategory_FMFMapXPC();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "mapImageMetaData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v32 = v22;
    _os_log_impl(&dword_1DC81B000, v19, OS_LOG_TYPE_DEFAULT, "FMFMapCache: save map images %ld", buf, 0xCu);

  }
  if ((v18 & 1) == 0)
  {
    LogCategory_FMFMapXPC();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "cachePath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = v24;
      _os_log_impl(&dword_1DC81B000, v23, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write meta data to disk %@", buf, 0xCu);

    }
    v9 = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "fileProtectionDeactivated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachePath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v25, "setAttributes:ofItemAtPath:error:", v10, v26, &v29);
    v9 = v29;

    if (!v9)
      goto LABEL_16;
    LogCategory_FMFMapXPC();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __27__FMFMapCache_saveMetaData__block_invoke_cold_1((uint64_t)v9, v2, v23);
LABEL_15:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:
  LogCategory_FMFMapXPC();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(*(id *)(a1 + 40), "fileProtectionDeactivated");
    *(_DWORD *)buf = 67109376;
    v32[0] = v18;
    LOWORD(v32[1]) = 1024;
    *(_DWORD *)((char *)&v32[1] + 2) = v28;
    _os_log_impl(&dword_1DC81B000, v27, OS_LOG_TYPE_DEFAULT, "FMFMapCache: FMFMapCache: Save meta data? %d %i", buf, 0xEu);
  }

LABEL_19:
}

- (void)flushCache
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapCache imageCachePath](self, "imageCachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      LogCategory_FMFMapXPC();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFMapCache: clearing file", buf, 2u);
      }

      -[FMFMapCache imageCachePath](self, "imageCachePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v11 = objc_msgSend(v3, "removeItemAtPath:error:", v10, &v16);
      v12 = v16;
      v13 = v12;
      if ((v11 & 1) == 0 && v12)
      {
        LogCategory_FMFMapXPC();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v10;
          v19 = 2112;
          v20 = v13;
          _os_log_error_impl(&dword_1DC81B000, v14, OS_LOG_TYPE_ERROR, "FMFMapCache: error deleting file: %@ error: %@", buf, 0x16u);
        }

      }
      objc_msgSend(v5, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v15;
    }
    while (v15);
  }

}

- (void)pruneCacheIfNeeded
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  LogCategory_FMFMapXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "FMFMapCache: pruneCacheIfNeeded", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  -[FMFMapCache lastPruneDate](self, "lastPruneDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v6 - v8;
  -[FMFMapCache pruneIntervalInSeconds](self, "pruneIntervalInSeconds");
  v11 = v10;

  if (v9 > v11)
  {
    v38 = v4;
    LogCategory_FMFMapXPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: prunning cache....", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapCache mapImageMetaData](self, "mapImageMetaData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[FMFMapCache mapImageMetaData](self, "mapImageMetaData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v21);
          -[FMFMapCache mapImageMetaData](self, "mapImageMetaData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "timestamp");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSince1970");
          v27 = v16 - v26;
          -[FMFMapCache cacheExpiryInSeconds](self, "cacheExpiryInSeconds");
          v29 = v28;

          if (v27 > v29)
          {
            LogCategory_FMFMapXPC();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v24;
              _os_log_impl(&dword_1DC81B000, v30, OS_LOG_TYPE_DEFAULT, "FMFMapCache: removing file: %@", buf, 0xCu);
            }

            objc_msgSend(v24, "path");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0;
            v32 = objc_msgSend(v40, "removeItemAtPath:error:", v31, &v41);
            v33 = v41;

            if ((v32 & 1) == 0 && v33)
            {
              LogCategory_FMFMapXPC();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v24, "path");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v47 = v35;
                v48 = 2112;
                v49 = v33;
                _os_log_error_impl(&dword_1DC81B000, v34, OS_LOG_TYPE_ERROR, "FMFMapCache: error pruning file: %@ error: %@", buf, 0x16u);

              }
            }
            objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, v22);

          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v19);
    }

    v4 = v38;
    -[FMFMapCache setLastPruneDate:](self, "setLastPruneDate:", v38);
    -[FMFMapCache setMapImageMetaData:](self, "setMapImageMetaData:", v39);
    v36 = (void *)MEMORY[0x1E0D20200];
    objc_msgSend(v38, "timeIntervalSince1970");
    objc_msgSend(v36, "setInteger:forKey:inDomain:", (uint64_t)v37, CFSTR("lastPruneTimestamp"), CFSTR("com.apple.findmy"));

  }
}

- (id)gridKeyForWidth:(double)a3 andHeight:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("gridImage"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)noLocationKeyForWidth:(double)a3 andHeight:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("noLocationImage"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)cacheExpiryInSeconds
{
  if (cacheExpiryInSeconds_onceToken != -1)
    dispatch_once(&cacheExpiryInSeconds_onceToken, &__block_literal_global_3);
  return *(double *)&cacheExpiryInSeconds_cacheExpiryInSeconds;
}

void __35__FMFMapCache_cacheExpiryInSeconds__block_invoke()
{
  uint64_t v0;
  double v1;
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("cacheExpiryInSecondsOverride"), CFSTR("com.apple.findmy"));
  if (v0 >= 1)
  {
    v1 = (double)v0;
    *(double *)&cacheExpiryInSeconds_cacheExpiryInSeconds = (double)v0;
    LogCategory_FMFMapXPC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cache expiry overriden to %f", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (double)pruneIntervalInSeconds
{
  if (pruneIntervalInSeconds_onceToken != -1)
    dispatch_once(&pruneIntervalInSeconds_onceToken, &__block_literal_global_50);
  return *(double *)&pruneIntervalInSeconds_pruneIntervalInSeconds;
}

void __37__FMFMapCache_pruneIntervalInSeconds__block_invoke()
{
  uint64_t v0;
  double v1;
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("pruneIntervalInSecondsOverride"), CFSTR("com.apple.findmy"));
  if (v0 >= 1)
  {
    v1 = (double)v0;
    *(double *)&pruneIntervalInSeconds_pruneIntervalInSeconds = (double)v0;
    LogCategory_FMFMapXPC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapCache: prune interval overriden to %f", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (NSMutableDictionary)cacheMetaData
{
  return self->_cacheMetaData;
}

- (void)setCacheMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMetaData, a3);
}

- (NSMutableDictionary)gridImageMetaData
{
  return self->_gridImageMetaData;
}

- (void)setGridImageMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_gridImageMetaData, a3);
}

- (NSMutableDictionary)noLocationImageMetaData
{
  return self->_noLocationImageMetaData;
}

- (void)setNoLocationImageMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_noLocationImageMetaData, a3);
}

- (NSMutableDictionary)mapImageMetaData
{
  return self->_mapImageMetaData;
}

- (void)setMapImageMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_mapImageMetaData, a3);
}

- (NSMutableDictionary)pendingMapImageMetaData
{
  return self->_pendingMapImageMetaData;
}

- (void)setPendingMapImageMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMapImageMetaData, a3);
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
  objc_storeStrong((id *)&self->_cachePath, a3);
}

- (NSString)imageCachePath
{
  return self->_imageCachePath;
}

- (void)setImageCachePath:(id)a3
{
  objc_storeStrong((id *)&self->_imageCachePath, a3);
}

- (NSDate)lastPruneDate
{
  return self->_lastPruneDate;
}

- (void)setLastPruneDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPruneDate, a3);
}

- (OS_dispatch_queue)cacheMetaQueue
{
  return self->_cacheMetaQueue;
}

- (void)setCacheMetaQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMetaQueue, a3);
}

- (OS_dispatch_queue)gridImageQueue
{
  return self->_gridImageQueue;
}

- (void)setGridImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_gridImageQueue, a3);
}

- (OS_dispatch_queue)noLocationImageQueue
{
  return self->_noLocationImageQueue;
}

- (void)setNoLocationImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_noLocationImageQueue, a3);
}

- (OS_dispatch_queue)mapImageQueue
{
  return self->_mapImageQueue;
}

- (void)setMapImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mapImageQueue, a3);
}

- (OS_dispatch_queue)pendingImageQueue
{
  return self->_pendingImageQueue;
}

- (void)setPendingImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingImageQueue, a3);
}

- (double)mapLocationDistanceThreshold
{
  return self->_mapLocationDistanceThreshold;
}

- (void)setMapLocationDistanceThreshold:(double)a3
{
  self->_mapLocationDistanceThreshold = a3;
}

- (BOOL)fileProtectionDeactivated
{
  return self->_fileProtectionDeactivated;
}

- (void)setFileProtectionDeactivated:(BOOL)a3
{
  self->_fileProtectionDeactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingImageQueue, 0);
  objc_storeStrong((id *)&self->_mapImageQueue, 0);
  objc_storeStrong((id *)&self->_noLocationImageQueue, 0);
  objc_storeStrong((id *)&self->_gridImageQueue, 0);
  objc_storeStrong((id *)&self->_cacheMetaQueue, 0);
  objc_storeStrong((id *)&self->_lastPruneDate, 0);
  objc_storeStrong((id *)&self->_imageCachePath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_pendingMapImageMetaData, 0);
  objc_storeStrong((id *)&self->_mapImageMetaData, 0);
  objc_storeStrong((id *)&self->_noLocationImageMetaData, 0);
  objc_storeStrong((id *)&self->_gridImageMetaData, 0);
  objc_storeStrong((id *)&self->_cacheMetaData, 0);
}

void __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1DC81B000, v0, v1, "FMFMapCache: Error setting file protection %@ %@");
  OUTLINED_FUNCTION_1_0();
}

void __27__FMFMapCache_readMetaData__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DC81B000, a2, OS_LOG_TYPE_DEBUG, "FMFMapCache: meta data content %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __27__FMFMapCache_readMetaData__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DC81B000, a2, a3, "Error unarchiving map cache: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __27__FMFMapCache_saveMetaData__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "cachePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DC81B000, a3, OS_LOG_TYPE_ERROR, "FMFMapCache: Error setting file protection %@ %@", (uint8_t *)&v6, 0x16u);

}

void __27__FMFMapCache_saveMetaData__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DC81B000, a2, a3, "FMFMapCache: saveMetaData error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
