@implementation FCChannelSectionHeadlinesFetchOperation

- (FCChannelSectionHeadlinesFetchOperation)init
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
    v8 = "-[FCChannelSectionHeadlinesFetchOperation init]";
    v9 = 2080;
    v10 = "FCChannelSectionHeadlinesFetchOperation.m";
    v11 = 1024;
    v12 = 139;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCChannelSectionHeadlinesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCChannelSectionHeadlinesFetchOperation)initWithCloudContext:(id)a3 channelID:(id)a4 maxHeadlinesCount:(unint64_t)a5 maxHeadlinesPerFeed:(unint64_t)a6 fetchWindow:(id)a7 sectionsCacheTimeToLive:(double)a8 edgeCacheHint:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  FCChannelSectionHeadlinesFetchOperation *v21;
  FCChannelSectionHeadlinesFetchOperation *v22;
  uint64_t v23;
  NSString *channelID;
  objc_super v26;

  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCChannelSectionHeadlinesFetchOperation;
  v21 = -[FCOperation init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_cloudContext, a3);
    v23 = objc_msgSend(v18, "copy");
    channelID = v22->_channelID;
    v22->_channelID = (NSString *)v23;

    v22->_maxHeadlinesCount = a5;
    v22->_maxHeadlinesPerFeed = a6;
    objc_storeStrong((id *)&v22->_fetchWindow, a7);
    v22->_sectionsCacheTimeToLive = a8;
    objc_storeStrong((id *)&v22->_edgeCacheHint, a9);
  }

  return v22;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FCChannelSectionHeadlinesFetchOperation cloudContext](self, "cloudContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Channel section headlines fetch operation must have a content context"));
    v12 = 136315906;
    v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    v14 = 2080;
    v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    v16 = 1024;
    v17 = 170;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCChannelSectionHeadlinesFetchOperation channelID](self, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Channel section headlines fetch operation must have a channel ID"));
    v12 = 136315906;
    v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    v14 = 2080;
    v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    v16 = 1024;
    v17 = 174;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCChannelSectionHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Channel section headlines fetch operation must have a fetch completion handler"));
    v12 = 136315906;
    v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    v14 = 2080;
    v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    v16 = 1024;
    v17 = 178;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__72;
  v31[4] = __Block_byref_object_dispose__72;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__72;
  v29[4] = __Block_byref_object_dispose__72;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__72;
  v27[4] = __Block_byref_object_dispose__72;
  v28 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke;
  v26[3] = &unk_1E463D3A8;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_2;
  v25[3] = &unk_1E4649798;
  v25[4] = self;
  v25[5] = v31;
  objc_msgSend(v18, "thenOn:then:", v17, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_3;
  v24[3] = &unk_1E46497C0;
  v24[4] = self;
  v24[5] = v29;
  objc_msgSend(v16, "thenOn:then:", v15, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_4;
  v23[3] = &unk_1E46497E8;
  v23[4] = self;
  v23[5] = v29;
  objc_msgSend(v14, "thenOn:then:", v13, v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_5;
  v22[3] = &unk_1E4649810;
  v22[4] = self;
  v22[5] = v27;
  v22[6] = v31;
  objc_msgSend(v4, "thenOn:then:", v5, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_6;
  v21[3] = &unk_1E4649838;
  v21[4] = self;
  v21[5] = v27;
  v21[6] = v31;
  objc_msgSend(v6, "thenOn:then:", v7, v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_7;
  v20[3] = &unk_1E4649860;
  v20[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_8;
  v19[3] = &unk_1E463EA38;
  v19[4] = self;
  v12 = (id)objc_msgSend(v10, "errorOn:error:", v11, v19);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configurationPromise");
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "channelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_channelAndSectionTagsPromiseWithChannelID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v5, "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_channelPromiseWithTagsByID:parentChannelID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 424), a2);
  v4 = a2;
  v5 = *(id **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v5[53], "sectionIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sectionsPromiseWithTagsByID:sectionIDs:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_feedItemsPromiseWithChannel:sectionsByID:configuration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_headlinesPromiseWithFeedItems:sectionsByID:configuration:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setSectionHeadlinesGroups:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  FCChannelSectionHeadlinesFetchResult *v4;
  void *v5;
  void *v6;
  FCChannelSectionHeadlinesFetchResult *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  v4 = [FCChannelSectionHeadlinesFetchResult alloc];
  -[FCChannelSectionHeadlinesFetchOperation channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCChannelSectionHeadlinesFetchOperation sectionHeadlinesGroups](self, "sectionHeadlinesGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCChannelSectionHeadlinesFetchResult initWithChannel:sectionHeadlinesGroups:](v4, "initWithChannel:sectionHeadlinesGroups:", v5, v6);

  -[FCChannelSectionHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FCChannelSectionHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, FCChannelSectionHeadlinesFetchResult *, id))v9)[2](v9, v7, v10);

  }
}

- (id)_configurationPromise
{
  void *v2;
  void *v3;
  void *v4;

  -[FCChannelSectionHeadlinesFetchOperation cloudContext](self, "cloudContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCCoreConfigurationPromise(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_channelAndSectionTagsPromiseWithChannelID:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCChannelSectionHeadlinesFetchOperation _channelAndSectionTagsPromiseWithChannelID:]";
    v14 = 2080;
    v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    v16 = 1024;
    v17 = 229;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke;
  v10[3] = &unk_1E463F188;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v10);

  return v7;
}

void __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tagController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionsCacheTimeToLive");
  objc_msgSend(v8, "fetchOperationForTagsIncludingChildrenWithIDs:softMaxAge:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCanSendFetchCompletionSynchronously:", 1);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke_2;
  v16 = &unk_1E4644260;
  v17 = v6;
  v18 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "setFetchCompletionBlock:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10, v13, v14, v15, v16);
  objc_msgSend(v10, "start");

}

void __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "fetchedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_channelPromiseWithTagsByID:(id)a3 parentChannelID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  FCChannelSectionHeadlinesFetchOperation *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagsByID");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCChannelSectionHeadlinesFetchOperation _channelPromiseWithTagsByID:parentChannelID:]";
    v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    v23 = 1024;
    v24 = 256;
    v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "parentChannelID");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCChannelSectionHeadlinesFetchOperation _channelPromiseWithTagsByID:parentChannelID:]";
    v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    v23 = 1024;
    v24 = 257;
    v25 = 2114;
    v26 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke;
  v15[3] = &unk_1E463F5A8;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithResolver:", v15);

  return v11;
}

