@implementation MXSourceManager

- (MXSourceManager)init
{
  MXSourceManager *v2;
  os_log_t v3;
  OS_os_log *sourceManagerLogHandle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXSourceManager;
  v2 = -[MXSourceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.metrickit.sourcemanager", ");
    sourceManagerLogHandle = v2->_sourceManagerLogHandle;
    v2->_sourceManagerLogHandle = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MXSourceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __32__MXSourceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (id)_createXPCConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  connection = self->_connection;
  if (connection)
  {
    v3 = connection;
  }
  else
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.metrickitsource.xpc"), 4096);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3FEE8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v5);

      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDBCF20];
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection remoteObjectInterface](v3, "remoteObjectInterface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_writeMetricDataWithPayload_, 0, 0);

      -[NSXPCConnection remoteObjectInterface](v3, "remoteObjectInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_writeDiagnosticDataWithPayload_, 0, 0);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3E930);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v3, "setExportedInterface:", v22);

      -[NSXPCConnection setExportedObject:](v3, "setExportedObject:", self);
      -[NSXPCConnection resume](v3, "resume");

    }
  }
  return v3;
}

- (void)sendMetrics:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5
{
  id v8;
  NSXPCConnection *v9;
  NSXPCConnection *connection;
  MXSourceXPCPayload *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[MXSourceManager _createXPCConnection](self, "_createXPCConnection");
  v9 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v9;

  if (self->_connection)
  {
    v11 = -[MXSourceXPCPayload initWithSourceID:withDateStamp:andMetrics:]([MXSourceXPCPayload alloc], "initWithSourceID:withDateStamp:andMetrics:", a5, v8, v13);
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeMetricDataWithPayload:", v11);

  }
}

- (void)sendDiagnostic:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5
{
  id v8;
  NSXPCConnection *v9;
  NSXPCConnection *connection;
  MXSourceXPCPayload *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[MXSourceManager _createXPCConnection](self, "_createXPCConnection");
  v9 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v9;

  if (self->_connection)
  {
    v11 = -[MXSourceXPCPayload initWithSourceID:withDateStamp:andMetrics:]([MXSourceXPCPayload alloc], "initWithSourceID:withDateStamp:andMetrics:", a5, v8, v13);
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeDiagnosticDataWithPayload:", v11);

  }
}

- (void)simulatePayloadDeliveryForClient:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MXSourceManager _createXPCConnection](self, "_createXPCConnection");
  v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v4;

  v6 = self->_connection;
  if (v6)
  {
    -[NSXPCConnection remoteObjectProxy](v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deliverDummyPayloadForClient:", v8);

  }
}

- (OS_os_log)sourceManagerLogHandle
{
  return self->_sourceManagerLogHandle;
}

- (void)setSourceManagerLogHandle:(id)a3
{
  objc_storeStrong((id *)&self->_sourceManagerLogHandle, a3);
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
  objc_storeStrong((id *)&self->_sourceManagerLogHandle, 0);
}

@end
