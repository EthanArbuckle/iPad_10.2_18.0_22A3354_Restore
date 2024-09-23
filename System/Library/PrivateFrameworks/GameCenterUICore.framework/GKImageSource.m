@implementation GKImageSource

- (GKUtilityService)utilityService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE3A178], "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utilityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKUtilityService *)v3;
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1)
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_11);
  return (id)syncQueue_syncQueue;
}

void __26__GKImageSource_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.gamekit.imagesource", 0);
  v1 = (void *)syncQueue_syncQueue;
  syncQueue_syncQueue = (uint64_t)v0;

}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_128);
  return (id)sharedCache_sCache;
}

void __28__GKImageSource_sharedCache__block_invoke()
{
  GKImageCache *v0;
  void *v1;

  v0 = -[GKImageCache initWithName:maxCount:]([GKImageCache alloc], "initWithName:maxCount:", CFSTR("com.apple.GameKit.imagecache"), 50);
  v1 = (void *)sharedCache_sCache;
  sharedCache_sCache = (uint64_t)v0;

}

+ (void)clearCache
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "sharedCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (GKImageSource)initWithName:(id)a3 imageBrush:(id)a4
{
  id v7;
  id v8;
  GKImageSource *v9;
  GKImageSource *v10;
  uint64_t v11;
  NSCache *cache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKImageSource;
  v9 = -[GKImageSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_imageBrush, a4);
    objc_msgSend((id)objc_opt_class(), "sharedCache");
    v11 = objc_claimAutoreleasedReturnValue();
    cache = v10->_cache;
    v10->_cache = (NSCache *)v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKImageSource;
  -[GKImageSource dealloc](&v4, sel_dealloc);
}

- (id)subsourceWithBrush:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:imageBrush:", self->_name, v4);

  objc_storeStrong((id *)(v5 + 40), self->_defaultImage);
  objc_storeStrong((id *)(v5 + 16), self->_cache);
  *(_BYTE *)(v5 + 8) = self->_shouldRenderDefaultImageWithBrush;
  return (id)v5;
}

- (id)keyForImageIdentifier:(id)a3
{
  return +[GKImageKey keyForImageIdentifier:withImageSource:](GKImageKey, "keyForImageIdentifier:withImageSource:", a3, self);
}

+ (id)cacheDirectoryForImageID:(id)a3
{
  if (!a3)
    return 0;
  GKImageCacheRoot();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)renderedImageWithImage:(id)a3 defaultSize:(CGSize)a4 returnContext:(id *)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  GKImageContext *v19;
  id v20;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[GKImageSource imageBrush](self, "imageBrush");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "scaleForInput:", v9);
    v13 = v12;
    v14 = (double *)MEMORY[0x24BDBF090];
    if (v9)
    {
      objc_msgSend(v11, "sizeForInput:", v9);
      width = v15;
      height = v16;
    }
    v17 = *v14;
    v18 = v14[1];
    if (!a5 || (v19 = (GKImageContext *)*a5) == 0)
      v19 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", 0, width, height, v13);
    objc_msgSend(v11, "drawInRect:withContext:input:", -[GKImageContext CGContext](v19, "CGContext"), v9, v17, v18, width, height);
    -[GKImageContext image](v19, "image");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = objc_retainAutorelease(v19);

  }
  else
  {
    v20 = v9;
  }

  return v20;
}

