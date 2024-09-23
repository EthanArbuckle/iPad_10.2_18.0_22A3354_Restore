@implementation FCTagFeedHeadlinesFetchOperation

- (FCTagFeedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 feedDescriptor:(id)a5 personalizer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCTagFeedHeadlinesFetchOperation *v15;
  FCTagFeedHeadlinesFetchOperation *v16;
  uint64_t v17;
  NSDate *topOfFeedDate;
  void *v19;
  void *v20;
  FCDateRange *v21;
  uint64_t v22;
  FCFeedRange *freeFeedRange;
  uint64_t v24;
  FCFeedRange *paidFeedRange;
  uint64_t v26;
  NSArray *precedingHeadlines;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)FCTagFeedHeadlinesFetchOperation;
  v15 = -[FCOperation init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_cloudContext, a4);
    objc_storeStrong((id *)&v16->_feedDescriptor, a5);
    objc_storeStrong((id *)&v16->_personalizer, a6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    topOfFeedDate = v16->_topOfFeedDate;
    v16->_topOfFeedDate = (NSDate *)v17;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v19, -21600.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[FCDateRange initWithEarlierDate:laterDate:]([FCDateRange alloc], "initWithEarlierDate:laterDate:", v20, v19);
    +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    freeFeedRange = v16->_freeFeedRange;
    v16->_freeFeedRange = (FCFeedRange *)v22;

    +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
    paidFeedRange = v16->_paidFeedRange;
    v16->_paidFeedRange = (FCFeedRange *)v24;

    v16->_maxFetchCount = 10;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    precedingHeadlines = v16->_precedingHeadlines;
    v16->_precedingHeadlines = (NSArray *)v26;

  }
  return v16;
}

- (void)prepareOperation
{
  void *v3;
  NSSet *v4;
  NSSet *shownArticleIDs;
  NSSet *v6;
  NSSet *shownClusterIDs;
  id v8;

  -[FCTagFeedHeadlinesFetchOperation precedingHeadlines](self, "precedingHeadlines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_setByTransformingWithBlock:", &__block_literal_global_128);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shownArticleIDs = self->_shownArticleIDs;
  self->_shownArticleIDs = v4;

  -[FCTagFeedHeadlinesFetchOperation precedingHeadlines](self, "precedingHeadlines");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_setByTransformingWithBlock:", &__block_literal_global_4_4);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shownClusterIDs = self->_shownClusterIDs;
  self->_shownClusterIDs = v6;

}

uint64_t __52__FCTagFeedHeadlinesFetchOperation_prepareOperation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

uint64_t __52__FCTagFeedHeadlinesFetchOperation_prepareOperation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clusterID");
}

