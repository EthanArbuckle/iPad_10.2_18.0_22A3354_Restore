@implementation FCDraftIssuesFetchOperation

- (FCDraftIssuesFetchOperation)init
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
    v8 = "-[FCDraftIssuesFetchOperation init]";
    v9 = 2080;
    v10 = "FCDraftIssuesFetchOperation.m";
    v11 = 1024;
    v12 = 38;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCDraftIssuesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCDraftIssuesFetchOperation)initWithContext:(id)a3 issueListID:(id)a4
{
  id v7;
  id v8;
  FCDraftIssuesFetchOperation *v9;
  FCDraftIssuesFetchOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCDraftIssuesFetchOperation;
  v9 = -[FCOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_issueListID, a4);
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
  -[FCDraftIssuesFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues fetch operation requires a context"));
    v9 = 136315906;
    v10 = "-[FCDraftIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCDraftIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 59;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCDraftIssuesFetchOperation issueListID](self, "issueListID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetch operation requires issue list ID"));
    v9 = 136315906;
    v10 = "-[FCDraftIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCDraftIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 63;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[FCDraftIssuesFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issueListRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCDraftIssuesFetchOperation issueListID](self, "issueListID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOperationForRecordsWithIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__FCDraftIssuesFetchOperation_performOperation__block_invoke;
  v9[3] = &unk_1E4642E38;
  v9[4] = self;
  objc_msgSend(v8, "setFetchCompletionBlock:", v9);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v8);
  objc_msgSend(v8, "start");

}

void __47__FCDraftIssuesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  FCIssuesFetchOperation *v7;
  void *v8;
  FCIssuesFetchOperation *v9;
  void *v10;
  _QWORD v11[5];

  v3 = a2;
  objc_msgSend(v3, "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onlyRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issueIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [FCIssuesFetchOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FCIssuesFetchOperation initWithContext:issueIDs:](v7, "initWithContext:issueIDs:", v8, v6);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_3;
    v11[3] = &unk_1E463B408;
    v11[4] = *(_QWORD *)(a1 + 32);
    -[FCIssuesFetchOperation setFetchCompletionHandler:](v9, "setFetchCompletionHandler:", v11);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v9);
    -[FCOperation start](v9, "start");
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v9 = (FCIssuesFetchOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishedPerformingOperationWithError:", v9);
  }

}

uint64_t __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (!a3)
  {
    objc_msgSend(v4, "setResultIssues:", a2);
    v4 = *(void **)(a1 + 32);
    a3 = 0;
  }
  return objc_msgSend(v4, "finishedPerformingOperationWithError:", a3);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCDraftIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCDraftIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCDraftIssuesFetchOperation resultIssues](self, "resultIssues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

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

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)issueListID
{
  return self->_issueListID;
}

- (void)setIssueListID:(id)a3
{
  objc_storeStrong((id *)&self->_issueListID, a3);
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
  objc_storeStrong((id *)&self->_issueListID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
