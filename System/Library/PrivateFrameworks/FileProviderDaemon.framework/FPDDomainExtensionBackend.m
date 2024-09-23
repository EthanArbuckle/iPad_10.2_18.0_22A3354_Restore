@implementation FPDDomainExtensionBackend

- (NSArray)rootURLs
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "extensionStorageURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  *a3 = 0;
  return -[FPDDomainExtensionBackend rootURLs](self, "rootURLs");
}

- (NSData)backingStoreIdentity
{
  return 0;
}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  return 1;
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2_cold_1(a1, v10, v12);

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CAACE8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enumerator %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithConnection:protocol:orError:name:requestPid:", v5, &unk_1EFBBBA70, 0, v9, 0);

    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 48), "registerLifetimeExtensionForObject:");
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v11();

}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "enumeratedItemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ only enumerating items is supported"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomainExtensionBackend enumerateWithSettings:lifetimeExtender:observer:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainExtensionBackend.m", 585, (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 48), "requestEffectivePID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "newFileProviderProxyWithRequest:", v13);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "nsfpRequest:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2;
    v21[3] = &unk_1E8C75B60;
    v22 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 48);
    v24 = v12;
    objc_msgSend(v14, "fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:", v16, v15, v17, v21);

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 64);
    FPDomainUnavailableError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v13);
  }

}

- (id)nsfpRequest:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "nsfpRequestForSession:isSpeculative:", v6, 0);
  else
    objc_msgSend(MEMORY[0x1E0CAAD30], "requestFromTheSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)newFileProviderProxyWithTimeoutValue:(double)a3 request:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", objc_msgSend(v6, "pid"), a3);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CAACE8]);
    FPDomainUnavailableError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBB940, v11, CFSTR("invalidated extension"), objc_msgSend(v6, "pid"));

  }
  return v9;
}

- (id)newFileProviderProxyWithRequest:(id)a3
{
  return -[FPDDomainExtensionBackend newFileProviderProxyWithTimeoutValue:request:](self, "newFileProviderProxyWithTimeoutValue:request:", a3, 180.0);
}

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18 = a6;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v18;
  v15 = v9;
  fp_dispatch_async_with_logs();

}

- (FPDDomainExtensionBackend)initWithDomain:(id)a3
{
  id v4;
  FPDDomainExtensionBackend *v5;
  FPDDomainExtensionBackend *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_workloop_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMutableDictionary *provideFileCompletionsByURL;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FPDDomainExtensionBackend;
  v5 = -[FPDDomainExtensionBackend init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_domain, v4);
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v7;
    objc_msgSend(v4, "providerDomainID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_obfuscatedProviderDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("extension backend: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = dispatch_workloop_create((const char *)objc_msgSend(v13, "UTF8String"));
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    provideFileCompletionsByURL = v6->_provideFileCompletionsByURL;
    v6->_provideFileCompletionsByURL = (NSMutableDictionary *)v16;

  }
  return v6;
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (void)invalidate
{
  __assert_rtn("-[FPDDomainExtensionBackend invalidate]", "FPDDomainExtensionBackend.m", 89, "_domain.serialQueue");
}

void __39__FPDDomainExtensionBackend_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "fp_shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_INFO, "[INFO] ❌  Cancelling request for %@ due to invalidation", buf, 0xCu);

  }
  FPUserCancelledError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "objectEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (NSFileProviderDomainVersion)domainVersion
{
  return 0;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  if (v8
    && (objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory"),
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v9, "fp_realpathURL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v9,
        LOBYTE(v9) = objc_msgSend(v4, "fp_matchesApplicationContainerURL:", v10),
        v10,
        (v9 & 1) != 0))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    -[FPDDomainExtensionBackend coordinationRootURLs](self, "coordinationRootURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = v13;
    v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v15 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v14);
          if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "fp_realPathRelationshipToItemAtRealPathURL:", v4, (_QWORD)v18) < 2)
          {
            LOBYTE(v11) = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v11;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  if (a5)
  {
    FPNotSupportedError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)needsRootsCreation
{
  return 0;
}

- (BOOL)isDeadEndBackend
{
  return 0;
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v11 = a4;
  v12 = v7;
  v13 = a5;
  v8 = v13;
  v9 = v7;
  v10 = v11;
  fp_dispatch_async_with_logs();

}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v11 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_150;
  v14[3] = &unk_1E8C758B8;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 32);
  v15 = v12;
  v16 = v13;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v10, "itemForURL:completionHandler:", v12, v14);

}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v12 = a5;
  v13 = v8;
  v14 = a6;
  v9 = v14;
  v10 = v8;
  v11 = v12;
  fp_dispatch_async_with_logs();

}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v11 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_153;
  v14[3] = &unk_1E8C758E0;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 32);
  v15 = v12;
  v16 = v13;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v10, "identifierForItemAtURL:completionHandler:", v12, v14);

}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)_cancelProvidingItemAtURL:(id)a3 withKey:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_provideFileCompletionsByURL, "objectForKeyedSubscript:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v9);
  v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:].cold.1(v8, v26);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v22)[2](v22, v23);

  objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v9);
  if (!objc_msgSend(v21, "count"))
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:].cold.2();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_provideFileCompletionsByURL, "setObject:forKeyedSubscript:", 0, v8);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke;
    v27[3] = &unk_1E8C75908;
    v28 = v8;
    v25 = -[FPDDomainExtensionBackend evictItemAtURL:evictionReason:request:completionHandler:](self, "evictItemAtURL:evictionReason:request:completionHandler:", v28, 3, v10, v27);
    v26 = v28;
