@implementation FCAVAssetKeyManager

- (id)initWithService:(void *)a3 cache:
{
  id v6;
  id v7;
  id *v8;
  FCThreadSafeMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id *v17;
  objc_super v18;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FCAVAssetKeyManager;
    v8 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = objc_alloc_init(FCThreadSafeMutableArray);
      v10 = a1[4];
      a1[4] = v9;

      v11 = objc_alloc(MEMORY[0x1E0D60AD0]);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__FCAVAssetKeyManager_initWithService_cache___block_invoke;
      v16[3] = &unk_1E463B350;
      a1 = a1;
      v17 = a1;
      v12 = objc_msgSend(v11, "initWithConstructor:", v16);
      v13 = a1[3];
      a1[3] = (id)v12;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", a1[3], sel_reset, *MEMORY[0x1E0C89738], 0);

    }
  }

  return a1;
}

- (void)refreshKeysIfNearExpiration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  FCAVAssetKeyFetchRequest *v17;
  void *v18;
  id *v19;
  FCThreadSafeMutableArray *fetchRequests;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134217984;
      v34 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "AV asset key manager will see if %lu keys need refresh", buf, 0xCu);

    }
    v10 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_17;
    v31[3] = &unk_1E463C9B8;
    v31[4] = self;
    objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134218242;
        v34 = v14;
        v35 = 2114;
        v36 = v6;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "AV asset key manager found %lu keys needing refresh: %{public}@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C8B1A0], "contentKeySessionWithKeySystem:", *MEMORY[0x1E0C8A1F0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      FCAVWorkQueue();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:queue:", self, v16);

      v17 = [FCAVAssetKeyFetchRequest alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FCAVAssetKeyFetchRequest initWithContentKeySession:keyURIs:forceRefresh:completionHandler:]((id *)&v17->super.isa, v15, v18, 1, v7);

      if (self)
        fetchRequests = self->_fetchRequests;
      else
        fetchRequests = 0;
      -[FCThreadSafeMutableArray addObject:](fetchRequests, "addObject:", v19);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v21 = v11;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v27;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v27 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(v15, "processContentKeyRequestWithIdentifier:initializationData:options:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25++), 0, 0, (_QWORD)v26);
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v23);
      }

    }
    else
    {
      v30[0] = v10;
      v30[1] = 3221225472;
      v30[2] = __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5;
      v30[3] = &unk_1E463B598;
      v30[4] = v7;
      __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5((uint64_t)v30);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (FCAVAssetKeyManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetKeyManager init]";
    v9 = 2080;
    v10 = "FCAVAssetKeyManager.m";
    v11 = 1024;
    v12 = 75;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetKeyManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __45__FCAVAssetKeyManager_initWithService_cache___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8B1A0], "contentKeySessionWithKeySystem:", *MEMORY[0x1E0C8A1F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  FCAVWorkQueue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:queue:", v3, v4);

  return v2;
}

- (void)registerAVURLAssetForAutomaticKeyManagement:(id)a3
{
  id v4;
  NSObject *v5;
  NFLazy *sharedContentKeySession;
  NFLazy *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "mayRequireContentKeysForMediaDataProcessing"))
  {
    v5 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "AV asset key manager registering automatic key management for %{public}@", (uint8_t *)&v9, 0xCu);
    }
    if (self)
      sharedContentKeySession = self->_sharedContentKeySession;
    else
      sharedContentKeySession = 0;
    v7 = sharedContentKeySession;
    -[NFLazy value](v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addContentKeyRecipient:", v4);

  }
}

- (void)fetchKeysWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  FCAVAssetKeyFetchRequest *v15;
  void *v16;
  id *v17;
  FCThreadSafeMutableArray *fetchRequests;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke;
  v29[3] = &unk_1E463C7F0;
  v29[4] = self;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_2;
  v28[3] = &unk_1E464A100;
  v28[4] = self;
  objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C8B1A0], "contentKeySessionWithKeySystem:", *MEMORY[0x1E0C8A1F0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCAVWorkQueue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:queue:", self, v11);

    v12 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218498;
      v32 = v14;
      v33 = 2114;
      v34 = v10;
      v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetching %lu keys on session %{public}@: %{public}@", buf, 0x20u);

    }
    v15 = [FCAVAssetKeyFetchRequest alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCAVAssetKeyFetchRequest initWithContentKeySession:keyURIs:forceRefresh:completionHandler:]((id *)&v15->super.isa, v10, v16, 0, v6);

    if (self)
      fetchRequests = self->_fetchRequests;
    else
      fetchRequests = 0;
    -[FCThreadSafeMutableArray addObject:](fetchRequests, "addObject:", v17);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v10, "processContentKeyRequestWithIdentifier:initializationData:options:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), 0, 0, (_QWORD)v24);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v21);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

