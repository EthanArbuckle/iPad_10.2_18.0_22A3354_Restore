@implementation AAS3DownloadSession

- (AAS3DownloadSession)initWithURL:(id)a3 streamBase:(id *)a4 maxAttempts:(unsigned int)a5 pauseInterval:(float)a6 maxRequestsInFlight:(unsigned int)a7
{
  id v13;
  AAS3DownloadSession *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  AAS3Context_impl *var2;
  id v20;
  uint64_t i;
  const char *v22;
  size_t v23;
  size_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  NSURLSession *v35;
  NSURLSession *urlSession;
  NSMutableSet *v37;
  NSMutableSet *requests;
  NSLock *v39;
  NSLock *requestsLock;
  int v41;
  float v42;
  intptr_t v43;
  dispatch_semaphore_t v44;
  OS_dispatch_semaphore *requestsSem;
  NSLock *v46;
  NSLock *cacheLock;
  NSData *cache;
  AAS3DownloadSession *v49;
  char v51;
  id obj;
  $D452A9A0134E67C03F556B10F78AA492 *v53;
  unsigned int v54;
  unsigned int v55;
  id v56;
  id v57;
  objc_super v58;

  v13 = a3;
  v58.receiver = self;
  v58.super_class = (Class)AAS3DownloadSession;
  v14 = -[AAS3DownloadSession init](&v58, sel_init);
  if (v14)
  {
    obj = a3;
    v54 = a5;
    v55 = a7;
    v57 = v13;
    v56 = (id)objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v53 = a4;
    var2 = a4->var2;
    if (*((_QWORD *)var2 + 348))
    {
      v20 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      objc_msgSend(v18, "setValue:forKey:", v20, CFSTR("User-Agent"));

    }
    for (i = *((_QWORD *)var2 + 349); i; i = *(_QWORD *)(i + 8))
    {
      v22 = *(const char **)i;
      if (*(_QWORD *)i)
      {
        v23 = strlen(*(const char **)i);
        v24 = v23 + 1;
        if (v23 + 1 < 0x2000000001)
        {
          v25 = (char *)malloc(v23 + 1);
          if (v25)
          {
            v26 = v25;
            memcpy(v25, v22, v24);
            v27 = strchr(v26, 58);
            if (v27)
            {
              *v27 = 0;
              v30 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v27 + 1);
              v31 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v26);
              objc_msgSend(v18, "setValue:forKey:", v30, v31);

            }
            else
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]", 252, 121, 0, "invalid header: %s", v28, v29, (char)v26);
            }
            free(v26);
            continue;
          }
        }
        else
        {
          *__error() = 12;
        }
      }
      v32 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]", 250, 121, *v32, "malloc", v33, v34, v51);
    }
    if (*((_QWORD *)var2 + 350))
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]", 259, 121, "Non supported options in AAS3DownloadSession (ignored): proxy_headers %s", v15, v16, v17, *((_QWORD *)var2 + 350));
    if (*((_QWORD *)var2 + 346))
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]", 260, 121, "Non supported options in AAS3DownloadSession (ignored): pinned_public_key %s", v15, v16, v17, *((_QWORD *)var2 + 346));
    if (*((_QWORD *)var2 + 347))
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]", 261, 121, "Non supported options in AAS3DownloadSession (ignored): proxy_pinned_public_key %s", v15, v16, v17, *((_QWORD *)var2 + 347));
    objc_msgSend(v56, "setHTTPAdditionalHeaders:", v18);
    objc_msgSend(v56, "setHTTPMaximumConnectionsPerHost:", 16);
    objc_msgSend(v56, "setTimeoutIntervalForRequest:", 120.0);
    objc_msgSend(v56, "setTimeoutIntervalForResource:", 1200.0);
    v35 = (NSURLSession *)(id)objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:", v56);
    urlSession = v14->_urlSession;
    v14->_urlSession = v35;

    objc_storeStrong((id *)&v14->_url, obj);
    v14->_streamBase = v53;
    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    requests = v14->_requests;
    v14->_requests = v37;

    v39 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    requestsLock = v14->_requestsLock;
    v14->_requestsLock = v39;

    if (v54)
      v41 = v54;
    else
      v41 = 5;
    v42 = 250.0;
    if (a6 != 0.0)
      v42 = a6;
    v14->_pauseInterval = v42;
    if (v55)
      v43 = v55;
    else
      v43 = 16;
    v14->_maxRequests = v43;
    v14->_maxAttempts = v41;
    v44 = dispatch_semaphore_create(v43);
    requestsSem = v14->_requestsSem;
    v14->_requestsSem = (OS_dispatch_semaphore *)v44;

    atomic_store(0, &v14->_bytesDownloaded);
    v46 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    cacheLock = v14->_cacheLock;
    v14->_cacheLock = v46;

    cache = v14->_cache;
    v14->_cache = 0;

    v49 = v14;
    v13 = v57;
  }

  return v14;
}

