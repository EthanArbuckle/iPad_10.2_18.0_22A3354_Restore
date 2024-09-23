@implementation NTTodayItemOperation

- (NTTodayItemOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTTodayItemOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  -[NTTodayItemOperation catchUpOperationResultsBySectionDescriptor](self, "catchUpOperationResultsBySectionDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.7();
  -[NTTodayItemOperation appConfiguration](self, "appConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.6();
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  -[NTTodayItemOperation contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.5();
  if (!v7)
    v6 = 0;
  -[NTTodayItemOperation feedPersonalizer](self, "feedPersonalizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.4();
  if (!v8)
    v6 = 0;
  -[NTTodayItemOperation operationInfo](self, "operationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.3();
  if (v9)
    v10 = v6;
  else
    v10 = 0;
  -[NTTodayItemOperation _extractFeedItemsFromInputs](self, "_extractFeedItemsFromInputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation setFeedItems:](self, "setFeedItems:", v11);
  if (objc_msgSend(v11, "count"))
  {
    -[NTTodayItemOperation forYouFetchInfo](self, "forYouFetchInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NTTodayItemOperation validateOperation].cold.2();
    if (!v12)
      v10 = 0;
  }
  -[NTTodayItemOperation todayItemCompletion](self, "todayItemCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation validateOperation].cold.1();
  if (v13)
    v14 = v10;
  else
    v14 = 0;

  return v14;
}

- (void)performOperation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__NTTodayItemOperation_performOperation__block_invoke;
  v2[3] = &unk_24DB5E350;
  v2[4] = self;
  -[NTTodayItemOperation _fetchProtoitemsWithCompletion:](self, "_fetchProtoitemsWithCompletion:", v2);
}

void __40__NTTodayItemOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a4);
  }
  else
  {
    v9 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 32), "operationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __40__NTTodayItemOperation_performOperation__block_invoke_2;
    v30[3] = &unk_24DB5E260;
    v14 = v7;
    v31 = v14;
    v15 = v10;
    v32 = v15;
    objc_msgSend(v12, "fc_array:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NTSharedLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      _os_log_impl(&dword_2197E6000, v17, OS_LOG_TYPE_INFO, "Start downloading assetHandles: %@", buf, 0xCu);
    }

    objc_msgSend(v16, "makeObjectsPerformSelector:withObject:", sel_downloadIfNeededWithGroup_, v9);
    objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
    FCDispatchQueueForQualityOfService();
    v18 = objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __40__NTTodayItemOperation_performOperation__block_invoke_21;
    v23[3] = &unk_24DB5E328;
    v19 = *(_QWORD *)(a1 + 32);
    v24 = v16;
    v25 = v19;
    v26 = v14;
    v27 = v11;
    v28 = v15;
    v29 = v8;
    v20 = v15;
    v21 = v11;
    v22 = v16;
    dispatch_group_notify(v9, v18, v23);

  }
}

void __40__NTTodayItemOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__NTTodayItemOperation_performOperation__block_invoke_3;
  v6[3] = &unk_24DB5E288;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __40__NTTodayItemOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "assetHandlesWithOperationInfo:", *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __40__NTTodayItemOperation_performOperation__block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NTSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_INFO, "Finished downloading assetHandles: %@", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__NTTodayItemOperation_performOperation__block_invoke_23;
  v13[3] = &unk_24DB5E2D8;
  v6 = *(void **)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v8;
  v17 = v4;
  v9 = v4;
  objc_msgSend(v6, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setResultTodayItemsBySectionDescriptor:", v10);

  objc_msgSend(*(id *)(a1 + 40), "setResultAssetFileURLsByRemoteURL:", v9);
  objc_msgSend(*(id *)(a1 + 40), "setResultRecordsHoldToken:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "setResultAssetsHoldToken:", *(_QWORD *)(a1 + 32));
  v11 = *(void **)(a1 + 40);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__NTTodayItemOperation_performOperation__block_invoke_3_27;
  v12[3] = &unk_24DB5E300;
  v12[4] = v11;
  objc_msgSend(v11, "_saveWithCompletion:", v12);

}

id __40__NTTodayItemOperation_performOperation__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__NTTodayItemOperation_performOperation__block_invoke_2_24;
  v10[3] = &unk_24DB5E2B0;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v6 = *(void **)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = v6;
  v7 = v5;
  objc_msgSend(a3, "fc_orderedSetByTransformingWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__NTTodayItemOperation_performOperation__block_invoke_2_24(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = (void *)a1[7];
  v7 = a2;
  objc_msgSend(v6, "todayData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:", v3, v4, v5, v8, a1[8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __40__NTTodayItemOperation_performOperation__block_invoke_3_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *, void *, void *, id);

  v4 = a3;
  -[NTTodayItemOperation todayItemCompletion](self, "todayItemCompletion");
  v9 = (void (**)(id, void *, void *, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation resultTodayItemsBySectionDescriptor](self, "resultTodayItemsBySectionDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation resultAssetFileURLsByRemoteURL](self, "resultAssetFileURLsByRemoteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation resultRecordsHoldToken](self, "resultRecordsHoldToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation resultAssetsHoldToken](self, "resultAssetsHoldToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v5, v6, v7, v8, v4);

}

- (void)_saveWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NTTodayItemOperation *v14;
  uint64_t v15;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation _saveWithCompletion:].cold.1();
  v5 = dispatch_group_create();
  v6 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  FCDispatchGroupWrap();
  -[NTTodayItemOperation contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10 = v6;
    v11 = 3221225472;
    v12 = __44__NTTodayItemOperation__saveWithCompletion___block_invoke_2;
    v13 = &unk_24DB5E378;
    v14 = self;
    FCDispatchGroupWrap();
  }
  -[NTTodayItemOperation qualityOfService](self, "qualityOfService", v10, v11, v12, v13, v14, v15, 3221225472, __44__NTTodayItemOperation__saveWithCompletion___block_invoke, &unk_24DB5E378, self);
  FCDispatchQueueForQualityOfService();
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, v9, v4);

}

void __44__NTTodayItemOperation__saveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "contentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveWithCompletionHandler:", v3);

}

void __44__NTTodayItemOperation__saveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "contentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveWithCompletionHandler:", v3);

}

