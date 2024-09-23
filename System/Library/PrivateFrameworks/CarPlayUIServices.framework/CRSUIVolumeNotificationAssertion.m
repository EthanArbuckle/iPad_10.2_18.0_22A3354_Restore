@implementation CRSUIVolumeNotificationAssertion

- (CRSUIVolumeNotificationAssertion)init
{
  CRSUIVolumeNotificationAssertion *v2;
  uint64_t v3;
  NSUUID *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BSServiceConnection *connection;
  BSServiceConnection *v11;
  NSObject *v12;
  BSServiceConnection *v13;
  _QWORD v15[4];
  CRSUIVolumeNotificationAssertion *v16;
  id v17;
  id location;
  objc_super v19;
  uint8_t buf[4];
  BSServiceConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)CRSUIVolumeNotificationAssertion;
  v2 = -[CRSUIVolumeNotificationAssertion init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (void *)MEMORY[0x24BE383B8];
    +[CRSUIVolumeNotificationSpecification identifier](CRSUIVolumeNotificationSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v2->_identifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.volume-notification-service"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE383B0], "connectionWithEndpoint:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v9;

    objc_initWeak(&location, v2);
    v11 = v2->_connection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__CRSUIVolumeNotificationAssertion_init__block_invoke;
    v15[3] = &unk_24C769848;
    v16 = v2;
    objc_copyWeak(&v17, &location);
    -[BSServiceConnection configureConnection:](v11, "configureConnection:", v15);
    CRSUILogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_20D6CC000, v12, OS_LOG_TYPE_DEFAULT, "Volume notification activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v2->_connection, "activate");
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[CRSUIVolumeNotificationSpecification serviceQuality](CRSUIVolumeNotificationSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIVolumeNotificationSpecification interface](CRSUIVolumeNotificationSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CRSUIVolumeNotificationAssertion_init__block_invoke_2;
  v6[3] = &unk_24C7698C0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v6);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_1);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_7);
  objc_destroyWeak(&v7);

}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSUILogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Volume notification connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionActivated");

}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5(uint64_t a1, void *a2)
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
  CRSUILogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6(uint64_t a1, void *a2)
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
  CRSUILogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)isValid
{
  CRSUIVolumeNotificationAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)suspendNotifications
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    CRSUILogForCategory(2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20D6CC000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring assertion", v8, 2u);
    }

    -[CRSUIVolumeNotificationAssertion connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientSuspendNotifications");

    v4 = 12;
  }
  else
  {
    v4 = 15;
  }
  *((_BYTE *)&self->super.isa + v4) = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelSuspension
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_acquired && !self->_lock_invalidated)
  {
    CRSUILogForCategory(2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CRSUIVolumeNotificationAssertion connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRSUIVolumeNotificationAssertion connection](self, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Relinquishing volume notification assertion connection: %@. Remote target: %@", (uint8_t *)&v10, 0x16u);

    }
    -[CRSUIVolumeNotificationAssertion connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientCancelSuspension");

    self->_lock_acquired = 0;
  }
  os_unfair_lock_unlock(p_lock);
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
    CRSUILogForCategory(2uLL);
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
  uint8_t v7[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingAcquire)
  {
    self->_lock_pendingAcquire = 0;
    CRSUILogForCategory(2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring volume notification assertion", v7, 2u);
    }

    -[CRSUIVolumeNotificationAssertion connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientSuspendNotifications");

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

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, a2, a3, "Volume notification connection interrupted! %@", a5, a6, a7, a8, 2u);
}

void __40__CRSUIVolumeNotificationAssertion_init__block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, a2, a3, "Volume notification connection Volume invalidated! %@", a5, a6, a7, a8, 2u);
}

@end
