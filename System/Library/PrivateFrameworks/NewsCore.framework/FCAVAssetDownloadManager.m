@implementation FCAVAssetDownloadManager

void __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 32);
  CacheManagementEnumerateAssets();

}

- (id)initWithAssetCache:(void *)a3 keyCache:(void *)a4 networkReachability:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id *v13;
  FCThreadSafeMutableDictionary *v14;
  id v15;
  FCAsyncOnceOperation *v16;
  id v17;
  id v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id v22;
  id *v23;
  void *v25;
  _QWORD v26[4];
  id *v27;
  _QWORD v28[4];
  id *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!a1)
    goto LABEL_7;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkReachability");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCAVAssetDownloadManager initWithAssetCache:keyCache:networkReachability:]";
    v33 = 2080;
    v34 = "FCAVAssetDownloadManager.m";
    v35 = 1024;
    v36 = 116;
    v37 = 2114;
    v38 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v30.receiver = a1;
  v30.super_class = (Class)FCAVAssetDownloadManager;
  v12 = (id *)objc_msgSendSuper2(&v30, sel_init);
  if (v12)
  {
    v13 = v12;
    objc_storeStrong(v12 + 1, a2);
    objc_storeStrong(v13 + 2, a3);
    objc_storeStrong(v13 + 3, a4);
    v14 = objc_alloc_init(FCThreadSafeMutableDictionary);
    v15 = v13[6];
    v13[6] = v14;

    v16 = -[FCAsyncOnceOperation initWithTarget:selector:]([FCAsyncOnceOperation alloc], "initWithTarget:selector:", v13, sel__restoreBackgroundDownloadsWithCompletionHandler_);
    v17 = v13[4];
    v13[4] = v16;

    v18 = objc_alloc(MEMORY[0x1E0D60AD0]);
    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke;
    v28[3] = &unk_1E463B350;
    v20 = v13;
    v29 = v20;
    v21 = objc_msgSend(v18, "initWithConstructor:", v28);
    v22 = v20[5];
    v20[5] = (id)v21;

    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_2;
    v26[3] = &unk_1E463AB18;
    v23 = v20;
    v27 = v23;
    +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v26);

  }
  else
  {
LABEL_7:
    v23 = 0;
  }

  return v23;
}

- (FCAVAssetDownloadManager)init
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
    v8 = "-[FCAVAssetDownloadManager init]";
    v9 = 2080;
    v10 = "FCAVAssetDownloadManager.m";
    v11 = 1024;
    v12 = 109;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetDownloadManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C92CA0], "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.news.avasset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURLCache:", 0);
  objc_msgSend(v2, "setDiscretionary:", 0);
  objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
  v3 = (void *)MEMORY[0x1E0C8AFB8];
  v4 = *(_QWORD *)(a1 + 32);
  FCAVWorkOperationQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:", v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a2;
  objc_msgSend(v3, "relativePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("movpkg"));

  if (v6)
    -[FCAVAssetDownloadManager _ensureAssetIsPurgeable:](*(_QWORD *)(a1 + 32), v3);

  return 1;
}

- (void)_ensureAssetIsPurgeable:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1 && objc_msgSend(v3, "priority") != 3)
  {
    objc_msgSend(v3, "setPriority:", 3);
    objc_msgSend(v3, "commit");
  }

}

- (void)restoreBackgroundDownloadsWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 32);
    dispatch_get_global_queue(9, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "executeWithCallbackQueue:completionHandler:", v4, v6);

  }
}

- (id)interestTokenForCachedAsset:(id *)a1
{
  id *v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a1;
  if (a1)
  {
    v4 = a1[1];
    v5 = a2;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interestTokenForAssetIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[FCAVAssetDownloadManager _isAssetInCache:]((uint64_t)v2, v8))
      v9 = v7;
    else
      v9 = 0;
    v2 = v9;

  }
  return v2;
}

