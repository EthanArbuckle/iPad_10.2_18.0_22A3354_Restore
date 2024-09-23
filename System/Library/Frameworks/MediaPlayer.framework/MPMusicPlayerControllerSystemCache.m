@implementation MPMusicPlayerControllerSystemCache

void __49__MPMusicPlayerControllerSystemCache_sharedCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = v1;

}

- (id)_init
{
  MPMusicPlayerControllerSystemCache *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerControllerSystemCache;
  v2 = -[MPMusicPlayerControllerSystemCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (void)setNowPlaying:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[MPMusicPlayerControllerSystemCache _saveObject:forKey:error:](self, "_saveObject:forKey:error:", a3, CFSTR("musicPlayerStateRestorationCache-nowPlaying"), &v6);
  v3 = v6;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to encode cached now playing error=%{public}@", buf, 0xCu);

    }
  }

}

- (BOOL)_saveObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  NSUserDefaults *defaults;

  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0D4D0B0];
    v9 = a4;
    objc_msgSend(v8, "encodedDataWithRootObject:error:", a3, a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v10, v9);

    v11 = v10 != 0;
  }
  else
  {
    defaults = self->_defaults;
    v10 = a4;
    -[NSUserDefaults removeObjectForKey:](defaults, "removeObjectForKey:", v10);
    v11 = 1;
  }

  return v11;
}

+ (MPMusicPlayerControllerSystemCache)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MPMusicPlayerControllerSystemCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (MPMusicPlayerControllerSystemCache *)(id)sharedCache___sharedCache;
}

- (BOOL)hasCachedData
{
  void *v2;
  BOOL v3;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("musicPlayerStateRestorationCache-nowPlaying"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)clearCache
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("musicPlayerStateRestorationCache-nowPlaying"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("musicPlayerStateRestorationCache-queueDescriptor"));
}

- (MPMusicPlayerControllerNowPlaying)nowPlaying
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[MPMusicPlayerControllerSystemCache _objectOfClass:forKey:error:](self, "_objectOfClass:forKey:error:", objc_opt_class(), CFSTR("musicPlayerStateRestorationCache-nowPlaying"), &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to decode cached now playing error=%{public}@", buf, 0xCu);

    }
  }

  return (MPMusicPlayerControllerNowPlaying *)v2;
}

- (MPMusicPlayerQueueDescriptor)queueDescriptor
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[MPMusicPlayerControllerSystemCache _objectOfClass:forKey:error:](self, "_objectOfClass:forKey:error:", objc_opt_class(), CFSTR("musicPlayerStateRestorationCache-queueDescriptor"), &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to decode cached queue descriptor error=%{public}@", buf, 0xCu);

    }
  }

  return (MPMusicPlayerQueueDescriptor *)v2;
}

- (void)setQueueDescriptor:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[MPMusicPlayerControllerSystemCache _saveObject:forKey:error:](self, "_saveObject:forKey:error:", a3, CFSTR("musicPlayerStateRestorationCache-queueDescriptor"), &v6);
  v3 = v6;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to encode cached queue descriptor error=%{public}@", buf, 0xCu);

    }
  }

}

- (id)_objectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  -[NSUserDefaults dataForKey:](self->_defaults, "dataForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D4D0A8], "decodedObjectOfClass:fromData:error:", a3, v7, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
