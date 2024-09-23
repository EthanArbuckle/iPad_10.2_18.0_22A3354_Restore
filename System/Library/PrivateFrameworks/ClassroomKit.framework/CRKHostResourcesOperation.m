@implementation CRKHostResourcesOperation

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKHostResourcesConfiguration *v11;
  CRKHostResourcesOperation *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CRKHostResourcesConfiguration initWithResourceURLs:serverIdentity:trustedAnchorCertificates:]([CRKHostResourcesConfiguration alloc], "initWithResourceURLs:serverIdentity:trustedAnchorCertificates:", v10, v9, v8);

  v12 = -[CRKHostResourcesOperation initWithConfiguration:](self, "initWithConfiguration:", v11);
  return v12;
}

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CRKHostResourcesConfiguration *v13;
  CRKHostResourcesOperation *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CRKHostResourcesConfiguration initWithResourceURLs:serverIdentity:trustedAnchorCertificates:]([CRKHostResourcesConfiguration alloc], "initWithResourceURLs:serverIdentity:trustedAnchorCertificates:", v12, v11, v10);

  -[CRKHostResourcesConfiguration setMaximumAllowedDownloads:](v13, "setMaximumAllowedDownloads:", a6);
  v14 = -[CRKHostResourcesOperation initWithConfiguration:](self, "initWithConfiguration:", v13);

  return v14;
}

- (CRKHostResourcesOperation)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5 maximumAllowedDownloads:(unint64_t)a6 port:(unsigned __int16)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  CRKHostResourcesConfiguration *v15;
  CRKHostResourcesOperation *v16;

  v7 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[CRKHostResourcesConfiguration initWithResourceURLs:serverIdentity:trustedAnchorCertificates:]([CRKHostResourcesConfiguration alloc], "initWithResourceURLs:serverIdentity:trustedAnchorCertificates:", v14, v13, v12);

  -[CRKHostResourcesConfiguration setMaximumAllowedDownloads:](v15, "setMaximumAllowedDownloads:", a6);
  -[CRKHostResourcesConfiguration setPort:](v15, "setPort:", v7);
  v16 = -[CRKHostResourcesOperation initWithConfiguration:](self, "initWithConfiguration:", v15);

  return v16;
}

