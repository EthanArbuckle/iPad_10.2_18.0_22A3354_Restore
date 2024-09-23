@implementation HMFHTTPServer

- (HMFHTTPServer)init
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

- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  HMFHTTPServer *v13;

  v10 = a4;
  v11 = a3;
  +[HMFNetManager sharedManager](HMFNetManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMFHTTPServer initWithServiceType:name:port:options:netManager:](self, "initWithServiceType:name:port:options:netManager:", v11, v10, a5, a6, v12);

  return v13;
}

- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6 netManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  HMFHTTPServer *v15;
  HMFHTTPServer *v16;
  const char *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *clientQueue;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSMutableArray *connections;
  uint64_t v26;
  NSMutableArray *requestHandlers;
  HMFMutableNetService *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  HMFMutableNetService *netService;
  HMFHTTPServer *v33;
  HMFHTTPServer *v34;
  void *v36;
  NSObject *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if ((a6 & 1) != 0 && !objc_msgSend(v13, "length"))
  {
    v36 = (void *)MEMORY[0x1A1AC355C]();
    v33 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v38;
      _os_log_impl(&dword_19B546000, v37, OS_LOG_TYPE_ERROR, "%{public}@A valid name is required for publishing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    v34 = 0;
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)HMFHTTPServer;
    v15 = -[HMFHTTPServer init](&v39, sel_init);
    v16 = v15;
    if (v15)
    {
      v17 = (const char *)HMFDispatchQueueName(v15, 0);
      v18 = dispatch_queue_create(v17, 0);
      clientQueue = v16->_clientQueue;
      v16->_clientQueue = (OS_dispatch_queue *)v18;

      v20 = objc_msgSend(v12, "length");
      if (v20)
        v21 = (__CFString *)objc_msgSend(v12, "copy");
      else
        v21 = CFSTR("_http");
      objc_storeStrong((id *)&v16->_serviceType, v21);
      if (v20)

      v22 = objc_msgSend(v13, "copy");
      name = v16->_name;
      v16->_name = (NSString *)v22;

      v16->_port = a5;
      v16->_options = a6;
      v16->_connectionIdleTimeout = 15.0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
      connections = v16->_connections;
      v16->_connections = (NSMutableArray *)v24;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = objc_claimAutoreleasedReturnValue();
      requestHandlers = v16->_requestHandlers;
      v16->_requestHandlers = (NSMutableArray *)v26;

      objc_storeStrong((id *)&v16->_netManager, a7);
      if ((a6 & 1) != 0)
      {
        v28 = [HMFMutableNetService alloc];
        -[HMFHTTPServer serviceType](v16, "serviceType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFHTTPServer name](v16, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HMFMutableNetService initWithDomain:type:name:port:](v28, "initWithDomain:type:name:port:", &stru_1E3B39EC0, v29, v30, -[HMFHTTPServer port](v16, "port"));
        netService = v16->_netService;
        v16->_netService = (HMFMutableNetService *)v31;

      }
    }
    v33 = v16;
    v34 = v33;
  }

  return v34;
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
  -[_HMFCFHTTPServer invalidate](self->_internal, "invalidate");
  -[HMFMutableNetService stopPublishing](self->_netService, "stopPublishing");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "close");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[HMFNetManager deregisterObject:](self->_netManager, "deregisterObject:", self);
  v8.receiver = self;
  v8.super_class = (Class)HMFHTTPServer;
  -[HMFHTTPServer dealloc](&v8, sel_dealloc);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %tu"), v4, -[HMFHTTPServer port](self, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  HMFAttributeDescription *v8;
  HMFAttributeDescription *v9;
  void *v10;
  HMFAttributeDescription *v11;
  HMFAttributeDescription *v12;
  void *v13;
  void *v14;
  HMFAttributeDescription *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFHTTPServer serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Service Type"), v4);
  v18[0] = v5;
  v6 = [HMFAttributeDescription alloc];
  -[HMFHTTPServer name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Name"), v7);
  v18[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMFHTTPServer port](self, "port"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMFAttributeDescription initWithName:value:](v9, "initWithName:value:", CFSTR("Port"), v10);
  v18[2] = v11;
  v12 = [HMFAttributeDescription alloc];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[HMFHTTPServer connectionIdleTimeout](self, "connectionIdleTimeout");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMFAttributeDescription initWithName:value:](v12, "initWithName:value:", CFSTR("Connection Idle Timeout"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)port
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HMFHTTPServer internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_port;
  -[HMFHTTPServer internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "port");

  return v5;
}

