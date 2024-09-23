@implementation ACCHWComponentAuth

- (ACCHWComponentAuth)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  BOOL v3;
  id v4;
  NSObject *v5;
  ACCHWComponentAuth *v6;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t v13[16];
  objc_super v14;

  init_logging();
  if (gLogObjects)
    v3 = gNumLogObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACCHWComponentAuth _init].cold.2((uint64_t)self, v5);

  v14.receiver = self;
  v14.super_class = (Class)ACCHWComponentAuth;
  v6 = -[ACCHWComponentAuth init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.ACCHWComponentAuthService"));
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4C1B0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "resumed XPC connection", v13, 2u);
    }

  }
  return v6;
}

- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (!v7)
      v11 = "NO";
    *(_DWORD *)buf = 136315138;
    v19 = v11;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E5FB4270;
  v16 = v6;
  v17 = v7;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(v12, block);

}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23;
  v6[3] = &unk_1E5FB4248;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "authenticateBatteryWithChallenge:completionHandler:", v5, v6);

}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (gLogObjects)
    v13 = gNumLogObjects < 4;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v15 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    v20 = 1024;
    v21 = a5;
    v22 = 1024;
    v23 = a6;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4
{
  -[ACCHWComponentAuth authenticateTouchControllerWithChallenge:completionHandler:updateRegistry:](self, "authenticateTouchControllerWithChallenge:completionHandler:updateRegistry:", a3, a4, 0);
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 4;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "YES";
    if (!v9)
      v13 = "NO";
    *(_DWORD *)buf = 136315138;
    v22 = v13;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "Authenticating touch controller... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke;
  v17[3] = &unk_1E5FB4298;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = a5;
  v15 = v8;
  v16 = v9;
  dispatch_sync(v14, v17);

}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_26;
  v6[3] = &unk_1E5FB4248;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "authenticateTouchControllerWithChallenge:completionHandler:updateRegistry:", v5, v6, *(unsigned __int8 *)(a1 + 56));

}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__ACCHWComponentAuth_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_26(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (gLogObjects)
    v13 = gNumLogObjects < 4;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v15 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    v20 = 1024;
    v21 = a5;
    v22 = 1024;
    v23 = a6;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_INFO, "touch authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (!v7)
      v11 = "NO";
    *(_DWORD *)buf = 136315138;
    v19 = v11;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E5FB4270;
  v16 = v6;
  v17 = v7;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(v12, block);

}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_27;
  v6[3] = &unk_1E5FB4248;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "authenticateVeridianWithChallenge:completionHandler:", v5, v6);

}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler___block_invoke_27(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (gLogObjects)
    v13 = gNumLogObjects < 4;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v15 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    v20 = 1024;
    v21 = a5;
    v22 = 1024;
    v23 = a6;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7
{
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (gLogObjects)
    v14 = gNumLogObjects < 4;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v16 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  else
  {
    v16 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "YES";
    if (!v13)
      v17 = "NO";
    *(_DWORD *)buf = 136315138;
    v28 = v17;
    _os_log_impl(&dword_1AF649000, v16, OS_LOG_TYPE_DEFAULT, "Authenticating battery... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke;
  v21[3] = &unk_1E5FB42C0;
  v22 = v12;
  v23 = v13;
  v21[4] = self;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v19 = v12;
  v20 = v13;
  dispatch_sync(v18, v21);

}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_28;
  v6[3] = &unk_1E5FB4248;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "authenticateVeridianWithChallenge:completionHandler:updateRegistry:updateUIProperty:logToAnalytics:", v5, v6, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58));

}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__ACCHWComponentAuth_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_28(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (gLogObjects)
    v13 = gNumLogObjects < 4;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v15 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109632;
    v19[1] = a2;
    v20 = 1024;
    v21 = a5;
    v22 = 1024;
    v23 = a6;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_INFO, "battery authPassed = %d, fdrValidationStatus %d, authError %d", (uint8_t *)v19, 0x14u);
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, id, uint64_t, uint64_t))(v16 + 16))(v16, a2, v11, v12, a5, a6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (!v7)
      v11 = "NO";
    *(_DWORD *)buf = 136315138;
    v19 = v11;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Signing battery challenge... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E5FB4270;
  v16 = v6;
  v17 = v7;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(v12, block);

}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_29;
  v6[3] = &unk_1E5FB42E8;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "signVeridianChallenge:completionHandler:", v5, v6);

}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ACCHWComponentAuth_signVeridianChallenge_completionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 4;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109120;
    v15[1] = a4;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_INFO, "signed battery challenge authError %d", (uint8_t *)v15, 8u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (!v7)
      v11 = "NO";
    *(_DWORD *)buf = 136315138;
    v19 = v11;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Verifying battery match... (completionHandler: %s)", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke;
  block[3] = &unk_1E5FB4270;
  v16 = v6;
  v17 = v7;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(v12, block);

}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5FB3690;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_31;
  v6[3] = &unk_1E5FB4310;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "verifyBatteryMatch:completionHandler:", v5, v6);

}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__ACCHWComponentAuth_verifyBatteryMatch_completionHandler___block_invoke_31(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "battery match verification authError %d", (uint8_t *)v10, 8u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1();

  }
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ACCHWComponentAuth_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_1 != -1)
    dispatch_once(&sharedManager_once_1, block);
  return (id)sharedManager_sharedInstance_1;
}

void __35__ACCHWComponentAuth_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance_1;
  sharedManager_sharedInstance_1 = v1;

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)_init
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1AF649000, a2, OS_LOG_TYPE_DEBUG, "Initializing %@...", v5, 0xCu);

}

void __73__ACCHWComponentAuth_authenticateBatteryWithChallenge_completionHandler___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_1(&dword_1AF649000, v0, v1, "no completion handler!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end
