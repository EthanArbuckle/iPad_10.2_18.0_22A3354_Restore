@implementation DIVClient

- (DIVClient)init
{
  DIVClient *v2;
  DIVClient *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  NSXPCConnection *serverConnection;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id buf;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)DIVClient;
  v2 = -[DIVClient init](&v40, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_isDisconnected = 0;
    DIV_LOG_SIGNPOST();
    v4 = objc_claimAutoreleasedReturnValue();
    DIV_LOG_SIGNPOST();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, v3);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_20A10F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sessionLifetime", ", (uint8_t *)&buf, 2u);
    }

    DIV_LOG_SIGNPOST();
    v7 = objc_claimAutoreleasedReturnValue();
    DIV_LOG_SIGNPOST();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, v3);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_20A10F000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "initThroughShare", ", (uint8_t *)&buf, 2u);
    }

    DIV_LOG_CLIENT_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[DIVClient init].cold.1(v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.coreidvd.proofing"), 4096);
    serverConnection = v3->_serverConnection;
    v3->_serverConnection = (NSXPCConnection *)v11;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FA930);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_serverConnection, "setRemoteObjectInterface:", v13);

    v36 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v34 = objc_opt_class();
    v33 = objc_opt_class();
    v32 = objc_opt_class();
    v31 = objc_opt_class();
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v28 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v32, v31, v30, v29, v28, v14, v15, v16, v17, v18, v19, v20, v21, v22,
      objc_opt_class(),
      0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v3->_serverConnection, "remoteObjectInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_performVerificationWithAttributes_completion_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSXPCConnection remoteObjectInterface](v3->_serverConnection, "remoteObjectInterface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_shareVerificationResultWithOptions_completion_, 0, 1);

    objc_initWeak(&buf, v3);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __17__DIVClient_init__block_invoke;
    v37[3] = &unk_24C2D2850;
    objc_copyWeak(&v38, &buf);
    -[NSXPCConnection setInterruptionHandler:](v3->_serverConnection, "setInterruptionHandler:", v37);
    -[NSXPCConnection activate](v3->_serverConnection, "activate");
    objc_destroyWeak(&v38);
    objc_destroyWeak(&buf);

  }
  return v3;
}

void __17__DIVClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  DIV_LOG_CLIENT_1();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __17__DIVClient_init__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setIsDisconnected:", 1);

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  objc_super v6;
  uint8_t buf[16];

  -[DIVClient invalidate](self, "invalidate");
  DIV_LOG_SIGNPOST();
  v3 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v3, OS_SIGNPOST_INTERVAL_END, v5, "sessionLifetime", ", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)DIVClient;
  -[DIVClient dealloc](&v6, sel_dealloc);
}

- (void)configure:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  DIV_LOG_SIGNPOST();
  v8 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "configure", ", buf, 2u);
  }

  if (v6
    && (objc_msgSend(v6, "serviceName"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    -[DIVClient setContext:](self, "setContext:", v6);
    DIV_LOG_CLIENT_1();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[DIVClient configure:completion:].cold.2(self, v12);

    if (!-[DIVClient isDisconnected](self, "isDisconnected"))
    {
      v15 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__DIVClient_configure_completion___block_invoke;
      aBlock[3] = &unk_24C2D2878;
      aBlock[4] = self;
      v21 = v7;
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __34__DIVClient_configure_completion___block_invoke_84;
      v18[3] = &unk_24C2D27A8;
      v19 = _Block_copy(aBlock);
      v16 = v19;
      -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "configure:completion:", v6, v16);

      goto LABEL_14;
    }
    -[DIVClient createDaemonDisconnectedError](self, "createDaemonDisconnectedError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIVError"), -2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DIV_LOG_CLIENT_1();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DIVClient configure:completion:].cold.1();

  }
  (*((void (**)(id, void *))v7 + 2))(v7, v13);

LABEL_14:
}

void __34__DIVClient_configure_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  DIV_LOG_SIGNPOST();
  v4 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v4, OS_SIGNPOST_INTERVAL_END, v6, "configure", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__DIVClient_configure_completion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  DIV_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DIVClient performVerificationWithAttributes:completion:].cold.1();

  DIV_LOG_SIGNPOST();
  v9 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "performVerificationWithAttributes", ", buf, 2u);
  }

  if (-[DIVClient isDisconnected](self, "isDisconnected"))
  {
    -[DIVClient createDaemonDisconnectedError](self, "createDaemonDisconnectedError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v12);

  }
  else
  {
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__DIVClient_performVerificationWithAttributes_completion___block_invoke;
    aBlock[3] = &unk_24C2D28A0;
    aBlock[4] = self;
    v19 = v7;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __58__DIVClient_performVerificationWithAttributes_completion___block_invoke_86;
    v16[3] = &unk_24C2D27A8;
    v17 = _Block_copy(aBlock);
    v14 = v17;
    -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performVerificationWithAttributes:completion:", v6, v14);

  }
}

