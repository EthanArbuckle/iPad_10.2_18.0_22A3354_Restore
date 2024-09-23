@implementation TKTokenDriverContext

- (TKTokenConfigurationConnection)configurationConnection
{
  TKTokenDriverContext *v3;
  TKTokenConfigurationConnection *configurationConnection;
  void *v5;
  TKTokenConfigurationConnection *v6;
  void *v7;
  uint64_t v8;
  TKTokenConfigurationConnection *v9;
  TKTokenConfigurationConnection *v10;
  void *v12;

  v3 = self;
  objc_sync_enter(v3);
  configurationConnection = v3->_configurationConnection;
  if (!configurationConnection)
  {
    -[TKTokenDriverContext configurationEndpoint](v3, "configurationEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("TKToken.m"), 305, CFSTR("ctkd did not set configurationEndpoint"));

    }
    v6 = [TKTokenConfigurationConnection alloc];
    -[TKTokenDriverContext configurationEndpoint](v3, "configurationEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TKTokenConfigurationConnection initWithEndpoint:](v6, "initWithEndpoint:", v7);
    v9 = v3->_configurationConnection;
    v3->_configurationConnection = (TKTokenConfigurationConnection *)v8;

    configurationConnection = v3->_configurationConnection;
  }
  v10 = configurationConnection;
  objc_sync_exit(v3);

  return v10;
}

- (id)configurationForTokenID:(id)a3
{
  id v4;
  TKTokenConfiguration *v5;
  void *v6;
  TKTokenConfiguration *v7;

  v4 = a3;
  v5 = [TKTokenConfiguration alloc];
  -[TKTokenDriverContext configurationConnection](self, "configurationConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TKTokenConfiguration initWithTokenID:configurationConnection:](v5, "initWithTokenID:configurationConnection:", v4, v6);

  return v7;
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[2];

  v5 = a5;
  v8 = a3;
  -[TKTokenDriverContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_228);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v11;
  objc_msgSend(v10, "auditAuthOperation:auditToken:success:", v8, v12, v5);

}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TK_LOG_token();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1();

}

- (double)idleTimeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[TKTokenDriverContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idleTimeout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v6 = 5.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      v6 = v7;
      TK_LOG_token();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[TKTokenDriverContext idleTimeout].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  else
  {
    v6 = 5.0;
  }

  return v6;
}

- (void)setup
{
  TKTokenDriver *v3;
  TKTokenDriver *driver;
  TKSharedResourceSlot *v5;
  void *v6;
  void *v7;
  TKSharedResourceSlot *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id initialKeepAlive;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  +[TKTokenDriver createDriver](TKTokenDriver, "createDriver");
  v3 = (TKTokenDriver *)objc_claimAutoreleasedReturnValue();
  driver = self->_driver;
  self->_driver = v3;

  -[TKTokenDriver setContext:](self->_driver, "setContext:", self);
  v5 = [TKSharedResourceSlot alloc];
  -[TKTokenDriverContext driver](self, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TKSharedResourceSlot initWithName:](v5, "initWithName:", v7);
  -[TKTokenDriver setKeepAliveResourceSlot:](self->_driver, "setKeepAliveResourceSlot:", v8);

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __29__TKTokenDriverContext_setup__block_invoke;
  v25[3] = &unk_1E7089120;
  objc_copyWeak(&v26, &location);
  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot", v25[0], 3221225472, __29__TKTokenDriverContext_setup__block_invoke, &unk_1E7089120);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObjectDestroyedBlock:", v25);

  -[TKTokenDriverContext idleTimeout](self, "idleTimeout");
  v11 = v10;
  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdleTimeout:", v11);

  -[TKTokenDriverContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdleQueue:", v14);

  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceWithError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  initialKeepAlive = self->_initialKeepAlive;
  self->_initialKeepAlive = v17;

  -[TKTokenDriverContext inputItems](self, "inputItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("avoidInitialKeepAlive"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
  {
    v24 = self->_initialKeepAlive;
    self->_initialKeepAlive = 0;

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __29__TKTokenDriverContext_setup__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_token();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __29__TKTokenDriverContext_setup__block_invoke_cold_3(WeakRetained, v2);

    objc_msgSend(WeakRetained, "driver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "terminate");

    TK_LOG_token();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __29__TKTokenDriverContext_setup__block_invoke_cold_2();

    v5 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cancelRequestWithError:", v6);

    TK_LOG_token();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __29__TKTokenDriverContext_setup__block_invoke_cold_1();

  }
}

- (void)setConfigurationEndpoint:(id)a3 reply:(id)a4
{
  void (**v5)(void);

  objc_storeStrong((id *)&self->_configurationEndpoint, a3);
  v5 = (void (**)(void))a4;
  v5[2]();

}

- (BOOL)startRequestWithError:(id *)a3
{
  void *v3;
  void *v6;
  id initialKeepAlive;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  -[TKTokenDriverContext driver](self, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    initialKeepAlive = self->_initialKeepAlive;
    v8 = initialKeepAlive;
    if (!initialKeepAlive)
    {
      -[TKTokenDriverContext driver](self, "driver");
      a3 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "keepAliveResourceSlot");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "resourceWithError:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TKTokenDriverContext driver](self, "driver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeepAlive:", v8);

    if (!initialKeepAlive)
    {

    }
    v10 = self->_initialKeepAlive;
    self->_initialKeepAlive = 0;

  }
  else
  {
    TK_LOG_token();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[TKTokenDriverContext startRequestWithError:].cold.1();

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 != 0;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  TKTokenDriverContext *v14;
  id v15;
  os_activity_scope_state_s state;
  id v17;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v8 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v17);
  v9 = v17;
  if (v8)
  {
    v10 = _os_activity_create(&dword_1B9768000, "acquire token by instanceID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    -[TKTokenDriverContext driver](self, "driver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke;
    v12[3] = &unk_1E7089148;
    v13 = v6;
    v14 = self;
    v15 = v7;
    objc_msgSend(v11, "acquireTokenWithInstanceID:reply:", v13, v12);

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a2;
  TK_LOG_token();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "driver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setKeepAlive:", 0);

}

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s state;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v18);
  v12 = v18;
  if (v11)
  {
    v13 = _os_activity_create(&dword_1B9768000, "acquire token by slot", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    -[TKTokenDriverContext driver](self, "driver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke;
    v15[3] = &unk_1E7089170;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v14, "acquireTokenWithSlot:AID:reply:", v8, v9, v15);

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v12);
  }

}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a2;
  TK_LOG_token();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "driver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeepAlive:", 0);

}

