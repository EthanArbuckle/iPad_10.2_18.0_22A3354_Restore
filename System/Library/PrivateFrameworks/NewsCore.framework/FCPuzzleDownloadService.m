@implementation FCPuzzleDownloadService

- (FCPuzzleDownloadService)initWithContext:(id)a3
{
  id v5;
  FCPuzzleDownloadService *v6;
  FCPuzzleDownloadService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPuzzleDownloadService;
  v6 = -[FCPuzzleDownloadService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (FCPuzzleDownloadService)init
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
    v8 = "-[FCPuzzleDownloadService init]";
    v9 = 2080;
    v10 = "FCPuzzleDownloadService.m";
    v11 = 1024;
    v12 = 37;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPuzzleDownloadService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)fetchCachedPuzzleWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  FCOfflinePuzzleFetchOperation *v8;
  void *v9;
  FCOfflinePuzzleFetchOperation *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  FCOfflinePuzzleFetchOperation *v18;
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
  v8 = [FCOfflinePuzzleFetchOperation alloc];
  -[FCPuzzleDownloadService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCOfflinePuzzleFetchOperation initWithContext:puzzleID:](v8, "initWithContext:puzzleID:", v9, v6);

  -[FCOperation setQualityOfService:](v10, "setQualityOfService:", 9);
  -[FCOfflinePuzzleFetchOperation setCachedOnly:](v10, "setCachedOnly:", 1);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  +[FCContentArchive empty](FCContentArchive, "empty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29 = v11;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke;
  v27[3] = &unk_1E463AB40;
  v27[4] = v28;
  -[FCOfflinePuzzleFetchOperation setArchiveHandler:](v10, "setArchiveHandler:", v27);
  v20 = v12;
  v21 = 3221225472;
  v22 = __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke_2;
  v23 = &unk_1E463AB68;
  v13 = v6;
  v24 = v13;
  v14 = v7;
  v25 = v14;
  v26 = v28;
  -[FCOfflinePuzzleFetchOperation setFetchCompletionHandler:](v10, "setFetchCompletionHandler:", &v20);
  v15 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v10, "shortOperationDescription", v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v13;
    v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Will check cache for puzzle %{public}@ with operation %{public}@", buf, 0x16u);

  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:](FCTaskScheduler, "scheduleBackgroundDownloadOperation:", v10);
  v17 = v25;
  v18 = v10;

  _Block_object_dispose(v28, 8);
  return v18;
}

void __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for puzzle %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isPuzzleDownloadedEnoughToUse:(id)a3
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
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  void *v31;
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[5];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCPuzzleDownloadService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "puzzleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRecordWithID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    -[FCPuzzleDownloadService context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "internalContentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "puzzleTypeRecordSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "puzzleTypeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedRecordWithID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = v14;
      -[FCPuzzleDownloadService context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "flintResourceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataResourceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cachedResourceWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v31 = v19;
        v20 = v19;
        -[FCPuzzleDownloadService context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "flintResourceManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "engineResourceID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cachedResourceWithIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = v15;
          v26 = v24;
          v27 = v20;
          if ((objc_msgSend(v20, "isOnDisk") & 1) != 0)
          {
            v19 = v31;
            if ((objc_msgSend(v26, "isOnDisk") & 1) != 0)
            {
              v28 = FCOfflineDownloadsLog;
              if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v39 = v4;
                _os_log_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is usable", buf, 0xCu);
              }
              v29 = 1;
            }
            else
            {
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20;
              v32[3] = &unk_1E463ABB8;
              v32[4] = v4;
              v32[5] = v26;
              __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20((uint64_t)v32);
              v29 = 0;
            }
          }
          else
          {
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19;
            v33[3] = &unk_1E463ABB8;
            v33[4] = v4;
            v33[5] = v20;
            __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19((uint64_t)v33);
            v29 = 0;
            v19 = v31;
          }

        }
        else
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_18;
          v34[3] = &unk_1E463ABB8;
          v34[4] = v4;
          v34[5] = v15;
          v25 = v15;
          __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_18((uint64_t)v34);
          v29 = 0;
          v27 = v20;
          v19 = v31;
        }

        v15 = v25;
      }
      else
      {
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_17;
        v35[3] = &unk_1E463ABB8;
        v35[4] = v4;
        v35[5] = v9;
        __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_17((uint64_t)v35);
        v29 = 0;
      }

    }
    else
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_16;
      v36[3] = &unk_1E463ABB8;
      v36[4] = v4;
      v36[5] = v9;
      __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_16((uint64_t)v36);
      v29 = 0;
    }

  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke;
    v37[3] = &unk_1E463AB90;
    v37[4] = v4;
    __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke((uint64_t)v37);
    v29 = 0;
  }

  return v29;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its puzzle record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "puzzleTypeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its puzzle type record is not cached, type=%{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "dataResourceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its data resource is not cached, resource=%{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "engineResourceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its engine resource is not cached, resource=%{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "assetHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its data asset is not cached, asset=%{public}@", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "assetHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its engine asset is not cached, asset=%{public}@", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

- (FCContentContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
