@implementation CPLConfigurationFetcher

- (CPLConfigurationFetcher)initWithConfigurationURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLConfigurationFetcher *v11;
  uint64_t v12;
  NSURL *configurationURL;
  NSMutableArray *v14;
  NSMutableArray *completionHandlers;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPLConfigurationFetcher;
  v11 = -[CPLConfigurationFetcher init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    configurationURL = v11->_configurationURL;
    v11->_configurationURL = (NSURL *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v14;

  }
  return v11;
}

- (void)fetchConfigurationDictionary:(id)a3
{
  -[CPLConfigurationFetcher fetchConfigurationDictionary:completionHandler:](self, "fetchConfigurationDictionary:completionHandler:", a3, 0);
}

- (void)_updateConfigurationWithFetchData:(id)a3 fetchError:(id)a4 fetchURL:(id)a5 fromConfigurationDictionary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  CPLConfigurationDictionary *v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  id WeakRetained;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v11)
  {
    if (_CPLSilentLogging)
      goto LABEL_25;
    __CPLConfigurationOSLogDomain_17006();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    v40 = 2112;
    v41 = v11;
    v15 = "Could not fetch configuration from %{public}@. Will retry later: %@";
    v16 = v14;
    v17 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_5;
  }
  if (v10)
  {
    v18 = [CPLConfigurationDictionary alloc];
    objc_msgSend(v13, "refreshIntervalKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minRefreshInterval");
    v36 = 0;
    v20 = -[CPLConfigurationDictionary initWithData:refreshIntervalKey:minRefreshInterval:error:](v18, "initWithData:refreshIntervalKey:minRefreshInterval:error:", v10, v19, &v36);
    v14 = v36;

    if (v20)
    {
      v21 = -[NSObject matchesConfigurationDictionary:](v20, "matchesConfigurationDictionary:", v13);
      if (v21)
      {
        v22 = objc_msgSend(v13, "copyConfigurationDictionaryWithUpdatedDate");

        v20 = v22;
      }
      v23 = v21 ^ 1u;
      if (!_CPLSilentLogging)
      {
        __CPLConfigurationOSLogDomain_17006();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = CFSTR("configuration has changed");
          if (v21)
            v25 = CFSTR("configuration has not changed");
          *(_DWORD *)buf = 138543618;
          v39 = v12;
          v40 = 2112;
          v41 = (id)v25;
          _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "Fetched configuration from %{public}@ successfully - %@", buf, 0x16u);
        }

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "configurationFetcher:didUpdateConfigurationDictionary:configurationHasChanged:", self, v20, v23);

    }
    else
    {
      if (_CPLSilentLogging)
        goto LABEL_24;
      __CPLConfigurationOSLogDomain_17006();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v12;
        v40 = 2112;
        v41 = v14;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Fetched configuration from %{public}@ is invalid. Will retry later: %@", buf, 0x16u);
      }
    }

    goto LABEL_24;
  }
  if (_CPLSilentLogging)
    goto LABEL_25;
  __CPLConfigurationOSLogDomain_17006();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    v40 = 2112;
    v41 = 0;
    v15 = "Fetched configuration from %{public}@ is empty. Will retry later: %@";
    v16 = v14;
    v17 = OS_LOG_TYPE_ERROR;
LABEL_5:
    _os_log_impl(&dword_1B03C2000, v16, v17, v15, buf, 0x16u);
  }
LABEL_24:

LABEL_25:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self->_completionHandlers;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v29);
  }

  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects", (_QWORD)v32);
}

- (void)fetchConfigurationDictionary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke;
  v15[3] = &unk_1E60DC4C0;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16992;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)invalidate
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CPLConfigurationFetcher_invalidate__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16992;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (CPLConfigurationFetcherDelegate)delegate
{
  return (CPLConfigurationFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

uint64_t __37__CPLConfigurationFetcher_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidateAndCancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects", (_QWORD)v10);
}

void __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v1 = (id *)a1;
  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = (void *)MEMORY[0x1B5E08DC4]();
    objc_msgSend(v2, "addObject:", v3);

  }
  if (!*((_QWORD *)v1[4] + 1))
  {
    if (os_variant_has_internal_content())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringForKey:", CFSTR("CPLLocalConfigurationPrefix"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5
        && (objc_msgSend(v5, "hasPrefix:", CFSTR(".")) & 1) == 0
        && objc_msgSend(v5, "rangeOfString:", CFSTR("/")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*((id *)v1[4] + 3), "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v5, v7);

        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/AppleInternal/Library/Photos/Backend/CPL/LocalConfigurations"), 1);
        objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v10, 1, &v24);
        v12 = v24;
        objc_msgSend(v1[4], "_updateConfigurationWithFetchData:fetchError:fetchURL:fromConfigurationDictionary:", v11, v12, v10, v1[5]);

LABEL_20:
        return;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", *((_QWORD *)v1[4] + 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v1[4] + 1, v13);
    v14 = v1[4];
    v15 = (void *)v14[1];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_2;
    v21[3] = &unk_1E60DC498;
    v21[4] = v14;
    v9 = v13;
    v22 = v9;
    v23 = v1[5];
    objc_msgSend(v15, "dataTaskWithRequest:completionHandler:", v5, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");
    if (!_CPLSilentLogging)
    {
      __CPLConfigurationOSLogDomain_17006();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *((_QWORD *)v1[4] + 3);
        objc_msgSend(v1[5], "lastUpdateDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v1[5], "lastUpdateDate");
          v1 = (id *)objc_claimAutoreleasedReturnValue();
          +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v1, 0);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = CFSTR("never");
        }
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Updating configuration from %{public}@ - last update: %@", buf, 0x16u);
        if (v19)
        {

        }
      }

    }
    goto LABEL_20;
  }
}

void __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60D6F38;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v12;
  v21 = v6;
  v22 = v7;
  v23 = *(id *)(a1 + 48);
  v13 = v18;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16992;
  block[3] = &unk_1E60D71F8;
  v25 = v13;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

uint64_t __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_3(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v1 == *(void **)(v2 + 8))
  {
    v3 = result;
    *(_QWORD *)(v2 + 8) = 0;

    return objc_msgSend(*(id *)(v3 + 40), "_updateConfigurationWithFetchData:fetchError:fetchURL:fromConfigurationDictionary:", *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(*(_QWORD *)(v3 + 40) + 24), *(_QWORD *)(v3 + 64));
  }
  return result;
}

@end
