@implementation CPLConfiguration

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 configurationURL:(id)a4 minUpdateInterval:(double)a5 updateIntervalKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  CPLConfiguration *v13;
  void *v14;
  uint64_t v15;
  NSURL *configurationFileURL;
  uint64_t v17;
  NSURL *configurationURL;
  dispatch_queue_t v19;
  OS_dispatch_queue *lock;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CPLConfiguration;
  v13 = -[CPLConfiguration init](&v22, sel_init);
  if (v13)
  {
    objc_msgSend(v11, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    configurationFileURL = v13->_configurationFileURL;
    v13->_configurationFileURL = (NSURL *)v15;

    v17 = objc_msgSend(v11, "copy");
    configurationURL = v13->_configurationURL;
    v13->_configurationURL = (NSURL *)v17;

    v19 = dispatch_queue_create("com.apple.cpl.configuration", 0);
    lock = v13->_lock;
    v13->_lock = (OS_dispatch_queue *)v19;

    v13->_minUpdateInterval = a5;
    objc_storeStrong((id *)&v13->_updateIntervalKey, a6);

  }
  return v13;
}

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 minUpdateInterval:(double)a4 updateIntervalKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CPLConfiguration *v11;

  v8 = a5;
  v9 = a3;
  _CPLConfigurationDefaultURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CPLConfiguration initWithClientLibraryBaseURL:configurationURL:minUpdateInterval:updateIntervalKey:](self, "initWithClientLibraryBaseURL:configurationURL:minUpdateInterval:updateIntervalKey:", v9, v10, v8, a4);

  return v11;
}

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3
{
  return -[CPLConfiguration initWithClientLibraryBaseURL:minUpdateInterval:updateIntervalKey:](self, "initWithClientLibraryBaseURL:minUpdateInterval:updateIntervalKey:", a3, CFSTR("refresh.interval.seconds"), 43200.0);
}

- (NSURL)clientLibraryBaseURL
{
  return -[NSURL URLByDeletingLastPathComponent](self->_configurationFileURL, "URLByDeletingLastPathComponent");
}

- (void)disableConfigurationFetching
{
  self->_disableConfigurationFetching = 1;
}

- (void)check
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__CPLConfiguration_check__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_8710;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5
{
  NSObject *lock;
  CPLConfigurationFetcher *v8;
  CPLConfigurationFetcher *configurationFetcher;
  CPLConfigurationFetcher *v10;
  id v11;

  v11 = a4;
  lock = self->_lock;
  v8 = (CPLConfigurationFetcher *)a3;
  dispatch_assert_queue_V2(lock);
  configurationFetcher = self->_configurationFetcher;

  if (configurationFetcher == v8)
  {
    -[CPLConfiguration _updateConfigurationDictionary:](self, "_updateConfigurationDictionary:", v11);
    v10 = self->_configurationFetcher;
    self->_configurationFetcher = 0;

  }
}

- (void)_save
{
  void *v3;
  CPLConfigurationDictionary *configurationDictionary;
  NSURL *configurationFileURL;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLConfigurationDictionary lastUpdateDate](self->_configurationDictionary, "lastUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    configurationDictionary = self->_configurationDictionary;
    configurationFileURL = self->_configurationFileURL;
    v15 = 0;
    v6 = -[CPLConfigurationDictionary writeToURL:error:](configurationDictionary, "writeToURL:error:", configurationFileURL, &v15);
    v7 = v15;
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLConfigurationOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL path](self->_configurationFileURL, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          v10 = "Wrote configuration to %@";
          v11 = v8;
          v12 = OS_LOG_TYPE_DEFAULT;
          v13 = 12;
LABEL_12:
          _os_log_impl(&dword_1B03C2000, v11, v12, v10, buf, v13);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLConfigurationOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](self->_configurationFileURL, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v7;
        v10 = "Failed to write configuration to %@: %@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 22;
        goto LABEL_12;
      }
LABEL_13:

    }
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLConfigurationOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NSURL path](self->_configurationFileURL, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Not saving built-in configuration to %@", buf, 0xCu);

    }
  }

}

