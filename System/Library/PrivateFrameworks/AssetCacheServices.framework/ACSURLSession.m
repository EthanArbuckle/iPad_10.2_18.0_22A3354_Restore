@implementation ACSURLSession

+ (ACSURLSession)sharedSession
{
  if (sharedSession_once != -1)
    dispatch_once(&sharedSession_once, &__block_literal_global);
  return (ACSURLSession *)(id)sharedSession_sharedSession;
}

uint64_t __30__ACSURLSession_sharedSession__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACSURLSession sessionWithConfiguration:canUseCachingServer:locateOptions:](ACSURLSession, "sessionWithConfiguration:canUseCachingServer:locateOptions:", v0, 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v1;

  return objc_msgSend((id)sharedSession_sharedSession, "set_phase:", 3);
}

+ (ACSURLSession)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5
{
  return +[ACSURLSession sessionWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:](ACSURLSession, "sessionWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:", a3, a4, a5, 0, 0);
}

+ (ACSURLSession)sessionWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  ACSURLSession *v15;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = -[ACSURLSession initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:]([ACSURLSession alloc], "initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:", v14, v9, v13, v12, v11);

  return v15;
}

- (NSURLSessionConfiguration)configuration
{
  void *v2;
  void *v3;

  -[ACSURLSession _nsurlSession](self, "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURLSessionConfiguration *)v3;
}

- (NSDictionary)locateOptions
{
  void *v2;
  void *v3;

  -[ACSURLSession _locateOptions](self, "_locateOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSString)sessionDescription
{
  void *v2;
  void *v3;

  -[ACSURLSession _nsurlSession](self, "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSessionDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACSURLSession _nsurlSession](self, "_nsurlSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionDescription:", v4);

}

- (void)finishTasksAndInvalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[ACSURLSession _queue](self, "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ACSURLSession_finishTasksAndInvalidate__block_invoke;
  block[3] = &unk_1E9877420;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__ACSURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend(*(id *)(a1 + 32), "canUseCachingServer")
    || !objc_msgSend(*(id *)(a1 + 32), "_phase")
    && (objc_msgSend(*(id *)(a1 + 32), "_tasks"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        !v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishTasksAndInvalidate");

    v6 = 2;
    return objc_msgSend(*(id *)(a1 + 32), "set_phase:", v6);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_phase");
  if (!(_DWORD)result)
  {
    v6 = 1;
    return objc_msgSend(*(id *)(a1 + 32), "set_phase:", v6);
  }
  return result;
}

- (void)invalidateAndCancel
{
  NSObject *v3;
  _QWORD block[5];

  -[ACSURLSession _queue](self, "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ACSURLSession_invalidateAndCancel__block_invoke;
  block[3] = &unk_1E9877420;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __36__ACSURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "canUseCachingServer")
    && (objc_msgSend(*(id *)(a1 + 32), "_phase")
     || (objc_msgSend(*(id *)(a1 + 32), "_tasks"),
         v2 = (void *)objc_claimAutoreleasedReturnValue(),
         v3 = objc_msgSend(v2, "count"),
         v2,
         v3)))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_phase")
      || (result = objc_msgSend(*(id *)(a1 + 32), "_phase"), (_DWORD)result == 1))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "cancel");
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidateAndCancel");

      return objc_msgSend(*(id *)(a1 + 32), "set_phase:", 2);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateAndCancel");

    return objc_msgSend(*(id *)(a1 + 32), "set_phase:", 2);
  }
  return result;
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ACSURLSession_resetWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9877448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__ACSURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ACSURLSession_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9877448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__ACSURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)getTasksWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9877448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v12 = v4;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v3;
          else
            v12 = v2;
        }
        objc_msgSend(v12, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(v18 + 32), "_clientDelegateOpQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E9877470;
  v14 = *(id *)(v18 + 40);
  v20 = v2;
  v21 = v3;
  v22 = v4;
  v23 = v14;
  v15 = v4;
  v16 = v3;
  v17 = v2;
  objc_msgSend(v13, "addOperationWithBlock:", v19);

}

uint64_t __47__ACSURLSession_getTasksWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9877448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_onqueue_uniqueTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E9877498;
  v4 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "addOperationWithBlock:", v6);

}

uint64_t __50__ACSURLSession_getAllTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)dataTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  ACSURLSessionDataTask *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ACSURLSession_dataTaskWithRequest___block_invoke;
  v8[3] = &unk_1E98774C0;
  v8[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D82671C4](v8);
  v6 = -[ACSURLSessionDataTask initWithNSURLDataTaskCreator:initialRequest:forSession:]([ACSURLSessionDataTask alloc], "initWithNSURLDataTaskCreator:initialRequest:forSession:", v5, v4, self);

  -[ACSURLSession _addTask:](self, "_addTask:", v6);
  return v6;
}

id __37__ACSURLSession_dataTaskWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTaskWithRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataTaskWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession dataTaskWithRequest:](self, "dataTaskWithRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  ACSURLSessionUploadTask *v10;
  ACSURLSessionUploadTask *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  ACSURLSession *v17;
  id v18;

  v6 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __48__ACSURLSession_uploadTaskWithRequest_fromFile___block_invoke;
  v16 = &unk_1E98774E8;
  v17 = self;
  v18 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D82671C4](&v13);
  v10 = [ACSURLSessionUploadTask alloc];
  v11 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:](v10, "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v9, v8, self, v13, v14, v15, v16, v17);

  -[ACSURLSession _addTask:](self, "_addTask:", v11);
  return v11;
}

id __48__ACSURLSession_uploadTaskWithRequest_fromFile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadTaskWithRequest:fromFile:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  ACSURLSessionUploadTask *v10;
  ACSURLSessionUploadTask *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  ACSURLSession *v17;
  id v18;

  v6 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __48__ACSURLSession_uploadTaskWithRequest_fromData___block_invoke;
  v16 = &unk_1E98774E8;
  v17 = self;
  v18 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D82671C4](&v13);
  v10 = [ACSURLSessionUploadTask alloc];
  v11 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:](v10, "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v9, v8, self, v13, v14, v15, v16, v17);

  -[ACSURLSession _addTask:](self, "_addTask:", v11);
  return v11;
}

id __48__ACSURLSession_uploadTaskWithRequest_fromData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadTaskWithRequest:fromData:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  id v4;
  void *v5;
  ACSURLSessionUploadTask *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__ACSURLSession_uploadTaskWithStreamedRequest___block_invoke;
  v8[3] = &unk_1E9877510;
  v8[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D82671C4](v8);
  v6 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:]([ACSURLSessionUploadTask alloc], "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v5, v4, self);

  -[ACSURLSession _addTask:](self, "_addTask:", v6);
  return v6;
}

id __47__ACSURLSession_uploadTaskWithStreamedRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadTaskWithStreamedRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)downloadTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  ACSURLSessionDownloadTask *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__ACSURLSession_downloadTaskWithRequest___block_invoke;
  v8[3] = &unk_1E9877538;
  v8[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D82671C4](v8);
  v6 = -[ACSURLSessionDownloadTask initWithNSURLDownloadTaskCreator:initialRequest:forSession:]([ACSURLSessionDownloadTask alloc], "initWithNSURLDownloadTaskCreator:initialRequest:forSession:", v5, v4, self);

  -[ACSURLSession _addTask:](self, "_addTask:", v6);
  return v6;
}

id __41__ACSURLSession_downloadTaskWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadTaskWithRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)downloadTaskWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession downloadTaskWithRequest:](self, "downloadTaskWithRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)downloadTaskWithResumeData:(id)a3
{
  return -[ACSURLSession _downloadTaskWithResumeData:completionHandler:](self, "_downloadTaskWithResumeData:completionHandler:", a3, 0);
}

- (ACSURLSession)initWithConfiguration:(id)a3 canUseCachingServer:(BOOL)a4 locateOptions:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  _BOOL8 v10;
  id v12;
  const __CFDictionary *v13;
  id v14;
  id v15;
  void *v16;
  ACSURLSession *v17;
  ACSURLSession *v18;
  os_log_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  id v33;
  objc_super v34;
  const __CFString *v35;
  ACSURLSession *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v10 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (const __CFDictionary *)a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v37 = CFSTR("session");
    v38[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("ACSURLSession does not support background sessions");
    goto LABEL_13;
  }
  if (v15 && objc_msgSend(v15, "maxConcurrentOperationCount") != 1)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v35 = CFSTR("session");
    v36 = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("Cannot create an ACSURLSession with a concurrent delegate queue; set its maxConcurrentOperationCount to 1 or use the main queue");
LABEL_13:
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v32, v31);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v33);
  }
  if (v10)
    ACSLocateCachingServer((const void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://www.apple.com/")), v13, 0, 0, 30.0);
  v34.receiver = self;
  v34.super_class = (Class)ACSURLSession;
  v17 = -[ACSURLSession init](&v34, sel_init);
  v18 = v17;
  if (v17)
  {
    -[ACSURLSession setCanUseCachingServer:](v17, "setCanUseCachingServer:", v10);
    v19 = os_log_create("com.apple.AssetCacheServices", "URLSession");
    -[ACSURLSession set_logHandle:](v18, "set_logHandle:", v19);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("ACSURLSession queue", v20);
    -[ACSURLSession set_queue:](v18, "set_queue:", v21);

    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v12, v18, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSession set_nsurlSession:](v18, "set_nsurlSession:", v22);

    v23 = (void *)-[__CFDictionary copy](v13, "copy");
    -[ACSURLSession set_locateOptions:](v18, "set_locateOptions:", v23);

    -[ACSURLSession set_clientDelegate:](v18, "set_clientDelegate:", v14);
    -[ACSURLSession _nsurlSession](v18, "_nsurlSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delegateQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSession set_clientDelegateOpQueue:](v18, "set_clientDelegateOpQueue:", v25);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSession set_tasks:](v18, "set_tasks:", v26);

  }
  -[ACSURLSession _logHandle](v18, "_logHandle");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[ACSURLSession initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:].cold.1();

  return v18;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, v0, v1, "dealloc session %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  -[ACSURLSession _tasks](self, "_tasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[ACSURLSession _tasks](self, "_tasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  v6 = -[ACSURLSession _phase](self, "_phase");
  if (v6 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown phase %d"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E9877BF8[(int)v6];
  }
  v8 = (void *)MEMORY[0x1E0CB37A0];
  v18.receiver = self;
  v18.super_class = (Class)ACSURLSession;
  -[ACSURLSession description](&v18, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACSURLSession canUseCachingServer](self, "canUseCachingServer");
  -[ACSURLSession _nsurlSession](self, "_nsurlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession _clientDelegate](self, "_clientDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ { canUseCachingServer: %d, phase: %@, session: %@, delegate: %p, tasks: ("), v9, v10, v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __28__ACSURLSession_description__block_invoke;
  v16[3] = &unk_1E9877560;
  v14 = v13;
  v17 = v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(v14, "appendString:", CFSTR(") }"));

  return (NSString *)v14;
}

void __28__ACSURLSession_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%p"), v5);

}

- (id)_keyForNSURLTask:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "taskIdentifier");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %lu"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_addTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__ACSURLSession__addTask___block_invoke;
  v7[3] = &unk_1E9877588;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __26__ACSURLSession__addTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_phase") == 1
    || objc_msgSend(*(id *)(a1 + 32), "_phase") == 2)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    v12[0] = CFSTR("session");
    v12[1] = CFSTR("task");
    v8 = *(_QWORD *)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 32);
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("Cannot create a task in an ACSURLSession that has been invalidated"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "_nsurlTaskToOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onqueue_addTask:forNSURLTask:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "_nsurlTaskToCachingServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_addTask:forNSURLTask:", *(_QWORD *)(a1 + 40), v5);
    v5 = v11;
  }

}

