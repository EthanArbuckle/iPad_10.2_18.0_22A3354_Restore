@implementation GTMTLDiagnosticsServiceXPCDispatcher

- (GTMTLDiagnosticsServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  GTMTLDiagnosticsServiceXPCDispatcher *v10;
  GTMTLDiagnosticsServiceXPCDispatcher *v11;
  objc_super v13;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addObject:", CFSTR("broadcastDisconnect"));
  v13.receiver = self;
  v13.super_class = (Class)GTMTLDiagnosticsServiceXPCDispatcher;
  v10 = -[GTXPCDispatcher initWithProtocolMethods:](&v13, sel_initWithProtocolMethods_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_service, a3);

  return v11;
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  GTMTLDiagnosticsServiceObserver *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTMTLDiagnosticsServiceObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTMTLDiagnosticsService registerObserver:](self->_service, "registerObserver:", v10);
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
  -[GTMTLDiagnosticsService deregisterObserver:](self->_service, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
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
  -[GTMTLDiagnosticsService deregisterObserversForConnection:path:](self->_service, "deregisterObserversForConnection:path:", v6, v7);

}

- (void)raiseRuntimeIssue_:(id)a3 replyConnection:(id)a4
{
  const char *string;
  uint64_t v6;
  id v7;

  string = xpc_dictionary_get_string(a3, "messagePrefix");
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[GTMTLDiagnosticsService raiseRuntimeIssue:](self->_service, "raiseRuntimeIssue:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
