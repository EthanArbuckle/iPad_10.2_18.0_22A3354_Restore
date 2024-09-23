@implementation CRKDownloadResourcesOperation

- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedCertificates:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKDownloadResourcesOperation *v11;
  uint64_t v12;
  NSArray *resources;
  uint64_t v14;
  NSArray *trustedCertificates;
  uint64_t v16;
  NSMutableArray *mFileURLs;
  uint64_t v18;
  NSMutableArray *mCompletedUnitCounts;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURLSession *mSession;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CRKDownloadResourcesOperation;
  v11 = -[CRKDownloadResourcesOperation init](&v26, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    resources = v11->_resources;
    v11->_resources = (NSArray *)v12;

    v14 = objc_msgSend(v10, "copy");
    trustedCertificates = v11->_trustedCertificates;
    v11->_trustedCertificates = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_clientIdentity, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    mFileURLs = v11->mFileURLs;
    v11->mFileURLs = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v18 = objc_claimAutoreleasedReturnValue();
    mCompletedUnitCounts = v11->mCompletedUnitCounts;
    v11->mCompletedUnitCounts = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDiscretionary:", 1);
    objc_msgSend(v20, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(v20, "setTimeoutIntervalForRequest:", 60.0);
    v21 = (void *)MEMORY[0x24BDB74B0];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sessionWithConfiguration:delegate:delegateQueue:", v20, v11, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    mSession = v11->mSession;
    v11->mSession = (NSURLSession *)v23;

  }
  return v11;
}

- (CRKDownloadResourcesOperation)initWithResources:(id)a3 clientIdentity:(id)a4 trustedAnchorCertificates:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKConcreteIdentity *v11;
  void *v12;
  CRKDownloadResourcesOperation *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CRKConcreteIdentity initWithIdentity:]([CRKConcreteIdentity alloc], "initWithIdentity:", v9);

  objc_msgSend(v8, "crk_mapUsingBlock:", &__block_literal_global_70);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CRKDownloadResourcesOperation initWithResources:clientIdentity:trustedCertificates:](self, "initWithResources:clientIdentity:trustedCertificates:", v10, v11, v12);
  return v13;
}

CRKConcreteCertificate *__92__CRKDownloadResourcesOperation_initWithResources_clientIdentity_trustedAnchorCertificates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRKConcreteCertificate *v3;

  v2 = a2;
  v3 = -[CRKConcreteCertificate initWithCertificate:]([CRKConcreteCertificate alloc], "initWithCertificate:", v2);

  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[CRKDownloadResourcesOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", &sel_run, 0, 0);
}

- (void)run
{
  void *v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSURLSession *mSession;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSArray *mDownloadTasks;
  void *v19;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  CRKDownloadResourcesOperation *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[CRKDownloadResourcesOperation resources](self, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (NSArray *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[CRKDownloadResourcesOperation resources](self, "resources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v23;
      *(_QWORD *)&v7 = 138543618;
      v20 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          mSession = self->mSession;
          objc_msgSend(v11, "hostedURL", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURLSession downloadTaskWithURL:](mSession, "downloadTaskWithURL:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "hostedURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "absoluteString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTaskDescription:", v16);

          objc_msgSend(v14, "resume");
          -[NSMutableArray addObject:](self->mCompletedUnitCounts, "addObject:", &unk_24DA08000);
          -[NSArray addObject:](v5, "addObject:", v14);
          _CRKLogOperation_0();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v27 = self;
            v28 = 2114;
            v29 = v11;
            _os_log_impl(&dword_218C99000, v17, OS_LOG_TYPE_INFO, "%{public}@: Downloading %{public}@", buf, 0x16u);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v8);
    }

    mDownloadTasks = self->mDownloadTasks;
    self->mDownloadTasks = v5;

    -[CRKDownloadResourcesOperation resources](self, "resources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKDownloadResourcesOperation setTotalUnitCount:](self, "setTotalUnitCount:", 1000 * objc_msgSend(v19, "count"));

  }
  else
  {
    -[CRKDownloadResourcesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", MEMORY[0x24BDBD1A8]);
  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKDownloadResourcesOperation;
  -[CRKDownloadResourcesOperation cancel](&v3, sel_cancel);
  -[CRKDownloadResourcesOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_cancelIfNeeded, 0, 0);
}

- (void)cancelIfNeeded
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDownloadResourcesOperation.m"), 110, CFSTR("%@ must be called from the main thread"), v5);

  }
  if (-[CRKDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    CATErrorWithCodeAndUserInfo();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v6);

  }
}

- (void)operationWillFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKDownloadResourcesOperation;
  -[CRKDownloadResourcesOperation operationWillFinish](&v3, sel_operationWillFinish);
  -[NSURLSession invalidateAndCancel](self->mSession, "invalidateAndCancel");
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  CRKDownloadResourcesOperation *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD, void *))a6;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDownloadResourcesOperation.m"), 124, CFSTR("%@ must be called from the main thread"), v13);

  }
  _CRKLogOperation_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "%{public}@: Did receive authentication challenge", buf, 0xCu);
  }

  if (-[CRKDownloadResourcesOperation isExecuting](self, "isExecuting")
    && (-[CRKDownloadResourcesOperation credential](self, "credential"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[CRKDownloadResourcesOperation credential](self, "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

  }
  else
  {
    v8[2](v8, 2, 0);
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  CRKDownloadResourcesOperation *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  _CRKLogOperation_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "taskDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)a6 / (double)a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@: Download of %{public}@ did progress %{public}@", buf, 0x20u);

  }
  v14 = -[NSArray indexOfObject:](self->mDownloadTasks, "indexOfObject:", v10);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 1000 * a6 / a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->mCompletedUnitCounts, "setObject:atIndexedSubscript:", v16, v15);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->mCompletedUnitCounts;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v17);
        v20 += objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v23);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  -[CRKDownloadResourcesOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", v20);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  CRKDownloadResourcesOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  CRKUnzipOperation *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  CRKDownloadResourcesOperation *v27;
  __int16 v28;
  CRKDownloadResourcesOperation *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = a4;
  objc_msgSend(v9, "taskDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = (CRKDownloadResourcesOperation *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileSize");

  _CRKLogOperation_0();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v27 = self;
    v28 = 2114;
    v29 = v11;
    v30 = 2048;
    v31 = v15;
    _os_log_impl(&dword_218C99000, v16, OS_LOG_TYPE_INFO, "%{public}@: Download task did finish downloading url %{public}@. File size: %lu bytes", buf, 0x20u);
  }

  -[CRKDownloadResourcesOperation resources](self, "resources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NSArray indexOfObject:](self->mDownloadTasks, "indexOfObject:", v9);

  objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "isZippedBundle"))
  {
    v25 = 0;
    -[CRKDownloadResourcesOperation moveURLToNonEphemeralLocation:withFileName:error:](self, "moveURLToNonEphemeralLocation:withFileName:error:", v7, 0, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;
    if (v20)
    {
      _CRKLogGeneral_8();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v11;
        _os_log_impl(&dword_218C99000, v22, OS_LOG_TYPE_INFO, "Unzipping %{public}@", buf, 0xCu);
      }

      v23 = -[CRKUnzipOperation initWithZipFileURL:]([CRKUnzipOperation alloc], "initWithZipFileURL:", v20);
      -[CRKUnzipOperation addTarget:selector:forOperationEvents:userInfo:](v23, "addTarget:selector:forOperationEvents:userInfo:", self, sel_unzipOperationDidFinish_forRequestURL_, 6, v11);
      objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addOperation:", v23);

    }
    else
    {
      -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v21);
    }

  }
  else
  {
    -[CRKDownloadResourcesOperation finalizeDownloadedItem:forRequestURL:](self, "finalizeDownloadedItem:forRequestURL:", v7, v11);
  }

}