- (void)performOperation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCFeedRequest *v10;
  void *v11;
  FCCloudContext *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  FCFeedRequestOperation *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  FCFeedDescriptor *v26;
  void *v27;
  _QWORD *v28;
  _QWORD v29[10];
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[5];
  id v39;
  _BYTE buf[24];
  __int128 v41;
  id v42;
  FCTagFeedHeadlinesFetchOperation *v43;
  id v44;
  id v45;
  BOOL v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__52;
  v38[4] = __Block_byref_object_dispose__52;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__52;
  v34[4] = __Block_byref_object_dispose__52;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__52;
  v32[4] = __Block_byref_object_dispose__52;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__52;
  v30[4] = __Block_byref_object_dispose__52;
  v31 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__FCTagFeedHeadlinesFetchOperation_performOperation__block_invoke;
  v29[3] = &unk_1E46471D8;
  v29[6] = v32;
  v29[7] = v30;
  v29[8] = v36;
  v29[9] = v34;
  v29[4] = self;
  v29[5] = v38;
  v28 = v29;
  if (self)
  {
    v26 = self->_feedDescriptor;
    -[FCFeedDescriptor backingTag](v26, "backingTag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "tag");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCTagFeedHeadlinesFetchOperation _fetchOrdinaryHeadlinesWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCTagFeedHeadlinesFetchOperation.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v41) = 184;
      WORD2(v41) = 2114;
      *(_QWORD *)((char *)&v41 + 6) = v24;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    +[FCFeedContext feedContextForTag:](FCFeedContext, "feedContextForTag:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tagType");
    v25 = v4 != 1;
    if (v4 == 1)
      v5 = 2;
    else
      v5 = 3;
    objc_msgSend(v3, "freeFeedIDForBin:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paidFeedIDForBin:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = objc_alloc_init(FCFeedRequest);
      -[FCFeedRequest setFeedID:](v10, "setFeedID:", v6);
      -[FCTagFeedHeadlinesFetchOperation freeFeedRange](self, "freeFeedRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequest setFeedRange:](v10, "setFeedRange:", v11);

      -[FCFeedRequest setMaxCount:](v10, "setMaxCount:", -[FCTagFeedHeadlinesFetchOperation maxFetchCount](self, "maxFetchCount"));
      -[FCFeedRequest setCachedOnly:](v10, "setCachedOnly:", self->_fetchOrdinaryItemsFromCache);
      objc_msgSend(v8, "addObject:", v10);
      objc_msgSend(v9, "setObject:forKey:", v27, v6);
    }
    else
    {
      v10 = 0;
    }
    if (v4 != 1)
    {
      v12 = self->_cloudContext;
      -[FCCloudContext paidAccessChecker](v12, "paidAccessChecker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedDescriptor backingChannel](v26, "backingChannel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v12) = objc_msgSend(v13, "canGetSubscriptionToChannel:", v14);
      if ((_DWORD)v12)
      {
        v15 = objc_msgSend(v7, "isEqualToString:", v6);
        if (v10)
        {
          if (v15 != 1 && v7)
          {
            v16 = (void *)-[FCFeedRequest copy](v10, "copy");
            objc_msgSend(v16, "setFeedID:", v7);
            -[FCTagFeedHeadlinesFetchOperation paidFeedRange](self, "paidFeedRange");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setFeedRange:", v17);

            objc_msgSend(v8, "addObject:", v16);
            objc_msgSend(v9, "setObject:forKey:", v27, v7);

          }
        }
      }
    }
    v18 = objc_alloc_init(FCFeedRequestOperation);
    -[FCFeedRequestOperation setContext:](v18, "setContext:", self->_cloudContext);
    -[FCFeedRequestOperation setConfiguration:](v18, "setConfiguration:", self->_configuration);
    -[FCFeedRequestOperation setFeedRequests:](v18, "setFeedRequests:", v8);
    if (v10)
      v19 = -[FCFeedRequest maxCount](v10, "maxCount");
    else
      v19 = -[FCTagFeedHeadlinesFetchOperation maxFetchCount](self, "maxFetchCount");
    -[FCFeedRequestOperation setMaxCount:](v18, "setMaxCount:", v19);
    -[FCFeedRequestOperation setOptions:](v18, "setOptions:", 14);
    -[FCFeedRequestOperation setExpectedNetworkEventCount:](v18, "setExpectedNetworkEventCount:", 1);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke;
    *(_QWORD *)&v41 = &unk_1E4647250;
    v20 = v28;
    v44 = v9;
    v45 = v20;
    *((_QWORD *)&v41 + 1) = v6;
    v42 = v7;
    v43 = self;
    v46 = v25;
    v21 = v9;
    v22 = v7;
    v23 = v6;
    -[FCFeedRequestOperation setRequestCompletionHandler:](v18, "setRequestCompletionHandler:", buf);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v18);
    -[FCOperation start](v18, "start");

  }
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

}