- (CRKHostResourcesOperation)initWithConfiguration:(id)a3
{
  id v5;
  CRKHostResourcesOperation *v6;
  uint64_t v7;
  CRKHostResourcesConfiguration *mConfiguration;
  uint64_t v9;
  NSMutableDictionary *mStartedDownloadCountByFileURL;
  uint64_t v11;
  NSMutableDictionary *mFinishedDownloadCountByFileURL;
  uint64_t v13;
  NSMutableSet *mConnections;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *mFileURLsByFilePath;
  NSDictionary *v28;
  uint64_t v29;
  NSMutableSet *mConnectionCloseTimers;
  uint64_t v31;
  NSMutableDictionary *mZipOperationsByDirectoryURL;
  void *v34;
  CRKHostResourcesOperation *v35;
  id v36;
  id obj;
  NSDictionary *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _QWORD v44[3];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKHostResourcesOperation.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v43.receiver = self;
  v43.super_class = (Class)CRKHostResourcesOperation;
  v6 = -[CRKHostResourcesOperation init](&v43, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    mConfiguration = v6->mConfiguration;
    v6->mConfiguration = (CRKHostResourcesConfiguration *)v7;

    v9 = objc_opt_new();
    mStartedDownloadCountByFileURL = v6->mStartedDownloadCountByFileURL;
    v6->mStartedDownloadCountByFileURL = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    mFinishedDownloadCountByFileURL = v6->mFinishedDownloadCountByFileURL;
    v6->mFinishedDownloadCountByFileURL = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    mConnections = v6->mConnections;
    v35 = v6;
    v6->mConnections = (NSMutableSet *)v13;

    v38 = (NSDictionary *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = v5;
    objc_msgSend(v5, "resourceURLs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x24BDBCF48];
          v44[0] = CFSTR("/");
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = v22;
          objc_msgSend(v19, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v44[2] = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileURLWithPathComponents:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "crk_escapedPath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v19, v26);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v16);
    }

    v6 = v35;
    mFileURLsByFilePath = v35->mFileURLsByFilePath;
    v35->mFileURLsByFilePath = v38;
    v28 = v38;

    v29 = objc_opt_new();
    mConnectionCloseTimers = v35->mConnectionCloseTimers;
    v35->mConnectionCloseTimers = (NSMutableSet *)v29;

    v31 = objc_opt_new();
    mZipOperationsByDirectoryURL = v35->mZipOperationsByDirectoryURL;
    v35->mZipOperationsByDirectoryURL = (NSMutableDictionary *)v31;

    v5 = v36;
  }

  return v6;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[CRKHostResourcesOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", &sel_run, 0, 0);
}

- (void)run
{
  void *v3;
  NSNetService *v4;
  NSNetService *mNetService;
  id v6;

  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    if (-[CRKHostResourcesOperation isCanceled](self, "isCanceled"))
    {
      CATErrorWithCodeAndUserInfo();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[CRKHostResourcesOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else if (-[NSDictionary count](self->mFileURLsByFilePath, "count"))
    {
      -[CRKHostResourcesConfiguration IPAddressProvider](self->mConfiguration, "IPAddressProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("IPAddress"), 0, CFSTR("CRKHostResourcesOperationObservationContext"));

      -[CRKHostResourcesOperation setObservingIPAddress:](self, "setObservingIPAddress:", 1);
      v4 = (NSNetService *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7460]), "initWithDomain:type:name:port:", &stru_24D9CB490, CFSTR("_classroomshare._tcp."), &stru_24D9CB490, -[CRKHostResourcesConfiguration port](self->mConfiguration, "port"));
      mNetService = self->mNetService;
      self->mNetService = v4;

      -[NSNetService setDelegate:](self->mNetService, "setDelegate:", self);
      -[NSNetService publishWithOptions:](self->mNetService, "publishWithOptions:", 2);
    }
    else
    {
      -[CRKHostResourcesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKHostResourcesOperation;
  -[CRKHostResourcesOperation cancel](&v4, sel_cancel);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__CRKHostResourcesOperation_cancel__block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __35__CRKHostResourcesOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "stop");
}

- (void)operationDidFinish
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)CRKHostResourcesOperation;
  -[CRKHostResourcesOperation operationDidFinish](&v22, sel_operationDidFinish);
  if (-[CRKHostResourcesOperation isObservingIPAddress](self, "isObservingIPAddress"))
  {
    -[CRKHostResourcesConfiguration IPAddressProvider](self->mConfiguration, "IPAddressProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("IPAddress"), CFSTR("CRKHostResourcesOperationObservationContext"));

    -[CRKHostResourcesOperation setObservingIPAddress:](self, "setObservingIPAddress:", 0);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)-[NSMutableSet copy](self->mConnections, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8++), "close");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->mConnections, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)-[NSMutableSet copy](self->mConnectionCloseTimers, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "invalidate");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }

  -[NSMutableSet removeAllObjects](self->mConnectionCloseTimers, "removeAllObjects");
}

- (id)hostingSocketOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAdaptiveWriteTimeout:", &unk_24DA08018);
  objc_msgSend(v2, "setKeepAliveEnabled:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v2, "setKeepAliveDelay:", &unk_24DA08030);
  objc_msgSend(v2, "setKeepAliveInterval:", &unk_24DA08048);
  objc_msgSend(v2, "setKeepAliveCount:", &unk_24DA08048);
  objc_msgSend(v2, "setNetServiceType:", &unk_24DA08060);
  return v2;
}

- (BOOL)downloadAllowedForFileURL:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    if (-[CRKHostResourcesConfiguration maximumAllowedDownloads](self->mConfiguration, "maximumAllowedDownloads"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->mStartedDownloadCountByFileURL, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");
      v7 = v6 >= -[CRKHostResourcesConfiguration maximumAllowedDownloads](self->mConfiguration, "maximumAllowedDownloads");

      v8 = !v7;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)incrementStartedDownloadCountForFileURL:(id)a3
{
  NSMutableDictionary *mStartedDownloadCountByFileURL;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  mStartedDownloadCountByFileURL = self->mStartedDownloadCountByFileURL;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](mStartedDownloadCountByFileURL, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_24DA08078;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11 + 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mStartedDownloadCountByFileURL, "setObject:forKeyedSubscript:", v12, v5);

}

- (void)incrementFinishedDownloadCountForFileURL:(id)a3
{
  NSMutableDictionary *mFinishedDownloadCountByFileURL;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  mFinishedDownloadCountByFileURL = self->mFinishedDownloadCountByFileURL;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](mFinishedDownloadCountByFileURL, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_24DA08078;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11 + 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mFinishedDownloadCountByFileURL, "setObject:forKeyedSubscript:", v12, v5);

}

