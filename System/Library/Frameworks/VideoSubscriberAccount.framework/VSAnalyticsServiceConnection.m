@implementation VSAnalyticsServiceConnection

- (VSAnalyticsServiceConnection)init
{
  VSAnalyticsServiceConnection *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSAnalyticsServiceConnection;
  v2 = -[VSAnalyticsServiceConnection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.VideoSubscriberAccount.AnalyticsService"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    VSAnalyticsServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VSAnalyticsServiceConnection;
  -[VSAnalyticsServiceConnection dealloc](&v3, sel_dealloc);
}

- (id)serviceWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Returning remote analytics service proxy object.", v9, 2u);
  }

  -[VSAnalyticsServiceConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
