@implementation XAMWriter

+ (void)resetSharedWriter
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)XAMSharedWriter;
  XAMSharedWriter = 0;

  objc_sync_exit(obj);
}

+ (XAMWriter)sharedInstance
{
  id v2;
  XAMWriter *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a1;
  objc_sync_enter(v2);
  if (!XAMSharedWriter)
  {
    v3 = [XAMWriter alloc];
    v4 = (void *)objc_opt_new();
    v5 = -[XAMWriter initWithWriterConnectionFactory:authorizationProvider:](v3, "initWithWriterConnectionFactory:authorizationProvider:", &__block_literal_global, v4);
    v6 = (void *)XAMSharedWriter;
    XAMSharedWriter = v5;

  }
  objc_sync_exit(v2);

  return (XAMWriter *)(id)XAMSharedWriter;
}

id __27__XAMWriter_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  XAMAutomationModeWriterMachServiceName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255D677F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRemoteObjectInterface:", v2);

  objc_msgSend(v1, "resume");
  return v1;
}

- (XAMWriter)initWithWriterConnectionFactory:(id)a3 authorizationProvider:(id)a4
{
  XAMAuthorizationProvider *v6;
  id v7;
  XAMWriter *v8;
  uint64_t v9;
  id writerConnectionFactory;
  XAMAuthorizationProvider *authorizationProvider;
  objc_super v13;

  v6 = (XAMAuthorizationProvider *)a4;
  v13.receiver = self;
  v13.super_class = (Class)XAMWriter;
  v7 = a3;
  v8 = -[XAMWriter init](&v13, sel_init);
  v9 = objc_msgSend(v7, "copy", v13.receiver, v13.super_class);

  writerConnectionFactory = v8->_writerConnectionFactory;
  v8->_writerConnectionFactory = (id)v9;

  authorizationProvider = v8->_authorizationProvider;
  v8->_authorizationProvider = v6;

  return v8;
}

- (void)disableAutomationModeWithCompletion:(id)a3
{
  -[XAMWriter _setAutomationModeEnabled:withCompletion:](self, "_setAutomationModeEnabled:withCompletion:", 0, a3);
}

- (void)enableAutomationModeWithCompletion:(id)a3
{
  -[XAMWriter _setAutomationModeEnabled:withCompletion:](self, "_setAutomationModeEnabled:withCompletion:", 1, a3);
}

- (void)_setAutomationModeEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  (*((void (**)(void))self->_writerConnectionFactory + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke;
  v21[3] = &unk_24F8691A0;
  v10 = v7;
  v22 = v10;
  v11 = v6;
  v23 = v11;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14;
  v19[3] = &unk_24F8691C8;
  v12 = (id)MEMORY[0x22E30EED0](v21);
  v20 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_15;
    v17[3] = &unk_24F8691C8;
    v14 = &v18;
    v18 = v12;
    -[XAMWriter _enableAutomationModeWithProxy:completion:](self, "_enableAutomationModeWithProxy:completion:", v13, v17);
  }
  else
  {
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_2;
    v15[3] = &unk_24F8691C8;
    v14 = &v16;
    v16 = v12;
    objc_msgSend(v13, "disableAutomationModeWithCompletion:", v15);
  }

}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enableAutomationModeWithProxy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending enable request to writer daemon.", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke;
  v11[3] = &unk_24F8691F0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v10, "enableAutomationModeWithCompletion:", v11);

}

void __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void (*v8)(void);
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    XAMLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22D1E0000, v7, OS_LOG_TYPE_DEFAULT, "Writer daemon returned success (no error).", v10, 2u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_12;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.dt.AutomationMode.writer.error")))
  {

    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 1)
  {
LABEL_9:
    XAMLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "_authenticateAndEnableAutomationModeWithProxy:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_13:

}

- (void)_authenticateAndEnableAutomationModeWithProxy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Writer daemon requires authentication to enable automation mode.", buf, 2u);
  }

  -[XAMWriter authorizationProvider](self, "authorizationProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__XAMWriter__authenticateAndEnableAutomationModeWithProxy_completion___block_invoke;
  v12[3] = &unk_24F869218;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "requestAuthorizationWithReply:", v12);

}

uint64_t __70__XAMWriter__authenticateAndEnableAutomationModeWithProxy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_enableAutomationModeWithProxy:authorization:completion:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_enableAutomationModeWithProxy:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  v9 = a3;
  XAMLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D1E0000, v10, OS_LOG_TYPE_DEFAULT, "User authenticated, forwarding authorization to writer daemon.", buf, 2u);
  }

  objc_msgSend(v7, "externalizedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__XAMWriter__enableAutomationModeWithProxy_authorization_completion___block_invoke;
  v14[3] = &unk_24F8691A0;
  v15 = v7;
  v16 = v8;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v9, "enableAutomationModeWithAuthorization:completion:", v11, v14);

}

