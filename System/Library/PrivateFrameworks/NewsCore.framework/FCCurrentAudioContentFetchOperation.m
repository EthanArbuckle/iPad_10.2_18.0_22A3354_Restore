@implementation FCCurrentAudioContentFetchOperation

- (FCCurrentAudioContentFetchOperation)init
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
    v8 = "-[FCCurrentAudioContentFetchOperation init]";
    v9 = 2080;
    v10 = "FCCurrentAudioContentFetchOperation.m";
    v11 = 1024;
    v12 = 54;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCurrentAudioContentFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCCurrentAudioContentFetchOperation)initWithContext:(id)a3
{
  id v5;
  FCCurrentAudioContentFetchOperation *v6;
  FCCurrentAudioContentFetchOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCurrentAudioContentFetchOperation;
  v6 = -[FCOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)validateOperation
{
  _BOOL4 v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current magazine content fetch operation requires a context"));
      v5 = 136315906;
      v6 = "-[FCCurrentAudioContentFetchOperation validateOperation]";
      v7 = 2080;
      v8 = "FCCurrentAudioContentFetchOperation.m";
      v9 = 1024;
      v10 = 73;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
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
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke;
  v14[3] = &unk_1E463D3A8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_2;
  v13[3] = &unk_1E463E9E8;
  v13[4] = self;
  objc_msgSend(v4, "thenOn:then:", v5, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_3;
  v12[3] = &unk_1E463F530;
  v12[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_4;
  v11[3] = &unk_1E463EA38;
  v11[4] = self;
  v10 = (id)objc_msgSend(v8, "errorOn:error:", v9, v11);

}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseConfiguration");
}

id __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a2;
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("audio_config_enabled"));

  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "_promiseContentWithConfiguration:", v3);
  else
    objc_msgSend(v6, "_promisePlaceholderContentWithConfiguration:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_3(uint64_t a1, char *newValue)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, newValue, newValue, 384);
    v3 = *(void **)(a1 + 32);
  }
  objc_msgSend(v3, "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __55__FCCurrentAudioContentFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  FCCurrentAudioContent *v7;
  FCCurrentAudioContent *v8;
  NSArray *recentHeadlines;
  NSArray *v10;
  uint64_t v11;
  FCCurrentAudioContent *v12;
  FCCurrentAudioContent *v13;
  NSArray *featuredHeadlines;
  NSArray *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  FCCurrentAudioContent *v18;
  FCCurrentAudioContent *v19;
  NSArray *v20;
  NSArray *v21;
  FCCurrentAudioContent *v22;
  NSArray *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = (id)FCOperationLog;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v7 = self->_resultCurrentContent;
      v8 = v7;
      if (v7)
      {
        recentHeadlines = v7->_recentHeadlines;
        goto LABEL_6;
      }
    }
    else
    {
      v8 = 0;
    }
    recentHeadlines = 0;
LABEL_6:
    v10 = recentHeadlines;
    v11 = -[NSArray count](v10, "count");
    if (self)
    {
      v12 = self->_resultCurrentContent;
      v13 = v12;
      if (v12)
      {
        featuredHeadlines = v12->_featuredHeadlines;
LABEL_9:
        v15 = featuredHeadlines;
        v24 = 138543874;
        v25 = v6;
        v26 = 2048;
        v27 = v11;
        v28 = 2048;
        v29 = -[NSArray count](v15, "count");
        _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu recent headlines, %lu featured headlines", (uint8_t *)&v24, 0x20u);

        goto LABEL_10;
      }
    }
    else
    {
      v13 = 0;
    }
    featuredHeadlines = 0;
    goto LABEL_9;
  }
LABEL_11:
  -[FCCurrentAudioContentFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FCCurrentAudioContentFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v18 = self->_resultCurrentContent;
      v19 = v18;
      if (v18)
        v20 = v18->_recentHeadlines;
      else
        v20 = 0;
      v21 = v20;
      v22 = self->_resultCurrentContent;
      self = (FCCurrentAudioContentFetchOperation *)v22;
      if (v22)
      {
        v23 = v22->_featuredHeadlines;
LABEL_17:
        ((void (**)(_QWORD, NSArray *, NSArray *, id))v17)[2](v17, v21, v23, v4);

        goto LABEL_18;
      }
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v23 = 0;
    goto LABEL_17;
  }
LABEL_18:

}

