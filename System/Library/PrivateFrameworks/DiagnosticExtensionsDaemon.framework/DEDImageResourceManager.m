@implementation DEDImageResourceManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__DEDImageResourceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, block);
  return (id)sharedInstance__sharedInstance;
}

void __41__DEDImageResourceManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  ResourceLoader *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

  v2 = objc_alloc_init(ResourceLoader);
  v3 = *(void **)(sharedInstance__sharedInstance + 8);
  *(_QWORD *)(sharedInstance__sharedInstance + 8) = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  v5 = *(void **)(sharedInstance__sharedInstance + 16);
  *(_QWORD *)(sharedInstance__sharedInstance + 16) = v4;

}

- (void)asynchronousDataFromURL:(id)a3 key:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  DEDImageResourceManager *v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[DEDImageResourceManager loader](self, "loader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__DEDImageResourceManager_asynchronousDataFromURL_key_completionBlock___block_invoke;
  v14[3] = &unk_24D1E4F98;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "asynchronousDataFromURL:completionBlock:", v10, v14);

}

void __71__DEDImageResourceManager_asynchronousDataFromURL_key_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (*(_QWORD *)(a1 + 32))
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)cachedImageFromKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DEDImageResourceManager imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ResourceLoader)loader
{
  return (ResourceLoader *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)imageCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
