@implementation MFAATokenManager

- (MFAATokenManager)init
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
  MFAATokenManager *v6;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  objc_super v11;

  init_logging();
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
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
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MFAATokenManager _init].cold.1((uint64_t)self, v5);

  v11.receiver = self;
  v11.super_class = (Class)MFAATokenManager;
  v6 = -[MFAATokenManager init](&v11, sel_init);
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

- (void)requestMetadataForAuthToken:(id)a3 withUUID:(id)a4 requestedLocale:(id)a5 requestInfo:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 3;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v19 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  else
  {
    v19 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "Processing request for token metadata...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v20 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(v12, "length");
    objc_msgSend(v14, "localeIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    *(_DWORD *)buf = 138479107;
    v25 = "YES";
    v36 = 2048;
    v35 = v12;
    if (!v16)
      v25 = "NO";
    v37 = v22;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v23;
    v42 = 2113;
    v43 = v15;
    v44 = 2080;
    v45 = v25;
    _os_log_impl(&dword_212836000, v20, OS_LOG_TYPE_DEFAULT, "token: %{private}@, token.length: %lu, uuid: %@, requestedLocale: %@, requestInfo: %{private}@, completionHandler: %s", buf, 0x3Eu);

  }
  if (v16)
  {
    -[MFAATokenManager xpcConnection](self, "xpcConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke;
    v32[3] = &unk_24CE34358;
    v28 = v16;
    v33 = v28;
    objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    v30[1] = 3221225472;
    v30[2] = __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_31;
    v30[3] = &unk_24CE34380;
    v31 = v28;
    objc_msgSend(v29, "requestMetadataForToken:withUUID:requestedLocale:requestInfo:withReply:", v12, v13, v14, v15, v30);

  }
}

void __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
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
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, 0, v8);

}

uint64_t __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "Processing request for token activation...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v14 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "YES";
    *(_DWORD *)buf = 138478339;
    v26 = v8;
    if (!v10)
      v16 = "NO";
    v27 = 2112;
    v28 = v9;
    v29 = 2080;
    v30 = v16;
    _os_log_impl(&dword_212836000, v14, OS_LOG_TYPE_DEFAULT, "token: %{private}@, uuid: %@, completionHandler: %s", buf, 0x20u);
  }

  if (v10)
  {
    -[MFAATokenManager xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke;
    v23[3] = &unk_24CE34358;
    v19 = v10;
    v24 = v19;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke_33;
    v21[3] = &unk_24CE343A8;
    v22 = v19;
    objc_msgSend(v20, "requestActivationForToken:withUUID:withReply:", v8, v9, v21);

  }
}

void __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
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
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

uint64_t __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)confirmActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "Processing token confirmation...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v14 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "YES";
    *(_DWORD *)buf = 138478339;
    v26 = v8;
    if (!v10)
      v16 = "NO";
    v27 = 2112;
    v28 = v9;
    v29 = 2080;
    v30 = v16;
    _os_log_impl(&dword_212836000, v14, OS_LOG_TYPE_DEFAULT, "token: %{private}@, uuid: %@, completionHandler: %s", buf, 0x20u);
  }

  if (v10)
  {
    -[MFAATokenManager xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke;
    v23[3] = &unk_24CE34358;
    v19 = v10;
    v24 = v19;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke_35;
    v21[3] = &unk_24CE34358;
    v22 = v19;
    objc_msgSend(v20, "confirmActivationForToken:withUUID:withReply:", v8, v9, v21);

  }
}

void __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
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
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAATokenManagerErrorDomain"), -4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

uint64_t __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MFAATokenManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __33__MFAATokenManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v1;

}

+ (BOOL)isTokenValidForFeatures:(unint64_t)a3 token:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  const char *v15;
  _QWORD v17[6];
  _QWORD v18[2];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_retainAutorelease(v5);
    v18[0] = objc_msgSend(v6, "bytes");
    v18[1] = objc_msgSend(v6, "length");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke;
    v17[3] = &unk_24CE343F0;
    v17[4] = &v19;
    v17[5] = &v23;
    DERDecodeSequenceWithBlock((uint64_t)v18, (uint64_t)v17);
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = a3;
      _os_log_impl(&dword_212836000, v7, OS_LOG_TYPE_DEFAULT, "features: 0x%016lX", buf, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 3)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v20 + 24))
        v11 = "YES";
      else
        v11 = "NO";
      *(_DWORD *)buf = 136315138;
      v28 = (unint64_t)v11;
      _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "foundProductCapabilities: %s", buf, 0xCu);
    }

    if (*((_BYTE *)v20 + 24))
      v12 = (a3 & ~v24[3]) == 0;
    else
      v12 = a3 < 2;
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v13 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = "NO";
      if (v12)
        v15 = "YES";
      *(_DWORD *)buf = 136315138;
      v28 = (unint64_t)v15;
      _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "tokenValidForFeatures: %s", buf, 0xCu);
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