- (int)addRequest:(id)a3
{
  id v4;
  OS_dispatch_semaphore *v5;
  dispatch_time_t v6;
  intptr_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSLock *v11;
  NSMutableSet *v12;
  NSLock *v13;
  char v15;

  v4 = a3;
  v5 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
  v6 = dispatch_time(0, 600000000000);
  v7 = dispatch_semaphore_wait((dispatch_semaphore_t)v5, v6);

  if (v7)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession addRequest:]", 292, 121, 0, "euqueueRequest timed out", v8, v9, v15);
    v10 = -1;
  }
  else
  {
    v11 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
    -[NSLock lock](v11, "lock");

    v12 = -[AAS3DownloadSession requests](self, "requests");
    -[NSMutableSet addObject:](v12, "addObject:", v4);

    v13 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
    -[NSLock unlock](v13, "unlock");

    v10 = 0;
  }

  return v10;
}

- (void)removeRequest:(id)a3
{
  id v4;
  NSLock *v5;
  NSMutableSet *v6;
  NSLock *v7;
  OS_dispatch_semaphore *v8;

  v4 = a3;
  v5 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
  -[NSLock lock](v5, "lock");

  v6 = -[AAS3DownloadSession requests](self, "requests");
  -[NSMutableSet removeObject:](v6, "removeObject:", v4);

  v7 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
  -[NSLock unlock](v7, "unlock");

  v8 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
  dispatch_semaphore_signal((dispatch_semaphore_t)v8);

}

- (id)enqueueRequestWithSize:(unint64_t)a3 atOffset:(int64_t)a4 destinationBuffer:(char *)a5 destinationStream:(AAAsyncByteStream_impl *)a6 completionSemaphore:(id)a7
{
  id v12;
  AAS3DownloadRequest *v13;
  uint64_t v14;
  uint64_t v15;
  AAS3DownloadRequest *v16;
  const char *v17;
  __int16 v18;
  char v20;

  v12 = a7;
  v13 = -[AAS3DownloadRequest initWithSession:size:atOffset:destinationBuffer:destinationStream:completionSemaphore:]([AAS3DownloadRequest alloc], "initWithSession:size:atOffset:destinationBuffer:destinationStream:completionSemaphore:", self, a3, a4, a5, a6, v12);

  if (!v13)
  {
    v17 = "Request creation";
    v18 = 332;
LABEL_8:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:]", v18, 121, 0, v17, v14, v15, v20);
    v16 = 0;
    goto LABEL_9;
  }
  if (-[AAS3DownloadSession addRequest:](self, "addRequest:", v13) < 0)
  {
    v17 = "addRequest";
    v18 = 335;
    goto LABEL_8;
  }
  if (-[AAS3DownloadRequest createAndResumeTask](v13, "createAndResumeTask") < 0)
  {
    v17 = "createTask";
    v18 = 338;
    goto LABEL_8;
  }
  v16 = v13;
LABEL_9:

  return v16;
}

- (void)addBytesDownloaded:(unint64_t)a3
{
  unint64_t *p_bytesDownloaded;
  unint64_t v4;

  p_bytesDownloaded = &self->_bytesDownloaded;
  do
    v4 = __ldxr(p_bytesDownloaded);
  while (__stxr(v4 + a3, p_bytesDownloaded));
}

- (int64_t)readToBuffer:(void *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5
{
  NSLock *v9;
  NSData *v10;
  NSData *v11;
  int64_t v12;
  NSData *v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  size_t v17;
  NSLock *v18;
  id v19;
  NSObject *v20;
  NSLock *v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_time_t v24;
  const char *v25;
  __int16 v26;
  char v28;

  v9 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock lock](v9, "lock");

  v10 = -[AAS3DownloadSession cache](self, "cache");
  if (!v10)
  {
    v21 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock unlock](v21, "unlock");

    v20 = dispatch_semaphore_create(0);
    v19 = -[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:](self, "enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:", a4, a5, a3, 0, v20);
    if (v19)
    {
      v24 = dispatch_time(0, 600000000000);
      if (dispatch_semaphore_wait(v20, v24))
      {
        v25 = "Request timed out";
        v26 = 384;
      }
      else
      {
        if ((int)objc_msgSend(v19, "status") > 0)
          goto LABEL_14;
        v25 = "Request failed";
        v26 = 386;
      }
    }
    else
    {
      v25 = "enqueueRequest";
      v26 = 380;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession readToBuffer:size:atOffset:]", v26, 121, 0, v25, v22, v23, v28);
    a4 = -1;
    goto LABEL_14;
  }
  v11 = -[AAS3DownloadSession cache](self, "cache");
  v12 = -[NSData length](v11, "length");

  v13 = objc_retainAutorelease(-[AAS3DownloadSession cache](self, "cache"));
  v14 = -[NSData bytes](v13, "bytes");

  v15 = a5 & ~(a5 >> 63);
  v16 = a5 + a4;
  if (v12 < (uint64_t)(a5 + a4))
    v16 = v12;
  v17 = v16 - v15;
  if (v16 > v15)
    memcpy(a3, (const void *)(v14 + v15), v17);
  v18 = -[AAS3DownloadSession cacheLock](self, "cacheLock", v17);
  -[NSLock unlock](v18, "unlock");

  v19 = 0;
  v20 = 0;