- (void)configureWithReply:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  os_activity_scope_state_s state;
  id v12;

  v4 = a3;
  v12 = 0;
  v5 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v12);
  v6 = v12;
  if (v5)
  {
    v7 = _os_activity_create(&dword_1B9768000, "configure token class", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    -[TKTokenDriverContext driver](self, "driver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__TKTokenDriverContext_configureWithReply___block_invoke;
    v9[3] = &unk_1E7089198;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "configureWithReply:", v9);

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

void __43__TKTokenDriverContext_configureWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  TK_LOG_token();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(a1, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeepAlive:", 0);

}

- (void)releaseTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s state;
  id v14;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v14 = 0;
  v8 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v14);
  v9 = v14;
  if (v8)
  {
    v10 = _os_activity_create(&dword_1B9768000, "release token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    -[TKTokenDriverContext driver](self, "driver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "releaseTokenWithInstanceID:", v6);

    v7[2](v7);
    -[TKTokenDriverContext driver](self, "driver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeepAlive:", 0);

    os_activity_scope_leave(&state);
  }
  else
  {
    v7[2](v7);
  }

}

- (TKTokenDriver)driver
{
  return self->_driver;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationEndpoint, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong(&self->_initialKeepAlive, 0);
  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1B9768000, v0, v1, "Failed to get host proxy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)idleTimeout
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a1, a3, "Setting custom idle timeout to %{public}gs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Extension request cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Driver shut down all endpoints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "driver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, a2, v4, "Idle time detected in extension (%{public}@), shutting down the context %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)startRequestWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Aborting request on inactive context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "answering endpoint for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "answering endpoint for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "driver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "finished configuring class %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

@end
