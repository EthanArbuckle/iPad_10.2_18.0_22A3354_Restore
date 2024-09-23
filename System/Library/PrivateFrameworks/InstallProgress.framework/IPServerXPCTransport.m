@implementation IPServerXPCTransport

+ (id)defaultXPCTransport
{
  if (defaultXPCTransport_onceToken != -1)
    dispatch_once(&defaultXPCTransport_onceToken, &__block_literal_global_99);
  return (id)defaultXPCTransport_transport;
}

void __43__IPServerXPCTransport_defaultXPCTransport__block_invoke()
{
  IPServerXPCTransport *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.InstallProgress.xpc"));
  v0 = -[IPServerXPCTransport initWithListener:]([IPServerXPCTransport alloc], "initWithListener:", v2);
  v1 = (void *)defaultXPCTransport_transport;
  defaultXPCTransport_transport = (uint64_t)v0;

}

- (IPServerXPCTransport)initWithListener:(id)a3
{
  id v5;
  IPServerXPCTransport *v6;
  IPServerXPCTransport *v7;
  NSMutableSet *v8;
  NSMutableSet *clients;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serviceQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IPServerXPCTransport;
  v6 = -[IPServerXPCTransport init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clients = v7->_clients;
    v7->_clients = v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.InstallProgress.IPServerXPCTransport.%p"), v7);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    serviceQueue = v7->_serviceQueue;
    v7->_serviceQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(v5, "setDelegate:", v7);
    objc_msgSend(v5, "_setQueue:", v7->_serviceQueue);

  }
  return v7;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)disseminateProgressUpdateForIdentity:(id)a3 currentProgress:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_clients;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "sendUpdateForIdentity:currentProgress:", v6, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)disseminateProgressEndForIdenitty:(id)a3 reason:(unint64_t)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_clients;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "sendProgressEndForIdentity:reason:", v6, a4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id WeakRetained;
  int v7;
  IPXPCClient *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "transport:shouldAcceptConnection:", self, v5);

  if (v7)
  {
    v8 = -[IPXPCClient initWithConnection:serviceQueue:]([IPXPCClient alloc], "initWithConnection:serviceQueue:", v5, self->_serviceQueue);
    -[NSMutableSet addObject:](self->_clients, "addObject:", v8);
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "transport:requestDelegateForClient:", self, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPXPCClient setDelegate:](v8, "setDelegate:", v10);

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "transport:acceptedClient:", self, v8);

    -[IPXPCClient resume](v8, "resume");
  }
  else
  {
    _IPServerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_23F108000, v12, OS_LOG_TYPE_DEFAULT, "Rejecting connection %@.", (uint8_t *)&v14, 0xCu);
    }

  }
  return v7;
}

- (void)clientDisconnected:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:", v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "transport:clientDisconnected:", self, v4);

    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v4);
  }
  else
  {
    _IPServerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[IPServerXPCTransport clientDisconnected:].cold.1(v6);

  }
}

- (IPServerXPCTransportDelegate)delegate
{
  return (IPServerXPCTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)clientDisconnected:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23F108000, log, OS_LOG_TYPE_FAULT, "unknown client disconnected!", v1, 2u);
}

@end
