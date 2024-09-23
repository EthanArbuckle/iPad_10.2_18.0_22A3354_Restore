@implementation FCAssetHandle

- (NSString)uniqueKey
{
  if (self)
    self = (FCAssetHandle *)self->_assetKey;
  return (NSString *)self;
}

- (void)setRemoteURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setHoldToken:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (_QWORD)initWithDataProvider:(_QWORD *)a1
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAssetHandle;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      v6 = objc_alloc_init(MEMORY[0x1E0D60B18]);
      v7 = (void *)a1[9];
      a1[9] = v6;

    }
  }

  return a1;
}

- (id)downloadIfNeededWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = FCCurrentQoSOrUtilityIfMain();
  if (v5 == 9)
    v6 = -1;
  else
    v6 = v5 == 33 || v5 == 25;
  FCDispatchQueueForQualityOfService(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v6, 0, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;

  -[FCAssetHandle filePath](self, "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)filePath
{
  void *v2;
  void *v3;

  -[FCAssetHandle dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCAssetDataProvider)dataProvider
{
  return (FCAssetDataProvider *)objc_getProperty(self, a2, 8, 1);
}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  const char *v5;
  void *v6;
  id Property;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  FCContentManifest *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  -[FCAssetHandle remoteURL](self, "remoteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v5, 120, 1);
  else
    Property = 0;
  objc_msgSend(Property, "wrappingKeyID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (self)
      v10 = objc_getProperty(self, v8, 120, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "wrappingKeyID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:](v3, "initWithAssetURLs:assetWrappingKeyIDs:", v6, v12);

  }
  else
  {
    v13 = -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:](v3, "initWithAssetURLs:assetWrappingKeyIDs:", v6, MEMORY[0x1E0C9AA60]);
  }

  return v13;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_rawFilePath, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_dateOfLastDownloadAttempt, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_downloadRequests, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

- (void)dealloc
{
  FCAssetHandle *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (FCAssetHandle *)self->_fetchOperation;
  -[FCAssetHandle cancel](self, "cancel");
  -[FCAssetHandle setFetchOperation:]((uint64_t)v2, 0);
  v3.receiver = v2;
  v3.super_class = (Class)FCAssetHandle;
  -[FCAssetHandle dealloc](&v3, sel_dealloc);
}

- (void)setFetchOperation:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (NSError)downloadError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (id)_downloadIfNeededWithPriority:(uint64_t)a3 flags:(void *)a4 completionQueue:(void *)a5 completion:
{
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  NSObject *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a4;
  v10 = a5;
  if (!a1)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__15;
  v32 = __Block_byref_object_dispose__15;
  v33 = 0;
  objc_msgSend(a1, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_6;
  }
  if (!-[FCAssetHandle _canRetryDownload](a1))
  {
LABEL_6:
    if (v10)
      dispatch_async(v9, v10);
    goto LABEL_8;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__15;
  v26 = __Block_byref_object_dispose__15;
  v27 = 0;
  v12 = a1[9];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke;
  v15[3] = &unk_1E463DF18;
  v15[4] = a1;
  v20 = a2;
  v21 = a3;
  v18 = &v22;
  v19 = &v28;
  v17 = v10;
  v16 = v9;
  objc_msgSend(v12, "performWithLockSync:", v15);

  objc_msgSend((id)v23[5], "start");
  _Block_object_dispose(&v22, 8);

LABEL_8:
  v13 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

LABEL_9:
  return v13;
}

- (id)downloadIfNeededWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = 25;
  if (!a3)
    v7 = 17;
  if (a3 == -1)
    v8 = 9;
  else
    v8 = v7;
  FCDispatchQueueForQualityOfService(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, a3, 0, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)downloadIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = FCCurrentQoSOrUtilityIfMain();
  if (v8 == 9)
    v9 = -1;
  else
    v9 = v8 == 33 || v8 == 25;
  -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v9, 0, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)_canRetryDownload
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  SEL v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v1 = (uint64_t)a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "downloadError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      if ((objc_msgSend(v2, "fc_isOfflineError") & 1) != 0
        || objc_msgSend(v3, "fc_isRecoverableNetworkError"))
      {
        +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = objc_msgSend(v4, "isNetworkReachable");

      }
      else if ((objc_msgSend(v3, "fc_isHTTPNotFoundError") & 1) != 0)
      {
        v1 = 0;
      }
      else
      {
        if (!*(_QWORD *)(v1 + 56) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't reach this point without at least one penalized download attempt"));
          v11 = 136315906;
          v12 = "-[FCAssetHandle _canRetryDownload]";
          v13 = 2080;
          v14 = "FCAssetHandle.m";
          v15 = 1024;
          v16 = 379;
          v17 = 2114;
          v18 = v10;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", objc_getProperty((id)v1, v7, 64, 1));
        v9 = v8;

        v1 = v9 >= fmin(exp2((double)(unint64_t)(*(_QWORD *)(v1 + 56) - 1)) * 5.0, 60.0);
      }
    }
    else
    {
      v1 = 1;
    }

  }
  return v1;
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  FCAssetHandleDownloadRequest *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD newValue[4];
  id v35;
  id v36;
  id from[6];
  _BYTE location[12];
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

    goto LABEL_37;
  }
  if (!-[FCAssetHandle _canRetryDownload](*(void **)(a1 + 32)))
  {
LABEL_37:
    v29 = *(void **)(a1 + 48);
    if (v29)
      dispatch_async(*(dispatch_queue_t *)(a1 + 40), v29);
    return;
  }
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C809B0];
  if (!v3 || !v3[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      objc_storeStrong((id *)(v6 + 40), v5);

    v3 = *(_QWORD **)(a1 + 32);
    if (!v3)
      goto LABEL_41;
  }
  if (!v3[6])
  {
    if (!v3[4])
      goto LABEL_12;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("asset handle should never have a non-nil fetch operation without a fetch group"));
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]_block_invoke";
    v39 = 2080;
    v40 = "FCAssetHandle.m";
    v41 = 1024;
    v42 = 150;
    v43 = 2114;
    v44 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

    v3 = *(_QWORD **)(a1 + 32);
    if (v3)
    {
LABEL_12:
      v7 = (void *)v3[5];
      goto LABEL_13;
    }
