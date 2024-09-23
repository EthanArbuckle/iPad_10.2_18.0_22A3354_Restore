@implementation C2NetworkingDelegateURLSession

+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  C2NetworkingDelegateURLSession *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(C2NetworkingDelegateURLSession);
  -[C2NetworkingDelegateURLSession setSessionDelegate:](v10, "setSessionDelegate:", v8);

  -[C2NetworkingDelegateURLSession setConfiguration:](v10, "setConfiguration:", v9);
  -[C2NetworkingDelegateURLSession setDelegateQueue:](v10, "setDelegateQueue:", v7);

  return v10;
}

- (id)dataTaskWithRequest:(id)a3
{
  id v4;
  C2NetworkingDelegateURLSessionDataTask *v5;

  v4 = a3;
  v5 = objc_alloc_init(C2NetworkingDelegateURLSessionDataTask);
  -[C2NetworkingDelegateURLSessionDataTask setSession:](v5, "setSession:", self);
  -[C2NetworkingDelegateURLSessionDataTask setCurrentRequest:](v5, "setCurrentRequest:", v4);
  -[C2NetworkingDelegateURLSessionDataTask setOriginalRequest:](v5, "setOriginalRequest:", v4);

  return v5;
}

- (void)invalidateAndCancel
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[C2NetworkingDelegateURLSession delegateQueue](self, "delegateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__C2NetworkingDelegateURLSession_invalidateAndCancel__block_invoke;
  v5[3] = &unk_1E98986D0;
  v5[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v5);

  -[C2NetworkingDelegateURLSession delegateQueue](self, "delegateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilAllOperationsAreFinished");

}

void __53__C2NetworkingDelegateURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 32), 0);

}

- (C2NetworkingDelegate)networkingDelegate
{
  return (C2NetworkingDelegate *)objc_loadWeakRetained((id *)&self->_networkingDelegate);
}

- (void)setNetworkingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkingDelegate, a3);
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSOperationQueue)delegateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSURLSessionDelegate)sessionDelegate
{
  return (NSURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_destroyWeak((id *)&self->_networkingDelegate);
}

@end
