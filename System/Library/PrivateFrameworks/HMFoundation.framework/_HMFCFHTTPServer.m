@implementation _HMFCFHTTPServer

- (_HMFCFHTTPServer)init
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

- (_HMFCFHTTPServer)initWithPort:(unint64_t)a3 options:(unint64_t)a4
{
  char v4;
  _HMFCFHTTPServer *v6;
  _HMFCFHTTPServer *v7;
  const char *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *clientQueue;
  uint64_t v11;
  NSMutableArray *connections;
  HMFWeakObject *v13;
  void *v14;
  _HMFCFHTTPServer *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _HMFCFHTTPServer *v21;
  void *v22;
  _HMFCFHTTPServer *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _HMFCFHTTPServer *v28;
  NSObject *v29;
  void *v30;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x10000)
    _HMFPreconditionFailure(CFSTR("port <= UINT16_MAX"));
  v4 = a4;
  v32.receiver = self;
  v32.super_class = (Class)_HMFCFHTTPServer;
  v6 = -[_HMFCFHTTPServer init](&v32, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  v8 = (const char *)HMFDispatchQueueName(v6, 0);
  v9 = dispatch_queue_create(v8, 0);
  clientQueue = v7->_clientQueue;
  v7->_clientQueue = (OS_dispatch_queue *)v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_claimAutoreleasedReturnValue();
  connections = v7->_connections;
  v7->_connections = (NSMutableArray *)v11;

  v13 = -[HMFWeakObject initWithWeakObject:]([HMFWeakObject alloc], "initWithWeakObject:", v7);
  v7->_internal = (_CFHTTPServer *)_CFHTTPServerCreateService();
  if (!-[_HMFCFHTTPServer isValid](v7, "isValid"))
  {
    v22 = (void *)MEMORY[0x1A1AC355C]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create server, server is invalid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    goto LABEL_21;
  }
  if ((v4 & 2) != 0)
  {
    v14 = (void *)MEMORY[0x1A1AC355C]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_INFO, "%{public}@Requiring TLS in anonymous mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = *MEMORY[0x1E0C93008];
    v33[0] = *MEMORY[0x1E0C92FD0];
    v33[1] = v18;
    v34[0] = MEMORY[0x1E0C9AAB0];
    v34[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMFCFHTTPServer internal](v15, "internal");
    _CFHTTPServerSetProperty();

  }
  -[_HMFCFHTTPServer internal](v7, "internal");
  -[_HMFCFHTTPServer clientQueue](v7, "clientQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _CFHTTPServerSetDispatchQueue();

  if (!a3)
  {
    -[_HMFCFHTTPServer internal](v7, "internal");
    v26 = (void *)_CFHTTPServerCopyProperty();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v26, "integerValue"))
    {
      v7->_port = objc_msgSend(v26, "unsignedIntegerValue");

      goto LABEL_10;
    }
    v27 = (void *)MEMORY[0x1A1AC355C]();
    v28 = v7;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      _os_log_impl(&dword_19B546000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to bind server", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    -[_HMFCFHTTPServer invalidate](v28, "invalidate");

LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  v7->_port = a3;
LABEL_10:

LABEL_11:
  v21 = v7;
LABEL_22:

  return v21;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_connections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (self->_internal)
  {
    if (_CFHTTPServerIsValid())
      _CFHTTPServerInvalidate();
    CFRelease(self->_internal);
    self->_internal = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)_HMFCFHTTPServer;
  -[_HMFCFHTTPServer dealloc](&v8, sel_dealloc);
}

- (double)connectionIdleTimeout
{
  void *v2;
  CFTypeID TypeID;
  void *v4;
  id v5;
  double v6;
  double v7;

  -[_HMFCFHTTPServer internal](self, "internal");
  v2 = (void *)_CFHTTPServerCopyProperty();
  TypeID = CFNumberGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 15.0;
  }

  return v7;
}

- (void)setConnectionIdleTimeout:(double)a3
{
  -[_HMFCFHTTPServer internal](self, "internal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  _CFHTTPServerSetProperty();
}

- (double)watchdogTimeout
{
  void *v2;
  CFTypeID TypeID;
  void *v4;
  id v5;
  double v6;
  double v7;

  -[_HMFCFHTTPServer internal](self, "internal");
  v2 = (void *)_CFHTTPServerCopyProperty();
  TypeID = CFNumberGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 15.0;
  }

  return v7;
}

- (void)setWatchdogTimeout:(double)a3
{
  -[_HMFCFHTTPServer internal](self, "internal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  _CFHTTPServerSetProperty();
}

- (void)invalidate
{
  if (-[_HMFCFHTTPServer isValid](self, "isValid"))
  {
    -[_HMFCFHTTPServer internal](self, "internal");
    _CFHTTPServerInvalidate();
  }
}

- (BOOL)isValid
{
  -[_HMFCFHTTPServer internal](self, "internal");
  return _CFHTTPServerIsValid() != 0;
}

+ (id)logCategory
{
  if (_MergedGlobals_5_0 != -1)
    dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_18);
  return (id)qword_1ED012E48;
}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), -[_HMFCFHTTPServer port](self, "port"));
}

- (_HMFCFHTTPServerDelegate)delegate
{
  return (_HMFCFHTTPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)port
{
  return self->_port;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (_CFHTTPServer)internal
{
  return self->_internal;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
