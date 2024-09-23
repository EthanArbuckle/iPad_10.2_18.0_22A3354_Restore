@implementation CLKComplicationClientManager

+ (id)sharedClientManager
{
  if (sharedClientManager_onceToken != -1)
    dispatch_once(&sharedClientManager_onceToken, &__block_literal_global_14);
  return (id)sharedClientManager___sharedClientManager;
}

uint64_t __51__CLKComplicationClientManager_sharedClientManager__block_invoke()
{
  CLKComplicationClientManager *v0;
  void *v1;
  uint64_t result;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc_init(CLKComplicationClientManager);
  v1 = (void *)sharedClientManager___sharedClientManager;
  sharedClientManager___sharedClientManager = (uint64_t)v0;

  result = CLKIsClockFaceApp();
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.ClockKit.complicationserver"));
    v4 = (void *)sharedClientManager___listener;
    sharedClientManager___listener = v3;

    objc_msgSend((id)sharedClientManager___listener, "setDelegate:", sharedClientManager___sharedClientManager);
    objc_msgSend((id)sharedClientManager___listener, "resume");
    return notify_post((const char *)objc_msgSend(CFSTR("com.apple.ClockKit.complicationservicedidstart"), "UTF8String"));
  }
  return result;
}

- (CLKComplicationClientManager)init
{
  CLKComplicationClientManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *clientsByIdentifier;
  NSLock *v5;
  NSLock *clientsByIdentifierLock;
  NSMutableDictionary *v7;
  NSMutableDictionary *waitForClientRegistriesByIdentifier;
  NSLock *v9;
  NSLock *waitForClientRegistriesByIdentifierLock;
  NSMutableSet *v11;
  NSMutableSet *anonymousClients;
  NSLock *v13;
  NSLock *anonymousClientsLock;
  NSMutableSet *v15;
  NSMutableSet *clientPIDs;
  NSLock *v17;
  NSLock *clientPIDsLock;
  NSLock *v19;
  NSLock *nextWaitForClientTokenValueLock;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLKComplicationClientManager;
  v2 = -[CLKComplicationClientManager init](&v22, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clientsByIdentifier = v2->_clientsByIdentifier;
    v2->_clientsByIdentifier = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    clientsByIdentifierLock = v2->_clientsByIdentifierLock;
    v2->_clientsByIdentifierLock = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    waitForClientRegistriesByIdentifier = v2->_waitForClientRegistriesByIdentifier;
    v2->_waitForClientRegistriesByIdentifier = v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    waitForClientRegistriesByIdentifierLock = v2->_waitForClientRegistriesByIdentifierLock;
    v2->_waitForClientRegistriesByIdentifierLock = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    anonymousClients = v2->_anonymousClients;
    v2->_anonymousClients = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    anonymousClientsLock = v2->_anonymousClientsLock;
    v2->_anonymousClientsLock = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clientPIDs = v2->_clientPIDs;
    v2->_clientPIDs = v15;

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    clientPIDsLock = v2->_clientPIDsLock;
    v2->_clientPIDsLock = v17;

    v19 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    nextWaitForClientTokenValueLock = v2->_nextWaitForClientTokenValueLock;
    v2->_nextWaitForClientTokenValueLock = v19;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLKComplicationClientManager;
  -[CLKComplicationClientManager dealloc](&v2, sel_dealloc);
}

- (NSDictionary)clientsByIdentifier
{
  void *v3;

  -[NSLock lock](self->_clientsByIdentifierLock, "lock");
  v3 = (void *)-[NSMutableDictionary copy](self->_clientsByIdentifier, "copy");
  -[NSLock unlock](self->_clientsByIdentifierLock, "unlock");
  return (NSDictionary *)v3;
}

- (void)enumerateClientsWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSLock lock](self->_clientsByIdentifierLock, "lock");
  v6 = (id)-[NSMutableDictionary copy](self->_clientsByIdentifier, "copy");
  -[NSLock unlock](self->_clientsByIdentifierLock, "unlock");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CLKComplicationClientManager_enumerateClientsWithBlock___block_invoke;
  v7[3] = &unk_24CBFA870;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __58__CLKComplicationClientManager_enumerateClientsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)waitForClientWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSLock *nextWaitForClientTokenValueLock;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[NSLock lock](self->_clientsByIdentifierLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_clientsByIdentifier, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_clientsByIdentifierLock, "unlock");
  if (v8)
  {
    v7[2](v7, v8);
    v9 = 0;
  }
  else
  {
    -[NSLock lock](self->_nextWaitForClientTokenValueLock, "lock");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_nextWaitForClientTokenValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    nextWaitForClientTokenValueLock = self->_nextWaitForClientTokenValueLock;
    ++self->_nextWaitForClientTokenValue;
    -[NSLock unlock](nextWaitForClientTokenValueLock, "unlock");
    CLKLoggingObjectForDomain(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2114F4000, v11, OS_LOG_TYPE_DEFAULT, "Waiting for client with identifier %@ (token = %@)...", (uint8_t *)&v16, 0x16u);
    }

    -[NSLock lock](self->_waitForClientRegistriesByIdentifierLock, "lock");
    -[NSMutableDictionary objectForKey:](self->_waitForClientRegistriesByIdentifier, "objectForKey:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[NSMutableDictionary setObject:forKey:](self->_waitForClientRegistriesByIdentifier, "setObject:forKey:", v12, v6);
    }
    -[NSLock unlock](self->_waitForClientRegistriesByIdentifierLock, "unlock");
    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = (void *)MEMORY[0x212BDBEAC]();
    objc_msgSend(v12, "setObject:forKey:", v14, v9);

  }
  return v9;
}

