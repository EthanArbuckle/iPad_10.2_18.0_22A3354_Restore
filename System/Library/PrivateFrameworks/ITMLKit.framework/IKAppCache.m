@implementation IKAppCache

- (IKAppCache)initWithApplication:(id)a3
{
  id v4;
  void *v5;
  IKAppCache *v6;
  IKAppCache *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  IKAppCache *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *appCacheQueue;
  NSObject *v22;
  NSObject *v23;
  NSURL *v24;
  NSURL *appJSFileURL;
  void *v26;
  void *v27;
  NSURL *v28;
  NSObject *p_super;
  NSObject *v30;
  _QWORD v32[4];
  id v33;
  objc_super v34;
  id v35;
  char v36;
  uint8_t buf[4];
  IKAppCache *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "appJSCachePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "appLocalJSURL");
    v6 = (IKAppCache *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(v5, "path");
    v7 = (IKAppCache *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v36);

      if ((v9 & 1) != 0)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v35);
      v12 = v35;

      v36 = v11;
      if ((v11 & 1) == 0)
      {
        ITMLKitGetLogObject(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[IKAppCache initWithApplication:].cold.1();

      }
      if (((v11 ^ 1) & 1) == 0)
      {
LABEL_30:
        if (v36)
        {
          v34.receiver = self;
          v34.super_class = (Class)IKAppCache;
          v14 = -[IKAppCache init](&v34, sel_init);
          self = v14;
          if (v14)
          {
            v14->_status = 0;
            objc_storeWeak((id *)&v14->_app, v4);
            self->_shouldIgnoreHTTPCache = 1;
            v15 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.ITML.cache"), v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = objc_retainAutorelease(v18);
            v20 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v19, "cStringUsingEncoding:", 1), 0);
            appCacheQueue = self->_appCacheQueue;
            self->_appCacheQueue = v20;

            v22 = self->_appCacheQueue;
            dispatch_get_global_queue(17, 0);
            v23 = objc_claimAutoreleasedReturnValue();
            dispatch_set_target_queue(v22, v23);

            dispatch_queue_set_specific((dispatch_queue_t)self->_appCacheQueue, "kIKAppCacheQueueTag", self, 0);
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
            v24 = (NSURL *)objc_claimAutoreleasedReturnValue();
            appJSFileURL = self->_appJSFileURL;
            self->_appJSFileURL = v24;

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[IKAppCache path](v6, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v23) = objc_msgSend(v26, "fileExistsAtPath:", v27);

            if ((_DWORD)v23)
            {
              v28 = v6;
              p_super = &self->_appLocalJSFileURL->super;
              self->_appLocalJSFileURL = v28;
            }
            else
            {
              ITMLKitGetLogObject(2);
              p_super = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v6;
                _os_log_impl(&dword_1D95F2000, p_super, OS_LOG_TYPE_INFO, "Bundle JS does not exist at %@", buf, 0xCu);
              }
            }

            ITMLKitGetLogObject(2);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v7;
              _os_log_impl(&dword_1D95F2000, v30, OS_LOG_TYPE_INFO, "Cache created with cache path: %@", buf, 0xCu);
            }

            objc_initWeak((id *)buf, self);
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __34__IKAppCache_initWithApplication___block_invoke;
            v32[3] = &unk_1E9F4BCC8;
            objc_copyWeak(&v33, (id *)buf);
            -[IKAppCache _performAsync:](self, "_performAsync:", v32);
            objc_destroyWeak(&v33);
            objc_destroyWeak((id *)buf);

          }
        }
      }
      self = self;

      v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __34__IKAppCache_initWithApplication___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadManifest");
    WeakRetained = v2;
  }

}

- (BOOL)isOurDispatchQueue
{
  IKAppCache *specific;

  specific = (IKAppCache *)dispatch_get_specific("kIKAppCacheQueueTag");
  return specific && specific == self;
}

- (void)_performAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_appCacheQueue, a3);
}

- (void)appJSURLWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__IKAppCache_appJSURLWithCompletion___block_invoke;
    v5[3] = &unk_1E9F4BCF0;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[IKAppCache _performAsync:](self, "_performAsync:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __37__IKAppCache_appJSURLWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "status");

  if (v4 != 2)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_loadManifest");

  }
  v6 = *(_QWORD *)(a1 + 32);
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "currentAppJSURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "currentAppJSChecksum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v9);

}

- (void)_storeManifest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "IKAppCache manifest.json could not be written to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_loadManifest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "IKAppCache manifest.json could not be parsed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_checkManifest
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D95F2000, v0, v1, "Unable to get file attributes for bundleJS (%@): %@");
  OUTLINED_FUNCTION_3();
}

