@implementation _HMFCFHTTPServerConnection

- (_HMFCFHTTPServerConnection)init
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

- (_HMFCFHTTPServerConnection)initWithConnectionRef:(_CFHTTPServerConnection *)a3
{
  _HMFCFHTTPServerConnection *v4;
  _CFHTTPServerConnection *v5;
  uint64_t (*v6)(_QWORD);
  const char *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *clientQueue;
  uint64_t v10;
  NSMutableArray *pendingRequests;
  uint64_t v12;
  NSMutableArray *pendingRespones;
  HMFWeakObject *v14;
  void *v15;
  id v16;
  void *v17;
  _HMFCFHTTPServerConnection *v18;
  NSObject *v19;
  void *v20;
  _HMFCFHTTPServerConnection *v21;
  HMFNetAddress *address;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_HMFCFHTTPServerConnection;
  v4 = -[_HMFCFHTTPServerConnection init](&v24, sel_init);
  if (!v4)
  {
LABEL_12:
    v21 = v4;
    goto LABEL_13;
  }
  v5 = (_CFHTTPServerConnection *)CFRetain(a3);
  v6 = MEMORY[0x1E0C98BD0];
  v4->_internal = v5;
  v7 = (const char *)HMFDispatchQueueName(v4, 0);
  v8 = dispatch_queue_create(v7, 0);
  clientQueue = v4->_clientQueue;
  v4->_clientQueue = (OS_dispatch_queue *)v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  pendingRequests = v4->_pendingRequests;
  v4->_pendingRequests = (NSMutableArray *)v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  pendingRespones = v4->_pendingRespones;
  v4->_pendingRespones = (NSMutableArray *)v12;

  v14 = -[HMFWeakObject initWithWeakObject:]([HMFWeakObject alloc], "initWithWeakObject:", v4);
  -[_HMFCFHTTPServerConnection internal](v4, "internal", 1, _connectionDidInvalidate, _connectionDidReceiveError, _connectionDidReceiveRequest, _connectionDidSendResponse, _connectionDidFailToSendResponse, 0, v14, v6, MEMORY[0x1E0C98BC0], 0);
  _CFHTTPServerConnectionSetClient();
  if (-[_HMFCFHTTPServerConnection internal](v4, "internal") && -[_HMFCFHTTPServerConnection isValid](v4, "isValid"))
  {
    if (a3)
    {
      v15 = (void *)_CFHTTPServerConnectionCopyProperty();
      if (v15)
      {
        v16 = objc_retainAutorelease(v15);
        a3 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", objc_msgSend(v16, "bytes"));

      }
      else
      {
        a3 = 0;
      }
    }
    address = v4->_address;
    v4->_address = (HMFNetAddress *)a3;

    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x1A1AC355C]();
  v18 = v4;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v20;
    _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create connection, connection is invalid", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);

  v21 = 0;
LABEL_13:

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_internal)
  {
    if (_CFHTTPServerConnectionIsValid())
      _CFHTTPServerConnectionInvalidate();
    CFRelease(self->_internal);
    self->_internal = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_HMFCFHTTPServerConnection;
  -[_HMFCFHTTPServerConnection dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return CFHash(-[_HMFCFHTTPServerConnection internal](self, "internal"));
}

- (BOOL)isEqual:(id)a3
{
  _HMFCFHTTPServerConnection *v4;
  _HMFCFHTTPServerConnection *v5;
  _HMFCFHTTPServerConnection *v6;
  BOOL v7;

  v4 = (_HMFCFHTTPServerConnection *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
      v7 = CFEqual(-[_HMFCFHTTPServerConnection internal](self, "internal"), -[_HMFCFHTTPServerConnection internal](v6, "internal")) != 0;
    else
      v7 = 0;

  }
  return v7;
}

- (void)invalidate
{
  void *v3;
  _HMFCFHTTPServerConnection *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[_HMFCFHTTPServerConnection isValid](self, "isValid"))
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Closed", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[_HMFCFHTTPServerConnection internal](v4, "internal");
    _CFHTTPServerConnectionInvalidate();
  }
}

