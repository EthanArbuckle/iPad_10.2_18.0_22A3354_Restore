@implementation FCCurrentIssuesFetchOperation

- (FCCurrentIssuesFetchOperation)init
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
    v8 = "-[FCCurrentIssuesFetchOperation init]";
    v9 = 2080;
    v10 = "FCCurrentIssuesFetchOperation.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCurrentIssuesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCCurrentIssuesFetchOperation)initWithContext:(id)a3
{
  id v5;
  FCCurrentIssuesFetchOperation *v6;
  FCCurrentIssuesFetchOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCurrentIssuesFetchOperation;
  v6 = -[FCOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)validateOperation
{
  void *v2;
  void *v4;
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
  -[FCCurrentIssuesFetchOperation context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current issues fetch operation requires a context"));
    v5 = 136315906;
    v6 = "-[FCCurrentIssuesFetchOperation validateOperation]";
    v7 = 2080;
    v8 = "FCCurrentIssuesFetchOperation.m";
    v9 = 1024;
    v10 = 64;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return v2 != 0;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  FCRecordChainFetchOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[FCCurrentIssuesFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paidBundleConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recommendableIssuesTagList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    v9 = objc_alloc_init(FCRecordChainFetchOperation);
    -[FCCurrentIssuesFetchOperation context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setContext:](v9, "setContext:", v10);

    +[FCEdgeCacheHint edgeCacheHintForCurrentIssues](FCEdgeCacheHint, "edgeCacheHintForCurrentIssues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setEdgeCacheHint:](v9, "setEdgeCacheHint:", v11);

    v28[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v9, "setTopLevelRecordIDs:", v12);

    v26[0] = CFSTR("TagList");
    v25 = CFSTR("tagIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v26[1] = CFSTR("Tag");
    v24 = CFSTR("latestIssueIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = CFSTR("Issue");
    v27[1] = v14;
    v27[2] = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v9, "setLinkKeysByRecordType:", v15);

    -[FCCurrentIssuesFetchOperation cachePolicy](self, "cachePolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 300.0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v22 = CFSTR("TagList");
    v23 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v9, "setCachePoliciesByRecordType:", v20);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2;
    v21[3] = &unk_1E463D040;
    v21[4] = self;
    -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v9, "setRecordChainCompletionHandler:", v21);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v9);
    -[FCOperation start](v9, "start");

  }
  else
  {
    -[FCCurrentIssuesFetchOperation setResultIssues:](self, "setResultIssues:", MEMORY[0x1E0C9AA60]);
    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
  }

}

void __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[5];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470A9A0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470A9B8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tagController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "channelsForTagRecords:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_15;
    v20[3] = &unk_1E4643D48;
    v20[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "heldRecordsPassingTest:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2_17;
    v17[3] = &unk_1E463F050;
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v11;
    v19 = v14;
    v15 = v11;
    objc_msgSend(v13, "transformRecordsWithBlock:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultIssues:", v16);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  }

}

uint64_t __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentStoreFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAllowedInStorefront:", v5);

  return v6;
}

FCIssue *__49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FCIssue *v11;
  void *v12;
  void *v13;
  FCIssue *v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "channelTagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    v11 = [FCIssue alloc];
    objc_msgSend(*(id *)(a1 + 40), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FCIssue initWithIssueRecord:assetManager:interestToken:sourceChannel:](v11, "initWithIssueRecord:assetManager:interestToken:sourceChannel:", v5, v13, v6, v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCurrentIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCurrentIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCurrentIssuesFetchOperation resultIssues](self, "resultIssues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)resultIssues
{
  return self->_resultIssues;
}

- (void)setResultIssues:(id)a3
{
  objc_storeStrong((id *)&self->_resultIssues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultIssues, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end
