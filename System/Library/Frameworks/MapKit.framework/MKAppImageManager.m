@implementation MKAppImageManager

+ (id)sharedImageManager
{
  return (id)objc_msgSend(a1, "sharedImageManagerWithAuditToken:", 0);
}

+ (id)sharedImageManagerWithAuditToken:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MKAppImageManager_sharedImageManagerWithAuditToken___block_invoke;
  block[3] = &unk_1E20D7D98;
  v11 = v3;
  v4 = qword_1ECE2D820;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ECE2D820, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_124;

  return v8;
}

void __54__MKAppImageManager_sharedImageManagerWithAuditToken___block_invoke(uint64_t a1)
{
  MKAppImageManager *v1;
  void *v2;

  v1 = -[MKAppImageManager initWithURLCache:auditToken:]([MKAppImageManager alloc], "initWithURLCache:auditToken:", 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)_MergedGlobals_124;
  _MergedGlobals_124 = (uint64_t)v1;

}

+ (id)sharedCollectionCoverImageManager
{
  if (qword_1ECE2D830 != -1)
    dispatch_once(&qword_1ECE2D830, &__block_literal_global_1);
  return (id)qword_1ECE2D828;
}

void __54__MKAppImageManager_sharedCollectionCoverImageManager__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t UInteger;
  MKAppImageManager *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 13, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("MKCollectionCoverPhotoCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    UInteger = GEOConfigGetUInteger();
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:directoryURL:", UInteger, GEOConfigGetUInteger(), v3);
  }
  else
  {
    v7 = 0;
  }
  v5 = -[MKAppImageManager initWithURLCache:]([MKAppImageManager alloc], "initWithURLCache:", v7);
  v6 = (void *)qword_1ECE2D828;
  qword_1ECE2D828 = (uint64_t)v5;

}

- (MKAppImageManager)init
{
  return -[MKAppImageManager initWithURLCache:auditToken:](self, "initWithURLCache:auditToken:", 0, 0);
}

- (MKAppImageManager)initWithURLCache:(id)a3
{
  return -[MKAppImageManager initWithURLCache:auditToken:](self, "initWithURLCache:auditToken:", a3, 0);
}

- (MKAppImageManager)initWithURLCache:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  MKAppImageManager *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURLSession *session;
  NSCache *v14;
  NSCache *iconCache;
  uint64_t v16;
  geo_isolater *containersLock;
  uint64_t v18;
  NSMapTable *containers;
  uint64_t v20;
  geo_isolater *urlConnectionsLock;
  NSMutableDictionary *v22;
  NSMutableDictionary *urlConnections;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MKAppImageManager;
  v8 = -[MKAppImageManager init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v9, "setName:", CFSTR("com.apple.MapKit.AppImageManager.URLSession"));
    objc_msgSend(v9, "setQualityOfService:", 25);
    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 2);
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "setURLCache:", v6);
    if (v7)
      objc_msgSend(v11, "geo_setApplicationAttribution:", v7);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v11, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    session = v8->_session;
    v8->_session = (NSURLSession *)v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    iconCache = v8->_iconCache;
    v8->_iconCache = v14;

    v16 = geo_isolater_create();
    containersLock = v8->_containersLock;
    v8->_containersLock = (geo_isolater *)v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    containers = v8->_containers;
    v8->_containers = (NSMapTable *)v18;

    v20 = geo_isolater_create();
    urlConnectionsLock = v8->_urlConnectionsLock;
    v8->_urlConnectionsLock = (geo_isolater *)v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    urlConnections = v8->_urlConnections;
    v8->_urlConnections = v22;

  }
  return v8;
}

- (void)clearImageCache
{
  NSObject *v3;
  uint8_t v4[16];

  MKGetAppImageManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "Clearing image cache.", v4, 2u);
  }

  -[NSCache removeAllObjects](self->_iconCache, "removeAllObjects");
}

