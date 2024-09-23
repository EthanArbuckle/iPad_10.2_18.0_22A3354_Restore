@implementation HDHAHealthAppPluginHostConnection

- (HDHAHealthAppPluginHostConnection)init
{
  HDHAHealthAppPluginHostConnection *v2;
  HDHAHealthAppPluginHostConnection *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDHAHealthAppPluginHostConnection;
  v2 = -[HDHAHealthAppPluginHostConnection init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.healthappd"), 0);
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256CF3D90);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection remoteObjectInterface](v3->_connection, "remoteObjectInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleJournaledSharingEntries_completion_, 0, 0);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHAHealthAppPluginHostConnection;
  -[HDHAHealthAppPluginHostConnection dealloc](&v3, sel_dealloc);
}

- (void)resumeIfNecessary
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_resumed)
  {
    self->_resumed = 1;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_2);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_196);
    -[NSXPCConnection resume](self->_connection, "resume");
  }
  os_unfair_lock_unlock(p_lock);
}

void __54__HDHAHealthAppPluginHostConnection_resumeIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23DB70000, v0, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection remote proxy interrupted", v1, 2u);
  }
}

void __54__HDHAHealthAppPluginHostConnection_resumeIfNecessary__block_invoke_195()
{
  NSObject *v0;
  uint8_t v1[16];

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23DB70000, v0, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection remote proxy invalidated", v1, 2u);
  }
}

- (id)proxy
{
  -[HDHAHealthAppPluginHostConnection resumeIfNecessary](self, "resumeIfNecessary");
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_198);
}

void __42__HDHAHealthAppPluginHostConnection_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)synchronousProxy
{
  -[HDHAHealthAppPluginHostConnection resumeIfNecessary](self, "resumeIfNecessary");
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_199);
}

void __53__HDHAHealthAppPluginHostConnection_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
