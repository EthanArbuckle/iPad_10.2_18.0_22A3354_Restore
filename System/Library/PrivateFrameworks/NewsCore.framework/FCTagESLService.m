@implementation FCTagESLService

- (FCTagESLService)initWithContext:(id)a3
{
  id v5;
  FCTagESLService *v6;
  FCTagESLService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTagESLService;
  v6 = -[FCTagESLService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (FCTagESLService)init
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
    v8 = "-[FCTagESLService init]";
    v9 = 2080;
    v10 = "FCTagESLService.m";
    v11 = 1024;
    v12 = 42;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagESLService init]");
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
  v27[3] = __Block_byref_object_copy__27;
  v27[4] = __Block_byref_object_dispose__27;
  v28 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v26[3] = &unk_1E463D3A8;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v25[3] = &unk_1E4640458;
  v25[4] = self;
  v25[5] = v27;
  objc_msgSend(v8, "thenOn:then:", v9, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v24[3] = &unk_1E4640480;
  v24[4] = self;
  v24[5] = v27;
  objc_msgSend(v10, "thenOn:then:", v11, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v22[3] = &unk_1E46404A8;
  v14 = v6;
  v23 = v14;
  objc_msgSend(v12, "thenOn:then:", v13, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v20[3] = &unk_1E463DB48;
  v17 = v14;
  v21 = v17;
  v18 = (id)objc_msgSend(v15, "errorOn:error:", v16, v20);

  _Block_object_dispose(v27, 8);
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseConfiguration");
}

id __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_promiseRelevantTagsWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseCuratedFeedItemsForTags:configuration:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

id __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __55__FCTagESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[FCTagESLService context](self, "context");
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
  v9[2] = __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke;
  v9[3] = &unk_1E463F188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v18[2] = __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_2;
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

void __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v14 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "keysOfEntriesPassingTest:", &__block_literal_global_43);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedPersonalizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rankTagIDsDescending:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "maxTagESLArticleListsToQuery"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v14, "nf_objectsForKeysWithoutMarker:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

uint64_t __57__FCTagESLService__promiseRelevantTagsWithConfiguration___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hasEvergreenArticleList");
}

- (id)_promiseCuratedFeedItemsForTags:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  FCTagESLService *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_2;
    v13[3] = &unk_1E463F5A8;
    v14 = v6;
    v15 = self;
    v16 = v7;
    v11 = (void *)objc_msgSend(v10, "initWithResolver:", v13);

  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "initWithValue:", MEMORY[0x1E0C9AA60]);
  }

  return v11;
}

void __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTagCuratedESLArticlesOperation *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  FCTagCuratedESLArticlesOperation *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCTagCuratedESLArticlesOperation alloc];
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleSubscriptionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCTagCuratedESLArticlesOperation initWithTags:context:configuration:bundleSubscriptionManager:](v7, "initWithTags:context:configuration:bundleSubscriptionManager:", v8, v9, v10, v12);

  v14 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[FCOperation shortOperationDescription](v13, "shortOperationDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v16;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "will fetch tag evergreen feed items with operation: %{public}@", buf, 0xCu);

  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_19;
  v22 = &unk_1E46404F0;
  v23 = v6;
  v24 = v5;
  v17 = v5;
  v18 = v6;
  -[FCTagCuratedESLArticlesOperation setCompletionHandler:](v13, "setCompletionHandler:", &v19);
  -[FCOperation start](v13, "start", v19, v20, v21, v22);

}

void __65__FCTagESLService__promiseCuratedFeedItemsForTags_configuration___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "did fetch %lu tag evergreen feed items", (uint8_t *)&v10, 0xCu);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

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
