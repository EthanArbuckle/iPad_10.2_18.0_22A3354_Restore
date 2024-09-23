@implementation FCPeopleAlsoReadArticlesOperation

- (FCPeopleAlsoReadArticlesOperation)init
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
    v8 = "-[FCPeopleAlsoReadArticlesOperation init]";
    v9 = 2080;
    v10 = "FCPeopleAlsoReadArticlesOperation.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPeopleAlsoReadArticlesOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPeopleAlsoReadArticlesOperation)initWithContentContext:(id)a3 configuration:(id)a4 readingHistory:(id)a5 cursor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCPeopleAlsoReadArticlesOperation *v15;
  FCPeopleAlsoReadArticlesOperation *v16;
  uint64_t v17;
  FCFeedItemServiceCursor *cursor;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    v28 = 1024;
    v29 = 54;
    v30 = 2114;
    v31 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    v28 = 1024;
    v29 = 55;
    v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "readingHistory");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    v28 = 1024;
    v29 = 56;
    v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v23.receiver = self;
  v23.super_class = (Class)FCPeopleAlsoReadArticlesOperation;
  v15 = -[FCOperation init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentContext, a3);
    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeStrong((id *)&v16->_readingHistory, a5);
    v17 = objc_msgSend(v14, "copy");
    cursor = v16->_cursor;
    v16->_cursor = (FCFeedItemServiceCursor *)v17;

  }
  return v16;
}

- (void)prepareOperation
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCPeopleAlsoReadArticlesOperation setReferenceDate:](self, "setReferenceDate:", v3);

}

- (void)performOperation
{
  void *v3;
  int v4;
  _QWORD v5[5];

  -[FCPeopleAlsoReadArticlesOperation readingHistory](self, "readingHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWaitingForFirstSync");

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke;
    v5[3] = &unk_1E463AB18;
    v5[4] = self;
    __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke((uint64_t)v5);
  }
  else
  {
    -[FCPeopleAlsoReadArticlesOperation _continueOperation](self, "_continueOperation");
  }
}

void __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("People Also Read requires synced reading history."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedPerformingOperationWithError:", v2);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[FCPeopleAlsoReadArticlesOperation completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCPeopleAlsoReadArticlesOperation completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCPeopleAlsoReadArticlesOperation resultFeedItems](self, "resultFeedItems");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = v6;
    else
      v8 = MEMORY[0x1E0C9AA60];
    ((void (**)(_QWORD, uint64_t, id))v5)[2](v5, v8, v9);

  }
}

- (void)_continueOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  FCArticleHeadlinesFetchOperation *v12;
  void *v13;
  void *v14;
  FCArticleHeadlinesFetchOperation *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  FCPeopleAlsoReadArticlesOperation *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FCPeopleAlsoReadArticlesOperation *v25;

  -[FCPeopleAlsoReadArticlesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPeopleAlsoReadArticlesOperation readingHistory](self, "readingHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mostRecentlyReadArticlesWithMaxCount:", objc_msgSend(v3, "seedMaxCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPeopleAlsoReadArticlesOperation referenceDate](self, "referenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", (double)-objc_msgSend(v3, "seedMaxIntervalSinceLastReadSeconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke;
  v23[3] = &unk_1E463A950;
  v24 = v7;
  v25 = self;
  v9 = v7;
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_setByTransformingWithBlock:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [FCArticleHeadlinesFetchOperation alloc];
  -[FCPeopleAlsoReadArticlesOperation contentContext](self, "contentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v12, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v13, v14, MEMORY[0x1E0C9AA60]);

  v17 = v8;
  v18 = 3221225472;
  v19 = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_2;
  v20 = &unk_1E463A9C0;
  v21 = self;
  v22 = v3;
  v16 = v3;
  -[FCFetchOperation setFetchCompletionBlock:](v15, "setFetchCompletionBlock:", &v17);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v15, v17, v18, v19, v20, v21);
  -[FCOperation start](v15, "start");

}

uint64_t __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastVisitedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fc_isLaterThanOrEqualTo:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    v6 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "shortOperationDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "articleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastVisitedAt");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138544130;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a seed %@ because it was last visited at %@, which is prior to the earliest allowed date of %@", (uint8_t *)&v14, 0x2Au);

    }
  }

  return v5;
}

uint64_t __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v4 = objc_msgSend(v3, "status");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishedPerformingOperationWithError:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "referenceDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", (double)-objc_msgSend(*(id *)(a1 + 40), "seedMaxAgeSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "fetchedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_4;
    v16 = &unk_1E463A998;
    v10 = *(_QWORD *)(a1 + 32);
    v17 = v8;
    v18 = v10;
    v11 = v8;
    objc_msgSend(v9, "fc_setByTransformingWithBlock:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_continueOperationWithSeedArticleIDs:", v12, v13, v14, v15, v16);

  }
}