void __58__DIVClient_performVerificationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a2;
  DIV_LOG_SIGNPOST();
  v8 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v8, OS_SIGNPOST_INTERVAL_END, v10, "performVerificationWithAttributes", ", v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58__DIVClient_performVerificationWithAttributes_completion___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  void (**v19)(id, _QWORD, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  DIV_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DIVClient shareVerificationResultWithOptions:completion:].cold.1();

  DIV_LOG_SIGNPOST();
  v9 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "shareVerificationResultWithOptions", ", buf, 2u);
  }

  if (-[DIVClient isDisconnected](self, "isDisconnected"))
  {
    -[DIVClient createDaemonDisconnectedError](self, "createDaemonDisconnectedError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);

  }
  else
  {
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke;
    aBlock[3] = &unk_24C2D28C8;
    aBlock[4] = self;
    v19 = v7;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke_88;
    v16[3] = &unk_24C2D27A8;
    v17 = _Block_copy(aBlock);
    v14 = v17;
    -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shareVerificationResultWithOptions:completion:", v6, v14);

  }
}

void __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  DIV_LOG_SIGNPOST();
  v7 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v7, OS_SIGNPOST_INTERVAL_END, v9, "shareVerificationResultWithOptions", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  void (**v19)(id, _QWORD, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  DIV_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DIVClient getVerificationResultWithOptions:completion:].cold.1();

  DIV_LOG_SIGNPOST();
  v9 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "getVerificationResultWithOptions", ", buf, 2u);
  }

  if (-[DIVClient isDisconnected](self, "isDisconnected"))
  {
    -[DIVClient createDaemonDisconnectedError](self, "createDaemonDisconnectedError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);

  }
  else
  {
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke;
    aBlock[3] = &unk_24C2D28F0;
    aBlock[4] = self;
    v19 = v7;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke_90;
    v16[3] = &unk_24C2D27A8;
    v17 = _Block_copy(aBlock);
    v14 = v17;
    -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getVerificationResultWithOptions:completion:", v6, v14);

  }
}

void __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  DIV_LOG_SIGNPOST();
  v7 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v7, OS_SIGNPOST_INTERVAL_END, v9, "getVerificationResultWithOptions", ", buf, 2u);
  }

  DIV_LOG_SIGNPOST();
  v10 = objc_claimAutoreleasedReturnValue();
  DIV_LOG_SIGNPOST();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A10F000, v10, OS_SIGNPOST_INTERVAL_END, v12, "initThroughShare", ", v14, 2u);
  }

  if (v5)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v5);

  }
  else
  {
    v13 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "invalidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)concludeVerification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!-[DIVClient isDisconnected](self, "isDisconnected"))
  {
    DIV_LOG_CLIENT_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[DIVClient concludeVerification:].cold.1();

    -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "concludeVerification:", v4);

  }
}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  DIV_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DIVClient confirmVerificationCompletedWithFeedback:].cold.2();

  if (-[DIVClient isDisconnected](self, "isDisconnected"))
  {
    DIV_LOG_CLIENT_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DIVClient confirmVerificationCompletedWithFeedback:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFinishDate:", v7);

    -[DIVClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject confirmVerificationCompletedWithFeedback:](v6, "confirmVerificationCompletedWithFeedback:", v4);
  }

}

- (id)serverConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serverConnection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)context
{
  os_unfair_lock_s *p_lock;
  DIVerificationSessionContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setContext:(id)a3
{
  DIVerificationSessionContext *v4;
  DIVerificationSessionContext *context;

  v4 = (DIVerificationSessionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isDisconnected
{
  DIVClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDisconnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsDisconnected:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isDisconnected = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)createDaemonDisconnectedError
{
  NSObject *v2;

  DIV_LOG_CLIENT_1();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DIVClient createDaemonDisconnectedError].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIVError"), -19, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DIVClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24C2D27F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DIV_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "createDaemonDisconnectedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)init
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 138543618;
  v2 = CFSTR("com.apple.coreidvd.proofing");
  v3 = 1024;
  v4 = 4096;
  _os_log_debug_impl(&dword_20A10F000, log, OS_LOG_TYPE_DEBUG, "connecting to %{public}@ (%x)", (uint8_t *)&v1, 0x12u);
}

void __17__DIVClient_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "Connection with daemon interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configure:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "configure failed due to empty service name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configure:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_20A10F000, a2, OS_LOG_TYPE_DEBUG, "configure with context -> service name:%{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)performVerificationWithAttributes:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "performVerificationWithAttributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shareVerificationResultWithOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "shareVerificationResultWithOptions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getVerificationResultWithOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "getVerificationResultWithOptions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)concludeVerification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "concludeVerification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)confirmVerificationCompletedWithFeedback:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_20A10F000, v0, OS_LOG_TYPE_ERROR, "confirmVerificationCompletedWithFeedback connection was disconnected", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)confirmVerificationCompletedWithFeedback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "confirmVerificationCompletedWithFeedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createDaemonDisconnectedError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "Daemon has disconnected; caller must create new session",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

void __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20A10F000, a2, OS_LOG_TYPE_ERROR, "DIVClient remote object proxy error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
