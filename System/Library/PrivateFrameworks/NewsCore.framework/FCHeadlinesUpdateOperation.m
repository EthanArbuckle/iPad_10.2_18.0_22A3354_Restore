@implementation FCHeadlinesUpdateOperation

- (FCHeadlinesUpdateOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCHeadlinesUpdateOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[FCHeadlinesUpdateOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("update headlines operation requires context"));
    v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    v19 = 1024;
    v20 = 40;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCHeadlinesUpdateOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("update headlines operation requires configuration"));
    v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    v19 = 1024;
    v20 = 44;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCHeadlinesUpdateOperation headlines](self, "headlines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("update headlines operation requires headlines"));
    v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    v19 = 1024;
    v20 = 48;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCHeadlinesUpdateOperation updateCompletion](self, "updateCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("update headlines operation requires completion"));
    v15 = 136315906;
    v16 = "-[FCHeadlinesUpdateOperation validateOperation]";
    v17 = 2080;
    v18 = "FCHeadlinesUpdateOperation.m";
    v19 = 1024;
    v20 = 52;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 1;
  return !v7 && v5 != 0 && v6 != 0;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  FCHeadlinesUpdateOperation *v15;
  id v16;

  -[FCHeadlinesUpdateOperation headlines](self, "headlines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_dictionaryWithKeyBlock:", &__block_literal_global_31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCHeadlinesUpdateOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "articleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchOperationForRecordsWithIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCachePolicy:", 4);
  -[FCHeadlinesUpdateOperation maxArticleAge](self, "maxArticleAge");
  objc_msgSend(v9, "setMaximumCachedAge:");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_2;
  v14 = &unk_1E463A9C0;
  v15 = self;
  v16 = v4;
  v10 = v4;
  objc_msgSend(v9, "setFetchCompletionBlock:", &v11);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v9, v11, v12, v13, v14, v15);
  objc_msgSend(v9, "start");

}

uint64_t __46__FCHeadlinesUpdateOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  FCHeadlineExperimentalTitleProvider *v5;
  void *v6;
  FCHeadlineExperimentalTitleProvider *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  FCHeadlineExperimentalTitleProvider *v17;

  v3 = a2;
  if (!objc_msgSend(v3, "status"))
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FCHeadlineExperimentalTitleProvider initWithShouldShowAlternateHeadlines:]([FCHeadlineExperimentalTitleProvider alloc], "initWithShouldShowAlternateHeadlines:", objc_msgSend(v4, "shouldShowAlternateHeadlines"));
    v6 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_3;
    v12[3] = &unk_1E463EF10;
    v13 = v3;
    v14 = *(id *)(a1 + 40);
    v15 = v4;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v5;
    v7 = v5;
    v8 = v4;
    objc_msgSend(v6, "fc_dictionary:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultHeadlinesByArticleID:", v9);

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishedPerformingOperationWithError:", v11);

}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E463EEE8;
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v13 = v5;
  v14 = v6;
  v15 = v4;
  v16 = v7;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v8, "enumerateRecordsAndInterestTokensWithBlock:", v10);

}

void __46__FCHeadlinesUpdateOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(v5, "parentIssue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    v19 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FCHeadlineWithHeldRecords(v14, v16, v4, *(void **)(a1 + 64), v9, 0, v13, *(void **)(a1 + 72));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v4);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, id);

  v4 = a3;
  -[FCHeadlinesUpdateOperation updateCompletion](self, "updateCompletion");
  v6 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  -[FCHeadlinesUpdateOperation resultHeadlinesByArticleID](self, "resultHeadlinesByArticleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v4);

}

- (NSArray)headlines
{
  return self->_headlines;
}

- (void)setHeadlines:(id)a3
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

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (double)maxArticleAge
{
  return self->_maxArticleAge;
}

- (void)setMaxArticleAge:(double)a3
{
  self->_maxArticleAge = a3;
}

- (id)updateCompletion
{
  return self->_updateCompletion;
}

- (void)setUpdateCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSDictionary)resultHeadlinesByArticleID
{
  return self->_resultHeadlinesByArticleID;
}

- (void)setResultHeadlinesByArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleID, 0);
  objc_storeStrong(&self->_updateCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_headlines, 0);
}

@end
