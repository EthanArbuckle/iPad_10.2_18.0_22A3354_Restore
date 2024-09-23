@implementation GTSimulatorDeviceBrowserXPCProxy

- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTSimulatorDeviceBrowserXPCProxy *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  GTServiceConnection *v13;
  void *v14;
  uint64_t v15;
  GTServiceConnection *connection;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *ignoreMethods;
  GTSimulatorDeviceBrowserXPCProxy *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
  v8 = -[GTSimulatorDeviceBrowserXPCProxy init](&v23, sel_init);
  if (v8)
  {
    v9 = &unk_255D60690;
    objc_msgSend(v7, "protocolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
    {

      v21 = 0;
      goto LABEL_6;
    }
    v13 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v15;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v19;

  }
  v21 = v8;
LABEL_6:

  return v21;
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
    v9.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
    v7 = -[GTSimulatorDeviceBrowserXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (BOOL)isSimulatorDevice:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v9);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = xpc_dictionary_get_BOOL(v10, "returnValue");
  else
    v12 = 0;

  return v12;
}

- (id)deviceProperties:(id)a3 error:(id *)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *nsobject;

  v7 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v11);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v12, "returnValue", v13);
    if (a4)
      *a4 = (id)xpc_dictionary_get_nserror(v12, "error");
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
