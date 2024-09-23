@implementation FCOfflineAudioFetchOperation

- (FCOfflineAudioFetchOperation)initWithContext:(id)a3 articleID:(id)a4
{
  id v7;
  id v8;
  FCOfflineAudioFetchOperation *v9;
  FCOfflineAudioFetchOperation *v10;
  uint64_t v11;
  NSString *articleID;
  FCThreadSafeMutableArray *v13;
  FCThreadSafeMutableArray *resultInterestTokens;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCOfflineAudioFetchOperation;
  v9 = -[FCOperation init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    articleID = v10->_articleID;
    v10->_articleID = (NSString *)v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v10->_resultInterestTokens;
    v10->_resultInterestTokens = v13;

  }
  return v10;
}

- (BOOL)validateOperation
{
  char v3;
  char v4;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline article fetch operation requires a context"));
      v8 = 136315906;
      v9 = "-[FCOfflineAudioFetchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCOfflineAudioFetchOperation.m";
      v12 = 1024;
      v13 = 64;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_articleID)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline article fetch operation requires an article ID"));
    v8 = 136315906;
    v9 = "-[FCOfflineAudioFetchOperation validateOperation]";
    v10 = 2080;
    v11 = "FCOfflineAudioFetchOperation.m";
    v12 = 1024;
    v13 = 68;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  NSString *articleID;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FCOfflineAudioFetchOperation cachedOnly](self, "cachedOnly");
    v6 = CFSTR("fetch");
    if (v5)
      v6 = CFSTR("lookup cached");
    if (self)
      articleID = self->_articleID;
    else
      articleID = 0;
    *(_DWORD *)buf = 138543874;
    v21 = v4;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = articleID;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ article id=%{public}@", buf, 0x20u);

  }
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke;
  v19[3] = &unk_1E463D3A8;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_2;
  v18[3] = &unk_1E464B730;
  v18[4] = self;
  objc_msgSend(v9, "thenOn:then:", v10, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_3;
  v17[3] = &unk_1E4644198;
  v17[4] = self;
  objc_msgSend(v11, "thenOn:then:", v12, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_4;
  v16[3] = &unk_1E463EA38;
  v16[4] = self;
  v15 = (id)objc_msgSend(v13, "errorOn:error:", v14, v16);

}

id __48__FCOfflineAudioFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke;
  v4[3] = &unk_1E463DAD0;
  v4[4] = v1;
  return (id)objc_msgSend(v2, "initWithResolver:", v4);
}

id __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  objc_msgSend(a2, "narrativeTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_2;
    v10[3] = &unk_1E463F188;
    v10[4] = v2;
    v11 = v5;
    v7 = v5;
    v8 = (void *)objc_msgSend(v6, "initWithResolver:", v10);

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", 0);
  }

  return v8;
}

uint64_t __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  FCThreadSafeMutableArray *resultInterestTokens;
  FCThreadSafeMutableArray *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[FCOfflineAudioFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOfflineAudioFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
    {
      -[FCOfflineAudioFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__FCOfflineAudioFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E463AD10;
      v12[4] = self;
      v13 = v4;
      dispatch_async(v7, v12);

    }
  }
  else if (v6)
  {
    -[FCOfflineAudioFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (self)
      resultInterestTokens = self->_resultInterestTokens;
    else
      resultInterestTokens = 0;
    v10 = resultInterestTokens;
    -[FCThreadSafeMutableArray readOnlyArray](v10, "readOnlyArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v11, v4);

  }
}

void __61__FCOfflineAudioFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "fetchCompletionHandler");
  v5 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[55];
  v3 = v2;
  objc_msgSend(v3, "readOnlyArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, *(_QWORD *)(a1 + 40));

}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCArticleHeadlinesFetchOperation *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  FCArticleHeadlinesFetchOperation *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *);
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCArticleHeadlinesFetchOperation alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
  {
    v9 = (void *)v8[53];
    v8 = (_QWORD *)v8[54];
  }
  else
  {
    v9 = 0;
  }
  v27[0] = v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v7, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v12, v13, 0);

  -[FCFetchOperation setShouldFailOnMissingObjects:](v14, "setShouldFailOnMissingObjects:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "cachedOnly"))
    v15 = 3;
  else
    v15 = 0;
  -[FCFetchOperation setCachePolicy:](v14, "setCachePolicy:", v15);
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_2;
  v26[3] = &unk_1E4644210;
  v26[4] = *(_QWORD *)(a1 + 32);
  -[FCArticleHeadlinesFetchOperation setInterestTokenHandler:](v14, "setInterestTokenHandler:", v26);
  v19 = v16;
  v20 = 3221225472;
  v21 = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_3;
  v22 = &unk_1E463F580;
  v23 = *(_QWORD *)(a1 + 32);
  v24 = v6;
  v25 = v5;
  v17 = v5;
  v18 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v14, "setFetchCompletionBlock:", &v19);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v19, v20, v21, v22, v23);
  -[FCOperation start](v14, "start");

}

