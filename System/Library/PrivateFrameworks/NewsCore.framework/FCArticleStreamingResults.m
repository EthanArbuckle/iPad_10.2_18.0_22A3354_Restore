@implementation FCArticleStreamingResults

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;

  v10 = a6;
  -[FCStreamingResults serialQueue](self, "serialQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke;
  v13[3] = &unk_1E4645450;
  v15 = a3;
  v16 = a5;
  v17 = a4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enqueueBlockForMainThread:", v13);

}

void __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  unint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(_QWORD);
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (*(_QWORD *)(a1 + 48) <= v4
    || (v5 = v4,
        objc_msgSend(*(id *)(a1 + 32), "underlyingStream"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isFinished"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    v3[2](v3);
  }
  else
  {
    if (*(_QWORD *)(a1 + 48) - v5 >= *(_QWORD *)(a1 + 56))
      v9 = *(_QWORD *)(a1 + 56);
    else
      v9 = *(_QWORD *)(a1 + 48) - v5;
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "underlyingStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2;
    v18[3] = &unk_1E4646D58;
    v15 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    v21 = v5;
    v22 = v16;
    v23 = v14;
    v24 = v13;
    v19 = v15;
    v20 = v3;
    v17 = (id)objc_msgSend(v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", v9, v14, MEMORY[0x1E0C80D38], v18);

  }
}

void __89__FCArticleStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = *(_QWORD *)(a1 + 56);

  if (v12 != v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("async results are out of sync"));
    v17 = 136315906;
    v18 = "-[FCArticleStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:]_block_invoke_2";
    v19 = 2080;
    v20 = "FCArticleStreamingResults.m";
    v21 = 1024;
    v22 = 42;
    v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v17, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setFeedbackResult:", v9);
  if (v7)
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchObjectsUpToCount:qualityOfService:batchSize:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (FCArticleSearchOperationFeedbackResult)feedbackResult
{
  return self->_feedbackResult;
}

- (void)setFeedbackResult:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackResult, 0);
}

@end
