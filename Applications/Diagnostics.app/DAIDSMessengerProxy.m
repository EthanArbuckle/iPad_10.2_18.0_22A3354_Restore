@implementation DAIDSMessengerProxy

- (DAIDSMessengerProxy)init
{
  DAIDSMessengerProxy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *messageReceiverQueue;
  uint64_t v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DAIDSMessengerProxy;
  v2 = -[DAIDSMessengerProxy init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Diagnostics.deviceMessageReceiverQueue", 0);
    messageReceiverQueue = v2->_messageReceiverQueue;
    v2->_messageReceiverQueue = (OS_dispatch_queue *)v3;

    v5 = objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy _createXPCConnection](v2, "_createXPCConnection"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

  }
  return v2;
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy connection](self, "connection"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_100133370));

  objc_msgSend(v6, "availableDestinationsWithCompletion:", v4);
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v8 = a7;
  v9 = a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy connection](self, "connection"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &stru_100133390));

  objc_msgSend(v19, "sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:", v17, v16, v15, v9, v8, v14);
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy messageReceiverQueue](self, "messageReceiverQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014F34;
  v21[3] = &unk_1001333B8;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v26 = a6;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, v21);

}

- (id)_createXPCConnection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;
  _QWORD v17[2];

  v3 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.iosdiagnosticsd"), 4096);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DAIDSMessageSender));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](DAIDSMessengerProxy, "allowedDataClasses"));
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, "sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:", 1, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](DAIDSMessengerProxy, "allowedDataClasses"));
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, "sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:", 2, 1);

  v17[0] = objc_opt_class(NSSet);
  v17[1] = objc_opt_class(DAIDSDestination);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, "availableDestinationsWithCompletion:", 0, 1);

  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DAIDSMessageReceiver));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](DAIDSMessengerProxy, "allowedDataClasses"));
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "receiveMessage:data:fromDestination:expectsResponse:response:", 1, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](DAIDSMessengerProxy, "allowedDataClasses"));
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v11, "receiveMessage:data:fromDestination:expectsResponse:response:", 1, 1);

  objc_msgSend(v3, "setExportedInterface:", v9);
  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "setInterruptionHandler:", &stru_1001333D8);
  objc_msgSend(v3, "setInvalidationHandler:", &stru_1001333F8);
  objc_msgSend(v3, "resume");
  v12 = DiagnosticLogHandleForCategory(8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created connection: %@", (uint8_t *)&v15, 0xCu);
  }

  return v3;
}

+ (id)allowedDataClasses
{
  if (qword_10016E888 != -1)
    dispatch_once(&qword_10016E888, &stru_100133418);
  return (id)qword_10016E880;
}

- (DAIDSMessageReceiver)receiver
{
  return (DAIDSMessageReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_receiver, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)messageReceiverQueue
{
  return self->_messageReceiverQueue;
}

- (void)setMessageReceiverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageReceiverQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceiverQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

@end