- (void)_onqueue_addTask:(id)a3 forNSURLTask:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  ACSURLSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[ACSURLSession _queue](self, "_queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ACSURLSession _keyForNSURLTask:](self, "_keyForNSURLTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession _logHandle](self, "_logHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "descriptionWithAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v7;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v11, OS_LOG_TYPE_DEBUG, "add task %@ for nsurlTask %@ self=%@", buf, 0x20u);

  }
  -[ACSURLSession _tasks](self, "_tasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  -[ACSURLSession _tasks](self, "_tasks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSession _tasks](self, "_tasks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionWithAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACSURLSession.m"), 364, CFSTR("ACSURLSession %@ clobbering ACSURLSessionTask %@ with %@ for NSURLSessionTask %@"), self, v20, v7, v21);

  }
  -[ACSURLSession _tasks](self, "_tasks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v10);

  objc_sync_exit(v12);
}

- (void)_removeTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACSURLSession *v9;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__ACSURLSession__removeTask___block_invoke;
  v7[3] = &unk_1E9877588;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __29__ACSURLSession__removeTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToOrigin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToOrigin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_onqueue_removeTaskForNSURLTask:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToOrigin:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToCachingServer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onqueue_removeTaskForNSURLTask:", v8);
    objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_phase") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_tasks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_nsurlSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishTasksAndInvalidate");

      objc_msgSend(*(id *)(a1 + 40), "set_phase:", 2);
    }
  }

}

- (void)_onqueue_removeTaskForNSURLTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  ACSURLSession *v13;
  void *v14;
  ACSURLSession *v15;
  void *v16;
  int v17;
  ACSURLSession *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  ACSURLSession *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ACSURLSession _keyForNSURLTask:](self, "_keyForNSURLTask:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession _tasks](self, "_tasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[ACSURLSession _logHandle](self, "_logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[ACSURLSession _tasks](self, "_tasks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (ACSURLSession *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionWithAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v6;
    _os_log_debug_impl(&dword_1D4CDC000, v8, OS_LOG_TYPE_DEBUG, "remove task %@ for nsurlTask %@ self=%@ key=%@", (uint8_t *)&v17, 0x2Au);

  }
  -[ACSURLSession _tasks](self, "_tasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "descriptionWithAddress");
      v13 = (ACSURLSession *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = self;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEFAULT, "ACSURLSession %@ missing ACSURLSessionTask for NSURLSessionTask %@; this is normal if the task was canceled. task %@",
        (uint8_t *)&v17,
        0x20u);

    }
  }
  else
  {
    -[ACSURLSession _tasks](self, "_tasks");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", v6);
  }

  objc_sync_exit(v7);
}

- (id)_onqueue_taskForNSURLTask:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  ACSURLSession *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[ACSURLSession _keyForNSURLTask:](self, "_keyForNSURLTask:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession _tasks](self, "_tasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[ACSURLSession _tasks](self, "_tasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (v10)
  {
    objc_msgSend(v10, "_nsurlTaskToOrigin");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_nsurlTaskToCachingServer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 != v5 && (id)v12 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptionWithAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "descriptionWithAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACSURLSession.m"), 429, CFSTR("ACSURLSession %@ task %@ != expected %@ or %@"), self, v5, v18, v19);

    }
    v14 = v10;

  }
  else
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEFAULT, "ACSURLSession %@ missing ACSURLSessionTask for NSURLSessionTask %@; this is normal if the task was canceled",
        buf,
        0x16u);
    }

  }
  return v10;
}

- (id)_onqueue_uniqueTasks
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ACSURLSession _queue](self, "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACSURLSession _tasks](self, "_tasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[ACSURLSession _tasks](self, "_tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v13, (_QWORD)v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v13);
          objc_msgSend(v8, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_locateCachingServerForURL:(id)a3 isUpload:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v5 = a4;
  v9 = a5;
  v10 = a3;
  if (!-[ACSURLSession canUseCachingServer](self, "canUseCachingServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACSURLSession.m"), 457, CFSTR("ACSURLSession %@ invalid use of %@"), self, v19);

  }
  -[ACSURLSession _locateOptions](self, "_locateOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
  {
    v13 = objc_msgSend(v11, "mutableCopy");

    v12 = (void *)v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("capabilities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("capabilities"));
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], CFSTR("import"));

  }
  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__ACSURLSession__locateCachingServerForURL_isUpload_completionHandler___block_invoke;
  v20[3] = &unk_1E98775B0;
  v21 = v9;
  v17 = v9;
  ACSLocateCachingServer(v10, (const __CFDictionary *)v12, v16, (uint64_t)v20, 30.0);

}

uint64_t __71__ACSURLSession__locateCachingServerForURL_isUpload_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onqueue_task:(id)a3 willUseCachingServer:(BOOL)a4 newRequest:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  ACSURLSession *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[ACSURLSession _clientDelegate](self, "_clientDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession _clientDelegateOpQueue](self, "_clientDelegateOpQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E9877600;
    v17 = v14;
    v18 = self;
    v19 = v10;
    v22 = a4;
    v20 = v11;
    v21 = v12;
    objc_msgSend(v15, "addOperationWithBlock:", v16);

  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v11);
  }

}

void __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E98775D8;
  v6[4] = v2;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v1, "URLSession:task:willUseCachingServer:newRequest:completionHandler:", v2, v4, v3, v5, v6);

}

void __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_3;
  v7[3] = &unk_1E9877498;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __81__ACSURLSession__onqueue_task_willUseCachingServer_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_cancelTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  ACSURLSession *v10;

  v4 = a3;
  if (-[ACSURLSession canUseCachingServer](self, "canUseCachingServer"))
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ACSURLSession _cancelTask:].cold.1();

    -[ACSURLSession _queue](self, "_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__ACSURLSession__cancelTask___block_invoke;
    v8[3] = &unk_1E9877588;
    v9 = v4;
    v10 = self;
    dispatch_async(v6, v8);

  }
  else
  {
    objc_msgSend(v4, "_nsurlTaskToOrigin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
}

void __29__ACSURLSession__cancelTask___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "_internalState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __29__ACSURLSession__cancelTask___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
  else
  {
    objc_msgSend(*v2, "_nsurlTaskToCachingServer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && objc_msgSend(*v2, "_tryCachingServer"))
    {
      objc_msgSend(*v2, "set_failBackToOrigin:", 0);
      objc_msgSend(v11, "cancel");
    }
    else
    {
      objc_msgSend(*v2, "_nsurlTaskToOrigin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancel");

    }
  }
}

- (void)_cancelDownloadTask:(id)a3 byProducingResumeData:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  ACSURLSession *v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke;
  v25[3] = &unk_1E9877628;
  v25[4] = self;
  v10 = v7;
  v26 = v10;
  v11 = v8;
  v27 = v11;
  v12 = (void *)MEMORY[0x1D82671C4](v25);
  if (-[ACSURLSession canUseCachingServer](self, "canUseCachingServer"))
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ACSURLSession _cancelDownloadTask:byProducingResumeData:].cold.2();

    if (objc_msgSend(v10, "_internalState") == 2)
    {
      -[ACSURLSession _logHandle](self, "_logHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ACSURLSession _cancelDownloadTask:byProducingResumeData:].cold.1();

      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }
    -[ACSURLSession _queue](self, "_queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_93;
    block[3] = &unk_1E9877650;
    v24 = a2;
    v20 = v10;
    v21 = self;
    v22 = v12;
    v23 = v11;
    dispatch_async(v15, block);

    v16 = v20;
  }
  else
  {
    objc_msgSend(v10, "_nsurlTaskToOrigin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "descriptionWithAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACSURLSession.m"), 540, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), self, v10, v18, CFSTR("NSURLSessionDownloadTask"));

    }
    objc_msgSend(v16, "cancelByProducingResumeData:", v12);
  }

}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v4, "_resumeDataWithNSURLResumeData:originalRequest:currentRequest:error:", v3, v5, v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    if (v7)
      goto LABEL_8;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Invalid resume data from NSURL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 1, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "_logHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_cold_1();

  v7 = 0;
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_93(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToCachingServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(*(id *)(a1 + 32), "_tryCachingServer"))
  {
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v2, "descriptionWithAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("ACSURLSession.m"), 557, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v11, v12, v13, CFSTR("NSURLSessionDownloadTask"));

    }
    objc_msgSend(v2, "cancelByProducingResumeData:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToOrigin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "cancelByProducingResumeData:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_logHandle");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v3, "descriptionWithAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = CFSTR("NSURLSessionDownloadTask");
        _os_log_fault_impl(&dword_1D4CDC000, v4, OS_LOG_TYPE_FAULT, "ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 40), "_logHandle");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CDC000, v5, OS_LOG_TYPE_DEFAULT, "ACSURLSessionDownloadTask _cancelDownloadTask:byProducingResumeData: completing with nil", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

- (id)_downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4
{
  id *v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD *v14;
  id v15;
  void *v16;
  ACSURLSessionDownloadTask *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ACSURLSessionDownloadTask *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[4];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[2];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  v50 = 0;
  v33 = v6;
  v8 = -[ACSURLSession _resumeData:toNSURLResumeData:originalRequest:currentRequest:error:](self, "_resumeData:toNSURLResumeData:originalRequest:currentRequest:error:", v6, &v52, &v51, &v50, &v49);
  v9 = v52;
  v35 = v51;
  v10 = v50;
  v34 = v49;
  if (!v8)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v53[0] = CFSTR("session");
    v53[1] = CFSTR("error");
    v54[0] = self;
    v54[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid resume data"), v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v28);
  }
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("source=")) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "containsString:", CFSTR("&source="));
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  if (v7)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_2;
    v36[3] = &unk_1E98776F0;
    v14 = v36;
    v39[1] = &v43;
    v36[4] = self;
    v30 = (id *)v39;
    v39[0] = v7;
    v31 = &v37;
    v37 = v10;
    v6 = (id *)&v38;
  }
  else
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke;
    v40[3] = &unk_1E9877678;
    v14 = v40;
    v29 = (id *)v41;
    v41[0] = v10;
    v41[1] = self;
    v32 = (id *)&v42;
  }
  v15 = v9;
  v14[6] = v15;
  v16 = (void *)MEMORY[0x1D82671C4](v14);
  if (v13)
  {
    v17 = -[ACSURLSessionDownloadTask initWithNSURLDownloadTaskCreator:initialRequest:forSession:]([ACSURLSessionDownloadTask alloc], "initWithNSURLDownloadTaskCreator:initialRequest:forSession:", v16, v35, self);
    v18 = (void *)v44[5];
    v44[5] = (uint64_t)v17;

    objc_msgSend((id)v44[5], "_nsurlTaskForRequest:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v44[5], "set_nsurlTaskToCachingServer:", v19);
    objc_msgSend((id)v44[5], "_nsurlTaskToOrigin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v44[5], "_nsurlTaskToCachingServer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSession _copyAttributesFromNSURLTask:toNSURLTask:](self, "_copyAttributesFromNSURLTask:toNSURLTask:", v20, v21);

  }
  else
  {
    v22 = -[ACSURLSessionDownloadTask initWithNSURLDownloadTaskCreator:initialRequest:forSession:]([ACSURLSessionDownloadTask alloc], "initWithNSURLDownloadTaskCreator:initialRequest:forSession:", v16, v10, self);
    v23 = (void *)v44[5];
    v44[5] = (uint64_t)v22;

    objc_msgSend((id)v44[5], "set_resumedOriginalRequest:", v35);
    objc_msgSend((id)v44[5], "set_tryCachingServer:", 0);
  }
  objc_msgSend((id)v44[5], "set_suspended:", 1);
  -[ACSURLSession _addTask:](self, "_addTask:", v44[5]);
  v24 = (id)v44[5];

  if (v7)
  {

  }
  else
  {

  }
  _Block_object_dispose(&v43, 8);

  return v24;
}