void __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  _QWORD v13[6];

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asChannel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12[2](v12, v11);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2;
    v13[3] = &unk_1E463B790;
    v13[4] = *(_QWORD *)(a1 + 40);
    v13[5] = v5;
    __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2((uint64_t)v13);
  }

}

void __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "channelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch failed. The tag with identifer %@ is not a valid channel.", (uint8_t *)&v11, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "channelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_invalidChannelErrorForTagID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

}

- (id)_sectionsPromiseWithTagsByID:(id)a3 sectionIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  FCChannelSectionHeadlinesFetchOperation *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagsByID");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCChannelSectionHeadlinesFetchOperation _sectionsPromiseWithTagsByID:sectionIDs:]";
    v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    v23 = 1024;
    v24 = 272;
    v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sectionIDs");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCChannelSectionHeadlinesFetchOperation _sectionsPromiseWithTagsByID:sectionIDs:]";
    v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    v23 = 1024;
    v24 = 273;
    v25 = 2114;
    v26 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke;
  v15[3] = &unk_1E463F5A8;
  v16 = v7;
  v17 = v6;
  v18 = self;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_msgSend(v8, "initWithResolver:", v15);

  return v11;
}

void __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  void *v32;
  _QWORD v33[7];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v29 = a3;
  v32 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a1[4];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8);
      objc_msgSend(a1[5], "objectForKeyedSubscript:", v9, v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2;
        v33[3] = &unk_1E463CCB8;
        v33[4] = a1[6];
        v33[5] = v9;
        v28 = v29;
        v33[6] = v29;
        __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2((uint64_t)v33);

        v26 = v30;
        v27 = v32;
        goto LABEL_18;
      }
      objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "channel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultSectionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (!v17)
      {
        objc_msgSend(v13, "supergroupKnobs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEligible"))
        {

LABEL_12:
          v21 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            v22 = a1[6];
            v23 = v21;
            objc_msgSend(v22, "shortOperationDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "description");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v39 = v24;
            v40 = 2114;
            v41 = v25;
            _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Filtering out ineligible section: %{public}@", buf, 0x16u);

          }
          goto LABEL_14;
        }
        v19 = +[FCTagController isTagAllowed:](FCTagController, "isTagAllowed:", v13);

        if (!v19)
          goto LABEL_12;
      }
      objc_msgSend(v13, "asSection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v20, v9);

LABEL_14:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v26 = v30;
  v27 = v32;
  (*((void (**)(id, void *))v30 + 2))(v30, v32);
  v28 = v29;
LABEL_18:

}