LABEL_14:

  return a4;
}

- (int)syncRequests
{
  int v3;
  OS_dispatch_semaphore *v4;
  dispatch_time_t v5;
  intptr_t v6;
  uint64_t v7;
  uint64_t v8;
  int result;
  unsigned int v10;
  OS_dispatch_semaphore *v11;
  char v12;

  if (-[AAS3DownloadSession maxRequests](self, "maxRequests"))
  {
    v3 = 0;
    while (1)
    {
      v4 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
      v5 = dispatch_time(0, 600000000000);
      v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v4, v5);

      if (v6)
        break;
      if (++v3 >= -[AAS3DownloadSession maxRequests](self, "maxRequests"))
        goto LABEL_5;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession syncRequests]", 401, 121, 0, "Request timed out", v7, v8, v12);
    return -1;
  }
  else
  {
LABEL_5:
    result = -[AAS3DownloadSession maxRequests](self, "maxRequests");
    if (result)
    {
      v10 = 0;
      do
      {
        v11 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
        dispatch_semaphore_signal((dispatch_semaphore_t)v11);

        ++v10;
      }
      while (v10 < -[AAS3DownloadSession maxRequests](self, "maxRequests"));
      return 0;
    }
  }
  return result;
}

- (int)readToAsyncByteStream:(AAAsyncByteStream_impl *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5
{
  NSLock *v9;
  NSData *v10;
  NSData *v11;
  NSData *v12;
  int v13;
  int v14;
  NSLock *v15;
  uint64_t v16;
  uint64_t v17;
  NSLock *v18;
  id v19;
  char v21;

  if (a4)
  {
    v9 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock lock](v9, "lock");

    v10 = -[AAS3DownloadSession cache](self, "cache");
    if (v10)
    {
      v11 = -[AAS3DownloadSession cache](self, "cache");
      -[NSData length](v11, "length");

      v12 = objc_retainAutorelease(-[AAS3DownloadSession cache](self, "cache"));
      -[NSData bytes](v12, "bytes");

      AAAsyncByteStreamProcess();
      v18 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
      -[NSLock unlock](v18, "unlock");

      v19 = 0;
LABEL_7:
      v14 = 0;
      goto LABEL_8;
    }
    v15 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock unlock](v15, "unlock");

    v19 = -[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:](self, "enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:", a4, a5, 0, a3, 0);
    if (v19)
      goto LABEL_7;
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadSession readToAsyncByteStream:size:atOffset:]", 451, 121, 0, "enqueueRequest", v16, v17, v21);
    v19 = 0;
    v14 = -1;
  }
  else
  {
    v13 = -[AAS3DownloadSession syncRequests](self, "syncRequests", a3, 0, a5);
    v19 = 0;
    v14 = v13 >> 31;
  }
LABEL_8:

  return v14;
}

