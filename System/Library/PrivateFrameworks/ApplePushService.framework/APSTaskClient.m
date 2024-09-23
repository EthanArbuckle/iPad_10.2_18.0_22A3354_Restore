@implementation APSTaskClient

- (APSTaskClient)initWithEnvironment:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  APSTaskClient *v8;
  uint64_t v9;
  NSString *environment;
  uint64_t v11;
  NSXPCConnection *connection;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)APSTaskClient;
  v8 = -[APSTaskClient init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    environment = v8->_environment;
    v8->_environment = (NSString *)v9;

    objc_storeStrong((id *)&v8->_clientQueue, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.apsd.nsxpc"), 0);
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v11;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE410498);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8->_connection, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection _setQueue:](v8->_connection, "_setQueue:", v7);
    objc_initWeak(&location, v8);
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__APSTaskClient_initWithEnvironment_queue___block_invoke;
    v18[3] = &unk_1E3C8B1C8;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v8->_connection, "setInterruptionHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46;
    v16[3] = &unk_1E3C8B1C8;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v8->_connection, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](v8->_connection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  +[APSLog taskManager](APSLog, "taskManager");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__APSTaskClient_initWithEnvironment_queue___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearOutstandingTasks:", 4097);

}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  +[APSLog taskManager](APSLog, "taskManager");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearOutstandingTasks:", 4099);

}

- (void)dealloc
{
  NSString *environment;
  NSMutableArray *outstandingDNSRequests;
  NSXPCConnection *connection;
  objc_super v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  environment = self->_environment;
  self->_environment = 0;

  outstandingDNSRequests = self->_outstandingDNSRequests;
  self->_outstandingDNSRequests = 0;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v6.receiver = self;
  v6.super_class = (Class)APSTaskClient;
  -[APSTaskClient dealloc](&v6, sel_dealloc);
}

- (void)_clearOutstandingTasks:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSMutableArray *outstandingDNSRequests;
  NSMutableArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_outstandingDNSRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0CB28A8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v8, a3, 0);
        objc_msgSend(v10, "responseBlock");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v11);
        -[NSMutableArray removeObject:](self->_outstandingDNSRequests, "removeObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  outstandingDNSRequests = self->_outstandingDNSRequests;
  self->_outstandingDNSRequests = 0;

}

- (id)_findDNSRequestForHostname:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_outstandingDNSRequests;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "hostname", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_timeoutOutstandingRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  void *v18;
  void *v19;
  APSTaskClient *v20;
  NSMutableArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = self;
  obj = self->_outstandingDNSRequests;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = *MEMORY[0x1E0CB2FE0];
    v8 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "requestStartTime", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "timeIntervalSinceDate:", v11);
        v13 = v12;
        objc_msgSend(v10, "timeout");
        v15 = v14;

        if (v13 > v15)
        {
          objc_msgSend(v10, "responseBlock");
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = v8;
          v27 = CFSTR("DNS Request timed out");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", v7, 60, v18);
          ((void (**)(_QWORD, _QWORD, void *))v16)[2](v16, 0, v19);

          -[NSMutableArray removeObject:](v20->_outstandingDNSRequests, "removeObject:", v10);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }

}

- (id)resolveDNS:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *outstandingDNSRequests;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSXPCConnection *connection;
  id v16;
  void *v17;
  double v18;
  dispatch_time_t v19;
  NSObject *clientQueue;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  APSTaskClient *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  objc_msgSend(v4, "setEnvironment:", self->_environment);
  if (!self->_outstandingDNSRequests)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    outstandingDNSRequests = self->_outstandingDNSRequests;
    self->_outstandingDNSRequests = v5;

  }
  +[APSLog taskManager](APSLog, "taskManager");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hostname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeout");
    v10 = v9;
    objc_msgSend(v4, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2048;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "Starting DNS resolution for hostname %@ timeout %f environment %@", buf, 0x20u);

  }
  -[NSMutableArray addObject:](self->_outstandingDNSRequests, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestStartTime:", v12);

  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __28__APSTaskClient_resolveDNS___block_invoke;
  v26[3] = &unk_1E3C8B1F0;
  v26[4] = self;
  v14 = (void *)MEMORY[0x1A1AC918C](v26);
  connection = self->_connection;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __28__APSTaskClient_resolveDNS___block_invoke_2;
  v23[3] = &unk_1E3C8B218;
  v24 = v4;
  v25 = self;
  v16 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeout");
  v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
  clientQueue = self->_clientQueue;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __28__APSTaskClient_resolveDNS___block_invoke_56;
  v22[3] = &unk_1E3C8B240;
  v22[4] = self;
  dispatch_after(v19, clientQueue, v22);
  objc_msgSend(v17, "resolveDNS:reply:", v16, v14);

  return 0;
}

void __28__APSTaskClient_resolveDNS___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v18 = a3;
  v8 = a4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "hostname");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if (v16)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
          objc_msgSend(v14, "responseBlock");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, id))v17)[2](v17, v18, v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

void __28__APSTaskClient_resolveDNS___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);

  v3 = a2;
  +[APSLog taskManager](APSLog, "taskManager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __28__APSTaskClient_resolveDNS___block_invoke_2_cold_2((uint64_t)v3, v4);

  v5 = *(id *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 24));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[APSLog taskManager](APSLog, "taskManager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __28__APSTaskClient_resolveDNS___block_invoke_2_cold_1(v5, v6);

    objc_msgSend(v5, "responseBlock");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v5);

  }
}

uint64_t __28__APSTaskClient_resolveDNS___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutOutstandingRequests");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_outstandingDNSRequests, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "XPC connection is interrupted", a5, a6, a7, a8, 0);
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "XPC connection is invalidated", a5, a6, a7, a8, 0);
}

void __28__APSTaskClient_resolveDNS___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hostname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_19BBC2000, a2, OS_LOG_TYPE_ERROR, "Removing hostname %@ DNS request %@ from list of outstanding DNS requests", (uint8_t *)&v5, 0x16u);

}

void __28__APSTaskClient_resolveDNS___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19BBC2000, a2, OS_LOG_TYPE_ERROR, "NSXPC error encountered while resolving DNS: %@", (uint8_t *)&v2, 0xCu);
}

@end