- (id)cachedImageAtURL:(id)a3
{
  NSCache *iconCache;
  void *v4;
  void *v5;

  iconCache = self->_iconCache;
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](iconCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t, uint64_t, _QWORD);
  void *v8;
  uint64_t v9;
  NSCache *iconCache;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _MKAppImageManagerContainer *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  os_signpost_id_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  MKAppImageManager *v32;
  id v33;
  _MKAppImageManagerContainer *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    iconCache = self->_iconCache;
    objc_msgSend(v6, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](iconCache, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      MKGetAppImageManagerLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v14;
        _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_DEBUG, "[✔]Returning Cached image for url: %@", buf, 0xCu);

      }
      v7[2](v7, v12, 1, 1, 0);
    }
    else
    {
      v15 = objc_alloc_init(_MKAppImageManagerContainer);
      v16 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      -[_MKAppImageManagerContainer setData:](v15, "setData:", v16);

      -[_MKAppImageManagerContainer setCompletionHandler:](v15, "setCompletionHandler:", v7);
      objc_msgSend(v6, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKAppImageManagerContainer setUrlString:](v15, "setUrlString:", v17);

      MKGetAppImageManagerLog();
      v18 = objc_claimAutoreleasedReturnValue();
      -[_MKAppImageManagerContainer setSignpostID:](v15, "setSignpostID:", os_signpost_id_generate(v18));

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:cachePolicy:timeoutInterval:", v6, 0, 5.0);
      -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        && (objc_msgSend(v6, "absoluteString"), v21 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v21,
                                                v21))
      {
        v34 = v15;
        v35 = v20;
        geo_isolate_sync();
        v31 = MEMORY[0x1E0C809B0];
        v32 = self;
        v22 = v35;
        v33 = v6;
        geo_isolate_sync();
        MKGetAppImageManagerLog();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = -[_MKAppImageManagerContainer signpostID](v34, "signpostID", v31, 3221225472, __57__MKAppImageManager_loadAppImageAtURL_completionHandler___block_invoke_2, &unk_1E20D7E80, v32);
        if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v25 = v24;
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "DownloadImage", (const char *)&unk_18B2CC343, buf, 2u);
          }
        }

        objc_msgSend(v22, "resume");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKAppImageManager"), 1001, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        MKGetAppImageManagerLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "absoluteString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v37 = v26;
          v38 = 2112;
          v39 = v28;
          _os_log_impl(&dword_18B0B0000, v27, OS_LOG_TYPE_ERROR, "[X] Error: %@ for Url: %@", buf, 0x16u);

        }
        ((void (**)(id, void *, uint64_t, uint64_t, void *))v7)[2](v7, 0, 0, 0, v26);

      }
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKAppImageManager"), 1001, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MKGetAppImageManagerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v12;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_18B0B0000, v29, OS_LOG_TYPE_ERROR, "[X] Error: %@ for Url: %@", buf, 0x16u);

    }
    ((void (**)(id, void *, uint64_t, uint64_t, void *))v7)[2](v7, 0, 0, 0, v12);
  }

}

uint64_t __57__MKAppImageManager_loadAppImageAtURL_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], a1[6]);
}

void __57__MKAppImageManager_loadAppImageAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

- (void)cancelLoadAppImageAtURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  MKAppImageManager *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  MKAppImageManager *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1;
  v39 = __Block_byref_object_dispose__1;
  v40 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke;
  v31 = &unk_1E20D7EA8;
  v34 = &v35;
  v32 = self;
  v6 = v4;
  v33 = v6;
  geo_isolate_sync();
  v7 = (void *)v36[5];
  if (v7)
  {
    objc_msgSend(v7, "cancel");
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1;
    v26 = __Block_byref_object_dispose__1;
    v27 = 0;
    v15 = v5;
    v16 = 3221225472;
    v17 = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2;
    v18 = &unk_1E20D7ED0;
    v19 = self;
    v20 = &v22;
    v21 = &v35;
    geo_isolate_sync();
    MKGetAppImageManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)v23[5], "signpostID");
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v8, OS_SIGNPOST_EVENT, v9, "DownloadCancelled", (const char *)&unk_18B2CC343, buf, 2u);
    }

    objc_msgSend((id)v23[5], "completionHandler");
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_51;
    v12[3] = &unk_1E20D7EF8;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    -[MKAppImageManager _dispatchOnManThread:](self, "_dispatchOnManThread:", v12);
    geo_isolate_sync();
    v11 = v6;
    geo_isolate_sync();

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v35, 8);
}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (void)_dispatchOnManThread:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__MKAppImageManager__dispatchOnManThread___block_invoke;
      block[3] = &unk_1E20D7EF8;
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }

}

