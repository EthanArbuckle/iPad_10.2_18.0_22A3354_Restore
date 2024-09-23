@implementation AFBundleResourceManager

- (AFBundleResourceManager)init
{
  AFBundleResourceManager *v2;
  AFBundleResourceManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *resourceURLProvidersByIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFBundleResourceManager;
  v2 = -[AFBundleResourceManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resourceURLProvidersByIdentifier = v3->_resourceURLProvidersByIdentifier;
    v3->_resourceURLProvidersByIdentifier = v4;

  }
  return v3;
}

- (id)resourceForSoundID:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if ((unint64_t)(a3 - 1) > 0xC)
  {
    v7 = 0;
  }
  else
  {
    if (_AFBundleResourceGetSoundMap_onceToken != -1)
      dispatch_once(&_AFBundleResourceGetSoundMap_onceToken, &__block_literal_global_66);
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = (id)_AFBundleResourceGetSoundMap_map;
    objc_msgSend(v4, "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)URLForResource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *resourceURLProvidersByIdentifier;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@"), v6, v7);

    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKey:](self->_resourceURLProvidersByIdentifier, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "extension");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URLForResource:withExtension:", v12, v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_lock(&self->_lock);
        resourceURLProvidersByIdentifier = self->_resourceURLProvidersByIdentifier;
        if (v10)
        {
          -[NSMutableDictionary setObject:forKey:](resourceURLProvidersByIdentifier, "setObject:forKey:", v10, v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](resourceURLProvidersByIdentifier, "setObject:forKey:", v16, v8);

        }
        os_unfair_lock_unlock(p_lock);

      }
      objc_msgSend(v10, "af_getBundleResourceURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURLProvidersByIdentifier, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1935);
  return (id)sharedManager_sharedManager;
}

void __40__AFBundleResourceManager_sharedManager__block_invoke()
{
  AFBundleResourceManager *v0;
  void *v1;

  v0 = objc_alloc_init(AFBundleResourceManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (id)URLForSoundID:(int64_t)a3
{
  void *v4;
  void *v5;

  -[AFBundleResourceManager resourceForSoundID:](self, "resourceForSoundID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFBundleResourceManager URLForResource:](self, "URLForResource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