id __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](*(void **)(a1 + 32), a2);
}

- (id)_keyURIForKeyIdentifier:(void *)a1
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      a1 = v4;
    }
    else
    {
      objc_opt_class();
      if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v3;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
        a1 = 0;
      }

      v4 = 0;
    }

  }
  return a1;
}

uint64_t __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 16);
  else
    v4 = 0;
  objc_msgSend(v4, "assetKeyForURI:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[FCAVAssetKeyManager _shouldRefreshKey:](*(_QWORD *)(a1 + 32), v5);
  else
    v6 = 1;

  return v6;
}

- (uint64_t)_shouldRefreshKey:(uint64_t)result
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (result)
  {
    v2 = a2;
    objc_msgSend(v2, "creationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "expirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    objc_msgSend(v3, "dateByAddingTimeInterval:", v6 * 0.75);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fc_isLaterThanOrEqualTo:", v7);

    return v9;
  }
  return result;
}

id __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](*(void **)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 16);
    else
      v7 = 0;
    objc_msgSend(v7, "assetKeyForURI:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[FCAVAssetKeyManager _shouldRefreshKey:](*(_QWORD *)(a1 + 32), v8))
      v9 = v5;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager found no keys needing refresh", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[8];
  id v13;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v8 = objc_msgSend(v7, "respondByRequestingPersistableContentKeyRequestAndReturnError:", &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke;
    v12[3] = &unk_1E463C918;
    v10 = v7;
    v12[4] = v10;
    v12[5] = self;
    v12[6] = v9;
    v12[7] = v6;
    v11 = v9;
    __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke((uint64_t)v12);

  }
}

void __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "AV asset key manager failed to get persistableContentKeyRequest for identifier: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(_QWORD **)(a1 + 40), *(void **)(a1 + 32), 0, *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_completeKeyRequest:(void *)a3 withData:(void *)a4 error:(void *)a5 session:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C8B198], "contentKeyResponseWithFairPlayStreamingKeyResponseData:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "processContentKeyResponse:", v12);
    }
    else
    {
      objc_msgSend(v16, "processContentKeyResponseError:", v10);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("AudioAssetDownloadFailed"), v10, MEMORY[0x1E0C9AA70]);
    }

    objc_msgSend(v16, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](a1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)a1[4];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke;
      v17[3] = &unk_1E463F098;
      v18 = v11;
      v19 = v14;
      v20 = v10;
      objc_msgSend(v15, "readWriteWithAccessor:", v17);

    }
  }

}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  FCAVAssetKeyCacheType *cache;
  FCAVAssetKeyCacheType *v13;
  id v14;
  void *v15;
  FCThreadSafeMutableArray *v16;
  id v17;
  NSObject *v18;
  FCAVAssetKeyFetchOperation *v19;
  FCAVAssetKeyServiceType *v20;
  FCAVAssetKeyCacheType *v21;
  id v22;
  id v23;
  FCAVAssetKeyServiceType *v24;
  FCAVAssetKeyCacheType *v25;
  FCAVAssetKeyManager *v26;
  const char *v27;
  id v28;
  id obj;
  id obja;
  void *v31;
  id v32;
  id v33;
  _QWORD newValue[4];
  id v35;
  FCAVAssetKeyManager *v36;
  id v37;
  id v38;
  _QWORD v39[9];
  _QWORD v40[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  objc_super buf;
  void (*v46)(uint64_t, void *, uint64_t, _BYTE *);
  void *v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  obj = a4;
  v6 = a4;
  v7 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "identifier", obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.receiver) = 138543362;
    *(id *)((char *)&buf.receiver + 4) = v9;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "AV asset key manager successfully got persistableContentKeyRequest for identifier: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v6, "identifier", obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
    v40[3] = &unk_1E463B228;
    v40[4] = self;
    v40[5] = v6;
    v40[6] = v33;
    __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke((uint64_t)v40);
    goto LABEL_22;
  }
  v32 = v11;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v13 = cache;
  -[FCAVAssetKeyCacheType assetKeyForURI:](v13, "assetKeyForURI:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31 || (-[FCAVAssetKeyManager _shouldRefreshKey:]((uint64_t)self, v31) & 1) != 0)
    goto LABEL_10;
  v14 = v32;
  v15 = v14;
  if (self)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v16 = self->_fetchRequests;
    buf.receiver = (id)MEMORY[0x1E0C809B0];
    buf.super_class = (Class)3221225472;
    v46 = __50__FCAVAssetKeyManager__waitingOnRefreshForKeyURI___block_invoke;
    v47 = &unk_1E464A150;
    v17 = v15;
    v48 = v17;
    v49 = &v41;
    -[FCThreadSafeMutableArray enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", &buf);

    LODWORD(v16) = *((_BYTE *)v42 + 24) == 0;
    _Block_object_dispose(&v41, 8);

    if (!(_DWORD)v16)
    {
LABEL_10:
      v18 = FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.receiver) = 138543362;
        *(id *)((char *)&buf.receiver + 4) = v32;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetching response for %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v19 = [FCAVAssetKeyFetchOperation alloc];
      if (self)
      {
        v20 = self->_service;
        v21 = self->_cache;
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      v22 = v6;
      v23 = v32;
      v24 = v20;
      v25 = v21;
      if (v19)
      {
        buf.receiver = v19;
        buf.super_class = (Class)FCAVAssetKeyFetchOperation;
        v26 = -[FCAVAssetKeyManager init](&buf, sel_init);
        v19 = (FCAVAssetKeyFetchOperation *)v26;
        if (v26)
        {
          objc_storeStrong((id *)&v26[9]._sharedContentKeySession, obja);
          objc_storeStrong((id *)&v19->_keyURI, v11);
          objc_storeStrong((id *)&v19->_service, v20);
          objc_storeStrong((id *)&v19->_cache, v21);
        }
      }

      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_23;
      newValue[3] = &unk_1E464A128;
      v35 = v23;
      v36 = self;
      v37 = v22;
      v38 = v33;
      if (v19)
        objc_setProperty_nonatomic_copy(v19, v27, newValue, 376);
      -[FCOperation start](v19, "start");

      v28 = v35;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2;
  v39[3] = &unk_1E463C840;
  v19 = v15;
  v39[4] = v19;
  v39[5] = self;
  v28 = v6;
  v39[6] = v28;
  v39[7] = v31;
  v39[8] = v33;
  __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2((uint64_t)v39);
LABEL_20:

LABEL_22:
}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_invalidAVAssetKeyURIError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](v2, v3, 0, v4, *(void **)(a1 + 48));

}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager using cached response for %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(_QWORD **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](v4, v5, v6, 0, *(void **)(a1 + 64));

}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_24;
    v14[3] = &unk_1E463C840;
    v8 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v16 = v8;
    v9 = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 48);
    v18 = v6;
    v19 = v9;
    v10 = v17;
    v11 = v15;
    __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_24((uint64_t)v14);

  }
  else
  {
    v12 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetched response for %{public}@", buf, 0xCu);
    }
    -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(_QWORD **)(a1 + 40), *(void **)(a1 + 48), v5, 0, *(void **)(a1 + 56));
  }

}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager failed to fetch response for %{public}@", (uint8_t *)&v4, 0xCu);
  }
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(_QWORD **)(a1 + 40), *(void **)(a1 + 48), 0, *(void **)(a1 + 56), *(void **)(a1 + 64));
}