- (void)refreshWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__IKAppCache_refreshWithCompletion___block_invoke;
  v6[3] = &unk_1E9F4BCF0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IKAppCache _performAsync:](self, "_performAsync:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __36__IKAppCache_refreshWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  IKAppContext *v14;
  IKAppContext *v15;
  _QWORD block[4];
  IKAppContext *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "validationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 2, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

      }
    }
    else
    {
      ITMLKitGetLogObject(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D95F2000, v7, OS_LOG_TYPE_INFO, "Creating validation context for cache refresh...", buf, 2u);
      }

      v8 = MEMORY[0x1DF092410](*(_QWORD *)(a1 + 32));
      v9 = (void *)*((_QWORD *)v3 + 15);
      *((_QWORD *)v3 + 15) = v8;

      objc_msgSend(v3, "app");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "bagBootURLKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      ITMLKitGetLogObject(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (v11)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bagBootURLKey: %@"), v11);
        else
          objc_msgSend(v10, "appJSURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl(&dword_1D95F2000, v12, OS_LOG_TYPE_INFO, "Using %@ for cache refresh validation context...", buf, 0xCu);

      }
      v14 = -[IKAppContext initWithApplication:mode:cache:delegate:]([IKAppContext alloc], "initWithApplication:mode:cache:delegate:", v10, 1000, 0, v3);
      -[IKAppContext setRemoteInspectionEnabled:](v14, "setRemoteInspectionEnabled:", 0);
      objc_storeStrong((id *)v3 + 14, v14);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__IKAppCache_refreshWithCompletion___block_invoke_40;
      block[3] = &unk_1E9F4BD18;
      v17 = v14;
      v15 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __36__IKAppCache_refreshWithCompletion___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)cleanBlobStorageWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__IKAppCache_cleanBlobStorageWithCompletion___block_invoke;
  v6[3] = &unk_1E9F4BD40;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  -[IKAppCache _performAsync:](self, "_performAsync:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __45__IKAppCache_cleanBlobStorageWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "appJSChecksumHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  ITMLKitGetLogObject(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v42 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D95F2000, v6, OS_LOG_TYPE_INFO, "Blob Storage clean of %lu entries requested...", buf, 0xCu);
  }

  v7 = objc_loadWeakRetained(v2);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "validationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v32 = v5;
      v13 = v5;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v36;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v17);
            objc_msgSend(*(id *)(a1 + 32), "appJSFileURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLByAppendingPathComponent:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = objc_msgSend(v22, "fileExistsAtPath:", v21);

            if ((_DWORD)v19)
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 0;
              v24 = objc_msgSend(v23, "removeItemAtPath:error:", v21, &v34);
              v25 = v34;

              if ((v24 & 1) == 0)
              {
                objc_msgSend(v33, "addObject:", v25);
                ITMLKitGetLogObject(2);
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v42 = (uint64_t)v21;
                  v43 = 2112;
                  v44 = v25;
                  _os_log_error_impl(&dword_1D95F2000, v26, OS_LOG_TYPE_ERROR, "Failed to remove %@ when cleaning blob storage: %@", buf, 0x16u);
                }

              }
            }

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v15);
      }

      objc_msgSend(v8, "appJSChecksumHistory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeAllObjects");

      ITMLKitGetLogObject(2);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D95F2000, v28, OS_LOG_TYPE_INFO, "Blob Storage clean completed...", buf, 2u);
      }

      v12 = v33;
      if (*(_QWORD *)(a1 + 40))
      {
        if (objc_msgSend(v33, "count"))
        {
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v39 = CFSTR("IKAppCacheUnderlyingErrorsKey");
          v40 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 0, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v31 = 0;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      v5 = v32;
      goto LABEL_30;
    }
    ITMLKitGetLogObject(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D95F2000, v10, OS_LOG_TYPE_INFO, "Blob Storage clean stopped because of ongoing validation...", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);
LABEL_30:

    }
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  objc_msgSend((id)objc_opt_class(), "_appContextDelegateSelectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IKAppCache;
    v9 = -[IKAppCache respondsToSelector:](&v11, sel_respondsToSelector_, a3);
  }
  return v9 & 1;
}

