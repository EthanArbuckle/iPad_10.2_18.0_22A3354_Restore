@implementation NUANFContextLoader

- (id)asyncLoadContextOnceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NUANFContextLoader anfContent](self, "anfContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUANFContextLoader relativePriority](self, "relativePriority");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke;
  v10[3] = &unk_24D5A1B40;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v10[4] = self;
  v11 = v7;
  objc_msgSend(v5, "fetchANFDocumentDataProviderWithPriority:completion:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  id v6;

  self->_relativePriority = a3;
  -[NUANFContextLoader asyncOnceOperation](self, "asyncOnceOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelativePriority:", a3);

  -[NUANFContextLoader assetLoader](self, "assetLoader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePriority:", a3);

}

void __48__NUANFContextLoader_loadContextWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = WeakRetained;
    v4 = WeakRetained;
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v5, v6, v7);
    WeakRetained = v8;
  }

}

- (SXContext)context
{
  return self->_context;
}

void __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NUANFAssetLoader *v21;
  void *v22;
  void *v23;
  NUANFAssetLoader *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(v5, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v9, "headline");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "articleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nss_NewsURLForArticleID:", v13);
      v29 = v5;
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc(MEMORY[0x24BE906C8]);
      objc_msgSend(v9, "anfContent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v30 = v6;
      v19 = (void *)objc_msgSend(v15, "initWithIdentifier:shareURL:JSONData:resourceDataSource:host:error:", v17, v14, v10, v9, v18, &v31);
      v20 = v31;
      objc_msgSend(v9, "setContext:", v19);

      objc_msgSend(v9, "setContextError:", v20);
      v9[8] = 1;
      v21 = [NUANFAssetLoader alloc];
      objc_msgSend(v9, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "flintResourceManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NUANFAssetLoader initWithContext:flintResourceManager:](v21, "initWithContext:flintResourceManager:", v22, v23);
      objc_msgSend(v9, "setAssetLoader:", v24);

      v25 = objc_msgSend(*(id *)(a1 + 32), "relativePriority");
      objc_msgSend(v9, "assetLoader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v6 = v30;
      objc_msgSend(v26, "setRelativePriority:", v27);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v5 = v29;
    }
    else
    {
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "setContextError:", v6);
      (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, 0);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (NUANFAssetLoader)assetLoader
{
  return self->_assetLoader;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (void)setContextError:(id)a3
{
  objc_storeStrong((id *)&self->_contextError, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setAssetLoader:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoader, a3);
}

- (id)loadContextWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  void (**v14)(id, void *, void *, _QWORD);
  id v15;
  id location;

  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  -[NUANFContextLoader context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[NUANFContextLoader assetLoader](self, "assetLoader"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[NUANFContextLoader context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUANFContextLoader assetLoader](self, "assetLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, v9, 0);

    v10 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    -[NUANFContextLoader asyncOnceOperation](self, "asyncOnceOperation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__NUANFContextLoader_loadContextWithCompletion___block_invoke;
    v13[3] = &unk_24D5A1A00;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    objc_msgSend(v11, "executeWithCompletionHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (NUANFContextLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 networkReachability:(id)a5 host:(id)a6 resourceURLTranslator:(id)a7 headline:(id)a8
{
  id v15;
  id v16;
  id v17;
  NUANFContextLoader *v18;
  NUANFContextLoader *v19;
  uint64_t v20;
  FCAsyncOnceOperation *asyncOnceOperation;
  NSOperationQueue *v22;
  NSOperationQueue *imageDecodingQueue;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)NUANFContextLoader;
  v18 = -[NUANFContextLoader init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_anfContent, a3);
    objc_storeStrong((id *)&v19->_flintResourceManager, a4);
    objc_storeStrong((id *)&v19->_networkReachability, a5);
    objc_storeStrong((id *)&v19->_host, a6);
    objc_storeStrong((id *)&v19->_resourceURLTranslator, a7);
    objc_storeStrong((id *)&v19->_headline, a8);
    v19->_relativePriority = 0;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v19, sel_asyncLoadContextOnceWithCompletion_);
    asyncOnceOperation = v19->_asyncOnceOperation;
    v19->_asyncOnceOperation = (FCAsyncOnceOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    imageDecodingQueue = v19->_imageDecodingQueue;
    v19->_imageDecodingQueue = v22;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v19->_imageDecodingQueue, "setMaxConcurrentOperationCount:", 2);
    -[NSOperationQueue setQualityOfService:](v19->_imageDecodingQueue, "setQualityOfService:", 17);
  }

  return v19;
}

- (SXHost)host
{
  return self->_host;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  id location;
  _QWORD v27[3];
  char v28;

  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  objc_initWeak(&location, self);
  -[NUANFContextLoader assetLoader](self, "assetLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke;
  v21[3] = &unk_24D5A1AA0;
  objc_copyWeak(&v25, &location);
  v10 = v7;
  v23 = v10;
  v24 = v27;
  v11 = v6;
  v22 = v11;
  objc_msgSend(v8, "loadAssetURLsWithCompletion:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_10;
  v17[3] = &unk_24D5A1AC8;
  v19 = v10;
  v20 = v27;
  v18 = v12;
  v13 = v10;
  v14 = v12;
  v15 = (void *)MEMORY[0x2199FC190](v17);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);

  return v15;
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    }
    else
    {
      objc_msgSend(v5, "assetLoader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_4;
      v14[3] = &unk_24D5A1A78;
      objc_copyWeak(&v18, v2);
      v11 = *(id *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v16 = v11;
      v17 = v12;
      v14[4] = v6;
      v15 = *(id *)(a1 + 32);
      v13 = (id)objc_msgSend(v9, "loadAssetWithURL:completion:", v10, v14);

      objc_destroyWeak(&v18);
    }

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    }
    else
    {
      objc_msgSend(v3, "assetHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "fallbackAssetForImageRequest:original:", *(_QWORD *)(a1 + 40), v9);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      objc_msgSend(v6, "imageDecodingQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_7;
      v16[3] = &unk_24D5A1A50;
      v15 = *(_OWORD *)(a1 + 48);
      v13 = (id)v15;
      v19 = v15;
      v17 = v9;
      v18 = *(id *)(a1 + 40);
      v14 = v9;
      objc_msgSend(v12, "addOperationWithBlock:", v16);

    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "preserveColorspace");
    objc_msgSend(*(id *)(a1 + 40), "size");
    +[NUANFImageResolver imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](NUANFImageResolver, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v3, v4, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_9;
    block[3] = &unk_24D5A1A28;
    v8 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = *(id *)(a1 + 48);
    v6 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_9(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "loadingBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadingBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v6[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NUANFContextLoader assetLoader](self, "assetLoader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceIDForResourceURL:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[NUANFContextLoader assetLoader](self, "assetLoader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke;
  v18[3] = &unk_24D5A1B18;
  objc_copyWeak(&v22, &location);
  v14 = v10;
  v20 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v9;
  v21 = v16;
  v17 = (id)objc_msgSend(v13, "loadAssetURLsWithCompletion:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "assetLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceForID:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "assetHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_3;
    v9[3] = &unk_24D5A1AF0;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    v7 = v5;
    v8 = (id)objc_msgSend(v6, "downloadIfNeededWithCompletion:", v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_3(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_4;
  block[3] = &unk_24D5A1AF0;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)translateURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFContextLoader resourceURLTranslator](self, "resourceURLTranslator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "translateFileURLForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fallbackAssetForImageRequest:(id)a3 original:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NUANFContextLoader networkReachability](self, "networkReachability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNetworkReachable");

  if (v9)
  {
    v10 = v7;
    v11 = v10;
LABEL_16:
    v34 = v10;
    goto LABEL_18;
  }
  -[NUANFContextLoader context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  objc_msgSend(v6, "imageIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allResourcesForImageIdentifier:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v11, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
        -[NUANFContextLoader assetLoader](self, "assetLoader");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "resourceIDForResourceURL:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[NUANFContextLoader assetLoader](self, "assetLoader");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fallbackResourceForID:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 && (objc_msgSend(v25, "isOnDisk") & 1) != 0)
        {
          objc_msgSend(v25, "assetHandle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v37;
          goto LABEL_18;
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v17)
        continue;
      break;
    }
  }

  v6 = v37;
  objc_msgSend(v37, "imageIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUANFContextLoader context](self, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "documentController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "thumbnailImageIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v26, "isEqualToString:", v30);

  if (!v31)
  {
LABEL_15:
    v10 = v7;
    goto LABEL_16;
  }
  -[NUANFContextLoader headline](self, "headline");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  FCCachedThumbnailForHeadline();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "thumbnailAssetHandle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "filePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {

    goto LABEL_15;
  }
LABEL_18:

  return v34;
}

- (NSError)contextError
{
  return self->_contextError;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NUArticleResourceURLTranslator)resourceURLTranslator
{
  return self->_resourceURLTranslator;
}

- (void)setAsyncOnceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_asyncOnceOperation, a3);
}

- (NSOperationQueue)imageDecodingQueue
{
  return self->_imageDecodingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_imageDecodingQueue, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_resourceURLTranslator, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_anfContent, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_contextError, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
