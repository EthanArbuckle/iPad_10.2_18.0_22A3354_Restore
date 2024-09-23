@implementation FMFMapImageCache

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate != -1)
    dispatch_once(&sharedInstance_dispatch_predicate, &__block_literal_global_4);
  return (id)sharedInstance__instance;
}

void __34__FMFMapImageCache_sharedInstance__block_invoke()
{
  NSObject *v0;
  FMFMapImageCache *v1;
  void *v2;
  uint8_t v3[16];

  LogCategory_Daemon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20DD58000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFMapImageCache", v3, 2u);
  }

  v1 = objc_alloc_init(FMFMapImageCache);
  v2 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v1;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self->__cache, *MEMORY[0x24BDF7538], 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFMapImageCache;
  -[FMFMapImageCache dealloc](&v4, sel_dealloc);
}

- (void)cacheMap:(id)a3 forHandles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[FMFMapImageCache _keyForHandles:](self, "_keyForHandles:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFMapImageCache _imageForMap:](self, "_imageForMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FMFMapImageCache _cache](self, "_cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

- (id)cachedMapForHandles:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[FMFMapImageCache _keyForHandles:](self, "_keyForHandles:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapImageCache _cache](self, "_cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_orientationKey
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v2, "statusBarOrientation") - 3) >= 2)
    v3 = CFSTR("p");
  else
    v3 = CFSTR("l");
  v4 = v3;

  return v4;
}

- (id)_keyForHandles:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C0];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:selector:", CFSTR("identifier"), 1, sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapImageCache _orientationKey](self, "_orientationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_imageForMap:(id)a3
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  void *CurrentContext;
  void *v7;
  CGSize v9;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v9.width = v4;
  v9.height = v5;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    objc_msgSend(v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderInContext:", CurrentContext);

    UIGraphicsGetImageFromCurrentImageContext();
    CurrentContext = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return CurrentContext;
}

- (NSCache)_cache
{
  NSCache *cache;
  id v4;
  void *v5;

  cache = self->__cache;
  if (!cache)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    -[FMFMapImageCache set_cache:](self, "set_cache:", v4);

    -[NSCache setCountLimit:](self->__cache, "setCountLimit:", 25);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self->__cache, sel_removeAllObjects, *MEMORY[0x24BDF7538], 0);

    cache = self->__cache;
  }
  return cache;
}

- (void)set_cache:(id)a3
{
  objc_storeStrong((id *)&self->__cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cache, 0);
}

@end