- (id)_extractFeedItemsFromInputs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke;
  v3[3] = &unk_24DB5E3F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "fc_array:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "catchUpOperationResultsBySectionDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_2;
  v6[3] = &unk_24DB5E3C8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_3;
  v5[3] = &unk_24DB5E3A0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "needsFeedItemHeadlinesFetch"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "feedItemForHeadlineFetch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)_fetchProtoitemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  NTTodayItemOperation *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayItemOperation _fetchProtoitemsWithCompletion:].cold.1();
  -[NTTodayItemOperation forYouFetchInfo](self, "forYouFetchInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayItemOperation feedItems](self, "feedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  -[NTTodayItemOperation appConfiguration](self, "appConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v8);

  -[NTTodayItemOperation contentContext](self, "contentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v9);

  -[NTTodayItemOperation feedPersonalizer](self, "feedPersonalizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalizer:", v10);

  objc_msgSend(v7, "setFeedItems:", v6);
  objc_msgSend(v5, "feedContextByFeedID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFeedContextByFeedID:", v11);

  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke;
  v23[3] = &unk_24DB5E418;
  v24 = v5;
  v13 = v5;
  objc_msgSend(v7, "setRapidUpdateRefreshTest:", v23);
  objc_msgSend(v7, "setShouldFilterHeadlinesWithoutSourceChannels:", 1);
  v16 = v12;
  v17 = 3221225472;
  v18 = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_2;
  v19 = &unk_24DB5E4F8;
  v20 = v6;
  v21 = self;
  v22 = v4;
  v14 = v4;
  v15 = v6;
  objc_msgSend(v7, "setHeadlinesMapCompletionHandler:", &v16);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7, v16, v17, v18, v19);
  objc_msgSend(v7, "start");

}

uint64_t __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 >= 30.0)
    return objc_msgSend(*(id *)(a1 + 32), "attemptedCachedOnly", v2, v3) ^ 1;
  else
    return 0;
}

void __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v7 < objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_3;
    v17[3] = &unk_24DB5E440;
    v9 = &v18;
    v18 = v5;
    objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE6C9B0];
    v20[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "fc_partialFailureErrorWithUserInfo:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v6 = (id)v13;
LABEL_6:

    goto LABEL_7;
  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "catchUpOperationResultsBySectionDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_5;
    v15[3] = &unk_24DB5E4D0;
    v9 = &v16;
    v16 = v5;
    objc_msgSend(v10, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14 = 0;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

id __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_6;
  v7[3] = &unk_24DB5E4A8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "feedItemForHeadlineFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "protoitemWithFetchedFeedItemHeadline:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)catchUpOperationResultsBySectionDescriptor
{
  return self->_catchUpOperationResultsBySectionDescriptor;
}

- (void)setCatchUpOperationResultsBySectionDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (void)setAppConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (FCTodayPrivateData)todayData
{
  return self->_todayData;
}

- (void)setTodayData:(id)a3
{
  objc_storeStrong((id *)&self->_todayData, a3);
}

- (NTTodayResultOperationInfoProviding)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)todayItemCompletion
{
  return self->_todayItemCompletion;
}

- (void)setTodayItemCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSDictionary)resultTodayItemsBySectionDescriptor
{
  return self->_resultTodayItemsBySectionDescriptor;
}

- (void)setResultTodayItemsBySectionDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_resultTodayItemsBySectionDescriptor, a3);
}

- (NSDictionary)resultAssetFileURLsByRemoteURL
{
  return self->_resultAssetFileURLsByRemoteURL;
}

- (void)setResultAssetFileURLsByRemoteURL:(id)a3
{
  objc_storeStrong((id *)&self->_resultAssetFileURLsByRemoteURL, a3);
}

- (NSObject)resultRecordsHoldToken
{
  return self->_resultRecordsHoldToken;
}

- (void)setResultRecordsHoldToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultRecordsHoldToken, a3);
}

- (NSObject)resultAssetsHoldToken
{
  return self->_resultAssetsHoldToken;
}

- (void)setResultAssetsHoldToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultAssetsHoldToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultAssetsHoldToken, 0);
  objc_storeStrong((id *)&self->_resultRecordsHoldToken, 0);
  objc_storeStrong((id *)&self->_resultAssetFileURLsByRemoteURL, 0);
  objc_storeStrong((id *)&self->_resultTodayItemsBySectionDescriptor, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong(&self->_todayItemCompletion, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong((id *)&self->_todayData, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);
  objc_storeStrong((id *)&self->_catchUpOperationResultsBySectionDescriptor, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("today item operation requires catch up operation results"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_saveWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
  v2 = 136315906;
  v3 = "-[NTTodayItemOperation _saveWithCompletion:]";
  v4 = 2080;
  v5 = "NTTodayItemOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchProtoitemsWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
  v2 = 136315906;
  v3 = "-[NTTodayItemOperation _fetchProtoitemsWithCompletion:]";
  v4 = 2080;
  v5 = "NTTodayItemOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

@end
