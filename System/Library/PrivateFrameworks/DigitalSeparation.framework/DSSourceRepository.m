@implementation DSSourceRepository

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSourceRepository");
    v3 = (void *)DSLog_2;
    DSLog_2 = (uint64_t)v2;

  }
}

- (DSSourceRepository)init
{
  DSSourceRepository *v2;
  DSSourceRepository *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DSSourceRepository *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DSSourceRepository;
  v2 = -[DSSourceRepository init](&v11, sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLsForDirectory:inDomains:", 5, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("DigitalSeparation"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("SharingSources"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "repositoryWithURL:", v8);
  v9 = (DSSourceRepository *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (DSSourceRepository)repositoryWithURL:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  DSSourceRepository *v29;
  id v31;
  void *v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v3 = DSLog_2;
  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v31;
    _os_log_impl(&dword_227D24000, v3, OS_LOG_TYPE_INFO, "Searching %{public}@ for sharing sources", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v31, MEMORY[0x24BDBD1A8], 1, &__block_literal_global_4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = DSLog_2;
          if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v9;
            _os_log_impl(&dword_227D24000, v10, OS_LOG_TYPE_INFO, "Found potential source %{public}@", buf, 0xCu);
          }
          v11 = (objc_class *)objc_msgSend(v9, "principalClass");
          v12 = objc_alloc_init(v11);
          if ((objc_msgSend(v12, "conformsToProtocol:", &unk_255928620) & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v13, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              if ((objc_msgSend(a1, "runtimeFeatureFlagsEnabledFor:", v14) & 1) != 0)
              {
                if (+[DSSourceWrapper shouldEnumerateResourceNamesForSource:](DSSourceWrapper, "shouldEnumerateResourceNamesForSource:", v13))
                {
                  +[DSSourceWrapper wrapMultiSource:](DSSourceWrapper, "wrapMultiSource:", v13);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "addEntriesFromDictionary:", v15);

                  v16 = (void *)DSLog_2;
                  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
                  {
                    v17 = v16;
                    objc_msgSend(v13, "name");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v40 = v18;
                    v41 = 2114;
                    v42 = v9;
                    _os_log_impl(&dword_227D24000, v17, OS_LOG_TYPE_DEFAULT, "Adding sharing sub sources %{public}@ from %{public}@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v13, v14);
                  v24 = (void *)DSLog_2;
                  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
                  {
                    v25 = v24;
                    objc_msgSend(v13, "name");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v40 = v26;
                    v41 = 2114;
                    v42 = v9;
                    _os_log_impl(&dword_227D24000, v25, OS_LOG_TYPE_DEFAULT, "Adding sharing source for %{public}@ from %{public}@", buf, 0x16u);

                  }
                }
              }
              else
              {
                v23 = DSLog_2;
                if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v40 = v9;
                  v41 = 2114;
                  v42 = v14;
                  _os_log_error_impl(&dword_227D24000, v23, OS_LOG_TYPE_ERROR, "Runtime feature flags for %{public}@ with name %{public}@ are not enabled, not adding bundle.", buf, 0x16u);
                }
              }
            }
            else
            {
              v20 = (void *)DSLog_2;
              if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
              {
                v21 = v20;
                NSStringFromClass(v11);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v40 = v9;
                v41 = 2114;
                v42 = v22;
                _os_log_error_impl(&dword_227D24000, v21, OS_LOG_TYPE_ERROR, "Source from %{public}@ with class %{public}@ doesn't have a name", buf, 0x16u);

              }
            }

          }
          else
          {
            v19 = (void *)DSLog_2;
            if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
            {
              v27 = v19;
              NSStringFromClass(v11);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v40 = v9;
              v41 = 2114;
              v42 = v28;
              _os_log_error_impl(&dword_227D24000, v27, OS_LOG_TYPE_ERROR, "Found bundle %{public}@ whose principal class %{public}@ does not conform to DSSource", buf, 0x16u);

            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v6);
  }

  v29 = -[DSSourceRepository initWithSources:]([DSSourceRepository alloc], "initWithSources:", v32);
  return v29;
}

uint64_t __40__DSSourceRepository_repositoryWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  v6 = DSLog_2;
  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
    __40__DSSourceRepository_repositoryWithURL___block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);

  return 0;
}

+ (BOOL)runtimeFeatureFlagsEnabledFor:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova")))
    return _os_feature_enabled_impl();
  else
    return 1;
}

- (DSSourceRepository)initWithSources:(id)a3
{
  id v4;
  DSSourceRepository *v5;
  DSSourceRepository *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DSSourceRepository;
  v5 = -[DSSourceRepository init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DSSourceRepository setSourcesByName:](v5, "setSourcesByName:", v4);

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DSSourceRepository sourcesByName](self, "sourcesByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)sources
{
  void *v2;
  void *v3;

  -[DSSourceRepository sourcesByName](self, "sourcesByName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)sourcesByName
{
  return self->_sourcesByName;
}

- (void)setSourcesByName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcesByName, 0);
}

void __40__DSSourceRepository_repositoryWithURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_227D24000, log, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@ because %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
