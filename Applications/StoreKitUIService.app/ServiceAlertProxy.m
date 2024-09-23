@implementation ServiceAlertProxy

- (ServiceAlertProxy)init
{
  ServiceAlertProxy *v2;
  SSXPCConnection *v3;
  SSXPCConnection *receiverConnection;
  OS_xpc_object *v5;
  OS_xpc_object *receiverEndpoint;
  SSXPCConnection *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ServiceAlertProxy;
  v2 = -[ServiceAlertProxy init](&v12, "init");
  if (v2)
  {
    v3 = (SSXPCConnection *)objc_alloc_init((Class)SSXPCConnection);
    receiverConnection = v2->_receiverConnection;
    v2->_receiverConnection = v3;

    v5 = (OS_xpc_object *)-[SSXPCConnection createXPCEndpoint](v2->_receiverConnection, "createXPCEndpoint");
    receiverEndpoint = v2->_receiverEndpoint;
    v2->_receiverEndpoint = v5;

    objc_initWeak(&location, v2);
    v7 = v2->_receiverConnection;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000D668;
    v9[3] = &unk_100049648;
    objc_copyWeak(&v10, &location);
    -[SSXPCConnection setMessageBlock:](v7, "setMessageBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SSXPCConnection setMessageBlock:](self->_receiverConnection, "setMessageBlock:", 0);
  -[SSXPCConnection setDisconnectBlock:](self->_responseConnection, "setDisconnectBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceAlertProxy;
  -[ServiceAlertProxy dealloc](&v3, "dealloc");
}

- (void)finishWithResponse:(id)a3
{
  SSXPCConnection *responseConnection;
  _QWORD v4[5];

  responseConnection = self->_responseConnection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D82C;
  v4[3] = &unk_100049670;
  v4[4] = self;
  -[SSXPCConnection sendMessage:withReply:](responseConnection, "sendMessage:withReply:", a3, v4);
}

- (void)setResponseConnection:(id)a3
{
  SSXPCConnection *v5;
  SSXPCConnection *responseConnection;
  SSXPCConnection *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (SSXPCConnection *)a3;
  responseConnection = self->_responseConnection;
  if (responseConnection != v5)
  {
    -[SSXPCConnection setDisconnectBlock:](responseConnection, "setDisconnectBlock:", 0);
    objc_storeStrong((id *)&self->_responseConnection, a3);
    objc_initWeak(&location, self);
    v7 = self->_responseConnection;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D97C;
    v8[3] = &unk_100048FD0;
    objc_copyWeak(&v9, &location);
    -[SSXPCConnection setDisconnectBlock:](v7, "setDisconnectBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_closeReceiverConnection
{
  SSXPCConnection *receiverConnection;
  OS_xpc_object *receiverEndpoint;

  -[SSXPCConnection setDisconnectBlock:](self->_receiverConnection, "setDisconnectBlock:", 0);
  -[SSXPCConnection setMessageBlock:](self->_receiverConnection, "setMessageBlock:", 0);
  receiverConnection = self->_receiverConnection;
  self->_receiverConnection = 0;

  receiverEndpoint = self->_receiverEndpoint;
  self->_receiverEndpoint = 0;

}

- (void)_disconnect
{
  id v3;

  -[ServiceAlertProxy _closeReceiverConnection](self, "_closeReceiverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAlertProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "alertProxyDidCancel:") & 1) != 0)
    objc_msgSend(v3, "alertProxyDidCancel:", self);

}

- (void)_handleMessage:(id)a3 connection:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAlertProxy delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "alertProxy:didReceiveMessage:") & 1) != 0)
    objc_msgSend(v5, "alertProxy:didReceiveMessage:", self, v6);

}

- (ServiceAlertProxyDelegate)delegate
{
  return (ServiceAlertProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (OS_xpc_object)receiverEndpoint
{
  return self->_receiverEndpoint;
}

- (SSXPCConnection)responseConnection
{
  return self->_responseConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConnection, 0);
  objc_storeStrong((id *)&self->_receiverEndpoint, 0);
  objc_storeStrong((id *)&self->_receiverConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
