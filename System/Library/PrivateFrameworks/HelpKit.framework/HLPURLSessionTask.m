@implementation HLPURLSessionTask

- (void)dealloc
{
  objc_super v3;

  -[HLPURLSessionTask cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)HLPURLSessionTask;
  -[HLPURLSessionTask dealloc](&v3, sel_dealloc);
}

- (HLPURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  HLPURLSessionTask *v9;
  HLPURLSessionTask *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *sessionTaskDelegateQueue;
  NSObject *v13;
  _QWORD block[4];
  HLPURLSessionTask *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HLPURLSessionTask;
  v9 = -[HLPURLSessionTask init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_task, a3);
    v11 = dispatch_queue_create("com.apple.tipsd.urlsessionQueue", 0);
    sessionTaskDelegateQueue = v10->_sessionTaskDelegateQueue;
    v10->_sessionTaskDelegateQueue = (OS_dispatch_queue *)v11;

    v13 = v10->_sessionTaskDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__HLPURLSessionTask_initWithSessionTask_identifier___block_invoke;
    block[3] = &unk_24D32E6B8;
    v16 = v10;
    dispatch_sync(v13, block);

  }
  return v10;
}

void __52__HLPURLSessionTask_initWithSessionTask_identifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionTaskDelegates:", v2);

}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v4;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    -[HLPURLSessionTask URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[NSURLSessionTask originalRequest](self->_task, "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (float)priority
{
  float result;

  -[NSURLSessionTask priority](self->_task, "priority");
  return result;
}

- (void)setPriority:(float)a3
{
  double v5;

  -[NSURLSessionTask priority](self->_task, "priority");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[NSURLSessionTask setPriority:](self->_task, "setPriority:", v5);
  }
}

+ (HLPURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3
{
  id v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_opt_respondsToSelector();
  v5 = objc_opt_respondsToSelector();
  v6 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();

  v10 = 0x10000000000;
  if ((v4 & 1) == 0)
    v10 = 0;
  v11 = 0x100000000;
  if ((v9 & 1) == 0)
    v11 = 0;
  v12 = 0x1000000;
  if ((v5 & 1) == 0)
    v12 = 0;
  v13 = 0x10000;
  if ((v8 & 1) == 0)
    v13 = 0;
  v14 = 256;
  if ((v7 & 1) == 0)
    v14 = 0;
  return (HLPURLSessionDelegateResponds)((v12 | v10) & 0xFFFFFFFFFFFFFFFELL | v6 & 1 | v14 | v13 | v11);
}

- (void)didCompleteWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *sessionTaskDelegateQueue;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSHashTable copy](self->_sessionTaskDelegates, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "URLSessionSessionTask:didCompleteWithError:", self, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HLPURLSessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_24D32E6B8;
  block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);

}

void __42__HLPURLSessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)registerDelegate:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *sessionTaskDelegateQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSHashTable containsObject:](self->_sessionTaskDelegates, "containsObject:", v4);
    v4 = v7;
    if (!v5)
    {
      sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__HLPURLSessionTask_registerDelegate___block_invoke;
      block[3] = &unk_24D32EA90;
      block[4] = self;
      v9 = v7;
      dispatch_sync(sessionTaskDelegateQueue, block);

      v4 = v7;
    }
  }

}

void __38__HLPURLSessionTask_registerDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *sessionTaskDelegateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HLPURLSessionTask_unregisterDelegate___block_invoke;
  block[3] = &unk_24D32EA90;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  dispatch_sync(sessionTaskDelegateQueue, block);
  if (!-[NSHashTable count](self->_sessionTaskDelegates, "count"))
    -[HLPURLSessionTask cancel](self, "cancel");

}

void __40__HLPURLSessionTask_unregisterDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)resume
{
  -[NSURLSessionTask resume](self->_task, "resume");
}

- (void)cancel
{
  NSObject *sessionTaskDelegateQueue;
  _QWORD block[5];

  -[NSURLSessionTask cancel](self->_task, "cancel");
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HLPURLSessionTask_cancel__block_invoke;
  block[3] = &unk_24D32E6B8;
  block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);
  self->_cancelled = 1;
}

void __27__HLPURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (HLPURLSessionDelegate)networkDelegate
{
  return (HLPURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_networkDelegate);
}

- (void)setNetworkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkDelegate, a3);
}

- (HLPURLSessionDelegateResponds)delegateResponds
{
  return (HLPURLSessionDelegateResponds)(*(unsigned int *)&self->_delegateResponds.willCacheResponse | ((unint64_t)*(unsigned __int16 *)&self->_delegateResponds.didCompleteWithError << 32));
}

- (void)setDelegateResponds:(HLPURLSessionDelegateResponds)a3
{
  self->_delegateResponds = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCacheData
{
  return self->_isCacheData;
}

- (void)setIsCacheData:(BOOL)a3
{
  self->_isCacheData = a3;
}

- (unint64_t)downloadTaskTotalBytes
{
  return self->_downloadTaskTotalBytes;
}

- (void)setDownloadTaskTotalBytes:(unint64_t)a3
{
  self->_downloadTaskTotalBytes = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)formattedData
{
  return self->_formattedData;
}

- (void)setFormattedData:(id)a3
{
  objc_storeStrong(&self->_formattedData, a3);
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (NSMutableData)dataTaskData
{
  return self->_dataTaskData;
}

- (void)setDataTaskData:(id)a3
{
  objc_storeStrong((id *)&self->_dataTaskData, a3);
}

- (NSError)dataError
{
  return self->_dataError;
}

- (void)setDataError:(id)a3
{
  objc_storeStrong((id *)&self->_dataError, a3);
}

- (NSHashTable)sessionTaskDelegates
{
  return self->_sessionTaskDelegates;
}

- (void)setSessionTaskDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, 0);
  objc_storeStrong((id *)&self->_dataError, 0);
  objc_storeStrong((id *)&self->_dataTaskData, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_formattedData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_networkDelegate);
  objc_storeStrong((id *)&self->_sessionTaskDelegateQueue, 0);
}

@end
