@implementation FCResourceArchiveFetchOperation

- (FCResourceArchiveFetchOperation)initWithArchiveURL:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  FCResourceArchiveFetchOperation *v8;
  uint64_t v9;
  NSURL *archiveURL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCResourceArchiveFetchOperation;
  v8 = -[FCOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    archiveURL = v8->_archiveURL;
    v8->_archiveURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
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
  if (self && self->_archiveURL)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("resource archive fetch operation requires a URL"));
      v8 = 136315906;
      v9 = "-[FCResourceArchiveFetchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCResourceArchiveFetchOperation.m";
      v12 = 1024;
      v13 = 81;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_context)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("resource archive fetch operation requires a context"));
    v8 = 136315906;
    v9 = "-[FCResourceArchiveFetchOperation validateOperation]";
    v10 = 2080;
    v11 = "FCResourceArchiveFetchOperation.m";
    v12 = 1024;
    v13 = 85;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  NSURL *archiveURL;
  void *v4;
  void *v5;
  void *v6;
  NSURLSessionDownloadTask *downloadTask;
  void *v8;
  void (**v9)(double);
  NSURLSessionDownloadTask *v10;
  _QWORD v11[5];

  if (self)
    archiveURL = self->_archiveURL;
  else
    archiveURL = 0;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", archiveURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCOperationFlagsApplyToURLRequest(-[FCOperation flags](self, "flags"), v4);
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke;
  v11[3] = &unk_1E463F5E0;
  v11[4] = self;
  objc_msgSend(v5, "downloadTaskWithRequest:completionHandler:", v4, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCResourceArchiveFetchOperation setDownloadTask:]((uint64_t)self, v6);

  if (self)
    downloadTask = self->_downloadTask;
  else
    downloadTask = 0;
  -[NSURLSessionDownloadTask addObserver:forKeyPath:options:context:](downloadTask, "addObserver:forKeyPath:options:context:", self, CFSTR("countOfBytesReceived"), 0, FCResourceArchiveFetchOperationKVOContext);
  -[FCResourceArchiveFetchOperation progressHandler](self, "progressHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FCResourceArchiveFetchOperation progressHandler](self, "progressHandler");
    v9 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v9[2](0.0);

  }
  if (self)
  {
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", self->_downloadTask);
    v10 = self->_downloadTask;
  }
  else
  {
    objc_msgSend(0, "associateChildOperation:", 0);
    v10 = 0;
  }
  -[NSURLSessionDownloadTask resume](v10, "resume");

}

void __51__FCResourceArchiveFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _QWORD *v6;
  id v7;
  void *v8;
  void (**v9)(double);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void (**v28)(double);
  void *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *, uint64_t);
  void *v34;
  void *v35;
  _BYTE buf[24];
  double v37;
  id v38;
  void *v39;
  id v40;
  const __CFString *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a4);
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v33 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_3;
    v34 = &unk_1E463B408;
    v35 = v4;
    v6 = v32;
    if (v4)
    {
      v7 = a2;
      objc_msgSend(v4, "progressHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "progressHandler");
        v9 = (void (**)(double))objc_claimAutoreleasedReturnValue();
        v9[2](0.85);

      }
      NSTemporaryDirectory();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 0, 0, 0);

      BOMCopierNew();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      BOMCopierSetUserData();
      BOMCopierSetCopyFileFinishedHandler();
      v41 = CFSTR("extractPKZip");
      v42[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v18 = v17;
      v19 = objc_retainAutorelease(v7);
      objc_msgSend(v19, "fileSystemRepresentation");

      v20 = objc_retainAutorelease(v13);
      objc_msgSend(v20, "fileSystemRepresentation");
      LODWORD(v13) = BOMCopierCopyWithOptions();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v22 = v21;
      BOMCopierFree();
      if ((_DWORD)v13)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke;
        v37 = COERCE_DOUBLE(&unk_1E463B598);
        v38 = v6;
        __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke((uint64_t)buf);
      }
      else
      {
        v23 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          objc_msgSend(v4, "shortOperationDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2048;
          v37 = v22 - v18;
          _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully extracted %lu files from zip archive in %.2fs", buf, 0x20u);

        }
        objc_msgSend(v4, "progressHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v4, "progressHandler");
          v28 = (void (**)(double))objc_claimAutoreleasedReturnValue();
          v28[2](0.95);

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v4, "maxConcurrentFetchCount");
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke_24;
        v37 = COERCE_DOUBLE(&unk_1E463F608);
        v38 = v20;
        v39 = v4;
        v40 = v29;
        v31 = v29;
        objc_msgSend(v15, "fc_visitSubarraysWithMaxCount:block:", v30, buf);
        v33((uint64_t)v6, v31, 0);

      }
    }

  }
}

