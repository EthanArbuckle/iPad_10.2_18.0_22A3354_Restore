@implementation FCLocalAreasManager

- (FCLocalAreasManager)initWithContentContext:(id)a3
{
  FCContentContext *v4;
  FCLocalAreasManager *v5;
  FCContentContext *contentContext;
  FCContentContext *v7;
  FCAsyncSerialQueue *v8;
  FCAsyncSerialQueue *queue;
  FCOnce *v10;
  FCOnce *loadFromCacheOnce;
  objc_super v13;

  v4 = (FCContentContext *)a3;
  v13.receiver = self;
  v13.super_class = (Class)FCLocalAreasManager;
  v5 = -[FCLocalAreasManager init](&v13, sel_init);
  contentContext = v5->_contentContext;
  v5->_contentContext = v4;
  v7 = v4;

  v8 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 17);
  queue = v5->_queue;
  v5->_queue = v8;

  v10 = -[FCOnce initWithOptions:]([FCOnce alloc], "initWithOptions:", 1);
  loadFromCacheOnce = v5->_loadFromCacheOnce;
  v5->_loadFromCacheOnce = v10;

  return v5;
}

- (void)fetchLocalAreasProvider:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[FCLocalAreasManager loadFromCacheOnce](self, "loadFromCacheOnce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__FCLocalAreasManager_fetchLocalAreasProvider___block_invoke;
  v7[3] = &unk_1E463AB18;
  v7[4] = self;
  objc_msgSend(v5, "executeOnce:", v7);

  -[FCLocalAreasManager localAreasMapping](self, "localAreasMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[FCLocalAreasManager _refreshWithQoS:completion:](self, "_refreshWithQoS:completion:", 17, 0);
    v4[2](v4, v6, 0);
  }
  else
  {
    -[FCLocalAreasManager _refreshWithQoS:completion:](self, "_refreshWithQoS:completion:", 25, v4);
  }

}

uint64_t __47__FCLocalAreasManager_fetchLocalAreasProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadFromCache");
}

- (void)_loadFromCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  FCResourcesFetchOperation *v8;
  void *v9;
  void *v10;
  FCResourcesFetchOperation *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[FCLocalAreasManager contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appConfigurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possiblyUnfetchedAppConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localAreasMappingResourceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    v8 = [FCResourcesFetchOperation alloc];
    -[FCLocalAreasManager contentContext](self, "contentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v8, "initWithContext:resourceIDs:downloadAssets:", v9, v10, 0);

    -[FCFetchOperation setCachePolicy:](v11, "setCachePolicy:", 3);
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v11, "setCanSendFetchCompletionSynchronously:", 1);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__FCLocalAreasManager__loadFromCache__block_invoke_4;
    v13[3] = &unk_1E4642E38;
    v13[4] = self;
    -[FCFetchOperation setFetchCompletionBlock:](v11, "setFetchCompletionBlock:", v13);
    -[FCOperation start](v11, "start");
    -[FCResourcesFetchOperation waitUntilFinished](v11, "waitUntilFinished");

  }
  else
  {
    v12 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the config has no resource ID", buf, 2u);
    }
  }

}

void __37__FCLocalAreasManager__loadFromCache__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  FCLocalAreasMapping *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_onlyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    objc_msgSend(v5, "assetHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      v10 = -[FCLocalAreasMapping initWithData:]([FCLocalAreasMapping alloc], "initWithData:", v9);
      objc_msgSend(*(id *)(a1 + 32), "setLocalAreasMapping:", v10);

      objc_msgSend(v5, "fetchDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLocalAreasMappingFetchDate:", v11);

      v12 = (void *)FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_msgSend(v5, "fetchDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Found cached mapping resource with fetch date: %{public}@", (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      v16 = FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the asset hasn't been downloaded", (uint8_t *)&v17, 2u);
      }
    }

  }
  else
  {
    v15 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the record hasn't been fetched", (uint8_t *)&v17, 2u);
    }
  }

}

