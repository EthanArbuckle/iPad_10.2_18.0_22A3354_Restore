@implementation CRSSessionController

- (CRSSessionController)init
{
  CRSSessionController *v2;
  CRSSessionController *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BSServiceConnection *connection;
  BSServiceConnection *v9;
  NSObject *v10;
  BSServiceConnection *v11;
  _QWORD v13[4];
  CRSSessionController *v14;
  objc_super v15;
  uint8_t buf[4];
  BSServiceConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)CRSSessionController;
  v2 = -[CRSSessionController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x24BE0FA08];
    +[CRSSessionSpecification identifier](CRSSessionSpecification, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.service"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v7;

    v9 = v3->_connection;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __28__CRSSessionController_init__block_invoke;
    v13[3] = &unk_24CD38938;
    v14 = v3;
    -[BSServiceConnection configureConnection:](v9, "configureConnection:", v13);
    CRSLogForCategory(3uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v3->_connection;
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_212138000, v10, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v3->_connection, "activate");
  }
  return v3;
}

void __28__CRSSessionController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[CRSSessionSpecification serviceQuality](CRSSessionSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[CRSSessionSpecification interface](CRSSessionSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_0);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_5);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_7);

}

void __28__CRSSessionController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }

}

void __28__CRSSessionController_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __28__CRSSessionController_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }

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
    CRSLogForCategory(3uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      v6 = 138412290;
      v7 = connection;
      _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v6, 0xCu);
    }

    -[BSServiceConnection invalidate](self->_connection, "invalidate");
    self->_lock_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
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
  objc_storeStrong((id *)&self->_process, 0);
}

@end
