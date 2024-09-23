@implementation FCMultiSourceHeadlinesOperation

- (FCMultiSourceHeadlinesOperation)init
{
  FCMultiSourceHeadlinesOperation *v2;
  uint64_t v3;
  FCCachePolicy *cachePolicyForArticleLists;
  uint64_t v5;
  NSArray *articleListIDs;
  uint64_t v7;
  NSSet *articleIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCMultiSourceHeadlinesOperation;
  v2 = -[FCOperation init](&v10, sel_init);
  if (v2)
  {
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 300.0);
    v3 = objc_claimAutoreleasedReturnValue();
    cachePolicyForArticleLists = v2->_cachePolicyForArticleLists;
    v2->_cachePolicyForArticleLists = (FCCachePolicy *)v3;

    v5 = objc_opt_new();
    articleListIDs = v2->_articleListIDs;
    v2->_articleListIDs = (NSArray *)v5;

    v7 = objc_opt_new();
    articleIDs = v2->_articleIDs;
    v2->_articleIDs = (NSSet *)v7;

  }
  return v2;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[FCMultiSourceHeadlinesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-source headlines operation needs a configuration"));
    v14 = 136315906;
    v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
    v16 = 2080;
    v17 = "FCMultiSourceHeadlinesOperation.m";
    v18 = 1024;
    v19 = 53;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCMultiSourceHeadlinesOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-source headlines operation needs a context"));
    v14 = 136315906;
    v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
    v16 = 2080;
    v17 = "FCMultiSourceHeadlinesOperation.m";
    v18 = 1024;
    v19 = 54;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  if (-[FCMultiSourceHeadlinesOperation shouldBypassRecordSourcePersistence](self, "shouldBypassRecordSourcePersistence")&& (-[FCMultiSourceHeadlinesOperation heldRecordsByType](self, "heldRecordsByType"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-source headlines operation requires a cached records lookup block whenever record source persistence is bypassed"));
      v14 = 136315906;
      v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
      v16 = 2080;
      v17 = "FCMultiSourceHeadlinesOperation.m";
      v18 = 1024;
      v19 = 57;
      v20 = 2114;
      v21 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[FCMultiSourceHeadlinesOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FCMultiSourceHeadlinesOperation context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v6;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)performOperation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCRecordChainFetchOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[3];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMultiSourceHeadlinesOperation articleIDs](self, "articleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[FCMultiSourceHeadlinesOperation articleListIDs](self, "articleListIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v5;
    v46 = 2048;
    v47 = v7;
    v48 = 2048;
    v49 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch headlines for articleIDs:%lu articleListIDs:%lu", buf, 0x20u);

  }
  -[FCMultiSourceHeadlinesOperation articleIDs](self, "articleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCMultiSourceHeadlinesOperation articleListIDs](self, "articleListIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCMultiSourceHeadlinesOperation heldRecordsByType](self, "heldRecordsByType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCMultiSourceHeadlinesOperation shouldBypassRecordSourcePersistence](self, "shouldBypassRecordSourcePersistence");
  -[FCMultiSourceHeadlinesOperation context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E08];
  v42[0] = CFSTR("Article");
  v41[0] = CFSTR("sourceChannelTagID");
  v41[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v14;
  v43[1] = MEMORY[0x1E0C9AA60];
  v42[1] = CFSTR("Tag");
  v42[2] = CFSTR("Issue");
  v43[2] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v40 = CFSTR("articleIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("ArticleList"));

  }
  v18 = objc_alloc_init(FCRecordChainFetchOperation);
  -[FCRecordChainFetchOperation setContext:](v18, "setContext:", v12);
  v19 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v9, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fc_arrayByAddingObjectsFromArray:toArray:", v20, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v18, "setTopLevelRecordIDs:", v21);

  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v18, "setLinkKeysByRecordType:", v16);
  v38 = CFSTR("ArticleList");
  -[FCMultiSourceHeadlinesOperation cachePolicyForArticleLists](self, "cachePolicyForArticleLists");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v18, "setCachePoliciesByRecordType:", v23);

  -[FCRecordChainFetchOperation setShouldReturnErrorWhenSomeRecordsMissing:](v18, "setShouldReturnErrorWhenSomeRecordsMissing:", 1);
  -[FCRecordChainFetchOperation setShouldBypassRecordSourcePersistence:](v18, "setShouldBypassRecordSourcePersistence:", v11);
  v24 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke;
    v36[3] = &unk_1E4646040;
    v25 = v36;
    v29 = &v37;
    v37 = v30;
  }
  else
  {
    v25 = 0;
  }
  -[FCRecordChainFetchOperation setCachedRecordsLookupBlock:](v18, "setCachedRecordsLookupBlock:", v25);
  objc_initWeak((id *)buf, v18);
  v31[0] = v24;
  v31[1] = 3221225472;
  v31[2] = __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_2;
  v31[3] = &unk_1E46460A8;
  v31[4] = self;
  v26 = v10;
  v32 = v26;
  v27 = v9;
  v33 = v27;
  v28 = v12;
  v34 = v28;
  objc_copyWeak(&v35, (id *)buf);
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v18, "setRecordChainCompletionHandler:", v31);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v18);
  -[FCOperation start](v18, "start");
  objc_destroyWeak(&v35);

  objc_destroyWeak((id *)buf);
  if (v11)

}

