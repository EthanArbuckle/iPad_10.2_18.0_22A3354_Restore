@implementation GTDeviceCapabilitiesXPCProxy

- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTDeviceCapabilitiesXPCProxy *v8;
  void *v9;
  GTServiceConnection *v10;
  void *v11;
  uint64_t v12;
  GTServiceConnection *connection;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *ignoreMethods;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
  v8 = -[GTDeviceCapabilitiesXPCProxy init](&v19, sel_init);
  if (v8)
  {
    v9 = &unk_255D636C0;
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
    v9.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
    v7 = -[GTDeviceCapabilitiesXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (id)daemonDeviceCapabilities
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *nsobject_classes;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCF20]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v6, "returnValue", v12);

  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *nsobject_classes;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "heapDescriptors", (uint64_t)v5);

  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF20]);
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "returnValue", v14);

  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)gpuToolsVersionQuery
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  void *v7;
  id nsdictionary_any;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v6, "returnValue");
  else
    nsdictionary_any = 0;

  return nsdictionary_any;
}

- (id)inferiorEnvironment:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *nsdictionary;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "launchDictionary", (uint64_t)v5);

  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    nsdictionary = (void *)xpc_dictionary_get_nsdictionary(v8, "environment", v9, v10);
  }
  else
  {
    nsdictionary = 0;
  }

  return nsdictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