id __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == v3)
    objc_msgSend(v5, "downloadTaskWithResumeData:", *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v5, "downloadTaskWithRequest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;

  v3 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_3;
  v12[3] = &unk_1E98776C8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 56);
  v4 = (id)v11;
  v13 = v11;
  v5 = (void *)MEMORY[0x1D82671C4](v12);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == v3)
    objc_msgSend(v7, "downloadTaskWithResumeData:completionHandler:", *(_QWORD *)(a1 + 48), v5);
  else
    objc_msgSend(v7, "downloadTaskWithRequest:completionHandler:", v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_4;
    v12[3] = &unk_1E98776A0;
    v9 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "_downloadTask:completedWithLocation:response:error:completionHandler:", v4, a2, a3, a4, v12);

  }
}

uint64_t __63__ACSURLSession__downloadTaskWithResumeData_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_internalState:", 2);
}

- (void)_suspendTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  ACSURLSession *v10;

  v4 = a3;
  if (-[ACSURLSession canUseCachingServer](self, "canUseCachingServer"))
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ACSURLSession _suspendTask:].cold.1();

    -[ACSURLSession _queue](self, "_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__ACSURLSession__suspendTask___block_invoke;
    v8[3] = &unk_1E9877588;
    v9 = v4;
    v10 = self;
    dispatch_async(v6, v8);

  }
  else
  {
    objc_msgSend(v4, "_nsurlTaskToOrigin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

  }
}

void __30__ACSURLSession__suspendTask___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "_internalState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __30__ACSURLSession__suspendTask___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
  else
  {
    objc_msgSend(*v2, "_nsurlTaskToCachingServer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && objc_msgSend(*v2, "_tryCachingServer"))
    {
      objc_msgSend(v11, "suspend");
    }
    else
    {
      objc_msgSend(*v2, "_nsurlTaskToOrigin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "suspend");

    }
    objc_msgSend(*v2, "set_suspended:", 1);

  }
}

- (void)_resumeTask:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ACSURLSession canUseCachingServer](self, "canUseCachingServer");
  -[ACSURLSession _logHandle](self, "_logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ACSURLSession _resumeTask:].cold.2();

    if (objc_msgSend(v4, "_internalState") != 2)
    {
      -[ACSURLSession _queue](self, "_queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __29__ACSURLSession__resumeTask___block_invoke;
      v13[3] = &unk_1E9877588;
      v13[4] = self;
      v14 = v4;
      dispatch_async(v12, v13);

      goto LABEL_12;
    }
    -[ACSURLSession _logHandle](self, "_logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACSURLSession _resumeTask:].cold.1();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "originalRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1D4CDC000, v7, OS_LOG_TYPE_DEFAULT, "ACSURLSessionTask %@ for %@ can not use caching server", buf, 0x16u);

    }
    objc_msgSend(v4, "_nsurlTaskToOrigin");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject resume](v8, "resume");
  }

LABEL_12:
}

uint64_t __29__ACSURLSession__resumeTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resumeTask:", *(_QWORD *)(a1 + 40));
}

- (void)_onqueue_resumeTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  ACSURLSession *v17;
  id v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  id v21;
  id v22;

  v4 = a3;
  -[ACSURLSession _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "originalRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke;
  v20[3] = &unk_1E9877740;
  v20[4] = self;
  v9 = v4;
  v21 = v9;
  v10 = v6;
  v22 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1D82671C4](v20);
  if (objc_msgSend(v9, "_suspended"))
  {
    objc_msgSend(v9, "set_suspended:", 0);
    objc_msgSend(v9, "set_internalState:", 1);
    objc_msgSend(v9, "_nsurlTaskToCachingServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v9, "_tryCachingServer"))
    {
      objc_msgSend(v12, "resume");
    }
    else
    {
      objc_msgSend(v9, "_nsurlTaskToOrigin");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resume");

    }
  }
  else if (v7 && (objc_msgSend(v9, "_tryCachingServer") & 1) != 0)
  {
    v13 = objc_msgSend(v9, "_isUpload");
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_3;
    v15[3] = &unk_1E9877768;
    v16 = v10;
    v17 = self;
    v18 = v9;
    v19 = v11;
    -[ACSURLSession _locateCachingServerForURL:isUpload:completionHandler:](self, "_locateCachingServerForURL:isUpload:completionHandler:", v7, v13, v15);

  }
  else
  {
    v11[2](v11);
  }

}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v4 = a1[6];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_2;
  v5[3] = &unk_1E9877718;
  v5[4] = v3;
  v6 = v2;
  v7 = (id)a1[6];
  objc_msgSend(v3, "_onqueue_task:willUseCachingServer:newRequest:completionHandler:", v6, 0, v4, v5);

}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_2(id *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  objc_msgSend(a1[4], "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (v10 && objc_msgSend(a1[4], "_phase") != 2)
  {
    if (a1[6] != v10)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      v11[0] = CFSTR("session");
      v11[1] = CFSTR("request");
      v7 = a1[5];
      v12[0] = a1[4];
      v12[1] = v10;
      v11[2] = CFSTR("task");
      v12[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, CFSTR("Cannot modify request when not using caching server"), v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v9);
    }
    objc_msgSend(a1[5], "_nsurlTaskToOrigin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resume");

  }
  else
  {
    objc_msgSend(a1[5], "cancel");
  }

}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v7, "setURL:", v5);
    objc_msgSend(v7, "setAllowsCellularAccess:", 0);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connectTimeout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      if (v10 < 30.0)
        objc_msgSend(v7, "_setRequiresShortConnectionTimeout:", 1);
    }
    v12 = *(void **)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__ACSURLSession__onqueue_resumeTask___block_invoke_4;
    v13[3] = &unk_1E9877718;
    v13[4] = v12;
    v14 = v11;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v12, "_onqueue_task:willUseCachingServer:newRequest:completionHandler:", v14, 1, v7, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "set_tryCachingServer:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __37__ACSURLSession__onqueue_resumeTask___block_invoke_4(id *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a1[4], "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (v10 && objc_msgSend(a1[4], "_phase") != 2)
  {
    v4 = a1[5];
    if (a1[6] == v10)
    {
      objc_msgSend(v4, "set_tryCachingServer:", 0);
      objc_msgSend(a1[5], "_nsurlTaskToOrigin");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resume");

    }
    else
    {
      objc_msgSend(v4, "_nsurlTaskForRequest:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "set_nsurlTaskToCachingServer:", v5);
      v6 = a1[4];
      objc_msgSend(a1[5], "_nsurlTaskToOrigin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "_nsurlTaskToCachingServer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_copyAttributesFromNSURLTask:toNSURLTask:", v7, v8);

      objc_msgSend(a1[4], "_onqueue_addTask:forNSURLTask:", a1[5], v5);
      objc_msgSend(v5, "resume");

    }
  }
  else
  {
    objc_msgSend(a1[5], "cancel");
  }

}

- (void)_dataTask:(id)a3 completedWithData:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  ACSURLSession *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  ACSURLSession *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v32 = v12;
    v33 = 2048;
    v34 = objc_msgSend(v13, "length");
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v17, OS_LOG_TYPE_DEBUG, "_dataTask:%@ completedWithData:[%ld bytes] response:%@ error:%@ self=%@", buf, 0x34u);
  }

  -[ACSURLSession _queue](self, "_queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke;
  v24[3] = &unk_1E98777B8;
  v25 = v12;
  v26 = v15;
  v27 = v14;
  v28 = self;
  v29 = v13;
  v30 = v16;
  v19 = v13;
  v20 = v16;
  v21 = v14;
  v22 = v15;
  v23 = v12;
  dispatch_async(v18, v24);

}

void __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  char v30;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  _WORD v35[17];

  *(_QWORD *)&v35[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToCachingServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || !objc_msgSend(*(id *)(a1 + 32), "_tryCachingServer"))
  {
    v10 = 0;
LABEL_28:
    v15 = *(void **)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "originalRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_errorWithResumeDataFromError:originalRequest:currentRequest:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "_clientDelegateOpQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke_109;
    v23[3] = &unk_1E9877790;
    v29 = *(id *)(a1 + 72);
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 48);
    v26 = v19;
    v30 = v10;
    v21 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 56);
    v27 = v21;
    v28 = v22;
    v4 = v19;
    objc_msgSend(v20, "addOperationWithBlock:", v23);

    goto LABEL_29;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_failBackToOrigin"))
  {
LABEL_27:
    v10 = 1;
    goto LABEL_28;
  }
  objc_msgSend(v2, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(*(id *)(a1 + 48), "statusCode") < 400)
  {
    cf = 0;
    if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 1, (CFErrorRef *)&cf))
    {
      objc_msgSend(*(id *)(a1 + 56), "_logHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = (uint64_t)v14;
        v34 = 1024;
        *(_DWORD *)v35 = 1;
        v35[2] = 2112;
        *(_QWORD *)&v35[3] = cf;
        _os_log_impl(&dword_1D4CDC000, v13, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

      }
    }
    if (cf)
      CFRelease(cf);

    goto LABEL_27;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "_logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "statusCode");
      objc_msgSend(v4, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = v11;
      v34 = 2112;
      *(_QWORD *)v35 = v12;
      _os_log_impl(&dword_1D4CDC000, v5, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);

    }
    goto LABEL_7;
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 56), "_logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v6;
    v34 = 2112;
    *(_QWORD *)v35 = v7;
    _os_log_impl(&dword_1D4CDC000, v5, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);

  }
