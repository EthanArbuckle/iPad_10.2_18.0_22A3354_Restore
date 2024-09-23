@implementation NUEmbedConfigurationOperation

- (void)performOperation
{
  void *v3;
  _QWORD v4[5];

  -[NUEmbedConfigurationOperation appConfigurationManager](self, "appConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__NUEmbedConfigurationOperation_performOperation__block_invoke;
  v4[3] = &unk_24D5A3D30;
  v4[4] = self;
  objc_msgSend(v3, "fetchAppConfigurationIfNeededWithCompletion:", v4);

}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[NUEmbedConfigurationOperation completion](self, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUEmbedConfigurationOperation completion](self, "completion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NUEmbedConfigurationOperation result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (id)completion
{
  return self->_completion;
}

- (NUEmbedConfigurationOperationResult)result
{
  return self->_result;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NUEmbedConfigurationOperation)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4
{
  id v7;
  id v8;
  NUEmbedConfigurationOperation *v9;
  NUEmbedConfigurationOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUEmbedConfigurationOperation;
  v9 = -[FCOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
  }

  return v10;
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NUEmbedConfigurationOperationResult *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NUEmbedConfigurationOperationResult initWithData:idenfifier:]([NUEmbedConfigurationOperationResult alloc], "initWithData:idenfifier:", v3, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setResult:", v4);

    objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", *(_QWORD *)(a1 + 56));
  }

}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "embedConfigurationAssetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __49__NUEmbedConfigurationOperation_performOperation__block_invoke_cold_1();
    goto LABEL_7;
  }
  if (a3 || (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "flintResourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "relativePriority");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __49__NUEmbedConfigurationOperation_performOperation__block_invoke_5;
  v15 = &unk_24D5A3D08;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  objc_msgSend(v6, "fetchResourcesWithIdentifiers:downloadAssets:relativePriority:callBackQueue:completionBlock:", v7, 0, v8, MEMORY[0x24BDAC9B8], &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v11, v12, v13, v14, v15);
LABEL_8:

}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong(&self->_completion, 0);
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  id v13;
  int8x16_t v14;
  id v15;

  v5 = a3;
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "assetHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__NUEmbedConfigurationOperation_performOperation__block_invoke_2;
    v12[3] = &unk_24D5A3CE0;
    v13 = v7;
    v11 = *(int8x16_t *)(a1 + 32);
    v9 = (id)v11.i64[0];
    v14 = vextq_s8(v11, v11, 8uLL);
    v15 = v5;
    v10 = (id)objc_msgSend(v8, "downloadIfNeededWithCompletion:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", v5);
  }

}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void)setFlintResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_flintResourceManager, a3);
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke_cold_1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Expecting a resource identifier for the embed configuration"));
  v1 = 136315906;
  v2 = "-[NUEmbedConfigurationOperation performOperation]_block_invoke";
  v3 = 2080;
  v4 = "NUEmbedConfigurationOperation.m";
  v5 = 1024;
  v6 = 42;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_216817000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