- (BOOL)isValid
{
  -[_HMFCFHTTPServerConnection internal](self, "internal");
  return _CFHTTPServerConnectionIsValid() != 0;
}

- (BOOL)open
{
  _BOOL4 v3;
  void *v4;
  _HMFCFHTTPServerConnection *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[_HMFCFHTTPServerConnection isValid](self, "isValid");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Opened", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[_HMFCFHTTPServerConnection internal](v5, "internal");
    -[_HMFCFHTTPServerConnection clientQueue](v5, "clientQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CFHTTPServerConnectionSetDispatchQueue();

  }
  return v3;
}

- (void)_handleReceivedRequestRef:(_CFHTTPServerRequest *)a3
{
  void *v5;
  _HMFCFHTTPServerConnection *v6;
  NSObject *v7;
  void *v8;
  _HMFCFHTTPServerRequest *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  __CFReadStream *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  HMFWeakObject *v21;
  void *v22;
  void *v23;
  id *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  _HMFCFHTTPServerRequest *v32;
  CFStreamClientContext buf;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.version) = 138543618;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v8;
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = a3;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received request: %@", (uint8_t *)&buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[_HMFCFHTTPServerRequest initWithConnection:requestRef:]([_HMFCFHTTPServerRequest alloc], "initWithConnection:requestRef:", v6, a3);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.version) = 138543618;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v13;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v9;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11[4], "addObject:", v9);
    v14 = -[_HMFCFHTTPServerRequest bodyStream](v9, "bodyStream");
    v15 = (void *)MEMORY[0x1A1AC355C]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        HMFGetLogIdentifier(v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.version) = 138543618;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v19;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = v9;
        _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@Opening body stream for request: %@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMFHTTPRequestInternal activity](v9, "activity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "markWithReason:", CFSTR("Opening body stream"));

      memset(&buf, 0, sizeof(buf));
      v21 = -[HMFWeakObject initWithWeakObject:]([HMFWeakObject alloc], "initWithWeakObject:", v9);
      buf.info = v21;
      buf.retain = (void *(__cdecl *)(void *))_retainInfo;
      buf.release = (void (__cdecl *)(void *))_releaseInfo;
      CFReadStreamSetClient(v14, 0x1AuLL, (CFReadStreamClientCallBack)readStreamCallBack, &buf);
      objc_msgSend(v16, "clientQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AC2BE4](v14, v22);

      if (!CFReadStreamOpen(v14))
      {
        v23 = (void *)MEMORY[0x1A1AC355C]();
        v24 = v16;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v26;
          v31 = 2112;
          v32 = v9;
          _os_log_impl(&dword_19B546000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to open request body stream for request %@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_handleCompletedReceivedRequest:error:", v9, v27);

      }
    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier(v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.version) = 138543618;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v28;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = v9;
        _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@No body stream for request: %@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v16, "_handleCompletedReceivedRequest:error:", v9, 0);
    }
  }

}

- (void)_handleCompletedReceivedRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _HMFCFHTTPServerConnection *v10;
  NSObject *v11;
  void *v12;
  _HMFCFHTTPServerConnection *v13;
  uint64_t v14;
  char v15;
  void *v16;
  _HMFCFHTTPServerConnection *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[_HMFCFHTTPServerConnection _stopReadBody:](self, "_stopReadBody:", v6);
    -[_HMFCFHTTPServerConnection delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v12;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Sending a 500 (Internal Server Error) for the request: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v13 = v10;
      v14 = 500;
    }
    else
    {
      v15 = objc_opt_respondsToSelector();
      v16 = (void *)MEMORY[0x1A1AC355C]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v20;
          v24 = 2112;
          v25 = v6;
          _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_INFO, "%{public}@Received complete request: %@", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v8, "connection:didReceiveRequest:", v17, v6);
        goto LABEL_14;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v21;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Sending a 501 (Not Implemented) for the request: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v13 = v17;
      v14 = 501;
    }
    -[_HMFCFHTTPServerConnection _sendStatusCode:forRequest:](v13, "_sendStatusCode:forRequest:", v14, v6);
