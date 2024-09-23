@implementation ASTMaterializedConnectionManager

- (ASTMaterializedConnectionManager)initWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  ASTMaterializedConnectionManager *v8;
  ASTNetworking *v9;
  ASTNetworking *networking;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTMaterializedConnectionManager;
  v8 = -[ASTMaterializedConnectionManager init](&v12, sel_init);
  if (v8)
  {
    v9 = -[ASTNetworking initWithSOCKSProxyServer:port:]([ASTNetworking alloc], "initWithSOCKSProxyServer:port:", v6, v7);
    networking = v8->_networking;
    v8->_networking = v9;

  }
  return v8;
}

- (ASTMaterializedConnectionManager)init
{
  return -[ASTMaterializedConnectionManager initWithSOCKSProxyServer:port:](self, "initWithSOCKSProxyServer:port:", 0, 0);
}

- (void)postSessionStatusForIdentities:(id)a3 ticket:(id)a4 timeout:(double)a5 allowsCellularAccess:(BOOL)a6 requestQueuedSuiteInfo:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  ASTConnectionSession *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v9 = a7;
  v10 = a6;
  v28 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  ASTLogHandleForCategory(1);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_22D91B000, v17, OS_LOG_TYPE_DEFAULT, "[Session] > Identities: %@, Ticket: %@", buf, 0x16u);
  }

  v18 = -[ASTConnectionSession initWithIdentities:ticket:requestQueuedSuiteInfo:]([ASTConnectionSession alloc], "initWithIdentities:ticket:requestQueuedSuiteInfo:", v14, v15, v9);
  -[ASTMaterializedConnection setTimeout:](v18, "setTimeout:", a5);
  objc_msgSend(v14, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v18, "setIdentity:", v19);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v18, "setAllowsCellularAccess:", v10);
  -[ASTMaterializedConnection setDelegate:](v18, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v18, "setRetryOnNetworkDisconnected:", 0);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke;
  v22[3] = &unk_24F96A020;
  v23 = v16;
  v20 = v16;
  -[ASTMaterializedConnection setDidReceiveResponse:](v18, "setDidReceiveResponse:", v22);
  -[ASTMaterializedConnectionManager networking](self, "networking");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConnection:", v18);

}

void __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[Session] < Session Successful", (uint8_t *)&v31, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke_cold_1();
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("diagsChannel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("diagsChannel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("diagsChannel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guided"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guided"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guided"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "BOOLValue");

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queuedSuiteType"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queuedSuiteType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queuedSuiteType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("None")) & 1) == 0)
        objc_msgSend(v24, "isEqualToString:", CFSTR("Logging"));

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetURL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetURL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = objc_opt_isKindOfClass();

    if ((v27 & 1) != 0)
    {
      v28 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetURL"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLWithString:", v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
  }
  ASTLogHandleForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412290;
    v32 = v9;
    _os_log_impl(&dword_22D91B000, v30, OS_LOG_TYPE_DEFAULT, "[Session] Received diags channel: %@", (uint8_t *)&v31, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadAsset:(id)a3 customServerURL:(id)a4 customEndpoint:(id)a5 destinationFileHandle:(id)a6 allowsCellularAccess:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  ASTConnectionAsset *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v9 = a7;
  v34 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  ASTLogHandleForCategory(1);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v14;
    _os_log_impl(&dword_22D91B000, v19, OS_LOG_TYPE_DEFAULT, "[Asset] > %@", buf, 0xCu);
  }

  v20 = -[ASTConnectionAsset initWithCustomServerURL:customEndpoint:assetName:destinationFileHandle:]([ASTConnectionAsset alloc], "initWithCustomServerURL:customEndpoint:assetName:destinationFileHandle:", v18, v17, v14, v16);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v20, "setIdentity:", v21);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v20, "setSessionId:", v22);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v20, "setAllowsCellularAccess:", v9);
  -[ASTMaterializedConnection setDelegate:](v20, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v20, "setRetryOnNetworkDisconnected:", 1);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __135__ASTMaterializedConnectionManager_downloadAsset_customServerURL_customEndpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke;
  v29 = &unk_24F96A048;
  v30 = v14;
  v31 = v15;
  v23 = v15;
  v24 = v14;
  -[ASTMaterializedConnection setDidReceiveResponse:](v20, "setDidReceiveResponse:", &v26);
  -[ASTMaterializedConnectionManager networking](self, "networking", v26, v27, v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConnection:", v20);

}