- (BOOL)appContext:(id)a3 shouldStartWithScript:(id)a4 scriptURL:(id)a5 loadedFromFallback:(BOOL)a6
{
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  -[IKAppCache _validatedChecksumForScript:error:](self, "_validatedChecksumForScript:error:", a4, &v10, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    ITMLKitGetLogObject(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D95F2000, v8, OS_LOG_TYPE_INFO, "Refused start of evaluation for validation context: %@", buf, 0xCu);
    }

  }
  return v6 != 0;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4 validatedJSString:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ITMLKitGetLogObject(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "resolvedBootURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_1D95F2000, v11, OS_LOG_TYPE_INFO, "Validation context succeeded for %@...", buf, 0xCu);

  }
  -[IKAppCache validationCompletionHandler](self, "validationCompletionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__IKAppCache_appContext_didStartWithOptions_validatedJSString___block_invoke;
  v15[3] = &unk_1E9F4BD68;
  v14 = v13;
  v16 = v14;
  objc_copyWeak(&v17, (id *)buf);
  v15[4] = self;
  -[IKAppCache updateCacheWithValidatedJS:completion:](self, "updateCacheWithValidatedJS:completion:", v10, v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

void __63__IKAppCache_appContext_didStartWithOptions_validatedJSString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v12, v5);
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appCache:didUpdateWithChecksum:", *(_QWORD *)(a1 + 32), v12);

    }
  }

}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  ITMLKitGetLogObject(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[IKAppCache appContext:didFailWithError:].cold.1(v6, (uint64_t)v7, v8);

  -[IKAppCache validationCompletionHandler](self, "validationCompletionHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");
  if (v9)
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v7);
  -[IKAppCache _cleanupValidationContext](self, "_cleanupValidationContext");

}

- (void)_cleanupValidationContext
{
  NSObject *v3;
  IKAppContext *validationContext;
  uint8_t v5[16];

  ITMLKitGetLogObject(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D95F2000, v3, OS_LOG_TYPE_INFO, "Cleaning up validation context...", v5, 2u);
  }

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  -[IKAppCache setValidationCompletionHandler:](self, "setValidationCompletionHandler:", 0);
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appContext:evaluateAppJavaScriptInContext:", v10, v6);

  }
}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "appContext:validateDOMDocument:inContext:error:", v10, v11, v12, a6);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)deviceConfigForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceConfigForContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)navigationControllerForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationControllerForContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)tabBarForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabBarForContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)modalControllerForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationControllerForContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectForPlayer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForPlayer:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectForPlaylist:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForPlaylist:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectForMediaItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForMediaItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[IKAppCache appContextDelegate](self, "appContextDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[IKAppCache appContextDelegate](self, "appContextDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appContext:needsReloadWithUrgency:options:", v12, a4, v8);

  }
}

- (id)_validatedChecksumForScript:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _IKStringHash(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppCache appLocalJSChecksum](self, "appLocalJSChecksum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    ITMLKitGetLogObject(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      v10 = "New AppJS checksum matched current appLocalJS checksum: %@";
LABEL_7:
      _os_log_impl(&dword_1D95F2000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    -[IKAppCache appJSChecksum](self, "appJSChecksum");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v6);

    if (!v12)
      return v6;
    ITMLKitGetLogObject(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      v10 = "New AppJS checksum matched currently cached AppJS checksum: %@";
      goto LABEL_7;
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  v6 = 0;
  return v6;
}

- (void)updateCacheWithValidatedJS:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__IKAppCache_updateCacheWithValidatedJS_completion___block_invoke;
  v10[3] = &unk_1E9F4BD90;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[IKAppCache _performAsync:](self, "_performAsync:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__IKAppCache_updateCacheWithValidatedJS_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(WeakRetained, "_validatedChecksumForScript:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v5)
  {
    v7 = objc_loadWeakRetained(v2);
    v8 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    v9 = (id)objc_msgSend(v7, "_cacheFileURLForAppJS:checksum:error:", v8, v5, &v12);
    v10 = v12;

    v6 = v10;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v5, v6);

}

