@implementation FCIssueDownloadService

- (FCIssueDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4 articleDownloadService:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCIssueDownloadService *v12;
  FCIssueDownloadService *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCIssueDownloadService;
  v12 = -[FCIssueDownloadService init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    objc_storeStrong((id *)&v13->_articleDownloadService, a5);
  }

  return v13;
}

- (FCIssueDownloadService)init
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
    v8 = "-[FCIssueDownloadService init]";
    v9 = 2080;
    v10 = "FCIssueDownloadService.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssueDownloadService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)fetchCachedIssueWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  FCOfflineIssueFetchOperation *v8;
  void *v9;
  void *v10;
  FCOfflineIssueFetchOperation *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  FCOfflineIssueFetchOperation *v19;
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
  v8 = [FCOfflineIssueFetchOperation alloc];
  -[FCIssueDownloadService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCIssueDownloadService ANFHelper](self, "ANFHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCOfflineIssueFetchOperation initWithContext:ANFHelper:issueID:](v8, "initWithContext:ANFHelper:issueID:", v9, v10, v6);

  -[FCOperation setQualityOfService:](v11, "setQualityOfService:", 9);
  -[FCOfflineIssueFetchOperation setCachedOnly:](v11, "setCachedOnly:", 1);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__49;
  v29[4] = __Block_byref_object_dispose__49;
  +[FCContentArchive empty](FCContentArchive, "empty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30 = v12;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke;
  v28[3] = &unk_1E463AB40;
  v28[4] = v29;
  -[FCOfflineIssueFetchOperation setArchiveHandler:](v11, "setArchiveHandler:", v28);
  v21 = v13;
  v22 = 3221225472;
  v23 = __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke_2;
  v24 = &unk_1E463AB68;
  v14 = v6;
  v25 = v14;
  v15 = v7;
  v26 = v15;
  v27 = v29;
  -[FCOfflineIssueFetchOperation setFetchCompletionHandler:](v11, "setFetchCompletionHandler:", &v21);
  v16 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v11, "shortOperationDescription", v21, v22, v23, v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Will check cache for issue %{public}@ with operation %{public}@", buf, 0x16u);

  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:](FCTaskScheduler, "scheduleBackgroundDownloadOperation:", v11);
  v18 = v26;
  v19 = v11;

  _Block_object_dispose(v29, 8);
  return v19;
}

void __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for issue %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int64_t)isIssueDownloadedEnoughToRead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  int64_t v19;
  NSObject *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCIssueDownloadService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "issueRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRecordWithID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    -[FCIssueDownloadService context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateMetadataJSONAssetHandleWithAssetManager:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "dataProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_msgSend(v9, "type");
        if (v14 == 2)
        {
          v20 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v4;
            _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ has unknown readability because it's a PDF issue'", buf, 0xCu);
          }
          v19 = -1;
          goto LABEL_18;
        }
        if (v14 != 1
          || (-[FCIssueDownloadService articleDownloadService](self, "articleDownloadService"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "coverArticleID"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v15, "isArticleDownloadedEnoughToRead:", v16),
              v16,
              v15,
              (v17 & 1) != 0))
        {
          v18 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v4;
            _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is readable", buf, 0xCu);
          }
          v19 = 1;
          goto LABEL_18;
        }
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_18;
        v22[3] = &unk_1E4642F58;
        v22[4] = v4;
        __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_18((uint64_t)v22);
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_17;
        v23[3] = &unk_1E4642F58;
        v23[4] = v4;
        __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_17((uint64_t)v23);
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_16;
      v24[3] = &unk_1E4642F58;
      v24[4] = v4;
      __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_16((uint64_t)v24);
    }
    v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke;
  v25[3] = &unk_1E4642F58;
  v25[4] = v4;
  __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke((uint64_t)v25);
  v19 = 0;
LABEL_19:

  return v19;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its issue record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_16(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because it has no metadata asset handle", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_17(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its metadata is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_18(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its cover article is not readable", (uint8_t *)&v5, 0xCu);
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

- (FCArticleDownloadServiceType)articleDownloadService
{
  return self->_articleDownloadService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleDownloadService, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
