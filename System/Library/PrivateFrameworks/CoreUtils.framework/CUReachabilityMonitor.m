@implementation CUReachabilityMonitor

- (CUReachabilityMonitor)init
{
  CUReachabilityMonitor *v2;
  CUReachabilityMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUReachabilityMonitor;
  v2 = -[CUReachabilityMonitor init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3 = v2;
  }

  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CUReachabilityMonitor_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSURL *v7;
  NSURL *destinationURL;
  OS_dispatch_source *v9;
  OS_dispatch_source *timeoutTimer;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  dispatch_time_t v14;
  _QWORD handler[5];

  if (!self->_urlSession)
  {
    if (!self->_destinationURL)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://captive.apple.com"));
      v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
      destinationURL = self->_destinationURL;
      self->_destinationURL = v7;

    }
    self->_downloadStatus = 1;
    if (self->_timeout <= 0.0)
    {
      if (gLogCategory_CUReachability <= 30
        && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _activate]", 0x1Eu, (uint64_t)"Activate <%@>, no timeout\n", v2, v3, v4, v5, (uint64_t)self->_destinationURL);
      }
    }
    else
    {
      if (gLogCategory_CUReachability <= 30
        && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _activate]", 0x1Eu, (uint64_t)"Activate <%@>, %f second timeout\n", v2, v3, v4, v5, (uint64_t)self->_destinationURL);
      }
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      timeoutTimer = self->_timeoutTimer;
      self->_timeoutTimer = v9;

      v11 = self->_timeoutTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34__CUReachabilityMonitor__activate__block_invoke;
      handler[3] = &unk_1E25DF2A0;
      handler[4] = self;
      dispatch_source_set_event_handler(v11, handler);
      v12 = self->_timeoutTimer;
      v13 = (unint64_t)(self->_timeout * 1000000000.0);
      v14 = dispatch_time(0, v13);
      dispatch_source_set_timer(v12, v14, 0xFFFFFFFFFFFFFFFFLL, v13 >> 2);
      dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    }
    -[CUReachabilityMonitor _startDownload](self, "_startDownload");
  }
}

- (void)_startDownload
{
  void *v3;
  NSURLSession *v4;
  NSURLSession *urlSession;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiscretionary:", 0);
  objc_msgSend(v3, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v3, "setHTTPCookieStorage:", 0);
  objc_msgSend(v3, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v3, "setRequestCachePolicy:", 1);
  objc_msgSend(v3, "setURLCredentialStorage:", 0);
  objc_msgSend(v3, "setURLCache:", 0);
  objc_msgSend(v3, "setWaitsForConnectivity:", 1);
  v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v19, "setUnderlyingQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v3, self, v19);
  v4 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  urlSession = self->_urlSession;
  self->_urlSession = v4;

  if (self->_urlSession)
  {
    v12 = self->_destinationURL;
    -[NSURLSession downloadTaskWithURL:](self->_urlSession, "downloadTaskWithURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v15 = v13;
      LODWORD(v14) = 1.0;
      objc_msgSend(v13, "setPriority:", v14);
      objc_msgSend(v15, "resume");
      goto LABEL_4;
    }
    v16 = "Create DownloadTask failed";
  }
  else
  {
    v12 = 0;
    v16 = "Create NSURLSession failed";
  }
  NSErrorWithOSStatusF(4294960596, (uint64_t)v16, v6, v7, v8, v9, v10, v11, v18);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_5;
  v15 = (void *)v17;
  -[CUReachabilityMonitor _complete:](self, "_complete:", v17);
LABEL_4:

LABEL_5:
}

- (void)_complete:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t downloadStatus;
  id *p_completionHandler;
  _BOOL4 v13;
  id v14;
  OS_dispatch_source *timeoutTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  NSURLSession *urlSession;
  uint64_t v19;
  id v20;
  id v21;

  v4 = a3;
  if (!v4)
  {
    downloadStatus = self->_downloadStatus;
    if (!(_DWORD)downloadStatus)
    {
      p_completionHandler = &self->_completionHandler;
      if (!self->_completionHandler)
      {
        v21 = 0;
        goto LABEL_20;
      }
      goto LABEL_11;
    }
    NSErrorWithOSStatusF(downloadStatus, (uint64_t)"Download failed", v5, v6, v7, v8, v9, v10, v19);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_completionHandler = &self->_completionHandler;
  if (!self->_completionHandler)
  {
    v21 = v4;
    goto LABEL_20;
  }
  if (!v4)
  {
LABEL_11:
    if (gLogCategory_CUReachability <= 30
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _complete:]", 0x1Eu, (uint64_t)"Reachable: <%@>\n", v7, v8, v9, v10, (uint64_t)self->_destinationURL);
    }
    v4 = 0;
    goto LABEL_19;
  }
  if (gLogCategory_CUReachability <= 60)
  {
    v20 = v4;
    if (gLogCategory_CUReachability != -1
      || (v13 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu), v4 = v20, v13))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _complete:]", 0x3Cu, (uint64_t)"### Not reachable <%@>: %{error}\n", v7, v8, v9, v10, (uint64_t)self->_destinationURL);
      v4 = v20;
    }
  }