LABEL_7:

  cf = 0;
  if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 0, (CFErrorRef *)&cf))
  {
    objc_msgSend(*(id *)(a1 + 56), "_logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = (uint64_t)v9;
      v34 = 1024;
      *(_DWORD *)v35 = 0;
      v35[2] = 2112;
      *(_QWORD *)&v35[3] = cf;
      _os_log_impl(&dword_1D4CDC000, v8, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

    }
  }
  if (cf)
    CFRelease(cf);
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_removeTaskForNSURLTask:", v2);
  objc_msgSend(*(id *)(a1 + 32), "set_tryCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_resumeTask:", *(_QWORD *)(a1 + 32));
LABEL_29:

}

uint64_t __78__ACSURLSession__dataTask_completedWithData_response_error_completionHandler___block_invoke_109(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 56), "_nsurlTaskToOrigin");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

  }
  return objc_msgSend(*(id *)(a1 + 64), "_removeTask:", *(_QWORD *)(a1 + 56));
}

- (void)_downloadTask:(id)a3 completedWithLocation:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  ACSURLSession *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  ACSURLSession *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v48 = v12;
    v49 = 2112;
    v50 = (uint64_t)v13;
    v51 = 2112;
    v52 = v14;
    v53 = 2112;
    v54 = v15;
    v55 = 2112;
    v56 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v17, OS_LOG_TYPE_DEBUG, "_downloadTask:%@ completedWithLocation:%@ response:%@ error:%@ self=%@", buf, 0x34u);
  }

  if (v13)
  {
    -[ACSURLSession _linkedLocationWithLocation:](self, "_linkedLocationWithLocation:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v32 = (void *)MEMORY[0x1E0C99DA0];
      v33 = *MEMORY[0x1E0C99750];
      v45[0] = CFSTR("session");
      v45[1] = CFSTR("downloadTask");
      v46[0] = self;
      v46[1] = v12;
      v45[2] = CFSTR("location");
      v46[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, CFSTR("ACSURLSession needs a non-reference file URL to a file"), v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v35);
    }
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v21 = objc_msgSend(v20, "linkItemAtURL:toURL:error:", v13, v19, &v44);
    v22 = v44;

    if ((v21 & 1) == 0)
    {
      -[ACSURLSession _logHandle](self, "_logHandle");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "path");
        v30 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v48 = v36;
        v49 = 2112;
        v50 = v30;
        v31 = (void *)v30;
        v51 = 2112;
        v52 = v22;
        _os_log_error_impl(&dword_1D4CDC000, v23, OS_LOG_TYPE_ERROR, "ACSURLSession can not link %@ to %@: %@", buf, 0x20u);

      }
      if (!v15)
        v15 = v22;
    }

  }
  else
  {
    v19 = 0;
  }
  -[ACSURLSession _queue](self, "_queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke;
  block[3] = &unk_1E98777B8;
  v38 = v12;
  v39 = v15;
  v40 = v14;
  v41 = self;
  v42 = v19;
  v43 = v16;
  v25 = v19;
  v26 = v16;
  v27 = v14;
  v28 = v15;
  v29 = v12;
  dispatch_async(v24, block);

}

void __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  char v31;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  _WORD v36[17];

  *(_QWORD *)&v36[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlTaskToCachingServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || !objc_msgSend(*(id *)(a1 + 32), "_tryCachingServer"))
  {
    v11 = 0;
LABEL_29:
    v16 = *(void **)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "originalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_errorWithResumeDataFromError:originalRequest:currentRequest:", v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "_clientDelegateOpQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke_117;
    v24[3] = &unk_1E9877790;
    v30 = *(id *)(a1 + 72);
    v25 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 48);
    v27 = v20;
    v31 = v11;
    v22 = *(id *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 56);
    v28 = v22;
    v29 = v23;
    v10 = v20;
    objc_msgSend(v21, "addOperationWithBlock:", v24);

    goto LABEL_30;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_failBackToOrigin"))
  {
LABEL_28:
    v11 = 1;
    goto LABEL_29;
  }
  objc_msgSend(v2, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(*(id *)(a1 + 48), "statusCode") < 400)
  {
    cf = 0;
    if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 1, (CFErrorRef *)&cf))
    {
      objc_msgSend(*(id *)(a1 + 56), "_logHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = (uint64_t)v15;
        v35 = 1024;
        *(_DWORD *)v36 = 1;
        v36[2] = 2112;
        *(_QWORD *)&v36[3] = cf;
        _os_log_impl(&dword_1D4CDC000, v14, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

      }
    }
    if (cf)
      CFRelease(cf);

    goto LABEL_28;
  }
  if (*(_QWORD *)(a1 + 40))
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 56), "_logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v6;
      v35 = 2112;
      *(_QWORD *)v36 = v7;
      _os_log_impl(&dword_1D4CDC000, v5, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 56), "_logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(*(id *)(a1 + 48), "statusCode");
    objc_msgSend(v4, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v34 = v12;
    v35 = 2112;
    *(_QWORD *)v36 = v13;
    _os_log_impl(&dword_1D4CDC000, v5, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);

  }
LABEL_7:

  cf = 0;
  if (!ACSUpdateCachingServerHealth((const __CFURL *)v4, 0, 0, (CFErrorRef *)&cf))
  {
    objc_msgSend(*(id *)(a1 + 56), "_logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = (uint64_t)v9;
      v35 = 1024;
      *(_DWORD *)v36 = 0;
      v36[2] = 2112;
      *(_QWORD *)&v36[3] = cf;
      _os_log_impl(&dword_1D4CDC000, v8, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

    }
  }
  if (cf)
    CFRelease(cf);
  objc_msgSend(*(id *)(a1 + 32), "set_nsurlTaskToCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_removeTaskForNSURLTask:", v2);
  objc_msgSend(*(id *)(a1 + 32), "set_tryCachingServer:", 0);
  objc_msgSend(*(id *)(a1 + 56), "_onqueue_resumeTask:", *(_QWORD *)(a1 + 32));

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtURL:error:", *(_QWORD *)(a1 + 64), 0);
LABEL_30:

  }
}

uint64_t __86__ACSURLSession__downloadTask_completedWithLocation_response_error_completionHandler___block_invoke_117(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 56), "_nsurlTaskToOrigin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

  }
  return objc_msgSend(*(id *)(a1 + 64), "_removeTask:", *(_QWORD *)(a1 + 56));
}

- (id)_resumeDataWithNSURLResumeData:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E987AC38, CFSTR("_kACSURLSessionResumeDataVersionKey"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("_kACSURLSessionResumeDataNSURLResumeDataKey"));
  -[ACSURLSession _locateOptions](self, "_locateOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ACSURLSession _locateOptions](self, "_locateOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("_kACSURLSessionResumeDataLocateOptionsKey"));

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v18 = *MEMORY[0x1E0CB2CD0];
  objc_msgSend(v17, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v17, "encodedData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("_kACSURLSessionResumeDataOriginalRequestKey"));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v20, "encodeObject:forKey:", v12, v18);

  objc_msgSend(v20, "encodedData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("_kACSURLSessionResumeDataCurrentRequestKey"));
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 100, 0, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)_resumeData:(id)a3 toNSURLResumeData:(id *)a4 originalRequest:(id *)a5 currentRequest:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id *v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  char isKindOfClass;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v64 = *MEMORY[0x1E0CB2D50];
    v65[0] = CFSTR("Invalid resume data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 1, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v59 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 1, 0, &v59);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v59;
  if (!v13)
  {
LABEL_11:
    v19 = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_32;
  }
  v50 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_kACSURLSessionResumeDataVersionKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_kACSURLSessionResumeDataNSURLResumeDataKey"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_kACSURLSessionResumeDataLocateOptionsKey"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_kACSURLSessionResumeDataOriginalRequestKey"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_kACSURLSessionResumeDataCurrentRequestKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v13;
  v52 = (void *)v16;
  if (v15 && (objc_msgSend(v15, "isEqual:", &unk_1E987AC38) & 1) != 0)
  {
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_29;
    }
    -[ACSURLSession _locateOptions](self, "_locateOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      if (!objc_msgSend(v56, "isEqual:", v17))
        goto LABEL_28;
    }
    else if (v17)
    {
      goto LABEL_28;
    }
    if (v55)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v54)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (v56)

        if ((isKindOfClass & 1) == 0)
          goto LABEL_29;
        v48 = v15;
        if (_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classesOnce != -1)
          dispatch_once(&_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classesOnce, &__block_literal_global_126);
        v58 = 0;
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v55, &v58);
        v34 = v58;
        v35 = *MEMORY[0x1E0CB2CD0];
        objc_msgSend(v33, "decodeObjectOfClasses:forKey:", _resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes, *MEMORY[0x1E0CB2CD0]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v33;
        objc_msgSend(v33, "finishDecoding");
        v53 = v36;
        if (v36
          && (objc_msgSend(v36, "URL"), v37 = (void *)objc_claimAutoreleasedReturnValue(), v37, v37))
        {
          v57 = v34;
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v54, &v57);
          v49 = v57;

          objc_msgSend(v38, "decodeObjectOfClasses:forKey:", _resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes, v35);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v38;
          objc_msgSend(v38, "finishDecoding");
          if (v19)
          {
            objc_msgSend(v19, "URL");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              a7 = v50;
LABEL_53:
              v31 = (uint64_t)v14;

              v14 = v47;
              v15 = v48;
              v25 = v49;
              goto LABEL_31;
            }
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKeyedSubscript:", CFSTR("Invalid resume data"), *MEMORY[0x1E0CB2D50]);
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v13, CFSTR("resumeDict"));
          a7 = v50;
          if (v49)
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v49, *MEMORY[0x1E0CB3388]);
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v53, CFSTR("originalRequest"));
          if (v19)
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v19, CFSTR("currentRequest"));
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 5, v45);
          v44 = objc_claimAutoreleasedReturnValue();

          v14 = v45;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("Invalid resume data"), *MEMORY[0x1E0CB2D50]);
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v13, CFSTR("resumeDict"));
          if (v34)
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CB3388]);
          a7 = v50;
          if (v36)
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v36, CFSTR("originalRequest"));
          v46 = v43;
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 4, v43);
          v44 = objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v49 = v34;
        }

        v14 = (id)v44;
        goto LABEL_53;
      }
      if (!v56)
      {
LABEL_29:
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v60[0] = *MEMORY[0x1E0CB2D50];
        v60[1] = CFSTR("resumeDict");
        v61[0] = CFSTR("Invalid resume data");
        v61[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 3, v25);
        v31 = objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v53 = 0;
        goto LABEL_30;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v62[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown resume data version %@"), v15);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v13;
  v25 = (void *)v23;
  v62[1] = CFSTR("resumeDict");
  v63[0] = v23;
  v63[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v26 = v12;
  v27 = a4;
  v28 = a6;
  v29 = a5;
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("_kACSURLSessionErrorDomain"), 2, v30);
  v31 = objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v53 = 0;
  v14 = (id)v30;
  a5 = v29;
  a6 = v28;
  a4 = v27;
  v12 = v26;
LABEL_30:
  a7 = v50;
LABEL_31:

  v14 = (id)v31;
  v21 = v52;
  v20 = v53;
  v13 = v51;
LABEL_32:

  if (v14)
  {
    v41 = v14;
    a6 = a7;
    if (a7)
LABEL_34:
      *a6 = objc_retainAutorelease(v41);
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v21);
    if (a5)
      *a5 = objc_retainAutorelease(v20);
    v41 = v19;
    if (a6)
      goto LABEL_34;
  }

  return v14 == 0;
}

