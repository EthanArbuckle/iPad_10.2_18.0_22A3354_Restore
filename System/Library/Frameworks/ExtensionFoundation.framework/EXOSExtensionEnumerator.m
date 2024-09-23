@implementation EXOSExtensionEnumerator

+ (void)enumerateExtensionsInDirectoryAtURL:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v46[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v7;
  v29 = v5;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v7, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v9;
  v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v33)
  {
    v11 = *(_QWORD *)v39;
    v30 = *(_QWORD *)v39;
    v31 = v10;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v13, "_EX_isDirectory")
          && (objc_msgSend(v13, "pathExtension"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("appex")),
              v14,
              !v15))
        {
          v6[2](v6, v13);
        }
        else if ((objc_msgSend(v13, "_EX_isDirectory") & 1) == 0)
        {
          objc_msgSend(v13, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("appexlist"));

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v13);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "_EX_dictionaryForKey:", CFSTR("AppExtensions"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "allKeys");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            _EXRegistrationLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v44 = v19;
              _os_log_debug_impl(&dword_190C25000, v20, OS_LOG_TYPE_DEBUG, "Discovered list of App Extension paths '%{public}@'", buf, 0xCu);
            }

            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v21 = v19;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v35;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v35 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v26, 1);
                    v27 = objc_claimAutoreleasedReturnValue();
                    v6[2](v6, v27);
                  }
                  else
                  {
                    _EXRegistrationLog();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v44 = v13;
                      _os_log_error_impl(&dword_190C25000, v27, OS_LOG_TYPE_ERROR, "unexpected class for entry in %{public}@ extension list.", buf, 0xCu);
                    }
                  }

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v23);
            }

            v11 = v30;
            v10 = v31;
          }
        }
      }
      v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v33);
  }

}

- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3
{
  return -[EXOSExtensionEnumerator initWithCacheURLs:paths:](self, "initWithCacheURLs:paths:", a3, MEMORY[0x1E0C9AA60]);
}

- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3 paths:(id)a4
{
  id v6;
  id v7;
  EXOSExtensionEnumerator *v8;
  EXOSExtensionEnumerator *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *extensionPaths;
  uint64_t v26;
  NSEnumerator *extensionPathsEnumerator;
  EXOSExtensionEnumerator *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EXOSExtensionEnumerator;
  v8 = -[EXOSExtensionEnumerator init](&v38, sel_init);
  v9 = v8;
  if (v8)
  {
    v29 = v8;
    _EXRegistrationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[EXOSExtensionEnumerator initWithCacheURLs:paths:].cold.1();

    v30 = v7;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v31 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "_EX_isDirectory"))
          {
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke;
            v32[3] = &unk_1E2CFD3C0;
            v33 = v11;
            +[EXOSExtensionEnumerator enumerateExtensionsInDirectoryAtURL:block:](EXOSExtensionEnumerator, "enumerateExtensionsInDirectoryAtURL:block:", v17, v32);
            v18 = v33;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_EX_objectForKey:ofClass:", CFSTR("AppExtensions"), objc_opt_class());
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "allKeys");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            _EXRegistrationLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v40 = v20;
              _os_log_debug_impl(&dword_190C25000, v21, OS_LOG_TYPE_DEBUG, "Discovered cached App Extension paths '%{public}@'", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_337);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "filteredArrayUsingPredicate:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObjectsFromArray:", v23);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v14);
    }

    v24 = objc_msgSend(v11, "copy");
    v9 = v29;
    extensionPaths = v29->_extensionPaths;
    v29->_extensionPaths = (NSArray *)v24;

    -[NSArray objectEnumerator](v29->_extensionPaths, "objectEnumerator");
    v26 = objc_claimAutoreleasedReturnValue();
    extensionPathsEnumerator = v29->_extensionPathsEnumerator;
    v29->_extensionPathsEnumerator = (NSEnumerator *)v26;

    v7 = v30;
    v6 = v31;
  }

  return v9;
}

void __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_cold_1();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

uint64_t __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_335(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("/System/Library/Frameworks")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("/System/Library/PrivateFrameworks")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    _EXRegistrationLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
    }

    v3 = 0;
  }

  return v3;
}

- (id)nextObject
{
  void *v2;
  void *v3;

  -[NSEnumerator nextObject](self->_extensionPathsEnumerator, "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)extensionPaths
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSEnumerator)extensionPathsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPathsEnumerator, 0);
  objc_storeStrong((id *)&self->_extensionPaths, 0);
}

- (void)initWithCacheURLs:paths:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "Looking for caches at URLs: %{public}@ with know paths: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Discovered App Extension at '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
