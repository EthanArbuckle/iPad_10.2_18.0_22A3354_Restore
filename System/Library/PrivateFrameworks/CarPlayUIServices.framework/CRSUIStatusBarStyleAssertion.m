@implementation CRSUIStatusBarStyleAssertion

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3
{
  return -[CRSUIStatusBarStyleAssertion initWithInterfaceStyle:colorVariant:](self, "initWithInterfaceStyle:colorVariant:", a3, -1);
}

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4
{
  return (CRSUIStatusBarStyleAssertion *)-[CRSUIStatusBarStyleAssertion _initWithInterfaceStyle:colorVariant:siriPresentation:](self, "_initWithInterfaceStyle:colorVariant:siriPresentation:", a3, a4, 0);
}

- (CRSUIStatusBarStyleAssertion)initWithInterfaceStyle:(int64_t)a3 contrast:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 1)
    v4 = 1;
  else
    v4 = -1;
  if (a4)
    v5 = v4;
  else
    v5 = 0;
  return (CRSUIStatusBarStyleAssertion *)-[CRSUIStatusBarStyleAssertion _initWithInterfaceStyle:colorVariant:siriPresentation:](self, "_initWithInterfaceStyle:colorVariant:siriPresentation:", a3, v5, 0);
}

- (id)initForSiriPresentation
{
  return -[CRSUIStatusBarStyleAssertion _initWithInterfaceStyle:colorVariant:siriPresentation:](self, "_initWithInterfaceStyle:colorVariant:siriPresentation:", 0, -1, 1);
}

