@implementation NTKBundleComplicationIdentifierCache

- (NTKBundleComplicationIdentifierCache)init
{
  NTKBundleComplicationIdentifierCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationIdentifierCache;
  v2 = -[NTKBundleComplicationIdentifierCache init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationIdentifierCache", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)fetchIdentifiersForComplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__NTKBundleComplicationIdentifierCache_fetchIdentifiersForComplication_completion___block_invoke;
  block[3] = &unk_1E6BCD820;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __83__NTKBundleComplicationIdentifierCache_fetchIdentifiersForComplication_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchIdentifiersForComplication:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_fetchIdentifiersForComplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_model)
    -[NTKBundleComplicationIdentifierCache _load](self, "_load");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "complication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v6, "complicationType");
    -[NTKBundleComplicationIdentifierCacheModel legacyComplicationTypeToDataSourceIdentifier](self->_model, "legacyComplicationTypeToDataSourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NTKBundleComplicationIdentifierCacheModel dataSourceToBundleIdentifier](self->_model, "dataSourceToBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__NTKBundleComplicationIdentifierCache__queue_fetchIdentifiersForComplication_completion___block_invoke;
  block[3] = &unk_1E6BD00D8;
  v19 = v13;
  v20 = v7;
  v18 = v9;
  v14 = v13;
  v15 = v9;
  v16 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__NTKBundleComplicationIdentifierCache__queue_fetchIdentifiersForComplication_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_cacheURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[NTKBundleComplicationIdentifierCache overrideUrl](self, "overrideUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NTKBundleComplicationIdentifierCache overrideUrl](self, "overrideUrl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    NTKCacheDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initFileURLWithPath:", v6);

    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("bundle-complication-identifier-cache.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_expectedCacheIdentifier
{
  NSString *overrideIdentifier;

  overrideIdentifier = self->_overrideIdentifier;
  if (overrideIdentifier)
    return overrideIdentifier;
  NTKBuildVersion();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_load
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "NTKBundleComplicationIdentifierCache: Failed to write cache with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadCachedModel
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "NTKBundleComplicationIdentifierCache: Failed to load cache with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateCacheModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke;
  v12 = &unk_1E6BD61B8;
  v13 = v5;
  v14 = v6;
  v7 = v6;
  v8 = v5;
  -[NTKBundleComplicationIdentifierCache _enumerateBundles:](self, "_enumerateBundles:", &v9);
  objc_msgSend(v4, "setDataSourceToBundleIdentifier:", v8, v9, v10, v11, v12);
  objc_msgSend(v4, "setLegacyComplicationTypeToDataSourceIdentifier:", v7);

}

void __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Loading bundle with identifier %{public}@", buf, 0xCu);

  }
  if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
    objc_msgSend(v3, "load");
  NTKBundleComplicationDataSourceClassesFromBundle(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke_12;
  v8[3] = &unk_1E6BD6190;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke_12(id *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a2, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "legacyNTKComplicationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v6, v4);

    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v4;
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Discovered %{public}@ in %{public}@, legacy type %{public}@", (uint8_t *)&v9, 0x20u);

    }
    if (v5)
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (void)_enumerateBundles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_enumerateBundles__onceToken_0 != -1)
    dispatch_once(&_enumerateBundles__onceToken_0, &__block_literal_global_117);
  NTKBundleComplicationDirectoryURLs();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (void *)_enumerateBundles___complicationBundleLoader_0;
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2;
        v12[3] = &unk_1E6BD2EE0;
        v13 = v3;
        objc_msgSend(v10, "enumerateBundlesFromDirectoryURL:enumerator:", v9, v12);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke()
{
  NTKBundleLoader *v0;
  void *v1;

  v0 = objc_alloc_init(NTKBundleLoader);
  v1 = (void *)_enumerateBundles___complicationBundleLoader_0;
  _enumerateBundles___complicationBundleLoader_0 = (uint64_t)v0;

}

uint64_t __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Evaluating bundle for identifier %{public}@", (uint8_t *)&v11, 0xCu);

  }
  if ((objc_msgSend(v3, "isLoaded") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("NSPrincipalClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_6:
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    v8 = 1;
    goto LABEL_9;
  }
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2_cold_1(v10);

  v8 = 0;
LABEL_9:

  return v8;
}

- (NTKBundleComplicationIdentifierCacheModel)model
{
  return self->_model;
}

- (NSURL)overrideUrl
{
  return self->_overrideUrl;
}

- (void)setOverrideUrl:(id)a3
{
  objc_storeStrong((id *)&self->_overrideUrl, a3);
}

- (NSString)overrideIdentifier
{
  return self->_overrideIdentifier;
}

- (void)setOverrideIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_overrideIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideUrl, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationIdentifierCache: Bundle missing principal class", v1, 2u);
}

@end