- (uint64_t)_isAssetInCache:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 8), "containsAssetWithIdentifier:", v3) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 8), "contentKeyIdentifiersForAssetIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_29;
      v10[3] = &unk_1E463C7A0;
      v10[4] = a1;
      objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      a1 = v7 == 0;
      if (v7)
      {
        v9[0] = v5;
        v9[1] = 3221225472;
        v9[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2;
        v9[3] = &unk_1E463ABB8;
        v9[4] = v3;
        v9[5] = v6;
        __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2((uint64_t)v9);
      }

    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke;
      v11[3] = &unk_1E463AB90;
      v11[4] = v3;
      __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke((uint64_t)v11);
      a1 = 0;
    }
  }

  return a1;
}

- (id)downloadAsset:(void *)a3 completionHandler:
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[FCAVAssetDownloadManager interestTokenForCachedAsset:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6[2](v6, v7, 0);
      a1 = 0;
    }
    else
    {
      -[FCAVAssetDownloadManager _handleAssetDownloadFromNetwork:completionHandler:](a1, v5, v6);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a1;
}

- (id)_handleAssetDownloadFromNetwork:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *(*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__43;
    v26 = __Block_byref_object_dispose__43;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__32;
    v20 = __Block_byref_object_dispose__33;
    v21 = 0;
    v7 = a1[6];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke;
    v10[3] = &unk_1E46456F8;
    v11 = v5;
    v14 = &v22;
    v12 = a1;
    v13 = v6;
    v15 = &v16;
    objc_msgSend(v7, "readWriteWithAccessor:", v10);

    v8 = v17[5];
    if (v8)
      (*(void (**)(void))(v8 + 16))();
    a1 = (id *)(id)v23[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

  }
  return a1;
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D09BD8];
  v9 = a5;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetFromPath:withIdentifier:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCAVAssetDownloadManager _ensureAssetIsPurgeable:]((uint64_t)self, v13);
  objc_msgSend(v7, "taskDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v7, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("AVAssetDownloadTask %@ is missing a task description"), v20);
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCAVAssetDownloadManager URLSession:assetDownloadTask:didFinishDownloadingToURL:]";
    v24 = 2080;
    v25 = "FCAVAssetDownloadManager.m";
    v26 = 1024;
    v27 = 201;
    v28 = 2114;
    v29 = v21;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTaskDescription) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v7, "taskDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:]((uint64_t)self, v15, v9, v17, v18);

}

- (void)_completeRequestForAssetID:(void *)a3 withDownloadedURL:(void *)a4 remoteURL:(void *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[7];
  __int128 buf;
  void (*v36)(uint64_t);
  void *v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!a1 || !v9)
    goto LABEL_14;
  if (v12)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2;
    v34[3] = &unk_1E463B228;
    v34[4] = v9;
    v34[5] = v12;
    v34[6] = a1;
    __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2((uint64_t)v34);
    goto LABEL_14;
  }
  v14 = *(id *)(a1 + 8);
  objc_msgSend(v14, "interestTokenForAssetIdentifier:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pathExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("m3u8")) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v11, "pathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("m3u"));

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v11, "pathExtension");
    v17 = v16;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  }
  v20 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "AV asset download succeeded for assetID=%{public}@", (uint8_t *)&buf, 0xCu);
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v10, 0);
  v22 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_44;
  v27[3] = &unk_1E4645720;
  v28 = v9;
  v29 = a1;
  v30 = v10;
  v31 = v11;
  v32 = v16;
  v33 = v15;
  v23 = v15;
  v24 = v16;
  v25 = v27;
  v26 = v25;
  if (v21)
  {
    *(_QWORD *)&buf = v22;
    *((_QWORD *)&buf + 1) = 3221225472;
    v36 = __78__AVURLAsset_FCAdditions__fc_fetchContentKeyIdentifiersWithCompletionHandler___block_invoke;
    v37 = &unk_1E463B790;
    v38 = v21;
    v39 = v25;
    objc_msgSend(v21, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E470C738, &buf);

  }
LABEL_14:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v7 = a5;
    v8 = a4;
    v9 = (objc_class *)objc_opt_class();
    FCCheckedDynamicCast(v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "taskDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v10, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("AVAssetDownloadTask %@ is missing a task description"), v16);
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCAVAssetDownloadManager URLSession:task:didCompleteWithError:]";
      v20 = 2080;
      v21 = "FCAVAssetDownloadManager.m";
      v22 = 1024;
      v23 = 214;
      v24 = 2114;
      v25 = v17;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTaskDescription) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v10, "taskDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:]((uint64_t)self, v12, 0, v14, v7);

  }
}

