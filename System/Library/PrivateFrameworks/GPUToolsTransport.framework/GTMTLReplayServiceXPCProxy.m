@implementation GTMTLReplayServiceXPCProxy

- (GTMTLReplayServiceXPCProxy)initWithConnection:(id)a3 serviceInfo:(id)a4
{
  id v7;
  id v8;
  GTMTLReplayServiceXPCProxy *v9;
  os_log_t v10;
  OS_os_log *log;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  GTProcessInfo *processInfo;
  GTServiceConnection *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  GTServiceConnection *connection;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSSet *ignoreMethods;
  xpc_object_t empty;
  GTServiceConnection *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *nsobject;
  GTBulkDataServiceXPCProxy *v36;
  GTBulkDataServiceXPCProxy *bulkDataProxy;
  void *v38;
  uint64_t v39;
  NSMutableDictionary *acceleratorStructureSessionToDispatcherId;
  uint64_t v41;
  NSMutableDictionary *observerIdToPort;
  NSObject *v43;
  NSObject *v44;
  GTMTLReplayServiceXPCProxy *v45;
  id v47;
  objc_super v48;

  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GTMTLReplayServiceXPCProxy;
  v9 = -[GTMTLReplayServiceXPCProxy init](&v48, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.gputools.transport", "ReplayProxy");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    v12 = &unk_255D658E8;
    objc_msgSend(v8, "serviceProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "protocolName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v8, "processInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      processInfo = v9->_processInfo;
      v9->_processInfo = (GTProcessInfo *)v17;

      objc_storeStrong((id *)&v9->_gtXPCConnection, a3);
      v19 = [GTServiceConnection alloc];
      objc_msgSend(v8, "serviceProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deviceUDID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[GTServiceConnection initWithConnection:device:port:](v19, "initWithConnection:device:port:", v7, v21, objc_msgSend(v22, "servicePort"));
      connection = v9->_connection;
      v9->_connection = (GTServiceConnection *)v23;

      +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "protocolMethods");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      newSetWithArrayMinusArray(v25, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      ignoreMethods = v9->_ignoreMethods;
      v9->_ignoreMethods = (NSSet *)v28;

      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "_cmd", "bulkDataService");
      v31 = v9->_connection;
      v47 = 0;
      -[GTServiceConnection sendMessageWithReplySync:error:](v31, "sendMessageWithReplySync:error:", empty, &v47);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v47;
      if (v32)
      {
        v34 = objc_opt_class();
        nsobject = xpc_dictionary_get_nsobject(v32, "returnValue", v34);
        v36 = -[GTBulkDataServiceXPCProxy initWithConnection:remoteProperties:]([GTBulkDataServiceXPCProxy alloc], "initWithConnection:remoteProperties:", v7, nsobject);
        bulkDataProxy = v9->_bulkDataProxy;
        v9->_bulkDataProxy = v36;

        v9->_fetchCompressionAlgorithm = 3;
        v38 = (void *)MEMORY[0x24BDBD1B8];
        v39 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
        acceleratorStructureSessionToDispatcherId = v9->_acceleratorStructureSessionToDispatcherId;
        v9->_acceleratorStructureSessionToDispatcherId = (NSMutableDictionary *)v39;

        v41 = objc_msgSend(v38, "mutableCopy");
        observerIdToPort = v9->_observerIdToPort;
        v9->_observerIdToPort = (NSMutableDictionary *)v41;

        if ((qword_255C5FDD0 & 1) != 0)
          v9->_tstream = (GTTpacketStream *)GTTpacket_stream((void *)GT_TRANSPORT_ENV);

      }
      else
      {
        v44 = v9->_log;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[GTMTLReplayServiceXPCProxy initWithConnection:serviceInfo:].cold.1(v44, v33);
      }

      if (v32)
        goto LABEL_13;
    }
    else
    {
      v43 = v9->_log;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[GTMTLReplayServiceXPCProxy initWithConnection:serviceInfo:].cold.2(v43, v8, (Protocol *)v12);

    }
    v45 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v45 = v9;
LABEL_15:

  return v45;
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
    v9.super_class = (Class)GTMTLReplayServiceXPCProxy;
    v7 = -[GTMTLReplayServiceXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  GTMTLReplayErrorReplyStream *v8;
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
  v8 = -[GTMTLReplayErrorReplyStream initWithObserver:]([GTMTLReplayErrorReplyStream alloc], "initWithObserver:", v5);

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

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GTURLAccessProviderXPCProxy *v14;
  GTXPCConnection *gtXPCConnection;
  void *v16;
  GTURLAccessProviderXPCProxy *v17;
  xpc_object_t empty;
  const char *Name;
  uint64_t v20;
  void *v21;
  void *nserror;
  void *v23;
  BOOL v24;
  GTReplayLoadRequest *v25;
  GTTpacketStream *tstream;
  const char *v27;

  v7 = a3;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD1338]);

  v10 = v7;
  if (v9)
  {
    allServices(self->_gtXPCConnection);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    filteredArrayByService(v11, (Protocol *)&unk_255D647A0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [GTURLAccessProviderXPCProxy alloc];
    gtXPCConnection = self->_gtXPCConnection;
    objc_msgSend(v13, "serviceProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v14, "initWithConnection:remoteProperties:", gtXPCConnection, v16);

    objc_msgSend(v7, "startAccessingSecurityScopedResource");
    -[GTURLAccessProviderXPCProxy makeURL:](v17, "makeURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  }
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v10);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v20, "error");
    v23 = nserror;
    v24 = nserror == 0;
    if (nserror)
    {
      if (a4)
        *a4 = objc_retainAutorelease(nserror);
    }
    else
    {
      v25 = objc_alloc_init(GTReplayLoadRequest);
      -[GTReplayLoadRequest setGputraceURL:](v25, "setGputraceURL:", v10);
      tstream = self->_tstream;
      v27 = sel_getName(a2);
      GTTpacket_record((uint64_t)tstream, (uint64_t)v27, v25);

    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)flushRpackets
{
  GTTpacketStream *tstream;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD applier[4];
  id v9;

  tstream = self->_tstream;
  if (!tstream)
    return 0;
  GTTpacket_finish((uint64_t)tstream);
  v4 = objc_claimAutoreleasedReturnValue();
  self->_tstream = 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", dispatch_data_get_size(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __43__GTMTLReplayServiceXPCProxy_flushRpackets__block_invoke;
  applier[3] = &unk_24F827F58;
  v6 = v5;
  v9 = v6;
  dispatch_data_apply(v4, applier);

  return v6;
}

uint64_t __43__GTMTLReplayServiceXPCProxy_flushRpackets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend(*(id *)(a1 + 32), "replaceBytesInRange:withBytes:length:", a3, a5, a4);
  return 1;
}

- (void)terminateProcess
{
  const char *Name;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  -[GTServiceConnection sendMessageAndWaitForDelivery:](self->_connection, "sendMessageAndWaitForDelivery:", xdict);

}

- (id)fetch:(id)a3
{
  GTTpacketStream *tstream;
  id v6;
  const char *Name;
  GTServiceConnection *connection;
  const char *v9;
  void *v10;

  tstream = self->_tstream;
  v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  v9 = sel_getName(a2);
  ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, self->_fetchCompressionAlgorithm);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)query:(id)a3
{
  GTTpacketStream *tstream;
  id v6;
  const char *Name;
  GTServiceConnection *connection;
  const char *v9;
  void *v10;

  tstream = self->_tstream;
  v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  v9 = sel_getName(a2);
  ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)update:(id)a3
{
  GTTpacketStream *tstream;
  id v6;
  const char *Name;
  GTServiceConnection *connection;
  const char *v9;
  void *v10;

  tstream = self->_tstream;
  v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  v9 = sel_getName(a2);
  ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)decode:(id)a3
{
  GTTpacketStream *tstream;
  id v6;
  const char *Name;
  GTServiceConnection *connection;
  const char *v9;
  void *v10;

  tstream = self->_tstream;
  v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  v9 = sel_getName(a2);
  ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)display:(id)a3
{
  id v5;
  const char *Name;
  GTTpacketStream *tstream;
  const char *v8;
  xpc_object_t xdict;

  v5 = a3;
  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_nsobject(xdict, "request", (uint64_t)v5);
  tstream = self->_tstream;
  v8 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v8, v5);

  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);
}