void __135__ASTMaterializedConnectionManager_downloadAsset_customServerURL_customEndpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[Asset] < %@ Download Successful", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __135__ASTMaterializedConnectionManager_downloadAsset_customServerURL_customEndpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)postEnrollAllowingCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  dispatch_semaphore_t v7;
  ASTConnectionEnroll *v8;
  void *v9;
  ASTConnectionEnroll *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  NSObject *v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTMaterializedConnectionManager identity](self, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[Enroll] > Identity: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = [ASTConnectionEnroll alloc];
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASTConnectionEnroll initWithIdentity:](v8, "initWithIdentity:", v9);

  -[ASTMaterializedConnectionManager identity](self, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v10, "setIdentity:", v11);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v10, "setAllowsCellularAccess:", v3);
  -[ASTMaterializedConnection setDelegate:](v10, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v10, "setRetryOnNetworkDisconnected:", 1);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke;
  v16[3] = &unk_24F96A070;
  p_buf = &buf;
  v16[4] = self;
  v12 = v7;
  v17 = v12;
  -[ASTMaterializedConnection setDidReceiveResponse:](v10, "setDidReceiveResponse:", v16);
  -[ASTMaterializedConnectionManager networking](self, "networking");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConnection:", v10);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  -[ASTMaterializedConnectionManager setSessionId:](self, "setSessionId:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

void __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionId")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionId"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    ASTLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke_cold_1();

  }
  ASTLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_22D91B000, v12, OS_LOG_TYPE_DEFAULT, "[Enroll] < Identity: %@, Session: %@", (uint8_t *)&v15, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)postAuthInfo:(id)a3 allowsCellularAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  ASTConnectionAuthInfo *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  NSObject *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[AuthInfo] > Auth info: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v23 = 1;
  v8 = dispatch_semaphore_create(0);
  v9 = -[ASTConnectionAuthInfo initWithAuthInfo:]([ASTConnectionAuthInfo alloc], "initWithAuthInfo:", v6);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v9, "setIdentity:", v10);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v9, "setSessionId:", v11);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v9, "setAllowsCellularAccess:", v4);
  -[ASTMaterializedConnection setDelegate:](v9, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v9, "setRetryOnNetworkDisconnected:", 1);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke;
  v18 = &unk_24F96A098;
  p_buf = &buf;
  v12 = v8;
  v19 = v12;
  -[ASTMaterializedConnection setDidReceiveResponse:](v9, "setDidReceiveResponse:", &v15);
  -[ASTMaterializedConnectionManager networking](self, "networking", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConnection:", v9);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v13) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return (char)v13;
}

void __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[AuthInfo] < Auth Info Successful", v8, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)postProfile:(id)a3 allowsCellularAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  ASTConnectionProfile *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  NSObject *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[Profile] > Profile: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v23 = 1;
  v8 = dispatch_semaphore_create(0);
  v9 = -[ASTConnectionProfile initWithProfile:]([ASTConnectionProfile alloc], "initWithProfile:", v6);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v9, "setIdentity:", v10);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v9, "setSessionId:", v11);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v9, "setAllowsCellularAccess:", v4);
  -[ASTMaterializedConnection setDelegate:](v9, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v9, "setRetryOnNetworkDisconnected:", 1);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke;
  v18 = &unk_24F96A098;
  p_buf = &buf;
  v12 = v8;
  v19 = v12;
  -[ASTMaterializedConnection setDidReceiveResponse:](v9, "setDidReceiveResponse:", &v15);
  -[ASTMaterializedConnectionManager networking](self, "networking", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConnection:", v9);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v13) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return (char)v13;
}

