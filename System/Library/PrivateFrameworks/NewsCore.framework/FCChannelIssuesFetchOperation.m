@implementation FCChannelIssuesFetchOperation

- (FCChannelIssuesFetchOperation)init
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
    v8 = "-[FCChannelIssuesFetchOperation init]";
    v9 = 2080;
    v10 = "FCChannelIssuesFetchOperation.m";
    v11 = 1024;
    v12 = 38;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCChannelIssuesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCChannelIssuesFetchOperation)initWithContext:(id)a3 channelIDs:(id)a4 issueSet:(int64_t)a5
{
  id v9;
  id v10;
  FCChannelIssuesFetchOperation *v11;
  FCChannelIssuesFetchOperation *v12;
  uint64_t v13;
  NSArray *channelIDs;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCChannelIssuesFetchOperation;
  v11 = -[FCOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    v13 = objc_msgSend(v10, "copy");
    channelIDs = v12->_channelIDs;
    v12->_channelIDs = (NSArray *)v13;

    v12->_issueSet = a5;
  }

  return v12;
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
  -[FCChannelIssuesFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("channel issues fetch operation requires a context"));
    v9 = 136315906;
    v10 = "-[FCChannelIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCChannelIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 61;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCChannelIssuesFetchOperation channelIDs](self, "channelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("channel issues fetch operation requires channel IDs"));
    v9 = 136315906;
    v10 = "-[FCChannelIssuesFetchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCChannelIssuesFetchOperation.m";
    v13 = 1024;
    v14 = 65;
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
  uint64_t v3;
  void *v4;
  FCRecordChainFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD v18[2];
  const __CFString *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v3 = MEMORY[0x1E0C809B0];
  v21[3] = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke;
  v16[3] = &unk_1E4643BA0;
  v16[4] = self;
  __49__FCChannelIssuesFetchOperation_performOperation__block_invoke((uint64_t)v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(FCRecordChainFetchOperation);
  -[FCChannelIssuesFetchOperation context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v5, "setContext:", v6);

  -[FCChannelIssuesFetchOperation channelIDs](self, "channelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v5, "setTopLevelRecordIDs:", v7);

  v21[0] = v4;
  v20[0] = CFSTR("Tag");
  v20[1] = CFSTR("IssueList");
  v19 = CFSTR("issueIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = CFSTR("Issue");
  v21[1] = v8;
  v21[2] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v5, "setLinkKeysByRecordType:", v9);

  -[FCChannelIssuesFetchOperation cachePolicy](self, "cachePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 300.0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v17[0] = CFSTR("Tag");
  v17[1] = CFSTR("IssueList");
  v18[0] = v13;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v5, "setCachePoliciesByRecordType:", v14);

  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2;
  v15[3] = &unk_1E463D040;
  v15[4] = self;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v5, "setRecordChainCompletionHandler:", v15);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
  -[FCOperation start](v5, "start");

}

id __49__FCChannelIssuesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString **v3;
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "issueSet");
  if (v1 == (void *)1)
  {
    v6 = CFSTR("latestIssueIDs");
    v7 = CFSTR("archiveIssueListID");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v6;
    v4 = 2;
    goto LABEL_5;
  }
  if (!v1)
  {
    v8[0] = CFSTR("latestIssueIDs");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = (const __CFString **)v8;
    v4 = 1;
LABEL_5:
    objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v6, v7, v8[0]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[6];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470AD90);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470ADA8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470ADC0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "channelsForTagRecords:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_18;
    v28[3] = &unk_1E4643D48;
    v28[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "heldRecordsPassingTest:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2_20;
    v25[3] = &unk_1E463F050;
    v15 = *(_QWORD *)(a1 + 32);
    v26 = v12;
    v27 = v15;
    v16 = v12;
    objc_msgSend(v14, "transformRecordsByIDWithBlock:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_4;
    v22[3] = &unk_1E4647678;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v9;
    v24 = v17;
    v19 = v9;
    v20 = v17;
    objc_msgSend(v18, "fc_dictionaryWithValueBlock:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultIssuesByChannel:", v21);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  }

}

uint64_t __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_18(uint64_t a1, void *a2)
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

FCIssue *__49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2_20(uint64_t a1, void *a2, void *a3)
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

id __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "issueSet");
  if (v5 == 1)
  {
    objc_msgSend(v3, "currentIssueIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "backIssuesListID");
    v9 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9;
    if (v9)
      v10 = (const __CFString *)v9;
    else
      v10 = &stru_1E464BC40;
    objc_msgSend(v8, "recordWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "issueIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v12);

    goto LABEL_8;
  }
  if (!v5)
  {
    objc_msgSend(v3, "currentIssueIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);
LABEL_8:

  }
  v13 = *(void **)(a1 + 48);
  objc_msgSend(v4, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nf_objectsForKeysWithoutMarker:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCChannelIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCChannelIssuesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCChannelIssuesFetchOperation resultIssuesByChannel](self, "resultIssuesByChannel");
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

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
  objc_storeStrong((id *)&self->_channelIDs, a3);
}

- (int64_t)issueSet
{
  return self->_issueSet;
}

- (void)setIssueSet:(int64_t)a3
{
  self->_issueSet = a3;
}

- (NSDictionary)resultIssuesByChannel
{
  return self->_resultIssuesByChannel;
}

- (void)setResultIssuesByChannel:(id)a3
{
  objc_storeStrong((id *)&self->_resultIssuesByChannel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultIssuesByChannel, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end
