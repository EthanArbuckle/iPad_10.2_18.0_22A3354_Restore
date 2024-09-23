@implementation _GCDriverClientConnection

- (_GCDriverClientConnection)initWithConnection:(id)a3 fromProcess:(id)a4
{
  id v6;
  _GCDriverClientConnection *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDriverClientConnection;
  v7 = -[_GCIPCRemoteIncomingConnection initWithConnection:fromProcess:](&v11, sel_initWithConnection_fromProcess_, v6, a4);
  if (v7)
  {
    GCDriverServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v8);

    GCDriverClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v9);

  }
  return v7;
}

- (_GCDriverServerInterface)exportedObject
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_GCDriverServerInterface *)v3;
}

- (void)setExportedObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

- (void)connectToDeviceService:(id)a3 withClient:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GCIPCRemoteIncomingConnection remoteProxy](self, "remoteProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  ConnectToDriverService(v10, v11, v9, v8);

}

- (id)connectToDeviceService:(id)a3 withClient:(id)a4
{
  Protocol *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Protocol *v12;
  id v13;
  id v14;
  Protocol *v15;
  void *v16;
  _QWORD v18[5];
  Protocol *v19;
  id v20;
  _QWORD v21[5];
  Protocol *v22;
  id v23;

  v6 = (Protocol *)a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF8C78), "initOnQueue:withOptions:", 0, 0);
  NSStringFromProtocol(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Connect to '%@'."), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v10);

  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke;
  v21[3] = &unk_24D2B42E0;
  v21[4] = self;
  v12 = v6;
  v22 = v12;
  v13 = v7;
  v23 = v13;
  objc_msgSend(v8, "setSyncBlock:", v21);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_3;
  v18[3] = &unk_24D2B4358;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v8, "setAsyncBlock:", v18);
  objc_msgSend(v8, "activate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