LABEL_10:

  }
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_1(a1, v6);
  }

}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  void (**v11)(id, NSObject *);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  id v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  id v62;
  id v63;
  id v64;
  NSObject *queue;
  _QWORD v66[4];
  NSObject *v67;
  id v68;
  id v69;
  FPDDomainExtensionBackend *v70;
  SEL v71;
  _QWORD v72[4];
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _BYTE buf[12];
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v62 = a4;
  v63 = a6;
  v11 = (void (**)(id, NSObject *))a7;
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);

  if (self->_invalidated)
  {
    FPUserCancelledError();
    queue = objc_claimAutoreleasedReturnValue();
    v11[2](v11, queue);
    v20 = 0;
    goto LABEL_29;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "serialQueue");
  queue = objc_claimAutoreleasedReturnValue();

  v22 = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(v22, "log");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentPersona");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = 0;
  objc_msgSend(v59, "userPersonaUniqueString");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_loadWeakRetained((id *)&self->_domain);
  -[NSObject nsDomain](v24, "nsDomain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "personaIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60 == v26)
  {

    v56 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v27 = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(v27, "nsDomain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "personaIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v60, "isEqualToString:", v29);

  if ((v30 & 1) == 0 && voucher_process_can_use_arbitrary_personas())
  {
    v79 = 0;
    v31 = (void *)objc_msgSend(v59, "copyCurrentPersonaContextWithError:", &v79);
    v32 = v79;
    v33 = v80;
    v80 = v31;

    if (v32)
    {
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

    }
    v35 = objc_loadWeakRetained((id *)&self->_domain);
    objc_msgSend(v35, "nsDomain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "personaIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "generateAndRestorePersonaContextWithPersonaUniqueString:", v37);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_loadWeakRetained((id *)&self->_domain);
        objc_msgSend(v38, "nsDomain");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "personaIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v40;
        v82 = 2112;
        v83 = v56;
        _os_log_error_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

      }
      goto LABEL_17;
    }
  }
  v56 = 0;
