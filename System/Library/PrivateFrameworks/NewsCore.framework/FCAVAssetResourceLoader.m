@implementation FCAVAssetResourceLoader

- (FCAVAssetResourceLoader)initWithCacheDirectory:(id)a3 networkReachability:(id)a4
{
  id v6;
  id v7;
  FCAVAssetResourceLoader *v8;
  FCAssetManager *v9;
  FCAssetManager *assetManager;
  FCThreadSafeMutableSet *v11;
  FCThreadSafeMutableSet *whitelistedMasterPlaylistURLs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCAVAssetResourceLoader;
  v8 = -[FCAVAssetResourceLoader init](&v14, sel_init);
  if (v8)
  {
    v9 = -[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:]([FCAssetManager alloc], "initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:", CFSTR("playlists"), v6, 0, 0, 0, 0, v7);
    assetManager = v8->_assetManager;
    v8->_assetManager = v9;

    v11 = objc_alloc_init(FCThreadSafeMutableSet);
    whitelistedMasterPlaylistURLs = v8->_whitelistedMasterPlaylistURLs;
    v8->_whitelistedMasterPlaylistURLs = v11;

  }
  return v8;
}

- (FCAVAssetResourceLoader)init
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
    v8 = "-[FCAVAssetResourceLoader init]";
    v9 = 2080;
    v10 = "FCAVAssetResourceLoader.m";
    v11 = 1024;
    v12 = 34;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetResourceLoader init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)registerAVURLAssetForAutomaticResourceManagement:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCAVAssetResourceLoader _isHLSURL:](self, "_isHLSURL:", v4);

  if (v5)
  {
    -[FCAVAssetResourceLoader whitelistedMasterPlaylistURLs](self, "whitelistedMasterPlaylistURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v10, "resourceLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FCAVWorkQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:queue:", self, v9);

  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void (**v12)(void *, void *, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCAVAssetResourceLoader whitelistedMasterPlaylistURLs](self, "whitelistedMasterPlaylistURLs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    v31 = &unk_1E4648B40;
    v32 = v5;
    v33 = v8;
    v12 = (void (**)(void *, void *, _QWORD))_Block_copy(&v28);
    -[FCAVAssetResourceLoader assetManager](self, "assetManager", v28, v29, v30, v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetHandleForURL:lifetimeHint:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "dataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)FCAVAssetLog;
    v18 = os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = v17;
        objc_msgSend(v6, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v21;
        _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "returning master playlist %{public}@ from cache", buf, 0xCu);

      }
      objc_msgSend(v15, "dataProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v22, 0);

    }
    else
    {
      if (v18)
      {
        v23 = v17;
        objc_msgSend(v6, "URL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v25;
        _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "fetching master playlist %{public}@ from network", buf, 0xCu);

      }
      v26 = (id)objc_msgSend(v15, "fetchDataProviderWithCompletion:", v12);
    }

  }
  return v11;
}

void __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *PreferredIdentifierForTag;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishLoadingWithError:", a3);
  }
  else
  {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], *(CFStringRef *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentType:", PreferredIdentifierForTag);

    objc_msgSend(v12, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentLength:", v8);

    objc_msgSend(*(id *)(a1 + 32), "dataRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithData:", v11);

    objc_msgSend(*(id *)(a1 + 32), "finishLoading");
  }

}

- (void)prefetchMasterPlaylistForAssetURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[FCAVAssetResourceLoader _isHLSURL:](self, "_isHLSURL:", v6))
  {
    FCAVWorkQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_2;
    block[3] = &unk_1E463CCB8;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, MEMORY[0x1E0C9AA60], 0);
  }

}

void __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assetManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetHandleForURL:lifetimeHint:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_3;
  v5[3] = &unk_1E4648B68;
  v6 = *(id *)(a1 + 48);
  v4 = (id)objc_msgSend(v3, "fetchDataProviderWithCompletion:", v5);

}

void __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "data");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[FCHLSPlaylist playlistParsingData:error:]((uint64_t)FCHLSPlaylist, v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v3 + 16))(v3, v7, v6, v5);

  }
}

- (BOOL)_isHLSURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("m3u8")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("m3u"));

  }
  return v5;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (FCThreadSafeMutableSet)whitelistedMasterPlaylistURLs
{
  return self->_whitelistedMasterPlaylistURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedMasterPlaylistURLs, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
