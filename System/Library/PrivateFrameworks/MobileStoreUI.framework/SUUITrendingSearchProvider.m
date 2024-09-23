@implementation SUUITrendingSearchProvider

- (SUUITrendingSearchProvider)initWithClientContext:(id)a3
{
  SUUITrendingSearchProvider *v4;
  id v5;
  NSOperationQueue *v6;
  NSOperationQueue *operationQueue;
  NSMutableArray *v8;
  NSMutableArray *pendingCompletionBlocks;
  void *v10;
  _QWORD *v11;
  void *v12;
  objc_super v14;
  id location;

  objc_initWeak(&location, a3);
  v14.receiver = self;
  v14.super_class = (Class)SUUITrendingSearchProvider;
  v4 = -[SUUITrendingSearchProvider init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_clientContext, v5);

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v6;

    -[NSOperationQueue setName:](v4->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUITrendingSearchProvider.operationQueue"));
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingCompletionBlocks = v4->_pendingCompletionBlocks;
    v4->_pendingCompletionBlocks = v8;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)MEMORY[0x24BEBDF78];
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel_clearCache, *MEMORY[0x24BEBDF98], *MEMORY[0x24BEBDF78]);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_clearCache, *MEMORY[0x24BEBDFA8], *v11);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUUITrendingSearchProvider;
  -[SUUITrendingSearchProvider dealloc](&v4, sel_dealloc);
}

- (id)requestOperationWithPageURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  SUUILoadTrendingSearchPageOperation *v8;
  void *v9;
  SUUILoadTrendingSearchPageOperation *v10;

  v6 = a4;
  v7 = a3;
  v8 = [SUUILoadTrendingSearchPageOperation alloc];
  -[SUUITrendingSearchProvider clientContext](self, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUUILoadTrendingSearchPageOperation initWithClientContext:pageURL:outputBlock:](v8, "initWithClientContext:pageURL:outputBlock:", v9, v7, v6);

  return v10;
}

- (NSOperationQueue)callbackQueue
{
  return (NSOperationQueue *)objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
}

- (void)requestTrendingSearchPageWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke;
  v7[3] = &unk_2511F6040;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  -[SUUITrendingSearchProvider requestOperationWithPageURL:completionBlock:](self, "requestOperationWithPageURL:completionBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchProvider operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  -[SUUITrendingSearchProvider setRunningRequestOperation:](self, "setRunningRequestOperation:", v5);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2;
    v12[3] = &unk_2511F5D20;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    v15 = v8;
    v16 = v6;
    objc_msgSend(v9, "addOperationWithBlock:", v12);

  }
}

void __63__SUUITrendingSearchProvider_requestTrendingSearchPageWithURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setCachedSearchPage:");
  objc_msgSend(*(id *)(a1 + 48), "pendingCompletionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  objc_msgSend(v2, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 48), "setRunningRequestOperation:", 0);

}

- (void)trendingSearchPageWithURL:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[SUUITrendingSearchProvider cachedSearchPage](self, "cachedSearchPage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUUITrendingSearchProvider cachedSearchPage](self, "cachedSearchPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, 0);

  }
  else
  {
    -[SUUITrendingSearchProvider pendingCompletionBlocks](self, "pendingCompletionBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "copy");

    v11 = _Block_copy(v10);
    objc_msgSend(v9, "addObject:", v11);

    -[SUUITrendingSearchProvider runningRequestOperation](self, "runningRequestOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[SUUITrendingSearchProvider requestTrendingSearchPageWithURL:](self, "requestTrendingSearchPageWithURL:", v13);
  }

}

- (void)clearCache
{
  -[SUUITrendingSearchProvider setCachedSearchPage:](self, "setCachedSearchPage:", 0);
}

- (SUUIClientContext)clientContext
{
  return (SUUIClientContext *)objc_loadWeakRetained((id *)&self->_clientContext);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SUUITrendingSearchPage)cachedSearchPage
{
  return self->_cachedSearchPage;
}

- (void)setCachedSearchPage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSearchPage, a3);
}

- (NSMutableArray)pendingCompletionBlocks
{
  return self->_pendingCompletionBlocks;
}

- (NSOperation)runningRequestOperation
{
  return self->_runningRequestOperation;
}

- (void)setRunningRequestOperation:(id)a3
{
  objc_storeStrong((id *)&self->_runningRequestOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRequestOperation, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_cachedSearchPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_clientContext);
}

@end