LABEL_18:
  dispatch_assert_queue_V2(queue);
  if (a5 >> 29)
  {
    v11[2](v11, 0);
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_provideFileCompletionsByURL, "objectForKeyedSubscript:", v64);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");
    if (!v42)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_provideFileCompletionsByURL, "setObject:forKeyedSubscript:", v42, v64);
    }
    v44 = (void *)MEMORY[0x1D17D1C84](v11);
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, v41);

    objc_msgSend(v20, "setCancellable:", 1);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v45 = MEMORY[0x1E0C809B0];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke;
    v72[3] = &unk_1E8C75958;
    objc_copyWeak(&v78, (id *)buf);
    v46 = queue;
    v73 = v46;
    v47 = v57;
    v74 = v47;
    v48 = v64;
    v75 = v48;
    v55 = v41;
    v76 = v55;
    v49 = v63;
    v77 = v49;
    objc_msgSend(v20, "setCancellationHandler:", v72);
    if (v43)
    {
      fp_current_or_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.1();

      v51 = v20;
    }
    else
    {
      v52 = -[FPDDomainExtensionBackend newFileProviderProxyWithTimeoutValue:request:](self, "newFileProviderProxyWithTimeoutValue:request:", v49, -1.0);
      v66[0] = v45;
      v66[1] = 3221225472;
      v66[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_159;
      v66[3] = &unk_1E8C759A8;
      v67 = v46;
      v68 = v47;
      v69 = v48;
      v70 = self;
      v71 = a2;
      objc_msgSend(v52, "startProvidingItemAtURL:readingOptions:completionHandler:", v69, a5, v66);

      v53 = v20;
    }

    objc_destroyWeak(&v78);
    objc_destroyWeak((id *)buf);

  }
  _FPRestorePersona();

LABEL_29:
  return v20;
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2;
  block[3] = &unk_1E8C75930;
  v3 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v4 = WeakRetained;
  dispatch_async(v3, block);

}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  fpfs_adopt_log();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_cancelProvidingItemAtURL:withKey:request:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  __fp_pop_log();

}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160;
  block[3] = &unk_1E8C75980;
  v4 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v12 = v6;
  v13 = v3;
  v14 = v7;
  v8 = v3;
  dispatch_async(v4, block);

}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t section;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_5(v3, (uint64_t)v27, section, v2);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v5 = WeakRetained == 0;

  if (v5)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_2();

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Should not have any open requests"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainExtensionBackend.m", 368, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
      if (*(_QWORD *)(a1 + 56))
      {
        fp_current_or_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "fp_prettyDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_4(v8, v9, (uint64_t)buf, v7);
        }
      }
      else
      {
        fp_current_or_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] ✅ item %@ provided", buf, 0xCu);

        }
      }

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v6, "objectEnumerator", 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 16))();
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v15);
      }
    }
    else
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_3();
    }

  }
  __fp_leave_section_Debug();
  __fp_pop_log();

}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)a9
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v11 = a3;
  v12 = a5;
  v17 = a8;
  v18 = v12;
  v19 = a9;
  v13 = v19;
  v14 = v12;
  v15 = v11;
  v16 = v17;
  fp_dispatch_async_with_logs();

}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithTimeoutValue:request:", *(_QWORD *)(a1 + 40), -1.0);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "nsfpRequest:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(unsigned __int8 *)(a1 + 88);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165;
  v18[3] = &unk_1E8C759D0;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 64);
  v17 = (id)objc_msgSend(v10, "createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:", v11, v13, v12, v14, v15, v16, v18);

}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;

  v8 = a2;
  v9 = a6;
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165_cold_2();

    v12 = *(_QWORD *)(a1 + 40);
    FPPluginOperationFailedError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  v13 = a5;
  v14 = v8;
  v15 = a6;
  v9 = v15;
  v10 = v8;
  v11 = v13;
  fp_dispatch_async_with_logs();

  return 0;
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithTimeoutValue:request:", *(_QWORD *)(a1 + 40), -1.0);
  v11 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167;
  v12[3] = &unk_1E8C75A20;
  v13 = v11;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v10, "evictItemAtURL:completionHandler:", v13, v12);

}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167_cold_2();

    v9 = *(_QWORD *)(a1 + 40);
    FPPluginOperationFailedError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167_cold_1(a1, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v12 = a5;
  v13 = a6;
  v9 = v13;
  v10 = v12;
  v11 = v8;
  fp_dispatch_async_with_logs();

}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_168;
  v15[3] = &unk_1E8C75A70;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v13;
  v15[4] = v14;
  v18 = *(_DWORD *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v10, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v11, 0, 1, 0, v12, v15);

}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_168(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2 || !a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(a3, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned int *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_2;
    v9[3] = &unk_1E8C75A48;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v8 = (id)objc_msgSend(v4, "evictItemAtURL:evictionReason:request:completionHandler:", v5, v6, v7, v9);

  }
}

