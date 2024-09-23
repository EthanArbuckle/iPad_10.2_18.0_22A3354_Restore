@implementation SFDownloadFile

- (SFDownloadFile)initWithURL:(id)a3
{
  return -[SFDownloadFile initWithURL:bookmarkData:](self, "initWithURL:bookmarkData:", a3, 0);
}

- (SFDownloadFile)initWithBookmarkData:(id)a3
{
  return -[SFDownloadFile initWithURL:bookmarkData:](self, "initWithURL:bookmarkData:", 0, a3);
}

- (SFDownloadFile)initWithURL:(id)a3 bookmarkData:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  SFDownloadFile *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *queue;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id location;
  objc_super v27;
  id v28;
  id v29;

  v6 = (uint64_t)a3;
  v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    v8 = 0;
    v6 = 0;
    goto LABEL_6;
  }
  v8 = (void *)v7;
  if (!v6)
  {
    LOBYTE(location) = 0;
    v29 = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v7, 0, 0, &location, &v29);
    v11 = v29;
    if (v11 || (_BYTE)location)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SFDownloadFile initWithURL:bookmarkData:].cold.2(v15, v11);
      objc_msgSend((id)v6, "stopAccessingSecurityScopedResource");

      goto LABEL_6;
    }
    getpid();
    v6 = (uint64_t)objc_retainAutorelease((id)v6);
    v23 = objc_msgSend((id)v6, "fileSystemRepresentation");
    if (sandbox_check())
      LOBYTE(v9) = objc_msgSend((id)v6, "startAccessingSecurityScopedResource", v23);
    else
      LOBYTE(v9) = 1;
    goto LABEL_20;
  }
  if (v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_20;
  }
  v9 = objc_msgSend((id)v6, "startAccessingSecurityScopedResource");
  v28 = 0;
  objc_msgSend((id)v6, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;
  if (v12)
  {
    v13 = v12;
    v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SFDownloadFile initWithURL:bookmarkData:].cold.1(v14, v13);
      if (!v9)
        goto LABEL_15;
    }
    else if (!v9)
    {
LABEL_15:

      goto LABEL_6;
    }
    objc_msgSend((id)v6, "stopAccessingSecurityScopedResource");
    goto LABEL_15;
  }
LABEL_20:
  v27.receiver = self;
  v27.super_class = (Class)SFDownloadFile;
  self = -[SFDownloadFile init](&v27, sel_init, v23);
  if (self)
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_URL, (id)v6);
    objc_storeStrong((id *)&self->_bookmarkData, v8);
    self->_usingSecurityScopedURL = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SFDownloadFile.%p"), self);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (OS_dispatch_queue *)dispatch_queue_create(v17, v19);
    queue = self->_queue;
    self->_queue = v20;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SFDownloadFile_initWithURL_bookmarkData___block_invoke;
    block[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v25, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    self = self;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    v10 = self;
    goto LABEL_22;
  }
LABEL_6:
  v10 = 0;
LABEL_22:

  return v10;
}

void __43__SFDownloadFile_initWithURL_bookmarkData___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  _BYTE *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "applicationState");

    if (v3 == 2)
      v5[10] = 1;
    else
      objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v5, sel__suspend, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v5, sel__startResuming, *MEMORY[0x1E0DC4860], 0);

    WeakRetained = v5;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SFDownloadFile invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFDownloadFile;
  -[SFDownloadFile dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  if (!self->_invalidated)
  {
    if (!self->_suspended)
      objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    self->_invalidated = 1;
    if (self->_usingSecurityScopedURL)
      -[NSURL stopAccessingSecurityScopedResource](self->_URL, "stopAccessingSecurityScopedResource");
  }
}

- (void)_suspend
{
  void *v2;
  SFDownloadFile *v3;

  if (!self->_invalidated)
  {
    if (self->_hasPendingResume)
    {
      self->_hasPendingResume = 0;
    }
    else
    {
      self->_suspended = 1;
      v2 = (void *)MEMORY[0x1E0CB3600];
      v3 = self;
      objc_msgSend(v2, "removeFilePresenter:", v3);

    }
  }
}

- (void)_startResuming
{
  NSData *v3;
  NSURL *v4;
  NSObject *queue;
  NSURL *v6;
  NSData *v7;
  _QWORD v8[4];
  NSData *v9;
  NSURL *v10;
  id v11;
  id location;

  if (!self->_invalidated && !self->_hasPendingResume)
  {
    self->_hasPendingResume = 1;
    v3 = self->_bookmarkData;
    v4 = self->_URL;
    objc_initWeak(&location, self);
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__SFDownloadFile__startResuming__block_invoke;
    v8[3] = &unk_1E4AC7198;
    v9 = v3;
    v10 = v4;
    v6 = v4;
    v7 = v3;
    objc_copyWeak(&v11, &location);
    dispatch_async(queue, v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
}

void __32__SFDownloadFile__startResuming__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  v3 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v4 = (void *)objc_msgSend(v2, "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v3, 0, 0, 0, &v15);
  v5 = v15;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = v6;
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740227;
      v17 = v7;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEFAULT, "Could not resolve bookmark previously at %{sensitive}@; %{public}@",
        buf,
        0x16u);

    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__SFDownloadFile__startResuming__block_invoke_13;
  v11[3] = &unk_1E4AC07A8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v12 = v4;
  v13 = *(id *)(a1 + 40);
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
}

void __32__SFDownloadFile__startResuming__block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_resumeWithCurrentURL:previousURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_resumeWithCurrentURL:(id)a3 previousURL:(id)a4
{
  id v7;
  id WeakRetained;
  NSURL *URL;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!self->_invalidated && self->_hasPendingResume)
  {
    *(_WORD *)&self->_suspended = 0;
    objc_storeStrong((id *)&self->_URL, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    URL = self->_URL;
    if (URL)
    {
      if ((-[NSURL isEqual:](URL, "isEqual:", v7) & 1) == 0)
        objc_msgSend(WeakRetained, "downloadFileDidChangeURL:", self);
    }
    else
    {
      objc_msgSend(WeakRetained, "downloadFileWillBeDeleted:", self);
    }
    if (!self->_invalidated)
      objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", self);

  }
}

- (NSURL)presentedItemURL
{
  return self->_URL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id WeakRetained;

  objc_storeStrong((id *)&self->_URL, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "downloadFileDidChangeURL:", self);

}

- (void)presentedItemDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "downloadFileContentsDidChange:", self);

}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  SFDownloadFileDelegate **p_delegate;
  id WeakRetained;
  void (**v6)(id, _QWORD);

  p_delegate = &self->_delegate;
  v6 = (void (**)(id, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "downloadFileWillBeDeleted:", self);

  v6[2](v6, 0);
}

- (SFDownloadFileDelegate)delegate
{
  return (SFDownloadFileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithURL:(void *)a1 bookmarkData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed to create bookmark data for download file: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWithURL:(void *)a1 bookmarkData:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed to resolve download file bookmark data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

@end
