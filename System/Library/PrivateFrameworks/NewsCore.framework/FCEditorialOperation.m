@implementation FCEditorialOperation

- (void)enumerateEditorialSectionsByRecencyWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FCEditorialOperation editorialSectionGroups](self, "editorialSectionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_180);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke_2;
  v8[3] = &unk_1E464A9E8;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "publishDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "section");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headlines");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, uint64_t))(v5 + 16))(v5, v8, v7, a4);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[FCEditorialOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("editorial operation must have a configuration"));
    v11 = 136315906;
    v12 = "-[FCEditorialOperation validateOperation]";
    v13 = 2080;
    v14 = "FCEditorialOperation.m";
    v15 = 1024;
    v16 = 65;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  -[FCEditorialOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("editorial catch-up operation must have a context"));
    v11 = 136315906;
    v12 = "-[FCEditorialOperation validateOperation]";
    v13 = 2080;
    v14 = "FCEditorialOperation.m";
    v15 = 1024;
    v16 = 66;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  -[FCEditorialOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FCEditorialOperation context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performOperation
{
  void *v3;
  FCForYouConfigHeadlinesOperation *v4;
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *, void *, void *, uint64_t);
  void *v20;
  FCEditorialOperation *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[FCEditorialOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(FCForYouConfigHeadlinesOperation);
  -[FCForYouConfigHeadlinesOperation setConfiguration:](v4, "setConfiguration:", v3);
  -[FCEditorialOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setContext:](v4, "setContext:", v5);

  -[FCEditorialOperation context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedPersonalizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setPersonalizer:](v4, "setPersonalizer:", v7);

  -[FCEditorialOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleSubscriptionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setBundleSubscriptionManager:](v4, "setBundleSubscriptionManager:", v9);

  -[FCForYouConfigHeadlinesOperation setFields:](v4, "setFields:", 92);
  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setForYouConfigCachePolicy:](v4, "setForYouConfigCachePolicy:", v10);

  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setArticleListCachePolicy:](v4, "setArticleListCachePolicy:", v11);

  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 15.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouConfigHeadlinesOperation setEditorialSectionTagCachePolicy:](v4, "setEditorialSectionTagCachePolicy:", v12);

  objc_msgSend(v3, "editorialChannelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FCForYouConfigHeadlinesOperation setShouldFetchEditorialSectionTags:](v4, "setShouldFetchEditorialSectionTags:", 1);
    objc_msgSend(v3, "editorialChannelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation setAdditionalTagIDs:](v4, "setAdditionalTagIDs:", v15);

  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __40__FCEditorialOperation_performOperation__block_invoke;
  v20 = &unk_1E464AA38;
  v21 = self;
  v22 = v3;
  v16 = v3;
  -[FCForYouConfigHeadlinesOperation setHeadlinesAndTagsCompletionHandler:](v4, "setHeadlinesAndTagsCompletionHandler:", &v17);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v4, v17, v18, v19, v20, v21);
  -[FCOperation start](v4, "start");

}

void __40__FCEditorialOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  FCSpotlightOperationResult *v25;
  void *v26;
  FCSpotlightOperationResult *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (a7)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a7);
  }
  else
  {
    objc_msgSend(v13, "trendingArticleListID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fc_safeObjectForKey:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = v19;
    else
      v21 = MEMORY[0x1E0C9AA60];
    objc_msgSend(*(id *)(a1 + 32), "setTrendingHeadlines:", v21);

    objc_msgSend(v13, "spotlightGroupConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "spotlightArticleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = [FCSpotlightOperationResult alloc];
    objc_msgSend(v13, "spotlightGroupConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[FCSpotlightOperationResult initWithSpotlightGroupConfig:headline:](v25, "initWithSpotlightGroupConfig:headline:", v26, v24);
    objc_msgSend(*(id *)(a1 + 32), "setSpotlightResult:", v27);

    v28 = (void *)MEMORY[0x1E0C99D20];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __40__FCEditorialOperation_performOperation__block_invoke_3;
    v30[3] = &unk_1E464AA10;
    v31 = v13;
    v32 = v17;
    v33 = v14;
    v34 = v15;
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v28, "fc_array:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEditorialSectionGroups:", v29);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  }

}

void __40__FCEditorialOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  FCEditorialOperationGroup *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "editorialGroupConfigs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v31 = v4;
    v32 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v4);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v6, "sectionID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(v6, "sectionID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE68A348))
              v12 = v11;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
          v13 = v12;

        }
        else
        {
          v13 = 0;
        }

        objc_msgSend(v6, "articleListID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = *(void **)(a1 + 48);
          objc_msgSend(v6, "articleListID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }

        objc_msgSend(v6, "articleListID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = *(void **)(a1 + 56);
          objc_msgSend(v6, "articleListID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
        }

        objc_msgSend(v6, "sectionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "editorialGemsSectionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (v13 && v17)
        {
          v25 = objc_msgSend(v21, "count") ? v24 : 1;
          if ((v25 & 1) == 0)
          {
            v26 = objc_alloc_init(FCEditorialOperationGroup);
            -[FCEditorialOperationGroup setSection:](v26, "setSection:", v13);
            -[FCEditorialOperationGroup setHeadlines:](v26, "setHeadlines:", v21);
            objc_msgSend(v17, "editorialMetadata");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "publishDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              -[FCEditorialOperationGroup setPublishDate:](v26, "setPublishDate:", v28);
            }
            else
            {
              objc_msgSend(v17, "lastModifiedDate");
              v29 = v3;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[FCEditorialOperationGroup setPublishDate:](v26, "setPublishDate:", v30);

              v3 = v29;
              v4 = v31;
            }

            objc_msgSend(v3, "addObject:", v26);
          }
        }

      }
      v33 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[FCEditorialOperation setError:](self, "setError:");
  -[FCEditorialOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCEditorialOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)trendingHeadlines
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setTrendingHeadlines:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (FCSpotlightOperationResult)spotlightResult
{
  return (FCSpotlightOperationResult *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSpotlightResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 400, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (id)fetchCompletionHandler
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (NSArray)editorialSectionGroups
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEditorialSectionGroups:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialSectionGroups, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spotlightResult, 0);
  objc_storeStrong((id *)&self->_trendingHeadlines, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