- (id)profile:(id)a3
{
  id v5;
  GTReplayRequestToken *v6;
  xpc_object_t empty;
  const char *Name;
  GTReplayProfileReplyStream *v9;
  void *v10;
  GTReplayProfileReplyStream *v11;
  GTTpacketStream *tstream;
  const char *v13;

  v5 = a3;
  v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, objc_msgSend(v5, "requestID"));
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", -[GTReplayRequestToken tokenId](v6, "tokenId"));
  v9 = [GTReplayProfileReplyStream alloc];
  objc_msgSend(v5, "streamHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GTReplayProfileReplyStream initWithCallback:bulkDataProxy:andToken:](v9, "initWithCallback:bulkDataProxy:andToken:", v10, self->_bulkDataProxy, v6);

  -[GTReplayProfileReplyStream setDispatcherId:](v11, "setDispatcherId:", -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v11));
  tstream = self->_tstream;
  v13 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v13, v5);

  -[GTServiceConnection sendMessage:withReplyStreamId:replyHandler:](self->_connection, "sendMessage:withReplyStreamId:replyHandler:", empty, -[GTReplayProfileReplyStream dispatcherId](v11, "dispatcherId"), &__block_literal_global_0);
  return v6;
}

- (id)shaderdebug:(id)a3
{
  id v5;
  GTReplayRequestToken *v6;
  xpc_object_t empty;
  const char *Name;
  GTTpacketStream *tstream;
  const char *v10;
  GTServiceConnection *connection;
  GTReplayRequestToken *v12;
  id v13;
  GTReplayRequestToken *v14;
  GTReplayRequestToken *v15;
  _QWORD v17[4];
  id v18;
  GTReplayRequestToken *v19;

  v5 = a3;
  v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, objc_msgSend(v5, "requestID"));
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", -[GTReplayRequestToken tokenId](v6, "tokenId"));
  tstream = self->_tstream;
  v10 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v10, v5);
  connection = self->_connection;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __42__GTMTLReplayServiceXPCProxy_shaderdebug___block_invoke;
  v17[3] = &unk_24F827DA8;
  v18 = v5;
  v12 = v6;
  v19 = v12;
  v13 = v5;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __42__GTMTLReplayServiceXPCProxy_shaderdebug___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *nsobject_classes;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v12 = a2;
  v5 = a3;
  if (v12)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v12, "response", v9);

  }
  else
  {
    nsobject_classes = (void *)objc_opt_new();
    objc_msgSend(nsobject_classes, "setError:", v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, nsobject_classes);

  objc_msgSend(*(id *)(a1 + 40), "completed");
}