- (id)moveURLToNonEphemeralLocation:(id)a3 withFileName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a5);

  v12 = 0;
  if (v11)
  {
    if (v8)
    {
      objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v7, v13, a5);

    if (v16)
      v12 = v13;
    else
      v12 = 0;

  }
  return v12;
}

- (void)unzipOperationDidFinish:(id)a3 forRequestURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }
  else
  {
    objc_msgSend(v7, "resultObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 4, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v11)
    {
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v11, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKDownloadResourcesOperation finalizeDownloadedItem:forRequestURL:](self, "finalizeDownloadedItem:forRequestURL:", v13, v6);
      }
      else
      {
        CRKErrorWithCodeAndUserInfo(22, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v13);
      }

    }
    else
    {
      -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v12);
    }

  }
}

- (void)finalizeDownloadedItem:(id)a3 forRequestURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CRKDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[CRKDownloadResourcesOperation moveURLToNonEphemeralLocation:withFileName:error:](self, "moveURLToNonEphemeralLocation:withFileName:error:", v6, v8, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    if (v9)
    {
      -[NSMutableArray addObject:](self->mFileURLs, "addObject:", v9);
      _CRKLogGeneral_8();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v7;
        _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "Finalized downloaded item for request URL %{public}@", buf, 0xCu);
      }

      v12 = -[NSMutableArray count](self->mFileURLs, "count");
      -[CRKDownloadResourcesOperation resources](self, "resources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 == v14)
      {
        -[CRKDownloadResourcesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", self->mFileURLs);
      }
      else
      {
        -[CRKDownloadResourcesOperation resources](self, "resources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        v17 = -[NSMutableArray count](self->mFileURLs, "count");

        _CRKLogGeneral_8();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16 - v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v19;
          _os_log_impl(&dword_218C99000, v18, OS_LOG_TYPE_INFO, "Not ending the operation because there are %{public}@ items yet to be finalized", buf, 0xCu);

        }
      }
    }
    else
    {
      -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v10);
    }

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && -[CRKDownloadResourcesOperation isExecuting](self, "isExecuting"))
    -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v9);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;

  v5 = a4;
  if (-[CRKDownloadResourcesOperation isExecuting](self, "isExecuting"))
    -[CRKDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v5);

}

- (NSURLCredential)credential
{
  NSURLCredential *credential;
  NSURLCredential *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSURLCredential *v9;
  NSURLCredential *v10;
  NSURLCredential *v11;

  credential = self->_credential;
  if (credential)
  {
    v3 = credential;
  }
  else
  {
    -[CRKDownloadResourcesOperation trustedCertificates](self, "trustedCertificates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "crk_mapUsingBlock:", &__block_literal_global_28_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)MEMORY[0x24BDB7480];
      -[CRKDownloadResourcesOperation clientIdentity](self, "clientIdentity");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "credentialWithIdentity:certificates:persistence:", objc_msgSend(v8, "underlyingIdentity"), v6, 0);
      v9 = (NSURLCredential *)objc_claimAutoreleasedReturnValue();

      v10 = self->_credential;
      self->_credential = v9;
      v11 = v9;

      v3 = self->_credential;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

uint64_t __43__CRKDownloadResourcesOperation_credential__block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "underlyingCertificate");
}

- (NSArray)resources
{
  return self->_resources;
}

- (CRKIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (NSArray)trustedCertificates
{
  return self->_trustedCertificates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCertificates, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->mCompletedUnitCounts, 0);
  objc_storeStrong((id *)&self->mFileURLs, 0);
  objc_storeStrong((id *)&self->mDownloadTasks, 0);
  objc_storeStrong((id *)&self->mSession, 0);
}

@end