- (id)_cacheFileURLForAppJS:(id)a3 checksum:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    -[IKAppCache appJSFileURL](self, "appJSFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ITMLKitGetLogObject(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v14;
      _os_log_impl(&dword_1D95F2000, v16, OS_LOG_TYPE_INFO, "Writing validated Javascript to %@", buf, 0xCu);
    }

    objc_msgSend(v14, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "writeToFile:atomically:", v17, 1);

    if ((v18 & 1) != 0)
    {
      v33 = v15;
      obj = v14;
      -[IKAppCache appJSChecksum](self, "appJSChecksum");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[IKAppCache appJSChecksumHistory](self, "appJSChecksumHistory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppCache appJSChecksum](self, "appJSChecksum");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v21);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[IKAppCache appJSChecksumHistory](self, "appJSChecksumHistory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (objc_msgSend(v28, "isEqualToString:", v9))
              objc_msgSend(v22, "addObject:", v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v25);
      }

      -[IKAppCache appJSChecksumHistory](self, "appJSChecksumHistory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "removeObjectsInArray:", v22);

      objc_storeStrong((id *)&self->_appJSChecksum, a4);
      v14 = obj;
      objc_storeStrong((id *)&self->_currentAppJSURL, obj);
      objc_storeStrong((id *)&self->_currentAppJSChecksum, a4);
      -[IKAppCache _storeManifest](self, "_storeManifest");
      v30 = obj;

      v15 = v33;
    }
    else
    {
      ITMLKitGetLogObject(2);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[IKAppCache _cacheFileURLForAppJS:checksum:error:].cold.1();

      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 0, 0);
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKAppCacheErrorDomain"), 0, 0);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)_appContextDelegateSelectors
{
  if (_appContextDelegateSelectors_onceToken != -1)
    dispatch_once(&_appContextDelegateSelectors_onceToken, &__block_literal_global_0);
  return (id)_appContextDelegateSelectors_selectors;
}

void __42__IKAppCache__appContextDelegateSelectors__block_invoke()
{
  Protocol *v0;
  objc_method_description *v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  const char **p_name;
  const char *v6;
  void *v7;
  void *v8;
  Protocol *v9;
  objc_method_description *v10;
  unint64_t v11;
  const char **v12;
  const char *v13;
  void *v14;
  void *v15;
  unsigned int outCount;

  outCount = 0;
  objc_getProtocol("IKAppContextDelegate");
  v0 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v1 = protocol_copyMethodDescriptionList(v0, 0, 1, &outCount);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", outCount);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_appContextDelegateSelectors_selectors;
  _appContextDelegateSelectors_selectors = v2;

  if (outCount)
  {
    v4 = 0;
    p_name = &v1->name;
    do
    {
      v6 = *p_name;
      p_name += 2;
      v7 = (void *)_appContextDelegateSelectors_selectors;
      NSStringFromSelector(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      ++v4;
    }
    while (v4 < outCount);
  }
  free(v1);
  objc_getProtocol("IKAppContextDelegate");
  v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v10 = protocol_copyMethodDescriptionList(v9, 1, 1, &outCount);

  if (outCount)
  {
    v11 = 0;
    v12 = &v10->name;
    do
    {
      v13 = *v12;
      v12 += 2;
      v14 = (void *)_appContextDelegateSelectors_selectors;
      NSStringFromSelector(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      ++v11;
    }
    while (v11 < outCount);
  }
  free(v10);
}

- (BOOL)shouldIgnoreHTTPCache
{
  return self->_shouldIgnoreHTTPCache;
}

- (void)setShouldIgnoreHTTPCache:(BOOL)a3
{
  self->_shouldIgnoreHTTPCache = a3;
}

- (IKAppContextDelegate)appContextDelegate
{
  return (IKAppContextDelegate *)objc_loadWeakRetained((id *)&self->_appContextDelegate);
}

- (void)setAppContextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appContextDelegate, a3);
}

- (IKAppCacheDelegate)delegate
{
  return (IKAppCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)currentAppJSURL
{
  return self->_currentAppJSURL;
}

- (NSString)currentAppJSChecksum
{
  return self->_currentAppJSChecksum;
}

- (NSURL)appLocalJSFileURL
{
  return self->_appLocalJSFileURL;
}

- (NSString)appLocalJSChecksum
{
  return self->_appLocalJSChecksum;
}

- (NSURL)appJSFileURL
{
  return self->_appJSFileURL;
}

- (NSString)appJSChecksum
{
  return self->_appJSChecksum;
}

- (NSArray)appJSChecksumHistory
{
  return self->_appJSChecksumHistory;
}

- (IKApplication)app
{
  return (IKApplication *)objc_loadWeakRetained((id *)&self->_app);
}

- (void)setApp:(id)a3
{
  objc_storeWeak((id *)&self->_app, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (IKAppContext)validationContext
{
  return self->_validationContext;
}

- (id)validationCompletionHandler
{
  return self->_validationCompletionHandler;
}

- (void)setValidationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_validationContext, 0);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_appJSChecksumHistory, 0);
  objc_storeStrong((id *)&self->_appJSChecksum, 0);
  objc_storeStrong((id *)&self->_appJSFileURL, 0);
  objc_storeStrong((id *)&self->_appLocalJSChecksum, 0);
  objc_storeStrong((id *)&self->_appLocalJSFileURL, 0);
  objc_storeStrong((id *)&self->_currentAppJSChecksum, 0);
  objc_storeStrong((id *)&self->_currentAppJSURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContextDelegate);
  objc_storeStrong((id *)&self->_appCacheQueue, 0);
}

- (void)initWithApplication:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D95F2000, v0, v1, "IKAppCache directory could not be created at %@: %@");
  OUTLINED_FUNCTION_3();
}

- (void)appContext:(NSObject *)a3 didFailWithError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resolvedBootURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D95F2000, a3, OS_LOG_TYPE_ERROR, "Validation context failed for %@: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_cacheFileURLForAppJS:checksum:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "Unable to write validated Javascript to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
