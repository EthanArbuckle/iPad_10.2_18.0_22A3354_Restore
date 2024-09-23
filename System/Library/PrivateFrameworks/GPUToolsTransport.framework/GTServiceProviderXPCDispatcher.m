@implementation GTServiceProviderXPCDispatcher

- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  GTServiceProviderXPCDispatcher *v10;
  GTServiceProviderXPCDispatcher *v11;
  objc_super v13;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addObject:", CFSTR("broadcastDisconnect"));
  v13.receiver = self;
  v13.super_class = (Class)GTServiceProviderXPCDispatcher;
  v10 = -[GTXPCDispatcher initWithProtocolMethods:](&v13, sel_initWithProtocolMethods_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_serviceProvider, a3);

  return v11;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_registeredConnections, a3);
}

- (void)allServices:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[GTServiceProvider allServices](self->_serviceProvider, "allServices");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isTrusted") & 1) == 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v8, 1);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v10;
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "serviceProperties", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDeviceUDID:", 0);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v8);
  objc_msgSend(v7, "sendMessage:", v9);

}

- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsobject;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *registeredConnections;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  gt_xpc_dictionary_create_reply(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "serviceProperties", v9);
  if (nsobject)
  {
    v11 = objc_opt_class();
    v12 = xpc_dictionary_get_nsobject(v6, "processInfo", v11);
    if (!v12)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTServiceProvider"), CFSTR("Invalid processInfo argument passed to registerService"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_set_nserror(v8, "error", v22);
      objc_msgSend(v7, "sendMessage:", v8);

      goto LABEL_7;
    }
    -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", nsobject, v12);
    registeredConnections = self->_registeredConnections;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(nsobject, "servicePort"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredConnections, "setObject:forKeyedSubscript:", v7, v14);

    objc_msgSend(nsobject, "deviceUDID");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v8, "deviceUDID", (const char *)objc_msgSend(v15, "UTF8String"));

    xpc_dictionary_set_uint64(v8, "servicePort", objc_msgSend(nsobject, "servicePort"));
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTServiceProvider"), CFSTR("Invalid serviceProperties argument passed to registerService"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_nserror(v8, "error", v12);
  }
  objc_msgSend(v7, "sendMessage:", v8);
LABEL_7:

}

- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *string;
  GTServiceProvider *serviceProvider;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__GTServiceProviderXPCDispatcher_waitForService_completionHandler__replyConnection___block_invoke;
  v13[3] = &unk_24F827D08;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  -[GTServiceProvider waitForService:completionHandler:](serviceProvider, "waitForService:completionHandler:", string, v13);

}

uint64_t __84__GTServiceProviderXPCDispatcher_waitForService_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)waitForService_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *string;
  GTServiceProvider *serviceProvider;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__GTServiceProviderXPCDispatcher_waitForService_error__replyConnection___block_invoke;
  v13[3] = &unk_24F827D08;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  -[GTServiceProvider waitForService:completionHandler:](serviceProvider, "waitForService:completionHandler:", string, v13);

}

uint64_t __72__GTServiceProviderXPCDispatcher_waitForService_error__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)deregisterService_:(id)a3 replyConnection:(id)a4
{
  uint64_t uint64;
  NSMutableDictionary *registeredConnections;
  id v7;

  uint64 = xpc_dictionary_get_uint64(a3, "servicePort");
  -[GTServiceProvider deregisterService:](self->_serviceProvider, "deregisterService:", uint64);
  registeredConnections = self->_registeredConnections;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](registeredConnections, "removeObjectForKey:", v7);

}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  GTServiceProviderObserver *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTServiceProviderObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTServiceProvider registerObserver:](self->_serviceProvider, "registerObserver:", v10);
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GTServiceProvider deregisterObserver:](self->_serviceProvider, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
  gt_xpc_dictionary_create_reply(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendMessage:", v8);
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GTServiceProvider deregisterObserversForConnection:path:](self->_serviceProvider, "deregisterObserversForConnection:path:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConnections, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

@end