uint64_t __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  FPNotSupportedError();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)itemChangedAtURL:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v5;
  v7 = v8;
  fp_dispatch_async_with_logs();

}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v11 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_170;
  v12[3] = &unk_1E8C75AC0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  objc_msgSend(v10, "itemChangedAtURL:completionHandler:", v13, v12);

}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_170_cold_1(a1, v3, v4);

  }
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v10 = a3;
  v14 = a7;
  v15 = a8;
  v11 = v15;
  v12 = v10;
  v13 = v14;
  fp_dispatch_async_with_logs();

}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v11 = *(void **)(a1 + 48);
  v12 = *(unsigned __int8 *)(a1 + 64);
  v13 = *(unsigned __int8 *)(a1 + 65);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_171;
  v16[3] = &unk_1E8C75AE8;
  v14 = v11;
  v15 = *(_QWORD *)(a1 + 32);
  v17 = v14;
  v18 = v15;
  v19 = *(id *)(a1 + 56);
  objc_msgSend(v10, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v14, v12, v13, v16);

}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_171(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_171_cold_2(a1, v9, v11);

    v12 = *(_QWORD *)(a1 + 48);
    FPPluginOperationFailedError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v12 + 16))(v12, v13, 0, 0);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_171_cold_1(v7, a1, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = a3;
  v13 = a6;
  v14 = v9;
  v15 = a7;
  v10 = v15;
  v11 = v9;
  v12 = v13;
  fp_dispatch_async_with_logs();

}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "nsfpRequest:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_173;
  v15[3] = &unk_1E8C75B38;
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 32);
  v16 = v13;
  v17 = v14;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v10, "itemForItemID:request:completionHandler:", v11, v12, v15);

}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  id WeakRetained;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (a4)
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple."));

  if ((v16 & 1) == 0)
  {
LABEL_4:
    v12[2](v12, 0);
  }
  else
  {
    v17 = v11;
    v18 = v10;
    v19 = v12;
    fp_dispatch_async_with_logs();

  }
}

void __86__FPDDomainExtensionBackend_dumpStateTo_limitNumberOfItems_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithTimeoutValue:request:", *(_QWORD *)(a1 + 40), 10.0);
  v2 = *(_QWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dumpInternalStateToTermDumper:domainIdentifier:completionHandler:", v2, v4, *(_QWORD *)(a1 + 56));

}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FPDDomainExtensionBackend *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke;
  v18[3] = &unk_1E8C75C00;
  v22 = v10;
  v23 = v13;
  v19 = v11;
  v20 = self;
  v21 = v12;
  v14 = v10;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  -[FPDDomainExtensionBackend itemIDForURL:requireProviderItemID:request:completionHandler:](self, "itemIDForURL:requireProviderItemID:request:completionHandler:", v17, 0, v15, v18);

}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = a1[6];
    v9 = a1[7];
    v10 = v5;
    v11 = a1[8];
    fp_dispatch_async_with_logs();

  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_cold_1();

    (*((void (**)(void))a1[8] + 2))();
  }

}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_240(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2;
  v7[3] = &unk_1E8C75BB0;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "valuesForAttributes:forItemID:completionHandler:", v4, v5, v7);

}

- (void)stateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  fp_dispatch_async_with_logs();

}

void __62__FPDDomainExtensionBackend_wakeForPushWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newFileProviderProxyWithRequest:", v4);
  objc_msgSend(v3, "wakeForPushWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  fp_dispatch_async_with_logs();

}

void __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke_2;
  v3[3] = &unk_1E8C75C28;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchOperationServiceEndpoint:", v3);

}

uint64_t __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v12 = a5;
  v13 = a6;
  v9 = v13;
  v10 = v8;
  v11 = v12;
  fp_dispatch_async_with_logs();

}

void __101__FPDDomainExtensionBackend_fetchServicesForItemID_allowRestrictedSources_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "fetchServicesForItemID:allowRestrictedSources:completionHandler:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  fp_dispatch_async_with_logs();

}

