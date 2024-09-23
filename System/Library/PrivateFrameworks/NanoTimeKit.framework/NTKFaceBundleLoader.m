@implementation NTKFaceBundleLoader

uint64_t __41__NTKFaceBundleLoader__enumerateBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isLoaded") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("NSPrincipalClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v6 = 1;
    goto LABEL_7;
  }
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(v3, v8);

  v6 = 0;
LABEL_7:

  return v6;
}

void __52__NTKFaceBundleLoader_loadFaceBundleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "infoDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("NTKFaceBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("AdditionalIdentifiers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);
    objc_msgSend(&unk_1E6CA87F8, "objectForKey:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v7);
    v27 = v7;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      v25 = v4;
      objc_msgSend(v3, "load");
      v26 = v3;
      NTKFaceBundleClassesFromBundle(v3);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v31;
        while (2)
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v19, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqual:", *(_QWORD *)(a1 + 32));

            if (v21)
            {
              v22 = objc_alloc_init((Class)v19);
              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v24 = *(void **)(v23 + 40);
              *(_QWORD *)(v23 + 40) = v22;

              goto LABEL_24;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_24:

      v4 = v25;
      v3 = v26;
    }

  }
}

void __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke(uint64_t a1, Class aClass)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(aClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Loading bundle of class %@…", (uint8_t *)&v8, 0xCu);
  }

  if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", aClass))
    {
      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Skipping %@ - Already loaded", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", aClass);
      v6 = objc_alloc_init(aClass);
      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1((uint64_t)v4, v6, v7);
  }

}

void __46__NTKFaceBundleLoader__loadClassesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "load");
  NTKFaceBundleClassesFromBundle(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)enumerateFaceBundleClassesIgnoringCache:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  os_unfair_lock_s *p_cacheLock;
  NSArray *cachedFaceBundles;
  NSArray **p_cachedFaceBundles;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    p_cachedFaceBundles = &self->_cachedFaceBundles;
    cachedFaceBundles = self->_cachedFaceBundles;
    if (cachedFaceBundles)
      v10 = !v4;
    else
      v10 = 0;
    if (v10)
    {
      v15 = cachedFaceBundles;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke;
      v25[3] = &unk_1E6BD3A50;
      v26 = v11;
      v27 = v12;
      v13 = v12;
      v14 = v11;
      -[NTKFaceBundleLoader _loadClassesUsingBlock:](self, "_loadClassesUsingBlock:", v25);
      v15 = (NSArray *)objc_msgSend(v13, "copy");
      objc_storeStrong((id *)p_cachedFaceBundles, v15);

    }
    os_unfair_lock_unlock(p_cacheLock);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v15;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v18);
    }

  }
}

+ (id)faceBundleLoaderWithDirectories:(id)a3
{
  id v3;
  NTKFaceBundleLoader *v4;

  v3 = a3;
  v4 = -[NTKFaceBundleLoader initWithURLs:]([NTKFaceBundleLoader alloc], "initWithURLs:", v3);

  return v4;
}

- (NTKFaceBundleLoader)initWithURLs:(id)a3
{
  id v4;
  NTKFaceBundleLoader *v5;
  NTKFaceBundleLoader *v6;
  NTKBundleLoader *v7;
  NTKBundleLoader *loader;
  uint64_t v9;
  NSSet *urls;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceBundleLoader;
  v5 = -[NTKFaceBundleLoader init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_cacheLock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc_init(NTKBundleLoader);
    loader = v6->_loader;
    v6->_loader = v7;

    v6->_loaderLock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v4, "copy");
    urls = v6->_urls;
    v6->_urls = (NSSet *)v9;

  }
  return v6;
}

- (id)loadFaceBundleWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NTKFaceBundleLoader_loadFaceBundleWithIdentifier___block_invoke;
  v8[3] = &unk_1E6BD2F08;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NTKFaceBundleLoader _enumerateBundles:](self, "_enumerateBundles:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_enumerateBundles:(id)a3
{
  id v4;
  NTKBundleLoader *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NTKBundleLoader *v20;
  id v21;
  NSObject *v22;
  os_unfair_lock_t lock;
  uint64_t v24;
  NSSet *obj;
  void *context;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  kdebug_trace();
  lock = &self->_loaderLock;
  os_unfair_lock_lock(&self->_loaderLock);
  v5 = self->_loader;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_urls;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x1E0C99C18];
    do
    {
      v10 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1BCCA7FA8]();
        _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Looking for face bundles in %@…", buf, 0xCu);
        }

        v38 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v11, "resourceValuesForKeys:error:", v13, &v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v29;

        objc_msgSend(v14, "objectForKey:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if ((objc_msgSend(v16, "BOOLValue") & 1) == 0)
            -[NTKBundleLoader resetCacheForDirectoryURL:](v5, "resetCacheForDirectoryURL:", v11);
        }
        else
        {
          v18 = v9;
          v19 = v8;
          v20 = v5;
          v21 = v4;
          _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v11;
            v36 = 2112;
            v37 = v15;
            _os_log_error_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_ERROR, "Error getting read status for URL %@ - %@", buf, 0x16u);
          }

          v4 = v21;
          v5 = v20;
          v8 = v19;
          v9 = v18;
          v7 = v24;
        }
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __41__NTKFaceBundleLoader__enumerateBundles___block_invoke;
        v27[3] = &unk_1E6BD2EE0;
        v28 = v4;
        -[NTKBundleLoader enumerateBundlesFromDirectoryURL:enumerator:](v5, "enumerateBundlesFromDirectoryURL:enumerator:", v11, v27);

        objc_autoreleasePoolPop(context);
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
  kdebug_trace();

}

- (void)_loadClassesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NTKFaceBundleLoader__loadClassesUsingBlock___block_invoke;
  v6[3] = &unk_1E6BD3A00;
  v7 = v4;
  v5 = v4;
  -[NTKFaceBundleLoader _enumerateBundles:](self, "_enumerateBundles:", v6);

}

- (id)loadLegacyFaceBundleForStyle:(int64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NTKFaceBundleLoader_loadLegacyFaceBundleForStyle___block_invoke;
  v5[3] = &unk_1E6BD3A28;
  v5[4] = &v6;
  v5[5] = a3;
  -[NTKFaceBundleLoader _enumerateBundles:](self, "_enumerateBundles:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__NTKFaceBundleLoader_loadLegacyFaceBundleForStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "infoDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("NTKFaceBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("LegacyStyles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = NTKFaceStyleForString(v10);
          if (v11 != -1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }

  objc_msgSend(v2, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CA8820, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "containsObject:", v15);

  if (v16)
  {
    v27 = v14;
    objc_msgSend(v2, "load");
    v28 = v2;
    NTKFaceBundleClassesFromBundle(v2);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(obj);
          v21 = objc_alloc_init(*(Class *)(*((_QWORD *)&v33 + 1) + 8 * j));
          objc_msgSend(v21, "legacyFaceStyle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v21;

            goto LABEL_24;
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_24:

    v14 = v27;
    v2 = v28;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_cachedFaceBundles, 0);
}

void __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v4, "Skipping %@ - No NSPrincipalClass", (uint8_t *)&v5);

}

void __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Skipping %@ - Unsupported class", (uint8_t *)&v3);
}

@end