+ (void)completeRequest:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  size_t v29;
  size_t v30;
  uint64_t v31;
  const void *v32;
  unint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  float v45;
  float v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  char v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (id)objc_msgSend(v9, "downloadSession");
  v14 = objc_msgSend(v11, "statusCode");
  if (objc_msgSend(v13, "isCancelled") || v12 && objc_msgSend(v12, "code") == -999)
  {
LABEL_2:
    v18 = 1;
    goto LABEL_3;
  }
  switch(v14)
  {
    case 416:
      objc_msgSend(objc_retainAutorelease(v10), "bytes");
      if (objc_msgSend(v9, "stream"))
      {
        objc_msgSend(v9, "stream");
        objc_msgSend(v9, "offset");
        AAAsyncByteStreamProcess();
      }
      goto LABEL_2;
    case 206:
      v21 = objc_msgSend(v10, "length");
      v33 = objc_msgSend(v9, "nbyte");
      if (v21 >= v33)
        v30 = v33;
      else
        v30 = v21;
      v32 = (const void *)objc_msgSend(objc_retainAutorelease(v10), "bytes");
LABEL_27:
      if (objc_msgSend(v9, "buf"))
        memcpy((void *)objc_msgSend(v9, "buf"), v32, v30);
      if (objc_msgSend(v9, "stream"))
      {
        objc_msgSend(v9, "stream");
        objc_msgSend(v9, "offset");
        AAAsyncByteStreamProcess();
      }
      objc_msgSend(v13, "addBytesDownloaded:", v21);
      goto LABEL_2;
    case 200:
      v21 = objc_msgSend(v10, "length");
      v22 = objc_retainAutorelease(v10);
      v23 = objc_msgSend(v22, "bytes");
      objc_msgSend(v13, "cacheDocument:", v22);
      v24 = objc_msgSend(v9, "offset");
      v25 = v24 & ~(v24 >> 63);
      v26 = objc_msgSend(v9, "offset");
      v27 = objc_msgSend(v9, "nbyte") + v26;
      if (v21 < v27)
        v27 = v21;
      v28 = v27 <= v25;
      v29 = v27 - v25;
      if (v28)
        v30 = 0;
      else
        v30 = v29;
      if (v28)
        v31 = 0;
      else
        v31 = v25;
      v32 = (const void *)(v23 + v31);
      goto LABEL_27;
  }
  if (v12 && (v34 = (id)objc_msgSend(v12, "description")) != 0)
  {
    v35 = objc_retainAutorelease(v34);
    objc_msgSend(v35, "UTF8String");
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]", 546, 121, "Request failed: %03ld %s", v36, v37, v38, v14);

  }
  else
  {
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]", 547, 121, "Request failed: %03ld (error not set)", v15, v16, v17, v14);
  }
  if (objc_msgSend(v9, "remainingAttempts"))
  {
    objc_msgSend(v9, "pauseInterval");
    v40 = v39;
    objc_msgSend(v9, "nbyte");
    objc_msgSend(v9, "offset");
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]", 554, 121, "Retrying request after %.0f seconds %zu bytes at offset %llu", v41, v42, v43, SLOBYTE(v40));
    v44 = (void *)MEMORY[0x24BDD17F0];
    objc_msgSend(v9, "pauseInterval");
    objc_msgSend(v44, "sleepForTimeInterval:", v45);
    objc_msgSend(v9, "pauseInterval");
    *(float *)&v47 = v46 + v46;
    objc_msgSend(v9, "setPauseInterval:", v47);
    if ((objc_msgSend(v9, "createAndResumeTask") & 0x80000000) == 0)
      goto LABEL_6;
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]", 561, 121, 0, "createTask", v48, v49, v50);
  }
  v18 = 0xFFFFFFFFLL;
LABEL_3:
  objc_msgSend(v9, "setStatus:", v18);
  v19 = (id)objc_msgSend(v9, "sem");

  if (v19)
  {
    v20 = (id)objc_msgSend(v9, "sem");
    dispatch_semaphore_signal(v20);

  }
  objc_msgSend(v13, "removeRequest:", v9);
LABEL_6:

}

- (void)invalidateAndCancel
{
  int *p_cancelled;
  NSURLSession *v5;

  p_cancelled = &self->_cancelled;
  while (!__ldaxr((unsigned int *)p_cancelled))
  {
    if (!__stlxr(1u, (unsigned int *)p_cancelled))
      goto LABEL_6;
  }
  __clrex();
LABEL_6:
  v5 = -[AAS3DownloadSession urlSession](self, "urlSession");
  -[NSURLSession invalidateAndCancel](v5, "invalidateAndCancel");

  -[AAS3DownloadSession syncRequests](self, "syncRequests");
}

- (int)isCancelled
{
  return atomic_load((unsigned int *)&self->_cancelled);
}

- (void)cacheDocument:(id)a3
{
  id v4;
  NSLock *v5;
  NSData *v6;
  NSLock *v7;

  v4 = a3;
  v5 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock lock](v5, "lock");

  v6 = -[AAS3DownloadSession cache](self, "cache");
  if (!v6)
    -[AAS3DownloadSession setCache:](self, "setCache:", v4);
  v7 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock unlock](v7, "unlock");

}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- ($D452A9A0134E67C03F556B10F78AA492)streamBase
{
  return self->_streamBase;
}

- (NSMutableSet)requests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_semaphore)requestsSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)maxRequests
{
  return self->_maxRequests;
}

- (NSLock)requestsLock
{
  return (NSLock *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)maxAttempts
{
  return self->_maxAttempts;
}

- (float)pauseInterval
{
  return self->_pauseInterval;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(int)a3
{
  self->_cancelled = a3;
}

- (NSLock)cacheLock
{
  return (NSLock *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)cache
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_requestsLock, 0);
  objc_storeStrong((id *)&self->_requestsSem, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