LABEL_19:
  v21 = v4;
  (*((void (**)(void))*p_completionHandler + 2))();
  v14 = *p_completionHandler;
  *p_completionHandler = 0;

LABEL_20:
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v16 = timeoutTimer;
    dispatch_source_cancel(v16);
    v17 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  urlSession = self->_urlSession;
  self->_urlSession = 0;

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CUReachabilityMonitor_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  stat v26;
  char v27[1024];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v27[0] = 0;
  if (objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v27, 1024))
  {
    memset(&v26, 0, sizeof(v26));
    v11 = stat(v27, &v26);
    if ((unint64_t)(v26.st_size - 1001) >= 0xFFFFFFFFFFFFFC18)
      v12 = 0;
    else
      v12 = -6743;
    if (v11)
      v13 = v11;
    else
      v13 = v12;
    if (!v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 2, 0);
      v15 = v14;
      if (v14)
      {
        v16 = objc_retainAutorelease(v14);
        v17 = (const char *)objc_msgSend(v16, "bytes");
        if (strncasestr(v17, "<BODY>Success</BODY>", objc_msgSend(v16, "length")))
        {

          self->_downloadStatus = 0;
          if (gLogCategory_CUReachability <= 30
            && (gLogCategory_CUReachability != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x1Eu, (uint64_t)"Downloaded to <%@>, %lld bytes\n", v22, v23, v24, v25, (uint64_t)v6);
          }
          goto LABEL_19;
        }
        if (gLogCategory_CUReachability <= 60
          && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x3Cu, (uint64_t)"### Downloaded content mismatch:\n%.2H\n", v18, v19, v20, v21, (uint64_t)v17);
        }
        v13 = -6748;
      }
      else
      {
        v13 = -6755;
      }

    }
  }
  else
  {
    v13 = -6704;
  }
  self->_downloadStatus = v13;
  if (gLogCategory_CUReachability <= 60
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x3Cu, (uint64_t)"### Downloaded to <%@> bad: %#m\n", v7, v8, v9, v10, (uint64_t)v6);
  }
LABEL_19:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSURLSession *urlSession;
  id v11;

  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v11, "code") == -1001)
  {
    if (gLogCategory_CUReachability <= 60
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:task:didCompleteWithError:]", 0x3Cu, (uint64_t)"### CFURL timeout for <%@>: %{error}, retrying...\n", v6, v7, v8, v9, (uint64_t)self->_destinationURL);
    }
    -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
    urlSession = self->_urlSession;
    self->_urlSession = 0;

    -[CUReachabilityMonitor _startDownload](self, "_startDownload");
  }
  else
  {
    -[CUReachabilityMonitor _complete:](self, "_complete:", v11);
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

void __35__CUReachabilityMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  id v11;

  if (gLogCategory_CUReachability <= 30
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v10);
  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[4])
  {
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", a3, a4, a5, a6, a7, a8, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_complete:", v11);

  }
  else
  {
    objc_msgSend(v9, "_complete:", 0);
  }
}

void __34__CUReachabilityMonitor__activate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char **v7;
  const char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB2F90];
  v15 = *MEMORY[0x1E0CB2D50];
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (MEMORY[0x1E0D1B9C8] && (v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0))
  {
    if (*(_DWORD *)v5 != -6722)
    {
      v7 = (const char **)(v5 + 24);
      v6 = "";
      while (1)
      {
        v8 = *v7;
        if (!*v7)
          break;
        v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6722)
        {
          v6 = v8;
          break;
        }
      }
    }
  }
  else
  {
    v6 = "";
  }
  objc_msgSend(v4, "stringWithUTF8String:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("?");
  if (v10)
    v12 = (const __CFString *)v10;
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6722, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_complete:", v14);

}

uint64_t __33__CUReachabilityMonitor_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

@end