- (double)connectionIdleTimeout
{
  os_unfair_lock_s *p_lock;
  double connectionIdleTimeout;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  connectionIdleTimeout = self->_connectionIdleTimeout;
  os_unfair_lock_unlock(p_lock);
  return connectionIdleTimeout;
}

- (void)setConnectionIdleTimeout:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_connectionIdleTimeout != a3)
  {
    self->_connectionIdleTimeout = a3;
    -[_HMFCFHTTPServer setConnectionIdleTimeout:](self->_internal, "setConnectionIdleTimeout:", a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)connections
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](self->_connections, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](self->_connections, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (_HMFCFHTTPServer)internal
{
  os_unfair_lock_s *p_lock;
  _HMFCFHTTPServer *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_internal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternal:(id)a3
{
  _HMFCFHTTPServer *v4;
  _HMFCFHTTPServer *internal;

  v4 = (_HMFCFHTTPServer *)a3;
  os_unfair_lock_lock_with_options();
  internal = self->_internal;
  self->_internal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFHTTPServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HMFHTTPServer_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3B37D38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__HMFHTTPServer_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  _HMFCFHTTPServer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = -[_HMFCFHTTPServer initWithPort:options:]([_HMFCFHTTPServer alloc], "initWithPort:options:", objc_msgSend(*(id *)(a1 + 32), "port"), objc_msgSend(*(id *)(a1 + 32), "options"));
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v6);
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimeout");
    objc_msgSend(v8, "setConnectionIdleTimeout:");

    if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0)
    {
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v12;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling WoW", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "netManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerWoWAssertionForObject:", *(_QWORD *)(a1 + 32));

    }
    v14 = (void *)MEMORY[0x1A1AC355C]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(*(id *)(a1 + 32), "port");
      *(_DWORD *)buf = 138543618;
      v38 = v17;
      v39 = 2048;
      v40 = v18;
      _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Started server on port %tu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_initWeak(&location, *(id *)(a1 + 32));
    if ((objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0)
    {
      v26 = (void *)MEMORY[0x1A1AC355C]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_impl(&dword_19B546000, v28, OS_LOG_TYPE_INFO, "%{public}@Publishing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(*(id *)(a1 + 32), "netService");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPort:", objc_msgSend(*(id *)(a1 + 32), "port"));

      objc_msgSend(*(id *)(a1 + 32), "netService");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __44__HMFHTTPServer_startWithCompletionHandler___block_invoke_26;
      v33[3] = &unk_1E3B39708;
      objc_copyWeak(&v35, &location);
      v32 = *(void **)(a1 + 40);
      v33[4] = *(_QWORD *)(a1 + 32);
      v34 = v32;
      objc_msgSend(v31, "startPublishingWithCompletionHandler:", v33);

      objc_destroyWeak(&v35);
    }
    else
    {
      v19 = MEMORY[0x1A1AC373C](*(_QWORD *)(a1 + 40));
      v20 = (void *)v19;
      if (v19)
        (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);

    }
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC355C]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start server", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

void __44__HMFHTTPServer_startWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to publish net service with error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC355C]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Published", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  v13 = MEMORY[0x1A1AC373C](*(_QWORD *)(a1 + 40));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

- (void)stop
{
  -[HMFHTTPServer stopWithError:](self, "stopWithError:", 0);
}