void __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch failed. The tag with identifer %@ is not a valid section.", (uint8_t *)&v11, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(*(id *)(a1 + 32), "channelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_invalidChannelErrorForTagID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

}

- (id)_feedItemsPromiseWithChannel:(id)a3 sectionsByID:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channel");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsPromiseWithChannel:sectionsByID:configuration:]";
    v25 = 2080;
    v26 = "FCChannelSectionHeadlinesFetchOperation.m";
    v27 = 1024;
    v28 = 309;
    v29 = 2114;
    v30 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsPromiseWithChannel:sectionsByID:configuration:]";
    v25 = 2080;
    v26 = "FCChannelSectionHeadlinesFetchOperation.m";
    v27 = 1024;
    v28 = 310;
    v29 = 2114;
    v30 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v11 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke;
  v19[3] = &unk_1E46498B0;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = (void *)objc_msgSend(v11, "initWithResolver:", v19);

  return v15;
}

void __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke(id *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  FCFeedRequestOperation *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v39 = a3;
  objc_msgSend(a1[4], "fetchWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_dateByRoundingDownToNearestQuarterHour");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "fetchWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "earlierDate");
  v9 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v9;
  v42 = (void *)v7;
  +[FCFeedRange feedRangeFromDate:toDate:](FCFeedRange, "feedRangeFromDate:toDate:", v7, v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(a1[5], "sectionIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(a1[5], "freeFeedIDForSection:bin:", v17, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v19);
          objc_msgSend(a1[4], "_createFeedRequestWithFeedID:feedRange:", v19, v43);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          objc_msgSend(a1[5], "paidFeedIDForSection:bin:", v17, 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21 && (objc_msgSend(v21, "isEqualToString:", v19) & 1) == 0)
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v22);
            objc_msgSend(a1[4], "_createFeedRequestWithFeedID:feedRange:", v22, v43);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v23);

          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v14);
  }

  v24 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v25 = a1[4];
    v26 = v24;
    objc_msgSend(v25, "shortOperationDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dateRange");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v11, "count");
    objc_msgSend(a1[5], "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v54 = v27;
    v55 = 2112;
    v56 = v28;
    v57 = 2048;
    v58 = v29;
    v59 = 2112;
    v60 = v30;
    _os_log_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching feed items in range %@ for %lu number of feeds in channel %@", buf, 0x2Au);

  }
  v31 = objc_alloc_init(FCFeedRequestOperation);
  objc_msgSend(a1[4], "cloudContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setContext:](v31, "setContext:", v32);

  -[FCFeedRequestOperation setConfiguration:](v31, "setConfiguration:", a1[7]);
  -[FCFeedRequestOperation setFeedRequests:](v31, "setFeedRequests:", v11);
  -[FCFeedRequestOperation setMaxCount:](v31, "setMaxCount:", objc_msgSend(a1[4], "maxHeadlinesCount"));
  -[FCFeedRequestOperation setOptions:](v31, "setOptions:", 14);
  objc_msgSend(a1[4], "edgeCacheHint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation setEdgeCacheHint:](v31, "setEdgeCacheHint:", v33);

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke_89;
  v44[3] = &unk_1E4649888;
  v34 = a1[4];
  v47 = v39;
  v44[4] = v34;
  v35 = a1[7];
  v48 = v40;
  v45 = v35;
  v46 = v10;
  v36 = v10;
  v37 = v40;
  v38 = v39;
  -[FCFeedRequestOperation setRequestCompletionHandler:](v31, "setRequestCompletionHandler:", v44);
  objc_msgSend(a1[4], "associateChildOperation:", v31);
  -[FCOperation start](v31, "start");

}

void __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke_89(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  FCFeedItemsWithIDLookupResult *v9;
  id v10;

  v10 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_feedItemsTransformationWithConfiguration:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transformFeedItems:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    v9 = -[FCFeedItemsWithIDLookupResult initWithSectionIDByFeedID:feedItems:]([FCFeedItemsWithIDLookupResult alloc], "initWithSectionIDByFeedID:feedItems:", *(_QWORD *)(a1 + 48), v7);
    (*(void (**)(uint64_t, FCFeedItemsWithIDLookupResult *))(v8 + 16))(v8, v9);

  }
}

