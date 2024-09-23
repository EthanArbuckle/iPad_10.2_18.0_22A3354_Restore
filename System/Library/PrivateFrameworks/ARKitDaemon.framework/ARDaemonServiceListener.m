@implementation ARDaemonServiceListener

- (ARDaemonServiceListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4 watchdogMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;
  ARDaemonServiceListener *v11;
  ARDaemonServiceListener *v12;
  uint64_t v13;
  NSMutableDictionary *xpcListeners;
  uint64_t v15;
  NSMutableDictionary *serviceClasses;
  uint64_t v17;
  OS_dispatch_queue *serviceQueue;
  NSObject *v19;
  _QWORD block[4];
  ARDaemonServiceListener *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ARDaemonServiceListener;
  v11 = -[ARDaemonServiceListener init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_daemonConfiguration, a4);
    v13 = objc_opt_new();
    xpcListeners = v12->_xpcListeners;
    v12->_xpcListeners = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    serviceClasses = v12->_serviceClasses;
    v12->_serviceClasses = (NSMutableDictionary *)v15;

    ARCreateFixedPriorityDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(v10, "addQueue:hangPolicy:", v12->_serviceQueue, 0);
    v19 = v12->_serviceQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__ARDaemonServiceListener_initWithDelegate_daemonConfiguration_watchdogMonitor___block_invoke;
    block[3] = &unk_250702718;
    v22 = v12;
    dispatch_sync(v19, block);

  }
  return v12;
}

void __80__ARDaemonServiceListener_initWithDelegate_daemonConfiguration_watchdogMonitor___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  ARGetSubclassesForClass();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x23B7DC4D0](v3);
        objc_msgSend(v7, "performSelector:", sel_serviceName, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 32), "addServiceByName:serviceClass:", v9, v7);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

}

- (id)listenerForServiceNamed:(id)a3
{
  id v4;
  NSObject *serviceQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ARDaemonServiceListener_listenerForServiceNamed___block_invoke;
  block[3] = &unk_250702740;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serviceQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__ARDaemonServiceListener_listenerForServiceNamed___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)addServiceWithQueueByName:(id)a3 serviceClass:(Class)a4
{
  id v6;
  NSObject *serviceQueue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  Class v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  serviceQueue = self->_serviceQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__ARDaemonServiceListener_addServiceWithQueueByName_serviceClass___block_invoke;
  v10[3] = &unk_250702768;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(serviceQueue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __66__ARDaemonServiceListener_addServiceWithQueueByName_serviceClass___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addServiceByName:serviceClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addServiceByName:(id)a3 serviceClass:(Class)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  ARDaemonServiceListener *v20;
  __int16 v21;
  Class v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v9;
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = a4;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_235C46000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding listener for service: <%@:%@>", (uint8_t *)&v17, 0x2Au);

  }
  -[NSMutableDictionary allKeys](self->_serviceClasses, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if (v11)
  {
    _ARLogDaemon_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v21 = 2112;
      v22 = a4;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_235C46000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Duplicate service names are not allowed: <%@:%@>", (uint8_t *)&v17, 0x2Au);

    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_serviceClasses, "setObject:forKey:", a4, v6);
    if ((-[ARDaemonConfiguration isInProcess](self->_daemonConfiguration, "isInProcess") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v6);
    }
    v12 = v15;
    -[NSObject setDelegate:](v15, "setDelegate:", self);
    -[NSObject _setQueue:](v12, "_setQueue:", self->_serviceQueue);
    -[NSMutableDictionary setObject:forKey:](self->_xpcListeners, "setObject:forKey:", v12, v6);
    -[NSObject resume](v12, "resume");
  }

  return v11 ^ 1;
}

- (id)createService:(id)a3
{
  id v4;
  NSMutableDictionary *serviceClasses;
  void *v6;
  objc_class *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  int v22;
  void *v23;
  __int16 v24;
  ARDaemonServiceListener *v25;
  __int16 v26;
  objc_class *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  serviceClasses = self->_serviceClasses;
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)(id)-[NSMutableDictionary objectForKey:](serviceClasses, "objectForKey:", v6);

  if (v7)
  {
    v8 = objc_msgSend([v7 alloc], "initWithConnection:", v4);
    _ARLogDaemon_2();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138544130;
        v23 = v12;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_235C46000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Created %@ for service name: %@", (uint8_t *)&v22, 0x2Au);

      }
      v8 = v8;
      v14 = v8;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceName");
        v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v19;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_235C46000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create service for service name: %@", (uint8_t *)&v22, 0x20u);

      }
      v14 = 0;
    }
  }
  else
  {
    _ARLogDaemon_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceName");
      v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = self;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_235C46000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to find service class for service name: %@", (uint8_t *)&v22, 0x20u);

    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  ARDaemonServiceListener *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (-[ARDaemonConfiguration isInProcess](self->_daemonConfiguration, "isInProcess"))
  {
    objc_msgSend(v7, "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[NSMutableDictionary allKeys](self->_xpcListeners, "allKeys", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_xpcListeners, "objectForKeyedSubscript:", v14);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            if (v15 == v6)
            {
              objc_msgSend(v7, "setValue:forKey:", v14, CFSTR("_serviceName"));
              goto LABEL_13;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }
  _ARLogDaemon_2();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ar_processName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "processIdentifier");
    objc_msgSend(v7, "serviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v38 = v18;
    v39 = 2048;
    v40 = self;
    v41 = 2114;
    v42 = v19;
    v43 = 1024;
    v44 = v20;
    v45 = 2114;
    v46 = v21;
    _os_log_impl(&dword_235C46000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Listener received request from process: %{public}@ (%d) to accept connection for service: %{public}@", buf, 0x30u);

  }
  -[ARDaemonServiceListener createService:](self, "createService:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _ARLogDaemon_2();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_235C46000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Accepting connection for service: %@", buf, 0x20u);

    }
    -[ARDaemonServiceListener delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "didDiscoverService:", v22);

    objc_msgSend(v7, "resume");
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_235C46000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to accept connection for service: %@", buf, 0x20u);

    }
  }

  return v22 != 0;
}

- (ARDaemonServiceListenerDelegate)delegate
{
  return (ARDaemonServiceListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceClasses, 0);
  objc_storeStrong((id *)&self->_xpcListeners, 0);
  objc_storeStrong((id *)&self->_daemonConfiguration, 0);
}

@end
