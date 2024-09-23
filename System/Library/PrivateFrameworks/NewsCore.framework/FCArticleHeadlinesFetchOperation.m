@implementation FCArticleHeadlinesFetchOperation

- (id)fetchConfigWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[FCArticleHeadlinesFetchOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__FCArticleHeadlinesFetchOperation_fetchConfigWithCompletion___block_invoke;
  v9[3] = &unk_1E463F0E8;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  FCCoreConfigurationFetch(v6, v9);

  return 0;
}

- (id)fetchRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FCRecordChainFetchOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCArticleHeadlinesFetchOperation articleIDs](self, "articleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(FCRecordChainFetchOperation);
  -[FCArticleHeadlinesFetchOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v6, "setContext:", v7);

  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v6, "setTopLevelRecordIDs:", v5);
  v24[0] = CFSTR("Article");
  v23[0] = CFSTR("sourceChannelTagID");
  v23[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = MEMORY[0x1E0C9AA60];
  v24[1] = CFSTR("Tag");
  v24[2] = CFSTR("Issue");
  v25[2] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v6, "setLinkKeysByRecordType:", v9);

  v10 = (void *)objc_opt_new();
  if (-[FCArticleHeadlinesFetchOperation overrideArticleCachePolicy](self, "overrideArticleCachePolicy"))
    v11 = -[FCArticleHeadlinesFetchOperation articleCachePolicy](self, "articleCachePolicy");
  else
    v11 = -[FCFetchOperation cachePolicy](self, "cachePolicy");
  objc_msgSend(v10, "setCachePolicy:", v11);
  if (-[FCArticleHeadlinesFetchOperation overrideArticleCachePolicy](self, "overrideArticleCachePolicy"))
    -[FCArticleHeadlinesFetchOperation articleMaximumCachedAge](self, "articleMaximumCachedAge");
  else
    -[FCFetchOperation maximumCachedAge](self, "maximumCachedAge");
  objc_msgSend(v10, "setMaximumCachedAge:");
  v12 = (void *)objc_opt_new();
  if (-[FCArticleHeadlinesFetchOperation overrideTagCachePolicy](self, "overrideTagCachePolicy"))
    v13 = -[FCArticleHeadlinesFetchOperation tagCachePolicy](self, "tagCachePolicy");
  else
    v13 = -[FCFetchOperation cachePolicy](self, "cachePolicy");
  objc_msgSend(v12, "setCachePolicy:", v13);
  if (-[FCArticleHeadlinesFetchOperation overrideTagCachePolicy](self, "overrideTagCachePolicy"))
    -[FCArticleHeadlinesFetchOperation tagMaximumCachedAge](self, "tagMaximumCachedAge");
  else
    -[FCFetchOperation maximumCachedAge](self, "maximumCachedAge");
  objc_msgSend(v12, "setMaximumCachedAge:");
  v21[0] = CFSTR("Article");
  v21[1] = CFSTR("Tag");
  v22[0] = v10;
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v6, "setCachePoliciesByRecordType:", v14);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke;
  v18[3] = &unk_1E463B4B8;
  v18[4] = self;
  v19 = v5;
  v20 = v4;
  v15 = v4;
  v16 = v5;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v6, "setRecordChainCompletionHandler:", v18);

  return v6;
}

- (BOOL)overrideTagCachePolicy
{
  return self->_overrideTagCachePolicy;
}