- (void)_load
{
  uint64_t v3;
  CPLConfigurationDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  CPLConfigurationDictionary *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v3 = (uint64_t)self;
  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!*(_QWORD *)(v3 + 8))
  {
    v4 = [CPLConfigurationDictionary alloc];
    v5 = *(_QWORD *)(v3 + 16);
    v6 = *(_QWORD *)(v3 + 72);
    v7 = *(double *)(v3 + 64);
    v33 = 0;
    v8 = -[CPLConfigurationDictionary initWithContentsOfURL:refreshIntervalKey:minRefreshInterval:error:](v4, "initWithContentsOfURL:refreshIntervalKey:minRefreshInterval:error:", v5, v6, &v33, v7);
    v9 = v33;
    v10 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v8;

    if (*(_QWORD *)(v3 + 8))
    {
      v11 = *(_QWORD *)(v3 + 80);
      if (v11)
      {
        (*(void (**)(void))(v11 + 16))();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(v3 + 8);
        *(_QWORD *)(v3 + 8) = v12;

        if (!*(_QWORD *)(v3 + 8))
        {
          if (!_CPLSilentLogging)
          {
            __CPLGenericOSLogDomain();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Uniquifying configuration dictionary returned a nil value", buf, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfiguration.m");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, v32, 210, CFSTR("Uniquifying configuration dictionary returned a nil value"));

          abort();
        }
      }
      if (_CPLSilentLogging)
        goto LABEL_24;
      __CPLConfigurationOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(v3 + 8);
        objc_msgSend(*(id *)(v3 + 16), "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v3 + 8), "lastUpdateDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(*(id *)(v3 + 8), "lastUpdateDate");
          v3 = objc_claimAutoreleasedReturnValue();
          +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v3, 0);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = CFSTR("never");
        }
        *(_DWORD *)buf = 134218498;
        v35 = v15;
        v36 = 2112;
        v37 = v16;
        v38 = 2114;
        v39 = v18;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Loaded configuration %p at %@. Last update was %{public}@", buf, 0x20u);
        if (v17)
        {

        }
      }
LABEL_23:

LABEL_24:
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "cplIsFileDoesNotExistError:", v9);

    if (v20)
    {
      if (!_CPLSilentLogging)
      {
        __CPLConfigurationOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(v3 + 16), "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v22;
          v23 = "Configuration does not exist at %@ - will use built-in one";
          v24 = v21;
          v25 = OS_LOG_TYPE_DEFAULT;
          v26 = 12;
LABEL_16:
          _os_log_impl(&dword_1B03C2000, v24, v25, v23, buf, v26);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLConfigurationOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v3 + 16), "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v22;
        v36 = 2112;
        v37 = v9;
        v23 = "Failed to load saved configuration at %@ - will use built-in one: %@";
        v24 = v21;
        v25 = OS_LOG_TYPE_ERROR;
        v26 = 22;
        goto LABEL_16;
      }
LABEL_17:

    }
    v27 = [CPLConfigurationDictionary alloc];
    objc_msgSend(*(id *)(v3 + 56), "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    v28 = -[CPLConfigurationDictionary initWithConfigurationName:refreshIntervalKey:minRefreshInterval:](v27, "initWithConfigurationName:refreshIntervalKey:minRefreshInterval:", v14, *(_QWORD *)(v3 + 72), *(double *)(v3 + 64));
    v29 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v28;

    goto LABEL_23;
  }
}

- (void)_updateConfigurationDictionary:(id)a3
{
  id v4;
  void *v5;
  void (**configurationDictionaryUniquifier)(id, id);
  CPLConfigurationDictionary *v7;
  CPLConfigurationDictionary *configurationDictionary;
  NSObject *v9;
  CPLConfigurationDictionary *v10;
  void *v11;
  __CFString *v12;
  int v13;
  CPLConfigurationDictionary *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLConfigurationDictionary lastUpdateDate](self->_configurationDictionary, "lastUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  configurationDictionaryUniquifier = (void (**)(id, id))self->_configurationDictionaryUniquifier;
  if (configurationDictionaryUniquifier)
  {
    configurationDictionaryUniquifier[2](configurationDictionaryUniquifier, v4);
    v7 = (CPLConfigurationDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (CPLConfigurationDictionary *)v4;
  }
  configurationDictionary = self->_configurationDictionary;
  self->_configurationDictionary = v7;

  if (!_CPLSilentLogging)
  {
    __CPLConfigurationOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_configurationDictionary;
      -[NSURL path](self->_configurationFileURL, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v5, 0);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("never");
      }
      v13 = 134218498;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Updated configuration %p at %@. Last update was %{public}@", (uint8_t *)&v13, 0x20u);
      if (v5)

    }
  }
  -[CPLConfiguration _save](self, "_save");

}

