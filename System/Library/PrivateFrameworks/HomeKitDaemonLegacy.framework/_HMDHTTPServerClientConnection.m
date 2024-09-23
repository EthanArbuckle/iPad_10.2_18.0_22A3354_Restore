@implementation _HMDHTTPServerClientConnection

- (_HMDHTTPServerClientConnection)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMDHTTPServerClientConnection)initWithDevice:(id)a3
{
  id v5;
  _HMDHTTPServerClientConnection *v6;
  _HMDHTTPServerClientConnection *v7;
  uint64_t v8;
  NSMutableArray *receiveMessageRequests;
  uint64_t v10;
  NSMutableDictionary *pendingTransactionCompletionHandlers;
  uint64_t v12;
  HMFTimer *lostConnectionTimer;
  NSOperationQueue *v14;
  void *v15;
  id v16;
  void *v17;
  NSOperationQueue *requestOperationQueue;
  NSOperationQueue *v19;
  NSOperationQueue *v20;
  void *v21;
  id v22;
  void *v23;
  NSOperationQueue *transactionOperationQueue;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HMDHTTPServerClientConnection;
  v6 = -[_HMDHTTPServerClientConnection init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    receiveMessageRequests = v7->_receiveMessageRequests;
    v7->_receiveMessageRequests = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingTransactionCompletionHandlers = v7->_pendingTransactionCompletionHandlers;
    v7->_pendingTransactionCompletionHandlers = (NSMutableDictionary *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, 10.0);
    lostConnectionTimer = v7->_lostConnectionTimer;
    v7->_lostConnectionTimer = (HMFTimer *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    HMDispatchQueueNameString();
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v16, "UTF8String"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v14, "setName:", v17);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v14, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v14, "setQualityOfService:", 25);
    -[NSOperationQueue setSuspended:](v14, "setSuspended:", 1);
    requestOperationQueue = v7->_requestOperationQueue;
    v7->_requestOperationQueue = v14;
    v19 = v14;

    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v21 = (void *)MEMORY[0x1E0CB3940];
    HMDispatchQueueNameString();
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v22, "UTF8String"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v20, "setName:", v23);

    -[NSOperationQueue setQualityOfService:](v20, "setQualityOfService:", 25);
    transactionOperationQueue = v7->_transactionOperationQueue;
    v7->_transactionOperationQueue = v20;

  }
  return v7;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 23, CFSTR("Operation cancelled."), CFSTR("The client connection is no longer valid."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_pendingTransactionCompletionHandlers, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_pendingTransactionCompletionHandlers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "count");
    -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "operationCount");
    -[_HMDHTTPServerClientConnection transactionOperationQueue](self, "transactionOperationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v19;
    v27 = 2112;
    v28 = v18;
    v29 = 2048;
    v30 = v7;
    v31 = 2048;
    v32 = v9;
    v33 = 2048;
    v34 = objc_msgSend(v10, "operationCount");
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Invalidating: outstanding pendingHandlers=%lu, requests=%lu, transactions=%lu", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v5);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelAllOperationsWithError:", v3);

  -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSuspended:", 0);

  -[_HMDHTTPServerClientConnection transactionOperationQueue](self, "transactionOperationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cancelAllOperationsWithError:", v3);

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDHTTPServerClientConnection device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDHTTPServerClientConnection device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDHTTPServerClientConnection connection](self, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Device = %@, Connection = %@>"), v6, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Device = %@, Connection = %@>"), v6, v7, v8, &stru_1E89C3E38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)debugDescription
{
  return -[_HMDHTTPServerClientConnection descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[_HMDHTTPServerClientConnection descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[_HMDHTTPServerClientConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)addCompletionHandler:(id)a3 forTransactionIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = (void *)objc_msgSend(v9, "copy");
  v8 = _Block_copy(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingTransactionCompletionHandlers, "setObject:forKeyedSubscript:", v8, v6);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)removeCompletionHandlerForTransactionIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTransactionCompletionHandlers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary removeObjectForKey:](self->_pendingTransactionCompletionHandlers, "removeObjectForKey:", v4);
  v7 = _Block_copy(v6);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)setConnection:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_HMDHTTPServerClientConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection, removing all queued requests and suspending the request queue", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[_HMDHTTPServerClientConnection receiveMessageRequests](self, "receiveMessageRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSuspended:", 1);

    -[_HMDHTTPServerClientConnection lostConnectionTimer](self, "lostConnectionTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v5)
      objc_msgSend(v14, "suspend");
    else
      objc_msgSend(v14, "resume");

  }
}