- (BOOL)overrideArticleCachePolicy
{
  return self->_overrideArticleCachePolicy;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

void __62__FCArticleHeadlinesFetchOperation_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v9 = a2;
  v5 = a3;
  if (v5)
  {

    v6 = 0;
    v7 = 3;
  }
  else
  {
    v7 = 0;
    v6 = v9;
  }
  v10 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v6);
  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", v7, v10, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void (**v43)(void *, void *);
  void *v44;
  _QWORD aBlock[5];

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470AA78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470AA90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470AAA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "channelsForTagRecords:", v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetManager");
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleIDFromHeldRecords(v12, v15, v17, v7, v44, v9, objc_msgSend(*(id *)(a1 + 32), "shouldFilterHeadlinesWithoutSourceChannels"), 1);
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v16;
    v8 = v14;

    objc_msgSend(v19, "nf_objectsForKeysWithoutMarker:", *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultHeadlines:", v20);

    v7 = v18;
  }
  v21 = v9;
  v22 = v7;
  objc_msgSend(*(id *)(a1 + 32), "resultHeadlines", v44);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  objc_msgSend(*(id *)(a1 + 32), "articleIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v24 == v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultHeadlines");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v22;
    v30 = v21;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resultHeadlines");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fc_setByTransformingWithBlock:", &__block_literal_global_80);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "articleIDs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "fc_setByMinusingSet:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "resultHeadlines");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultHeadlines");
      v38 = v8;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v39, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v38;
      v29 = v22;
      v30 = v21;
    }
    else
    {
      v29 = v22;
      v30 = v21;
      if (objc_msgSend(*(id *)(a1 + 32), "cachePolicy") == 3)
      {
        v40 = 2;
        v41 = 0;
      }
      else
      {
        v40 = 3;
        v41 = v5;
      }
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", v40, 0, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "setMissingObjectDescriptions:", v35);

  }
  objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E46441E8;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v43 = (void (**)(void *, void *))_Block_copy(aBlock);
    v43[2](v43, v29);
    v43[2](v43, v8);
    v43[2](v43, v30);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (FCContentContext)context
{
  return self->_context;
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (BOOL)shouldFilterHeadlinesWithoutSourceChannels
{
  return self->_shouldFilterHeadlinesWithoutSourceChannels;
}

- (void)setResultHeadlines:(id)a3
{
  objc_storeStrong((id *)&self->_resultHeadlines, a3);
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (id)determineAppropriateFetchStepsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;

  v4 = (void (**)(id, _QWORD))a3;
  -[FCArticleHeadlinesFetchOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[FCMultiStepFetchOperation addNonCriticalFetchStep:](self, "addNonCriticalFetchStep:", sel_fetchConfigWithCompletion_);
  -[FCMultiStepFetchOperation addFetchStep:](self, "addFetchStep:", sel_fetchRecordsWithCompletion_);
  v4[2](v4, 0);

  return 0;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_ignoreCacheForArticleIDs, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (FCArticleHeadlinesFetchOperation)initWithContext:(id)a3 articleIDs:(id)a4 ignoreCacheForArticleIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCArticleHeadlinesFetchOperation *v12;
  FCArticleHeadlinesFetchOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCArticleHeadlinesFetchOperation;
  v12 = -[FCMultiStepFetchOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_articleIDs, a4);
    objc_storeStrong((id *)&v13->_ignoreCacheForArticleIDs, a5);
    -[FCMultiStepFetchOperation addFetchStep:](v13, "addFetchStep:", sel_determineAppropriateFetchStepsWithCompletion_);
  }

  return v13;
}

- (FCArticleHeadlinesFetchOperation)init
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
    v8 = "-[FCArticleHeadlinesFetchOperation init]";
    v9 = 2080;
    v10 = "FCArticleHeadlinesFetchOperation.m";
    v11 = 1024;
    v12 = 259;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleHeadlinesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

uint64_t __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v5[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_3;
  v5[3] = &unk_1E46441C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
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

- (void)setOverrideArticleCachePolicy:(BOOL)a3
{
  self->_overrideArticleCachePolicy = a3;
}

- (unint64_t)articleCachePolicy
{
  return self->_articleCachePolicy;
}

- (void)setArticleCachePolicy:(unint64_t)a3
{
  self->_articleCachePolicy = a3;
}

- (double)articleMaximumCachedAge
{
  return self->_articleMaximumCachedAge;
}

- (void)setArticleMaximumCachedAge:(double)a3
{
  self->_articleMaximumCachedAge = a3;
}

- (void)setOverrideTagCachePolicy:(BOOL)a3
{
  self->_overrideTagCachePolicy = a3;
}

- (unint64_t)tagCachePolicy
{
  return self->_tagCachePolicy;
}

- (void)setTagCachePolicy:(unint64_t)a3
{
  self->_tagCachePolicy = a3;
}

- (double)tagMaximumCachedAge
{
  return self->_tagMaximumCachedAge;
}

- (void)setTagMaximumCachedAge:(double)a3
{
  self->_tagMaximumCachedAge = a3;
}

- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3
{
  self->_shouldFilterHeadlinesWithoutSourceChannels = a3;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_articleIDs, a3);
}

- (NSArray)ignoreCacheForArticleIDs
{
  return self->_ignoreCacheForArticleIDs;
}

- (void)setIgnoreCacheForArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreCacheForArticleIDs, a3);
}

@end