- (BOOL)allDownloadsFinished
{
  BOOL v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->mStashedError)
    return 1;
  if (!-[CRKHostResourcesConfiguration maximumAllowedDownloads](self->mConfiguration, "maximumAllowedDownloads"))
    return 0;
  v4 = -[NSMutableDictionary count](self->mFinishedDownloadCountByFileURL, "count");
  if (v4 != -[NSDictionary count](self->mFileURLsByFilePath, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->mFinishedDownloadCountByFileURL, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unsignedIntegerValue");
        if (v10 < -[CRKHostResourcesConfiguration maximumAllowedDownloads](self->mConfiguration, "maximumAllowedDownloads"))
        {
          v2 = 0;
          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v2 = 1;
LABEL_16:

  return v2;
}

- (void)delegateResourcesDidPublish
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSDictionary *mFileURLsByFilePath;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[CRKHostResourcesConfiguration IPAddressProvider](self->mConfiguration, "IPAddressProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IPAddress");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("https://%@:%ld"), v6, -[NSNetService port](self->mNetService, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  mFileURLsByFilePath = self->mFileURLsByFilePath;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__CRKHostResourcesOperation_delegateResourcesDidPublish__block_invoke;
  v14[3] = &unk_24D9C9800;
  v10 = v8;
  v15 = v10;
  -[NSDictionary crk_mapUsingBlock:](mFileURLsByFilePath, "crk_mapUsingBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKHostResourcesOperation delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKHostResourcesOperation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hostResourcesOperation:didPublishResources:", self, v11);

  }
}

CRKResource *__56__CRKHostResourcesOperation_delegateResourcesDidPublish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CRKResource *v7;
  void *v8;
  uint64_t v9;
  CRKResource *v10;

  v5 = a3;
  v6 = a2;
  v7 = [CRKResource alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v6, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "crk_isBundle");
  v10 = -[CRKResource initWithHostedURL:isZippedBundle:](v7, "initWithHostedURL:isZippedBundle:", v8, v9);

  return v10;
}

- (void)delegateDownloadStarted:(id)a3 fileURL:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKHostResourcesOperation delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKHostResourcesOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hostResourcesOperation:downloadDidStart:fileURL:", self, v10, v6);

  }
}

- (void)delegateDownloadFinished:(id)a3 fileURL:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[CRKHostResourcesOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CRKHostResourcesOperation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostResourcesOperation:downloadDidFinish:fileURL:error:", self, v13, v8, v9);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  CRKHostResourcesConfiguration *mConfiguration;
  id v12;
  id v13;
  objc_super v14;

  if (a6 == CFSTR("CRKHostResourcesOperationObservationContext"))
  {
    mConfiguration = self->mConfiguration;
    v12 = a4;
    -[CRKHostResourcesConfiguration IPAddressProvider](mConfiguration, "IPAddressProvider");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v12)
      -[CRKHostResourcesOperation IPAddressDidChange](self, "IPAddressDidChange");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRKHostResourcesOperation;
    v10 = a4;
    -[CRKHostResourcesOperation observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);

  }
}

- (void)IPAddressDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  CRKHostResourcesOperation *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _CRKLogOperation_1();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKHostResourcesConfiguration IPAddressProvider](self->mConfiguration, "IPAddressProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "IPAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "%{public}@: IP address did change to %{public}@", (uint8_t *)&v6, 0x16u);

  }
  if (self->mPublished)
    -[CRKHostResourcesOperation delegateResourcesDidPublish](self, "delegateResourcesDidPublish");
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDBCF18];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  v12[3] = &unk_24D9C84C0;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "cat_performBlockOnMainRunLoop:", v12);

}

