@implementation DiagCollectionTransport

- (DiagCollectionTransport)init
{
  DiagCollectionTransport *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *transport_queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DiagCollectionTransport;
  v2 = -[DiagCollectionTransport init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.autobugcapture.collection_transport", v3);
    transport_queue = v2->transport_queue;
    v2->transport_queue = (OS_dispatch_queue *)v4;

    -[DiagCollectionTransport setListeningPort:](v2, "setListeningPort:", "com.apple.symptom_diagnostics_collection");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  xpcLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "deallocating DiagCollectionTransport", buf, 2u);
  }

  -[DiagCollectionTransport shutdown](self, "shutdown");
  v4.receiver = self;
  v4.super_class = (Class)DiagCollectionTransport;
  -[DiagCollectionTransport dealloc](&v4, sel_dealloc);
}

- (void)setListeningPort:(const char *)a3
{
  NSObject *v5;
  NSObject *v6;
  NSXPCListener *listener;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  void *v12;
  NSXPCListener *v13;
  NSXPCListener *v14;
  DiagCollectionServiceImpl *v15;
  DiagCollectionServiceImpl *service;
  NSXPCListener *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = a3;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagCollectionTransport started for service %s", (uint8_t *)&v18, 0xCu);
  }

  if (self->listener)
  {
    xpcLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      listener = self->listener;
      v18 = 134217984;
      v19 = (const char *)listener;
      v8 = "listener already initialized: %p";
      v9 = v6;
      v10 = OS_LOG_TYPE_INFO;
LABEL_12:
      _os_log_impl(&dword_1DBAE1000, v9, v10, v8, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3B58]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSXPCListener *)objc_msgSend(v11, "initWithMachServiceName:", v12);
    v14 = self->listener;
    self->listener = v13;

    v15 = -[DiagCollectionServiceImpl initWithQueue:]([DiagCollectionServiceImpl alloc], "initWithQueue:", self->transport_queue);
    service = self->service;
    self->service = v15;

    v17 = self->listener;
    if (v17 && self->service)
    {
      -[NSXPCListener setDelegate:](v17, "setDelegate:");
      -[NSXPCListener resume](self->listener, "resume");
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = a3;
        v8 = "started listener for service %s";
        v9 = v6;
        v10 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_12;
      }
    }
    else
    {
      self->listener = 0;

      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315138;
        v19 = a3;
        v8 = "failed to create listener for service %s";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
  }

}

- (void)shutdown
{
  NSObject *v3;
  DiagCollectionServiceImpl *service;
  NSXPCListener *listener;
  uint8_t v6[16];

  if (self->listener)
  {
    xpcLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "shutting down service listener", v6, 2u);
    }

    -[DiagCollectionServiceImpl shutdown](self->service, "shutdown");
    service = self->service;
    self->service = 0;

    listener = self->listener;
    self->listener = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transport_queue, 0);
  objc_storeStrong((id *)&self->service, 0);
  objc_storeStrong((id *)&self->listener, 0);
}

@end
