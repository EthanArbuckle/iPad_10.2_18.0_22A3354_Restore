@implementation FCAudioFeedConfigOperation

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
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("audio feed config operation requires a context"));
      v5 = 136315906;
      v6 = "-[FCAudioFeedConfigOperation validateOperation]";
      v7 = 2080;
      v8 = "FCAudioFeedConfigOperation.m";
      v9 = 1024;
      v10 = 58;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[3];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
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
  v31[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v8, "setTopLevelRecordIDs:", v12);

  v29[0] = CFSTR("AudioConfig");
  v28[0] = CFSTR("curatedArticleIDs");
  v28[1] = CFSTR("dailyBriefingArticleID");
  v28[2] = CFSTR("heroArticleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v29[1] = CFSTR("ArticleList");
  v27 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  v29[2] = CFSTR("Article");
  v26[0] = CFSTR("sourceChannelTagID");
  v26[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  v30[3] = MEMORY[0x1E0C9AA60];
  v29[3] = CFSTR("Tag");
  v29[4] = CFSTR("Issue");
  v30[4] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v8, "setLinkKeysByRecordType:", v16);

  v24 = CFSTR("AudioConfig");
  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 300.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v8, "setCachePoliciesByRecordType:", v18);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_2;
  v21[3] = &unk_1E4642E10;
  v22 = v6;
  v23 = v5;
  v19 = v5;
  v20 = v6;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v8, "setRecordChainCompletionHandler:", v21);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8);
  -[FCOperation start](v8, "start");

}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
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
  v14[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke;
  v14[3] = &unk_1E463D3A8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_2;
  v13[3] = &unk_1E463E9E8;
  v13[4] = self;
  objc_msgSend(v4, "thenOn:then:", v5, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_3;
  v12[3] = &unk_1E4642DE8;
  v12[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __46__FCAudioFeedConfigOperation_performOperation__block_invoke_4;
  v11[3] = &unk_1E463EA38;
  v11[4] = self;
  v10 = (id)objc_msgSend(v8, "errorOn:error:", v9, v11);

}

id __46__FCAudioFeedConfigOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 376), "configurationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    FCCoreConfigurationPromise(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSString *v6;
  NSString *resultLegacyConfig;
  id v8;

  v8 = a3;
  -[FCAudioFeedConfigOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCAudioFeedConfigOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v6 = self->_resultFeedConfig;
      resultLegacyConfig = self->_resultLegacyConfig;
    }
    else
    {
      v6 = 0;
      resultLegacyConfig = 0;
    }
    ((void (**)(_QWORD, NSString *, NSString *, id))v5)[2](v5, v6, resultLegacyConfig, v8);

  }
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (FCAudioFeedConfigOperation)initWithContext:(id)a3
{
  id v5;
  FCAudioFeedConfigOperation *v6;
  FCAudioFeedConfigOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAudioFeedConfigOperation;
  v6 = -[FCOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

id __46__FCAudioFeedConfigOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke;
    v7[3] = &unk_1E463F188;
    v7[4] = v2;
    v8 = v3;
    v5 = (void *)objc_msgSend(v4, "initWithResolver:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(id, _QWORD);
  id v11;
  _QWORD v12[5];

  if (a3)
  {
    v10 = (void (**)(id, _QWORD))*(id *)(a1 + 32);
    v10[2](v10, a3);

  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E470A928);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "onlyRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v8 = *(_QWORD *)(a1 + 40);
      +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_18;
      v12[3] = &unk_1E463B598;
      v12[4] = *(_QWORD *)(a1 + 32);
      __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_18((uint64_t)v12);
    }

  }
}

uint64_t __46__FCAudioFeedConfigOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    objc_storeStrong((id *)(v5 + 384), v4);

  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    objc_storeStrong((id *)(v7 + 392), v6);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultLegacyConfig, 0);
  objc_storeStrong((id *)&self->_resultFeedConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

- (FCAudioFeedConfigOperation)init
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
    v8 = "-[FCAudioFeedConfigOperation init]";
    v9 = 2080;
    v10 = "FCAudioFeedConfigOperation.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAudioFeedConfigOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

uint64_t __46__FCAudioFeedConfigOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

void __61__FCAudioFeedConfigOperation__promiseAudioConfigsWithConfig___block_invoke_18(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
