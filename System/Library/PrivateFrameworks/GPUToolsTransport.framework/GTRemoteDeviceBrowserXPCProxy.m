@implementation GTRemoteDeviceBrowserXPCProxy

- (GTRemoteDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTRemoteDeviceBrowserXPCProxy *v8;
  void *v9;
  GTServiceConnection *v10;
  void *v11;
  uint64_t v12;
  GTServiceConnection *connection;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *ignoreMethods;
  uint64_t v18;
  NSMutableDictionary *observerIdToPort;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GTRemoteDeviceBrowserXPCProxy;
  v8 = -[GTRemoteDeviceBrowserXPCProxy init](&v21, sel_init);
  if (v8)
  {
    v9 = &unk_255D666B0;
    v10 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v12;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;

    v18 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = (NSMutableDictionary *)v18;

  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSSet *ignoreMethods;
  void *v6;
  BOOL v7;
  objc_super v9;

  ignoreMethods = self->_ignoreMethods;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v6))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTRemoteDeviceBrowserXPCProxy;
    v7 = -[GTRemoteDeviceBrowserXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (id)allDevices
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  uint64_t v7;
  void *nsarray;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_class();
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    nsarray = 0;
  }

  return nsarray;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  GTRemoteDeviceBrowserReplyStream *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t uint64;
  void *v13;
  NSMutableDictionary *observerIdToPort;
  void *v15;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = -[GTRemoteDeviceBrowserReplyStream initWithObserver:]([GTRemoteDeviceBrowserReplyStream alloc], "initWithObserver:", v5);

  v9 = -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v8);
  -[GTServiceConnection sendMessageWithReplySync:replyStreamId:error:](self->_connection, "sendMessageWithReplySync:replyStreamId:error:", empty, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    observerIdToPort = self->_observerIdToPort;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToPort, "setObject:forKeyedSubscript:", v13, v15);

  }
  else
  {
    uint64 = 0;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  NSMutableDictionary *observerIdToPort;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  const char *Name;
  id v13;
  xpc_object_t xdict;

  observerIdToPort = self->_observerIdToPort;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observerIdToPort, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongValue");

  v10 = self->_observerIdToPort;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  v13 = -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", xdict, 0);
  -[GTServiceConnection deregisterDispatcher:](self->_connection, "deregisterDispatcher:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