uint64_t __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset does not have its content in the cache assetID=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

BOOL __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_29(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[2];
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = v3;
  objc_msgSend(v4, "URLWithString:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetKeyForURI:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 == 0;
}

uint64_t __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset does not have all its keys in the cache assetID=%{public}@, missing=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCAVAssetDownload *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  FCAssetDownloadOperation *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  FCAssetDownloadOperation *v28;
  uint64_t v29;
  uint64_t v30;
  FCAssetDownloadOperation *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  FCAVAssetDownload *v36;
  void *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  const void *v45;
  _QWORD *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int8x16_t v50;
  _QWORD v51[4];
  FCAssetDownloadOperation *v52;
  _QWORD v53[4];
  int8x16_t v54;
  id v55;
  _QWORD aBlock[4];
  void *v57;
  _QWORD v58[5];
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2;
    v58[3] = &unk_1E46456A8;
    v58[4] = v5;
    v59 = *(_OWORD *)(a1 + 48);
    v6 = v5;
    __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2((uint64_t)v58);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40) && -[FCAVAsset isHLS](*(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news"));

      if ((v9 & 1) == 0)
      {
        container_query_create();
        container_query_set_class();
        container_query_operation_set_flags();
        container_query_set_persona_unique_string();
        if (container_query_count_results() != 1)
        {
          container_query_get_last_error();
          v10 = (void *)container_error_copy_unlocalized_description();
          v11 = FCAVAssetLog;
          if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v61 = v10;
            _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Failed to create app container for AV asset downloads with error: %s", buf, 0xCu);
          }
          free(v10);
        }
        container_query_free();
      }
      v12 = *(_QWORD **)(a1 + 40);
      if (v12)
        v12 = (_QWORD *)v12[5];
      v13 = v12;
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:", v6, v15, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTaskDescription:", v17);

      v18 = [FCAVAssetDownload alloc];
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v18->super.isa, v19, v16);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E463AB18;
      v57 = v16;
      v23 = v16;
      v24 = _Block_copy(aBlock);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      v27 = v57;
    }
    else
    {
      v28 = [FCAssetDownloadOperation alloc];
      v29 = *(_QWORD *)(a1 + 40);
      if (v29)
        v30 = *(_QWORD *)(v29 + 24);
      else
        v30 = 0;
      v31 = -[FCAssetDownloadOperation initWithNetworkReachability:](v28, "initWithNetworkReachability:", v30);
      objc_msgSend(v6, "URL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCAssetDownloadOperation setURL:](v31, "setURL:", v32);

      -[FCAssetDownloadOperation setDownloadDestination:](v31, "setDownloadDestination:", 0);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCAssetDownloadOperation setLoggingKey:](v31, "setLoggingKey:", v33);

      v34 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_4;
      v53[3] = &unk_1E46456D0;
      v50 = *(int8x16_t *)(a1 + 32);
      v35 = (id)v50.i64[0];
      v54 = vextq_s8(v50, v50, 8uLL);
      v55 = v6;
      -[FCAssetDownloadOperation setFileDownloadCompletionHandler:](v31, "setFileDownloadCompletionHandler:", v53);
      v36 = [FCAVAssetDownload alloc];
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v36->super.isa, v37, v31);
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v38;

      v51[0] = v34;
      v51[1] = 3221225472;
      v51[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_5;
      v51[3] = &unk_1E463AB18;
      v52 = v31;
      v23 = v31;
      v41 = _Block_copy(v51);
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v43 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = v41;

      v27 = (void *)v54.i64[1];
    }

    v44 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v44)
      v44 = (_QWORD *)v44[3];
    v45 = *(const void **)(a1 + 48);
    v46 = v44;
    v47 = _Block_copy(v45);
    objc_msgSend(v46, "fc_safelyAddObject:", v47);

    v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, v49);

  }
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(const void **)(a1 + 40);
  v4 = v2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "fc_safelyAddObject:", v5);

}

