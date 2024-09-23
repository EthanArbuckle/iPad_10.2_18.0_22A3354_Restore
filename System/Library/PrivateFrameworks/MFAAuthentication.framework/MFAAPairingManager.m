@implementation MFAAPairingManager

- (MFAAPairingManager)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
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
  MFAAPairingManager *v6;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  objc_super v11;

  init_logging();
  if (gLogObjects)
    v3 = gNumLogObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MFAATokenManager _init].cold.1((uint64_t)self, v5);

  v11.receiver = self;
  v11.super_class = (Class)MFAAPairingManager;
  v6 = -[MFAAPairingManager init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.MFAAuthentication.MFAANetwork"));
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5E040);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
  }
  return v6;
}

- (void)generatePairingTokenWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *, _QWORD))a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_212836000, v6, OS_LOG_TYPE_DEFAULT, "Generating pairing token...", (uint8_t *)v11, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v7, "getUUIDBytes:", v11);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v11, 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "length") <= 0x3F)
    objc_msgSend(v8, "increaseLengthBy:", 64 - objc_msgSend(v8, "length"));
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MFAAPairingManager generatePairingTokenWithCompletionHandler:].cold.1((uint64_t)v7, v8, v9);

  v3[2](v3, v8, 0);
}

- (void)addPairingWithToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "length");
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    v22 = v6;
    if (!v7)
      v12 = "NO";
    v23 = 2048;
    v24 = v11;
    v25 = 2080;
    v26 = v12;
    _os_log_impl(&dword_212836000, v10, OS_LOG_TYPE_DEFAULT, "Adding pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    -[MFAAPairingManager xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke;
    v19[3] = &unk_24CE34358;
    v15 = v7;
    v20 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke_33;
    v17[3] = &unk_24CE34358;
    v18 = v15;
    objc_msgSend(v16, "addPairingWithToken:withReply:", v6, v17);

  }
}

void __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

uint64_t __60__MFAAPairingManager_addPairingWithToken_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePairingWithToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "length");
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    v22 = v6;
    if (!v7)
      v12 = "NO";
    v23 = 2048;
    v24 = v11;
    v25 = 2080;
    v26 = v12;
    _os_log_impl(&dword_212836000, v10, OS_LOG_TYPE_DEFAULT, "Removing pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    -[MFAAPairingManager xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke;
    v19[3] = &unk_24CE34358;
    v15 = v7;
    v20 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke_34;
    v17[3] = &unk_24CE34358;
    v18 = v15;
    objc_msgSend(v16, "removePairingWithToken:withReply:", v6, v17);

  }
}

void __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

uint64_t __63__MFAAPairingManager_removePairingWithToken_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyPairingWithToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "length");
    v12 = "YES";
    *(_DWORD *)buf = 138478339;
    v22 = v6;
    if (!v7)
      v12 = "NO";
    v23 = 2048;
    v24 = v11;
    v25 = 2080;
    v26 = v12;
    _os_log_impl(&dword_212836000, v10, OS_LOG_TYPE_DEFAULT, "Verifying pairing with token... (pairingToken: %{private}@, pairingToken.length: %lu, completion: %s)", buf, 0x20u);
  }

  if (v7)
  {
    -[MFAAPairingManager xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke;
    v19[3] = &unk_24CE34358;
    v15 = v7;
    v20 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke_35;
    v17[3] = &unk_24CE34C38;
    v18 = v15;
    objc_msgSend(v16, "verifyPairingWithToken:withReply:", v6, v17);

  }
}

void __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

uint64_t __63__MFAAPairingManager_verifyPairingWithToken_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MFAAPairingManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1)
    dispatch_once(&sharedManager_once_0, block);
  return (id)sharedManager_sharedInstance_0;
}

void __35__MFAAPairingManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance_0;
  sharedManager_sharedInstance_0 = v1;

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

- (void)generatePairingTokenWithCompletionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 138478339;
  v5 = a1;
  v6 = 2113;
  v7 = a2;
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  _os_log_debug_impl(&dword_212836000, a3, OS_LOG_TYPE_DEBUG, "pairingToken: %{private}@, pairingTokenData: %{private}@, pairingTokenData.length: %lu", (uint8_t *)&v4, 0x20u);
}

@end