- (void)_refreshWithQoS:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  _QWORD v16[6];

  v6 = a4;
  -[FCLocalAreasManager localAreasMappingFetchDate](self, "localAreasMappingFetchDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[FCLocalAreasManager localAreasMappingFetchDate](self, "localAreasMappingFetchDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "fc_timeIntervalUntilNow"),
        v11 = v10,
        v9,
        v8,
        v11 <= 86400.0))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke;
    v16[3] = &unk_1E463B2D0;
    v16[4] = self;
    v16[5] = v6;
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke((uint64_t)v16);
  }
  else
  {
    -[FCLocalAreasManager queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2;
    v13[3] = &unk_1E4642EB0;
    v13[4] = self;
    v14 = v6;
    v15 = a3;
    objc_msgSend(v12, "withQualityOfService:enqueueBlock:", a3, v13);

  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "localAreasMapping");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void (**v7)(void *, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(void *, _QWORD);
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v23;
  id v24;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_3;
  aBlock[3] = &unk_1E4642E60;
  v5 = *(id *)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v23 = v5;
  v6 = v3;
  v24 = v6;
  v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "localAreasMappingFetchDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(*(id *)(a1 + 32), "localAreasMappingFetchDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "fc_timeIntervalUntilNow"),
        v12 = v11,
        v10,
        v9,
        v12 <= 86400.0))
  {
    v7[2](v7, 0);
  }
  else
  {
    v13 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Will refresh mapping resource", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "contentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appConfigurationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_11;
    v18[3] = &unk_1E4642E88;
    v18[4] = *(_QWORD *)(a1 + 32);
    v16 = v7;
    v17 = *(_QWORD *)(a1 + 48);
    v19 = v16;
    v20 = v17;
    FCAppConfigurationFetch(v15, v18);

  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "localAreasMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v6);

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  FCResourcesFetchOperation *v10;
  void *v11;
  void *v12;
  FCResourcesFetchOperation *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[6];
  uint8_t buf[4];
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possiblyUnfetchedAppConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localAreasMappingResourceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    v10 = [FCResourcesFetchOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "contentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v10, "initWithContext:resourceIDs:downloadAssets:", v11, v12, 1);

    -[FCFetchOperation setCachePolicy:](v13, "setCachePolicy:", 4);
    -[FCFetchOperation setMaximumCachedAge:](v13, "setMaximumCachedAge:", 86400.0);
    -[FCOperation setQualityOfService:](v13, "setQualityOfService:", *(_QWORD *)(a1 + 48));
    v14 = *(_QWORD *)(a1 + 48);
    if (v14 == 9)
      v15 = -1;
    else
      v15 = v14 == 33 || v14 == 25;
    -[FCOperation setRelativePriority:](v13, "setRelativePriority:", v15);
    v18 = (void *)FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[FCOperation shortOperationDescription](v13, "shortOperationDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Will issue mapping resource fetch operation: %{public}@", buf, 0xCu);

    }
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_13;
    v25 = &unk_1E463F678;
    v21 = *(id *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 32);
    v27 = v21;
    -[FCFetchOperation setFetchCompletionBlock:](v13, "setFetchCompletionBlock:", &v22);
    -[FCOperation start](v13, "start", v22, v23, v24, v25);

  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_12;
    v28[3] = &unk_1E463B2D0;
    v16 = *(void **)(a1 + 40);
    v28[4] = v4;
    v28[5] = v16;
    v17 = v16;
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_12((uint64_t)v28);

  }
}

uint64_t __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_12(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "App config has no mapping resource ID", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FCLocalAreasMapping *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t v18[16];
  _QWORD v19[6];
  _QWORD v20[6];

  v3 = a2;
  objc_msgSend(v3, "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_onlyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    objc_msgSend(v6, "assetHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
      v11 = -[FCLocalAreasMapping initWithData:]([FCLocalAreasMapping alloc], "initWithData:", v10);
      objc_msgSend(*(id *)(a1 + 32), "setLocalAreasMapping:", v11);

      objc_msgSend(v6, "fetchDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLocalAreasMappingFetchDate:", v12);

      v13 = FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Successfully fetched mapping resource", v18, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_15;
      v19[3] = &unk_1E463B790;
      v16 = *(_QWORD *)(a1 + 40);
      v19[4] = v6;
      v19[5] = v16;
      v17 = v6;
      __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_15((uint64_t)v19);

    }
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14;
    v20[3] = &unk_1E463B790;
    v14 = *(_QWORD *)(a1 + 40);
    v20[4] = v3;
    v20[5] = v14;
    v15 = v3;
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14((uint64_t)v20);

  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch mapping resource with error: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "assetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "downloadError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch mapping resource with error: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (FCLocalAreasMapping)localAreasMapping
{
  return (FCLocalAreasMapping *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalAreasMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)localAreasMappingFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalAreasMappingFetchDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FCOnce)loadFromCacheOnce
{
  return self->_loadFromCacheOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadFromCacheOnce, 0);
  objc_storeStrong((id *)&self->_localAreasMappingFetchDate, 0);
  objc_storeStrong((id *)&self->_localAreasMapping, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
