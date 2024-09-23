@implementation GTMTLCaptureServiceXPCProxy

- (GTMTLCaptureServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTMTLCaptureServiceXPCProxy *v8;
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
  os_log_t v20;
  OS_os_log *log;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTMTLCaptureServiceXPCProxy;
  v8 = -[GTMTLCaptureServiceXPCProxy init](&v23, sel_init);
  if (v8)
  {
    v9 = &unk_255D63368;
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

    v20 = os_log_create("com.apple.gputools.transport", "CaptureProxy");
    log = v8->_log;
    v8->_log = (OS_os_log *)v20;

    objc_storeStrong((id *)&v8->_serviceProperties, a4);
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
    v9.super_class = (Class)GTMTLCaptureServiceXPCProxy;
    v7 = -[GTMTLCaptureServiceXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  GTMTLCaptureServiceReplyStream *v8;
  unint64_t v9;
  GTServiceConnection *connection;
  void *v11;
  id v12;
  uint64_t uint64;
  void *v14;
  NSMutableDictionary *observerIdToPort;
  void *v16;
  id v18;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = -[GTMTLCaptureServiceReplyStream initWithObserver:]([GTMTLCaptureServiceReplyStream alloc], "initWithObserver:", v5);

  v9 = -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v8);
  connection = self->_connection;
  v18 = 0;
  -[GTServiceConnection sendMessageWithReplySync:replyStreamId:error:](connection, "sendMessageWithReplySync:replyStreamId:error:", empty, v9, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    uint64 = xpc_dictionary_get_uint64(v11, "observerId");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    observerIdToPort = self->_observerIdToPort;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToPort, "setObject:forKeyedSubscript:", v14, v16);

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

- (void)abort
{
  const char *Name;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);

}

- (void)resume
{
  const char *Name;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);

}

- (void)stop
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D095000, log, OS_LOG_TYPE_DEBUG, "stop", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  GTCaptureRequestToken *v9;
  NSObject *log;
  xpc_object_t empty;
  const char *Name;
  GTServiceConnection *connection;
  GTCaptureRequestToken *v14;
  GTCaptureRequestToken *v15;
  _QWORD v17[4];
  GTCaptureRequestToken *v18;
  GTMTLCaptureServiceXPCProxy *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = -[GTCaptureRequestToken initWithCaptureService:andTokenId:]([GTCaptureRequestToken alloc], "initWithCaptureService:andTokenId:", self, objc_msgSend(v7, "requestID"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[GTMTLCaptureServiceXPCProxy startWithDescriptor:completionHandler:].cold.1((uint64_t)v7, log);
    empty = xpc_dictionary_create_empty();
    Name = sel_getName(a2);
    xpc_dictionary_set_string(empty, "_cmd", Name);
    xpc_dictionary_set_nsobject(empty, "descriptor", (uint64_t)v7);
    connection = self->_connection;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke;
    v17[3] = &unk_24F8279C0;
    v20 = v8;
    v14 = v9;
    v18 = v14;
    v19 = self;
    -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v17);
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *nsobject;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v5)
  {
    v9 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v5, "response", v9);
    objc_msgSend(nsobject, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
      v20 = *MEMORY[0x24BDD0FF0];
      v48[0] = *MEMORY[0x24BDD0FC8];
      v48[1] = v20;
      v49[0] = CFSTR("Capture Service serialization issue");
      v49[1] = CFSTR("Failure to encode data from requested");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GTCaptureService"), 54, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v22);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "completed");
    }
    else
    {
      v23 = objc_alloc(MEMORY[0x24BDBCF20]);
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_opt_class();
      v21 = (void *)objc_msgSend(v23, "initWithObjects:", v24, v25, v26, v27, objc_opt_class(), 0);
      v28 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(nsobject, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v6;
      objc_msgSend(v28, "unarchivedObjectOfClasses:fromData:error:", v21, v29, &v45);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v45;

      if (v30)
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("archiveURL"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setArchiveURL:", v32);

        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("error"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setError:", v33);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(*(id *)(a1 + 32), "completed");
      }
      else
      {
        v34 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);
        v42 = *MEMORY[0x24BDD0FF0];
        v46[0] = *MEMORY[0x24BDD0FC8];
        v46[1] = v42;
        v47[0] = CFSTR("Capture Service deserialization issue");
        v47[1] = CFSTR("Failure to decode data from requested");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GTCaptureService"), 54, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setError:", v44);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(*(id *)(a1 + 32), "completed");

      }
      v6 = v31;
    }

  }
  else
  {
    objc_msgSend(v7, "setError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "completed");
  }

}

- (id)update:(id)a3
{
  GTServiceConnection *connection;
  id v6;
  const char *Name;
  void *v8;

  connection = self->_connection;
  v6 = a3;
  Name = sel_getName(a2);
  ProxyCaptureBatchRequest(connection, self, v6, Name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)query:(id)a3
{
  GTServiceConnection *connection;
  id v6;
  const char *Name;
  void *v8;

  connection = self->_connection;
  v6 = a3;
  Name = sel_getName(a2);
  ProxyCaptureBatchRequest(connection, self, v6, Name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)nextRequestID
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  void *v7;
  uint64_t uint64;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    uint64 = xpc_dictionary_get_uint64(v6, "requestID");
  else
    uint64 = 0;

  return uint64;
}

- (id)createCaptureDescriptor
{
  GTCaptureDescriptor *v3;
  void *v4;
  unint64_t v5;

  v3 = -[GTCaptureDescriptor initWithRequestID:]([GTCaptureDescriptor alloc], "initWithRequestID:", -[GTMTLCaptureServiceXPCProxy nextRequestID](self, "nextRequestID"));
  -[GTMTLCaptureServiceXPCProxy serviceProperties](self, "serviceProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "version");

  if (v5 <= 2)
    -[GTCaptureDescriptor setSessionID:](v3, "setSessionID:", 0);
  return v3;
}

- (GTServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)startWithDescriptor:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_22D095000, a2, OS_LOG_TYPE_DEBUG, "StartWithDescriptor: %@", (uint8_t *)&v2, 0xCu);
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "deserialization error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "serialization error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