LABEL_14:
    -[NSMutableArray removeObject:](self->_pendingRequests, "removeObject:", v6);

  }
}

- (void)_stopReadBody:(id)a3
{
  id v4;
  void *v5;
  _HMFCFHTTPServerConnection *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __CFReadStream *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Closing body stream for request: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_msgSend(v4, "bodyStream");
  if (v9)
  {
    v10 = (__CFReadStream *)v9;
    objc_msgSend(v4, "activity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "markWithReason:", CFSTR("Closing body stream"));

    CFReadStreamSetClient(v10, 0, 0, 0);
    MEMORY[0x1A1AC2BE4](v10, 0);
    CFReadStreamClose(v10);
  }

}

- (void)handleRequest:(id)a3 bodyReadStream:(__CFReadStream *)a4 eventType:(unint64_t)a5
{
  id v8;
  CFIndex v9;
  CFIndex v10;
  void *v11;
  _HMFCFHTTPServerConnection *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _HMFCFHTTPServerConnection *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _HMFCFHTTPServerConnection *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _HMFCFHTTPServerConnection *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  CFIndex v36;
  __int16 v37;
  id v38;
  UInt8 buffer[4];
  void *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 == 16)
    goto LABEL_17;
  if (a5 == 8)
  {
    v16 = (void *)MEMORY[0x1A1AC355C]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138543618;
      v40 = v19;
      v41 = 2112;
      v42 = (unint64_t)v8;
      _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_INFO, "%{public}@Received body stream error for request: %@", buffer, 0x16u);

    }
    goto LABEL_14;
  }
  if (a5 != 2)
  {
    v16 = (void *)MEMORY[0x1A1AC355C]();
    v17 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138543874;
      v40 = v21;
      v41 = 2048;
      v42 = a5;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %ld, for request: %@", buffer, 0x20u);

    }
LABEL_14:

    objc_autoreleasePoolPop(v16);
    -[_HMFCFHTTPServerConnection _sendStatusCode:forRequest:](v17, "_sendStatusCode:forRequest:", 500, v8);
    goto LABEL_18;
  }
  v9 = CFReadStreamRead(a4, buffer, 1024);
  v10 = v9;
  if (v9 >= 1)
  {
    v11 = (void *)MEMORY[0x1A1AC355C]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543874;
      v34 = v14;
      v35 = 2048;
      v36 = v10;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Reading %ld bytes for request: %@", (uint8_t *)&v33, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buffer, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendBodyData:", v15);

    goto LABEL_18;
  }
  if (v9 < 0)
  {
    v24 = (void *)MEMORY[0x1A1AC355C]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v27;
      v35 = 2112;
      v36 = (CFIndex)v8;
      _os_log_impl(&dword_19B546000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to read available data for request: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMFCFHTTPServerConnection _handleCompletedReceivedRequest:error:](v25, "_handleCompletedReceivedRequest:error:", v8, v28);

  }
  else
  {
    objc_msgSend(v8, "body");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
LABEL_17:
      -[_HMFCFHTTPServerConnection _handleCompletedReceivedRequest:error:](self, "_handleCompletedReceivedRequest:error:", v8, 0);
      goto LABEL_18;
    }
    v29 = (void *)MEMORY[0x1A1AC355C]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v32;
      v35 = 2112;
      v36 = (CFIndex)v8;
      _os_log_impl(&dword_19B546000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Got zero bytes read and no accumulated read bytes for request: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }
LABEL_18:

}

- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4
{
  -[_HMFCFHTTPServerConnection _sendStatusCode:forRequest:bodyData:](self, "_sendStatusCode:forRequest:bodyData:", a3, a4, 0);
}

- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4 bodyData:(id)a5
{
  id v8;
  id v9;
  _HMFCFHTTPServerResponse *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id from;
  id location;

  v8 = a4;
  v9 = a5;
  -[_HMFCFHTTPServerConnection _stopReadBody:](self, "_stopReadBody:", v8);
  -[NSMutableArray removeObject:](self->_pendingRequests, "removeObject:", v8);
  v10 = -[_HMFCFHTTPServerResponse initWithRequest:statusCode:]([_HMFCFHTTPServerResponse alloc], "initWithRequest:statusCode:", v8, a3);
  -[_HMFCFHTTPServerResponse setBody:](v10, "setBody:", v9);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66___HMFCFHTTPServerConnection__sendStatusCode_forRequest_bodyData___block_invoke;
  v14 = &unk_1E3B38858;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  -[_HMFCFHTTPServerResponse setCompletionHandler:](v10, "setCompletionHandler:", &v11);
  -[_HMFCFHTTPServerConnection sendResponse:](self, "sendResponse:", v10, v11, v12, v13, v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)sendResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _HMFCFHTTPServerConnection *v8;

  v4 = a3;
  if (v4)
  {
    -[_HMFCFHTTPServerConnection clientQueue](self, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43___HMFCFHTTPServerConnection_sendResponse___block_invoke;
    v6[3] = &unk_1E3B37CA8;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)_handleCompletedResponse:(_CFHTTPServerResponse *)a3 error:(id)a4
{
  id v6;
  void *v7;
  _HMFCFHTTPServerConnection *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _HMFCFHTTPServerConnection *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  _CFHTTPServerResponse *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _CFHTTPServerResponse *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC355C]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v10;
    v41 = 2112;
    v42 = a3;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Completed sending response, %@, with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[_HMFCFHTTPServerConnection pendingRespones](v8, "pendingRespones", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  v15 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v35 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if ((_CFHTTPServerResponse *)objc_msgSend(v17, "responseRef") == a3)
      {
        objc_msgSend(v17, "activity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "invalidate");

        objc_msgSend(v17, "request");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "activity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "invalidate");

        v21 = (void *)MEMORY[0x1A1AC355C]();
        v22 = v8;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v6)
        {
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          HMFGetLogIdentifier(v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "shortDescription");
          v26 = (_CFHTTPServerResponse *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          v41 = 2112;
          v42 = v26;
          v43 = 2112;
          v44 = v6;
          v27 = "%{public}@Failed to send response, %@, with error: %@";
          v28 = v24;
          v29 = OS_LOG_TYPE_DEFAULT;
          v30 = 32;
        }
        else
        {
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          HMFGetLogIdentifier(v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "shortDescription");
          v26 = (_CFHTTPServerResponse *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          v41 = 2112;
          v42 = v26;
          v27 = "%{public}@Successfully sent response: %@";
          v28 = v24;
          v29 = OS_LOG_TYPE_INFO;
          v30 = 22;
        }
        _os_log_impl(&dword_19B546000, v28, v29, v27, buf, v30);

LABEL_18:
        objc_autoreleasePoolPop(v21);
        -[_HMFCFHTTPServerConnection pendingRespones](v22, "pendingRespones");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObject:", v17);

        objc_msgSend(v17, "completionHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v17, "completionHandler");
          v33 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v33)[2](v33, v6);

          objc_msgSend(v17, "setCompletionHandler:", 0);
        }
        goto LABEL_20;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
      continue;
    break;
  }
LABEL_20:

}

+ (id)logCategory
{
  if (_MergedGlobals_3_7 != -1)
    dispatch_once(&_MergedGlobals_3_7, &__block_literal_global_23);
  return (id)qword_1ED012F08;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[_HMFCFHTTPServerConnection address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_HMFCFHTTPServerConnectionDelegate)delegate
{
  return (_HMFCFHTTPServerConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFNetAddress)address
{
  return self->_address;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (NSMutableArray)pendingRespones
{
  return self->_pendingRespones;
}

- (_CFHTTPServerConnection)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRespones, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