- (id)raytrace:(id)a3
{
  id v5;
  GTReplayRequestToken *v6;
  xpc_object_t empty;
  const char *Name;
  GTReplayADSReplyStream *v9;
  void *v10;
  GTReplayADSReplyStream *v11;
  GTTpacketStream *tstream;
  const char *v13;

  v5 = a3;
  v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, objc_msgSend(v5, "requestID"));
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", -[GTReplayRequestToken tokenId](v6, "tokenId"));
  v9 = [GTReplayADSReplyStream alloc];
  objc_msgSend(v5, "streamHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GTReplayADSReplyStream initWithCallback:bulkDataProxy:andToken:](v9, "initWithCallback:bulkDataProxy:andToken:", v10, self->_bulkDataProxy, v6);

  -[GTReplayADSReplyStream setDispatcherId:](v11, "setDispatcherId:", -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v11));
  tstream = self->_tstream;
  v13 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v13, v5);

  -[GTServiceConnection sendMessage:withReplyStreamId:](self->_connection, "sendMessage:withReplyStreamId:", empty, -[GTReplayADSReplyStream dispatcherId](v11, "dispatcherId"));
  return v6;
}

- (BOOL)cancel:(unint64_t)a3
{
  xpc_object_t empty;
  const char *Name;
  void *v8;
  void *v9;
  BOOL v10;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = xpc_dictionary_get_BOOL(v8, "success");
  else
    v10 = 0;

  return v10;
}

- (BOOL)pause:(unint64_t)a3
{
  xpc_object_t empty;
  const char *Name;
  void *v8;
  void *v9;
  BOOL v10;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = xpc_dictionary_get_BOOL(v8, "success");
  else
    v10 = 0;

  return v10;
}

- (BOOL)resume:(unint64_t)a3
{
  xpc_object_t empty;
  const char *Name;
  void *v8;
  void *v9;
  BOOL v10;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = xpc_dictionary_get_BOOL(v8, "success");
  else
    v10 = 0;

  return v10;
}

- (GTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_acceleratorStructureSessionToDispatcherId, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_connectionhandler, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_gtXPCConnection, 0);
}

- (void)initWithConnection:(void *)a1 serviceInfo:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_22D095000, v3, OS_LOG_TYPE_ERROR, "Unable to retrieve bulk data service, %@", (uint8_t *)&v5, 0xCu);

}

- (void)initWithConnection:(Protocol *)a3 serviceInfo:.cold.2(void *a1, void *a2, Protocol *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "serviceProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_22D095000, v5, OS_LOG_TYPE_DEBUG, "Remote protocol name %@ does not match %@", (uint8_t *)&v9, 0x16u);

}

@end
