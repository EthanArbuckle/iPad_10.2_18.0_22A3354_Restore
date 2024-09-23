@implementation FCArticleDownloadService

- (FCArticleDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4
{
  id v7;
  id v8;
  FCArticleDownloadService *v9;
  FCArticleDownloadService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCArticleDownloadService;
  v9 = -[FCArticleDownloadService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_ANFHelper, a4);
  }

  return v10;
}

- (FCArticleDownloadService)init
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
    v8 = "-[FCArticleDownloadService init]";
    v9 = 2080;
    v10 = "FCArticleDownloadService.m";
    v11 = 1024;
    v12 = 44;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleDownloadService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)fetchCachedArticleWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  FCOfflineArticleFetchOperation *v8;
  void *v9;
  void *v10;
  FCOfflineArticleFetchOperation *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  FCOfflineArticleFetchOperation *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [FCOfflineArticleFetchOperation alloc];
  -[FCArticleDownloadService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleDownloadService ANFHelper](self, "ANFHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCOfflineArticleFetchOperation initWithContext:ANFHelper:articleID:](v8, "initWithContext:ANFHelper:articleID:", v9, v10, v6);

  -[FCOperation setQualityOfService:](v11, "setQualityOfService:", 9);
  -[FCOfflineArticleFetchOperation setQueuePriority:](v11, "setQueuePriority:", 0);
  -[FCOfflineArticleFetchOperation setCachedOnly:](v11, "setCachedOnly:", 1);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__37;
  v29[4] = __Block_byref_object_dispose__37;
  +[FCContentArchive empty](FCContentArchive, "empty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30 = v12;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke;
  v28[3] = &unk_1E463AB40;
  v28[4] = v29;
  -[FCOfflineArticleFetchOperation setArchiveHandler:](v11, "setArchiveHandler:", v28);
  v21 = v13;
  v22 = 3221225472;
  v23 = __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke_2;
  v24 = &unk_1E463AB68;
  v14 = v6;
  v25 = v14;
  v15 = v7;
  v26 = v15;
  v27 = v29;
  -[FCOfflineArticleFetchOperation setFetchCompletionHandler:](v11, "setFetchCompletionHandler:", &v21);
  v16 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v11, "shortOperationDescription", v21, v22, v23, v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Will check cache for article %{public}@ with operation %{public}@", buf, 0x16u);

  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:](FCTaskScheduler, "scheduleBackgroundDownloadOperation:", v11);
  v18 = v26;
  v19 = v11;

  _Block_object_dispose(v29, 8);
  return v19;
}

void __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("not cached");
    v9 = *(_QWORD *)(a1 + 32);
    if (!v6)
      v8 = CFSTR("success");
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for article %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)fetchCachedAudioWithArticleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  FCOfflineAudioFetchOperation *v8;
  void *v9;
  FCOfflineAudioFetchOperation *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  FCOfflineAudioFetchOperation *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [FCOfflineAudioFetchOperation alloc];
  -[FCArticleDownloadService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCOfflineAudioFetchOperation initWithContext:articleID:](v8, "initWithContext:articleID:", v9, v6);

  -[FCOperation setQualityOfService:](v10, "setQualityOfService:", 9);
  -[FCOfflineAudioFetchOperation setQueuePriority:](v10, "setQueuePriority:", 0);
  -[FCOfflineAudioFetchOperation setCachedOnly:](v10, "setCachedOnly:", 1);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__37;
  v28[4] = __Block_byref_object_dispose__37;
  +[FCContentArchive empty](FCContentArchive, "empty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29 = v11;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke;
  v27[3] = &unk_1E463AB40;
  v27[4] = v28;
  -[FCOfflineAudioFetchOperation setArchiveHandler:](v10, "setArchiveHandler:", v27);
  v20 = v12;
  v21 = 3221225472;
  v22 = __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke_2;
  v23 = &unk_1E463AB68;
  v13 = v6;
  v24 = v13;
  v14 = v7;
  v25 = v14;
  v26 = v28;
  -[FCOfflineAudioFetchOperation setFetchCompletionHandler:](v10, "setFetchCompletionHandler:", &v20);
  v15 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v10, "shortOperationDescription", v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v13;
    v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Will check cache for audio %{public}@ with operation %{public}@", buf, 0x16u);

  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:](FCTaskScheduler, "scheduleBackgroundDownloadOperation:", v10);
  v17 = v25;
  v18 = v10;

  _Block_object_dispose(v28, 8);
  return v18;
}

void __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("not cached");
    v9 = *(_QWORD *)(a1 + 32);
    if (!v6)
      v8 = CFSTR("success");
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for audio %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isArticleDownloadedEnoughToRead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  FCArticleContent *v10;
  void *v11;
  FCArticleContent *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCArticleDownloadService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "articleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRecordWithID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    v10 = [FCArticleContent alloc];
    -[FCArticleDownloadService context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCArticleContent initWithContext:articleRecord:](v10, "initWithContext:articleRecord:", v11, v9);

    if (v12)
    {
      -[FCArticleContent anfContent](v12, "anfContent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
        v16 = objc_msgSend(v15, "isANFDocumentCached");
        if ((v16 & 1) != 0)
        {
          v17 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v4;
            _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is readable", buf, 0xCu);
          }
        }
        else
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_20;
          v19[3] = &unk_1E463ABB8;
          v19[4] = v4;
          v19[5] = v15;
          __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_20((uint64_t)v19);
        }

      }
      else
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_19;
        v20[3] = &unk_1E463AB90;
        v20[4] = v4;
        __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_19((uint64_t)v20);
        v16 = 0;
      }

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_18;
      v21[3] = &unk_1E463AB90;
      v21[4] = v4;
      __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_18((uint64_t)v21);
      v16 = 0;
    }

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke;
    v22[3] = &unk_1E463AB90;
    v22[4] = v4;
    __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke((uint64_t)v22);
    v16 = 0;
  }

  return v16;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because its article record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because it has an unknown content type", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because it is not ANF", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "anfDocumentAssetHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because its ANF document is not cached, document=%{public}@", (uint8_t *)&v10, 0x16u);

  }
  return 0;
}

- (BOOL)isArticleDownloadedEnoughToListen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  BOOL v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCArticleDownloadService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "articleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRecordWithID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "narrativeTrackFullIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_21;
      v21[3] = &unk_1E463AB90;
      v21[4] = v4;
      __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_21((uint64_t)v21);
      v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = v9;
    -[FCArticleDownloadService context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internalContentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "avAssetDownloadManager");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = -[FCAVAssetDownloadManager _isAssetInCache:](v14, v11);

      if ((v16 & 1) != 0)
      {
        v17 = FCOfflineDownloadsLog;
        if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v4;
          _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is listenable", buf, 0xCu);
        }
        v18 = 1;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_22;
    v20[3] = &unk_1E463AB90;
    v20[4] = v11;
    __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_22((uint64_t)v20);
    v18 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke;
  v22[3] = &unk_1E463AB90;
  v22[4] = v4;
  __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke((uint64_t)v22);
  v18 = 0;
LABEL_14:

  return v18;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because its article record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because it has no narrative track", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because its narrative track is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
