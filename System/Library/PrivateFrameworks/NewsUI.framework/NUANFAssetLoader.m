@implementation NUANFAssetLoader

uint64_t __57__NUANFAssetLoader_initWithContext_flintResourceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resourceIDForResourceURL:", a2);
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  id v6;

  self->_relativePriority = a3;
  -[NUANFAssetLoader assetURLsOperation](self, "assetURLsOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelativePriority:", a3);

  -[NUANFAssetLoader assetsOperation](self, "assetsOperation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePriority:", a3);

}

- (id)resourceIDForResourceURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("asset")))
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NUANFAssetLoader)initWithContext:(id)a3 flintResourceManager:(id)a4
{
  id v7;
  id v8;
  NUANFAssetLoader *v9;
  NUANFAssetLoader *v10;
  uint64_t v11;
  NSMutableDictionary *fetchedResourceIDs;
  void *v13;
  void *v14;
  NUANFAssetLoader *v15;
  uint64_t v16;
  NSArray *resourceIDs;
  void *v18;
  void *v19;
  uint64_t v20;
  FCAsyncOnceOperation *assetURLsOperation;
  uint64_t v22;
  FCAsyncOnceOperation *assetsOperation;
  _QWORD v25[4];
  NUANFAssetLoader *v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUANFAssetLoader;
  v9 = -[NUANFAssetLoader init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
    v10->_relativePriority = 0;
    v11 = objc_opt_new();
    fetchedResourceIDs = v10->_fetchedResourceIDs;
    v10->_fetchedResourceIDs = (NSMutableDictionary *)v11;

    objc_msgSend(v7, "documentController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requiredResourceURLs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __57__NUANFAssetLoader_initWithContext_flintResourceManager___block_invoke;
    v25[3] = &unk_24D5A3AA0;
    v15 = v10;
    v26 = v15;
    objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", v25);
    v16 = objc_claimAutoreleasedReturnValue();
    resourceIDs = v15->_resourceIDs;
    v15->_resourceIDs = (NSArray *)v16;

    objc_msgSend(v8, "cachedResourcesWithIdentifiers:", v15->_resourceIDs);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fc_dictionaryWithKeySelector:", sel_resourceID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary addEntriesFromDictionary:](v10->_fetchedResourceIDs, "addEntriesFromDictionary:", v19);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v15, sel_asyncLoadAssetURLsOnceWithCompletion_);
    assetURLsOperation = v15->_assetURLsOperation;
    v15->_assetURLsOperation = (FCAsyncOnceOperation *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v15, sel_asyncLoadAssetsOnceWithCompletion_);
    assetsOperation = v15->_assetsOperation;
    v15->_assetsOperation = (FCAsyncOnceOperation *)v22;

  }
  return v10;
}

- (FCAsyncOnceOperation)assetsOperation
{
  return self->_assetsOperation;
}

- (FCAsyncOnceOperation)assetURLsOperation
{
  return self->_assetURLsOperation;
}

- (id)loadAssetURLsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFAssetLoader assetURLsOperation](self, "assetURLsOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadAssetsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFAssetLoader assetsOperation](self, "assetsOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadAssetWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  id location;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  v26 = 0;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke;
  v19[3] = &unk_24D5A3AC8;
  objc_copyWeak(&v23, &location);
  v9 = v7;
  v21 = v9;
  v10 = v6;
  v20 = v10;
  v22 = v25;
  -[NUANFAssetLoader loadAssetURLsWithCompletion:](self, "loadAssetURLsWithCompletion:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BE6CB10];
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_5;
  v16[3] = &unk_24D5A3AF0;
  v13 = v11;
  v17 = v13;
  v18 = v25;
  objc_msgSend(v12, "cancelHandlerWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(v25, 8);

  return v14;
}

void __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(v4, "resourceIDForResourceURL:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceForID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_4;
      v12[3] = &unk_24D5A3950;
      v14 = *(id *)(a1 + 40);
      v13 = v6;
      objc_msgSend(v4, "assetDownloadOperationForResource:completion:", v13, v12);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }

}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
}

- (id)resourceForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFAssetLoader fetchedResourceIDs](self, "fetchedResourceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fallbackResourceForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFAssetLoader flintResourceManager](self, "flintResourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedResourceWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)asyncLoadAssetURLsOnceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[NUANFAssetLoader flintResourceManager](self, "flintResourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUANFAssetLoader resourceIDs](self, "resourceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUANFAssetLoader relativePriority](self, "relativePriority");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__NUANFAssetLoader_asyncLoadAssetURLsOnceWithCompletion___block_invoke;
  v11[3] = &unk_24D5A3B18;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "fetchResourcesWithIdentifiers:downloadAssets:relativePriority:callBackQueue:completionBlock:", v6, 0, v7, MEMORY[0x24BDAC9B8], v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __57__NUANFAssetLoader_asyncLoadAssetURLsOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17F0];
  v4 = a2;
  objc_msgSend(v3, "isMainThread");
  objc_msgSend(*(id *)(a1 + 32), "fetchedResourceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  objc_msgSend(v4, "count");
  objc_msgSend(*(id *)(a1 + 32), "fetchedResourceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "count");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)asyncLoadAssetsOnceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NUANFAssetLoader fetchedResourceIDs](self, "fetchedResourceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUANFAssetLoader resourceIDs](self, "resourceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fc_subarrayWithMaxCount:", 50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CAC8]), "initWithAssetHandles:", v9);
  objc_msgSend(v10, "setPurpose:", *MEMORY[0x24BE6C9D8]);
  objc_msgSend(v10, "setShouldFailOnMissingObjects:", 1);
  objc_msgSend(v10, "setRelativePriority:", -[NUANFAssetLoader relativePriority](self, "relativePriority"));
  objc_msgSend(v10, "setFetchCompletionQueue:", MEMORY[0x24BDAC9B8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke_2;
  v16[3] = &unk_24D5A3B80;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v10, "setFetchCompletionBlock:", v16);
  objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

  NUArticleLoadLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_216817000, v13, OS_LOG_TYPE_DEFAULT, "Article data loader will prefetch assets with operation=%{public}@", buf, 0xCu);

  }
  return v10;
}

uint64_t __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetHandle");
}

uint64_t __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "status") == 0);
}

- (id)assetDownloadOperationForResource:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "assetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadIfNeededWithPriority:completion:", -[NUANFAssetLoader relativePriority](self, "relativePriority"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (SXContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (void)setFlintResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_flintResourceManager, a3);
}

- (NSArray)resourceIDs
{
  return self->_resourceIDs;
}

- (void)setResourceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resourceIDs, a3);
}

- (NSMutableDictionary)fetchedResourceIDs
{
  return self->_fetchedResourceIDs;
}

- (void)setFetchedResourceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResourceIDs, a3);
}

- (void)setAssetURLsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLsOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsOperation, 0);
  objc_storeStrong((id *)&self->_assetURLsOperation, 0);
  objc_storeStrong((id *)&self->_fetchedResourceIDs, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
