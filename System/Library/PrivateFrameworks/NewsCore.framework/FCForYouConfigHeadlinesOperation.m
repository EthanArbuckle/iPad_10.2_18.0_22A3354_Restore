@implementation FCForYouConfigHeadlinesOperation

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
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
  -[FCForYouConfigHeadlinesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch ForYouConfig without a configuration"));
    v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    v19 = 1024;
    v20 = 57;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCForYouConfigHeadlinesOperation bundleSubscriptionManager](self, "bundleSubscriptionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch ForYouConfig headlines without a bundle subscription manager"));
    v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    v19 = 1024;
    v20 = 61;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCForYouConfigHeadlinesOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch ForYouConfig headlines without a context"));
    v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    v19 = 1024;
    v20 = 65;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  v6 = -[FCForYouConfigHeadlinesOperation fields](self, "fields");
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have headline fields to fetch ForYouConfig headlines"));
    v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    v19 = 1024;
    v20 = 69;
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
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FCRecordChainFetchOperation *v9;
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
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  FCForYouConfigHeadlinesOperation *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  const __CFString *v39;
  _QWORD v40[6];
  _QWORD v41[8];

  v41[6] = *MEMORY[0x1E0C80C00];
  -[FCForYouConfigHeadlinesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke;
  v35[3] = &unk_1E463AA30;
  v35[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v35);
  v5 = objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2;
  v34[3] = &unk_1E463AA30;
  v34[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D20];
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_3;
  v32[3] = &unk_1E463EFB0;
  v32[4] = self;
  v24 = v3;
  v33 = v24;
  objc_msgSend(v7, "fc_array:", v32);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(FCRecordChainFetchOperation);
  -[FCForYouConfigHeadlinesOperation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v9, "setContext:", v10);

  -[FCForYouConfigHeadlinesOperation _edgeCacheHint](self, "_edgeCacheHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setEdgeCacheHint:](v9, "setEdgeCacheHint:", v11);

  v25 = (void *)v8;
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v9, "setTopLevelRecordIDs:", v8);
  v40[0] = CFSTR("ArticleList");
  v39 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v12;
  v40[1] = CFSTR("Article");
  v38[0] = CFSTR("sourceChannelTagID");
  v38[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v13;
  v41[2] = v6;
  v40[2] = CFSTR("AudioConfig");
  v40[3] = CFSTR("ForYouConfig");
  v26 = (void *)v5;
  v41[3] = v5;
  v41[4] = MEMORY[0x1E0C9AA60];
  v40[4] = CFSTR("Issue");
  v40[5] = CFSTR("Tag");
  v41[5] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v9, "setLinkKeysByRecordType:", v14);

  v36[0] = CFSTR("ArticleList");
  -[FCForYouConfigHeadlinesOperation articleListCachePolicy](self, "articleListCachePolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[0] = v16;
  v36[1] = CFSTR("AudioConfig");
  -[FCForYouConfigHeadlinesOperation forYouConfigCachePolicy](self, "forYouConfigCachePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[1] = v18;
  v36[2] = CFSTR("ForYouConfig");
  -[FCForYouConfigHeadlinesOperation forYouConfigCachePolicy](self, "forYouConfigCachePolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v9, "setCachePoliciesByRecordType:", v21);

  if (!v19)
  if (!v17)

  v22 = MEMORY[0x1E0C809B0];
  if (!v15)

  if (-[FCForYouConfigHeadlinesOperation shouldFetchEditorialSectionTags](self, "shouldFetchEditorialSectionTags"))
  {
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_4;
    v29[3] = &unk_1E4644720;
    v30 = v24;
    v31 = self;
    -[FCRecordChainFetchOperation setDynamicCachePolicyBlock:](v9, "setDynamicCachePolicyBlock:", v29);

  }
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_5;
  v27[3] = &unk_1E46446B8;
  v27[4] = self;
  v28 = v24;
  v23 = v24;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v9, "setRecordChainCompletionHandler:", v27);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v9);
  -[FCOperation start](v9, "start");

}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("todayFeedTopStoriesArticleIDs"));
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("editorialArticleListIDs"));
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 8) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("trendingArticleListID"));
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("spotlightArticleID"));
  if (objc_msgSend(*(id *)(a1 + 32), "shouldFetchEditorialSectionTags"))
    objc_msgSend(v3, "addObject:", CFSTR("editorialSectionTagIDs"));

}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 0x40) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("dailyBriefingArticleID"));

}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "forYouConfigRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "additionalArticleListIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "additionalArticleListIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "additionalTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "additionalTagIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v9);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "audioConfigRecordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "audioConfigRecordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

    }
  }

}

