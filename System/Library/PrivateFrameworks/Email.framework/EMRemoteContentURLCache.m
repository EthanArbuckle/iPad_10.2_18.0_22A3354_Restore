@implementation EMRemoteContentURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EMRemoteContentURLCache _isCanceledResponse:]((uint64_t)self, v8);

  if (!v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)EMRemoteContentURLCache;
    -[NSURLCache storeCachedResponse:forDataTask:](&v10, sel_storeCachedResponse_forDataTask_, v6, v7);
  }

}

- (BOOL)_isCanceledResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v4, "statusCode") == 204
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-apple-canceled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)storeResponseIfNeeded:(id)a3 withData:(id)a4 forDataTask:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  EMRemoteContentURLCache *v18;
  void (**v19)(id, _QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  if (-[EMRemoteContentURLCache _isCanceledResponse:]((uint64_t)self, v10))
  {
    v13[2](v13, 0);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__EMRemoteContentURLCache_storeResponseIfNeeded_withData_forDataTask_completionHandler___block_invoke;
    v14[3] = &unk_1E70F5880;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    v18 = self;
    v19 = v13;
    -[EMRemoteContentURLCache _getCachedResponseForDataTask:ignoreExistingCancelation:completionHandler:](self, v17, 1, v14);

  }
}

void __88__EMRemoteContentURLCache_storeResponseIfNeeded_withData_forDataTask_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92BF8]), "initWithResponse:data:userInfo:storagePolicy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
    v5 = *(_QWORD *)(a1 + 48);
    v7.receiver = *(id *)(a1 + 56);
    v7.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v7, sel_storeCachedResponse_forDataTask_, v4, v5);

  }
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);

}

- (void)_getCachedResponseForDataTask:(char)a3 ignoreExistingCancelation:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __101__EMRemoteContentURLCache__getCachedResponseForDataTask_ignoreExistingCancelation_completionHandler___block_invoke;
    v10[3] = &unk_1E70F58D0;
    v10[4] = a1;
    v13 = a3;
    v11 = v7;
    v12 = v8;
    v9.receiver = a1;
    v9.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v9, sel_getCachedResponseForDataTask_completionHandler_, v11, v10);

  }
}

- (void)storeCancelationIfNeededForDataTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__EMRemoteContentURLCache_storeCancelationIfNeededForDataTask_completionHandler___block_invoke;
  v10[3] = &unk_1E70F58A8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[EMRemoteContentURLCache _getCachedResponseForDataTask:ignoreExistingCancelation:completionHandler:](self, v9, 1, v10);

}

void __81__EMRemoteContentURLCache_storeCancelationIfNeededForDataTask_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (!v4)
    -[EMRemoteContentURLCache _storeCancelationForDataTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v4 == 0);

}

- (void)_storeCancelationForDataTask:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (_storeCancelationForDataTask__onceToken != -1)
      dispatch_once(&_storeCancelationForDataTask__onceToken, &__block_literal_global_41);
    v4 = objc_alloc(MEMORY[0x1E0C92C18]);
    objc_msgSend(v3, "originalRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithURL:statusCode:HTTPVersion:headerFields:", v6, 204, CFSTR("HTTP/1.1"), _storeCancelationForDataTask__sHeaders);

    v8 = objc_alloc(MEMORY[0x1E0C92BF8]);
    v9 = _storeCancelationForDataTask__sEmptyData;
    v14 = CFSTR("LastAccessed");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithResponse:data:userInfo:storagePolicy:", v7, v9, v11, 0);

    v13.receiver = a1;
    v13.super_class = (Class)EMRemoteContentURLCache;
    objc_msgSendSuper2(&v13, sel_storeCachedResponse_forDataTask_, v12, v3);

  }
}

- (void)getCachedResponseForDataTask:(id)a3 completionHandler:(id)a4
{
  -[EMRemoteContentURLCache _getCachedResponseForDataTask:ignoreExistingCancelation:completionHandler:](self, a3, 0, a4);
}

void __101__EMRemoteContentURLCache__getCachedResponseForDataTask_ignoreExistingCancelation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EMRemoteContentURLCache _isCanceledResponse:](*(_QWORD *)(a1 + 32), v3))
  {
    objc_msgSend(v6, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastAccessed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 56) || (objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 300.0) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeCachedResponseForDataTask:", *(_QWORD *)(a1 + 40));

      v6 = 0;
    }
    else
    {
      -[EMRemoteContentURLCache _storeCancelationForDataTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __56__EMRemoteContentURLCache__storeCancelationForDataTask___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  v1 = (void *)_storeCancelationForDataTask__sEmptyData;
  _storeCancelationForDataTask__sEmptyData = (uint64_t)v0;

  v4 = CFSTR("x-apple-canceled");
  v5[0] = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_storeCancelationForDataTask__sHeaders;
  _storeCancelationForDataTask__sHeaders = v2;

}

@end