void __84__ACSURLSession__resumeData_toNSURLResumeData_originalRequest_currentRequest_error___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v0 = (void *)MEMORY[0x1E0C99E20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes;
  _resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes = v8;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v10 = (void *)getSZExtractorClass_softClass;
  v17 = getSZExtractorClass_softClass;
  if (!getSZExtractorClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getSZExtractorClass_block_invoke;
    v13[3] = &unk_1E9877BC0;
    v13[4] = &v14;
    __getSZExtractorClass_block_invoke((uint64_t)v13);
    v10 = (void *)v15[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v11, "knownSZExtractorImplementations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend((id)_resumeData_toNSURLResumeData_originalRequest_currentRequest_error__classes, "unionSet:", v12);

}

- (id)_errorWithResumeDataFromError:(id)a3 originalRequest:(id)a4 currentRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3330]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v21 = 0;
      -[ACSURLSession _resumeDataWithNSURLResumeData:originalRequest:currentRequest:error:](self, "_resumeDataWithNSURLResumeData:originalRequest:currentRequest:error:", v12, v9, v10, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      if (v13)
      {
        v15 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("NSURLSessionDownloadTaskResumeData"));
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v8, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v8, "code"), v15);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ACSURLSession _logHandle](self, "_logHandle");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_impl(&dword_1D4CDC000, v19, OS_LOG_TYPE_DEFAULT, "ACSURLSession failed to convert resume data: %@", buf, 0xCu);
        }

        v18 = v8;
      }

    }
    else
    {
      v18 = v8;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_linkedLocationWithLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("/"), 4);
  v8 = v7;
  if (!objc_msgSend(v3, "isFileURL"))
    goto LABEL_6;
  v9 = 0;
  if ((objc_msgSend(v3, "isFileReferenceURL") & 1) == 0 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 + v8 < (unint64_t)objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "insertString:atIndex:", CFSTR("ACS~"), v6 + v8);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)_copyAttributesFromNSURLTask:(id)a3 toNSURLTask:(id)a4
{
  id v5;
  int v6;
  int v7;
  double v8;
  id v9;

  v9 = a4;
  v5 = a3;
  objc_msgSend(v9, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v5, "countOfBytesClientExpectsToSend"));
  objc_msgSend(v9, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v5, "countOfBytesClientExpectsToReceive"));
  objc_msgSend(v5, "priority");
  v7 = v6;

  LODWORD(v8) = v7;
  objc_msgSend(v9, "setPriority:", v8);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ACSURLSession *v15;
  id v16;
  SEL v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  ACSURLSession *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEBUG, "URLSession:%@ didBecomeInvalidWithError:%@ self=%@", buf, 0x20u);
  }

  -[ACSURLSession _queue](self, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke;
  v13[3] = &unk_1E9877800;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v17 = a2;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

void __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_nsurlSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v11, "_nsurlSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("ACSURLSession.m"), 1062, CFSTR("ACSURLSession %@ session %@ != expected %@"), v11, v12, v13);

  }
  objc_msgSend(*(id *)(a1 + 40), "_clientDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_clientDelegateOpQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_2;
    v14[3] = &unk_1E9877740;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v15 = v6;
    v16 = v7;
    v17 = v8;
    objc_msgSend(v5, "addOperationWithBlock:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "set_clientDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "set_clientDelegateOpQueue:", 0);
    objc_msgSend(*(id *)(a1 + 40), "set_nsurlSession:", 0);
  }

}

void __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_3;
  block[3] = &unk_1E9877420;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __54__ACSURLSession_URLSession_didBecomeInvalidWithError___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_clientDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "set_clientDelegateOpQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "set_nsurlSession:", 0);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  ACSURLSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ didReceiveChallenge:%@ self=%@", buf, 0x20u);
  }

  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E98778A0;
  block[4] = self;
  v18 = v9;
  v20 = v11;
  v21 = a2;
  v19 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(v13, block);

}

void __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  _QWORD v18[2];
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "_nsurlSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("ACSURLSession.m"), 1094, CFSTR("ACSURLSession %@ session %@ != expected %@"), v12, v13, v14);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_2;
      v17[3] = &unk_1E9877850;
      v7 = (id *)v18;
      v8 = v5;
      v9 = *(_QWORD *)(a1 + 32);
      v18[0] = v8;
      v18[1] = v9;
      v19 = *(id *)(a1 + 48);
      v20 = *(id *)(a1 + 56);
      objc_msgSend(v6, "addOperationWithBlock:", v17);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_4;
      v15[3] = &unk_1E9877878;
      v7 = &v16;
      v16 = *(id *)(a1 + 56);
      objc_msgSend(v6, "addOperationWithBlock:", v15);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_3;
  v4[3] = &unk_1E9877828;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "URLSession:didReceiveChallenge:completionHandler:", v2, v3, v4);

}

uint64_t __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ACSURLSession_URLSession_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = *MEMORY[0x1E0C99750];
  v18[0] = CFSTR("session");
  v18[1] = CFSTR("nsurlTask");
  v19[0] = self;
  v19[1] = v11;
  v18[2] = CFSTR("request");
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, CFSTR("ACSURLSession does not support background sessions"), v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  ACSURLSession *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "descriptionWithAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v7;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEBUG, "URLSession:%@ taskIsWaitingForConnectivity:%@ self=%@", buf, 0x20u);

  }
  -[ACSURLSession _queue](self, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke;
  v14[3] = &unk_1E9877800;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = a2;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v14);

}

void __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1136, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke_2;
        v17[3] = &unk_1E9877740;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v18 = v9;
        v19 = v10;
        v20 = v8;
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v17);

      }
    }

  }
}

uint64_t __57__ACSURLSession_URLSession_taskIsWaitingForConnectivity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:taskIsWaitingForConnectivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  ACSURLSession *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "descriptionWithAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v34 = v13;
    v35 = 2112;
    v36 = v25;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v18, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ willPerformHTTPRedirection:%@ newRequest:%@ self=%@", buf, 0x34u);

  }
  -[ACSURLSession _queue](self, "_queue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  block[3] = &unk_1E98778F0;
  block[4] = self;
  v27 = v13;
  v31 = v17;
  v32 = a2;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  dispatch_async(v19, block);

}

void __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[2];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 80);
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "_nsurlSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("ACSURLSession.m"), 1166, CFSTR("ACSURLSession %@ session %@ != expected %@"), v13, v14, v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
        v19[3] = &unk_1E98778C8;
        v8 = (id *)v20;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v20[0] = v9;
        v20[1] = v10;
        v21 = v7;
        v22 = *(id *)(a1 + 56);
        v23 = *(id *)(a1 + 64);
        v24 = *(id *)(a1 + 72);
        objc_msgSend(v6, "addOperationWithBlock:", v19);

      }
      else
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
        v25[3] = &unk_1E9877878;
        v8 = &v26;
        v26 = *(id *)(a1 + 72);
        objc_msgSend(v6, "addOperationWithBlock:", v25);
      }

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4;
      v16[3] = &unk_1E9877498;
      v18 = *(id *)(a1 + 72);
      v17 = *(id *)(a1 + 64);
      objc_msgSend(v6, "addOperationWithBlock:", v16);

      v7 = v18;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __89__ACSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  ACSURLSession *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "descriptionWithAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v11;
    v30 = 2112;
    v31 = v21;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didReceiveChallenge:%@ self=%@", buf, 0x2Au);

  }
  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v22[3] = &unk_1E9877968;
  v22[4] = self;
  v23 = v11;
  v26 = v14;
  v27 = a2;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v14;
  dispatch_async(v16, v22);

}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  _QWORD v19[2];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 72);
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "_nsurlSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("ACSURLSession.m"), 1205, CFSTR("ACSURLSession %@ session %@ != expected %@"), v13, v14, v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3;
        v18[3] = &unk_1E9877940;
        v8 = (id *)v19;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v19[0] = v9;
        v19[1] = v10;
        v20 = v7;
        v21 = *(id *)(a1 + 56);
        v22 = *(id *)(a1 + 64);
        objc_msgSend(v6, "addOperationWithBlock:", v18);

      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2;
        v23[3] = &unk_1E9877878;
        v8 = &v24;
        v24 = *(id *)(a1 + 64);
        objc_msgSend(v6, "addOperationWithBlock:", v23);
      }

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_5;
      v16[3] = &unk_1E9877878;
      v17 = *(id *)(a1 + 64);
      objc_msgSend(v6, "addOperationWithBlock:", v16);
      v7 = v17;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4;
  v6[3] = &unk_1E9877918;
  v7 = v4;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "URLSession:task:didReceiveChallenge:completionHandler:", v3, v7, v5, v6);

}

void __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2 == 2)
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __71__ACSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  ACSURLSession *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "descriptionWithAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v9;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ needNewBodyStream self=%@", buf, 0x20u);

  }
  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke;
  block[3] = &unk_1E98778A0;
  block[4] = self;
  v19 = v9;
  v21 = v11;
  v22 = a2;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(v13, block);

}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[2];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1245, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_3;
        v20[3] = &unk_1E9877850;
        v8 = (id *)v21;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v21[0] = v9;
        v21[1] = v10;
        v22 = v7;
        v23 = *(id *)(a1 + 56);
        objc_msgSend(v6, "addOperationWithBlock:", v20);

        v11 = v22;
      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_5;
        v17[3] = &unk_1E9877448;
        v8 = &v18;
        v18 = v7;
        v19 = *(id *)(a1 + 56);
        objc_msgSend(v6, "addOperationWithBlock:", v17);
        v11 = v19;
      }

    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_2;
      v24[3] = &unk_1E9877878;
      v8 = &v25;
      v25 = *(id *)(a1 + 56);
      objc_msgSend(v6, "addOperationWithBlock:", v24);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_4;
  v5[3] = &unk_1E9877990;
  v6 = v4;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "URLSession:task:needNewBodyStream:", v3, v6, v5);

}