uint64_t __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 440), "addObject:", a2);
  }
  return result;
}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[7];

  v14 = a2;
  if (objc_msgSend(v14, "status"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4;
    v15[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v15[5] = a1[4];
    v15[6] = v3;
    v15[4] = v14;
    v4 = v3;
    v5 = v14;
    __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4((uint64_t)v15);
  }
  else
  {
    objc_msgSend(v14, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE666C30))
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v5 = v9;

    v10 = (void *)a1[4];
    objc_msgSend(v5, "contentArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOfflineAudioFetchOperation _handleArchive:](v10, v11);

    v12 = a1[6];
    objc_msgSend(v14, "fetchedObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 2)
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void (**)(uint64_t))(v6 + 16);
    v9 = v6;
LABEL_6:
    v11 = (id)v7;
    v8(v9);
    goto LABEL_7;
  }
  if (v2 != 1)
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void (**)(uint64_t))(v10 + 16);
    v9 = v10;
    goto LABEL_6;
  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_operationCancelledErrorWithAdditionalUserInfo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

LABEL_7:
}

- (void)_handleArchive:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_msgSend(a1, "archiveQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "archiveHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v6)
      {
        objc_msgSend(a1, "archiveQueue");
        v7 = objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __47__FCOfflineAudioFetchOperation__handleArchive___block_invoke_2;
        v9[3] = &unk_1E463AD10;
        v9[4] = a1;
        v10 = v4;
        dispatch_async(v7, v9);

      }
    }
    else if (v6)
    {
      objc_msgSend(a1, "archiveHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v4);

    }
  }

}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCAudioTrackFetchOperation *v7;
  uint64_t v8;
  uint64_t v9;
  FCAudioTrackFetchOperation *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v5 = a2;
  v6 = a3;
  v7 = [FCAudioTrackFetchOperation alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 424);
  else
    v9 = 0;
  v10 = -[FCAudioTrackFetchOperation initWithContext:audioTrack:](v7, "initWithContext:audioTrack:", v9, *(_QWORD *)(a1 + 40));
  -[FCAudioTrackFetchOperation setCachedOnly:](v10, "setCachedOnly:", objc_msgSend(*(id *)(a1 + 32), "cachedOnly"));
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_3;
  v21[3] = &unk_1E4644210;
  v21[4] = *(_QWORD *)(a1 + 32);
  -[FCAudioTrackFetchOperation setInterestTokenHandler:](v10, "setInterestTokenHandler:", v21);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_4;
  v20[3] = &unk_1E4644238;
  v20[4] = *(_QWORD *)(a1 + 32);
  -[FCAudioTrackFetchOperation setArchiveHandler:](v10, "setArchiveHandler:", v20);
  v14 = v11;
  v15 = 3221225472;
  v16 = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_5;
  v17 = &unk_1E4643418;
  v18 = v6;
  v19 = v5;
  v12 = v5;
  v13 = v6;
  -[FCAudioTrackFetchOperation setFetchCompletionHandler:](v10, "setFetchCompletionHandler:", &v14);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10, v14, v15, v16, v17);
  -[FCOperation start](v10, "start");

}

uint64_t __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 440), "addObject:", a2);
  }
  return result;
}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
  -[FCOfflineAudioFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __47__FCOfflineAudioFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "archiveHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)archiveHandler
{
  return self->archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (OS_dispatch_queue)archiveQueue
{
  return self->archiveQueue;
}

- (void)setArchiveQueue:(id)a3
{
  objc_storeStrong((id *)&self->archiveQueue, a3);
}

- (BOOL)cachedOnly
{
  return self->cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->cachedOnly = a3;
}

- (id)fetchCompletionHandler
{
  return self->fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return self->fetchCompletionQueue;
}

- (void)setFetchCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->fetchCompletionQueue, a3);
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (OS_dispatch_queue)progressQueue
{
  return self->progressQueue;
}

- (void)setProgressQueue:(id)a3
{
  objc_storeStrong((id *)&self->progressQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end
