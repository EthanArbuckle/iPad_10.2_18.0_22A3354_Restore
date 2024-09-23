@implementation FCTopKESLService

- (FCTopKESLService)initWithContext:(id)a3
{
  id v5;
  FCTopKESLService *v6;
  FCTopKESLService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTopKESLService;
  v6 = -[FCTopKESLService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (FCTopKESLService)init
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
    v8 = "-[FCTopKESLService init]";
    v9 = 2080;
    v10 = "FCTopKESLService.m";
    v11 = 1024;
    v12 = 44;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTopKESLService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;

  v19 = a3;
  v6 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__67;
  v27[4] = __Block_byref_object_dispose__67;
  v28 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v26[3] = &unk_1E463D3A8;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v25[3] = &unk_1E4640458;
  v25[4] = self;
  v25[5] = v27;
  objc_msgSend(v8, "thenOn:then:", v9, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v24[3] = &unk_1E4640480;
  v24[4] = self;
  v24[5] = v27;
  objc_msgSend(v10, "thenOn:then:", v11, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v22[3] = &unk_1E46404A8;
  v14 = v6;
  v23 = v14;
  objc_msgSend(v12, "thenOn:then:", v13, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v20[3] = &unk_1E463DB48;
  v17 = v14;
  v21 = v17;
  v18 = (id)objc_msgSend(v15, "errorOn:error:", v16, v20);

  _Block_object_dispose(v27, 8);
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseConfiguration");
}

id __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_promiseRelevantTagsWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseFeedItemsForTags:configuration:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

id __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __56__FCTopKESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[FCTopKESLService context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCCoreConfigurationPromise(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_promiseRelevantTagsWithConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke;
  v9[3] = &unk_1E463F188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tagController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscriptionList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allSubscribedTagIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = FCCurrentQoS();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke_2;
  v18[3] = &unk_1E463F558;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v20 = v6;
  v18[4] = v14;
  v19 = v15;
  v21 = v5;
  v16 = v5;
  v17 = v6;
  objc_msgSend(v8, "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v12, v13, v18, 1.79769313e308);

}

void __58__FCTopKESLService__promiseRelevantTagsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedPersonalizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankTagIDsDescending:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "maxTagESLArticleListsToQuery"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v12, "nf_objectsForKeysWithoutMarker:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

- (id)_promiseFeedItemsForTags:(id)a3 configuration:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v8 = v7;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_2;
    v11[3] = &unk_1E463F188;
    v11[4] = self;
    v12 = v5;
    v9 = (void *)objc_msgSend(v8, "initWithResolver:", v11);

  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "initWithValue:", MEMORY[0x1E0C9AA60]);
  }

  return v9;
}

void __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCDateRange *v7;
  void *v8;
  FCDateRange *v9;
  void *v10;
  FCFeedRequestOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCDateRange alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCDateRange initWithStartDate:timeInterval:](v7, "initWithStartDate:timeInterval:", v8, 604800.0);

  +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(FCFeedRequestOperation);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setContext:](v11, "setContext:", v12);

  +[FCFeedDatabase temporaryFeedDatabaseWithEndpoint:](FCFeedDatabase, "temporaryFeedDatabaseWithEndpoint:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setFeedDatabase:](v11, "setFeedDatabase:", v13);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setConfiguration:](v11, "setConfiguration:", v16);

  v17 = *(void **)(a1 + 40);
  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_3;
  v29[3] = &unk_1E4649308;
  v19 = v10;
  v30 = v19;
  v31 = xmmword_1A1E83510;
  objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setFeedRequests:](v11, "setFeedRequests:", v20);

  v21 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    -[FCOperation shortOperationDescription](v11, "shortOperationDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v23;
    _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "will fetch tag evergreen feed items with operation: %{public}@", buf, 0xCu);

  }
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_23;
  v26[3] = &unk_1E4643440;
  v27 = v6;
  v28 = v5;
  v24 = v5;
  v25 = v6;
  -[FCFeedRequestOperation setRequestCompletionHandler:](v11, "setRequestCompletionHandler:", v26);
  -[FCOperation start](v11, "start");

}

FCFeedRequest *__59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  FCFeedRequest *v4;
  void *v5;

  v3 = a2;
  v4 = objc_alloc_init(FCFeedRequest);
  objc_msgSend(v3, "feedIDForBin:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedRequest setFeedID:](v4, "setFeedID:", v5);
  -[FCFeedRequest setFeedRange:](v4, "setFeedRange:", a1[4]);
  -[FCFeedRequest setMaxCount:](v4, "setMaxCount:", a1[6]);
  return v4;
}

void __59__FCTopKESLService__promiseFeedItemsForTags_configuration___block_invoke_23(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(v6, "makeObjectsPerformSelector:", sel_markAsEvergreen);
    v9 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = 134217984;
      v12 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "did fetch %lu tag evergreen feed items", (uint8_t *)&v11, 0xCu);

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (FCCloudContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
