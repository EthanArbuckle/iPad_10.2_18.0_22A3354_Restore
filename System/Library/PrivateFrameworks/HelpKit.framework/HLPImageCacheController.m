@implementation HLPImageCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_0 != -1)
    dispatch_once(&sharedInstance_predicate_0, &__block_literal_global_4);
  return (id)sharedInstance_gHLPImageCacheController;
}

void __41__HLPImageCacheController_sharedInstance__block_invoke()
{
  HLPImageCacheController *v0;
  void *v1;

  v0 = -[HLPDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([HLPImageCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("HLPImageCacheIdentifier"), CFSTR("com.apple.helpkit.Images"), 20971520, 4);
  v1 = (void *)sharedInstance_gHLPImageCacheController;
  sharedInstance_gHLPImageCacheController = (uint64_t)v0;

}

+ (id)defaultInMemoryImageCache
{
  if (defaultInMemoryImageCache_predicate != -1)
    dispatch_once(&defaultInMemoryImageCache_predicate, &__block_literal_global_4);
  return (id)defaultInMemoryImageCache_gInMemoryImageCache;
}

uint64_t __52__HLPImageCacheController_defaultInMemoryImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  defaultInMemoryImageCache_gInMemoryImageCache = (uint64_t)v0;

  return objc_msgSend((id)defaultInMemoryImageCache_gInMemoryImageCache, "setTotalCostLimit:", 10485760);
}

- (void)commonInit
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPImageCacheController;
  -[HLPDataCacheController commonInit](&v4, sel_commonInit);
  LODWORD(v3) = *MEMORY[0x24BDD1350];
  -[HLPDataCacheController setDefaultPriority:](self, "setDefaultPriority:", v3);
}

- (id)newDataCache
{
  HLPDataCache *v2;

  v2 = objc_alloc_init(HLPDataCache);
  -[HLPDataCache setCacheType:](v2, "setCacheType:", 3);
  -[HLPDataCache setMaxAge:](v2, "setMaxAge:", 345600);
  return v2;
}

- (void)removeAllDataCache
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HLPImageCacheController;
  -[HLPDataCacheController removeAllDataCache](&v3, sel_removeAllDataCache);
  -[HLPImageCacheController removeInMemoryCache](self, "removeInMemoryCache");
}

- (void)removeInMemoryCache
{
  id v2;

  +[HLPImageCacheController defaultInMemoryImageCache](HLPImageCacheController, "defaultInMemoryImageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)addInMemoryCacheForImage:(id)a3 path:(id)a4 cost:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a4, "lastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPImageCacheController addInMemoryCacheForImage:identifier:cost:](self, "addInMemoryCacheForImage:identifier:cost:", v8, v9, a5);

}

- (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
  {
    +[HLPImageCacheController defaultInMemoryImageCache](HLPImageCacheController, "defaultInMemoryImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a5)
      objc_msgSend(v8, "setObject:forKey:cost:", v10, v7, a5);
    else
      objc_msgSend(v8, "setObject:forKey:", v10, v7);

  }
}

- (void)removeInMemoryCacheForPath:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    +[HLPImageCacheController defaultInMemoryImageCache](HLPImageCacheController, "defaultInMemoryImageCache");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v3);

  }
}

- (id)imageFromMemoryCacheForPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPImageCacheController defaultInMemoryImageCache](HLPImageCacheController, "defaultInMemoryImageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getImageForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HLPImageCacheController imageFromMemoryCacheForPath:](self, "imageFromMemoryCacheForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithContentsOfFile:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)isURLValid:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPImageCacheController imageFromMemoryCacheForPath:](self, "imageFromMemoryCacheForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "fileExistsAtPath:", v4);

  }
  return v6;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  HLPImageCacheController *v16;
  void (**v17)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPImageCacheController imageFromMemoryCacheForPath:](self, "imageFromMemoryCacheForPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else if (v6
         && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
             v10 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v6, "path"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v10, "fileExistsAtPath:", v11),
             v11,
             v10,
             v12))
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_24D32F120;
    v15 = v6;
    v16 = self;
    v17 = v7;
    dispatch_async(v13, block);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

void __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(a1[4], "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  objc_msgSend(a1[5], "formattedDataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_24D32E798;
  v10 = v5;
  v6 = a1[6];
  v11 = v4;
  v12 = v6;
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v2, a1[5]);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
}

- (id)formattedDataWithFileURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)formattedDataWithData:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