void __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  void *v7;
  FCAssetsFetchOperation *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD v19[5];

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_5;
    v14 = &unk_1E463B408;
    v15 = v3;
    v5 = a2;
    v6 = &v11;
    if (v3)
    {
      objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_35, v11, v12, v13, v14, v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FCAssetsFetchOperation initWithAssetHandles:]([FCAssetsFetchOperation alloc], "initWithAssetHandles:", v7);
      -[FCFetchOperation setShouldFailOnMissingObjects:](v8, "setShouldFailOnMissingObjects:", 1);
      -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v8, "setMaxConcurrentFetchCount:", objc_msgSend(v3, "maxConcurrentFetchCount"));
      objc_msgSend(v3, "interestTokenHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCAssetsFetchOperation setInterestTokenHandler:](v8, "setInterestTokenHandler:", v9);

      objc_msgSend(v3, "archiveHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCAssetsFetchOperation setArchiveHandler:](v8, "setArchiveHandler:", v10);

      v19[0] = v4;
      v19[1] = 3221225472;
      v19[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_2;
      v19[3] = &unk_1E463F650;
      v19[4] = v3;
      -[FCAssetsFetchOperation setProgressHandler:](v8, "setProgressHandler:", v19);
      v16[0] = v4;
      v16[1] = 3221225472;
      v16[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_3;
      v16[3] = &unk_1E463F678;
      v18 = v6;
      v17 = v5;
      -[FCFetchOperation setFetchCompletionBlock:](v8, "setFetchCompletionBlock:", v16);
      objc_msgSend(v3, "associateChildOperation:", v8);
      -[FCOperation start](v8, "start");

    }
  }
}

uint64_t __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;

  v4 = *(id **)(a1 + 32);
  if (!a3)
  {
    if (v4)
    {
      objc_storeStrong(v4 + 54, a2);
      v4 = *(id **)(a1 + 32);
    }
    a3 = 0;
  }
  return objc_msgSend(v4, "finishedPerformingOperationWithError:", a3);
}

- (void)setDownloadTask:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 424), a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  NSURLSessionDownloadTask *downloadTask;
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *resultResources;
  id v9;

  v9 = a3;
  if (self)
    downloadTask = self->_downloadTask;
  else
    downloadTask = 0;
  -[NSURLSessionDownloadTask removeObserver:forKeyPath:](downloadTask, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesReceived"));
  -[FCResourceArchiveFetchOperation setDownloadTask:]((uint64_t)self, 0);
  -[FCResourceArchiveFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCResourceArchiveFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self)
      resultResources = self->_resultResources;
    else
      resultResources = 0;
    (*(void (**)(uint64_t, NSArray *, id))(v6 + 16))(v6, resultResources, v9);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSURLSessionDownloadTask *downloadTask;
  uint64_t v8;
  NSURLSessionDownloadTask *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSURLSessionDownloadTask *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(double);
  objc_super v19;

  if ((void *)FCResourceArchiveFetchOperationKVOContext == a6)
  {
    if (self)
      downloadTask = self->_downloadTask;
    else
      downloadTask = 0;
    v8 = -[NSURLSessionDownloadTask countOfBytesExpectedToReceive](downloadTask, "countOfBytesExpectedToReceive", a3, a4, a5);
    if (v8 < 0)
    {
      objc_opt_class();
      if (self)
        v9 = self->_downloadTask;
      else
        v9 = 0;
      -[NSURLSessionDownloadTask response](v9, "response");
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

      objc_msgSend(v12, "allHeaderFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Content-Length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v14, "longLongValue");
    }
    if (self)
      v15 = self->_downloadTask;
    else
      v15 = 0;
    v16 = -[NSURLSessionDownloadTask countOfBytesReceived](v15, "countOfBytesReceived");
    -[FCResourceArchiveFetchOperation progressHandler](self, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[FCResourceArchiveFetchOperation progressHandler](self, "progressHandler");
      v18 = (void (**)(double))objc_claimAutoreleasedReturnValue();
      v18[2]((double)v16 / (double)v8 * 0.85 + 0.0);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)FCResourceArchiveFetchOperation;
    -[FCResourceArchiveFetchOperation observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_unzipFailedErrorWithErrorCode:", *__error());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCResource *v18;
  void *v19;
  FCResource *v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v23 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD **)(a1 + 40);
        if (v8)
          v8 = (_QWORD *)v8[52];
        v9 = v8;
        objc_msgSend(v9, "internalContentContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentDatabase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "permanentURLForRecordID:field:", v6, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = *(_QWORD *)(a1 + 40);
        if (v13)
          v14 = *(void **)(v13 + 416);
        else
          v14 = 0;
        objc_msgSend(v14, "assetManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:", v12, v16, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = [FCResource alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[FCResource initWithResourceID:assetHandle:fetchDate:](v18, "initWithResourceID:assetHandle:fetchDate:", v6, v17, v19);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);
        ++v5;
      }
      while (v4 != v5);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v4 = v21;
    }
    while (v21);
  }

}

uint64_t __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetHandle");
}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  void (**v5)(double);

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressHandler");
    v5 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v5[2](a2 * 0.05 + 0.95);

  }
}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[6];

  v5 = a2;
  if (objc_msgSend(v5, "status"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4;
    v6[3] = &unk_1E463B2D0;
    v3 = *(void **)(a1 + 40);
    v6[4] = v5;
    v6[5] = v3;
    v4 = v3;
    __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4((uint64_t)v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultResources, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