- (id)_initWithInterfaceStyle:(int64_t)a3 colorVariant:(int64_t)a4 siriPresentation:(BOOL)a5
{
  CRSUIStatusBarStyleAssertion *v8;
  CRSUIStatusBarStyleAssertion *v9;
  uint64_t v10;
  NSUUID *identifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BSServiceConnection *connection;
  BSServiceConnection *v18;
  NSObject *v19;
  BSServiceConnection *v20;
  _QWORD v22[4];
  CRSUIStatusBarStyleAssertion *v23;
  id v24;
  id location;
  objc_super v26;
  uint8_t buf[4];
  BSServiceConnection *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)CRSUIStatusBarStyleAssertion;
  v8 = -[CRSUIStatusBarStyleAssertion init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_interfaceStyle = a3;
    v8->_colorVariant = a4;
    v8->_siriPresentation = a5;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v12 = (void *)MEMORY[0x24BE383B8];
    +[CRSUIStatusBarStyleSpecification identifier](CRSUIStatusBarStyleSpecification, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v9->_identifier, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.status-bar-service"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE383B0], "connectionWithEndpoint:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    connection = v9->_connection;
    v9->_connection = (BSServiceConnection *)v16;

    objc_initWeak(&location, v9);
    v18 = v9->_connection;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke;
    v22[3] = &unk_24C769848;
    v23 = v9;
    objc_copyWeak(&v24, &location);
    -[BSServiceConnection configureConnection:](v18, "configureConnection:", v22);
    CRSUILogForCategory(1uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v9->_connection;
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_20D6CC000, v19, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v9->_connection, "activate");
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  return v9;
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[CRSUIStatusBarStyleSpecification serviceQuality](CRSUIStatusBarStyleSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIStatusBarStyleSpecification interface](CRSUIStatusBarStyleSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_2;
  v6[3] = &unk_24C7698C0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v6);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_2);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_7_0);
  objc_destroyWeak(&v7);

}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSUILogForCategory(1uLL);
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

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5(uint64_t a1, void *a2)
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
  CRSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_6(uint64_t a1, void *a2)
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
  CRSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_6_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)isValid
{
  CRSUIStatusBarStyleAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithAnimationSettings:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizedDrawingFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    if (-[CRSUIStatusBarStyleAssertion siriPresentation](self, "siriPresentation"))
    {
      CRSUILogForCategory(1uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_20D6CC000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for Siri presentation", (uint8_t *)v13, 2u);
      }

      -[CRSUIStatusBarStyleAssertion connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientAcquireForSiriPresentationWithFenceHandle:animationSettings:", v6, v5);
    }
    else
    {
      if (-[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      if (-[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant") == -1)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      CRSUILogForCategory(1uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109376;
        v13[1] = -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle");
        v14 = 1024;
        v15 = -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant");
        _os_log_impl(&dword_20D6CC000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for interface style: %d, color variant: %d", (uint8_t *)v13, 0xEu);
      }

      -[CRSUIStatusBarStyleAssertion connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "remoteTarget");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clientAcquireWithInterfaceStyle:colorVariant:fenceHandle:animationSettings:", v8, v9, v6, v5);

    }
    self->_lock_acquired = 1;
  }
  else
  {
    self->_lock_pendingAcquire = 1;
    objc_storeStrong((id *)&self->_lock_pendingAcquireFence, v6);
    objc_storeStrong((id *)&self->_lock_pendingAcquireAnimationSettings, a3);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)relinquishWithAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizedDrawingFence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lock_acquired && !self->_lock_invalidated)
  {
    CRSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D6CC000, v6, OS_LOG_TYPE_DEFAULT, "Relinquishing status bar style assertion", v9, 2u);
    }

    -[CRSUIStatusBarStyleAssertion connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientReliquishWithFenceHandle:animationSettings:", v5, v4);

    self->_lock_acquired = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

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
    CRSUILogForCategory(1uLL);
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
    self->_lock_acquired = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleConnectionActivated
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BKSAnimationFenceHandle *lock_pendingAcquireFence;
  BSAnimationSettings *lock_pendingAcquireAnimationSettings;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingAcquire)
  {
    self->_lock_pendingAcquire = 0;
    if (-[CRSUIStatusBarStyleAssertion siriPresentation](self, "siriPresentation"))
    {
      CRSUILogForCategory(1uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for Siri presentation", (uint8_t *)v12, 2u);
      }

      -[CRSUIStatusBarStyleAssertion connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "remoteTarget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientAcquireForSiriPresentationWithFenceHandle:animationSettings:", self->_lock_pendingAcquireFence, self->_lock_pendingAcquireAnimationSettings);
    }
    else
    {
      if (-[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      if (-[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant") == -1)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      CRSUILogForCategory(1uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109376;
        v12[1] = -[CRSUIStatusBarStyleAssertion interfaceStyle](self, "interfaceStyle");
        v13 = 1024;
        v14 = -[CRSUIStatusBarStyleAssertion colorVariant](self, "colorVariant");
        _os_log_impl(&dword_20D6CC000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for interface style: %d, contrast: %d", (uint8_t *)v12, 0xEu);
      }

      -[CRSUIStatusBarStyleAssertion connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientAcquireWithInterfaceStyle:colorVariant:fenceHandle:animationSettings:", v5, v6, self->_lock_pendingAcquireFence, self->_lock_pendingAcquireAnimationSettings);

    }
    lock_pendingAcquireFence = self->_lock_pendingAcquireFence;
    self->_lock_pendingAcquireFence = 0;

    lock_pendingAcquireAnimationSettings = self->_lock_pendingAcquireAnimationSettings;
    self->_lock_pendingAcquireAnimationSettings = 0;

    self->_lock_acquired = 1;
  }
  self->_lock_connectionActivated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (int64_t)colorVariant
{
  return self->_colorVariant;
}

- (void)setColorVariant:(int64_t)a3
{
  self->_colorVariant = a3;
}

- (BOOL)siriPresentation
{
  return self->_siriPresentation;
}

- (void)setSiriPresentation:(BOOL)a3
{
  self->_siriPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_pendingAcquireAnimationSettings, 0);
  objc_storeStrong((id *)&self->_lock_pendingAcquireFence, 0);
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, a2, a3, "Connection interrupted! %@", a5, a6, a7, a8, 2u);
}

void __86__CRSUIStatusBarStyleAssertion__initWithInterfaceStyle_colorVariant_siriPresentation___block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, a2, a3, "Connection invalidated! %@", a5, a6, a7, a8, 2u);
}

@end