- (id)renderedImageWithImage:(id)a3 returnContext:(id *)a4
{
  return -[GKImageSource renderedImageWithImage:defaultSize:returnContext:](self, "renderedImageWithImage:defaultSize:returnContext:", a3, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (id)renderedImageWithImage:(id)a3
{
  return -[GKImageSource renderedImageWithImage:returnContext:](self, "renderedImageWithImage:returnContext:", a3, 0);
}

- (unint64_t)cacheCostForImage:(id)a3
{
  double v3;
  double v4;

  objc_msgSend(a3, "size");
  return (unint64_t)(v3 * v4);
}

- (UIImage)renderedDefaultImage
{
  void *v3;
  UIImage *renderedDefaultImage;

  if (-[GKImageSource shouldRenderDefaultImageWithBrush](self, "shouldRenderDefaultImageWithBrush")
    && !self->_renderedDefaultImage
    && self->_defaultImage)
  {
    -[GKImageSource renderedImageWithImage:](self, "renderedImageWithImage:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource setRenderedDefaultImage:](self, "setRenderedDefaultImage:", v3);

  }
  renderedDefaultImage = self->_renderedDefaultImage;
  if (!renderedDefaultImage)
    renderedDefaultImage = self->_defaultImage;
  return renderedDefaultImage;
}

- (void)validateFileSystemCache
{
  if (validateFileSystemCache_onceToken != -1)
    dispatch_once(&validateFileSystemCache_onceToken, &__block_literal_global_136);
}

void __40__GKImageSource_validateFileSystemCache__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject **v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  os_log_t *v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  GKImageCacheRoot();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("version.txt"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfFile:encoding:error:", v1, 4, 0);
  v3 = (NSObject **)MEMORY[0x24BE3A308];
  v4 = *MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
  {
    v5 = (id)GKOSLoggers();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v0;
    _os_log_impl(&dword_219F71000, v4, OS_LOG_TYPE_INFO, "GKImageCacheRoot is: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE3A180], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Blacktail6"), "stringByAppendingFormat:", CFSTR("-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%d"), objc_msgSend(v9, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 || (objc_msgSend(v2, "isEqualToString:", v10) & 1) == 0)
  {
    v11 = *v3;
    if (!*v3)
    {
      v12 = (id)GKOSLoggers();
      v11 = *v3;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v2;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v0;
      _os_log_impl(&dword_219F71000, v11, OS_LOG_TYPE_INFO, "Removing old image cache (old version '%@', now '%@'):%@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v14 = objc_msgSend(v13, "removeItemAtPath:error:", v0, &v26);
    v15 = v26;
    v16 = (os_log_t *)MEMORY[0x24BE3A300];
    if ((v14 & 1) == 0)
    {
      if (!*v3)
        v17 = (id)GKOSLoggers();
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_3();
    }
    v25 = v15;
    v18 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v0, 1, 0, &v25);
    v19 = v25;

    if ((v18 & 1) == 0)
    {
      if (!*v3)
        v20 = (id)GKOSLoggers();
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_2();
    }
    v24 = v19;
    v21 = objc_msgSend(v10, "writeToFile:atomically:encoding:error:", v1, 1, 4, &v24);
    v22 = v24;

    if ((v21 & 1) != 0)
    {
      _gkMarkFileAsPurgeable();
    }
    else
    {
      if (!*v3)
        v23 = (id)GKOSLoggers();
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_1();
    }

  }
}

- (id)fastCachedImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[GKImageSource shouldUseTestImage](self, "shouldUseTestImage"))
  {
    -[GKImageSource renderedTestImage](self, "renderedTestImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "cacheKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)fastCachedImageForIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource fastCachedImageForKey:](self, "fastCachedImageForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)fastCachedOrDefaultImageForForKey:(id)a3
{
  void *v4;

  -[GKImageSource fastCachedImageForKey:](self, "fastCachedImageForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[GKImageSource renderedDefaultImage](self, "renderedDefaultImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fastCachedOrDefaultImageForIdentifier:(id)a3
{
  void *v4;

  -[GKImageSource fastCachedImageForIdentifier:](self, "fastCachedImageForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[GKImageSource renderedDefaultImage](self, "renderedDefaultImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)cachedImageForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (-[GKImageSource shouldUseTestImage](self, "shouldUseTestImage"))
  {
    -[GKImageSource renderedTestImage](self, "renderedTestImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "cacheKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = v8;
    }
    else
    {
      -[GKImageSource validateFileSystemCache](self, "validateFileSystemCache");
      objc_msgSend(v4, "filePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v9, 0);
      +[GKImageContext imageFromRawPixelsAtURL:](GKImageContext, "imageFromRawPixelsAtURL:", v10);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[GKImageSource cache](self, "cache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v5, v6);

        v12 = v5;
      }

    }
  }

  return v5;
}

- (id)cachedImageForIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource cachedImageForKey:](self, "cachedImageForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldUseTestImage
{
  if (shouldUseTestImage_onceToken != -1)
    dispatch_once(&shouldUseTestImage_onceToken, &__block_literal_global_146);
  return shouldUseTestImage_sUseTestImage;
}

void __35__GKImageSource_shouldUseTestImage__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldUseTestImage_sUseTestImage = objc_msgSend(v0, "shouldUseTestIcons");

}

- (id)renderedTestImage
{
  void *v3;
  void *v4;
  void *v5;

  +[GKUITheme sharedTheme](GKUITheme, "sharedTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:", CFSTR("GKTestIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[GKImageSource renderedImageWithImage:](self, "renderedImageWithImage:", v4);
  else
    -[GKImageSource renderedDefaultImage](self, "renderedDefaultImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)processAndCacheImage:(id)a3 forKey:(id)a4
{
  return -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:](self, "processAndCacheImageDataInContext:withImage:forKey:", 0, a3, a4);
}

- (id)processAndCacheImage:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageSource processAndCacheImage:forKey:](self, "processAndCacheImage:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_storeImage:(id)a3 cacheKey:(id)a4 path:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  _QWORD *v16;
  os_log_t *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v26 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v28);
  v15 = v28;

  v16 = (_QWORD *)MEMORY[0x24BE3A308];
  v17 = (os_log_t *)MEMORY[0x24BE3A300];
  if ((v14 & 1) == 0)
  {
    if (!*MEMORY[0x24BE3A308])
      v18 = (id)GKOSLoggers();
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
      -[GKImageSource _storeImage:cacheKey:path:context:].cold.1();
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v10, 0);
  v27 = 0;
  v20 = objc_msgSend(v11, "writeRawPixelsToURL:error:", v19, &v27);
  v21 = v27;
  if ((v20 & 1) == 0)
  {
    if (!*v16)
      v22 = (id)GKOSLoggers();
    v23 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v21;
      _os_log_error_impl(&dword_219F71000, v23, OS_LOG_TYPE_ERROR, "_storeImage path:%@ context:%@ -- error:%@", buf, 0x20u);
    }
  }
  if (v9)
  {
    -[GKImageSource cache](self, "cache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v9, v26);

  }
  _gkMarkFileAsPurgeable();

}

- (void)cacheImageFromContext:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageSource _storeImage:cacheKey:path:context:](self, "_storeImage:cacheKey:path:context:", v7, v8, v9, v6);

}

- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forKey:(id)a5
{
  GKImageContext *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  GKImageContext *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  GKImageContext *v23;
  double v24;
  NSObject **v26;
  NSObject *v27;
  id v28;
  id v29;
  GKImageContext *v30;

  v8 = (GKImageContext *)a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "cacheKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageSource validateFileSystemCache](self, "validateFileSystemCache");
  if (v12)
  {
    -[GKImageSource imageBrush](self, "imageBrush");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v10, "size");
      v30 = v8;
      -[GKImageSource renderedImageWithImage:defaultSize:returnContext:](self, "renderedImageWithImage:defaultSize:returnContext:", v9, &v30);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v30;

      if (!v14)
      {
        if (v15)
        {
          -[GKImageContext image](v15, "image");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v14 = (id)v16;
          }
          else
          {
            if (!*MEMORY[0x24BE3A308])
              v29 = (id)GKOSLoggers();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
              -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:].cold.2();
            v14 = 0;
          }
        }
        else
        {
          v26 = (NSObject **)MEMORY[0x24BE3A308];
          v27 = *MEMORY[0x24BE3A308];
          if (!*MEMORY[0x24BE3A308])
          {
            v28 = (id)GKOSLoggers();
            v27 = *v26;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:].cold.1(v27);
          v14 = v9;
          v15 = 0;
        }
      }
    }
    else
    {
      v14 = v9;
      objc_msgSend(v10, "size");
      if (v17 == 0.0 || (v19 = v18, v18 == 0.0))
      {
        objc_msgSend(v14, "size");
        v20 = v21;
        v19 = v22;
      }
      else
      {
        v20 = v17;
      }
      v23 = [GKImageContext alloc];
      objc_msgSend(v14, "scale");
      v15 = -[GKImageContext initWithSize:scale:options:](v23, "initWithSize:scale:options:", 0, v20, v19, v24);

      UIGraphicsPushContext(-[GKImageContext CGContext](v15, "CGContext"));
      objc_msgSend(v14, "drawInRect:", 0.0, 0.0, v20, v19);
      UIGraphicsPopContext();
    }
    -[GKImageSource _storeImage:cacheKey:path:context:](self, "_storeImage:cacheKey:path:context:", v14, v11, v12, v15);
    v8 = v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:](self, "processAndCacheImageDataInContext:withImage:forKey:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)clearCachedImageForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKImageSource cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (GKImageBrush)imageBrush
{
  return self->_imageBrush;
}

- (void)setImageBrush:(id)a3
{
  objc_storeStrong((id *)&self->_imageBrush, a3);
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setDefaultImage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultImage, a3);
}

- (void)setRenderedDefaultImage:(id)a3
{
  objc_storeStrong((id *)&self->_renderedDefaultImage, a3);
}

- (BOOL)shouldRenderDefaultImageWithBrush
{
  return self->_shouldRenderDefaultImageWithBrush;
}

- (void)setShouldRenderDefaultImageWithBrush:(BOOL)a3
{
  self->_shouldRenderDefaultImageWithBrush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedDefaultImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_imageBrush, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "Can't write to image cache root:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "Can't create new image cache root:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "Can't remove old image cache root:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_storeImage:cacheKey:path:context:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_0_2(&dword_219F71000, v1, (uint64_t)v1, "_storeImage failed to create directory at path:%@ due to error:%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)processAndCacheImageDataInContext:(void *)a1 withImage:forKey:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "imageBrush");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v1, v4, "processAndCacheImageDataInContext no context passed in rendering image with imageBrush %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)processAndCacheImageDataInContext:withImage:forKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "processAndCacheImageDataInContext error retrieving image from context %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
