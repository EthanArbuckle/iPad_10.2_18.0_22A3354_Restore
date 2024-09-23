@implementation EKLocalXPCConnectionFactory

- (EKLocalXPCConnectionFactory)initWithTCCPermissionChecker:(id)a3
{
  id v5;
  EKLocalXPCConnectionFactory *v6;
  EKLocalXPCConnectionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKLocalXPCConnectionFactory;
  v6 = -[EKLocalXPCConnectionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tccPermissionChecker, a3);

  return v7;
}

- (EKLocalXPCConnectionFactory)init
{
  void *v3;
  EKLocalXPCConnectionFactory *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[EKLocalXPCConnectionFactory initWithTCCPermissionChecker:](self, "initWithTCCPermissionChecker:", v3);

  return v4;
}

- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C3F8]), "initWithWrappedObject:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0A8]), "initWithRemoteObject:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A138]), "initWithXPCConnection:tccPermissionChecker:", v9, self->_tccPermissionChecker);
  v11 = objc_alloc(MEMORY[0x1E0D0A0A8]);
  objc_msgSend(v10, "cadOperationProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRemoteObject:", v12);

  objc_initWeak(&location, v9);
  objc_initWeak(&from, v10);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __86__EKLocalXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke;
  v18 = &unk_1E47854B0;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  objc_msgSend(v13, "setInvalidationHandler:", &v15);
  objc_msgSend(v9, "resume", v15, v16, v17, v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

void __86__EKLocalXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "releaseProxy");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccPermissionChecker, 0);
}

@end
