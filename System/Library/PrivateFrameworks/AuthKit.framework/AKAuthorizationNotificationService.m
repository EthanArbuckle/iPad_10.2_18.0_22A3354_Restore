@implementation AKAuthorizationNotificationService

- (AKAuthorizationNotificationService)init
{
  return -[AKAuthorizationNotificationService initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (AKAuthorizationNotificationService)initWithDaemonXPCEndpoint:(id)a3
{
  id v5;
  AKAuthorizationNotificationService *v6;
  AKAuthorizationNotificationService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationNotificationService;
  v6 = -[AKAuthorizationNotificationService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_daemonEndpoint, a3);

  return v7;
}

+ (id)_sharedService
{
  if (_sharedService_onceToken != -1)
    dispatch_once(&_sharedService_onceToken, &__block_literal_global_47);
  return (id)_sharedService_sharedService;
}

void __52__AKAuthorizationNotificationService__sharedService__block_invoke()
{
  AKAuthorizationNotificationService *v0;
  void *v1;

  v0 = objc_alloc_init(AKAuthorizationNotificationService);
  v1 = (void *)_sharedService_sharedService;
  _sharedService_sharedService = (uint64_t)v0;

}

+ (void)startServiceWithNotificationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_sharedService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startWithNotificationHandler:completion:", v4, 0);

}

+ (void)startServiceWithStateBroadcastHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_sharedService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startWithStateBroadcastHandler:completion:", v4, 0);

}

- (void)startWithNotificationHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AKAdaptiveService *v9;
  AKAdaptiveService *service;
  AKAdaptiveService *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  +[AKAuthorizationNotificationHandlerInterface XPCInterface](AKAuthorizationNotificationHandlerInterface, "XPCInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKAdaptiveService initWithInterface:strongObject:]([AKAdaptiveService alloc], "initWithInterface:strongObject:", v8, v6);
  service = self->_service;
  self->_service = v9;

  v11 = self->_service;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__AKAuthorizationNotificationService_startWithNotificationHandler_completion___block_invoke;
  v13[3] = &unk_1E2E61650;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  -[AKAdaptiveService setInvalidationHandler:](v11, "setInvalidationHandler:", v13);
  -[AKAdaptiveService resume](self->_service, "resume");
  -[AKAuthorizationNotificationService _configureNotificationServiceWithCompletion:](self, "_configureNotificationServiceWithCompletion:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __78__AKAuthorizationNotificationService_startWithNotificationHandler_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configureNotificationServiceWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)startWithStateBroadcastHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AKAdaptiveService *v9;
  AKAdaptiveService *service;
  AKAdaptiveService *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  +[AKAuthorizationStateBroadcastHandlerInterface XPCInterface](AKAuthorizationStateBroadcastHandlerInterface, "XPCInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKAdaptiveService initWithInterface:strongObject:]([AKAdaptiveService alloc], "initWithInterface:strongObject:", v8, v6);
  service = self->_service;
  self->_service = v9;

  v11 = self->_service;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__AKAuthorizationNotificationService_startWithStateBroadcastHandler_completion___block_invoke;
  v13[3] = &unk_1E2E61650;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  -[AKAdaptiveService setInvalidationHandler:](v11, "setInvalidationHandler:", v13);
  -[AKAdaptiveService resume](self->_service, "resume");
  -[AKAuthorizationNotificationService _configureStateBroadcastServiceWithCompletion:](self, "_configureStateBroadcastServiceWithCompletion:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __80__AKAuthorizationNotificationService_startWithStateBroadcastHandler_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configureStateBroadcastServiceWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)_configureNotificationServiceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  AKAuthorizationController *v6;

  v4 = a3;
  v6 = -[AKAuthorizationController initWithDaemonXPCEndpoint:]([AKAuthorizationController alloc], "initWithDaemonXPCEndpoint:", self->_daemonEndpoint);
  -[AKAdaptiveService listenerEndpoint](self->_service, "listenerEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationController establishConnectionWithNotificationHandlerEndpoint:completion:](v6, "establishConnectionWithNotificationHandlerEndpoint:completion:", v5, v4);

}

- (void)_configureStateBroadcastServiceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  AKAuthorizationController *v6;

  v4 = a3;
  v6 = -[AKAuthorizationController initWithDaemonXPCEndpoint:]([AKAuthorizationController alloc], "initWithDaemonXPCEndpoint:", self->_daemonEndpoint);
  -[AKAdaptiveService listenerEndpoint](self->_service, "listenerEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationController establishConnectionWithStateBroadcastHandlerEndpoint:completion:](v6, "establishConnectionWithStateBroadcastHandlerEndpoint:completion:", v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonEndpoint, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
