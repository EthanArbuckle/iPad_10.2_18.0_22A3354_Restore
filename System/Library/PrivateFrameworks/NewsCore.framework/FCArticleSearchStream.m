@implementation FCArticleSearchStream

- (FCArticleSearchStream)initWithParsecQueryID:(unint64_t)a3
{
  FCArticleSearchStream *v4;
  FCArticleSearchStream *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *articleSearchResults;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCArticleSearchStream;
  v4 = -[FCArticleSearchStream init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_parsecQueryID = a3;
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    articleSearchResults = v5->_articleSearchResults;
    v5->_articleSearchResults = v6;

  }
  return v5;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v9;
  id v10;
  FCParsecArticleSearchOperation *v11;
  FCParsecArticleSearchOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *, void *);
  void *v23;
  FCArticleSearchStream *v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (-[FCArticleSearchStream isFinished](self, "isFinished"))
  {
    v11 = 0;
    if (v9 && v10)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E463B598;
      v28 = v10;
      dispatch_async(v9, block);

      v11 = 0;
    }
  }
  else
  {
    if (-[FCArticleSearchStream fetching](self, "fetching")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't ask a stream for more results while it's fetching"));
      *(_DWORD *)buf = 136315906;
      v30 = "-[FCArticleSearchStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
      v31 = 2080;
      v32 = "FCArticleSearchOperation.m";
      v33 = 1024;
      v34 = 172;
      v35 = 2114;
      v36 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCArticleSearchStream setFetching:](self, "setFetching:", 1);
    v12 = [FCParsecArticleSearchOperation alloc];
    -[FCArticleSearchStream moreResults](self, "moreResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCParsecArticleSearchOperation initWithMoreResults:parsecQueryID:](v12, "initWithMoreResults:parsecQueryID:", v13, -[FCArticleSearchStream parsecQueryID](self, "parsecQueryID"));

    -[FCArticleSearchStream cloudContext](self, "cloudContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation setContentContext:](v11, "setContentContext:", v14);

    -[FCArticleSearchStream query](self, "query");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation setQuery:](v11, "setQuery:", v15);

    -[FCArticleSearchStream keyboardInputMode](self, "keyboardInputMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation setKeyboardInputMode:](v11, "setKeyboardInputMode:", v16);

    -[FCArticleSearchStream scale](self, "scale");
    -[FCParsecArticleSearchOperation setScale:](v11, "setScale:");
    -[FCArticleSearchStream rankingFeedback](self, "rankingFeedback");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation setPreviousRankingFeedback:](v11, "setPreviousRankingFeedback:", v17);

    -[FCOperation setRelativePriority:](v11, "setRelativePriority:", 1);
    -[FCOperation setQualityOfService:](v11, "setQualityOfService:", a4);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_100;
    v23 = &unk_1E4647840;
    v24 = self;
    v26 = v10;
    v25 = v9;
    -[FCParsecArticleSearchOperation setArticleSearchCompletionHandler:](v11, "setArticleSearchCompletionHandler:", &v20);
    -[FCOperation start](v11, "start", v20, v21, v22, v23, v24);

  }
  return v11;
}

uint64_t __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_100(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  FCArticleSearchOperationFeedbackResult *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  FCArticleSearchOperationFeedbackResult *v20;
  id v21;
  id v22;
  _QWORD v23[5];

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v23[3] = &unk_1E4647818;
  v23[4] = *(_QWORD *)(a1 + 32);
  v11 = a4;
  v12 = a3;
  objc_msgSend(a2, "fc_orderedSetByTransformingWithBlock:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "articleSearchResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionOrderedSet:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setMoreResults:", v12);
  objc_msgSend(*(id *)(a1 + 32), "setRankingFeedback:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", v12 == 0);
  objc_msgSend(*(id *)(a1 + 32), "setFetching:", 0);
  v15 = -[FCArticleSearchOperationFeedbackResult initWithSearchOperationRankingFeedBack:]([FCArticleSearchOperationFeedbackResult alloc], "initWithSearchOperationRankingFeedBack:", v11);

  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17 = *(NSObject **)(a1 + 40);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E463DCB0;
    v22 = v16;
    v19 = v13;
    v20 = v15;
    v21 = v9;
    dispatch_async(v17, block);

  }
}

FCArticleSearchResult *__100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCArticleSearchResult *v4;
  void *v5;
  FCArticleSearchResult *v6;

  v3 = a2;
  v4 = [FCArticleSearchResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCArticleSearchResult initWithParsecSearchResult:cloudContext:](v4, "initWithParsecSearchResult:cloudContext:", v3, v5);

  return v6;
}

void __100__FCArticleSearchStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
  self->_keyboardInputMode = (NSString *)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)fetching
{
  return self->_fetching;
}

- (void)setFetching:(BOOL)a3
{
  self->_fetching = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (void)setMoreResults:(id)a3
{
  objc_storeStrong((id *)&self->_moreResults, a3);
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)setRankingFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_rankingFeedback, a3);
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (unint64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(unint64_t)a3
{
  self->_parsecQueryID = a3;
}

- (NSMutableOrderedSet)articleSearchResults
{
  return self->_articleSearchResults;
}

- (void)setArticleSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_articleSearchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleSearchResults, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