LABEL_41:
    v7 = 0;
LABEL_13:
    if (objc_msgSend(v7, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("asset handle should never have non-zero fetch interest without a fetch operation"));
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]_block_invoke";
      v39 = 2080;
      v40 = "FCAssetHandle.m";
      v41 = 1024;
      v42 = 151;
      v43 = 2114;
      v44 = v31;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

    }
    v8 = dispatch_group_create();
    -[FCAssetHandle setFetchGroup:](*(_QWORD *)(a1 + 32), v8);

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(NSObject **)(v9 + 48);
    else
      v10 = 0;
    dispatch_group_enter(v10);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v11 + 80));
      v13 = *(void **)(a1 + 32);
    }
    else
    {
      v13 = 0;
      WeakRetained = 0;
    }
    from[1] = v4;
    from[2] = (id)3221225472;
    from[3] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8;
    from[4] = &unk_1E463DE30;
    from[5] = v13;
    objc_msgSend(WeakRetained, "operationToFetchDataProviderForAssetHandle:completion:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetHandle setFetchOperation:](*(_QWORD *)(a1 + 32), v14);

    if (*(_QWORD *)(a1 + 32))
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    else
      v15 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setRelativePriority:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFlags:", *(_QWORD *)(a1 + 80));
    if (*(uint64_t *)(a1 + 72) <= 0)
      v16 = -1;
    else
      v16 = 25;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setQualityOfService:", v16);
  }
  v17 = objc_alloc_init(FCAssetHandleDownloadRequest);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRelativePriority:", *(_QWORD *)(a1 + 72));
  objc_initWeak((id *)location, *(id *)(a1 + 32));
  objc_initWeak(from, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  newValue[0] = v4;
  newValue[1] = 3221225472;
  newValue[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_2;
  newValue[3] = &unk_1E463DEA8;
  objc_copyWeak(&v35, (id *)location);
  objc_copyWeak(&v36, from);
  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v21)
    objc_setProperty_nonatomic_copy(v21, v20, newValue, 16);
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_6;
  v32[3] = &unk_1E463DEF0;
  objc_copyWeak(&v33, (id *)location);
  v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v23)
    objc_setProperty_nonatomic_copy(v23, v22, v32, 24);
  v24 = *(_QWORD **)(a1 + 32);
  if (v24)
    v24 = (_QWORD *)v24[5];
  v25 = v24;
  objc_msgSend(v25, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v26 = *(void **)(a1 + 48);
  if (v26)
  {
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
      v28 = *(NSObject **)(v27 + 48);
    else
      v28 = 0;
    dispatch_group_notify(v28, *(dispatch_queue_t *)(a1 + 40), v26);
  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(from);
  objc_destroyWeak((id *)location);
}

- (void)setFetchGroup:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__15;
    v17 = __Block_byref_object_dispose__15;
    v18 = 0;
    v7 = *(id *)(v4 + 72);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__FCAssetHandle__completeFetchWithDataProvider_error___block_invoke;
    v9[3] = &unk_1E463DF40;
    v9[4] = v4;
    v10 = v5;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v7, "performWithLockSync:", v9);

    v8 = v14[5];
    if (v8)
      dispatch_group_leave(v8);

    _Block_object_dispose(&v13, 8);
  }

}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_3;
  v3[3] = &unk_1E463DE80;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  FCPerformIfNonNil(WeakRetained, v3);

  objc_destroyWeak(&v4);
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  _QWORD v5[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_4;
  v5[3] = &unk_1E463DE58;
  v5[4] = v3;
  FCPerformIfNonNil(WeakRetained, v5);

}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 72);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_5;
  v7[3] = &unk_1E463AD10;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performWithLockSync:", v7);

}