id __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heldRecordsForIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id WeakRetained;
  void *v46;
  NSObject *log;
  NSObject *loga;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470ACB8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470ACD0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470ACE8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470AD00);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    objc_msgSend(v12, "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v51 = v14;
    v52 = 2048;
    v53 = objc_msgSend(v7, "count");
    v54 = 2048;
    v55 = objc_msgSend(v6, "count");
    v56 = 2048;
    v57 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received articleRecords:%lu articleListRecords:%lu tagRecords:%lu requireSourceChannels:YES", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 40) && v7 && v9 && v6)
  {
    objc_msgSend(v6, "transformRecordsWithBlock:", &__block_literal_global_116);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      log = v16;
      objc_msgSend(v17, "shortOperationDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "count");
      v20 = v7;
      v21 = v6;
      v22 = v10;
      v23 = v8;
      v24 = v19;
      v25 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138543874;
      v51 = v18;
      v52 = 2048;
      v53 = v24;
      v8 = v23;
      v10 = v22;
      v6 = v21;
      v7 = v20;
      v54 = 2048;
      v55 = v25;
      _os_log_impl(&dword_1A1B90000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ transformed articleListRecords:%lu into articleLists:%lu", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "assetManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v10, v26, v7, v9, v8, v15, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultArticleListHeadlinesByArticleListID:", v27);

    objc_msgSend(v15, "fc_dictionaryWithKeyBlock:", &__block_literal_global_22_2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultArticleListsByID:", v28);

  }
  if (*(_QWORD *)(a1 + 48) && v7 && v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "tagController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "channelsForTagRecords:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "assetManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleIDFromHeldRecords(v10, v31, *(void **)(a1 + 48), v7, v30, v8, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultArticleIDHeadlinesByArticleID:", v32);

  }
  v33 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = *(void **)(a1 + 32);
    loga = v33;
    objc_msgSend(v34, "shortOperationDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resultArticleListHeadlinesByArticleListID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v9;
    v38 = v7;
    v39 = v6;
    v40 = v10;
    v41 = v8;
    v42 = objc_msgSend(v36, "count");
    objc_msgSend(*(id *)(a1 + 32), "resultArticleIDHeadlinesByArticleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 138543874;
    v51 = v35;
    v52 = 2048;
    v53 = v42;
    v8 = v41;
    v10 = v40;
    v6 = v39;
    v7 = v38;
    v9 = v37;
    v54 = 2048;
    v55 = v44;
    _os_log_impl(&dword_1A1B90000, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ result articleListHeadlinesByArticleListID:%lu articleIDHeadlinesByArticleID:%lu", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "networkEvents");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNetworkEvents:", v46);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v49);
}

FCArticleList *__51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FCArticleList *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FCArticleList initWithRecord:interestToken:]([FCArticleList alloc], "initWithRecord:interestToken:", v5, v4);

  return v6;
}

uint64_t __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FCMultiSourceHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCMultiSourceHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCMultiSourceHeadlinesOperation resultArticleListHeadlinesByArticleListID](self, "resultArticleListHeadlinesByArticleListID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMultiSourceHeadlinesOperation resultArticleListsByID](self, "resultArticleListsByID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMultiSourceHeadlinesOperation resultArticleIDHeadlinesByArticleID](self, "resultArticleIDHeadlinesByArticleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9);

  }
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
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

- (NSArray)articleListIDs
{
  return self->_articleListIDs;
}

- (void)setArticleListIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (FCCachePolicy)cachePolicyForArticleLists
{
  return self->_cachePolicyForArticleLists;
}

- (void)setCachePolicyForArticleLists:(id)a3
{
  objc_storeStrong((id *)&self->_cachePolicyForArticleLists, a3);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (BOOL)shouldBypassRecordSourcePersistence
{
  return self->_shouldBypassRecordSourcePersistence;
}

- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3
{
  self->_shouldBypassRecordSourcePersistence = a3;
}

- (NSDictionary)heldRecordsByType
{
  return self->_heldRecordsByType;
}

- (void)setHeldRecordsByType:(id)a3
{
  objc_storeStrong((id *)&self->_heldRecordsByType, a3);
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSDictionary)resultArticleListHeadlinesByArticleListID
{
  return self->_resultArticleListHeadlinesByArticleListID;
}

- (void)setResultArticleListHeadlinesByArticleListID:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleListHeadlinesByArticleListID, a3);
}

- (NSDictionary)resultArticleListsByID
{
  return self->_resultArticleListsByID;
}

- (void)setResultArticleListsByID:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleListsByID, a3);
}

- (NSDictionary)resultArticleIDHeadlinesByArticleID
{
  return self->_resultArticleIDHeadlinesByArticleID;
}

- (void)setResultArticleIDHeadlinesByArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleIDHeadlinesByArticleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArticleIDHeadlinesByArticleID, 0);
  objc_storeStrong((id *)&self->_resultArticleListsByID, 0);
  objc_storeStrong((id *)&self->_resultArticleListHeadlinesByArticleListID, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_heldRecordsByType, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_cachePolicyForArticleLists, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_articleListIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