void __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    _CRKLogOperation_1();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "%{public}@: Net service did accept connection", (uint8_t *)&v9, 0xCu);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C760]), "initWithInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "hostingSocketOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSocketOptions:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addObject:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "trustedCertificates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_72);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "serverIdentity");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "secureUsingServerIdentity:trustedCertificates:", objc_msgSend(v8, "underlyingIdentity"), v7);

    objc_msgSend(v4, "scheduleStreams");
    objc_msgSend(v4, "open");

  }
}

uint64_t __88__CRKHostResourcesOperation_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_51(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "underlyingCertificate");
}

- (void)netServiceDidPublish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__CRKHostResourcesOperation_netServiceDidPublish___block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __50__CRKHostResourcesOperation_netServiceDidPublish___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    _CRKLogOperation_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "%{public}@: Net service did publish", (uint8_t *)&v5, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "delegateResourcesDidPublish");
  }
  return result;
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCF18];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke;
  v8[3] = &unk_24D9C72D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "cat_performBlockOnMainRunLoop:", v8);

}

void __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BDB73D0];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDB73C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, objc_msgSend(v5, "integerValue"), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _CRKLogOperation_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke_cold_1((uint64_t)v2, v6, v7);

    objc_msgSend(*v2, "endOperationWithError:", v6);
  }
}

- (void)netServiceDidStop:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__CRKHostResourcesOperation_netServiceDidStop___block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

uint64_t __47__CRKHostResourcesOperation_netServiceDidStop___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    _CRKLogOperation_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "%{public}@: Net service did stop. Ending operation.", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD **)(a1 + 32);
    if (v5[55])
      return objc_msgSend(v5, "endOperationWithError:");
    else
      return objc_msgSend(v5, "endOperationWithResultObject:");
  }
  return result;
}

- (void)connection:(id)a3 didReceiveDataRequestWithURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSDictionary *mFileURLsByFilePath;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CRKHostResourcesOperation *v18;
  id v19;
  uint8_t buf[4];
  CRKHostResourcesOperation *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation_1();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = v6;
      v24 = 2114;
      v25 = v9;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ did receive request for URL %{public}@", buf, 0x20u);

    }
    mFileURLsByFilePath = self->mFileURLsByFilePath;
    objc_msgSend(v7, "crk_escapedPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](mFileURLsByFilePath, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CRKHostResourcesOperation downloadAllowedForFileURL:](self, "downloadAllowedForFileURL:", v12))
    {
      objc_msgSend(v6, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKHostResourcesOperation delegateDownloadStarted:fileURL:](self, "delegateDownloadStarted:fileURL:", v13, v12);

      -[CRKHostResourcesOperation incrementStartedDownloadCountForFileURL:](self, "incrementStartedDownloadCountForFileURL:", v12);
      if (objc_msgSend(v12, "crk_isBundle"))
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke;
        v15[3] = &unk_24D9C9848;
        v16 = v6;
        v17 = v7;
        v18 = self;
        v19 = v12;
        -[CRKHostResourcesOperation zipDirectoryAtURL:completion:](self, "zipDirectoryAtURL:completion:", v19, v15);

      }
      else
      {
        -[CRKHostResourcesOperation serveItemAtURL:toConnection:forRequestURL:originalItemURL:](self, "serveItemAtURL:toConnection:forRequestURL:originalItemURL:", v12, v6, v7, v12);
      }
    }
    else
    {
      _CRKLogOperation_1();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CRKHostResourcesOperation connection:didReceiveDataRequestWithURL:].cold.1((uint64_t)self, (uint64_t)v6, v14);

      objc_msgSend(v6, "close");
    }

  }
}