void __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __51__ACSURLSession_URLSession_task_needNewBodyStream___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_failBackToOrigin:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  SEL v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  ACSURLSession *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "descriptionWithAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v28 = v13;
    v29 = 2112;
    v30 = v19;
    v31 = 2048;
    v32 = a5;
    v33 = 2048;
    v34 = a6;
    v35 = 2048;
    v36 = a7;
    v37 = 2112;
    v38 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld self=%@", buf, 0x3Eu);

  }
  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  block[3] = &unk_1E98779E0;
  block[4] = self;
  v21 = v13;
  v22 = v14;
  v23 = a2;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v17 = v14;
  v18 = v13;
  dispatch_async(v16, block);

}

void __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1285, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2;
        v17[3] = &unk_1E98779B8;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v18 = v9;
        v19 = v10;
        v20 = v8;
        v21 = *(_OWORD *)(a1 + 64);
        v22 = *(_QWORD *)(a1 + 80);
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v17);

      }
    }

  }
}

uint64_t __89__ACSURLSession_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  ACSURLSession *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "descriptionWithAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v9;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didFinishCollectingMetrics:%@ self=%@", buf, 0x2Au);

  }
  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E9877A30;
  block[4] = self;
  v19 = v9;
  v21 = v11;
  v22 = a2;
  v20 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, block);

}

void __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1309, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2;
        v17[3] = &unk_1E9877A08;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v18 = v9;
        v19 = v10;
        v20 = v8;
        v21 = *(id *)(a1 + 56);
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v17);

      }
    }

  }
}

uint64_t __60__ACSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  ACSURLSession *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "descriptionWithAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v9;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ task:%@ didCompleteWithError:%@ self=%@", buf, 0x2Au);

  }
  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E9877A30;
  block[4] = self;
  v19 = v9;
  v21 = v11;
  v22 = a2;
  v20 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, block);

}

void __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  char v47;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  _QWORD v52[4];

  *(_QWORD *)((char *)&v52[2] + 2) = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 64);
      v38 = *(void **)(a1 + 32);
      v39 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v38, "_nsurlSession");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, v38, CFSTR("ACSURLSession.m"), 1334, CFSTR("ACSURLSession %@ session %@ != expected %@"), v38, v39, v40);

    }
    objc_msgSend(*(id *)(a1 + 48), "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      goto LABEL_30;
    objc_msgSend(v6, "_nsurlTaskToCachingServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(void **)(a1 + 48) == v8 && objc_msgSend(v7, "_tryCachingServer"))
    {
      if (objc_msgSend(v7, "_failBackToOrigin"))
      {
        objc_msgSend(v8, "currentRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URL");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v11 = *(_QWORD *)(a1 + 56);
        if (v11 || !v5)
          goto LABEL_13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "statusCode") >= 400)
        {
          v11 = *(_QWORD *)(a1 + 56);
LABEL_13:
          objc_msgSend(*(id *)(a1 + 32), "_logHandle");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v13)
            {
              v14 = *(_QWORD *)(a1 + 56);
              objc_msgSend(v10, "absoluteString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v50 = v14;
              v51 = 2112;
              v52[0] = v15;
              _os_log_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEFAULT, "Error %@ from %@, failing back to original", buf, 0x16u);

            }
          }
          else if (v13)
          {
            v32 = objc_msgSend(v5, "statusCode");
            objc_msgSend(v10, "absoluteString");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v50 = v32;
            v51 = 2112;
            v52[0] = v33;
            _os_log_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, failing back to original", buf, 0x16u);

          }
          cf = 0;
          if (!ACSUpdateCachingServerHealth((const __CFURL *)v10, 0, 0, (CFErrorRef *)&cf))
          {
            objc_msgSend(*(id *)(a1 + 32), "_logHandle");
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "absoluteString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v50 = (uint64_t)v35;
              v51 = 1024;
              LODWORD(v52[0]) = 0;
              WORD2(v52[0]) = 2112;
              *(_QWORD *)((char *)v52 + 6) = cf;
              _os_log_impl(&dword_1D4CDC000, v34, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

            }
          }
          if (cf)
            CFRelease(cf);
          objc_msgSend(v7, "set_nsurlTaskToCachingServer:", 0);
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeTaskForNSURLTask:", v8);
          objc_msgSend(v7, "set_tryCachingServer:", 0);
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_resumeTask:", v7);
LABEL_29:

LABEL_30:
          return;
        }
        cf = 0;
        if (!ACSUpdateCachingServerHealth((const __CFURL *)v10, 0, 1, (CFErrorRef *)&cf))
        {
          objc_msgSend(*(id *)(a1 + 32), "_logHandle");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "absoluteString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v50 = (uint64_t)v31;
            v51 = 1024;
            LODWORD(v52[0]) = 1;
            WORD2(v52[0]) = 2112;
            *(_QWORD *)((char *)v52 + 6) = cf;
            _os_log_impl(&dword_1D4CDC000, v30, OS_LOG_TYPE_DEFAULT, "ACSUpdateCachingServerHealth(%@, %d) failed: %@", buf, 0x1Cu);

          }
        }
        if (cf)
          CFRelease(cf);

      }
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    v10 = *(id *)(a1 + 56);
    if (!v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v7;
        objc_msgSend(v17, "_deferredLinkError");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v17, "_deferredLinkError");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "set_deferredLinkError:", 0);
        }

      }
      else
      {
        v10 = 0;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v7, "originalRequest");
      v41 = v16;
      v21 = v5;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_errorWithResumeDataFromError:originalRequest:currentRequest:", v10, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v22;
      v5 = v21;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke_163;
      v42[3] = &unk_1E9877A58;
      v26 = v18;
      v27 = *(_QWORD *)(a1 + 32);
      v43 = v26;
      v44 = v27;
      v45 = v7;
      v46 = v25;
      v47 = v41;
      v28 = v25;
      objc_msgSend(v19, "addOperationWithBlock:", v42);

    }
    else
    {
      if (v16)
      {
        objc_msgSend(v7, "_nsurlTaskToOrigin");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cancel");

      }
      objc_msgSend(*(id *)(a1 + 32), "_removeTask:", v7);
    }

    goto LABEL_29;
  }
}

uint64_t __54__ACSURLSession_URLSession_task_didCompleteWithError___block_invoke_163(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "_nsurlTaskToOrigin");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

  }
  return objc_msgSend(*(id *)(a1 + 40), "_removeTask:", *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  ACSURLSession *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didReceiveResponse:%@ self=%@", buf, 0x2Au);
  }

  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v21[3] = &unk_1E9877968;
  v21[4] = self;
  v22 = v11;
  v25 = v14;
  v26 = a2;
  v23 = v12;
  v24 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v14;
  dispatch_async(v16, v21);

}

void __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  _QWORD v30[2];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
    return;
  }
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 72);
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v20, "_nsurlSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("ACSURLSession.m"), 1422, CFSTR("ACSURLSession %@ session %@ != expected %@"), v20, v21, v22);

  }
  objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 72);
      v25 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("ACSURLSession.m"), 1435, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v25, v7, v26, CFSTR("ACSURLSessionDataTask"));

    }
    v8 = v7;
    objc_msgSend(v8, "_nsurlTaskToCachingServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(void **)(a1 + 48) == v9
      && objc_msgSend(v8, "_tryCachingServer")
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 56), "statusCode") >= 400)
    {
      if (objc_msgSend(v8, "_failBackToOrigin"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_logHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_msgSend(*(id *)(a1 + 56), "statusCode");
          objc_msgSend(*(id *)(a1 + 56), "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v39 = v11;
          v40 = 2112;
          v41 = v13;
          _os_log_impl(&dword_1D4CDC000, v10, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, canceling to fail back to original", buf, 0x16u);

        }
      }
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_166;
      v34[3] = &unk_1E9877878;
      v14 = &v35;
      v35 = *(id *)(a1 + 64);
      v15 = v34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_169;
        v29[3] = &unk_1E9877940;
        v14 = (id *)v30;
        v16 = v5;
        v17 = *(_QWORD *)(a1 + 32);
        v30[0] = v16;
        v30[1] = v17;
        v31 = v8;
        v32 = *(id *)(a1 + 56);
        v33 = *(id *)(a1 + 64);
        objc_msgSend(v6, "addOperationWithBlock:", v29);

LABEL_22:
        goto LABEL_23;
      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
      v27[3] = &unk_1E9877878;
      v14 = &v28;
      v28 = *(id *)(a1 + 64);
      v15 = v27;
    }
    objc_msgSend(v6, "addOperationWithBlock:", v15);
    goto LABEL_22;
  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v36[3] = &unk_1E9877878;
  v37 = *(id *)(a1 + 64);
  objc_msgSend(v6, "addOperationWithBlock:", v36);
  v8 = v37;
LABEL_23:

}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_169(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v6[3] = &unk_1E9877A80;
  v6[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "URLSession:dataTask:didReceiveResponse:completionHandler:", v3, v7, v5, v6);

}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 == 3)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99750];
      v10[0] = CFSTR("session");
      v10[1] = CFSTR("task");
      v6 = *(_QWORD *)(a1 + 40);
      v11[0] = *(_QWORD *)(a1 + 32);
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, CFSTR("ACSURLSession does not support stream tasks"), v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v8);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "set_failBackToOrigin:", 0);
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2);
}

uint64_t __74__ACSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  ACSURLSession *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didBecomeDownloadTask:%@ self=%@", buf, 0x2Au);
  }

  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  block[3] = &unk_1E9877A30;
  block[4] = self;
  v18 = v9;
  v20 = v11;
  v21 = a2;
  v19 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, block);

}