void __78__FPDDomainExtensionBackend_fetchVendorEndpointWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "fetchVendorEndpoint:", *(_QWORD *)(a1 + 48));

}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, id, _QWORD, _QWORD))a5 + 2))(a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, a3, 0, 0);
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id, _QWORD, _QWORD, double))a5 + 2))(a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, a3, 0, 0, 0.0);
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, double))a3 + 2))(a3, 0, 0, 0.0);
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v7;
  FPDExtensionIndexer *v8;
  id WeakRetained;
  FPDExtensionIndexer *v10;

  v5 = a4;
  v7 = a3;
  v8 = [FPDExtensionIndexer alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  v10 = -[FPDDomainIndexer initWithExtension:domain:enabled:](v8, "initWithExtension:domain:enabled:", v7, WeakRetained, v5);

  return v10;
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v12 = a5;
  v13 = a6;
  v9 = v13;
  v10 = v8;
  v11 = v12;
  fp_dispatch_async_with_logs();

}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2;
  v5[3] = &unk_1E8C75CA0;
  v7 = v3;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "bulkItemChanges:changedFields:completionHandler:", v4, v3, v5);

}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "count"))
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
LABEL_6:
      __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2_cold_1();
LABEL_7:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v11 = a4;
  v12 = v7;
  v13 = a5;
  v8 = v13;
  v9 = v7;
  v10 = v11;
  fp_dispatch_async_with_logs();

}

void __70__FPDDomainExtensionBackend_trashItemAtURL_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "trashItemAtURL:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  v9 = v10;
  fp_dispatch_async_with_logs();

}

void __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "destinationDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke_2;
  v5[3] = &unk_1E8C75CC8;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:", v3, v4, v5);

}

void __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "fp_isFeatureUnsupportedError") && (a2 & 1) == 0)
      goto LABEL_4;
LABEL_6:
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3628], "providingRequiredResponse");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a2)
    goto LABEL_6;
LABEL_4:
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3628], "providingNotRequiredResponseWithSyncRootID:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);

}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "indexer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__FPDDomainExtensionBackend_workingSetDidChangeWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E8C75CF0;
    v8 = v4;
    objc_msgSend(v6, "signalChangesWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __70__FPDDomainExtensionBackend_workingSetDidChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  fp_dispatch_async_with_logs();

}

void __79__FPDDomainExtensionBackend_getKnownFolderLocations_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "getKnownFolderLocations:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(v6, 0, MEMORY[0x1E0C9AA60], v7);

}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  id v8;
  id v9;

  v8 = a7;
  FPNotSupportedError();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);

}

- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, MEMORY[0x1E0C9AA60], v7);

}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v15 = a5;
  v16 = v9;
  v17 = v10;
  v18 = a6;
  v11 = v18;
  v12 = v10;
  v13 = v9;
  v14 = v15;
  fp_dispatch_async_with_logs();

}

void __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke_2;
  v5[3] = &unk_1E8C75A48;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v2, "setAlternateContentsURL:forDocumentWithURL:completionHandler:", v3, v4, v5);

}

uint64_t __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v11 = a4;
  v12 = v7;
  v13 = a5;
  v8 = v13;
  v9 = v7;
  v10 = v11;
  fp_dispatch_async_with_logs();

}

void __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke_2;
  v4[3] = &unk_1E8C75D40;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchAlternateContentsURLWrapperForURL:completionHandler:", v3, v4);

}

uint64_t __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v11 = a4;
  v12 = v7;
  v13 = a5;
  v8 = v13;
  v9 = v7;
  v10 = v11;
  fp_dispatch_async_with_logs();

}

void __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxyWithRequest:", *(_QWORD *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke_2;
  v4[3] = &unk_1E8C75420;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:", v3, v4);

}

uint64_t __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  fp_dispatch_async_with_logs();

}

void __77__FPDDomainExtensionBackend_reindexAllItemsWithDropReason_completionHandler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "indexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v6, "indexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signalNeedsReindexFromScratchWithDropReason:completionHandler:", a1[6], a1[5]);

  }
  else
  {
    v5 = a1[5];
    FPNotSupportedError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v6;
  v8 = v9;
  fp_dispatch_async_with_logs();

}