uint64_t __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke(uint64_t a1, _QWORD *a2)
{
  int v3;
  uint64_t result;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  _QWORD v19[4];
  __int128 v20;
  unint64_t v21;
  char *v22[4];
  int v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (*a2 != 0x2000000000000010)
    return 3;
  v23 = -1431655766;
  memset(v22, 170, sizeof(v22));
  v21 = 0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqContentInit(a2 + 1, (unint64_t *)&v22[2]))
    return 3;
  v3 = DERDecodeSeqNext((unint64_t *)&v22[2], &v21);
  result = 3;
  if (v3 || v21 != 2)
    return result;
  if (DERParseInteger(v22, &v23))
    return 3;
  if (v23 != 2)
    return 0;
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_cold_2(v5, v7, v8, v9, v10, v11, v12, v13);

  v14 = DERDecodeSeqNext((unint64_t *)&v22[2], &v21);
  result = 3;
  if (!v14 && v21 == 2)
  {
    if (!DERParseInteger(v22, &v23))
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v23;
        _os_log_impl(&dword_212836000, v15, OS_LOG_TYPE_INFO, "SMFiTokenPayload version: %u", buf, 8u);
      }

      if (v23 == 1)
      {
        v17 = DERDecodeSeqNext((unint64_t *)&v22[2], &v21);
        result = 3;
        if (!v17 && v21 == 4)
        {
          v18 = DERDecodeItem((uint64_t)v22, &v21);
          result = 3;
          if (!v18 && v21 == 0x2000000000000011)
          {
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_39;
            v19[3] = &unk_24CE343F0;
            v20 = *(_OWORD *)(a1 + 32);
            DERDecodeSequenceContentWithBlock((unint64_t *)v22, (uint64_t)v19);
            return 0;
          }
        }
        return result;
      }
    }
    return 3;
  }
  return result;
}

uint64_t __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_39(uint64_t a1, _QWORD *a2, _BYTE *a3)
{
  int v5;
  uint64_t result;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  id v18;
  int v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  char *v24[4];
  int v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (*a2 != 0x2000000000000010)
    return 3;
  v25 = -1431655766;
  memset(v24, 170, sizeof(v24));
  v23 = 0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqContentInit(a2 + 1, (unint64_t *)&v24[2]))
    return 3;
  v5 = DERDecodeSeqNext((unint64_t *)&v24[2], &v23);
  result = 3;
  if (v5 || v23 != 2)
    return result;
  if (DERParseInteger(v24, &v25))
    return 3;
  if (v25 != 202)
    return 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *a3 = 1;
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_39_cold_3(v7, v9, v10, v11, v12, v13, v14, v15);

  v16 = DERDecodeSeqNext((unint64_t *)&v24[2], &v23);
  result = 3;
  if (!v16 && v23 == 2)
  {
    if (!DERParseInteger(v24, &v25))
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v17 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v25;
        _os_log_impl(&dword_212836000, v17, OS_LOG_TYPE_INFO, "SMFiProductCapabilities version: %u", buf, 8u);
      }

      if (v25 == 1)
      {
        v19 = DERDecodeSeqNext((unint64_t *)&v24[2], &v23);
        result = 3;
        if (!v19 && v23 == 4 && v24[1] == (char *)8)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)v24[0];
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = bswap64(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                          + 24));
          if (gLogObjects && gNumLogObjects >= 3)
          {
            v20 = *(id *)(gLogObjects + 16);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAATokenManager _init].cold.2();
            v20 = MEMORY[0x24BDACB70];
            v21 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            *(_DWORD *)buf = 134217984;
            v27 = v22;
            _os_log_impl(&dword_212836000, v20, OS_LOG_TYPE_DEFAULT, "productCapabilities: 0x%016llX", buf, 0xCu);
          }

          return 0;
        }
        return result;
      }
    }
    return 3;
  }
  return result;
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
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212836000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_212836000, a1, a3, "Found SMFiTokenPayload!", a5, a6, a7, a8, 0);
}

void __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_39_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_212836000, a1, a3, "Found SMFiProductCapabilities!", a5, a6, a7, a8, 0);
}

@end
