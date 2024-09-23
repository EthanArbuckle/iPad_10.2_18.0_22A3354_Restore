@implementation ICImageCache

- (id)imageForKey:(id)a3
{
  id v4;
  ICImageCache *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ICImageCache imageCache](v5, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[ICImageCache bigImageCache](v5, "bigImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v5);

  return v7;
}

- (void)removeImageForKey:(id)a3
{
  ICImageCache *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICImageCache bigImageCache](v4, "bigImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  -[ICImageCache imageCache](v4, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_sync_exit(v4);
}

- (ICCache)imageCache
{
  return self->_imageCache;
}

- (ICLRUCache)bigImageCache
{
  return self->_bigImageCache;
}

- (ICImageCache)init
{
  ICImageCache *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICImageCache;
  v2 = -[ICImageCache init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D641C0]);
    -[ICImageCache setImageCache:](v2, "setImageCache:", v3);

  }
  return v2;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v6;
  ICImageCache *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v16, "size");
  v9 = v8;
  objc_msgSend(v16, "size");
  v11 = v10;
  objc_msgSend(v16, "scale");
  if ((unint64_t)(v12 * (double)(unint64_t)(v9 * v11)) <= 0x100000)
  {
    -[ICImageCache imageCache](v7, "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v6);
  }
  else
  {
    -[ICImageCache bigImageCache](v7, "bigImageCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64208]), "initWithMaxSize:", 3);
      -[ICImageCache setBigImageCache:](v7, "setBigImageCache:", v14);

    }
    -[ICImageCache bigImageCache](v7, "bigImageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v6);
  }

  objc_sync_exit(v7);
}

- (void)removeAllImages
{
  void *v3;
  id v4;

  -[ICImageCache imageCache](self, "imageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[ICImageCache bigImageCache](self, "bigImageCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)registerForMemoryWarnings
{
  dispatch_source_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
  -[ICImageCache setMemoryWarningEventSource:](self, "setMemoryWarningEventSource:", v3);

  objc_initWeak(&location, self);
  -[ICImageCache memoryWarningEventSource](self, "memoryWarningEventSource");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __41__ICImageCache_registerForMemoryWarnings__block_invoke;
  v9 = &unk_1E76C7940;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[ICImageCache memoryWarningEventSource](self, "memoryWarningEventSource", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__ICImageCache_registerForMemoryWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "receivedMemoryWarning");

}

- (void)unregisterForMemoryWarnings
{
  void *v3;
  NSObject *v4;

  -[ICImageCache memoryWarningEventSource](self, "memoryWarningEventSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICImageCache memoryWarningEventSource](self, "memoryWarningEventSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
}

- (void)receivedMemoryWarning
{
  id v2;

  -[ICImageCache bigImageCache](self, "bigImageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (double)bigImageSize
{
  return 1048576.0;
}

+ (unint64_t)maxBigImageCount
{
  return 3;
}

- (void)setBigImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_bigImageCache, a3);
}

- (OS_dispatch_source)memoryWarningEventSource
{
  return self->_memoryWarningEventSource;
}

- (void)setMemoryWarningEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryWarningEventSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryWarningEventSource, 0);
  objc_storeStrong((id *)&self->_bigImageCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