id __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "publishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fc_isLaterThanOrEqualTo:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v3, "articleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "articleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "publishDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138544130;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a seed %@ because it was published at %@, which is prior to the earliest allowed date of %@", (uint8_t *)&v15, 0x2Au);

    }
    v6 = 0;
  }

  return v6;
}

- (void)_continueOperationWithSeedArticleIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  FCCKBatchedMultiFetchQueryOperation *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  FCPeopleAlsoReadArticlesOperation *v42;
  _QWORD newValue[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v7;
    v64 = 2048;
    v65 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ querying using %ld seeds", buf, 0x16u);

  }
  v42 = self;
  -[FCPeopleAlsoReadArticlesOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentStoreFrontID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v58;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v8, "candidateArticleListIDForSeedArticleID:storeFrontID:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v15), v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v13);
  }

  -[FCPeopleAlsoReadArticlesOperation cursor](v42, "cursor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "feedItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fc_dictionaryWithKeyBlock:", &__block_literal_global_26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99D20];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_2;
  v50[3] = &unk_1E463AA08;
  v50[4] = v42;
  v41 = v8;
  v51 = v41;
  v24 = v11;
  v52 = v24;
  v25 = v21;
  v53 = v25;
  v40 = v22;
  v54 = v40;
  v38 = v19;
  v55 = v38;
  v26 = v20;
  v56 = v26;
  objc_msgSend(v23, "fc_array:", v50);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
  -[FCPeopleAlsoReadArticlesOperation contentContext](v42, "contentContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "internalContentContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentDatabase");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v28, v31);

  -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v28, v27);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_3;
  v49[3] = &unk_1E463AA30;
  v49[4] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v49);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v28, v32);

  objc_initWeak((id *)buf, v28);
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_4;
  newValue[3] = &unk_1E463AAF0;
  newValue[4] = v42;
  v33 = v25;
  v44 = v33;
  v34 = v26;
  v45 = v34;
  v35 = v24;
  v46 = v35;
  v36 = v41;
  v47 = v36;
  objc_copyWeak(&v48, (id *)buf);
  if (v28)
    objc_setProperty_nonatomic_copy(v28, v37, newValue, 448);
  -[FCOperation associateChildOperation:](v42, "associateChildOperation:", v28, v38);
  -[FCOperation start](v28, "start");
  objc_destroyWeak(&v48);

  objc_destroyWeak((id *)buf);
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "contentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleListRecordSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCachePolicy:", 4);
  objc_msgSend(v7, "setMaximumCachedAge:", (double)objc_msgSend(a1[5], "candidateArticleListMaxCachedAgeSeconds"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a1[6];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v22 = v7;
    v23 = v6;
    v21 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      v24 = v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
        objc_msgSend(v6, "cachedRecordWithID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && !objc_msgSend(v6, "isRecordStale:withCachePolicy:", v13, v7))
        {
          objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v13, v12);
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v13, "articleIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v27 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(a1[8], "setObject:forKeyedSubscript:", v13, v19);
                objc_msgSend(a1[9], "objectForKeyedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                  objc_msgSend(a1[10], "setObject:forKeyedSubscript:", v20, v19);
                else
                  objc_msgSend(v3, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v16);
          }

          v7 = v22;
          v6 = v23;
          v10 = v21;
          v9 = v24;
        }
        else
        {
          objc_msgSend(v3, "addObject:", v12);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  SEL v21;
  const __CFString *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = v4;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, CFSTR("ArticleList"), 16);
  v23[0] = CFSTR("articleIDs");
  v23[1] = CFSTR("type");
  v23[2] = CFSTR("metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);

  v22 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v9, v10, 32);

  objc_msgSend(v3, "addObject:", v6);
  v11 = (void *)objc_opt_new();
  v13 = v11;
  if (v11)
    objc_setProperty_nonatomic_copy(v11, v12, CFSTR("Article"), 16);
  v14 = (void *)MEMORY[0x1E0D626D0];
  objc_msgSend(*(id *)(a1 + 32), "contentContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "internalContentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "articleRecordSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keysForArticleRecordWithRecordSource:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v13, v21, MEMORY[0x1E0C9AA60], 32);
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", v13);

}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_4(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id WeakRetained;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1[4], "finishedPerformingOperationWithError:", a4);
  }
  else
  {
    objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_35);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "contentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internalContentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "articleListRecordSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v8;
    objc_msgSend(v11, "saveRecords:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1[5], "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v12;
    objc_msgSend(v12, "allRecords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fc_arrayByAddingObjectsFromArray:toArray:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_7;
    v62[3] = &unk_1E463AA78;
    v19 = v16;
    v63 = v19;
    objc_msgSend(v17, "fc_dictionary:", v62);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C99D80];
    v57[0] = v18;
    v57[1] = 3221225472;
    v57[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_9;
    v57[3] = &unk_1E463AAA0;
    v58 = a1[6];
    v23 = v21;
    v24 = a1[4];
    v48 = v23;
    v59 = v23;
    v60 = v24;
    v25 = v20;
    v61 = v25;
    objc_msgSend(v22, "fc_dictionary:", v57);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v28 = a1[4];
      v29 = v27;
      objc_msgSend(v28, "shortOperationDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(a1[7], "count");
      *(_DWORD *)buf = 138543618;
      v65 = v30;
      v66 = 2048;
      v67 = v31;
      _os_log_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ accepted %ld seeds", buf, 0x16u);

    }
    objc_msgSend(a1[4], "referenceDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dateByAddingTimeInterval:", (double)-objc_msgSend(a1[8], "candidateMaxAgeSeconds"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v18;
    v51[1] = 3221225472;
    v51[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_40;
    v51[3] = &unk_1E463AAC8;
    v52 = a1[7];
    v35 = v26;
    v53 = v35;
    v36 = v33;
    v54 = v36;
    v37 = v34;
    v38 = a1[4];
    v55 = v37;
    v56 = v38;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v51);
    v39 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v40 = a1[4];
      v41 = v39;
      objc_msgSend(v40, "shortOperationDescription");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 138543618;
      v65 = v42;
      v66 = 2048;
      v67 = v43;
      _os_log_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ accepted %ld co-reads", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    v45 = WeakRetained;
    if (WeakRetained)
      v46 = (void *)*((_QWORD *)WeakRetained + 53);
    else
      v46 = 0;
    v47 = v46;
    objc_msgSend(a1[4], "setNetworkEvents:", v47);

    objc_msgSend(a1[4], "setResultFeedItems:", v37);
    objc_msgSend(a1[4], "finishedPerformingOperationWithError:", 0);

  }
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ArticleList"));

  return v3;
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FCArticleList *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = -[FCArticleList initWithRecord:interestToken:]([FCArticleList alloc], "initWithRecord:interestToken:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7), 0);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        -[FCArticleList articleIDs](v8, "articleIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Article"));

  return v3;
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "_feedItemFromArticleRecord:articleListsByArticleID:", v9, *(_QWORD *)(a1 + 56), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  os_log_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v24 = v5;
    v25 = v3;
    objc_msgSend(v3, "articleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      v10 = (os_log_t *)&FCOperationLog;
      v26 = v6;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "publishDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "fc_isLaterThanOrEqualTo:", *(_QWORD *)(a1 + 48));

          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
          }
          else
          {
            v15 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              v16 = *(void **)(a1 + 64);
              v17 = v15;
              objc_msgSend(v16, "shortOperationDescription");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "articleID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "publishDate");
              v20 = v9;
              v21 = v10;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138544130;
              v32 = v18;
              v33 = 2112;
              v34 = v19;
              v35 = 2112;
              v36 = v22;
              v37 = 2112;
              v38 = v23;
              _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a co-read %@ because it was published at %@, which is prior to the earliest allowed date of %@", buf, 0x2Au);

              v10 = v21;
              v9 = v20;

              v6 = v26;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v8);
    }

    v5 = v24;
    v3 = v25;
  }

}

- (id)_feedItemFromArticleRecord:(id)a3 articleListsByArticleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
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
  void *v21;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D626D0];
  v8 = a3;
  -[FCPeopleAlsoReadArticlesOperation contentContext](self, "contentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentStoreFrontID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPeopleAlsoReadArticlesOperation contentContext](self, "contentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internalContentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "articleRecordSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedItemFromCKRecord:storefrontID:recordSource:", v8, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "articleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSurfacedByArticleListID:", v17);

      objc_msgSend(v16, "editorialMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "articleMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "articleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "conditionalScore");
      objc_msgSend(v14, "applyConditionalScore:");

    }
  }

  return v14;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvents, a3);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (FCPeopleAlsoReadConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
  objc_storeStrong((id *)&self->_readingHistory, a3);
}

- (FCFeedItemServiceCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSArray)resultFeedItems
{
  return self->_resultFeedItems;
}

- (void)setResultFeedItems:(id)a3
{
  objc_storeStrong((id *)&self->_resultFeedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