- (id)_promiseConfiguration
{
  void *v2;
  void *v3;

  if (self)
    self = (FCCurrentAudioContentFetchOperation *)self->_context;
  -[FCCurrentAudioContentFetchOperation configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCCoreConfigurationPromise(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_promiseContentWithConfiguration:(id)a3
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
  v9[2] = __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke;
  v9[3] = &unk_1E463F188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCRecordChainFetchOperation *v7;
  FCRecordChainFetchOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, void *, uint64_t);
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  const __CFString *v35;
  _QWORD v36[2];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCRecordChainFetchOperation);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 376);
  else
    v10 = 0;
  -[FCRecordChainFetchOperation setContext:](v7, "setContext:", v10);
  objc_msgSend(*(id *)(a1 + 40), "audioConfigRecordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v8, "setTopLevelRecordIDs:", v12);

  v37[0] = CFSTR("AudioConfig");
  v36[0] = CFSTR("latestAudioArticleListID");
  v36[1] = CFSTR("featuredAudioArticleListID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v13;
  v37[1] = CFSTR("ArticleList");
  v35 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v14;
  v37[2] = CFSTR("Article");
  v34[0] = CFSTR("sourceChannelTagID");
  v34[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v15;
  v38[3] = MEMORY[0x1E0C9AA60];
  v37[3] = CFSTR("Tag");
  v37[4] = CFSTR("Issue");
  v38[4] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v8, "setLinkKeysByRecordType:", v16);

  v32 = CFSTR("AudioConfig");
  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 3600.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v8, "setCachePoliciesByRecordType:", v18);

  +[FCEdgeCacheHint edgeCacheHintForAudioContent](FCEdgeCacheHint, "edgeCacheHintForAudioContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setEdgeCacheHint:](v8, "setEdgeCacheHint:", v19);

  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_2;
  v27 = &unk_1E463F558;
  v30 = v6;
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 32);
  v28 = v20;
  v29 = v21;
  v31 = v5;
  v22 = v5;
  v23 = v6;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v8, "setRecordChainCompletionHandler:", &v24);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v24, v25, v26, v27);
  -[FCOperation start](v8, "start");

}

void __72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a2;
  v27 = v5;
  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470A5E0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E470A5F8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E470A610);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E470A628);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E470A640);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(v8, "onlyRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    objc_msgSend(v7, "transformRecordsByIDWithBlock:", &__block_literal_global_34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)a1[4];
    v13 = (_QWORD *)a1[5];
    if (v13)
      v13 = (_QWORD *)v13[47];
    v15 = v13;
    objc_msgSend(v15, "assetManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v14, v16, v6, v10, v9, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "hasLatestAudioArticleListID"))
    {
      objc_msgSend(v11, "latestAudioArticleListID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (objc_msgSend(v11, "hasFeaturedAudioArticleListID"))
    {
      objc_msgSend(v11, "featuredAudioArticleListID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0C9AA60];
    }
    v23 = -[FCCurrentAudioContent initWithRecentHeadlines:featuredHeadlines:]([FCCurrentAudioContent alloc], v20, v22);
    (*(void (**)(void))(a1[7] + 16))();

  }
}

FCArticleList *__72__FCCurrentAudioContentFetchOperation__promiseContentWithConfiguration___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FCArticleList *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FCArticleList initWithRecord:interestToken:]([FCArticleList alloc], "initWithRecord:interestToken:", v5, v4);

  return v6;
}

- (id)_promisePlaceholderContentWithConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke;
  v9[3] = &unk_1E463F5A8;
  v9[4] = self;
  v10 = &unk_1E470C660;
  v11 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCArticleHeadlinesFetchOperation *v7;
  uint64_t v8;
  uint64_t v9;
  FCArticleHeadlinesFetchOperation *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = [FCArticleHeadlinesFetchOperation alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 376);
  else
    v9 = 0;
  v10 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v7, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v9, *(_QWORD *)(a1 + 40), 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_2;
  v13[3] = &unk_1E463F580;
  v15 = v6;
  v14 = *(id *)(a1 + 48);
  v16 = v5;
  v11 = v5;
  v12 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v10, "setFetchCompletionBlock:", v13);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10);
  -[FCOperation start](v10, "start");

}

void __83__FCCurrentAudioContentFetchOperation__promisePlaceholderContentWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  FCCurrentAudioContent *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, void *))v4[2])(v4, v5);

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "fetchedObject", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "paidBundleConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (double)arc4random_uniform(objc_msgSend(v12, "audioSuggestionsMaxAge"));

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dateByAddingTimeInterval:", -v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPublishDate:", v15);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v16 = [FCCurrentAudioContent alloc];
    objc_msgSend(v3, "fetchedObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[FCCurrentAudioContent initWithRecentHeadlines:featuredHeadlines:](v16, v17, MEMORY[0x1E0C9AA60]);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCurrentContent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
