@implementation CRSInCallAssertion

- (CRSInCallAssertion)initWithReason:(id)a3
{
  id v4;
  CRSInCallAssertion *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BSServiceConnection *connection;
  BSServiceConnection *v17;
  NSObject *v18;
  BSServiceConnection *v19;
  _QWORD v21[4];
  CRSInCallAssertion *v22;
  id v23;
  id location;
  objc_super v25;
  uint8_t buf[4];
  BSServiceConnection *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRSInCallAssertion;
  v5 = -[CRSInCallAssertion init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&__counterLock);
    v8 = __instanceCounter++;
    os_unfair_lock_unlock((os_unfair_lock_t)&__counterLock);
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[CRSInCallAssertion reason](v5, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%i-%u"), v10, getpid(), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BE0FA08];
    +[CRSInCallAssertionSpecification identifier](CRSInCallAssertionSpecification, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.non-launching-service"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    connection = v5->_connection;
    v5->_connection = (BSServiceConnection *)v15;

    objc_initWeak(&location, v5);
    v17 = v5->_connection;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __37__CRSInCallAssertion_initWithReason___block_invoke;
    v21[3] = &unk_24CD38CE8;
    v22 = v5;
    objc_copyWeak(&v23, &location);
    -[BSServiceConnection configureConnection:](v17, "configureConnection:", v21);
    CRSLogForCategory(2uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v5->_connection;
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_212138000, v18, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v5->_connection, "activate");
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __37__CRSInCallAssertion_initWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  +[CRSInCallAssertionSpecification serviceQuality](CRSInCallAssertionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSInCallAssertionSpecification interface](CRSInCallAssertionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__CRSInCallAssertion_initWithReason___block_invoke_2;
  v12[3] = &unk_24CD38CC0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v12);
  v7 = v6;
  v8 = 3221225472;
  v9 = __37__CRSInCallAssertion_initWithReason___block_invoke_3;
  v10 = &unk_24CD38CC0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", &v7);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_5, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);

}

void __37__CRSInCallAssertion_initWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionActivated");

}

void __37__CRSInCallAssertion_initWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __37__CRSInCallAssertion_initWithReason___block_invoke_4(uint64_t a1, void *a2)
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
  CRSLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__CRSInCallAssertion_initWithReason___block_invoke_4_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated && !self->_lock_invalidated)
  {
    CRSLogForCategory(2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation!", v8, 2u);
    }

    -[CRSInCallAssertion connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentInCallService");

    v4 = 13;
  }
  else
  {
    v4 = 12;
  }
  *((_BYTE *)&self->super.isa + v4) = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsBanners
{
  CRSInCallAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsBanners;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowsBanners:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_allowsBanners = v3;
  if (self->_lock_activated)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsBanners:", v7);

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
    CRSLogForCategory(2uLL);
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

- (void)_handleConnectionActivated
{
  NSObject *v3;
  BSServiceConnection *connection;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BSServiceConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CRSLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v9 = 138412290;
    v10 = connection;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_pendingPresent)
  {
    self->_lock_pendingPresent = 0;
    CRSLogForCategory(2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation!", (uint8_t *)&v9, 2u);
    }

    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentInCallService");

    self->_lock_presented = 1;
  }
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lock_allowsBanners);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsBanners:", v8);

  self->_lock_activated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleConnectionInterrupted
{
  OUTLINED_FUNCTION_0_0(&dword_212138000, a2, a3, "Connection interrupted! Reactivating... %@", a5, a6, a7, a8, 2u);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_storeStrong((id *)&self->_reason, 0);
}

void __37__CRSInCallAssertion_initWithReason___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212138000, a2, a3, "Connection invalidated! %@", a5, a6, a7, a8, 2u);
}

@end
