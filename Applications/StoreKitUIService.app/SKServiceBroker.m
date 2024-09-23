@implementation SKServiceBroker

- (SKServiceBroker)init
{
  SKServiceBroker *v2;
  NSLock *v3;
  NSLock *serviceConnectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKServiceBroker;
  v2 = -[SKServiceBroker init](&v6, "init");
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;

  }
  return v2;
}

+ (id)defaultBroker
{
  if (qword_1000632B0 != -1)
    dispatch_once(&qword_1000632B0, &stru_100048F80);
  return (id)qword_1000632A8;
}

- (id)externalGatewayServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005C1C;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)inAppBindingServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005CD4;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)inAppEngagementServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005D8C;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)messageServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005E44;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)overrideServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005EFC;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)overrideSynchronousServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005FB4;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)policyServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000606C;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)productLookupServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006124;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)productServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000061DC;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)purchaseIntentServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006294;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)storefrontServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000634C;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)storeKitServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006404;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (id)storeKitSynchronousServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKServiceBroker _serviceConnection](self, "_serviceConnection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000064BC;
  v9[3] = &unk_100048FA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

+ (id)_storeKitServiceInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ServiceProtocol));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ProductResponseReceiver));
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v16, "productsWithRequest:responseReceiver:reply:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKTransactionReceiverProtocol));
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, "enumerateCurrentReceiptsForProductID:withReceiver:reply:", 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, "enumerateReceiptsForProductID:withReceiver:reply:", 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, "enumerateUnfinishedTransactionsWithReceiver:reply:", 0, 0);
  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(NSString);
  v7 = objc_opt_class(NSNumber);
  v8 = objc_opt_class(NSData);
  v9 = objc_opt_class(NSDate);
  v10 = objc_opt_class(NSURL);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSError), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, "processPayment:forClient:paymentDelegate:reply:", 0, 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKPaymentDelegateProtocol));
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v13, "processPayment:forClient:paymentDelegate:reply:", 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKStatusReceiverProtocol));
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v14, "enumerateSubscriptionStatusesWithReceiver:reply:", 0, 0);

  return v2;
}

+ (id)_storeKitClientInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKClientProtocol));
  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(NSArray);
  v5 = objc_opt_class(NSString);
  v6 = objc_opt_class(NSNumber);
  v7 = objc_opt_class(NSURL);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(NSError), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, "downloadStatusChanged:", 0, 0);

  v10 = objc_opt_class(NSDictionary);
  v11 = objc_opt_class(NSArray);
  v12 = objc_opt_class(NSString);
  v13 = objc_opt_class(NSNumber);
  v14 = objc_opt_class(NSData);
  v15 = objc_opt_class(NSDate);
  v16 = objc_opt_class(NSURL);
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, objc_opt_class(NSError), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, "updatedTransactions:", 0, 0);

  return v2;
}

- (id)_serviceConnection
{
  NSXPCConnection *serviceConnection;
  NSXPCConnection **p_serviceConnection;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[NSLock lock](self->_serviceConnectionLock, "lock");
  p_serviceConnection = &self->_serviceConnection;
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKServiceBroker _serviceConnectionWithName:](SKServiceBroker, "_serviceConnectionWithName:", CFSTR("com.apple.storekitd")));
    objc_msgSend(v5, "resume");
    objc_storeStrong((id *)&self->_serviceConnection, v5);
    objc_initWeak(&location, self);
    v6 = self->_serviceConnection;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006A54;
    v12[3] = &unk_100048FD0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v12);
    v7 = *p_serviceConnection;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006A80;
    v10[3] = &unk_100048FD0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    serviceConnection = *p_serviceConnection;
  }
  v8 = serviceConnection;
  -[NSLock unlock](self->_serviceConnectionLock, "unlock");
  return v8;
}

+ (id)_serviceConnectionWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", v3, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKServiceBroker _storeKitServiceInterface](SKServiceBroker, "_storeKitServiceInterface"));
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKServiceBroker _storeKitClientInterface](SKServiceBroker, "_storeKitClientInterface"));
  objc_msgSend(v4, "setExportedInterface:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker"));
  objc_msgSend(v4, "setExportedObject:", v7);

  return v4;
}

- (void)_serviceConnectionInvalidated
{
  NSXPCConnection *serviceConnection;

  -[NSLock lock](self->_serviceConnectionLock, "lock");
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

  -[NSLock unlock](self->_serviceConnectionLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_serviceConnectionLock, 0);
}

@end