void __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[Profile] < Profile Successful", v8, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)postRequest:(id)a3 allowsCellularAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  ASTConnectionClientStatus *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[Status] > %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = -[ASTConnectionClientStatus initWithClientStatus:]([ASTConnectionClientStatus alloc], "initWithClientStatus:", v6);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v9, "setIdentity:", v10);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v9, "setSessionId:", v11);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v9, "setAllowsCellularAccess:", v4);
  -[ASTMaterializedConnection setDelegate:](v9, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v9, "setRetryOnNetworkDisconnected:", objc_msgSend(v6, "clientStatus") != 9);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke;
  v17[3] = &unk_24F96A070;
  p_buf = &buf;
  v12 = v8;
  v18 = v12;
  v13 = v6;
  v19 = v13;
  -[ASTMaterializedConnection setDidReceiveResponse:](v9, "setDidReceiveResponse:", v17);
  -[ASTMaterializedConnectionManager networking](self, "networking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConnection:", v9);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v15 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v15;
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "Response: %@, error: %@", (uint8_t *)&v17, 0x16u);
    }

    +[ASTResponse responseWithDictionary:](ASTResponse, "responseWithDictionary:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    ASTLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[Status] < %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "completion");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();

  }
}

- (void)postTestResult:(id)a3 allowsCellularAccess:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  ASTConnectionTestResult *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  ASTLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_22D91B000, v10, OS_LOG_TYPE_DEFAULT, "[Test Results] > Results: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x2020000000;
  v24 = 1;
  v11 = -[ASTConnectionTestResult initWithTestResults:]([ASTConnectionTestResult alloc], "initWithTestResults:", v8);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v11, "setIdentity:", v12);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v11, "setSessionId:", v13);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v11, "setAllowsCellularAccess:", v6);
  -[ASTMaterializedConnection setDelegate:](v11, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v11, "setRetryOnNetworkDisconnected:", 1);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke;
  v19 = &unk_24F96A0C0;
  p_buf = &buf;
  v14 = v9;
  v20 = v14;
  -[ASTMaterializedConnection setDidReceiveResponse:](v11, "setDidReceiveResponse:", &v16);
  -[ASTMaterializedConnectionManager networking](self, "networking", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConnection:", v11);

  _Block_object_dispose(&buf, 8);
}