void __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  ACSURLSessionDownloadTask *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  ACSURLSessionDownloadTask *v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 64);
      v31 = *(void **)(a1 + 32);
      v32 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v31, "_nsurlSession");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("ACSURLSession.m"), 1483, CFSTR("ACSURLSession %@ session %@ != expected %@"), v31, v32, v33);

    }
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 64);
        v36 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, CFSTR("ACSURLSession.m"), 1490, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v36, v5, v37, CFSTR("ACSURLSessionDataTask"));

      }
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 56), "currentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "_tryCachingServer") & 1) != 0)
      {
        objc_msgSend(v6, "originalRequest");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v7;
      }
      v9 = v8;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_2;
      v47[3] = &unk_1E9877678;
      v10 = v7;
      v48 = v10;
      v11 = *(id *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 32);
      v49 = v11;
      v50 = v12;
      v39 = (void *)MEMORY[0x1D82671C4](v47);
      v40 = v9;
      v13 = -[ACSURLSessionDownloadTask initWithNSURLDownloadTaskCreator:initialRequest:forSession:]([ACSURLSessionDownloadTask alloc], "initWithNSURLDownloadTaskCreator:initialRequest:forSession:", v39, v9, *(_QWORD *)(a1 + 32));
      v14 = *(void **)(a1 + 32);
      -[ACSURLSessionTask _nsurlTaskToOrigin](v13, "_nsurlTaskToOrigin");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_onqueue_addTask:forNSURLTask:", v13, v15);

      v16 = *(void **)(a1 + 48);
      objc_msgSend(v6, "_nsurlTaskToCachingServer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 == v17)
      {
        -[ACSURLSessionTask _nsurlTaskForRequest:](v13, "_nsurlTaskForRequest:", v10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACSURLSessionTask set_nsurlTaskToCachingServer:](v13, "set_nsurlTaskToCachingServer:", v38);
        v18 = *(void **)(a1 + 32);
        -[ACSURLSessionTask _nsurlTaskToOrigin](v13, "_nsurlTaskToOrigin");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACSURLSessionTask _nsurlTaskToCachingServer](v13, "_nsurlTaskToCachingServer");
        v20 = v6;
        v21 = v5;
        v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_copyAttributesFromNSURLTask:toNSURLTask:", v19, v23);

        v10 = v22;
        v5 = v21;
        v6 = v20;

        -[ACSURLSessionTask set_suspended:](v13, "set_suspended:", objc_msgSend(v20, "_suspended"));
        objc_msgSend(*(id *)(a1 + 32), "_onqueue_addTask:forNSURLTask:", v13, v38);

      }
      else
      {
        -[ACSURLSessionTask set_tryCachingServer:](v13, "set_tryCachingServer:", 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_3;
        v41[3] = &unk_1E9877A58;
        v26 = v24;
        v27 = *(_QWORD *)(a1 + 32);
        v42 = v26;
        v43 = v27;
        v44 = v6;
        v45 = v13;
        v46 = v16 == v17;
        objc_msgSend(v25, "addOperationWithBlock:", v41);

      }
      else
      {
        if (v16 == v17)
        {
          objc_msgSend(v6, "_nsurlTaskToOrigin");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cancel");

        }
        objc_msgSend(*(id *)(a1 + 32), "_removeTask:", v6);
      }

    }
  }
}

id __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if (*(void **)(a1 + 32) == a2)
  {
    v5 = *(id *)(a1 + 40);
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    v3 = a2;
    objc_msgSend(v2, "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadTaskWithRequest:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __59__ACSURLSession_URLSession_dataTask_didBecomeDownloadTask___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didBecomeDownloadTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "_nsurlTaskToOrigin");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

  }
  return objc_msgSend(*(id *)(a1 + 40), "_removeTask:", *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeStreamTask:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _queue](self, "_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ACSURLSession_URLSession_dataTask_didBecomeStreamTask___block_invoke;
  block[3] = &unk_1E9877A30;
  block[4] = self;
  v17 = v9;
  v19 = v11;
  v20 = a2;
  v18 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, block);

}

void __57__ACSURLSession_URLSession_dataTask_didBecomeStreamTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 64);
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v8, "_nsurlSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("ACSURLSession.m"), 1543, CFSTR("ACSURLSession %@ session %@ != expected %@"), v8, v9, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v11 = (void *)v5;
      objc_opt_class();
      v12 = v11;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 64);
        v26 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("ACSURLSession.m"), 1549, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v26, v12, v27, CFSTR("ACSURLSessionDataTask"));

      }
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeTaskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v14 = *(void **)(a1 + 48);
      objc_msgSend(v13, "_nsurlTaskToCachingServer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v13, "_nsurlTaskToOrigin");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_onqueue_removeTaskForNSURLTask:", v17);

      }
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99750];
      v20 = *(_QWORD *)(a1 + 32);
      v28[0] = CFSTR("session");
      v28[1] = CFSTR("nsurlTask");
      v21 = *(_QWORD *)(a1 + 56);
      v29[0] = v20;
      v29[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, CFSTR("ACSURLSession does not support stream tasks"), v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v23);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  ACSURLSession *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2048;
    v27 = objc_msgSend(v11, "length");
    v28 = 2112;
    v29 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ didReceiveData:[%ld bytes] self=%@", buf, 0x2Au);
  }

  -[ACSURLSession _queue](self, "_queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E9877A30;
  block[4] = self;
  v18 = v9;
  v20 = v11;
  v21 = a2;
  v19 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, block);

}

void __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1571, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 64);
          v19 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("ACSURLSession.m"), 1580, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v19, v8, v20, CFSTR("ACSURLSessionDataTask"));

        }
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke_2;
        v21[3] = &unk_1E9877A08;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v22 = v9;
        v23 = v10;
        v24 = v8;
        v25 = *(id *)(a1 + 56);
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v21);

      }
    }

  }
}

uint64_t __52__ACSURLSession_URLSession_dataTask_didReceiveData___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didReceiveData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  ACSURLSession *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ dataTask:%@ willCacheResponse:%@ self=%@", buf, 0x2Au);
  }

  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke;
  v21[3] = &unk_1E9877968;
  v21[4] = self;
  v22 = v11;
  v25 = v14;
  v26 = a2;
  v23 = v12;
  v24 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v14;
  dispatch_async(v16, v21);

}

void __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[2];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 72);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1602, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 72);
          v19 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("ACSURLSession.m"), 1615, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v19, v7, v20, CFSTR("ACSURLSessionDataTask"));

        }
        v8 = v7;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_3;
        v24[3] = &unk_1E9877940;
        v9 = (id *)v25;
        v10 = v5;
        v11 = *(_QWORD *)(a1 + 32);
        v25[0] = v10;
        v25[1] = v11;
        v26 = v8;
        v27 = *(id *)(a1 + 56);
        v28 = *(id *)(a1 + 64);
        objc_msgSend(v6, "addOperationWithBlock:", v24);

      }
      else
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_2;
        v29[3] = &unk_1E9877878;
        v9 = &v30;
        v30 = *(id *)(a1 + 64);
        objc_msgSend(v6, "addOperationWithBlock:", v29);
      }

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_4;
      v21[3] = &unk_1E9877498;
      v23 = *(id *)(a1 + 64);
      v22 = *(id *)(a1 + 56);
      objc_msgSend(v6, "addOperationWithBlock:", v21);

      v7 = v23;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:willCacheResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __73__ACSURLSession_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  SEL v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  ACSURLSession *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "response");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v42 = v9;
    v43 = 2112;
    v44 = (uint64_t)v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v24;
    v49 = 2112;
    v50 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v12, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didFinishDownloadingToURL:%@ response=%@ self=%@", buf, 0x34u);

  }
  -[ACSURLSession _linkedLocationWithLocation:](self, "_linkedLocationWithLocation:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99750];
    v39[0] = CFSTR("session");
    v39[1] = CFSTR("nsurlTask");
    v40[0] = self;
    v40[1] = v10;
    v39[2] = CFSTR("location");
    v40[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, CFSTR("ACSURLSession needs a non-reference file URL to a file"), v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v31);
  }
  v14 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v16 = objc_msgSend(v15, "linkItemAtURL:toURL:error:", v11, v14, &v38);
  v17 = v38;

  if ((v16 & 1) == 0)
  {
    -[ACSURLSession _logHandle](self, "_logHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v26 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v25;
      v43 = 2112;
      v44 = v26;
      v27 = (void *)v26;
      v45 = 2112;
      v46 = v17;
      _os_log_error_impl(&dword_1D4CDC000, v18, OS_LOG_TYPE_ERROR, "ACSURLSession can not link %@ to %@: %@", buf, 0x20u);

    }
  }
  -[ACSURLSession _queue](self, "_queue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_1E9877AA8;
  block[4] = self;
  v33 = v14;
  v34 = v9;
  v35 = v10;
  v36 = v17;
  v37 = a2;
  v20 = v17;
  v21 = v10;
  v22 = v9;
  v23 = v14;
  dispatch_async(v19, block);

}

void __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

    return;
  }
  v3 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 72);
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v19, "_nsurlSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("ACSURLSession.m"), 1655, CFSTR("ACSURLSession %@ session %@ != expected %@"), v19, v20, v21);

  }
  objc_msgSend(*(id *)(a1 + 56), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 72);
      v24 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "descriptionWithAddress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("ACSURLSession.m"), 1664, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v24, v6, v25, CFSTR("ACSURLSessionDownloadTask"));

    }
    v7 = v6;
    objc_msgSend(v7, "_nsurlTaskToCachingServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(void **)(a1 + 56) == v8
      && objc_msgSend(v7, "_tryCachingServer")
      && objc_msgSend(v7, "_failBackToOrigin")
      && (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v5, "statusCode") >= 400))
    {
      objc_msgSend(*(id *)(a1 + 32), "_logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v5, "statusCode");
        objc_msgSend(v5, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v33 = v10;
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEFAULT, "HTTP response %ld from %@, ignoring to fail back to original", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      if (*(_QWORD *)(a1 + 64))
      {
        objc_msgSend(v7, "set_deferredLinkError:");
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke_181;
      v27[3] = &unk_1E9877A08;
      v15 = *(_QWORD *)(a1 + 32);
      v28 = v14;
      v29 = v15;
      v30 = v7;
      v31 = *(id *)(a1 + 40);
      v16 = v14;
      objc_msgSend(v13, "addOperationWithBlock:", v27);

    }
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
LABEL_23:

}

void __67__ACSURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke_181(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didFinishDownloadingToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  SEL v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  ACSURLSession *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v30 = 2048;
    v31 = a5;
    v32 = 2048;
    v33 = a6;
    v34 = 2048;
    v35 = a7;
    v36 = 2112;
    v37 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didWriteData:%lld totalBytesWritten:%lld totalBytesExpectedToWrite:%lld self=%@", buf, 0x3Eu);
  }

  -[ACSURLSession _queue](self, "_queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_1E98779E0;
  block[4] = self;
  v20 = v13;
  v21 = v14;
  v22 = a2;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v17 = v14;
  v18 = v13;
  dispatch_async(v16, block);

}

void __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  uint64_t v26;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1702, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v19, v18, CFSTR("ACSURLSession.m"), 1711, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v18, v8, v20, CFSTR("ACSURLSessionDownloadTask"));

        }
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2;
        v21[3] = &unk_1E98779B8;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v22 = v9;
        v23 = v10;
        v24 = v8;
        v25 = *(_OWORD *)(a1 + 64);
        v26 = *(_QWORD *)(a1 + 80);
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v21);

      }
    }

  }
}