uint64_t __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(v2 + 40), "removeObject:", v3);
    if (!objc_msgSend(*(id *)(v2 + 40), "count"))
    {
      objc_msgSend(*(id *)(v2 + 32), "cancel");
      v4 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = 0;

    }
  }

  return -[FCAssetHandle _revisitDownloadRequestPriorities](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_revisitDownloadRequestPriorities
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(result + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      v6 = -1;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "relativePriority", (_QWORD)v10);
          if (v6 <= v8)
            v6 = v8;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v6 = -1;
    }

    objc_msgSend(*(id *)(v1 + 32), "setRelativePriority:", v6);
    if (v6 <= 0)
      v9 = -1;
    else
      v9 = 25;
    return objc_msgSend(*(id *)(v1 + 32), "setQualityOfService:", v9, (_QWORD)v10);
  }
  return result;
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  FCPerformIfNonNil(WeakRetained, &__block_literal_global_24);

}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_7(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  _QWORD v4[5];

  if (a2)
    v2 = (void *)a2[9];
  else
    v2 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8;
  v4[3] = &unk_1E463AB18;
  v4[4] = a2;
  v3 = a2;
  objc_msgSend(v2, "performWithLockSync:", v4);

}

uint64_t __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8(uint64_t a1)
{
  return -[FCAssetHandle _revisitDownloadRequestPriorities](*(_QWORD *)(a1 + 32));
}

- (id)downloadIfNeededWithGroup:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  NSObject *v9;

  v4 = a3;
  -[FCAssetHandle dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    dispatch_group_enter(v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__FCAssetHandle_downloadIfNeededWithGroup___block_invoke;
    v8[3] = &unk_1E463AB18;
    v9 = v4;
    -[FCAssetHandle downloadIfNeededWithCompletion:](self, "downloadIfNeededWithCompletion:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __43__FCAssetHandle_downloadIfNeededWithGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)isDownloadFailureRecoverable
{
  void *v3;
  void *v4;
  int v5;

  -[FCAssetHandle downloadError](self, "downloadError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FCAssetHandle downloadError](self, "downloadError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fc_isHTTPNotFoundError") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)fetchDataProviderWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = FCCurrentQoSOrUtilityIfMain();
  if (v5 == 9)
    v6 = -1;
  else
    v6 = v5 == 33 || v5 == 25;
  FCDispatchQueueForQualityOfService(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__FCAssetHandle_fetchDataProviderWithCompletion___block_invoke;
  v11[3] = &unk_1E463B2D0;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v6, 0, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __49__FCAssetHandle_fetchDataProviderWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataProvider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "downloadError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

- (id)fetchDataProviderWithPriority:(int64_t)a3 flags:(int64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  v9 = 25;
  if (!a3)
    v9 = 17;
  if (a3 == -1)
    v10 = 9;
  else
    v10 = v9;
  FCDispatchQueueForQualityOfService(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__FCAssetHandle_fetchDataProviderWithPriority_flags_completion___block_invoke;
  v15[3] = &unk_1E463B2D0;
  v15[4] = self;
  v16 = v8;
  v12 = v8;
  -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, a3, a4, v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __64__FCAssetHandle_fetchDataProviderWithPriority_flags_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "downloadError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (FCContentArchive)contentArchive
{
  id WeakRetained;
  void *v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "contentArchiveForAssetHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v4;
}

void __54__FCAssetHandle__completeFetchWithDataProvider_error___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  char *v14;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDataProvider:");
    v4 = *(void **)(a1 + 32);
    if (!v4)
      goto LABEL_23;
    v5 = 0;
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "fc_isCancellationError") & 1) != 0)
      goto LABEL_10;
    v4 = *(void **)(a1 + 32);
    if (!v4)
      goto LABEL_23;
    v5 = *(void **)(a1 + 48);
  }
  objc_setProperty_atomic(v4, v3, v5, 16);
LABEL_10:
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = *(void **)(v6 + 48);
    goto LABEL_12;
  }
LABEL_23:
  v7 = 0;
LABEL_12:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
  -[FCAssetHandle setFetchOperation:](*(_QWORD *)(a1 + 32), 0);
  -[FCAssetHandle setFetchGroup:](*(_QWORD *)(a1 + 32), 0);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 40);
  else
    v9 = 0;
  objc_msgSend(v9, "removeAllObjects");
  v10 = *(void **)(a1 + 48);
  if (v10 && objc_msgSend(v10, "code") != -1009 && (objc_msgSend(*(id *)(a1 + 48), "fc_isCancellationError") & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      ++*(_QWORD *)(v11 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    if (v13)
    {
      v14 = v12;
      objc_setProperty_atomic(v13, v12, v12, 64);
      v12 = v14;
    }

  }
}

- (void)setDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
