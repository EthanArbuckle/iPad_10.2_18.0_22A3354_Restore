@implementation GTServiceProvider

- (GTServiceProvider)init
{
  GTServiceProvider *v2;
  os_log_t v3;
  OS_os_log *log;
  NSMutableDictionary *v5;
  NSMutableDictionary *services;
  NSMutableDictionary *v7;
  NSMutableDictionary *waiting;
  uint64_t v9;
  GTObservableService *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GTServiceProvider;
  v2 = -[GTServiceProvider init](&v12, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.gputools.transport", "ServiceProvider");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    services = v2->_services;
    v2->_services = v5;

    v2->_nextServiceID = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    waiting = v2->_waiting;
    v2->_waiting = v7;

    v9 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (GTObservableService *)v9;

  }
  return v2;
}

- (void)_registerService:(id)a3 forProcess:(id)a4 forPort:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  GTProcessService *v12;
  NSMutableDictionary *services;
  void *v14;
  NSObject *log;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *waiting;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "deviceUDID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceUDID:", v11);

  }
  objc_msgSend(v8, "setServicePort:", a5);
  v12 = -[GTProcessService initWithService:processInfo:]([GTProcessService alloc], "initWithService:processInfo:", v8, v9);
  services = self->_services;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](services, "setObject:forKeyedSubscript:", v12, v14);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v16 = log;
    objc_msgSend(v8, "protocolName");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "UTF8String");
    objc_msgSend(v8, "deviceUDID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v37 = v18;
    v38 = 2048;
    v39 = a5;
    v40 = 2112;
    v41 = v19;
    _os_log_impl(&dword_22D095000, v16, OS_LOG_TYPE_INFO, "Service Registered name:%s port:%lu udid:%@", buf, 0x20u);

  }
  -[NSMutableDictionary allValues](self->_services, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GTServiceProvider notifyServiceListChanged:](self, "notifyServiceListChanged:", v20);

  waiting = self->_waiting;
  objc_msgSend(v8, "protocolName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](waiting, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = self->_waiting;
    objc_msgSend(v8, "protocolName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v24, "removeObjectForKey:", v25);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(v26);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v28);
    }

  }
}

- (void)registerDefaultServiceProvider:(id)a3 forProcess:(id)a4
{
  -[GTServiceProvider _registerService:forProcess:forPort:](self, "_registerService:forProcess:forPort:", a3, a4, 0);
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
  -[GTServiceProvider _registerService:forProcess:forPort:](self, "_registerService:forProcess:forPort:", a3, a4, self->_nextServiceID++);
}

- (id)allServices
{
  return (id)-[NSMutableDictionary allValues](self->_services, "allValues");
}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v25 = (void (**)(_QWORD, _QWORD))v7;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = self->_services;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serviceProperties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "protocolName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v6);

          if (v17)
          {
            v8 = v25;
            v25[2](v25, 0);
            goto LABEL_15;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_waiting, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_waiting, "setObject:forKeyedSubscript:", v19, v6);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_waiting, "objectForKeyedSubscript:", v6);
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    v20 = (void *)objc_msgSend(v25, "copy");
    v21 = (void *)MEMORY[0x22E30CB48]();
    -[NSMutableDictionary addObject:](v9, "addObject:", v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid protocol name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.serviceprovider"), 0, v24);
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, NSMutableDictionary *))v8)[2](v8, v9);
  }
LABEL_15:

}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  BOOL v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__GTServiceProvider_waitForService_error___block_invoke;
  v11[3] = &unk_24F827C90;
  v12 = v7;
  v13 = &v14;
  v8 = v7;
  -[GTServiceProvider waitForService:completionHandler:](self, "waitForService:completionHandler:", v6, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __42__GTServiceProvider_waitForService_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)deregisterService:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GTServiceProvider disconnectServicePorts:](self, "disconnectServicePorts:", v5);

}

- (void)deregisterObserver:(unint64_t)a3
{
  -[GTObservableService deregisterObserver:](self->_observers, "deregisterObserver:", a3);
}

- (unint64_t)registerObserver:(id)a3
{
  return -[GTObservableService registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  -[GTObservableService deregisterObserversForConnection:path:](self->_observers, "deregisterObserversForConnection:path:", a3, a4);
}

- (void)disconnectServicePorts:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *log;
  const char *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 136315394;
    v20 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v10, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serviceProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "protocolName");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");

        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          if (v14)
            v16 = (const char *)v14;
          else
            v16 = "";
          v17 = log;
          v18 = objc_msgSend(v10, "unsignedLongValue");
          *(_DWORD *)buf = v20;
          v26 = v16;
          v27 = 2048;
          v28 = v18;
          _os_log_impl(&dword_22D095000, v17, OS_LOG_TYPE_INFO, "Service Unregistered name:%s port:%lu", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_services, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary allValues](self->_services, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GTServiceProvider notifyServiceListChanged:](self, "notifyServiceListChanged:", v19);

}

- (void)notifyServiceListChanged:(id)a3
{
  id v4;
  GTObservableService *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__GTServiceProvider_notifyServiceListChanged___block_invoke;
  v7[3] = &unk_24F828150;
  v8 = v4;
  v6 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v7);

}

uint64_t __46__GTServiceProvider_notifyServiceListChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyServiceListChanged:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