void __87__FPDDomainExtensionBackend_reindexItemsWithIndexReason_identifiers_completionHandler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "indexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v6, "indexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signalNeedsReindexItemsWithIdentifiers:indexReason:completionHandler:", a1[5], a1[7], a1[6]);

  }
  else
  {
    v5 = a1[6];
    FPNotSupportedError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provideFileCompletionsByURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_domain);
}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_150_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;

  OUTLINED_FUNCTION_15();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  a13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v27 + 32), "fp_shortDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(v28 + 40));
  objc_msgSend(v30, "provider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fp_prettyDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138412802;
  *(_QWORD *)((char *)&a9 + 4) = v29;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 14) = v32;
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_ERROR, "[ERROR] can't get item for URL %@ for extension %@; %@",
    (uint8_t *)&a9,
    0x20u);

  OUTLINED_FUNCTION_1_3();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_153_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;

  OUTLINED_FUNCTION_15();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  a13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v25 + 32), "fp_shortDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(v26 + 40));
  objc_msgSend(v30, "provider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138412802;
  *(_QWORD *)((char *)&a9 + 4) = v28;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 14) = v29;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_1(&dword_1CF55F000, v24, v33, "[DEBUG] Successfully got item ID “%@” for %@ from extension %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1_3();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_153_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  OUTLINED_FUNCTION_15();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  a13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v27 + 32), "fp_shortDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(v28 + 40));
  objc_msgSend(v30, "provider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fp_prettyDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138412802;
  *(_QWORD *)((char *)&a9 + 4) = v29;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 14) = v32;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_1(&dword_1CF55F000, v24, v34, "[DEBUG] Cannot get item ID for %@ for extension %@. Error: %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_cancelProvidingItemAtURL:(void *)a1 withKey:(NSObject *)a2 request:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] got cancellation request for non-pending provide for URL: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_cancelProvidingItemAtURL:withKey:request:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] no more reader interested by item, stop providing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cancelProvidingItemAtURL:(uint64_t)a3 withKey:(uint64_t)a4 request:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] item at %@ is not provided anymore", v5);

  OUTLINED_FUNCTION_1_0();
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v3, "[ERROR] can't stop providing item at %@; %@", v4);

  OUTLINED_FUNCTION_2();
}

- (void)startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] no need to call start providing because an identical request is alreay in-flight for a different reader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] won't restore persona: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)startProvidingItemAtURL:(uint64_t)a3 readerID:(uint64_t)a4 readingOptions:(uint64_t)a5 request:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_19(&dword_1CF55F000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] request was cancelled already", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] ignoring completion request was cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_4(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a4, a3, "[ERROR] ❌ no item provided for %@; %@", (uint8_t *)a3);

}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_5(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a4, a3, "[DEBUG] ┏%llx completion for start providing %@", (uint8_t *)a2);

}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] 🆕✅ Extension successfully created item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_165_cold_2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v6, "[ERROR] 🆕❌ Extension failed to create item with ID %@. Error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] Successfully stopped providing item at %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_167_cold_2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v5, "[ERROR] Cannot stop providing item at %@. Error: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_171_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a2 + 32);
  v8 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(a2 + 40));
  objc_msgSend(v8, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412802;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_1(&dword_1CF55F000, a3, v11, "[DEBUG] Successfully retrieved URL %@ for item ID “%@” from extension %@", (uint8_t *)&v12);

}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_173_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_15();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  a13 = *MEMORY[0x1E0C80C00];
  v26 = *(_QWORD *)(v25 + 32);
  v27 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(v25 + 40));
  objc_msgSend(v27, "provider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138412802;
  *(_QWORD *)((char *)&a9 + 4) = v26;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 14) = v26;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_1(&dword_1CF55F000, v24, v30, "[DEBUG] Successfully retrieved item %@ for item ID “%@” from extension %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1_3();
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v6, "[ERROR] couldn't get enumerator for %@ from extension: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, v3, "[DEBUG] no item ID for %@: %@", v4);

  OUTLINED_FUNCTION_2();
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] values for %@: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_15();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_21();
  a14 = *MEMORY[0x1E0C80C00];
  v27 = OUTLINED_FUNCTION_9_0(*(_QWORD *)(v26 + 40));
  objc_msgSend(v27, "provider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  a12 = v23;
  OUTLINED_FUNCTION_7_1(&dword_1CF55F000, v22, v30, "[DEBUG] can't get values for item at %@ from extension \"%@\"; %@",
    &a9);

  OUTLINED_FUNCTION_1_3();
}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] can't notify extension of item change %lu for items; %@",
    v1);
  OUTLINED_FUNCTION_8_0();
}

@end
