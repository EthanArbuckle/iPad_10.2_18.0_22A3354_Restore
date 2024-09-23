@implementation _COMessageChannelConnectionProvider

- (NSXPCConnection)messageChannelServiceConnection
{
  _COMessageChannelConnectionProvider *v2;
  NSXPCConnection *v3;
  uint64_t v4;
  NSXPCConnection *messageChannelServiceConnection;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_messageChannelServiceConnection;
  if (!v3)
  {
    if (!v2->_messageChannelServiceConnection)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.coordination.messaging"), 4096);
      messageChannelServiceConnection = v2->_messageChannelServiceConnection;
      v2->_messageChannelServiceConnection = (NSXPCConnection *)v4;

    }
    objc_initWeak(&location, v2);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __70___COMessageChannelConnectionProvider_messageChannelServiceConnection__block_invoke;
    v11 = &unk_24CD3F538;
    objc_copyWeak(&v12, &location);
    v6 = (void *)MEMORY[0x212BE9A2C](&v8);
    -[NSXPCConnection setInterruptionHandler:](v2->_messageChannelServiceConnection, "setInterruptionHandler:", v6, v8, v9, v10, v11);
    -[NSXPCConnection setInvalidationHandler:](v2->_messageChannelServiceConnection, "setInvalidationHandler:", v6);
    v3 = v2->_messageChannelServiceConnection;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageChannelServiceConnection, 0);
}

@end
