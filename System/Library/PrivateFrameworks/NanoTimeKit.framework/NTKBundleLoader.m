@implementation NTKBundleLoader

- (id)loadBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int (**v27)(_QWORD, void *);
  void *v28;
  void *v29;
  id v31;
  NTKBundleLoader *v32;
  os_unfair_lock_s *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id obj;
  void *context;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t, void *);
  void *v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundlesByPath, "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (v7)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_5;
      v39[3] = &unk_1E6BD9D70;
      v40 = v7;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v39);

    }
  }
  else
  {
    v32 = self;
    v33 = &self->_lock;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke;
    v50 = &unk_1E6BD9D48;
    v34 = v6;
    v51 = v6;
    v31 = v51;
    objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      v16 = *MEMORY[0x1E0C998E0];
      v17 = *MEMORY[0x1E0CEC470];
      v36 = *MEMORY[0x1E0CEC470];
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
          context = (void *)MEMORY[0x1BCCA7FA8]();
          v41 = 0;
          v42 = 0;
          objc_msgSend(v19, "getResourceValue:forKey:error:", &v42, v16, &v41);
          v20 = v42;
          v21 = v41;
          if (v21)
          {
            _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = v19;
              v54 = 2114;
              v55 = v21;
              _os_log_error_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_ERROR, "Failed to get resource type for fileURL %{public}@ - %{public}@", buf, 0x16u);
            }

          }
          if (objc_msgSend(v20, "conformsToType:", v17))
          {
            v23 = v14;
            v24 = v16;
            v25 = v15;
            v26 = (void *)MEMORY[0x1E0CB34D0];
            objc_msgSend(v19, "path");
            v27 = (unsigned int (**)(_QWORD, void *))v7;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bundleWithPath:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v27;
            if (!v27 || v27[2](v27, v29))
              objc_msgSend(v35, "addObject:", v29);

            v15 = v25;
            v16 = v24;
            v14 = v23;
            v17 = v36;
          }

          objc_autoreleasePoolPop(context);
          ++v18;
        }
        while (v14 != v18);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      }
      while (v14);
    }

    v10 = v35;
    if (objc_msgSend(v35, "count"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](v32->_bundlesByPath, "setObject:forKeyedSubscript:", v35, v31);

    p_lock = v33;
    v6 = v34;
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

void __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1BCCA7FA8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

- (NTKBundleLoader)init
{
  NTKBundleLoader *v2;
  NTKBundleLoader *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *bundlesByPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKBundleLoader;
  v2 = -[NTKBundleLoader init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundlesByPath = v3->_bundlesByPath;
    v3->_bundlesByPath = v4;

  }
  return v3;
}

+ (id)rootDirectory
{
  return &stru_1E6BDC918;
}

- (void)enumerateBundlesFromDirectoryURL:(id)a3 enumerator:(id)a4
{
  id v4;

  v4 = -[NTKBundleLoader loadBundlesFromDirectoryURL:enumerator:](self, "loadBundlesFromDirectoryURL:enumerator:", a3, a4);
}

- (id)bundlesFromDirectoryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    -[NTKBundleLoader loadBundlesFromDirectoryURL:enumerator:](self, "loadBundlesFromDirectoryURL:enumerator:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Folder does not exist at path %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

uint64_t __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  return 1;
}

- (void)resetCacheForDirectoryURL:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundlesByPath, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)bundlesByPath
{
  return self->_bundlesByPath;
}

- (void)setBundlesByPath:(id)a3
{
  objc_storeStrong((id *)&self->_bundlesByPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlesByPath, 0);
}

void __58__NTKBundleLoader_loadBundlesFromDirectoryURL_enumerator___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Failed to list files from directory %{public}@ - %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
