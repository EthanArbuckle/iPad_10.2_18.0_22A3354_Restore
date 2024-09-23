@implementation SUUILoadTrendingSearchPageOperation

- (SUUILoadTrendingSearchPageOperation)initWithClientContext:(id)a3 pageURL:(id)a4 outputBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUUILoadTrendingSearchPageOperation *v12;
  SUUILoadTrendingSearchPageOperation *v13;
  uint64_t v14;
  id outputBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SUUILoadTrendingSearchPageOperation;
  v12 = -[SUUILoadTrendingSearchPageOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientContext, a3);
    objc_storeStrong((id *)&v13->_pageURL, a4);
    v14 = objc_msgSend(v11, "copy");
    outputBlock = v13->_outputBlock;
    v13->_outputBlock = (id)v14;

  }
  return v13;
}

- (void)main
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__23;
  v24[4] = __Block_byref_object_dispose__23;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  -[SUUILoadTrendingSearchPageOperation pageURL](self, "pageURL");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19[5])
  {
    -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = dispatch_semaphore_create(0);
      -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __43__SUUILoadTrendingSearchPageOperation_main__block_invoke;
      v14[3] = &unk_2511F7068;
      v16 = &v18;
      v17 = v24;
      v6 = v4;
      v15 = v6;
      objc_msgSend(v5, "loadValueForKey:completionBlock:", CFSTR("trending-searches"), v14);

      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__23;
  v12[4] = __Block_byref_object_dispose__23;
  v13 = 0;
  if (v19[5])
  {
    v7 = objc_alloc(MEMORY[0x24BEB2040]);
    v8 = (void *)objc_msgSend(v7, "initWithURL:", v19[5]);
    +[SSVURLDataConsumer consumer](SUUITrendingSearchPageConsumer, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataConsumer:", v9);

    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStoreFrontSuffix:", v10);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__SUUILoadTrendingSearchPageOperation_main__block_invoke_2;
    v11[3] = &unk_2511F7090;
    v11[4] = v12;
    v11[5] = v24;
    objc_msgSend(v8, "setOutputBlock:", v11);
    objc_msgSend(v8, "main");

  }
  (*((void (**)(void))self->_outputBlock + 2))();
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

}

void __43__SUUILoadTrendingSearchPageOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __43__SUUILoadTrendingSearchPageOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (id)outputBlock
{
  return self->_outputBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
