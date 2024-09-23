@implementation DiagnosticsTransport

- (DiagnosticsTransport)init
{
  DiagnosticsTransport *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *transport_queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DiagnosticsTransport;
  v2 = -[DiagnosticsTransport init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.symptoms.diagnostics_transport.queue", v3);
    transport_queue = v2->transport_queue;
    v2->transport_queue = (OS_dispatch_queue *)v4;

    -[DiagnosticsTransport setListeningPort:](v2, "setListeningPort:", "com.apple.symptom_diagnostics");
  }
  return v2;
}

void __41__DiagnosticsTransport_setListeningPort___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
  xpcLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEFAULT, "started listener for service %s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setListeningPort:(const char *)a3
{
  NSObject *v5;
  NSObject *v6;
  NSXPCListener *listener;
  id v8;
  void *v9;
  NSXPCListener *v10;
  NSXPCListener *v11;
  DiagnosticsServiceImpl *v12;
  DiagnosticsServiceImpl *service;
  NSXPCListener *v14;
  dispatch_time_t v15;
  NSObject *transport_queue;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = a3;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsTransport started for service %s", buf, 0xCu);
  }

  if (self->listener)
  {
    xpcLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      listener = self->listener;
      *(_DWORD *)buf = 134217984;
      v20 = (const char *)listener;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "DiagnosticsTransport: already initialized: %p", buf, 0xCu);
    }

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3B58]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSXPCListener *)objc_msgSend(v8, "initWithMachServiceName:", v9);
    v11 = self->listener;
    self->listener = v10;

    v12 = -[DiagnosticsServiceImpl initWithQueue:]([DiagnosticsServiceImpl alloc], "initWithQueue:", self->transport_queue);
    service = self->service;
    self->service = v12;

    v14 = self->listener;
    if (v14 && self->service)
    {
      -[NSXPCListener setDelegate:](v14, "setDelegate:");
      v15 = dispatch_time(0, 500000000);
      transport_queue = self->transport_queue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41__DiagnosticsTransport_setListeningPort___block_invoke;
      v18[3] = &unk_1EA3B4D18;
      v18[4] = self;
      v18[5] = a3;
      dispatch_after(v15, transport_queue, v18);
    }
    else
    {
      self->listener = 0;

      xpcLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "DiagnosticsTransport: failing to create the diagnostics channel", buf, 2u);
      }

    }
  }
}

- (void)shutdown
{
  DiagnosticsServiceImpl *service;
  NSXPCListener *listener;

  if (self->listener)
  {
    -[DiagnosticsServiceImpl shutdown](self->service, "shutdown");
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
