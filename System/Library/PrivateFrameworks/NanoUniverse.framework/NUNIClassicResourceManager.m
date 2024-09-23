@implementation NUNIClassicResourceManager

+ (NUNIClassicResourceManager)sharedInstance
{
  id v2;
  NUNIClassicResourceManager *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!__sharedInstance)
  {
    v3 = objc_alloc_init(NUNIClassicResourceManager);
    v4 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (NUNIClassicResourceManager *)(id)__sharedInstance;
}

+ (void)_deallocInstance:(id)a3
{
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance;
  __sharedInstance = 0;

  objc_sync_exit(obj);
}

- (NUNIClassicResourceManager)init
{
  NUNIClassicResourceManager *v2;
  uint64_t v3;
  CLKUIResourceProviderKey *resourceProviderKey;
  uint64_t v5;
  MTLDevice *device;
  uint64_t v7;
  NSMapTable *textureGroupHashTable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUNIClassicResourceManager;
  v2 = -[NUNIClassicResourceManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    resourceProviderKey = v2->_resourceProviderKey;
    v2->_resourceProviderKey = (CLKUIResourceProviderKey *)v3;

    objc_msgSend(MEMORY[0x24BE16F48], "sharedDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (MTLDevice *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    textureGroupHashTable = v2->_textureGroupHashTable;
    v2->_textureGroupHashTable = (NSMapTable *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NUNIClassicResourceManager;
  -[NUNIClassicResourceManager dealloc](&v2, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "_deallocInstance:", 0);
  else
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__deallocInstance_, 0, 0);
}

- (void)addClient
{
  NUNIClassicResourceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);

}

- (void)removeClient
{
  NUNIClassicResourceManager *v2;
  uint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
    -[NUNIClassicResourceManager _asyncDeallocInstance](v2, "_asyncDeallocInstance");
}

- (id)textureGroupWithSuffix:(id)a3
{
  id v4;
  NUNIClassicTextureGroup *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_textureGroupHashTable, "objectForKey:", v4);
  v5 = (NUNIClassicTextureGroup *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    for (i = 0; i != 14; ++i)
    {
      -[__CFString stringByAppendingFormat:](textureGroupWithSuffix__uuids[i], "stringByAppendingFormat:", CFSTR("-%@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE16F70], "textureWithProviderDelegate:uuid:", self, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
    v5 = -[NUNIClassicTextureGroup initWithTextures:]([NUNIClassicTextureGroup alloc], "initWithTextures:", v6);
    -[NSMapTable setObject:forKey:](self->_textureGroupHashTable, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (id)provideAtlasBacking:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  NUNIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("art"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NUNILoggingObjectForDomain(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2134A1000, v6, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BE16F20], "atlasBackingWithArt:uuid:", v5, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_2134A1000, v6, OS_LOG_TYPE_DEFAULT, "missing artwork for %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
