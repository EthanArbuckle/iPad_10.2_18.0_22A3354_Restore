@implementation GTTransportClient

- (GTTransportClient)initWithConnection:(id)a3
{
  id v5;
  GTTransportClient *v6;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTransportClient;
  v6 = -[GTTransportClient init](&v10, sel_init);
  if (v6)
  {
    v7 = os_log_create("com.apple.gputools.transport", "GTTransportClient");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v6;
}

- (id)allServices
{
  return allServices(self->_connection);
}

- (id)capture
{
  void *v3;
  void *v4;
  void *v5;
  GTMTLCaptureServiceXPCProxy *v6;
  GTXPCConnection *connection;
  void *v8;
  GTMTLCaptureServiceXPCProxy *v9;

  allServices(self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v3, (Protocol *)&unk_255D63368);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [GTMTLCaptureServiceXPCProxy alloc];
  connection = self->_connection;
  objc_msgSend(v5, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GTMTLCaptureServiceXPCProxy initWithConnection:remoteProperties:](v6, "initWithConnection:remoteProperties:", connection, v8);

  return v9;
}

- (id)launcher
{
  void *v3;
  void *v4;
  void *v5;
  GTLaunchServiceXPCProxy *v6;
  GTXPCConnection *connection;
  void *v8;
  GTLaunchServiceXPCProxy *v9;

  allServices(self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v3, (Protocol *)&unk_255D65210);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [GTLaunchServiceXPCProxy alloc];
  connection = self->_connection;
  objc_msgSend(v5, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GTLaunchServiceXPCProxy initWithConnection:remoteProperties:](v6, "initWithConnection:remoteProperties:", connection, v8);

  return v9;
}

- (id)replayer
{
  void *v3;
  void *v4;
  void *v5;
  GTMTLReplayServiceXPCProxy *v6;

  allServices(self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v3, (Protocol *)&unk_255D658E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GTMTLReplayServiceXPCProxy initWithConnection:serviceInfo:]([GTMTLReplayServiceXPCProxy alloc], "initWithConnection:serviceInfo:", self->_connection, v5);
  return v6;
}

- (id)serviceProvider
{
  void *v3;
  void *v4;
  void *v5;
  GTServiceProviderXPCProxy *v6;
  GTXPCConnection *connection;
  void *v8;
  GTServiceProviderXPCProxy *v9;

  allServices(self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v3, (Protocol *)&unk_255D65D88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [GTServiceProviderXPCProxy alloc];
  connection = self->_connection;
  objc_msgSend(v5, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GTServiceProviderXPCProxy initWithConnection:remoteProperties:](v6, "initWithConnection:remoteProperties:", connection, v8);

  return v9;
}

- (id)loopback
{
  void *v3;
  void *v4;
  void *v5;
  GTLoopbackServiceXPCProxy *v6;
  GTXPCConnection *connection;
  void *v8;
  GTLoopbackServiceXPCProxy *v9;

  allServices(self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v3, (Protocol *)&unk_255D65580);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [GTLoopbackServiceXPCProxy alloc];
  connection = self->_connection;
  objc_msgSend(v5, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GTLoopbackServiceXPCProxy initWithConnection:remoteProperties:](v6, "initWithConnection:remoteProperties:", connection, v8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