void __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    _CRKLogGeneral_9();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke_cold_1(a1, (uint64_t)v5, v6);

    v7 = (id *)(*(_QWORD *)(a1 + 48) + 440);
    if (*v7)
      v8 = *v7;
    else
      v8 = v5;
    objc_storeStrong(v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "close");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "serveItemAtURL:toConnection:forRequestURL:originalItemURL:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CRKZipOperation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CRKZipOperation *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  CRKZipOperation *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKHostResourcesOperation.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKHostResourcesOperation.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->mZipOperationsByDirectoryURL, "objectForKeyedSubscript:", v7);
  v10 = (CRKZipOperation *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _CRKLogGeneral_9();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "Enqueueing zip operation for %{public}@", buf, 0xCu);

    }
    v10 = -[CRKZipOperation initWithDirectoryURL:]([CRKZipOperation alloc], "initWithDirectoryURL:", v7);
    -[CRKZipOperation addTarget:selector:forOperationEvents:userInfo:](v10, "addTarget:selector:forOperationEvents:userInfo:", self, sel_zipOperationDidFail_directoryURL_, 4, v7);
    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v10);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mZipOperationsByDirectoryURL, "setObject:forKeyedSubscript:", v10, v7);
  }
  v14 = (void *)MEMORY[0x24BDD1478];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__CRKHostResourcesOperation_zipDirectoryAtURL_completion___block_invoke;
  v21[3] = &unk_24D9C6E88;
  v22 = v10;
  v23 = v9;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v14, "blockOperationWithBlock:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addDependency:", v15);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v17);

}

void __58__CRKHostResourcesOperation_zipDirectoryAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "resultObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)zipOperationDidFail:(id)a3 directoryURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->mZipOperationsByDirectoryURL, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    _CRKLogGeneral_9();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CRKHostResourcesOperation zipOperationDidFail:directoryURL:].cold.1(v7, v6, v9);

    -[NSMutableDictionary removeObjectForKey:](self->mZipOperationsByDirectoryURL, "removeObjectForKey:", v7);
  }

}

- (void)serveItemAtURL:(id)a3 toConnection:(id)a4 forRequestURL:(id)a5 originalItemURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSError *v19;
  NSObject *v20;
  NSError *mStashedError;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  CRKHostResourcesOperation *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSError *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x24BDD1570];
  v14 = a3;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithFilePresenter:", 0);
  v26 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke;
  v22[3] = &unk_24D9C9870;
  v22[4] = self;
  v16 = v10;
  v23 = v16;
  v17 = v11;
  v24 = v17;
  v18 = v12;
  v25 = v18;
  objc_msgSend(v15, "coordinateReadingItemAtURL:options:error:byAccessor:", v14, 8, &v26, v22);

  v19 = (NSError *)v26;
  if (v19)
  {
    _CRKLogOperation_1();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v28 = self;
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v19;
      v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_218C99000, v20, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: File coordinator error: %{public}@. Request URL: %{public}@", buf, 0x2Au);
    }

    if (self->mStashedError)
      mStashedError = self->mStashedError;
    else
      mStashedError = v19;
    objc_storeStrong((id *)&self->mStashedError, mStashedError);
    objc_msgSend(v16, "close");
  }

}

void __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileSize");

  _CRKLogOperation_1();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 && v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2048;
      v27 = v8;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_218C99000, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: Serving file with size %lu bytes for request URL %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "sendDataWithStream:length:userInfo:", v4, v8, *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke_cold_1(a1, v3, v10);

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 440);
    if (v15)
    {
      v16 = v15;
      v17 = *(void **)(v14 + 440);
      *(_QWORD *)(v14 + 440) = v16;
    }
    else
    {
      v30 = CFSTR("kCRKItemNameErrorKey");
      objc_msgSend(v3, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(12, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 440);
      *(_QWORD *)(v20 + 440) = v19;

    }
    objc_msgSend(*(id *)(a1 + 40), "close");
  }

}

- (void)connection:(id)a3 didSendDataWithStream:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  CRKHostResourcesOperation *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ did send data with stream. File URL: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKHostResourcesOperation delegateDownloadFinished:fileURL:error:](self, "delegateDownloadFinished:fileURL:error:", v10, v8, 0);

    -[CRKHostResourcesOperation incrementFinishedDownloadCountForFileURL:](self, "incrementFinishedDownloadCountForFileURL:", v8);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_connectionCloseDidTimeout_, v7, 0, 30.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->mConnectionCloseTimers, "addObject:", v11);

  }
}

