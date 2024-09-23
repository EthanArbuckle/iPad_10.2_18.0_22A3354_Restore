@implementation NUANFEmbedConfigurationLoader

- (NUANFEmbedConfigurationLoader)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4
{
  id v7;
  id v8;
  NUANFEmbedConfigurationLoader *v9;
  NUANFEmbedConfigurationLoader *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  FCAsyncOnceOperation *asyncOnceOperation;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NUANFEmbedConfigurationLoader;
  v9 = -[NUANFEmbedConfigurationLoader init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
    objc_msgSend(v7, "possiblyUnfetchedAppConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!__embedConfiguration
      || (v13 = __loadedEmbedConfigurationID,
          objc_msgSend(v11, "embedConfigurationAssetID"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          (void *)v13 != v14))
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v10, sel_asyncLoadEmbedConfigurationOnceWithCompletion_);
      asyncOnceOperation = v10->_asyncOnceOperation;
      v10->_asyncOnceOperation = (FCAsyncOnceOperation *)v15;

      -[FCAsyncOnceOperation setRelativePriority:](v10->_asyncOnceOperation, "setRelativePriority:", 1);
    }

  }
  return v10;
}

void __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE906F8]), "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", &__block_literal_global_9, 0, 0, v7, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_5;
      block[3] = &unk_24D5A1A28;
      v11 = v8;
      v12 = v3;
      v13 = *(id *)(a1 + 32);
      v9 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)loadEmbededConfigurationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(_QWORD))a3;
  -[NUANFEmbedConfigurationLoader asyncOnceOperation](self, "asyncOnceOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUANFEmbedConfigurationLoader asyncOnceOperation](self, "asyncOnceOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executeWithCompletionHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (__embedConfiguration)
      v4[2](v4);
    v7 = 0;
  }

  return v7;
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (id)asyncLoadEmbedConfigurationOnceWithCompletion:(id)a3
{
  id v4;
  NUEmbedConfigurationOperation *v5;
  void *v6;
  void *v7;
  NUEmbedConfigurationOperation *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = [NUEmbedConfigurationOperation alloc];
  -[NUANFEmbedConfigurationLoader appConfigurationManager](self, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUANFEmbedConfigurationLoader flintResourceManager](self, "flintResourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NUEmbedConfigurationOperation initWithAppConfigManager:flintResourceManager:](v5, "initWithAppConfigManager:flintResourceManager:", v6, v7);

  -[FCOperation setQualityOfService:](v8, "setQualityOfService:", 25);
  -[FCOperation setRelativePriority:](v8, "setRelativePriority:", 1);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke;
  v12[3] = &unk_24D5A2EA0;
  v13 = v4;
  v9 = v4;
  -[NUEmbedConfigurationOperation setCompletion:](v8, "setCompletion:", v12);
  objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  return v8;
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)&__embedConfiguration, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__loadedEmbedConfigurationID;
  __loadedEmbedConfigurationID = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (SXJSONDictionary)embedConfiguration
{
  return (SXJSONDictionary *)(id)__embedConfiguration;
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_4()
{
  return objc_opt_class();
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void)setFlintResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_flintResourceManager, a3);
}

- (void)setAsyncOnceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_asyncOnceOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_embedConfiguration, 0);
}

@end
