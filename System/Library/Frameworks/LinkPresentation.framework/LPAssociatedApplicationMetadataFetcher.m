@implementation LPAssociatedApplicationMetadataFetcher

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSURL *URL;
  void *v11;
  void *v12;
  id completionHandler;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  LPAssociatedApplicationMetadataFetcher *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rootEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childWithType:subtitle:", 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFetcher set_event:](self, "set_event:", v9);

  URL = self->_URL;
  -[LPFetcher _event](self, "_event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setURL:", URL);

  v12 = _Block_copy(v7);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v12;

  v14 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = -[LPFetcher _loggingID](self, "_loggingID");
    _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: retrieving URL", buf, 8u);
  }

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v15 = (void *)getCPSClipURLClass_softClass;
  v28 = getCPSClipURLClass_softClass;
  if (!getCPSClipURLClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __getCPSClipURLClass_block_invoke;
    v32 = &unk_1E44A7DB0;
    v33 = &v25;
    __getCPSClipURLClass_block_invoke((uint64_t)buf);
    v15 = (void *)v26[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v25, 8);
  if ((objc_msgSend(v16, "isSupported") & 1) != 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v17 = (void *)getCPSClipMetadataRequestClass_softClass;
    v28 = getCPSClipMetadataRequestClass_softClass;
    v18 = MEMORY[0x1E0C809B0];
    if (!getCPSClipMetadataRequestClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __getCPSClipMetadataRequestClass_block_invoke;
      v32 = &unk_1E44A7DB0;
      v33 = &v25;
      __getCPSClipMetadataRequestClass_block_invoke((uint64_t)buf);
      v17 = (void *)v26[3];
    }
    v19 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v25, 8);
    v20 = (void *)objc_msgSend([v19 alloc], "initWithURL:fallbackClipBundleID:", self->_URL, self->_bundleIdentifier);
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v22[3] = &unk_1E44A83D8;
    v23 = v20;
    v24 = self;
    v21 = v20;
    objc_msgSend(v21, "requestMetadataWithCompletion:", v22);

  }
  else
  {
    -[LPAssociatedApplicationMetadataFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
  }

}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
    v8[3] = &unk_1E44A83B0;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v6, "requestDownloadedIconWithMetadata:completion:", v11, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedWithErrorCode:underlyingError:", 2, 0);
  }

}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_3;
  v8[3] = &unk_1E44A8388;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __83__LPAssociatedApplicationMetadataFetcher_fetchWithConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_completedWithClipMetadata:iconURL:error:", v2, v3, 0);

}

- (void)cancel
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_completionHandler)
  {
    v3 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[LPFetcher _loggingID](self, "_loggingID");
      _os_log_impl(&dword_1A0C41000, v3, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: cancelling subresource load explicitly", (uint8_t *)v4, 8u);
    }

    -[LPAssociatedApplicationMetadataFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 3, 0);
  }
}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_completionHandler)
  {
    if (a3 != 3)
    {
      v7 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109379;
        v9[1] = -[LPFetcher _loggingID](self, "_loggingID");
        v10 = 2117;
        v11 = v6;
        _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: failed to retrieve URL: %{sensitive}@", (uint8_t *)v9, 0x12u);
      }

    }
    makeLPError(a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadataFetcher _completedWithClipMetadata:iconURL:error:](self, "_completedWithClipMetadata:iconURL:error:", 0, 0, v8);

  }
}

- (void)_completedWithClipMetadata:(id)a3 iconURL:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id completionHandler;
  void *v12;
  id v13;
  NSObject *v14;
  LPFetcherClipMetadataResponse *v15;
  void *v16;
  LPFetcherClipMetadataResponse *v17;
  id v18;
  _QWORD v19[4];
  LPFetcherClipMetadataResponse *v20;
  id v21;
  uint8_t buf[4];
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v12 = _Block_copy(completionHandler);
    v13 = self->_completionHandler;
    self->_completionHandler = 0;

    if (!v8)
      goto LABEL_6;
    v14 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = -[LPFetcher _loggingID](self, "_loggingID");
      _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPAssociatedApplicationMetadataFetcher<%d>: successfully retrieved metadata", buf, 8u);
    }

    v15 = -[LPFetcherClipMetadataResponse initWithClipMetadata:iconURL:fetcher:]([LPFetcherClipMetadataResponse alloc], "initWithClipMetadata:iconURL:fetcher:", v8, v9, self);
    if (!v15)
LABEL_6:
      v15 = -[LPFetcherErrorResponse initWithError:fetcher:]([LPFetcherErrorResponse alloc], "initWithError:fetcher:", v10, self);
    -[LPFetcher _event](self, "_event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didCompleteWithErrorCode:", objc_msgSend(v10, "code"));

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__LPAssociatedApplicationMetadataFetcher__completedWithClipMetadata_iconURL_error___block_invoke;
    v19[3] = &unk_1E44A7E78;
    v20 = v15;
    v21 = v12;
    v17 = v15;
    v18 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

uint64_t __83__LPAssociatedApplicationMetadataFetcher__completedWithClipMetadata_iconURL_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