void __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[Test Results] < Test Results Successful", v8, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)postSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7 allowsCellularAccess:(BOOL)a8 completion:(id)a9
{
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  ASTConnectionTestResultBinary *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _BOOL4 v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v34 = a8;
  v43 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v35 = a9;
  v15 = (void *)MEMORY[0x24BDD1580];
  v33 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v15, "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributesOfItemAtPath:error:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "fileSize");

  ASTLogHandleForCategory(1);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "fileURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v26;
    v41 = 2048;
    v42 = v23;
    _os_log_impl(&dword_22D91B000, v24, OS_LOG_TYPE_DEFAULT, "[File Upload] > File: %@, File Size: %llu bytes", buf, 0x16u);

  }
  v27 = -[ASTConnectionTestResultBinary initWithSealableFile:fileSequence:totalFiles:testId:dataId:]([ASTConnectionTestResultBinary alloc], "initWithSealableFile:fileSequence:totalFiles:testId:dataId:", v14, v18, v17, v16, v33);

  -[ASTMaterializedConnectionManager identity](self, "identity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v27, "setIdentity:", v28);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v27, "setSessionId:", v29);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v27, "setAllowsCellularAccess:", v34);
  -[ASTMaterializedConnection setDelegate:](v27, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v27, "setRetryOnNetworkDisconnected:", 1);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke;
  v36[3] = &unk_24F96A048;
  v37 = v14;
  v38 = v35;
  v30 = v35;
  v31 = v14;
  -[ASTMaterializedConnection setDidReceiveResponse:](v27, "setDidReceiveResponse:", v36);
  -[ASTMaterializedConnectionManager networking](self, "networking");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addConnection:", v27);

}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  ASTLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[File Upload] < File Upload Successful", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_2(a1, (uint64_t)v6, v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  v10 = (id *)(a1 + 32);
  objc_msgSend(v11, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13 = objc_msgSend(v9, "removeItemAtURL:error:", v12, &v16);
  v14 = v16;

  if ((v13 & 1) == 0)
  {
    ASTLogHandleForCategory(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_1(v10, (uint64_t)v14, v15);

  }
}

- (void)cancelAllTestResults
{
  void *v3;
  id v4;

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelConnectionsOfClass:", objc_opt_class());

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelConnectionsOfClass:", objc_opt_class());

}

- (void)requestSessionArchiveWithSessionID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  ASTConnectionArchiveSelfServiceSession *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  dispatch_time_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  dispatch_semaphore_t v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v6 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  ASTLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[ASTMaterializedConnectionManager requestSessionArchiveWithSessionID:withPayloadSigner:allowsCellularAccess:c"
          "ompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  v14 = dispatch_semaphore_create(0);
  v15 = objc_alloc_init(ASTConnectionArchiveSelfServiceSession);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v15, "setIdentity:", v16);

  -[ASTConnectionArchiveSelfServiceSession setSessionId:](v15, "setSessionId:", v12);
  -[ASTMaterializedConnection setAllowsCellularAccess:](v15, "setAllowsCellularAccess:", v6);
  -[ASTMaterializedConnection setDelegate:](v15, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v15, "setRetryOnNetworkDisconnected:", 1);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  v24 = &unk_24F96A0E8;
  v25 = v14;
  v26 = v10;
  v17 = v14;
  v18 = v10;
  -[ASTMaterializedConnection setDidReceiveResponse:](v15, "setDidReceiveResponse:", &v21);
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v15, "signBodyWithPayloadSigner:", v11, v21, v22, v23, v24);

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConnection:", v15);

  v20 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v17, v20);

}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    ASTLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();

    v10 = *(_QWORD *)(a1 + 40);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = -7000;
    goto LABEL_10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("archived"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    ASTLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2();

    v10 = *(_QWORD *)(a1 + 40);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = -1008;
LABEL_10:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v14);

    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)requestSelfServiceSuitesAvailableWithConfigCode:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  ASTConnectionRetrieveSelfServiceSuites *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  ASTLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ASTMaterializedConnectionManager requestSelfServiceSuitesAvailableWithConfigCode:withPayloadSigner:allowsCel"
          "lularAccess:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v11, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  v12 = -[ASTConnectionRetrieveSelfServiceSuites initWithConfigCode:]([ASTConnectionRetrieveSelfServiceSuites alloc], "initWithConfigCode:", v9);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v12, "setIdentity:", v13);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v12, "setSessionId:", v14);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v12, "setAllowsCellularAccess:", v7);
  -[ASTMaterializedConnection setDelegate:](v12, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v12, "setRetryOnNetworkDisconnected:", 1);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  v21 = &unk_24F96A048;
  v22 = v9;
  v23 = v10;
  v15 = v10;
  v16 = v9;
  -[ASTMaterializedConnection setDidReceiveResponse:](v12, "setDidReceiveResponse:", &v18);
  -[ASTMaterializedConnectionManager networking](self, "networking", v18, v19, v20, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConnection:", v12);

}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suites"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayDroppingNSNullValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_59;
    v14[3] = &unk_24F96A110;
    v15 = v7;
    v10 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    ASTLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();

    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ASTSuite *v8;
  void *v9;
  void *v10;
  ASTSuite *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("description"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timeEstimateStr"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("assets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [ASTSuite alloc];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("primary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ASTSuite initWithId:suiteNameLocalizedString:suiteDescriptionLocalizedString:estimatedCompletionTimeLocalizedString:primaryAssetLocator:secondaryAssetLocator:](v8, "initWithId:suiteNameLocalizedString:suiteDescriptionLocalizedString:estimatedCompletionTimeLocalizedString:primaryAssetLocator:secondaryAssetLocator:", v3, v4, v5, v6, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  }

}

- (void)postSelectSelfServiceSuite:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  ASTConnectionSelectSelfServiceSuite *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  ASTMaterializedConnectionManager *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a4;
  ASTLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ASTMaterializedConnectionManager postSelectSelfServiceSuite:withPayloadSigner:allowsCellularAccess:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  v14 = -[ASTConnectionSelectSelfServiceSuite initWithSuiteID:]([ASTConnectionSelectSelfServiceSuite alloc], "initWithSuiteID:", v10);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v14, "setIdentity:", v15);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v14, "setSessionId:", v16);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v14, "setAllowsCellularAccess:", v7);
  -[ASTMaterializedConnection setDelegate:](v14, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v14, "setRetryOnNetworkDisconnected:", 1);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  v20[3] = &unk_24F96A138;
  v22 = self;
  v23 = v11;
  v21 = v10;
  v17 = v11;
  v18 = v10;
  -[ASTMaterializedConnection setDidReceiveResponse:](v14, "setDidReceiveResponse:", v20);
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v14, "signBodyWithPayloadSigner:", v12);

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConnection:", v14);

}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("diagnosticEventId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isValidUUID:", v6) & 1) != 0)
    {
      (*(void (**)(_QWORD, _QWORD, void *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v6, 0, 0);
    }
    else
    {
      ASTLogHandleForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2();

      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, void *))(v11 + 16))(v11, v12, 0, 0, v13);

    }
  }
  else
  {
    ASTLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, v9, 0, 0, v6);
  }

}

