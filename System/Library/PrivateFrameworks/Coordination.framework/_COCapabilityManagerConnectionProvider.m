@implementation _COCapabilityManagerConnectionProvider

- (NSXPCConnection)capabilityManagerServiceConnection
{
  _COCapabilityManagerConnectionProvider *v2;
  NSXPCConnection *v3;
  uint64_t v4;
  NSXPCConnection *capabilityManagerServiceConnection;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_capabilityManagerServiceConnection;
  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.coordination.capability"), 4096);
    capabilityManagerServiceConnection = v2->_capabilityManagerServiceConnection;
    v2->_capabilityManagerServiceConnection = (NSXPCConnection *)v4;

    objc_initWeak(&location, v2);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __76___COCapabilityManagerConnectionProvider_capabilityManagerServiceConnection__block_invoke;
    v11 = &unk_24CD3F538;
    objc_copyWeak(&v12, &location);
    v6 = (void *)MEMORY[0x212BE9A2C](&v8);
    -[NSXPCConnection setInterruptionHandler:](v2->_capabilityManagerServiceConnection, "setInterruptionHandler:", v6, v8, v9, v10, v11);
    -[NSXPCConnection setInvalidationHandler:](v2->_capabilityManagerServiceConnection, "setInvalidationHandler:", v6);
    v3 = v2->_capabilityManagerServiceConnection;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityManagerServiceConnection, 0);
}

@end
