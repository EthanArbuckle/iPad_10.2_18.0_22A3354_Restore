@implementation GCGameIntentXPCProxyClientEndpoint

- (GCGameIntentXPCProxyClientEndpoint)initWithIdentifier:(id)a3
{
  id v4;
  GCGameIntentXPCProxyClientEndpoint *v5;
  uint64_t v6;
  NSObject *identifier;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGameIntentXPCProxyClientEndpoint;
  v5 = -[GCGameIntentXPCProxyClientEndpoint init](&v10, sel_init);
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "GCGameIntentXPCProxyClientEndpoint initWithIdentifier: %@", buf, 0xCu);
      }

    }
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (GCGameIntentXPCProxyClientEndpoint)init
{
  -[GCGameIntentXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id connectionInterruptionRegistration;
  void *v12;
  id connectionInvalidationRegistration;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_24D2B2C50;
  objc_copyWeak(&v19, &location);
  v9 = (void *)MEMORY[0x2199DEBB0](&v15);
  objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_connectionInterruptionRegistration = v10;

  objc_msgSend(v8, "addInvalidationHandler:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[GCGameIntentXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

  }
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__GCGameIntentXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(GameIntent XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__GCGameIntentXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[GCGameIntentXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)triggerGestureGameIntentAppLibrary
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentAppLibrary__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent App Library", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentAppLibrary__block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent App Library", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "triggerGameIntentWithEvent:", 1);
}

- (void)triggerGestureGameIntentGameCenter
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentGameCenter__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent Game Center", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentGameCenter__block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent Game Center", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "triggerGameIntentWithEvent:", 3);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_9(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_8();
}

void __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_9(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_8();
}

@end
