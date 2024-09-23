@implementation SKServiceBroker

void __32__SKServiceBroker_defaultBroker__block_invoke()
{
  SKServiceBroker *v0;
  void *v1;

  v0 = objc_alloc_init(SKServiceBroker);
  v1 = (void *)defaultBroker__defaultServiceBroker;
  defaultBroker__defaultServiceBroker = (uint64_t)v0;

}

- (SKServiceBroker)init
{
  SKServiceBroker *v2;
  NSLock *v3;
  NSLock *serviceConnectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKServiceBroker;
  v2 = -[SKServiceBroker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;

  }
  return v2;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SKServiceBroker_storeKitSynchronousServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultBroker
{
  if (defaultBroker_onceToken_0 != -1)
    dispatch_once(&defaultBroker_onceToken_0, &__block_literal_global_14);
  return (id)defaultBroker__defaultServiceBroker;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__SKServiceBroker_storeKitServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_serviceConnection
{
  NSXPCConnection *serviceConnection;
  NSXPCConnection **p_serviceConnection;
  void *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[NSLock lock](self->_serviceConnectionLock, "lock");
  p_serviceConnection = &self->_serviceConnection;
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    +[SKServiceBroker _serviceConnectionWithName:](SKServiceBroker, "_serviceConnectionWithName:", 0x1E5B2E0C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");
    objc_storeStrong((id *)&self->_serviceConnection, v5);
    objc_initWeak(&location, self);
    v6 = self->_serviceConnection;
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__SKServiceBroker__serviceConnection__block_invoke;
    v13[3] = &unk_1E5B27B50;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v13);
    v8 = *p_serviceConnection;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __37__SKServiceBroker__serviceConnection__block_invoke_2;
    v11[3] = &unk_1E5B27B50;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

    serviceConnection = *p_serviceConnection;
  }
  v9 = serviceConnection;
  -[NSLock unlock](self->_serviceConnectionLock, "unlock");
  return v9;
}

+ (id)_serviceConnectionWithName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", v4, 0);

  +[SKServiceBroker _storeKitServiceInterface](SKServiceBroker, "_storeKitServiceInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  +[SKServiceBroker _storeKitClientInterface](SKServiceBroker, "_storeKitClientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v8);

  return v5;
}

+ (id)_storeKitServiceInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAAA68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAAAC8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_productsWithRequest_responseReceiver_reply_, 1, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC7A708);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_enumerateCurrentReceiptsForProductID_withReceiver_reply_, 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_enumerateReceiptsForProductID_withReceiver_reply_, 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_enumerateUnfinishedTransactionsWithReceiver_reply_, 0, 0);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processPayment_forClient_paymentDelegate_reply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA0EB8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_processPayment_forClient_paymentDelegate_reply_, 2, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC7A690);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_enumerateSubscriptionStatusesWithReceiver_reply_, 0, 0);

  return v2;
}

+ (id)_storeKitClientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC7A9C8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_downloadStatusChanged_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updatedTransactions_, 0, 0);

  return v2;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SKServiceBroker_purchaseIntentServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SKServiceBroker_externalGatewayServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__SKServiceBroker_externalGatewayServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SKServiceBroker_inAppBindingServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__SKServiceBroker_inAppBindingServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SKServiceBroker_inAppEngagementServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__SKServiceBroker_inAppEngagementServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SKServiceBroker_messageServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__SKServiceBroker_messageServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__SKServiceBroker_overrideServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__SKServiceBroker_overrideServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SKServiceBroker_overrideSynchronousServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __62__SKServiceBroker_overrideSynchronousServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__SKServiceBroker_policyServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__SKServiceBroker_policyServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SKServiceBroker_productLookupServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__SKServiceBroker_productLookupServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SKServiceBroker_productServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__SKServiceBroker_productServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__SKServiceBroker_purchaseIntentServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  -[SKServiceBroker _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SKServiceBroker_storefrontServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__SKServiceBroker_storefrontServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__SKServiceBroker_storeKitServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__SKServiceBroker_storeKitSynchronousServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __37__SKServiceBroker__serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serviceConnectionInvalidated");

}

void __37__SKServiceBroker__serviceConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serviceConnectionInvalidated");

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
