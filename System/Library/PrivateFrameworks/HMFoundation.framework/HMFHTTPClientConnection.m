@implementation HMFHTTPClientConnection

- (HMFHTTPClientConnection)initWithConnection:(id)a3
{
  id v5;
  HMFHTTPClientConnection *v6;
  HMFHTTPClientConnection *v7;
  const char *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *clientQueue;
  uint64_t v11;
  NSMutableArray *pendingRespones;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMFHTTPClientConnection;
  v6 = -[HMFHTTPClientConnection init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, 0);
    v9 = dispatch_queue_create(v8, 0);
    clientQueue = v7->_clientQueue;
    v7->_clientQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingRespones = v7->_pendingRespones;
    v7->_pendingRespones = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v7->_internal, a3);
    -[HMFHTTPClientConnection internal](v7, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMFHTTPClientConnection internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HMFHTTPClientConnection;
  -[HMFHTTPClientConnection dealloc](&v4, sel_dealloc);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPClientConnection peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addressString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFHTTPClientConnection peerAddress](self, "peerAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Address"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMFNetAddress)peerAddress
{
  void *v2;
  void *v3;

  -[HMFHTTPClientConnection internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFNetAddress *)v3;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFHTTPClientConnection clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HMFHTTPClientConnection_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3B37D38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__HMFHTTPClientConnection_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Opening", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "open");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC355C]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open connection", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to open connection."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);

}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFHTTPClientConnection clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMFHTTPClientConnection_close__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __32__HMFHTTPClientConnection_close__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Closing", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "close");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "connection:didCloseWithError:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

- (void)sendResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMFHTTPClientConnection clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMFHTTPClientConnection_sendResponse_completionHandler___block_invoke;
    block[3] = &unk_1E3B38E70;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

void __58__HMFHTTPClientConnection_sendResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "setCompletionHandler:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendResponse:", v9);
LABEL_12:

    goto LABEL_13;
  }
  v11 = (void *)MEMORY[0x1A1AC355C]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_ERROR, "%{public}@The response is invalid: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

- (void)connection:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMFHTTPClientConnection clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMFHTTPClientConnection_connection_didReceiveRequest___block_invoke;
  block[3] = &unk_1E3B38480;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __56__HMFHTTPClientConnection_connection_didReceiveRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  HMFHTTPRequest *v6;
  void *v7;
  HMFHTTPRequest *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  HMFHTTPRequest *v17;
  int v18;
  void *v19;
  __int16 v20;
  HMFHTTPRequest *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(HMFHTTPRequest **)(a1 + 40);
    v18 = 138543618;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received request: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[HMFHTTPRequest initWithInternalRequest:]([HMFHTTPRequest alloc], "initWithInternalRequest:", *(_QWORD *)(a1 + 40));
    v9 = (void *)MEMORY[0x1A1AC355C]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v7, "connection:didReceiveRequest:", *(_QWORD *)(a1 + 32), v8);
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC355C]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(HMFHTTPRequest **)(a1 + 40);
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Received unhandled request: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v8 = -[_HMFCFHTTPServerResponse initWithRequest:statusCode:]([_HMFCFHTTPServerResponse alloc], "initWithRequest:statusCode:", *(_QWORD *)(a1 + 40), 501);
    objc_msgSend(*(id *)(a1 + 48), "sendResponse:", v8);
  }

}

+ (id)logCategory
{
  if (_MergedGlobals_3_14 != -1)
    dispatch_once(&_MergedGlobals_3_14, &__block_literal_global_36);
  return (id)qword_1ED012FD8;
}

void __38__HMFHTTPClientConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.HTTP.Server.Connection"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012FD8;
  qword_1ED012FD8 = v0;

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMFHTTPClientConnection peerAddress](self, "peerAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFHTTPClientConnectionDelegate)delegate
{
  return (HMFHTTPClientConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)pendingRespones
{
  return self->_pendingRespones;
}

- (_HMFCFHTTPServerConnection)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_pendingRespones, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
