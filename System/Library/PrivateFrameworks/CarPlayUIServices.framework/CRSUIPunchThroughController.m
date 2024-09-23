@implementation CRSUIPunchThroughController

- (CRSUIPunchThroughController)initWithPunchThroughIdentifier:(id)a3
{
  id v5;
  CRSUIPunchThroughController *v6;
  CRSUIPunchThroughController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BSServiceConnection *connection;
  BSServiceConnection *v13;
  NSObject *v14;
  BSServiceConnection *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;
  uint8_t buf[4];
  BSServiceConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRSUIPunchThroughController;
  v6 = -[CRSUIPunchThroughController init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_punchThroughIdentifier, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (void *)MEMORY[0x24BE383B8];
    +[CRSUIPunchThroughSpecification identifier](CRSUIPunchThroughSpecification, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.punch-through-service"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE383B0], "connectionWithEndpoint:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    connection = v7->_connection;
    v7->_connection = (BSServiceConnection *)v11;

    objc_initWeak(&location, v7);
    v13 = v7->_connection;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke;
    v20 = &unk_24C7699D0;
    objc_copyWeak(&v21, &location);
    -[BSServiceConnection configureConnection:](v13, "configureConnection:", &v17);
    CRSUILogForCategory(5uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v7->_connection;
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_20D6CC000, v14, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v7->_connection, "activate", v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[CRSUIPunchThroughSpecification serviceQuality](CRSUIPunchThroughSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIPunchThroughSpecification interface](CRSUIPunchThroughSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", WeakRetained);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_2;
  v8[3] = &unk_24C7698C0;
  objc_copyWeak(&v9, v6);
  objc_msgSend(v3, "setActivationHandler:", v8);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_9);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_6);
  objc_destroyWeak(&v9);

}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSUILogForCategory(5uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionActivated");

}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CRSUILogForCategory(5uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __62__CRSUIPunchThroughController_initWithPunchThroughIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CRSUILogForCategory(5uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_6_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)requestPresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id lock_pendingPresentationCompletion;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated)
  {
    if (!self->_lock_invalidated)
    {
      -[CRSUIPunchThroughController connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "remoteTarget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRSUIPunchThroughController punchThroughIdentifier](self, "punchThroughIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke;
      v10[3] = &unk_24C769898;
      v11 = v4;
      objc_msgSend(v6, "clientRequestPresentationForPunchThroughIdentifier:completion:", v7, v10);

      lock_pendingPresentationCompletion = v11;
LABEL_6:

    }
  }
  else if (!self->_lock_invalidated)
  {
    self->_lock_hasPendingPresentationRequest = 1;
    v9 = (void *)MEMORY[0x212BA7864](v4);
    lock_pendingPresentationCompletion = self->_lock_pendingPresentationCompletion;
    self->_lock_pendingPresentationCompletion = v9;
    goto LABEL_6;
  }
  self->_lock_presented = 1;
  os_unfair_lock_unlock(&self->_lock);

}

void __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke_2;
  v6[3] = &unk_24C769B48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __65__CRSUIPunchThroughController_requestPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (void)requestDismissalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated && self->_lock_presented)
  {
    -[CRSUIPunchThroughController connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIPunchThroughController punchThroughIdentifier](self, "punchThroughIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke;
    v8[3] = &unk_24C769898;
    v9 = v4;
    objc_msgSend(v6, "clientRequestDismissalForPunchThroughIdentifier:completion:", v7, v8);

  }
  self->_lock_presented = 0;
  os_unfair_lock_unlock(&self->_lock);

}

void __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke_2;
  v6[3] = &unk_24C769B48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __62__CRSUIPunchThroughController_requestDismissalWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  BSServiceConnection *connection;
  int v6;
  BSServiceConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    CRSUILogForCategory(5uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      v6 = 138412290;
      v7 = connection;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
    }

    -[BSServiceConnection invalidate](self->_connection, "invalidate");
    self->_lock_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)serverDismissedPunchThroughIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_presented = 0;
  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CRSUIPunchThroughController_serverDismissedPunchThroughIdentifier___block_invoke;
  block[3] = &unk_24C769C98;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __69__CRSUIPunchThroughController_serverDismissedPunchThroughIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchThroughControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)_handleConnectionActivated
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id lock_pendingPresentationCompletion;
  _QWORD v10[4];
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_hasPendingPresentationRequest)
  {
    v4 = (void *)MEMORY[0x212BA7864](self->_lock_pendingPresentationCompletion);
    -[CRSUIPunchThroughController connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIPunchThroughController punchThroughIdentifier](self, "punchThroughIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke;
    v10[3] = &unk_24C769898;
    v11 = v4;
    v8 = v4;
    objc_msgSend(v6, "clientRequestPresentationForPunchThroughIdentifier:completion:", v7, v10);

    self->_lock_hasPendingPresentationRequest = 0;
    lock_pendingPresentationCompletion = self->_lock_pendingPresentationCompletion;
    self->_lock_pendingPresentationCompletion = 0;

  }
  self->_lock_connectionActivated = 1;
  os_unfair_lock_unlock(p_lock);
}

void __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke_2;
  v6[3] = &unk_24C769B48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __57__CRSUIPunchThroughController__handleConnectionActivated__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (CRSUIPunchThroughControllerDelegate)delegate
{
  return (CRSUIPunchThroughControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)punchThroughIdentifier
{
  return self->_punchThroughIdentifier;
}

- (void)setPunchThroughIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_punchThroughIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_lock_pendingPresentationCompletion, 0);
}

@end