void __52__FCTagFeedHeadlinesFetchOperation_performOperation__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  id v38;

  v38 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = a5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), a6);
  v15 = (_QWORD *)a1[4];
  if (*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40))
  {
    objc_msgSend(v15, "finishedPerformingOperationWithError:");
  }
  else
  {
    if (v15)
      v15 = (_QWORD *)v15[55];
    objc_msgSend(v15, "backingTag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[4];
    if (v17)
      v18 = *(void **)(v17 + 432);
    else
      v18 = 0;
    objc_msgSend(v18, "purchaseProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (objc_msgSend(v20, "tagType") == 3)
    {
      objc_msgSend(v20, "asSection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "parentID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
    }

    v23 = v22;
    objc_msgSend(v19, "purchasedTagIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsObject:", v23);

    if ((v25 & 1) == 0)
    {
      v27 = a1[4];
      if (v27)
      {
        v28 = *(_QWORD *)(v27 + 424);
        v29 = *(_QWORD *)(v27 + 432);
      }
      else
      {
        v28 = 0;
        v29 = 0;
      }
      +[FCFeedTransformationFilter transformationWithFilterOptions:configuration:context:](FCFeedTransformationFilter, "transformationWithFilterOptions:configuration:context:", 0x2000, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transformHeadlines:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1[5] + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

    }
    v34 = (void *)a1[4];
    if (v34)
    {
      objc_setProperty_nonatomic_copy(v34, v26, *(id *)(*(_QWORD *)(a1[5] + 8) + 40), 472);
      v34 = (void *)a1[4];
      if (v34)
      {
        objc_setProperty_nonatomic_copy(v34, v35, *(id *)(*(_QWORD *)(a1[6] + 8) + 40), 480);
        v34 = (void *)a1[4];
        if (v34)
        {
          objc_setProperty_nonatomic_copy(v34, v36, *(id *)(*(_QWORD *)(a1[7] + 8) + 40), 488);
          v37 = a1[4];
          if (v37)
          {
            *(_BYTE *)(v37 + 369) = *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24);
            v34 = (void *)a1[4];
          }
          else
          {
            v34 = 0;
          }
        }
      }
    }
    objc_msgSend(v34, "finishedPerformingOperationWithError:", 0);

  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  FCFeedRange *v8;
  FCFeedRange *v9;
  _BOOL8 resultFinished;
  void (**v11)(id, _QWORD, FCFeedRange *, FCFeedRange *, _BOOL8, id);

  v4 = a3;
  -[FCTagFeedHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v11 = (void (**)(id, _QWORD, FCFeedRange *, FCFeedRange *, _BOOL8, id))objc_claimAutoreleasedReturnValue();
  v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (self)
  {
    v6 = self->_resultOrdinaryHeadlines;
    v7 = v6;
    if (v6)
      v5 = v6;
    v8 = self->_resultFetchedFreeRange;
    v9 = self->_resultFetchedPaidRange;
    resultFinished = self->_resultFinished;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
    resultFinished = 0;
  }
  ((void (**)(id, NSArray *, FCFeedRange *, FCFeedRange *, _BOOL8, id))v11)[2](v11, v5, v8, v9, resultFinished, v4);

}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v5;

  v5 = objc_msgSend(a3, "fc_isRequestDroppedError");
  if (v5)
    *a4 = (id)objc_opt_new();
  return v5;
}

- (void)resetForRetry
{
  if (self)
    self->_fetchOrdinaryItemsFromCache = 1;
}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  FCMyArticlesSearchOperation *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];
  void (*v40)(uint64_t, void *);
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  char v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD *v54;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_2;
    v50[3] = &unk_1E4645E08;
    v51 = *(id *)(a1 + 32);
    objc_msgSend(v7, "fc_firstObjectPassingTest:", v50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v9;
    v48[1] = 3221225472;
    v48[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_3;
    v48[3] = &unk_1E4645E08;
    v49 = *(id *)(a1 + 40);
    objc_msgSend(v7, "fc_firstObjectPassingTest:", v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "topOfFeedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForDate:](FCFeedCursor, "cursorForDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      v15 = *(void **)(v14 + 440);
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v16, "backingTag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v40 = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_4;
    v41 = &unk_1E4647228;
    v18 = *(void **)(a1 + 56);
    v42 = *(_QWORD *)(a1 + 48);
    v19 = v18;
    v47 = *(_BYTE *)(a1 + 72);
    v43 = v19;
    v44 = v10;
    v45 = v11;
    v46 = *(id *)(a1 + 64);
    v38 = v11;
    v20 = v10;
    v21 = v8;
    v22 = v17;
    v23 = v13;
    v24 = v39;
    if (v14)
    {
      if (objc_msgSend(v22, "tagType") == 1 && objc_msgSend(v21, "count"))
      {
        objc_msgSend(v21, "valueForKeyPath:", CFSTR("@max.order"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v24;
        objc_msgSend(v21, "valueForKeyPath:", CFSTR("@min.order"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v20;
        v37 = v16;
        objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(v33, "unsignedLongLongValue"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(v32, "unsignedLongLongValue") - 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCDateRange dateRangeWithStartDate:endDate:](FCDateRange, "dateRangeWithStartDate:endDate:", v31, v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc_init(FCMyArticlesSearchOperation);
        -[FCMyArticlesSearchOperation setContext:](v26, "setContext:", *(_QWORD *)(v14 + 432));
        v35 = v23;
        objc_msgSend(*(id *)(v14 + 440), "backingTag");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCFeedItemFeature featureForTopicID:](FCFeedItemFeature, "featureForTopicID:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCMyArticlesSearchOperation setFeature:](v26, "setFeature:", v29);

        v23 = v35;
        v24 = v34;

        v16 = v37;
        -[FCMyArticlesSearchOperation setDateRange:](v26, "setDateRange:", v25);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __92__FCTagFeedHeadlinesFetchOperation_supplementFeedItems_forTag_fromCursor_completionHandler___block_invoke;
        v52[3] = &unk_1E4647278;
        v54 = v34;
        v53 = v21;
        -[FCMyArticlesSearchOperation setSearchCompletionHandler:](v26, "setSearchCompletionHandler:", v52);
        objc_msgSend((id)v14, "associateChildOperation:", v26);
        -[FCOperation start](v26, "start");

        v20 = v36;
      }
      else
      {
        v40((uint64_t)v24, v21);
      }
    }

  }
}

uint64_t __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "feedID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "feedID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  FCFeedItemHeadlinesOperation *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;

  v2 = *(_QWORD *)(a1 + 32);
  v44 = a2;
  if (v2)
  {
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = *(id *)(v2 + 440);
    +[FCFeedTransformationSort transformationWithSortMethod:configurationSet:personalizer:](FCFeedTransformationSort, "transformationWithSortMethod:configurationSet:personalizer:", objc_msgSend(v3, "feedSortMethod"), objc_msgSend(v3, "feedPersonalizationConfigurationSet"), *(_QWORD *)(v2 + 448));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v43);
    v31 = objc_msgSend(v3, "feedFilterOptions");
    objc_msgSend(v3, "otherArticleIDs");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v2 + 456), "setByAddingObjectsFromArray:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(v2 + 464);
    v40 = *(id *)(v2 + 432);
    v46 = v4;
    objc_msgSend(v40, "subscriptionList");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "subscribedTagIDs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(id *)(v2 + 432);
    objc_msgSend(v37, "subscriptionList");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mutedTagIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(id *)(v2 + 432);
    objc_msgSend(v35, "readingHistory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "readingHistoryItemsByArticleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(id *)(v2 + 432);
    objc_msgSend(v33, "audioPlaylist");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "articleIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(id *)(v2 + 432);
    objc_msgSend(v27, "offlineArticleManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "readableArticleIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(v2 + 424);
    objc_msgSend(v5, "briefingsTagID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(id *)(v2 + 432);
    objc_msgSend(v7, "paidAccessChecker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(v2 + 432);
    objc_msgSend(v9, "bundleSubscriptionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedSubscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedTransformationFilter transformationWithFilterOptions:otherArticleIDs:otherClusterIDs:subscribedTagIDs:mutedTagIDs:readingHistoryItems:playlistArticleIDs:downloadedArticleIDs:briefingsTagID:paidAccessChecker:bundleSubscription:](FCFeedTransformationFilter, "transformationWithFilterOptions:otherArticleIDs:otherClusterIDs:subscribedTagIDs:mutedTagIDs:readingHistoryItems:playlistArticleIDs:downloadedArticleIDs:briefingsTagID:paidAccessChecker:bundleSubscription:", v31, v47, v46, v30, v29, v26, v25, v24, v6, v8, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v39;
    objc_msgSend(v39, "addObject:", v32);

  }
  else
  {
    v12 = 0;
  }
  FCApplyFeedTransformationsAndLog(v44, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(_QWORD **)(a1 + 32);
  if (v14)
    v14 = (_QWORD *)v14[53];
  v15 = v14;
  v16 = objc_alloc_init(FCFeedItemHeadlinesOperation);
  -[FCFeedItemHeadlinesOperation setConfiguration:](v16, "setConfiguration:", v15);
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    v18 = *(_QWORD *)(v17 + 432);
  else
    v18 = 0;
  -[FCFeedItemHeadlinesOperation setContext:](v16, "setContext:", v18);
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(_QWORD *)(v19 + 448);
  else
    v20 = 0;
  -[FCFeedItemHeadlinesOperation setPersonalizer:](v16, "setPersonalizer:", v20);
  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    v22 = *(void **)(v21 + 440);
  else
    v22 = 0;
  -[FCFeedItemHeadlinesOperation setFeedPersonalizationConfigurationSet:](v16, "setFeedPersonalizationConfigurationSet:", objc_msgSend(v22, "feedPersonalizationConfigurationSet"));
  -[FCFeedItemHeadlinesOperation setFeedItems:](v16, "setFeedItems:", v13);
  -[FCFeedItemHeadlinesOperation setFeedContextByFeedID:](v16, "setFeedContextByFeedID:", *(_QWORD *)(a1 + 40));
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_5;
  v48[3] = &unk_1E4647200;
  v53 = *(_BYTE *)(a1 + 72);
  v48[4] = *(_QWORD *)(a1 + 32);
  v49 = v15;
  v50 = *(id *)(a1 + 48);
  v51 = *(id *)(a1 + 56);
  v52 = *(id *)(a1 + 64);
  v23 = v15;
  -[FCFeedItemHeadlinesOperation setHeadlinesCompletionHandler:](v16, "setHeadlinesCompletionHandler:", v48);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v16);
  -[FCOperation start](v16, "start");

}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  char v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = *(_BYTE *)(a1 + 72) == 0;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "precedingHeadlines");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "minimumDistanceBetweenImageOnTopTiles");
  FCPromoteHeadlines(v8, v5, v9, MEMORY[0x1E0C9AA60], v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 48), "exhaustedRequestRange"))
  {
    v11 = *(void **)(a1 + 56);
    if (v11)
      v12 = objc_msgSend(v11, "exhaustedRequestRange");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "feedRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "feedRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t, id))(v13 + 16))(v13, v16, v14, v15, v12, v7);

}

void __92__FCTagFeedHeadlinesFetchOperation_supplementFeedItems_forTag_fromCursor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSDate)topOfFeedDate
{
  return self->_topOfFeedDate;
}

- (void)setTopOfFeedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FCFeedRange)freeFeedRange
{
  return self->_freeFeedRange;
}

- (void)setFreeFeedRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (FCFeedRange)paidFeedRange
{
  return self->_paidFeedRange;
}

- (void)setPaidFeedRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (int64_t)maxFetchCount
{
  return self->_maxFetchCount;
}

- (void)setMaxFetchCount:(int64_t)a3
{
  self->_maxFetchCount = a3;
}

- (NSArray)precedingHeadlines
{
  return self->_precedingHeadlines;
}

- (void)setPrecedingHeadlines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchedPaidRange, 0);
  objc_storeStrong((id *)&self->_resultFetchedFreeRange, 0);
  objc_storeStrong((id *)&self->_resultOrdinaryHeadlines, 0);
  objc_storeStrong((id *)&self->_shownClusterIDs, 0);
  objc_storeStrong((id *)&self->_shownArticleIDs, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_feedDescriptor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_precedingHeadlines, 0);
  objc_storeStrong((id *)&self->_paidFeedRange, 0);
  objc_storeStrong((id *)&self->_freeFeedRange, 0);
  objc_storeStrong((id *)&self->_topOfFeedDate, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
