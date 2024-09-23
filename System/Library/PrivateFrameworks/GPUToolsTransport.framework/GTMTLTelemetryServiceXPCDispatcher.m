@implementation GTMTLTelemetryServiceXPCDispatcher

- (GTMTLTelemetryServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 notifyConnection:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  GTMTLTelemetryServiceXPCDispatcher *v11;
  GTMTLTelemetryServiceXPCDispatcher *v12;
  objc_super v14;

  v8 = a3;
  objc_msgSend(a4, "protocolMethods");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "addObject:", CFSTR("broadcastDisconnect"));
  v14.receiver = self;
  v14.super_class = (Class)GTMTLTelemetryServiceXPCDispatcher;
  v11 = -[GTXPCDispatcher initWithProtocolMethods:](&v14, sel_initWithProtocolMethods_, v10);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_implInstance, a3);

  return v12;
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  GTMTLTelemetryServiceObserver *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTMTLTelemetryServiceObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTMTLTelemetryService registerObserver:](self->_implInstance, "registerObserver:", v10);
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
  -[GTMTLTelemetryService deregisterObserver:](self->_implInstance, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
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
  -[GTMTLTelemetryService deregisterObserversForConnection:path:](self->_implInstance, "deregisterObserversForConnection:path:", v6, v7);

}

- (void)update_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchTelemetryBatchRequest(a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLTelemetryService update:](self->_implInstance, "update:", v6);

}

- (void)query_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchTelemetryBatchRequest(a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLTelemetryService query:](self->_implInstance, "query:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implInstance, 0);
}

@end
