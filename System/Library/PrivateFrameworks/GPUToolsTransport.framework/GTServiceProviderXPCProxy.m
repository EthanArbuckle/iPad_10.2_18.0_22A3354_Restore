@implementation GTServiceProviderXPCProxy

- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTServiceProviderXPCProxy *v8;
  os_log_t v9;
  OS_os_log *log;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSString *deviceUDID;
  GTServiceConnection *v17;
  void *v18;
  uint64_t v19;
  GTServiceConnection *connection;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *ignoreMethods;
  uint64_t v25;
  NSMutableDictionary *observerIdToPort;
  GTServiceProviderXPCProxy *v27;
  NSObject *v28;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)GTServiceProviderXPCProxy;
  v8 = -[GTServiceProviderXPCProxy init](&v30, sel_init);
  if (!v8)
    goto LABEL_4;
  v9 = os_log_create("com.apple.gputools.transport", "ServiceProviderProxy");
  log = v8->_log;
  v8->_log = (OS_os_log *)v9;

  v11 = &unk_255D65D88;
  objc_msgSend(v7, "protocolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v7, "deviceUDID");
    v15 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v8->_deviceUDID;
    v8->_deviceUDID = (NSString *)v15;

    v17 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[GTServiceConnection initWithConnection:device:port:](v17, "initWithConnection:device:port:", v6, v18, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v19;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v23;

    v25 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = (NSMutableDictionary *)v25;

LABEL_4:
    v27 = v8;
    goto LABEL_8;
  }
  v28 = v8->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[GTServiceProviderXPCProxy initWithConnection:remoteProperties:].cold.1(v28);

  v27 = 0;
LABEL_8:

  return v27;
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
    v9.super_class = (Class)GTServiceProviderXPCProxy;
    v7 = -[GTServiceProviderXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (id)allServices
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

- (void)registerService:(id)a3 forProcess:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  void *v10;
  void *v11;
  void *v12;
  const char *string;
  const char *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v16);
  xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v7);

  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v16, "setServicePort:", xpc_dictionary_get_uint64(v10, "servicePort"));
    v12 = (void *)MEMORY[0x24BDD17C8];
    string = xpc_dictionary_get_string(v11, "deviceUDID");
    if (string)
      v14 = string;
    else
      v14 = "";
    objc_msgSend(v12, "stringWithUTF8String:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeviceUDID:", v15);

  }
  else
  {
    objc_msgSend(v16, "setServicePort:", 0);
    objc_msgSend(v16, "setDeviceUDID:", 0);
  }

}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  xpc_object_t empty;
  const char *Name;
  id v11;
  const char *v12;
  GTServiceConnection *connection;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  xpc_dictionary_set_string(empty, "protocolName", v12);
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__GTServiceProviderXPCProxy_waitForService_completionHandler___block_invoke;
  v15[3] = &unk_24F827B78;
  v16 = v7;
  v14 = v7;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v15);

}

void __62__GTServiceProviderXPCProxy_waitForService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *nserror;
  void *v15;
  BOOL v16;

  v7 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(empty, "protocolName", v11);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v12, "error");
    v15 = nserror;
    v16 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)deregisterService:(unint64_t)a3
{
  const char *Name;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "servicePort", a3);
  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);

}

- (unint64_t)registerObserver:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  GTServiceProviderReplyStream *v8;
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
  v8 = -[GTServiceProviderReplyStream initWithObserver:]([GTServiceProviderReplyStream alloc], "initWithObserver:", v5);

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
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConnection:(os_log_t)log remoteProperties:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D095000, log, OS_LOG_TYPE_ERROR, "Invalid remote properties - unable to locate remote service", v1, 2u);
}

@end
