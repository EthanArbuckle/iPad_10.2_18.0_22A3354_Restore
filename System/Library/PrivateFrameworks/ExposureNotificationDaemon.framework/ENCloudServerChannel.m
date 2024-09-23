@implementation ENCloudServerChannel

- (ENCloudServerChannel)init
{
  ENCloudServerChannel *v2;
  id v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ENCloudServerChannel;
  v2 = -[ENCloudServerChannel init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3820]);
    -[ENCloudServerChannel setQueue:](v2, "setQueue:", v3);

    -[ENCloudServerChannel queue](v2, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.bluetooth.serverChannel", v5);
    -[ENCloudServerChannel setSerialQueue:](v2, "setSerialQueue:", v6);

    objc_msgSend(MEMORY[0x1E0C92CA8], "defaultSessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel setSessionConfig:](v2, "setSessionConfig:", v7);

    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURLCache:", 0);

    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestCachePolicy:", 1);

    -[ENCloudServerChannel cookieStorage](v2, "cookieStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHTTPCookieStorage:", v10);

    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWaitsForConnectivity:", 1);

    ENBundleIdentifierForURLSessions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set_sourceApplicationBundleIdentifier:", v13);

    v15 = (void *)MEMORY[0x1E0C92C90];
    -[ENCloudServerChannel sessionConfig](v2, "sessionConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionWithConfiguration:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel setSession:](v2, "setSession:", v17);

    -[ENCloudServerChannel serialQueue](v2, "serialQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel session](v2, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUnderlyingQueue:", v18);

    objc_msgSend(MEMORY[0x1E0C99E00], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCloudServerChannel setRequests:](v2, "setRequests:", v21);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ENCloudServerChannel requests](self, "requests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)ENCloudServerChannel;
  -[ENCloudServerChannel dealloc](&v4, sel_dealloc);
}

- (void)enqueueRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[6];
  id v11;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENCloudServerChannel <= 30
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v8 = v6;
  if (v8)
  {
    -[ENCloudServerChannel serialQueue](self, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke;
    block[3] = &unk_1E87D9D18;
    block[4] = v8;
    block[5] = self;
    v11 = v7;
    dispatch_async(v9, block);

  }
}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id location;

  v2 = (void *)MEMORY[0x1E0C92C30];
  objc_msgSend(a1[4], "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithURL:cachePolicy:timeoutInterval:", v3, 1, 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "httpMethodString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPMethod:", v5);

  objc_msgSend(a1[4], "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllHTTPHeaderFields:", v6);

  objc_msgSend(a1[4], "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setHTTPBody:", v7);
  location = 0;
  objc_initWeak(&location, a1[5]);
  objc_msgSend(a1[5], "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_2;
  v14[3] = &unk_1E87D9CF0;
  objc_copyWeak(&v17, &location);
  v14[4] = a1[4];
  v9 = v4;
  v15 = v9;
  v16 = a1[6];
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "requests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "requestID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  objc_msgSend(v10, "resume");
  if (gLogCategory_ENCloudServerChannel <= 30
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(a1[5], "requests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void (**v23)(id, uint64_t, void *, void *, id);
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id val;
  id *v36;
  void *v37;
  _QWORD block[5];
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v7 = a3;
  v34 = a4;
  v36 = a1;
  val = objc_loadWeakRetained(a1 + 7);
  v32 = v7;
  v37 = (void *)objc_msgSend(v7, "copy");
  if (gLogCategory_ENCloudServerChannel <= 10
    && (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(a1[4], "url");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v45 = 0u;
  objc_msgSend(a1[5], "allHTTPHeaderFields", v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        if (gLogCategory_ENCloudServerChannel <= 30)
        {
          v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize())
          {
            objc_msgSend(v36[5], "allHTTPHeaderFields", v28, v30);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v12);
            v28 = v12;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v9);
  }

  if (gLogCategory__ENCloudServerChannel <= 30
    && (gLogCategory__ENCloudServerChannel != -1 || _LogCategory_Initialize()))
  {
    v14 = objc_msgSend(v37, "statusCode", v28, v30);
    objc_msgSend(v37, "allHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("x-apple-request-uuid"));
    v28 = v14;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v37, "allHeaderFields", v28, v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v16);
        if (gLogCategory_ENCloudServerChannel <= 30)
        {
          v20 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          if (gLogCategory_ENCloudServerChannel != -1 || _LogCategory_Initialize())
          {
            objc_msgSend(v37, "allHeaderFields", v29, v31);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v20);
            v29 = v20;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v17);
  }

  location = 0;
  objc_initWeak(&location, val);
  objc_msgSend(val, "serialQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_3;
  block[3] = &unk_1E87D9CC8;
  objc_copyWeak(&v39, &location);
  block[4] = v36[4];
  dispatch_async(v22, block);

  v23 = (void (**)(id, uint64_t, void *, void *, id))v36[6];
  if (v23)
  {
    v24 = objc_msgSend(v37, "statusCode");
    objc_msgSend(v37, "allHeaderFields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v33, "copy");
    v23[2](v23, v24, v25, v26, v34);

  }
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

void __54__ENCloudServerChannel_enqueueRequest_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (NSHTTPCookieStorage)cookieStorage
{
  NSHTTPCookieStorage *cookieStorage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  size_t v10;
  CFURLRef v11;
  const void *v12;
  void *v13;

  cookieStorage = self->_cookieStorage;
  if (!cookieStorage)
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.bluetooth.serverChannel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("cookies"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = strlen(v9);
    v11 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE08], (const UInt8 *)v9, v10, 1u);
    v12 = (const void *)CFHTTPCookieStorageCreateFromFile();
    CFRunLoopGetMain();
    CFHTTPCookieStorageScheduleWithRunLoop();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C10]), "_initWithCFHTTPCookieStorage:", v12);
    -[ENCloudServerChannel setCookieStorage:](self, "setCookieStorage:", v13);

    if (v11)
      CFRelease(v11);
    if (v12)
      CFRelease(v12);

    cookieStorage = self->_cookieStorage;
  }
  return cookieStorage;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionConfiguration)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfig, a3);
}

- (NSURLSession)sourceApplicationSession
{
  return self->_sourceApplicationSession;
}

- (void)setSourceApplicationSession:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationSession, a3);
}

- (NSURLSessionConfiguration)sourceApplicationSessionConfig
{
  return self->_sourceApplicationSessionConfig;
}

- (void)setSourceApplicationSessionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationSessionConfig, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setCookieStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cookieStorage, a3);
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSessionConfig, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSession, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