- (void)connectionCloseDidTimeout:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  CRKHostResourcesOperation *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    -[NSMutableSet removeObject:](self->mConnectionCloseTimers, "removeObject:", v4);
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->mConnections, "containsObject:", v5))
    {
      _CRKLogOperation_1();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138543618;
        v8 = self;
        v9 = 2114;
        v10 = v5;
        _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "%{public}@: Connection close timer fired. Closing %{public}@", (uint8_t *)&v7, 0x16u);
      }

      objc_msgSend(v5, "close");
    }

  }
}

- (void)connection:(id)a3 didFailToSendDataWithStream:(id)a4 userInfo:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  CRKHostResourcesOperation *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation_1();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "verboseDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = self;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_218C99000, v12, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ failed to send data with stream. File URL: %{public}@. Error: %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(v9, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKHostResourcesOperation delegateDownloadFinished:fileURL:error:](self, "delegateDownloadFinished:fileURL:error:", v13, v10, v11);

    -[CRKHostResourcesOperation incrementFinishedDownloadCountForFileURL:](self, "incrementFinishedDownloadCountForFileURL:", v10);
    objc_msgSend(v9, "close");
  }

}

- (void)connection:(id)a3 didInterruptWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  CRKHostResourcesOperation *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation_1();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "verboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_218C99000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Connection %{public}@ did interrupt with error: %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(v6, "close");
  }

}

- (void)connectionDidClose:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  CRKHostResourcesOperation *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CRKHostResourcesOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "%{public}@: Connection %{public}@ did close", (uint8_t *)&v7, 0x16u);
    }

    -[NSMutableSet removeObject:](self->mConnections, "removeObject:", v4);
    if (!-[NSMutableSet count](self->mConnections, "count")
      && -[CRKHostResourcesOperation allDownloadsFinished](self, "allDownloadsFinished"))
    {
      _CRKLogOperation_1();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138543362;
        v8 = self;
        _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "%{public}@: All downloads finished and all connections closed. Stopping net service.", (uint8_t *)&v7, 0xCu);
      }

      -[NSNetService stop](self->mNetService, "stop");
    }
  }

}

- (CRKHostResourcesOperationDelegate)delegate
{
  return (CRKHostResourcesOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isObservingIPAddress
{
  return self->_observingIPAddress;
}

- (void)setObservingIPAddress:(BOOL)a3
{
  self->_observingIPAddress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mZipOperationsByDirectoryURL, 0);
  objc_storeStrong((id *)&self->mStashedError, 0);
  objc_storeStrong((id *)&self->mConnectionCloseTimers, 0);
  objc_storeStrong((id *)&self->mConnections, 0);
  objc_storeStrong((id *)&self->mNetService, 0);
  objc_storeStrong((id *)&self->mFinishedDownloadCountByFileURL, 0);
  objc_storeStrong((id *)&self->mStartedDownloadCountByFileURL, 0);
  objc_storeStrong((id *)&self->mFileURLsByFilePath, 0);
  objc_storeStrong((id *)&self->mConfiguration, 0);
}

void __54__CRKHostResourcesOperation_netService_didNotPublish___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_2(&dword_218C99000, a3, v5, "%{public}@: Net service FAILED to publish. Error: %{public}@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)connection:(NSObject *)a3 didReceiveDataRequestWithURL:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_218C99000, a3, (uint64_t)a3, "%{public}@: %{public}@: download not allowed. Closing connection.", (uint8_t *)&v3);
}

void __69__CRKHostResourcesOperation_connection_didReceiveDataRequestWithURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = a2;
  v9 = 2114;
  v10 = v4;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "%{public}@: Zip error: %{public}@. Request URL: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)zipOperationDidFail:(NSObject *)a3 directoryURL:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verboseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_2(&dword_218C99000, a3, v8, "Throwing away zip operation for directory %{public}@ because it failed with error: %{public}@", v9);

  OUTLINED_FUNCTION_1_1();
}

void __87__CRKHostResourcesOperation_serveItemAtURL_toConnection_forRequestURL_originalItemURL___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Could not create stream for resolved URL %{public}@. Request URL: %{public}@", (uint8_t *)&v9, 0x2Au);

}

@end
