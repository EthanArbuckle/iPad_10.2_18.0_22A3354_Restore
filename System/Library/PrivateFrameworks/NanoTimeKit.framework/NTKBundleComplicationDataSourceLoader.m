@implementation NTKBundleComplicationDataSourceLoader

void __79__NTKBundleComplicationDataSourceLoader_enumerateComplicationClassesWithBlock___block_invoke(uint64_t a1, Class aClass)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(aClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", aClass))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", aClass);
      goto LABEL_9;
    }
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Skipping %@ - Already loaded", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1((uint64_t)v4, v5, v6);
  }

LABEL_9:
}

- (NTKBundleComplicationDataSourceLoader)init
{
  NTKBundleComplicationDataSourceLoader *v2;
  NTKBundleComplicationDataSourceLoader *v3;
  NTKBundleComplicationDataSourceLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationDataSourceLoader;
  v2 = -[NTKBundleComplicationDataSourceLoader init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachedDataSourcesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)enumerateComplicationClassesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *cachedDataSources;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  kdebug_trace();
  if (v4)
  {
    -[NTKBundleComplicationDataSourceLoader cachedDataSources](self, "cachedDataSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__NTKBundleComplicationDataSourceLoader_enumerateComplicationClassesWithBlock___block_invoke;
      v20[3] = &unk_1E6BD81F0;
      v21 = v6;
      v7 = v6;
      -[NTKBundleComplicationDataSourceLoader _loadClassesUsingBlock:](self, "_loadClassesUsingBlock:", v20);
      os_unfair_lock_lock(&self->_cachedDataSourcesLock);
      v8 = (NSArray *)objc_msgSend(v7, "copy");
      cachedDataSources = self->_cachedDataSources;
      self->_cachedDataSources = v8;

      os_unfair_lock_unlock(&self->_cachedDataSourcesLock);
    }
    v19 = 0;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NTKBundleComplicationDataSourceLoader cachedDataSources](self, "cachedDataSources", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        if (v19)
          break;
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), &v19);
        if (v12 == v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
          if (v12)
            goto LABEL_6;
          break;
        }
      }
    }

    kdebug_trace();
  }

}

- (id)cachedDataSources
{
  os_unfair_lock_s *p_cachedDataSourcesLock;
  void *v4;

  p_cachedDataSourcesLock = &self->_cachedDataSourcesLock;
  os_unfair_lock_lock(&self->_cachedDataSourcesLock);
  v4 = (void *)-[NSArray copy](self->_cachedDataSources, "copy");
  os_unfair_lock_unlock(p_cachedDataSourcesLock);
  return v4;
}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectories:(id)a3
{
  id v3;
  _NTKBundleBundleComplicationLoader *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_NTKBundleBundleComplicationLoader);
  v5 = (void *)objc_msgSend(v3, "copy");

  -[_NTKBundleBundleComplicationLoader setUrls:](v4, "setUrls:", v5);
  return (NTKBundleComplicationDataSourceLoader *)v4;
}

+ (id)disabledComplicationDataSourceLoader
{
  if (disabledComplicationDataSourceLoader_onceToken != -1)
    dispatch_once(&disabledComplicationDataSourceLoader_onceToken, &__block_literal_global_42_0);
  return (id)disabledComplicationDataSourceLoader_DisabledLoader;
}

void __77__NTKBundleComplicationDataSourceLoader_disabledComplicationDataSourceLoader__block_invoke()
{
  _NTKBundleDisabledComplicationLoader *v0;
  void *v1;

  v0 = objc_alloc_init(_NTKBundleDisabledComplicationLoader);
  v1 = (void *)disabledComplicationDataSourceLoader_DisabledLoader;
  disabledComplicationDataSourceLoader_DisabledLoader = (uint64_t)v0;

}

+ (id)defaultComplicationDataSourceLoader
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NTKBundleComplicationDataSourceLoader_defaultComplicationDataSourceLoader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultComplicationDataSourceLoader_onceToken != -1)
    dispatch_once(&defaultComplicationDataSourceLoader_onceToken, block);
  return (id)defaultComplicationDataSourceLoader_BundleLoader;
}

void __76__NTKBundleComplicationDataSourceLoader_defaultComplicationDataSourceLoader__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builtInPlugInsURL");
  v2 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingPathExtension");
  v7 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v7;
  v21 = (void *)v4;
  v23 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v2, v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("NanoTimeKit"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("Complications"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "complicationDataSourceLoaderWithDirectories:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)defaultComplicationDataSourceLoader_BundleLoader;
  defaultComplicationDataSourceLoader_BundleLoader = v18;

}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "complicationDataSourceLoaderWithDirectories:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "complicationDataSourceLoaderWithDirectories:", MEMORY[0x1E0C9AA60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NTKBundleComplicationDataSourceLoader *)v7;
}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setBlock:", v5);
  return (NTKBundleComplicationDataSourceLoader *)v4;
}

+ (id)aggregateComplicationLoaderWithComplicationLoaders:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLoaders:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataSources, 0);
}

@end