uint64_t __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = a4;
  v9 = a2;
  objc_msgSend(v7, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:](v6, v11, v9, v10, v8);

}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOperation:", *(_QWORD *)(a1 + 32));

}

void __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset download failed for assetID=%{public}@ with error=%{public}@", (uint8_t *)&v5, 0x16u);
  }
  -[FCAVAssetDownloadManager _callCompletionHandlersForAssetID:interestToken:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), 0, *(void **)(a1 + 40));
}

- (void)_callCompletionHandlersForAssetID:(void *)a3 interestToken:(void *)a4 error:
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__43;
    v26 = __Block_byref_object_dispose__43;
    v27 = 0;
    v10 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__FCAVAssetDownloadManager__callCompletionHandlersForAssetID_interestToken_error___block_invoke;
    v19[3] = &unk_1E4640120;
    v21 = &v22;
    v20 = v7;
    objc_msgSend(v10, "readWriteWithAccessor:", v19);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = (id)v23[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
      }
      while (v12);
    }

    _Block_object_dispose(&v22, 8);
  }

}

void __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "AV asset download will save assetID=%{public}@ with keyIdentifiers=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    v7 = *(void **)(v6 + 8);
  else
    v7 = 0;
  objc_msgSend(v7, "adoptFileAtURL:forAssetIdentifier:remoteURL:contentKeyIdentifiers:extension:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64));
  -[FCAVAssetDownloadManager _callCompletionHandlersForAssetID:interestToken:error:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 72), 0);

}

void __82__FCAVAssetDownloadManager__callCompletionHandlersForAssetID_interestToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  objc_msgSend(v11, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 24);
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_msgSend(v7, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (id)_restoreBackgroundDownloadsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NFLazy *URLSession;
  NFLazy *v7;
  void *v8;
  id v9;
  FCPseudoOperation *v10;
  FCPseudoOperation *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  FCAVAssetDownloadManager *v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "AV asset download manager will look for background downloads to restore", buf, 2u);
  }
  if (self)
    URLSession = self->_URLSession;
  else
    URLSession = 0;
  v7 = URLSession;
  -[NFLazy value](v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke;
  v16 = &unk_1E4645748;
  v17 = self;

  v18 = v4;
  v9 = v4;
  objc_msgSend(v8, "getAllTasksWithCompletionHandler:", &v13);

  v10 = [FCPseudoOperation alloc];
  v11 = -[FCPseudoOperation initWithCancelBlock:priorityBlock:](v10, "initWithCancelBlock:priorityBlock:", 0, 0, v13, v14, v15, v16, v17);

  return v11;
}

void __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  os_log_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_log_t *)&FCAVAssetLog;
  v5 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v34 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "AV asset download manager found %lu background downloads to restore", buf, 0xCu);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_opt_class();
        if (v13 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "taskDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = *v4;
            if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v16;
              objc_msgSend(v14, "taskDescription");
              v18 = v7;
              v19 = a1;
              v20 = v11;
              v21 = v4;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v34 = (uint64_t)v22;
              _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "AV asset download manager will restore background download for asset ID %{public}@", buf, 0xCu);

              v4 = v21;
              v11 = v20;
              a1 = v19;
              v7 = v18;

            }
            v23 = *(_QWORD *)(a1 + 32);
            if (v23)
              v24 = *(void **)(v23 + 48);
            else
              v24 = 0;
            v26[0] = v11;
            v26[1] = 3221225472;
            v26[2] = __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke_46;
            v26[3] = &unk_1E463AA78;
            v14 = v14;
            v27 = v14;
            objc_msgSend(v24, "readWriteWithAccessor:", v26);

          }
        }
        else
        {
          v14 = 0;
        }

        ++v12;
      }
      while (v9 != v12);
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v9 = v25;
    }
    while (v25);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  FCAVAssetDownload *v4;
  id *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = [FCAVAssetDownload alloc];
  objc_msgSend(*(id *)(a1 + 32), "taskDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v4->super.isa, v7, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "taskDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDownloadsByAssetID, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_restoreBackgroundDownloadsOnce, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_keyCache, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
}

@end