uint64_t __42__MKAppImageManager__dispatchOnManThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void *v7;
  unsigned int v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a6;
  objc_msgSend(a5, "MIMEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("image"));

  v9[2](v9, v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[NSMapTable objectForKey:](self->_containers, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendData:", v10);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSCache *iconCache;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSCache *v26;
  void *v27;
  _QWORD *v28;
  id v29;
  id v30;
  _QWORD v31[7];
  _QWORD v32[17];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_QWORD *);
  void *v42;
  MKAppImageManager *v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "code") != -999)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__1;
    v50 = __Block_byref_object_dispose__1;
    v51 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke;
    v42 = &unk_1E20D7EA8;
    v45 = &v46;
    v43 = self;
    v13 = v9;
    v44 = v13;
    geo_isolate_sync();
    v14 = (void *)v47[5];
    if (v11)
    {
      if (v14)
      {
        MKGetAppImageManagerLog();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend((id)v47[5], "signpostID");
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18B0B0000, v15, OS_SIGNPOST_INTERVAL_END, v16, "DownloadImage", (const char *)&unk_18B2CC343, buf, 2u);
        }

        iconCache = self->_iconCache;
        objc_msgSend((id)v47[5], "urlString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](iconCache, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v47[5], "completionHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v12;
        v34[1] = 3221225472;
        v34[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_56;
        v34[3] = &unk_1E20D7F48;
        v21 = v19;
        v35 = v21;
        v22 = v20;
        v37 = v22;
        v36 = v11;
        -[MKAppImageManager _dispatchOnManThread:](self, "_dispatchOnManThread:", v34);
        v32[12] = v12;
        v32[13] = 3221225472;
        v32[14] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2;
        v32[15] = &unk_1E20D7E58;
        v32[16] = self;
        v33 = v13;
        geo_isolate_sync();
        v32[6] = v12;
        v32[7] = 3221225472;
        v32[8] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_3;
        v32[9] = &unk_1E20D7F20;
        v32[10] = self;
        v32[11] = &v46;
        geo_isolate_sync();

        v23 = v35;
LABEL_20:

      }
    }
    else if (v14)
    {
      objc_msgSend(v14, "completionHandler");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v47[5], "data");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "length"))
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v22);
      else
        v23 = 0;
      MKGetAppImageManagerLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend((id)v47[5], "signpostID");
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v24, OS_SIGNPOST_INTERVAL_END, v25, "DownloadImage", (const char *)&unk_18B2CC343, buf, 2u);
      }

      if (v23)
      {
        v26 = self->_iconCache;
        objc_msgSend((id)v47[5], "urlString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](v26, "setObject:forKey:", v23, v27);

        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_58;
        v32[3] = &unk_1E20D7F70;
        v28 = v32;
        v32[5] = v21;
        v32[4] = v23;
        -[MKAppImageManager _dispatchOnManThread:](self, "_dispatchOnManThread:", v32);
      }
      else
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_59;
        v31[3] = &unk_1E20D7F98;
        v31[6] = &v46;
        v28 = v31;
        v29 = v21;
        v31[4] = 0;
        v31[5] = v29;
        -[MKAppImageManager _dispatchOnManThread:](self, "_dispatchOnManThread:", v31);
      }

      v30 = v13;
      geo_isolate_sync();
      geo_isolate_sync();

      goto LABEL_20;
    }

    _Block_object_dispose(&v46, 8);
  }

}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "urlString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1, 0);
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_59(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKAppImageManager"), 1002, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MKGetAppImageManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "urlString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "[X] Formatting Error: %@ for Url: %@", (uint8_t *)&v5, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_61(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "urlString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlConnections, 0);
  objc_storeStrong((id *)&self->_urlConnectionsLock, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containersLock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end