- (void)stopWaitingForClientWithIdentifier:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    CLKLoggingObjectForDomain(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "Stop waiting for client with identifier %@ (token = %@)...", (uint8_t *)&v10, 0x16u);
    }

    -[NSLock lock](self->_waitForClientRegistriesByIdentifierLock, "lock");
    -[NSMutableDictionary objectForKey:](self->_waitForClientRegistriesByIdentifier, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_waitForClientRegistriesByIdentifierLock, "unlock");
    objc_msgSend(v9, "removeObjectForKey:", v7);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CLKComplicationClientManager *v10;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke;
  v8[3] = &unk_24CBFA008;
  v9 = v5;
  v10 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  return 1;
}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  CLKComplicationClient *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = -[CLKComplicationClient initWithConnection:]([CLKComplicationClient alloc], "initWithConnection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "unlock");
  v3 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v5[3] = &unk_24CBFA898;
  v5[4] = *(_QWORD *)(a1 + 40);
  -[CLKComplicationClient setCheckinHandler:](v2, "setCheckinHandler:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_3;
  v4[3] = &unk_24CBFA898;
  v4[4] = *(_QWORD *)(a1 + 40);
  -[CLKComplicationClient setInvalidationHandler:](v2, "setInvalidationHandler:", v4);
  objc_msgSend(*(id *)(a1 + 32), "resume");

}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unlock");
  objc_msgSend(*(id *)(a1 + 32), "_addClient:", v4);

}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unlock");
  objc_msgSend(*(id *)(a1 + 32), "_removeClient:", v4);

}

- (void)_addClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableSet *clientPIDs;
  void *v9;
  void (**clientRegistrationHandler)(id, id);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_2114F4000, v6, OS_LOG_TYPE_DEFAULT, "Adding client with identifier %@", buf, 0xCu);
    }

    -[NSLock lock](self->_clientPIDsLock, "lock");
    clientPIDs = self->_clientPIDs;
    objc_msgSend(v4, "pid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](clientPIDs, "addObject:", v9);

    -[NSLock unlock](self->_clientPIDsLock, "unlock");
    -[NSLock lock](self->_clientsByIdentifierLock, "lock");
    -[NSMutableDictionary setObject:forKey:](self->_clientsByIdentifier, "setObject:forKey:", v4, v5);
    -[NSLock unlock](self->_clientsByIdentifierLock, "unlock");
    clientRegistrationHandler = (void (**)(id, id))self->_clientRegistrationHandler;
    if (clientRegistrationHandler)
      clientRegistrationHandler[2](clientRegistrationHandler, v4);
    -[NSLock lock](self->_waitForClientRegistriesByIdentifierLock, "lock");
    -[NSMutableDictionary objectForKey:](self->_waitForClientRegistriesByIdentifier, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_waitForClientRegistriesByIdentifier, "removeObjectForKey:", v5);
    -[NSLock unlock](self->_waitForClientRegistriesByIdentifierLock, "unlock");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v11, "allValues", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 16))();
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl(&dword_2114F4000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating client due to no identifier %@", buf, 0xCu);
    }

    objc_msgSend(v4, "invalidate");
  }

}

- (void)_removeClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**clientUnregistrationHandler)(id, id);
  NSMutableDictionary *clientsByIdentifier;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableSet *clientPIDs;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CLKLoggingObjectForDomain(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "Removing client with identifier %@", (uint8_t *)&v20, 0xCu);

  }
  clientUnregistrationHandler = (void (**)(id, id))self->_clientUnregistrationHandler;
  if (clientUnregistrationHandler)
    clientUnregistrationHandler[2](clientUnregistrationHandler, v4);
  -[NSLock lock](self->_clientsByIdentifierLock, "lock");
  clientsByIdentifier = self->_clientsByIdentifier;
  objc_msgSend(v4, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clientsByIdentifier, "objectForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    v16 = self->_clientsByIdentifier;
    objc_msgSend(v4, "clientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

    -[NSLock lock](self->_clientPIDsLock, "lock");
    clientPIDs = self->_clientPIDs;
    objc_msgSend(v4, "pid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](clientPIDs, "removeObject:", v19);

    -[NSLock unlock](self->_clientPIDsLock, "unlock");
  }
  else
  {
    CLKLoggingObjectForDomain(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "clientIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_clientsByIdentifier;
      objc_msgSend(v4, "clientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2114F4000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to remove wrong CLKComplicationClient with identifier %@ (%@ for %@)", (uint8_t *)&v20, 0x20u);

    }
  }
  -[NSLock unlock](self->_clientsByIdentifierLock, "unlock");

}

- (id)clientRegistrationHandler
{
  return self->_clientRegistrationHandler;
}

- (void)setClientRegistrationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)clientUnregistrationHandler
{
  return self->_clientUnregistrationHandler;
}

- (void)setClientUnregistrationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientUnregistrationHandler, 0);
  objc_storeStrong(&self->_clientRegistrationHandler, 0);
  objc_storeStrong((id *)&self->_nextWaitForClientTokenValueLock, 0);
  objc_storeStrong((id *)&self->_clientPIDsLock, 0);
  objc_storeStrong((id *)&self->_clientPIDs, 0);
  objc_storeStrong((id *)&self->_anonymousClientsLock, 0);
  objc_storeStrong((id *)&self->_anonymousClients, 0);
  objc_storeStrong((id *)&self->_waitForClientRegistriesByIdentifierLock, 0);
  objc_storeStrong((id *)&self->_waitForClientRegistriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_clientsByIdentifierLock, 0);
  objc_storeStrong((id *)&self->_clientsByIdentifier, 0);
}

@end