- (void)stopWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFHTTPServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__HMFHTTPServer_stopWithError___block_invoke;
  v7[3] = &unk_1E3B37CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __31__HMFHTTPServer_stopWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_stopWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMFHTTPServer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMFHTTPServer internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopped with error: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMFHTTPServer internal](v7, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[HMFHTTPServer setInternal:](v7, "setInternal:", 0);
    -[HMFHTTPServer netService](v7, "netService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopPublishing");

    -[HMFHTTPServer delegate](v7, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "server:didStopWithError:", v7, v4);

  }
  -[HMFHTTPServer netManager](self, "netManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deregisterObject:", self);

}

- (NSArray)requestHandlers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_requestHandlers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)registerRequestHandler:(id)a3
{
  id v4;
  void *v5;
  HMFHTTPServer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding request handler: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](v6->_requestHandlers, "addObject:", v4);
    os_unfair_lock_unlock(&v6->_lock);
  }

}

- (void)unregisterRequestHandler:(id)a3
{
  id v4;
  void *v5;
  HMFHTTPServer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing request handler: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](v6->_requestHandlers, "removeObject:", v4);
    os_unfair_lock_unlock(&v6->_lock);
  }

}

- (void)_handleReceivedRequest:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFHTTPServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  HMFHTTPServer *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMFHTTPServer *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v11;
      v43 = 2112;
      v44 = v6;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request, %@, from connection: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMFHTTPServer requestHandlers](v9, "requestHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __51__HMFHTTPServer__handleReceivedRequest_connection___block_invoke;
    v38 = &unk_1E3B39730;
    v13 = v6;
    v39 = v13;
    v14 = v7;
    v40 = v14;
    objc_msgSend(v12, "hmf_objectPassingTest:", &v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "requestBlock", v35, v36, v37, v38, v39);
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1A1AC355C]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          HMFGetLogIdentifier(v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v26;
          v43 = 2112;
          v44 = v15;
          v45 = 2112;
          v46 = v13;
          _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_INFO, "%{public}@Found a matching request handler, %@, for the request, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v13, "internal");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "markWithReason:", CFSTR("Calling request handler"));

        ((void (**)(_QWORD, id, id))v21)[2](v21, v13, v14);
      }
      else
      {
        if (v25)
        {
          HMFGetLogIdentifier(v23);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v33;
          v43 = 2112;
          v44 = v15;
          v45 = 2112;
          v46 = v13;
          _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_INFO, "%{public}@Found a matching request handler, %@, for the request, %@, but there was no request block", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v13, "responseWithStatusCode:", 404);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendResponse:completionHandler:", v34, 0);

        v21 = 0;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1A1AC355C](v16, v17, v18, v19, v20);
      v30 = v9;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v32;
        v43 = 2112;
        v44 = v13;
        _os_log_impl(&dword_19B546000, v31, OS_LOG_TYPE_INFO, "%{public}@Failed to handle request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v13, "responseWithStatusCode:", 501, v35, v36, v37, v38, v39);
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendResponse:completionHandler:", v21, 0);
    }

  }
}