void __69__XAMWriter__enableAutomationModeWithProxy_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Writer daemon finished, invalidating authorization.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_usingAsyncProxyEnablePasswordlessAutomation:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  (*((void (**)(void))self->_writerConnectionFactory + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke;
  v17[3] = &unk_24F8691A0;
  v10 = v7;
  v18 = v10;
  v19 = v6;
  v11 = v6;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke_17;
  v15[3] = &unk_24F8691C8;
  v12 = (id)MEMORY[0x22E30EED0](v17);
  v16 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
    objc_msgSend(v13, "createNoAuthenticationRequiredCookieWithCompletion:", v12);
  else
    objc_msgSend(v13, "removeNoAuthenticationRequiredCookieWithCompletion:", v12);

}

void __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
  -[XAMWriter _usingAsyncProxyEnablePasswordlessAutomation:withCompletion:](self, "_usingAsyncProxyEnablePasswordlessAutomation:withCompletion:", 1, a3);
}

- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
  -[XAMWriter _usingAsyncProxyEnablePasswordlessAutomation:withCompletion:](self, "_usingAsyncProxyEnablePasswordlessAutomation:withCompletion:", 0, a3);
}

- (BOOL)_usingSyncProxy:(id)a3 withError:(id *)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v15[5];
  uint8_t v16[4];
  void *v17;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a3;
  (*((void (**)(void))self->_writerConnectionFactory + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __39__XAMWriter__usingSyncProxy_withError___block_invoke;
  v15[3] = &unk_24F869240;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v12 = v11;

  XAMLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_22D1E0000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", v16, 0xCu);
  }

  objc_msgSend(v7, "invalidate");
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  _Block_object_dispose(&buf, 8);
  return v12 == 0;
}

void __39__XAMWriter__usingSyncProxy_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (BOOL)disableAutomationModeWithError:(id *)a3
{
  return -[XAMWriter _usingSyncProxy:withError:](self, "_usingSyncProxy:withError:", &__block_literal_global_19, a3);
}

id __44__XAMWriter_disableAutomationModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__XAMWriter_disableAutomationModeWithError___block_invoke_2;
  v5[3] = &unk_24F869240;
  v5[4] = &v6;
  objc_msgSend(v2, "disableAutomationModeWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__XAMWriter_disableAutomationModeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)enableAutomationModeWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke;
  v4[3] = &unk_24F8692A8;
  v4[4] = self;
  return -[XAMWriter _usingSyncProxy:withError:](self, "_usingSyncProxy:withError:", v4, a3);
}

id __43__XAMWriter_enableAutomationModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[8];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v4 = MEMORY[0x24BDAC760];
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke_2;
  v17[3] = &unk_24F869240;
  v17[4] = &v18;
  objc_msgSend(v3, "enableAutomationModeWithCompletion:", v17);
  v5 = (void *)v19[5];
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v5, "domain");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.dt.AutomationMode.writer.error")))
    goto LABEL_8;
  v7 = objc_msgSend((id)v19[5], "code");

  if (v7 != 1)
  {
LABEL_9:
    v6 = (id)v19[5];
    goto LABEL_10;
  }
  XAMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D1E0000, v8, OS_LOG_TYPE_DEFAULT, "Writer daemon requires authentication to enable automation mode.", buf, 2u);
  }

  v9 = (void *)v19[5];
  v19[5] = 0;

  objc_msgSend(*(id *)(a1 + 32), "authorizationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "authorizationWithError:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v11)
  {
    v12 = *(void **)(a1 + 32);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke_20;
    v14[3] = &unk_24F869240;
    v14[4] = &v18;
    objc_msgSend(v12, "_enableAutomationModeWithProxy:authorization:completion:", v3, v11, v14);

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __43__XAMWriter_enableAutomationModeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__XAMWriter_enableAutomationModeWithError___block_invoke_20(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)createNoAuthenticationRequiredCookieWithError:(id *)a3
{
  return -[XAMWriter _usingSyncProxy:withError:](self, "_usingSyncProxy:withError:", &__block_literal_global_21, a3);
}

id __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke_2;
  v5[3] = &unk_24F869240;
  v5[4] = &v6;
  objc_msgSend(v2, "createNoAuthenticationRequiredCookieWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeNoAuthenticationRequiredCookieWithError:(id *)a3
{
  return -[XAMWriter _usingSyncProxy:withError:](self, "_usingSyncProxy:withError:", &__block_literal_global_22, a3);
}

id __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke_2;
  v5[3] = &unk_24F869240;
  v5[4] = &v6;
  objc_msgSend(v2, "removeNoAuthenticationRequiredCookieWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)writerConnectionFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (XAMAuthorizationProvider)authorizationProvider
{
  return (XAMAuthorizationProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationProvider, 0);
  objc_storeStrong(&self->_writerConnectionFactory, 0);
}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D1E0000, v0, v1, "XPC Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D1E0000, v0, v1, "Writer returned error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