void __50__FCAVAssetKeyManager__waitingOnRefreshForKeyURI___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v6;
  id *v7;
  int v8;
  id *v9;

  v6 = a2;
  v7 = v6;
  if (v6)
  {
    if (*((_BYTE *)v6 + 8))
    {
      v9 = v6;
      v8 = objc_msgSend(v6[3], "containsObject:", *(_QWORD *)(a1 + 32));
      v7 = v9;
      if (v8)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

void __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void (**v16)(id, void *);
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke_2;
  v19[3] = &unk_1E464A178;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v3, "fc_firstObjectPassingTest:", v19);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[3];
  if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v6 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (v5)
        v8 = v5[3];
      else
        v8 = 0;
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v9 = v6;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "AV asset key manager removing keyURI %{public}@ from %{public}@", buf, 0x16u);

    }
    if (v5)
    {
      objc_msgSend((id)v5[3], "removeObject:", *(_QWORD *)(a1 + 40));
      v10 = (void *)v5[4];
    }
    else
    {
      objc_msgSend(0, "removeObject:", *(_QWORD *)(a1 + 40));
      v10 = 0;
    }
    objc_msgSend(v10, "fc_safelyAddObject:", *(_QWORD *)(a1 + 48));
    if (v5)
      v11 = (void *)v5[3];
    else
      v11 = 0;
    if (!objc_msgSend(v11, "count"))
    {
      v12 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v13 = v5[2];
        else
          v13 = 0;
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        v14 = v12;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "AV asset key manager finished key requests for session: %{public}@", buf, 0xCu);

      }
      if (v5)
      {
        v15 = (void *)v5[5];
        if (v15)
        {
          v16 = v15;
          v17 = (id)v5[4];
          objc_msgSend(v17, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, v18);

        }
      }
      objc_msgSend(v3, "removeObjectIdenticalTo:", v5);
    }
  }

}

BOOL __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 16);
  else
    v2 = 0;
  return v2 == *(_QWORD *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_sharedContentKeySession, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