- (CPLConfigurationDictionary)configurationDictionary
{
  NSObject *lock;
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
  v9 = __Block_byref_object_copy__8628;
  v10 = __Block_byref_object_dispose__8629;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CPLConfiguration_configurationDictionary__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CPLConfigurationDictionary *)v3;
}

- (void)updateConfigurationDictionary:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CPLConfiguration_updateConfigurationDictionary___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (void)refetchFromDisk
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CPLConfiguration_refetchFromDisk__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_8710;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (id)valueForKey:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8628;
  v16 = __Block_byref_object_dispose__8629;
  v17 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CPLConfiguration_valueForKey___block_invoke;
  block[3] = &unk_1E60DC8F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(lock, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *lock;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__CPLConfiguration_setValue_forKey___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v7;
  v17 = v6;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_8710;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = lock;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)invalidate
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CPLConfiguration_invalidate__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (NSDate)lastUpdateDate
{
  void *v2;
  void *v3;

  -[CPLConfiguration configurationDictionary](self, "configurationDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (double)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (NSString)updateIntervalKey
{
  return self->_updateIntervalKey;
}

- (id)configurationDictionaryUniquifier
{
  return self->_configurationDictionaryUniquifier;
}

- (void)setConfigurationDictionaryUniquifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationDictionaryUniquifier, 0);
  objc_storeStrong((id *)&self->_updateIntervalKey, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_configurationFetcher, 0);
  objc_storeStrong((id *)&self->_configurationFileURL, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

void __30__CPLConfiguration_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void __36__CPLConfiguration_setValue_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_load");
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyConfigurationDictionaryWithUpdatedKey:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationDictionary:", v2);

}

void __32__CPLConfiguration_valueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_load");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35__CPLConfiguration_refetchFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

uint64_t __50__CPLConfiguration_updateConfigurationDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationDictionary:", *(_QWORD *)(a1 + 40));
}

void __43__CPLConfiguration_configurationDictionary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_load");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __25__CPLConfiguration_check__block_invoke(uint64_t a1)
{
  uint64_t result;
  CPLConfigurationFetcher *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 48) && !*(_QWORD *)(result + 80))
  {
    objc_msgSend((id)result, "_load");
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isStale");
    if ((_DWORD)result)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
      {
        v3 = -[CPLConfigurationFetcher initWithConfigurationURL:delegate:queue:]([CPLConfigurationFetcher alloc], "initWithConfigurationURL:delegate:queue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(void **)(v4 + 32);
        *(_QWORD *)(v4 + 32) = v3;

      }
      if (!_CPLSilentLogging)
      {
        __CPLConfigurationOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "path");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Configuration at %@ will be fetched now", (uint8_t *)&v8, 0xCu);

        }
      }
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "fetchConfigurationDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    }
  }
  return result;
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  void *v2;
  BOOL v3;

  -[CPLConfiguration valueForKey:](self, "valueForKey:", CFSTR("over-quota.local-conflict-resolution"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = !v2 || (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v2, "integerValue") == 1;

  return v3;
}

- (void)setAllowsLocalConflictResolutionWhenOverQuota:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CPLConfiguration setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("over-quota.local-conflict-resolution"));

}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CPLConfiguration valueForKey:](self, "valueForKey:", CFSTR("max.num.computeStatesToUploadPerBatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 350;

  return v4;
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  void *v2;
  BOOL v3;

  -[CPLConfiguration valueForKey:](self, "valueForKey:", CFSTR("compute-state.upload-task"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") < 2;

  return v3;
}

- (void)setIsComputeStateTaskUploadEnabled:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CPLConfiguration setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("compute-state.upload-task"));

}

- (BOOL)allowsLocalConflictResolution
{
  return 0;
}

@end