- (void)queueRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_HMDHTTPServerClientConnection receiveMessageRequests](self, "receiveMessageRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSuspended");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Resuming the request queue as there are queued requests", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSuspended:", 0);

    }
    -[_HMDHTTPServerClientConnection lostConnectionTimer](self, "lostConnectionTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suspend");

  }
}

- (id)dequeueRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_HMDHTTPServerClientConnection receiveMessageRequests](self, "receiveMessageRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HMDHTTPServerClientConnection receiveMessageRequests](self, "receiveMessageRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[_HMDHTTPServerClientConnection receiveMessageRequests](self, "receiveMessageRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSuspended");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Suspending the request queue as there are no more queued requests", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSuspended:", 1);

      -[_HMDHTTPServerClientConnection lostConnectionTimer](self, "lostConnectionTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resume");

    }
  }
  return v4;
}

- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _HMDHTTPServerClientConnection *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28[3];
  id location;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28550]), "initWithTimeout:", a4);
  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke;
  v25[3] = &unk_1E89B2518;
  objc_copyWeak(v28, &location);
  v28[1] = v11;
  v28[2] = *(id *)&a4;
  v25[4] = self;
  v14 = v8;
  v26 = v14;
  v15 = v9;
  v27 = v15;
  objc_msgSend(v12, "addExecutionBlock:", v25);
  v18 = v13;
  v19 = 3221225472;
  v20 = __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke_2;
  v21 = &unk_1E89BC548;
  objc_copyWeak(&v24, &location);
  v22 = self;
  v16 = v15;
  v23 = v16;
  objc_msgSend(v12, "setCompletionBlock:", &v18);
  -[_HMDHTTPServerClientConnection requestOperationQueue](self, "requestOperationQueue", v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v12);

  objc_destroyWeak(&v24);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

- (void)_reallySendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _BYTE *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _BYTE *v41;
  id v42;
  id location;
  id v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v8 = a5;
  -[_HMDHTTPServerClientConnection dequeueRequest](self, "dequeueRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v33, 100, 0, &v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (uint64_t (*)(uint64_t, uint64_t))v44;
    if (v10)
    {
      v11 = 200;
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2112;
        v46 = v30;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to serialize response message with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v11 = 400;
    }
    objc_msgSend(v9, "responseWithStatusCode:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v10)
      objc_msgSend(v22, "setBody:", v10);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHeaderValue:forHeaderKey:", v24, CFSTR("Transaction-Identifier"));

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28550]), "initWithTimeout:", a4);
    objc_initWeak(&location, v25);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__100854;
    v47 = __Block_byref_object_dispose__100855;
    v48 = 0;
    v26 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke;
    v38[3] = &unk_1E89B2590;
    v38[1] = 3221225472;
    objc_copyWeak(&v42, &location);
    v38[4] = self;
    v27 = v23;
    v39 = v27;
    v41 = buf;
    v28 = v22;
    v40 = v28;
    objc_msgSend(v25, "addExecutionBlock:", v38);
    if (v8)
    {
      v34[0] = v26;
      v34[1] = 3221225472;
      v34[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_43;
      v34[3] = &unk_1E89B25B8;
      objc_copyWeak(&v37, &location);
      v35 = v8;
      v36 = buf;
      objc_msgSend(v25, "setCompletionBlock:", v34);

      objc_destroyWeak(&v37);
    }
    -[_HMDHTTPServerClientConnection transactionOperationQueue](self, "transactionOperationQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addOperation:", v25);

    objc_destroyWeak(&v42);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDHTTPServerClientConnection shortDescription](self, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDHTTPServerClientConnection device](self, "device");
      v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v46 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to send message to device, %@, there is no queued request", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication Failure."), CFSTR("There is no queued request to send the message."), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v31);

    }
  }

}

- (HMDHTTPDevice)device
{
  return self->_device;
}

- (HMFHTTPClientConnection)connection
{
  return self->_connection;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (NSMutableArray)receiveMessageRequests
{
  return self->_receiveMessageRequests;
}

- (NSOperationQueue)transactionOperationQueue
{
  return self->_transactionOperationQueue;
}

- (HMFTimer)lostConnectionTimer
{
  return self->_lostConnectionTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostConnectionTimer, 0);
  objc_storeStrong((id *)&self->_transactionOperationQueue, 0);
  objc_storeStrong((id *)&self->_receiveMessageRequests, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pendingTransactionCompletionHandlers, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