- (id)_headlinesPromiseWithFeedItems:(id)a3 sectionsByID:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  FCChannelSectionHeadlinesFetchOperation *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItemsResult");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    v27 = 2080;
    v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    v29 = 1024;
    v30 = 376;
    v31 = 2114;
    v32 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sectionsByID");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    v27 = 2080;
    v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    v29 = 1024;
    v30 = 377;
    v31 = 2114;
    v32 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    v27 = 2080;
    v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    v29 = 1024;
    v30 = 378;
    v31 = 2114;
    v32 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke;
  v20[3] = &unk_1E46498B0;
  v21 = v10;
  v22 = self;
  v23 = v8;
  v24 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = (void *)objc_msgSend(v11, "initWithResolver:", v20);

  return v15;
}

void __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "cloudContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContext:", v5);

  objc_msgSend(*(id *)(a1 + 48), "feedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeedItems:", v6);

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke_2;
  v12 = &unk_1E46498D8;
  v7 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  v16 = v3;
  v8 = v3;
  objc_msgSend(v4, "setHeadlinesMapCompletionHandler:", &v9);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v4, v9, v10, v11, v12, v13);
  objc_msgSend(v4, "start");

}

void __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FCChannelSectionHeadlinesOperationGroup *v14;
  void *v15;
  FCChannelSectionHeadlinesOperationGroup *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionIDsByFeedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(v4, "_headlinesAssembledBySectionFromFeedItemMap:sectionIDsByFeedID:sectionsByID:", v3, v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [FCChannelSectionHeadlinesOperationGroup alloc];
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FCChannelSectionHeadlinesOperationGroup initWithSection:headlines:](v14, "initWithSection:headlines:", v13, v15);
        objc_msgSend(v7, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_createFeedRequestWithFeedID:(id)a3 feedRange:(id)a4
{
  id v6;
  id v7;
  FCFeedRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(FCFeedRequest);
  -[FCFeedRequest setFeedID:](v8, "setFeedID:", v7);

  -[FCFeedRequest setMaxCount:](v8, "setMaxCount:", -[FCChannelSectionHeadlinesFetchOperation maxHeadlinesPerFeed](self, "maxHeadlinesPerFeed"));
  -[FCFeedRequest setFeedRange:](v8, "setFeedRange:", v6);

  return v8;
}

- (id)_headlinesAssembledBySectionFromFeedItemMap:(id)a3 sectionIDsByFeedID:(id)a4 sectionsByID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  v7 = a5;
  v8 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v7, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array", v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = v31;
  objc_msgSend(v31, "keyEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v22, "feedID", v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v22);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 1;
        if (!v28)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v27);

          v16 = v31;
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v19);
  }

  return v8;
}

- (id)_feedItemsTransformationWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCFeedTransformationComposite *v10;
  void *v12;
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsTransformationWithConfiguration:]";
    v16 = 2080;
    v17 = "FCChannelSectionHeadlinesFetchOperation.m";
    v18 = 1024;
    v19 = 444;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCChannelSectionHeadlinesFetchOperation cloudContext](self, "cloudContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedTransformationFilter transformationWithFilterOptions:configuration:context:](FCFeedTransformationFilter, "transformationWithFilterOptions:configuration:context:", 0x60002213CLL, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readingHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedTransformationUnreadOnly transformationWithReadingHistory:](FCFeedTransformationUnreadOnly, "transformationWithReadingHistory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCFeedTransformationComposite initWithFeedTransformations:]([FCFeedTransformationComposite alloc], "initWithFeedTransformations:", v9);

  return v10;
}

- (id)fetchCompletionHandler
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (unint64_t)maxHeadlinesCount
{
  return self->_maxHeadlinesCount;
}

- (unint64_t)maxHeadlinesPerFeed
{
  return self->_maxHeadlinesPerFeed;
}

- (FCDateRange)fetchWindow
{
  return self->_fetchWindow;
}

- (double)sectionsCacheTimeToLive
{
  return self->_sectionsCacheTimeToLive;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (NSArray)sectionHeadlinesGroups
{
  return self->_sectionHeadlinesGroups;
}

- (void)setSectionHeadlinesGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_sectionHeadlinesGroups, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_fetchWindow, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
