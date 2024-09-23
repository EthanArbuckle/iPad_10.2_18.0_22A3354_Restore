@implementation SOServiceConnection

- (void)configurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__SOServiceConnection_configurationWithCompletion___block_invoke;
    v9[3] = &unk_1E8C5C400;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationWithCompletion:", v6);

  }
  else if (v4)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

- (BOOL)_connectToService
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  SOServiceConnection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SOServiceConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    SO_LOG_SOServiceConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SOServiceConnection _connectToService].cold.2();

    return 1;
  }
  -[SOServiceConnection _doConnectWithOptions:](self, "_doConnectWithOptions:", 4096);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOServiceConnection setXpcConnection:](self, "setXpcConnection:", v5);

  -[SOServiceConnection xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SOInternalProtocols interfaceWithInternalProtocol:](SOInternalProtocols, "interfaceWithInternalProtocol:", &unk_1EFB8FA98);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__SOServiceConnection__connectToService__block_invoke;
    v20[3] = &unk_1E8C5C448;
    objc_copyWeak(&v21, &location);
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInvalidationHandler:", v20);

    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __40__SOServiceConnection__connectToService__block_invoke_70;
    v18[3] = &unk_1E8C5C448;
    objc_copyWeak(&v19, &location);
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInterruptionHandler:", v18);

    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOServiceConnection queue](self, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setQueue:", v13);

    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    SO_LOG_SOServiceConnection();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1CF39B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", buf, 0xCu);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    return 1;
  }
  SO_LOG_SOServiceConnection();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SOServiceConnection _connectToService].cold.1();

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)_doConnectWithOptions:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.AppSSO.service-xpc"), a3);
}

- (SOServiceConnection)initWithQueue:(id)a3
{
  id v4;
  SOServiceConnection *v5;
  SOServiceConnection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOServiceConnection;
  v5 = -[SOServiceConnection init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SOServiceConnection setQueue:](v5, "setQueue:", v4);
    -[SOServiceConnection _connectToService](v6, "_connectToService");
  }

  return v6;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SOServiceConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SOServiceConnection;
  -[SOServiceConnection dealloc](&v4, sel_dealloc);
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a5;
  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
    v14[3] = &unk_1E8C5C400;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getAuthorizationHintsWithURL:responseCode:completion:", v8, a4, v11);

  }
  else if (v9)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);

  }
}

void __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SOServiceConnection_performAuthorizationWithRequestParameters_completion___block_invoke;
    v12[3] = &unk_1E8C5C400;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performAuthorizationWithRequestParameters:completion:", v6, v9);

  }
  else if (v7)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __76__SOServiceConnection_performAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__SOServiceConnection_beginAuthorizationWithRequestParameters_completion___block_invoke;
    v12[3] = &unk_1E8C5C400;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginAuthorizationWithRequestParameters:completion:", v6, v9);

  }
  else if (v7)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v11);

  }
}

void __74__SOServiceConnection_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelAuthorization:completion:", v9, v6);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
    goto LABEL_5;
  }
LABEL_6:

}

void __54__SOServiceConnection_cancelAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SO_LOG_SOServiceConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

}

void __51__SOServiceConnection_configurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)realmsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SOServiceConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOServiceConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[SOServiceConnection realmsWithCompletion:]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SOServiceConnection_realmsWithCompletion___block_invoke;
    v10[3] = &unk_1E8C5C400;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "realmsWithCompletion:", v7);

    v9 = v11;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __44__SOServiceConnection_realmsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)debugHintsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SOServiceConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOServiceConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[SOServiceConnection debugHintsWithCompletion:]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SOServiceConnection_debugHintsWithCompletion___block_invoke;
    v10[3] = &unk_1E8C5C400;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugHintsWithCompletion:", v7);

    v9 = v11;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __48__SOServiceConnection_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOServiceConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOServiceConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOServiceConnection finishAuthorization:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__SOServiceConnection_finishAuthorization_completion___block_invoke;
    v13[3] = &unk_1E8C5C400;
    v10 = v7;
    v14 = v10;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishAuthorization:completion:", v6, v10);

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

void __54__SOServiceConnection_finishAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _BYTE buf[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SO_LOG_SOServiceConnection();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOServiceConnection isExtensionProcessWithAuditToken:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SOServiceConnection_isExtensionProcessWithAuditToken_completion___block_invoke;
    v13[3] = &unk_1E8C5C400;
    v9 = v6;
    v14 = v9;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v11;
    objc_msgSend(v10, "isExtensionProcessWithAuditToken:completion:", buf, v9);

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v6)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

void __67__SOServiceConnection_isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOServiceConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOServiceConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOServiceConnection profilesWithExtensionBundleIdentifier:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (-[SOServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOServiceConnection xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__SOServiceConnection_profilesWithExtensionBundleIdentifier_completion___block_invoke;
    v13[3] = &unk_1E8C5C400;
    v10 = v7;
    v14 = v10;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "profilesWithExtensionBundleIdentifier:completion:", v6, v10);

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

void __72__SOServiceConnection_profilesWithExtensionBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __40__SOServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SO_LOG_SOServiceConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__SOServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __40__SOServiceConnection__connectToService__block_invoke_70(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v2, "setXpcConnection:", 0);
    SO_LOG_SOServiceConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__SOServiceConnection__connectToService__block_invoke_70_cold_1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_connectToService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CF39B000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__SOServiceConnection__connectToService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CF39B000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__SOServiceConnection__connectToService__block_invoke_70_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