id __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a2 == 2
    && (objc_msgSend(v5, "parentID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "editorialChannelID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    objc_msgSend(*(id *)(a1 + 40), "editorialSectionTagCachePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_6;
    v21[3] = &unk_1E463DAD0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_msgSend(v6, "initWithResolver:", v21);
    zalgo();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_8;
    v20[3] = &unk_1E4644748;
    v20[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "thenOn:then:", v9, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    zalgo();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_9;
    v16[3] = &unk_1E46406A8;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v17 = v12;
    v18 = v13;
    v19 = v14;
    v15 = (id)objc_msgSend(v10, "thenOn:then:", v11, v16);

  }
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "personalizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_7;
  v6[3] = &unk_1E463B598;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "prepareForUseWithCompletionHandler:", v6);

}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localTodayFeedConfiguration");
}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FCForYouConfig *v8;
  void *v9;
  FCForYouConfig *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AAC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AAD8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AAF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AB08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AB20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onlyRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = [FCForYouConfig alloc];
  objc_msgSend(v2, "onlyInterestToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v7;
  v10 = -[FCForYouConfig initWithRecord:interestToken:](v8, "initWithRecord:interestToken:", v7, v9);
  objc_msgSend(*(id *)(a1 + 40), "setResultForYouConfig:", v10);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tagController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tagsForTagRecords:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setResultTagsByID:", v13);

  v42 = v4;
  objc_msgSend(v4, "transformRecordsByIDWithBlock:", &__block_literal_global_81);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setResultArticleListsByID:", v14);

  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resultArticleListsByID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v15, v17, v5, v6, v3, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setResultHeadlinesByArticleListID:", v20);

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2_28;
  v47[3] = &unk_1E463AE18;
  v47[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    v22 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "assetManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "resultTagsByID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleIDFromHeldRecords(v22, v24, v21, v5, v25, v3, 1, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setResultHeadlinesByArticleID:", v26);

  }
  objc_msgSend(*(id *)(a1 + 40), "personalizer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v40 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "resultHeadlinesByArticleID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObjectsFromArray:", v30);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "resultHeadlinesByArticleListID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(v28, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v36++));
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v34);
    }

    objc_msgSend(*(id *)(a1 + 40), "personalizer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    FCAssignPersonalizationScoresToHeadlines(v28, v37, 0);

    v3 = v40;
  }
  objc_msgSend(*(id *)(a1 + 40), "resultForYouConfig");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setForYouConfig:", v38);

  objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", 0);
  return 0;
}

FCArticleList *__52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FCArticleList *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FCArticleList initWithRecord:interestToken:]([FCArticleList alloc], "initWithRecord:interestToken:", v5, v4);

  return v6;
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultForYouConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "todayFeedTopStoriesArticleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v4);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "fields") & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultForYouConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightArticleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultForYouConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "spotlightArticleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[FCForYouConfigHeadlinesOperation setError:](self, "setError:");
  -[FCForYouConfigHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCForYouConfigHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultForYouConfig](self, "resultForYouConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultArticleListsByID](self, "resultArticleListsByID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultHeadlinesByArticleListID](self, "resultHeadlinesByArticleListID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultHeadlinesByArticleID](self, "resultHeadlinesByArticleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9, v17);

  }
  -[FCForYouConfigHeadlinesOperation headlinesAndTagsCompletionHandler](self, "headlinesAndTagsCompletionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCForYouConfigHeadlinesOperation headlinesAndTagsCompletionHandler](self, "headlinesAndTagsCompletionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultForYouConfig](self, "resultForYouConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultArticleListsByID](self, "resultArticleListsByID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultHeadlinesByArticleListID](self, "resultHeadlinesByArticleListID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultHeadlinesByArticleID](self, "resultHeadlinesByArticleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouConfigHeadlinesOperation resultTagsByID](self, "resultTagsByID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, void *, void *, id))v11)[2](v11, v12, v13, v14, v15, v16, v17);

  }
}

