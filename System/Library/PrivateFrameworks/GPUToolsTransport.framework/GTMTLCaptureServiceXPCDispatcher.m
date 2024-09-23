@implementation GTMTLCaptureServiceXPCDispatcher

- (GTMTLCaptureServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 notifyConnection:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  GTMTLCaptureServiceXPCDispatcher *v13;
  void *v14;
  void *v15;
  void *v16;
  GTURLAccessProviderXPCProxy *v17;
  void *v18;
  uint64_t v19;
  GTURLAccessProviderXPCProxy *urlService;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "protocolMethods");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "addObject:", CFSTR("broadcastDisconnect"));
  v22.receiver = self;
  v22.super_class = (Class)GTMTLCaptureServiceXPCDispatcher;
  v13 = -[GTXPCDispatcher initWithProtocolMethods:](&v22, sel_initWithProtocolMethods_, v12);
  if (v13)
  {
    allServices(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    filteredArrayByService(v14, (Protocol *)&unk_255D647A0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = [GTURLAccessProviderXPCProxy alloc];
    objc_msgSend(v16, "serviceProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v17, "initWithConnection:remoteProperties:", v10, v18);
    urlService = v13->_urlService;
    v13->_urlService = (GTURLAccessProviderXPCProxy *)v19;

    objc_storeStrong((id *)&v13->_implInstance, a3);
  }

  return v13;
}

- (void)stop:(id)a3 replyConnection:(id)a4
{
  -[GTMTLCaptureService stop](self->_implInstance, "stop", a3, a4);
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  GTMTLCaptureServiceObserver *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTMTLCaptureServiceObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTMTLCaptureService registerObserver:](self->_implInstance, "registerObserver:", v10);
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GTMTLCaptureService deregisterObserver:](self->_implInstance, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
  gt_xpc_dictionary_create_reply(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendMessage:", v8);
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GTMTLCaptureService deregisterObserversForConnection:path:](self->_implInstance, "deregisterObserversForConnection:path:", v6, v7);

}

- (void)startWithDescriptor_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *nsobject_classes;
  void *v14;
  GTMTLCaptureService *implInstance;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBCF20];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "descriptor", v12);
  gt_xpc_dictionary_create_reply(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self->_urlService);
  implInstance = self->_implInstance;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__GTMTLCaptureServiceXPCDispatcher_startWithDescriptor_completionHandler__replyConnection___block_invoke;
  v19[3] = &unk_24F8279E8;
  objc_copyWeak(&v22, &location);
  v20 = v14;
  v21 = v6;
  v16 = v6;
  v17 = v14;
  v18 = (id)-[GTMTLCaptureService startWithDescriptor:completionHandler:](implInstance, "startWithDescriptor:completionHandler:", nsobject_classes, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __91__GTMTLCaptureServiceXPCDispatcher_startWithDescriptor_completionHandler__replyConnection___block_invoke(void **a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "error");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", WeakRetained, CFSTR("error"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (WeakRetained)
    {
      objc_msgSend(v3, "archiveURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "makeURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("archiveURL"));
      xpc_dictionary_set_flag(a1[4], "_flags", 5);

    }
  }

  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x24BDD1618];
  v11 = (void *)objc_msgSend(v4, "copy");
  v14 = 0;
  objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v9, "setData:", v12);

  objc_msgSend(v9, "setError:", v13);
  xpc_dictionary_set_nsobject(a1[4], "response", (uint64_t)v9);
  xpc_dictionary_set_nserror(a1[4], "_error", v13);
  objc_msgSend(a1[5], "sendMessage:", a1[4]);

}

- (void)update_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchCaptureBatchRequest(a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLCaptureService update:](self->_implInstance, "update:", v6);

}

- (void)query_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchCaptureBatchRequest(a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLCaptureService query:](self->_implInstance, "query:", v6);

}

- (void)nextRequestID:(id)a3 replyConnection:(id)a4
{
  GTMTLCaptureService *implInstance;
  id v6;
  id v7;
  uint64_t v8;
  xpc_object_t xdict;

  implInstance = self->_implInstance;
  v6 = a4;
  v7 = a3;
  v8 = -[GTMTLCaptureService nextRequestID](implInstance, "nextRequestID");
  gt_xpc_dictionary_create_reply(v7);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(xdict, "requestID", v8);
  objc_msgSend(v6, "sendMessage:", xdict);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlService, 0);
  objc_storeStrong((id *)&self->_implInstance, 0);
}

@end