uint64_t __51__HMFHTTPServer__handleReceivedRequest_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "URLPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "evaluateWithObject:", v5);

  if (v6
    && (objc_msgSend(v3, "methodPredicate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "method"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "evaluateWithObject:", v8),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v3, "matchBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (objc_msgSend(v3, "matchBlock"),
          v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          v12 = v11[2](v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)),
          v11,
          (_DWORD)v12))
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_handleOpenedConnection:(id)a3
{
  id v4;
  HMFHTTPClientConnection *v5;
  void *v6;
  HMFHTTPServer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMFHTTPServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMFHTTPServer *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  HMFHTTPClientConnection *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  HMFHTTPClientConnection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMFHTTPClientConnection initWithConnection:]([HMFHTTPClientConnection alloc], "initWithConnection:", v4);
  v6 = (void *)MEMORY[0x1A1AC355C]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received connection: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMFHTTPServer delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v10, "server:shouldAcceptConnection:", v7, v5))
  {
    v15 = (void *)MEMORY[0x1A1AC355C]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@Rejecting connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC355C]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Accepted connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMFHTTPClientConnection setDelegate:](v5, "setDelegate:", v12);
    objc_initWeak((id *)buf, v12);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__HMFHTTPServer__handleOpenedConnection___block_invoke;
    v19[3] = &unk_1E3B39780;
    objc_copyWeak(&v22, (id *)buf);
    v20 = v5;
    v21 = v10;
    -[HMFHTTPClientConnection openWithCompletionHandler:](v20, "openWithCompletionHandler:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __41__HMFHTTPServer__handleOpenedConnection___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__HMFHTTPServer__handleOpenedConnection___block_invoke_2;
    v7[3] = &unk_1E3B39758;
    v8 = v3;
    v9 = v5;
    v10 = a1[4];
    v11 = a1[5];
    dispatch_async(v6, v7);

  }
}

void __41__HMFHTTPServer__handleOpenedConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1AC355C]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543874;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open connection, %@, with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Opened connection: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 56), "server:didOpenConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "addConnection:", *(_QWORD *)(a1 + 48));
  }
}

- (void)_handleClosedConnection:(id)a3
{
  id v4;
  void *v5;
  HMFHTTPServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMFHTTPServer *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection closed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMFHTTPServer connections](v6, "connections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__HMFHTTPServer__handleClosedConnection___block_invoke;
  v17[3] = &unk_1E3B397A8;
  v10 = v4;
  v18 = v10;
  objc_msgSend(v9, "hmf_objectPassingTest:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1A1AC355C]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Closing connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "close");
    -[HMFHTTPServer removeConnection:](v13, "removeConnection:", v11);
    -[HMFHTTPServer delegate](v13, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "server:didCloseConnection:", v13, v11);

  }
}

uint64_t __41__HMFHTTPServer__handleClosedConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)serverDidInvalidate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMFHTTPServer clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HMFHTTPServer_serverDidInvalidate___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __37__HMFHTTPServer_serverDidInvalidate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 12, CFSTR("Server invalidated."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", v2);

}

- (void)server:(id)a3 didOpenConnection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMFHTTPServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__HMFHTTPServer_server_didOpenConnection___block_invoke;
  v8[3] = &unk_1E3B37CA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __42__HMFHTTPServer_server_didOpenConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleOpenedConnection:", *(_QWORD *)(a1 + 40));
}

- (void)server:(id)a3 didCloseConnection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMFHTTPServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HMFHTTPServer_server_didCloseConnection___block_invoke;
  v8[3] = &unk_1E3B37CA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __43__HMFHTTPServer_server_didCloseConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleClosedConnection:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (_MergedGlobals_3_18 != -1)
    dispatch_once(&_MergedGlobals_3_18, &__block_literal_global_48);
  return (id)qword_1ED013038;
}

void __28__HMFHTTPServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.HTTP.Server"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013038;
  qword_1ED013038 = v0;

}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), -[HMFHTTPServer port](self, "port"));
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
  -[HMFHTTPServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HMFHTTPServer_connection_didReceiveRequest___block_invoke;
  block[3] = &unk_1E3B38480;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __46__HMFHTTPServer_connection_didReceiveRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReceivedRequest:connection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFObject debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Identity"));

  -[HMFHTTPServer connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "shortDescription", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientConnections"));
  -[HMFHTTPServer netService](self, "netService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "debugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("NetService"));

  return v3;
}

- (HMFHTTPServerDelegate)delegate
{
  return (HMFHTTPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)options
{
  return self->_options;
}

- (HMFMutableNetService)netService
{
  return self->_netService;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMFNetManager)netManager
{
  return self->_netManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netManager, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
