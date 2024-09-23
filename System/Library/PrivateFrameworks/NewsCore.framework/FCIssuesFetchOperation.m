@implementation FCIssuesFetchOperation

- (FCIssuesFetchOperation)init
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
    v8 = "-[FCIssuesFetchOperation init]";
    v9 = 2080;
    v10 = "FCIssuesFetchOperation.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssuesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCIssuesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7;
  id v8;
  FCIssuesFetchOperation *v9;
  FCIssuesFetchOperation *v10;
  uint64_t v11;
  NSArray *issueIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssuesFetchOperation;
  v9 = -[FCOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    issueIDs = v10->_issueIDs;
    v10->_issueIDs = (NSArray *)v11;

  }
  return v10;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FCIssuesFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues fetch operation requires a context"));
    v9 = 136315906;
    v10 = "-[FCIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 60;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCIssuesFetchOperation issueIDs](self, "issueIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues fetch operation requires issue IDs"));
    v9 = 136315906;
    v10 = "-[FCIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 64;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)performOperation
{
  FCRecordChainFetchOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCRecordChainFetchOperation);
  -[FCIssuesFetchOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v3, "setContext:", v4);

  -[FCIssuesFetchOperation issueIDs](self, "issueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v3, "setTopLevelRecordIDs:", v5);

  v15[0] = CFSTR("Issue");
  v14 = CFSTR("channelTagID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("Tag");
  v16[0] = v6;
  v16[1] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v3, "setLinkKeysByRecordType:", v7);

  -[FCIssuesFetchOperation cachePolicy](self, "cachePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = CFSTR("Issue");
    -[FCIssuesFetchOperation cachePolicy](self, "cachePolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v3, "setCachePoliciesByRecordType:", v10);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke;
  v11[3] = &unk_1E463D040;
  v11[4] = self;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v3, "setRecordChainCompletionHandler:", v11);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v3);
  -[FCOperation start](v3, "start");

}

void __42__FCIssuesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(void *, void *);
  void *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[5];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470B450);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_2_15;
      v26[3] = &unk_1E4643D48;
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "heldRecordsPassingTest:", v26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470B468);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tagController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "channelsForTagRecords:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "issueIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v8;
        v22[1] = 3221225472;
        v22[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_19;
        v22[3] = &unk_1E463F050;
        v15 = v13;
        v16 = *(_QWORD *)(a1 + 32);
        v23 = v15;
        v24 = v16;
        objc_msgSend(v9, "transformRecordsInOrder:withBlock:", v14, v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setResultIssues:", v17);

        objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v21[0] = v8;
          v21[1] = 3221225472;
          v21[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_3_24;
          v21[3] = &unk_1E46441E8;
          v21[4] = *(_QWORD *)(a1 + 32);
          v19 = (void (**)(void *, void *))_Block_copy(v21);
          v19[2](v19, v7);
          v19[2](v19, v10);

        }
        objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);

      }
      else
      {
        v25[0] = v8;
        v25[1] = 3221225472;
        v25[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_3;
        v25[3] = &unk_1E463AD10;
        v25[4] = *(_QWORD *)(a1 + 32);
        v25[5] = v7;
        __42__FCIssuesFetchOperation_performOperation__block_invoke_3((uint64_t)v25);
      }

    }
    else
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v20, "setResultIssues:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(v20, "finishedPerformingOperationWithError:", 0);
    }

  }
}

uint64_t __42__FCIssuesFetchOperation_performOperation__block_invoke_2_15(uint64_t a1, void *a2)
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

void __42__FCIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allRecordIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_blockedInCurrentStorefrontErrorWithIdentifiers:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedPerformingOperationWithError:", v3);

}

FCIssue *__42__FCIssuesFetchOperation_performOperation__block_invoke_19(uint64_t a1, void *a2, void *a3)
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

void __42__FCIssuesFetchOperation_performOperation__block_invoke_3_24(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a2, "interestTokensByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_4;
  v5[3] = &unk_1E46441C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __42__FCIssuesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void (**v4)(id, id);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "interestTokenHandler");
  v4 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCIssuesFetchOperation resultIssues](self, "resultIssues");
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

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_issueIDs, a3);
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
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end