- (void)requestSelfServiceSuiteResultsWithDiagnosticEventID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  ASTConnectionRetrieveSelfServiceSuiteResults *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v7 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a4;
  ASTLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ASTMaterializedConnectionManager requestSelfServiceSuiteResultsWithDiagnosticEventID:withPayloadSigner:allow"
          "sCellularAccess:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  v14 = -[ASTConnectionRetrieveSelfServiceSuiteResults initWithDiagnosticEventID:]([ASTConnectionRetrieveSelfServiceSuiteResults alloc], "initWithDiagnosticEventID:", v10);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v14, "setIdentity:", v15);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v14, "setSessionId:", v16);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v14, "setAllowsCellularAccess:", v7);
  -[ASTMaterializedConnection setDelegate:](v14, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v14, "setRetryOnNetworkDisconnected:", 1);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  v23 = &unk_24F96A048;
  v24 = v10;
  v25 = v11;
  v17 = v11;
  v18 = v10;
  -[ASTMaterializedConnection setDidReceiveResponse:](v14, "setDidReceiveResponse:", &v20);
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v14, "signBodyWithPayloadSigner:", v12, v20, v21, v22, v23);

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConnection:", v14);

}

void __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  ASTSuiteResult *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "dictionaryDroppingNSNullValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = -[ASTSuiteResult initWithDictionary:error:]([ASTSuiteResult alloc], "initWithDictionary:error:", v6, &v11);
    v8 = v11;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    ASTLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v8);
  }

}

- (void)requestInstructionalPromptDetailsWithInstructionID:(id)a3 type:(id)a4 withPayloadSigner:(id)a5 language:(id)a6 locale:(id)a7 allowsCellularAccess:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  ASTConnectionRetrieveInstructionalPromptDetails *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v9 = a8;
  v32 = *MEMORY[0x24BDAC8D0];
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  ASTLogHandleForCategory(1);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[ASTMaterializedConnectionManager requestInstructionalPromptDetailsWithInstructionID:type:withPayloadSigner:l"
          "anguage:locale:allowsCellularAccess:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v22, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  v23 = -[ASTConnectionRetrieveInstructionalPromptDetails initWithInstructionID:type:language:locale:]([ASTConnectionRetrieveInstructionalPromptDetails alloc], "initWithInstructionID:type:language:locale:", v21, v20, v18, v17);
  -[ASTMaterializedConnectionManager identity](self, "identity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setIdentity:](v23, "setIdentity:", v24);

  -[ASTMaterializedConnectionManager sessionId](self, "sessionId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection setSessionId:](v23, "setSessionId:", v25);

  -[ASTMaterializedConnection setAllowsCellularAccess:](v23, "setAllowsCellularAccess:", v9);
  -[ASTMaterializedConnection setDelegate:](v23, "setDelegate:", self);
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v23, "setRetryOnNetworkDisconnected:", 1);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke;
  v28[3] = &unk_24F96A020;
  v29 = v16;
  v26 = v16;
  -[ASTMaterializedConnection setDidReceiveResponse:](v23, "setDidReceiveResponse:", v28);
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v23, "signBodyWithPayloadSigner:", v19);

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConnection:", v23);

}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("images"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
      v11 = v8 == 0;
    else
      v11 = 1;
    if (v11 || v9 == 0)
    {
      ASTLogHandleForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_2();

      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, 0, v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    ASTLogHandleForCategory(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_1();

    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v17 + 16))(v17, 0, 0, 0, v7);
  }

}