uint64_t __98__ACSURLSession_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;
  int64_t v21;
  int64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  ACSURLSession *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  -[ACSURLSession _logHandle](self, "_logHandle");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a6;
    v31 = 2112;
    v32 = self;
    _os_log_debug_impl(&dword_1D4CDC000, v13, OS_LOG_TYPE_DEBUG, "URLSession:%@ downloadTask:%@ didResumeAtOffset:%lld expectedTotalBytes:%lld self=%@", buf, 0x34u);
  }

  -[ACSURLSession _queue](self, "_queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
  v17[3] = &unk_1E98779B8;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = a2;
  v21 = a5;
  v22 = a6;
  v15 = v12;
  v16 = v11;
  dispatch_async(v14, v17);

}

void __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;

  objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_nsurlSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "_nsurlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("ACSURLSession.m"), 1730, CFSTR("ACSURLSession %@ session %@ != expected %@"), v14, v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_clientDelegateOpQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_taskForNSURLTask:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 48), "descriptionWithAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v19, v18, CFSTR("ACSURLSession.m"), 1739, CFSTR("ACSURLSession %@ unexpected task %@ for nsurlTask %@, expected class %@"), v18, v8, v20, CFSTR("ACSURLSessionDownloadTask"));

        }
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke_2;
        v21[3] = &unk_1E9877AD0;
        v9 = v5;
        v10 = *(_QWORD *)(a1 + 32);
        v22 = v9;
        v23 = v10;
        v24 = v8;
        v25 = *(_OWORD *)(a1 + 64);
        v11 = v8;
        objc_msgSend(v6, "addOperationWithBlock:", v21);

      }
    }

  }
}

uint64_t __78__ACSURLSession_URLSession_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)URLSession:(id)a3 readClosedForStreamTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99750];
  v12[0] = CFSTR("session");
  v12[1] = CFSTR("nsurlTask");
  v13[0] = self;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, CFSTR("ACSURLSession does not support stream tasks"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 writeClosedForStreamTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99750];
  v12[0] = CFSTR("session");
  v12[1] = CFSTR("nsurlTask");
  v13[0] = self;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, CFSTR("ACSURLSession does not support stream tasks"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99750];
  v12[0] = CFSTR("session");
  v12[1] = CFSTR("nsurlTask");
  v13[0] = self;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, CFSTR("ACSURLSession does not support stream tasks"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = *MEMORY[0x1E0C99750];
  v18[0] = CFSTR("session");
  v18[1] = CFSTR("nsurlTask");
  v19[0] = self;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, CFSTR("ACSURLSession does not support stream tasks"), v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (BOOL)canUseCachingServer
{
  return self->_canUseCachingServer;
}

- (void)setCanUseCachingServer:(BOOL)a3
{
  self->_canUseCachingServer = a3;
}

- (OS_os_log)_logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_logHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLSession)_nsurlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_nsurlSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)_locateOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_locateOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ACSURLSessionDelegate)_clientDelegate
{
  return (ACSURLSessionDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)set_clientDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSOperationQueue)_clientDelegateOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientDelegateOpQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)_tasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_tasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int)_phase
{
  return self->__phase;
}

- (void)set_phase:(int)a3
{
  self->__phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tasks, 0);
  objc_storeStrong((id *)&self->__clientDelegateOpQueue, 0);
  objc_storeStrong((id *)&self->__clientDelegate, 0);
  objc_storeStrong((id *)&self->__locateOptions, 0);
  objc_storeStrong((id *)&self->__nsurlSession, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__logHandle, 0);
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id *v4;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  ACSURLSessionDataTask *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9877B48;
    v10 = v16;
    v16[4] = self;
    v17[1] = &v19;
    v4 = (id *)v17;
    v17[0] = v8;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E98774C0;
    v10 = v18;
    v18[4] = self;
  }
  v11 = (void *)MEMORY[0x1D82671C4](v10);
  v12 = -[ACSURLSessionDataTask initWithNSURLDataTaskCreator:initialRequest:forSession:]([ACSURLSessionDataTask alloc], "initWithNSURLDataTaskCreator:initialRequest:forSession:", v11, v7, self);
  v13 = (void *)v20[5];
  v20[5] = (uint64_t)v12;

  -[ACSURLSession _addTask:](self, "_addTask:", v20[5]);
  v14 = (id)v20[5];

  if (v9)
  _Block_object_dispose(&v19, 8);

  return v14;
}

id __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTaskWithRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  __int128 v9;
  _QWORD v10[5];
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E9877B20;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v6 = (id)v9;
  v11 = v9;
  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v4, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_4;
    v12[3] = &unk_1E9877AF8;
    v9 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "_dataTask:completedWithData:response:error:completionHandler:", v4, a2, a3, a4, v12);

  }
}

uint64_t __93__ACSURLSession_ACSURLSessionAsynchronousConvenience__dataTaskWithRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_internalState:", 2);
}

- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB39E0];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession dataTaskWithRequest:completionHandler:](self, "dataTaskWithRequest:completionHandler:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  ACSURLSessionUploadTask *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  if (v10)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_2;
    v20[3] = &unk_1E9877B70;
    v11 = v20;
    v20[4] = self;
    v12 = &v21;
    v21 = v9;
    v22[1] = &v25;
    v13 = (id *)v22;
    v14 = v10;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke;
    v23[3] = &unk_1E98774E8;
    v11 = v23;
    v23[4] = self;
    v13 = (id *)&v24;
    v14 = v9;
    v12 = (id *)&v24;
  }
  *v13 = v14;
  v15 = (void *)MEMORY[0x1D82671C4](v11);
  v16 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:]([ACSURLSessionUploadTask alloc], "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v15, v8, self);
  v17 = (void *)v26[5];
  v26[5] = (uint64_t)v16;

  -[ACSURLSession _addTask:](self, "_addTask:", v26[5]);
  v18 = (id)v26[5];

  if (v10)
  _Block_object_dispose(&v25, 8);

  return v18;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadTaskWithRequest:fromFile:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_3;
  v11[3] = &unk_1E9877B20;
  v6 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v7 = (id)v10;
  v12 = v10;
  objc_msgSend(v5, "uploadTaskWithRequest:fromFile:completionHandler:", v4, v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_4;
    v12[3] = &unk_1E9877AF8;
    v9 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "_dataTask:completedWithData:response:error:completionHandler:", v4, a2, a3, a4, v12);

  }
}

uint64_t __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromFile_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_internalState:", 2);
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  ACSURLSessionUploadTask *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  if (v10)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_2;
    v20[3] = &unk_1E9877B70;
    v11 = v20;
    v20[4] = self;
    v12 = &v21;
    v21 = v9;
    v22[1] = &v25;
    v13 = (id *)v22;
    v14 = v10;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke;
    v23[3] = &unk_1E98774E8;
    v11 = v23;
    v23[4] = self;
    v13 = (id *)&v24;
    v14 = v9;
    v12 = (id *)&v24;
  }
  *v13 = v14;
  v15 = (void *)MEMORY[0x1D82671C4](v11);
  v16 = -[ACSURLSessionUploadTask initWithNSURLUploadTaskCreator:initialRequest:forSession:]([ACSURLSessionUploadTask alloc], "initWithNSURLUploadTaskCreator:initialRequest:forSession:", v15, v8, self);
  v17 = (void *)v26[5];
  v26[5] = (uint64_t)v16;

  -[ACSURLSession _addTask:](self, "_addTask:", v26[5]);
  v18 = (id)v26[5];

  if (v10)
  _Block_object_dispose(&v25, 8);

  return v18;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadTaskWithRequest:fromData:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_3;
  v11[3] = &unk_1E9877B20;
  v6 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v7 = (id)v10;
  v12 = v10;
  objc_msgSend(v5, "uploadTaskWithRequest:fromData:completionHandler:", v4, v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_4;
    v12[3] = &unk_1E9877AF8;
    v9 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "_dataTask:completedWithData:response:error:completionHandler:", v4, a2, a3, a4, v12);

  }
}

uint64_t __104__ACSURLSession_ACSURLSessionAsynchronousConvenience__uploadTaskWithRequest_fromData_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_internalState:", 2);
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id *v4;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  ACSURLSessionDownloadTask *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9877B98;
    v10 = v16;
    v16[4] = self;
    v17[1] = &v19;
    v4 = (id *)v17;
    v17[0] = v8;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E9877538;
    v10 = v18;
    v18[4] = self;
  }
  v11 = (void *)MEMORY[0x1D82671C4](v10);
  v12 = -[ACSURLSessionDownloadTask initWithNSURLDownloadTaskCreator:initialRequest:forSession:]([ACSURLSessionDownloadTask alloc], "initWithNSURLDownloadTaskCreator:initialRequest:forSession:", v11, v7, self);
  v13 = (void *)v20[5];
  v20[5] = (uint64_t)v12;

  -[ACSURLSession _addTask:](self, "_addTask:", v20[5]);
  v14 = (id)v20[5];

  if (v9)
  _Block_object_dispose(&v19, 8);

  return v14;
}

id __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_nsurlSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadTaskWithRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  __int128 v9;
  _QWORD v10[5];
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_nsurlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E98776C8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v6 = (id)v9;
  v11 = v9;
  objc_msgSend(v5, "downloadTaskWithRequest:completionHandler:", v4, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_4;
    v12[3] = &unk_1E98776A0;
    v9 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "_downloadTask:completedWithLocation:response:error:completionHandler:", v4, a2, a3, a4, v12);

  }
}

uint64_t __97__ACSURLSession_ACSURLSessionAsynchronousConvenience__downloadTaskWithRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_nsurlTaskCreator:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_internalState:", 2);
}

- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB39E0];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSession downloadTaskWithRequest:completionHandler:](self, "downloadTaskWithRequest:completionHandler:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)initWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, v0, v1, "new session %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_cancelTask:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D4CDC000, v0, v1, "_cancelTask:%@ self=%@");
  OUTLINED_FUNCTION_3();
}

void __29__ACSURLSession__cancelTask___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, a2, a3, "_cancelTask:%@ task already completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_cancelDownloadTask:byProducingResumeData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, v0, v1, "_cancelDownloadTask:%@ task already completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_cancelDownloadTask:byProducingResumeData:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D4CDC000, v0, v1, "_cancelDownloadTask:%@ self=%@");
  OUTLINED_FUNCTION_3();
}

void __59__ACSURLSession__cancelDownloadTask_byProducingResumeData___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1D4CDC000, v0, OS_LOG_TYPE_FAULT, "ACSURLSession failed to convert resume data: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_suspendTask:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D4CDC000, v0, v1, "_suspendTask:%@ self=%@");
  OUTLINED_FUNCTION_3();
}

void __30__ACSURLSession__suspendTask___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, a2, a3, "_suspendTask:%@ task already completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_resumeTask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D4CDC000, v0, v1, "_resumeTask:%@ task is aleady completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_resumeTask:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D4CDC000, v0, v1, "_resumeTask:%@ self=%@");
  OUTLINED_FUNCTION_3();
}

@end