- (id)_edgeCacheHint
{
  uint64_t v3;
  void *v4;
  void *v6;
  NSObject *v7;
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
  if ((-[FCForYouConfigHeadlinesOperation fields](self, "fields") & 4) != 0)
  {
    +[FCEdgeCacheHint edgeCacheHintForEditorial](FCEdgeCacheHint, "edgeCacheHintForEditorial");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((-[FCForYouConfigHeadlinesOperation fields](self, "fields") & 2) != 0)
  {
    +[FCEdgeCacheHint edgeCacheHintForTopStories](FCEdgeCacheHint, "edgeCacheHintForTopStories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v3 = -[FCForYouConfigHeadlinesOperation fields](self, "fields");
  if (v3 <= 7)
  {
    if (v3 == 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
      v9 = 136315906;
      v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
      v11 = 2080;
      v12 = "FCForYouConfigHeadlinesOperation.m";
      v13 = 1024;
      v14 = 283;
      v15 = 2114;
      v16 = v6;
      v7 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (v3 != 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
      v9 = 136315906;
      v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
      v11 = 2080;
      v12 = "FCForYouConfigHeadlinesOperation.m";
      v13 = 1024;
      v14 = 284;
      v15 = 2114;
      v16 = v6;
      v7 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    goto LABEL_11;
  }
  switch(v3)
  {
    case 8:
      +[FCEdgeCacheHint edgeCacheHintForTrending](FCEdgeCacheHint, "edgeCacheHintForTrending");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 16:
      +[FCEdgeCacheHint edgeCacheHintForSpotlight](FCEdgeCacheHint, "edgeCacheHintForSpotlight");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      if (v4)
        return v4;
      break;
    case 32:
      +[FCEdgeCacheHint edgeCacheHintForForYouConfig](FCEdgeCacheHint, "edgeCacheHintForForYouConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
  }
LABEL_11:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected to have an edge cache hint for all ForYouConfig operations"));
    v9 = 136315906;
    v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
    v11 = 2080;
    v12 = "FCForYouConfigHeadlinesOperation.m";
    v13 = 1024;
    v14 = 294;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  v4 = 0;
  return v4;
}

- (id)forYouConfigRecordID
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[FCForYouConfigHeadlinesOperation bundleSubscriptionManager](self, "bundleSubscriptionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedSubscription");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v4, (const void *)(v4 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  v7 = v6;
  objc_getAssociatedObject((id)v4, (const void *)~v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "unsignedIntegerValue") + 1) ^ (v7 + 1);

  -[FCForYouConfigHeadlinesOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
    objc_msgSend(v10, "forYouPremiumRecordConfigID");
  else
    objc_msgSend(v10, "forYouRecordConfigID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching the ForYouConfig with recordID: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  return v12;
}

- (id)localTodayFeedConfiguration
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("news.modules.today_feed.debug_feed_config.enabled"));

  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("news.modules.today_feed.debug_feed_config.url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (NFInternalBuild() && v3 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_3;
      v13[3] = &unk_1E463DAD0;
      v14 = v8;
      v10 = v8;
      v11 = (void *)objc_msgSend(v9, "initWithResolver:", v13);

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", 0);
    }

  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", 0);
  }

  return v11;
}

void __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_4;
  v8[3] = &unk_1E4644770;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "dataTaskWithURL:completionHandler:", v5, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resume");
}

void __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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

- (FCFeedPersonalizing)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_personalizer, a3);
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, a3);
}

- (int64_t)fields
{
  return self->_fields;
}

- (void)setFields:(int64_t)a3
{
  self->_fields = a3;
}

- (NSArray)additionalArticleListIDs
{
  return self->_additionalArticleListIDs;
}

- (void)setAdditionalArticleListIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSArray)additionalTagIDs
{
  return self->_additionalTagIDs;
}

- (void)setAdditionalTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (BOOL)shouldFetchEditorialSectionTags
{
  return self->_shouldFetchEditorialSectionTags;
}

- (void)setShouldFetchEditorialSectionTags:(BOOL)a3
{
  self->_shouldFetchEditorialSectionTags = a3;
}

- (FCCachePolicy)forYouConfigCachePolicy
{
  return self->_forYouConfigCachePolicy;
}

- (void)setForYouConfigCachePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_forYouConfigCachePolicy, a3);
}

- (FCCachePolicy)articleListCachePolicy
{
  return self->_articleListCachePolicy;
}

- (void)setArticleListCachePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_articleListCachePolicy, a3);
}

- (FCCachePolicy)editorialSectionTagCachePolicy
{
  return self->_editorialSectionTagCachePolicy;
}

- (void)setEditorialSectionTagCachePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_editorialSectionTagCachePolicy, a3);
}

- (FCForYouConfig)forYouConfig
{
  return (FCForYouConfig *)objc_getProperty(self, a2, 456, 1);
}

- (void)setForYouConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 464, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)headlinesAndTagsCompletionHandler
{
  return self->_headlinesAndTagsCompletionHandler;
}

- (void)setHeadlinesAndTagsCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (FCForYouConfig)resultForYouConfig
{
  return self->_resultForYouConfig;
}

- (void)setResultForYouConfig:(id)a3
{
  objc_storeStrong((id *)&self->_resultForYouConfig, a3);
}

- (NSDictionary)resultArticleListsByID
{
  return self->_resultArticleListsByID;
}

- (void)setResultArticleListsByID:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleListsByID, a3);
}

- (NSDictionary)resultHeadlinesByArticleListID
{
  return self->_resultHeadlinesByArticleListID;
}

- (void)setResultHeadlinesByArticleListID:(id)a3
{
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleListID, a3);
}

- (NSDictionary)resultHeadlinesByArticleID
{
  return self->_resultHeadlinesByArticleID;
}

- (void)setResultHeadlinesByArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleID, a3);
}

- (NSDictionary)resultTagsByID
{
  return self->_resultTagsByID;
}

- (void)setResultTagsByID:(id)a3
{
  objc_storeStrong((id *)&self->_resultTagsByID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagsByID, 0);
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleID, 0);
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleListID, 0);
  objc_storeStrong((id *)&self->_resultArticleListsByID, 0);
  objc_storeStrong((id *)&self->_resultForYouConfig, 0);
  objc_storeStrong(&self->_headlinesAndTagsCompletionHandler, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_forYouConfig, 0);
  objc_storeStrong((id *)&self->_editorialSectionTagCachePolicy, 0);
  objc_storeStrong((id *)&self->_articleListCachePolicy, 0);
  objc_storeStrong((id *)&self->_forYouConfigCachePolicy, 0);
  objc_storeStrong((id *)&self->_additionalTagIDs, 0);
  objc_storeStrong((id *)&self->_additionalArticleListIDs, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