- (void)connection:(id)a3 connectionStateChanged:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_255DAAE00))
  {
    objc_msgSend(v11, "testId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      objc_msgSend(v11, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "allowsCellularAccess");

      -[ASTMaterializedConnectionManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "connectionManager:pausedSendingResultForTest:reason:", self, v6, v8 == 0);
    }
    else
    {
      -[ASTMaterializedConnectionManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "connectionManager:resumedSendingResultForTest:", self, v6);
    }

  }
  else
  {
    -[ASTMaterializedConnectionManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (a4 == 1)
      objc_msgSend(v10, "connectionManagerRequestPaused:", self);
    else
      objc_msgSend(v10, "connectionManagerRequestResumed:", self);
  }

}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpected:(int64_t)a6
{
  NSObject *v9;
  _BOOL4 v10;
  float v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a6 < 1)
  {
    if (v10)
    {
      v15 = 134218240;
      v16 = a4;
      v17 = 2048;
      v18 = a5;
      v12 = "bytes sent: %lld, total bytes sent: %lld";
      v13 = v9;
      v14 = 22;
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    v11 = (double)a5 / (double)a6;
    v15 = 134218752;
    v16 = a4;
    v17 = 2048;
    v18 = a5;
    v19 = 2048;
    v20 = a6;
    v21 = 2048;
    v22 = (float)(v11 * 100.0);
    v12 = "bytes sent: %lld, total bytes sent: %lld, expected: %lld, complete: %0.1f%%";
    v13 = v9;
    v14 = 42;
LABEL_6:
    _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ASTMaterializedConnectionManager networking](self, "networking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ASTMaterializedConnectionManager;
  -[ASTMaterializedConnectionManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isValidUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  return v5 != 0;
}

- (ASTConnectionManagerDelegate)delegate
{
  return (ASTConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (ASTNetworking)networking
{
  return self->_networking;
}

- (void)setNetworking:(id)a3
{
  objc_storeStrong((id *)&self->_networking, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_networking, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[Session] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __135__ASTMaterializedConnectionManager_downloadAsset_customServerURL_customEndpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v0, v1, "[Asset] <ERROR> %@, %@");
  OUTLINED_FUNCTION_3();
}

void __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[Enroll] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[AuthInfo] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[Profile] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[Status] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[Status] <ERROR> Could not interpret response.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[Test Results] <ERROR> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_22D91B000, a3, v6, "[File Upload] <ERROR> Could not remove file: %@, Error %@", v7);

  OUTLINED_FUNCTION_7_0();
}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_22D91B000, a3, v6, "[File Upload] <ERROR> File: %@, Error %@", v7);

  OUTLINED_FUNCTION_7_0();
}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Self service session failed to archive with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Self service session failed to archive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Self service session failed to retrieve the suites available for config: %@, error: %@");
  OUTLINED_FUNCTION_3();
}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Failed to select suite with ID: %@, error %@");
  OUTLINED_FUNCTION_3();
}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Diagnostic event ID has a wrong format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Failed to retrieve suite run results, deid: %@, error %@");
  OUTLINED_FUNCTION_3();
}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Failed to retrieve prompt details results, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[ASTConnectionManager] Bad instructional prompt details response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
