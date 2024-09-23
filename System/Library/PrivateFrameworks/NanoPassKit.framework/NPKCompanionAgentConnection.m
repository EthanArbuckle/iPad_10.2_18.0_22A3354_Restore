@implementation NPKCompanionAgentConnection

void __59__NPKCompanionAgentConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error on NPKCompanionAgentConnection connection: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "queueAppropriateFailedActions"))
  {
    +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler](NPKCompanionAgentConnectionDeferredActionHandler, "sharedDeferredActionHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deferredSharedPaymentWebServiceContextForDevice:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (BOOL)queueAppropriateFailedActions
{
  return self->_queueAppropriateFailedActions;
}

uint64_t __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = *(_QWORD *)(a1 + 40);
      if (v7 > 2)
        v8 = CFSTR("unknown");
      else
        v8 = off_24CFEE620[v7];
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Should show Apple Pay settings: %@ (supported in region %@)", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[4];
  id v4;
  uint64_t v5;
  BOOL v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isApplePaySupportedInCurrentRegion");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke_2;
  block[3] = &unk_24CFE9BA8;
  v6 = v2 != 2;
  v5 = v2;
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (unint64_t)_isApplePaySupportedInCurrentRegion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  NPKDeviceRegion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    NPKPairedOrPairingDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKCompanionAgentConnection sharedPaymentWebServiceContextForDevice:](self, "sharedPaymentWebServiceContextForDevice:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NPKSupportedRegionsForWebServiceConfiguration(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = PKStockholmSetupSupportedInRegion();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharedPaymentWebServiceContextForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__24;
  v20 = __Block_byref_object_dispose__24;
  v21 = 0;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke;
  v13[3] = &unk_24CFEB198;
  v13[4] = self;
  v15 = &v16;
  v6 = v4;
  v14 = v6;
  v7 = (void *)MEMORY[0x2199B6780](v13);
  -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke_2;
  v12[3] = &unk_24CFEE2A8;
  v12[4] = self;
  v12[5] = &v16;
  objc_msgSend(v8, "sharedPaymentWebServiceContextForPairingID:withCompletion:", v9, v12);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)_remoteObjectProxySynchronize:(BOOL)a3 withFailureHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKCompanionAgentConnection _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  else
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 136446978;
        v15 = "-[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        v18 = 2048;
        v19 = 1377;
        v20 = 1024;
        v21 = v4;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: -[NPKCompanionAgentConnection _remoteObjectProxySynchronise:withFailureHandler:] (synchronous:%d) would have returned nil)", (uint8_t *)&v14, 0x26u);
      }

    }
    _NPKAssertAbort();
  }

  return v9;
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__NPKCompanionAgentConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24CFE7B80;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199B6780](v8);
  v6 = (void *)MEMORY[0x2199B6780]();

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection deallocating: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weak_removeObserver:", self);

  if (notify_is_valid_token(self->_notifyToken))
    notify_cancel(self->_notifyToken);
  v7.receiver = self;
  v7.super_class = (Class)NPKCompanionAgentConnection;
  -[NPKCompanionAgentConnection dealloc](&v7, sel_dealloc);
}

- (void)shouldShowApplePaySettingsWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  if (NPKPairedOrPairingDeviceCanProvisionSecureElementPasses())
    -[NPKCompanionAgentConnection _shouldShowApplePaySettingsWithCompletion:](self, "_shouldShowApplePaySettingsWithCompletion:", v4);
  else
    -[NPKCompanionAgentConnection _shouldShowApplePaySettingsForTinkerWithCompletion:](self, "_shouldShowApplePaySettingsForTinkerWithCompletion:", v4);

}

- (void)_shouldShowApplePaySettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke;
    v6[3] = &unk_24CFE7E90;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_connectionUnavailableWebServiceContext, 0);
  objc_storeStrong((id *)&self->_connectionAvailableActions, 0);
  objc_storeStrong((id *)&self->_cachedPasses, 0);
  objc_storeStrong((id *)&self->_cachedUniqueIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (NPKCompanionAgentConnection)init
{
  NPKCompanionAgentConnection *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKXPCService *remoteService;
  dispatch_queue_t v11;
  OS_dispatch_queue *cacheQueue;
  uint64_t v13;
  NSMutableDictionary *connectionAvailableActions;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  _QWORD handler[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)NPKCompanionAgentConnection;
  v2 = -[NPKCompanionAgentConnection init](&v22, sel_init);
  if (v2)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: New NPKCompanionAgentConnection created: %@", buf, 0xCu);
      }

    }
    v6 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKCompanionServerProtocolInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NPKCompanionClientProtocolInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.NPKCompanionAgent.Server"), v7, v8, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v9;

    -[PKXPCService setDelegate:](v2->_remoteService, "setDelegate:", v2);
    v11 = dispatch_queue_create(0, 0);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    connectionAvailableActions = v2->_connectionAvailableActions;
    v2->_connectionAvailableActions = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "weak_addObserver:selector:name:object:", v2, sel__handleServerPaymentPassesChanged_, CFSTR("com.apple.NPKCompanionServer.PaymentPassesChanged"), 0);

    v2->_notifyToken = -1;
    objc_initWeak((id *)buf, v2);
    v16 = (const char *)objc_msgSend(CFSTR("com.apple.NPKCompanionServer.DefaultCardChanged"), "UTF8String");
    v17 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __35__NPKCompanionAgentConnection_init__block_invoke;
    handler[3] = &unk_24CFE78F0;
    objc_copyWeak(&v21, (id *)buf);
    notify_register_dispatch(v16, &v2->_notifyToken, MEMORY[0x24BDAC9B8], handler);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "weak_addObserver:selector:name:object:", v2, sel__handleDefaultCardChanged_, CFSTR("com.apple.NPKCompanionServer.DefaultCardChanged"), 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

+ (id)watchProvisioningURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=com.apple.NanoPassbookBridgeSettings&action=ADD_CARD"));
}

+ (id)watchProvisioningURLForPaymentPasses:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD17C8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      v6 = v4;
      do
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        objc_msgSend(v7, "passTypeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serialNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BDD16A8];
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("&passTypeIdentifier=%@&passSerialNumber=%@"), v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "stringByAppendingString:", v15);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v4;
      }
      while (v27 != v5);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "watchProvisioningURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  pk_General_log();
  v20 = objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v17)
  {
    pk_General_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v19;
      _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: watchProvisioningURLForPaymentPasses returning URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)isSetupAssistantProvisioningSupported
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NPKPairedOrPairingDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (NPKIsTinkerDevice(v2))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("79770938-0C49-40BD-B593-4E04E7557E01"));
      LODWORD(v5) = objc_msgSend(v3, "supportsCapability:", v4);

    }
    else
    {
      LODWORD(v5) = 1;
    }
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = (_DWORD)v5;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: isSetupAssistantProvisioningSupported:%d", (uint8_t *)v11, 8u);
      }
LABEL_12:

    }
  }
  else
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    LOBYTE(v5) = 0;
    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: isSetupAssistantProvisioningSupported:0. no pairing or paired device", (uint8_t *)v11, 2u);
      }
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
  }

  return (char)v5;
}

- (BOOL)isIssuerAppProvisioningSupported
{
  NPKCompanionAgentConnection *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__NPKCompanionAgentConnection_isIssuerAppProvisioningSupported__block_invoke;
  v5[3] = &unk_24CFEDF98;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "isIssuerAppProvisioningSupported:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__NPKCompanionAgentConnection_isIssuerAppProvisioningSupported__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v8 = 138412546;
      v9 = v6;
      v10 = 1024;
      v11 = v7;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Returning isIssuerAppProvisioningSupported %d", (uint8_t *)&v8, 0x12u);
    }

  }
}

+ (id)watchPaymentWebService
{
  void *v2;
  void *v3;

  if (watchPaymentWebService_onceToken != -1)
    dispatch_once(&watchPaymentWebService_onceToken, &__block_literal_global_31);
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadWebService");
  objc_msgSend(v2, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__NPKCompanionAgentConnection_watchPaymentWebService__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("NPKSharedWebServiceActiveDeviceDidChangeNotification"), 0, v0, &__block_literal_global_60);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)watchPaymentWebService_notificationObserver;
  watchPaymentWebService_notificationObserver = v1;

}

void __53__NPKCompanionAgentConnection_watchPaymentWebService__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.NanoPassKit.NPKCompanionAgentConnection.ActiveWatchWebServiceChanged"), 0);

}

+ (id)watchPeerPaymentWebService
{
  void *v2;
  void *v3;

  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadWebService");
  objc_msgSend(v2, "peerPaymentWebService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __35__NPKCompanionAgentConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDefaultCardChanged:", 0);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PKXPCService setForceConnectionOnResume:](self->_remoteService, "setForceConnectionOnResume:", obj != 0);
    v5 = obj;
    if (obj)
    {
      -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connect");

      v5 = obj;
    }
  }

}

- (void)_handleServerPaymentPassesChanged:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *cacheQueue;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Server payment passes changed", buf, 0xCu);
    }

  }
  objc_initWeak((id *)buf, self);
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke;
  block[3] = &unk_24CFE7970;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(cacheQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_clearCaches");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged"), *(_QWORD *)(a1 + 32));

}

- (void)_handleDefaultCardChanged:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): default card changed", buf, 0xCu);
    }

  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NPKCompanionAgentConnection__handleDefaultCardChanged___block_invoke;
  block[3] = &unk_24CFE7970;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __57__NPKCompanionAgentConnection__handleDefaultCardChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("com.apple.NanoPassKit.NPKCompanionAgentConnection.DefaultCardChanged"), WeakRetained);

  }
}

- (void)shouldShowWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  id v43;
  _BYTE *v44;
  uint8_t *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  NSObject *v53;
  _QWORD *v54;
  uint8_t *v55;
  _QWORD block[5];
  NSObject *v57;
  _BYTE *v58;
  _QWORD v59[3];
  char v60;
  _QWORD v61[3];
  char v62;
  uint8_t v63[8];
  uint8_t *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[4];
  id v68;
  _BYTE *v69;
  _BYTE buf[24];
  _QWORD v71[5];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NPKIsAddToWatchSupportedForCompanionPaymentPass(v6))
    goto LABEL_20;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6C4614A2-1ECC-4405-9FEE-B5F0A5666961"));
  v11 = objc_msgSend(v9, "supportsCapability:", v10);

  if ((v11 & 1) == 0 && PKFelicaSecureElementIsAvailable())
  {
    objc_msgSend(MEMORY[0x24BE6EE80], "secureElementIdentifiers");
    v12 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](v12, "count") <= 1)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6EE80], "primarySecureElementIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v71[0]) = 0;
      objc_msgSend(v6, "devicePaymentApplications");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke;
      v67[3] = &unk_24CFE7EE0;
      v15 = v13;
      v68 = v15;
      v69 = buf;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v67);

      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        pk_Payment_log();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (v24)
        {
          pk_Payment_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v63 = 0;
            _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Card on Felica secure element cannot be transferred to non-Felica watch", v63, 2u);
          }

        }
        _Block_object_dispose(buf, 8);

        goto LABEL_19;
      }

      _Block_object_dispose(buf, 8);
    }
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BA0452A1-075E-4E13-B48F-E36DF2F88980"));
  v17 = objc_msgSend(v9, "supportsCapability:", v16);

  if ((v17 & 1) != 0
    || (objc_msgSend(v6, "devicePrimaryPaymentApplication"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "paymentType") == 1003,
        v18,
        !v19))
  {
    v22 = 1;
    goto LABEL_21;
  }
  pk_Payment_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Unified access pass cannot be transferred to an unsupported watch", buf, 2u);
    }
LABEL_19:

  }
LABEL_20:
  v22 = 0;
LABEL_21:
  pk_Payment_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (v27)
  {
    pk_Payment_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v71[0]) = v9 != 0;
      WORD2(v71[0]) = 1024;
      *(_DWORD *)((char *)v71 + 6) = v22;
      _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to determine if we should show the watch offer for %@ (have paired watch %d can be transferred %d)", buf, 0x22u);

    }
  }
  v30 = v22 ^ 1;
  if (!v9)
    v30 = 1;
  if ((v30 & 1) != 0)
  {
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_82;
    v40[3] = &unk_24CFE7B00;
    v41 = v7;
    v36 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v40);

  }
  else
  {
    v31 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71[0] = 0;
    *(_QWORD *)v63 = 0;
    v64 = v63;
    v65 = 0x2020000000;
    v66 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v62 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    dispatch_group_enter(v31);
    dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_79;
    block[3] = &unk_24CFE9510;
    v58 = buf;
    v33 = MEMORY[0x24BDAC760];
    block[4] = self;
    v34 = v31;
    v57 = v34;
    dispatch_async(v32, block);

    dispatch_group_enter(v34);
    v51[0] = v33;
    v51[1] = 3221225472;
    v51[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_2;
    v51[3] = &unk_24CFEE038;
    v54 = v61;
    v35 = v6;
    v52 = v35;
    v55 = v63;
    v36 = v34;
    v53 = v36;
    -[NPKCompanionAgentConnection paymentPassUniqueIDsSynchronous:excludingDeactivated:reply:](self, "paymentPassUniqueIDsSynchronous:excludingDeactivated:reply:", 0, 1, v51);
    objc_msgSend(v35, "pairedTerminalIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      dispatch_group_enter(v36);
      objc_msgSend(v35, "pairedTerminalIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v33;
      v48[1] = 3221225472;
      v48[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_3;
      v48[3] = &unk_24CFEE060;
      v50 = v59;
      v49 = v36;
      -[NPKCompanionAgentConnection paymentPassWithPairedTerminalIdentifier:completion:](self, "paymentPassWithPairedTerminalIdentifier:completion:", v38, v48);

    }
    v42[0] = v33;
    v42[1] = 3221225472;
    v42[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_4;
    v42[3] = &unk_24CFEE088;
    v44 = buf;
    v45 = v63;
    v46 = v61;
    v47 = v59;
    v42[4] = self;
    v43 = v7;
    v39 = v7;
    dispatch_group_notify(v36, MEMORY[0x24BDAC9B8], v42);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);
    _Block_object_dispose(buf, 8);
  }

}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "secureElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_79(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isApplePaySupportedInCurrentRegion");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (PKEnableDynamicSEAllocation())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    v3 = objc_msgSend(v10, "count");
    v4 = NPKMaxPaymentCards();
    if (v3)
      v5 = v4 == 0;
    else
      v5 = 1;
    v7 = !v5 && v3 >= v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "containsObject:", v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  int v7;
  int v8;
  int v9;
  _BOOL8 v10;
  uint64_t result;
  int v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v5 > 2)
        v6 = CFSTR("unknown");
      else
        v6 = off_24CFEE620[v5];
      v7 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
      v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24);
      v12 = 138413058;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      v16 = 1024;
      v17 = v8;
      v18 = 1024;
      v19 = v9;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Should show watch offer: supported in region %@ hasPassOnWatchMatchingUniqueID %d hasMaximumPassesOnWatch %d hasPassOnWatchMatchingPairedTerminalIdentifier %d", (uint8_t *)&v12, 0x1Eu);
    }

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != 2
     && !*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24)
     && !*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24)
     && *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) == 0;
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v10);
  return result;
}

uint64_t __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)shouldShowWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id obj;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__24;
  v26[4] = __Block_byref_object_dispose__24;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v19[0] = v9;
        v19[1] = 3221225472;
        v19[2] = __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke;
        v19[3] = &unk_24CFEDF98;
        v21 = v26;
        v20 = v7;
        -[NPKCompanionAgentConnection shouldShowWatchOfferForPaymentPass:withCompletion:](self, "shouldShowWatchOfferForPaymentPass:withCompletion:", v12, v19);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke_2;
  block[3] = &unk_24CFEE0B0;
  v17 = v14;
  v18 = v26;
  v13 = v14;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v26, 8);
}

void __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)noteWatchOfferShownForPaymentPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NPKCompanionAgentConnection *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Note watch offer shown for %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "noteWatchOfferDisplayedForPaymentPassWithUniqueID:", v10);

}

- (void)beginProvisioningFromWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKCompanionAgentConnection beginProvisioningFromWatchOfferForPaymentPasses:withCompletion:](self, "beginProvisioningFromWatchOfferForPaymentPasses:withCompletion:", v9, v7, v10, v11);
}

- (void)beginProvisioningFromWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting that provisioning begin from watch offer for passes %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke_2;
  v15[3] = &unk_24CFE92E0;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "beginProvisioningFromWatchOfferForPaymentPasses:withCompletion:", v6, v15);

}

void __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handleDeviceUnlockedForPendingProvisioningRequestFromGizmo
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  int v7;
  NPKCompanionAgentConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): (account-pass-provisioning) handleDeviceUnlockedForPendingProvisioningRequestFromGizmo", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleDeviceUnlockedForPendingProvisioningRequestFromGizmo");

}

- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v23 = self;
      v24 = 2112;
      if (v6)
        v13 = CFSTR("YES");
      v25 = v8;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (account-pass-provisioning) (%@): provisionPassForAccountIdentifier %@ makeDefault %@", buf, 0x20u);
    }

  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke;
  v20[3] = &unk_24CFE7B00;
  v15 = v9;
  v21 = v15;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke_2;
  v18[3] = &unk_24CFE92E0;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "provisionPassForAccountIdentifier:makeDefault:completion:", v8, v6, v18);

}

void __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v22 = self;
      v23 = 2048;
      v24 = a3;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (apple-balance-pass-provisioning) (%@): provisionPassForRemoteCredentialType %ld identifier: %@", buf, 0x20u);
    }

  }
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke;
  v19[3] = &unk_24CFE7B00;
  v14 = v9;
  v20 = v14;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke_2;
  v17[3] = &unk_24CFE92E0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "provisionPassForRemoteCredentialWithType:andIdentifier:completion:", a3, v8, v17);

}

void __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting registration of paired device", buf, 0xCu);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke;
  v14[3] = &unk_24CFE7B00;
  v9 = v4;
  v15 = v9;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke_2;
  v12[3] = &unk_24CFEE0D8;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "registerDeviceWithCompletion:", v12);

}

void __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

uint64_t __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)noteProvisioningPreflightCompleteWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v18 = self;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Note provisioning preflight complete with success %d error %@", buf, 0x1Cu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__NPKCompanionAgentConnection_noteProvisioningPreflightCompleteWithSuccess_error_completion___block_invoke;
  v15[3] = &unk_24CFE9188;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v13, "noteProvisioningPreflightCompleteWithSuccess:error:completion:", v6, v8, v15);

}

uint64_t __93__NPKCompanionAgentConnection_noteProvisioningPreflightCompleteWithSuccess_error_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentPassUniqueIDs:(id)a3
{
  -[NPKCompanionAgentConnection paymentPassUniqueIDsSynchronous:reply:](self, "paymentPassUniqueIDsSynchronous:reply:", 0, a3);
}

- (void)paymentPassWithUniqueID:(id)a3 reply:(id)a4
{
  -[NPKCompanionAgentConnection paymentPassWithUniqueID:synchronous:reply:](self, "paymentPassWithUniqueID:synchronous:reply:", a3, 0, a4);
}

- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4
{
  -[NPKCompanionAgentConnection paymentPassUniqueIDsSynchronous:excludingDeactivated:reply:](self, "paymentPassUniqueIDsSynchronous:excludingDeactivated:reply:", a3, 0, a4);
}

- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 excludingDeactivated:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *cacheQueue;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  _QWORD v23[5];
  void (**v24)(_QWORD, _QWORD);
  BOOL v25;
  _QWORD v26[5];
  id v27;
  BOOL v28;
  _QWORD block[6];
  _QWORD v30[5];
  id v31;
  BOOL v32;
  uint8_t v33[4];
  NPKCompanionAgentConnection *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v5 = a4;
  v6 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Client requested payment pass unique IDs synchronous:%d", buf, 0x12u);
    }

  }
  if (v8)
  {
    v12 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke;
    v30[3] = &unk_24CFEE100;
    v32 = v6;
    v30[4] = self;
    v31 = v8;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B6780](v30);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__24;
    v37 = __Block_byref_object_dispose__24;
    v38 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_93;
    block[3] = &unk_24CFE8318;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(cacheQueue, block);
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) || v5)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        pk_Payment_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 138412290;
          v34 = self;
          _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): No cached unique IDs available; requesting from daemon",
            v33,
            0xCu);
        }

      }
      v26[0] = v12;
      v26[1] = 3221225472;
      v26[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_94;
      v26[3] = &unk_24CFE87E0;
      v26[4] = self;
      v21 = v13;
      v27 = v21;
      v28 = v5;
      -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v6, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_2;
      v23[3] = &unk_24CFEE100;
      v25 = v5;
      v23[4] = self;
      v24 = v21;
      objc_msgSend(v22, "paymentPassUniqueIDsExcludingDeactivated:reply:", v5, v23);

    }
    else
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        pk_Payment_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 138412290;
          v34 = self;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): found cached unique IDs", v33, 0xCu);
        }

      }
      v13[2](v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }
    _Block_object_dispose(buf, 8);

  }
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_92;
    block[3] = &unk_24CFE84E8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
}

uint64_t __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_92(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cachedUniqueIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_94(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "queueAppropriateFailedActions"))
  {
    +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler](NPKCompanionAgentConnectionDeferredActionHandler, "sharedDeferredActionHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 40);
    NPKPairedOrPairingDevice();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deferredPaymentPassUniqueIDsForDevice:excludingDeactivated:", v3, *(unsigned __int8 *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v7 = v3;
  if (!*(_BYTE *)(a1 + 48))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_3;
    v10[3] = &unk_24CFE7E40;
    v10[4] = v8;
    v11 = v3;
    dispatch_async(v9, v10);

  }
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, v4, v5, v6);

}

uint64_t __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCachedUniqueIDs:", *(_QWORD *)(a1 + 40));
}

- (void)paymentPassWithUniqueID:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  NSObject *cacheQueue;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void (**v25)(_QWORD, _QWORD);
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  void (**v30)(_QWORD, _QWORD);
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  _BYTE *v36;
  _QWORD v37[5];
  id v38;
  BOOL v39;
  uint8_t v40[4];
  NPKCompanionAgentConnection *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v45) = v6;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with unique ID: %@ synchronous: %d", buf, 0x1Cu);
    }

  }
  if (v9)
  {
    v13 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke;
    v37[3] = &unk_24CFEE128;
    v39 = v6;
    v37[4] = self;
    v38 = v9;
    v14 = MEMORY[0x2199B6780](v37);
    v15 = (void (**)(_QWORD, _QWORD))v14;
    if (v8)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__24;
      v46 = __Block_byref_object_dispose__24;
      v47 = 0;
      cacheQueue = self->_cacheQueue;
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_98;
      block[3] = &unk_24CFE9510;
      v36 = buf;
      block[4] = self;
      v17 = v8;
      v35 = v17;
      dispatch_sync(cacheQueue, block);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          pk_Payment_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v40 = 138412546;
            v41 = self;
            v42 = 2112;
            v43 = v21;
            _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): found cached payment pass: %@", v40, 0x16u);
          }

        }
        v15[2](v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }
      else
      {
        pk_Payment_log();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

        if (v23)
        {
          pk_Payment_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v40 = 138412290;
            v41 = self;
            _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): No cached payment pass available; requesting from daemon",
              v40,
              0xCu);
          }

        }
        v31[0] = v13;
        v31[1] = 3221225472;
        v31[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_99;
        v31[3] = &unk_24CFED5E8;
        v31[4] = self;
        v25 = v15;
        v33 = v25;
        v26 = v17;
        v32 = v26;
        -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v6, v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v13;
        v28[1] = 3221225472;
        v28[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_2;
        v28[3] = &unk_24CFEE150;
        v28[4] = self;
        v29 = v26;
        v30 = v25;
        objc_msgSend(v27, "paymentPassWithUniqueID:reply:", v29, v28);

      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
    }

  }
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with payment pass: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_97;
    block[3] = &unk_24CFE84E8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
}

uint64_t __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_97(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with payment pass: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cachedPassForUniqueID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_99(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "queueAppropriateFailedActions"))
  {
    +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler](NPKCompanionAgentConnectionDeferredActionHandler, "sharedDeferredActionHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = a1 + 40;
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(v4 + 8);
    NPKPairedOrPairingDevice();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deferredPaymentPassWithUniqueID:forDevice:", v2, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyPropertiesToPass:", v3);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_3;
  block[3] = &unk_24CFE8288;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v6;
  v15 = v7;
  dispatch_async(v4, block);
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Newly-fetched payment pass: %@", buf, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_addPassToCache:");
  else
    return objc_msgSend(v2, "_removePassWithUniqueIDFromCache:", a1[6]);
}

- (void)paymentPassesWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment passes with FPANID %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke_2;
  v15[3] = &unk_24CFEE178;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "paymentPassesWithPrimaryAccountIdentifier:completion:", v6, v15);

}

uint64_t __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentPassWithDeviceAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with DPANID %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke_2;
  v15[3] = &unk_24CFED238;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "paymentPassWithDeviceAccountIdentifier:completion:", v6, v15);

}

uint64_t __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentPassWithPairedTerminalIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with paired terminal identifier %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke_2;
  v15[3] = &unk_24CFED238;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "paymentPassWithPairedTerminalIdentifier:completion:", v6, v15);

}

uint64_t __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)credentialedPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting credentialed pass unique identifiers. synchronous: %@", buf, 0x16u);
    }

  }
  if (v6)
  {
    v11 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke;
    v19[3] = &unk_24CFEE100;
    v21 = v4;
    v19[4] = self;
    v20 = v6;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_101;
    v17[3] = &unk_24CFE7B00;
    v12 = (id)MEMORY[0x2199B6780](v19);
    v18 = v12;
    -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v4, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_2;
    v15[3] = &unk_24CFEE178;
    v15[4] = self;
    v16 = v12;
    v14 = v12;
    objc_msgSend(v13, "credentialedPassUniqueIDsWithReply:", v15);

  }
}

void __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_100;
    block[3] = &unk_24CFE84E8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_100(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_101(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)savePaymentPass:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  char *v14;
  void *v15;
  char isKindOfClass;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NPKCompanionAgentConnection *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  _QWORD v38[4];
  id v39;
  NPKCompanionAgentConnection *v40;
  id v41;
  id v42;
  NPKCompanionAgentConnection *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = self;
      v48 = 2112;
      v49 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting save of payment pass with unique ID %@", buf, 0x16u);

    }
  }
  if (!v10)
    v10 = &__block_literal_global_102;
  objc_msgSend(v8, "dataAccessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    pk_General_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "dataAccessor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447234;
        v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
        v48 = 2082;
        v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        v50 = 2048;
        v51 = 588;
        v52 = 2112;
        v53 = v8;
        v54 = 2112;
        v55 = v20;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ has data accessor %@)", buf, 0x34u);

      }
    }
    _NPKAssertAbort();
  }
  objc_msgSend(v8, "dataAccessor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fileURL");
  v22 = (NPKCompanionAgentConnection *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    pk_General_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      pk_General_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "uniqueID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
        v48 = 2082;
        v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        v50 = 2048;
        v51 = 591;
        v52 = 2112;
        v53 = v26;
        _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ had nil file URL)", buf, 0x2Au);

      }
    }
    _NPKAssertAbort();
  }
  objc_msgSend(v8, "uniqueID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(v8, "passTypeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serialNumber");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKGeneratePassUniqueID();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      pk_General_log();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (v31)
      {
        pk_General_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
          v48 = 2082;
          v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
          v50 = 2048;
          v51 = 597;
          v52 = 2112;
          v53 = 0;
          _os_log_impl(&dword_213518000, v32, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ had nil uniqueID)", buf, 0x2Au);
        }

      }
      _NPKAssertAbort();
    }
  }
  NPKTemporaryFileURL(*MEMORY[0x24BE6F7D0], 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((NPKCopyFileAtURL(v22, v33) & 1) != 0)
  {
    objc_msgSend(v8, "paymentPass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_105;
    v38[3] = &unk_24CFEE1E0;
    v39 = v9;
    v40 = self;
    v41 = v27;
    v42 = v8;
    v43 = v22;
    v44 = v33;
    v45 = v10;
    -[NPKCompanionAgentConnection _savePaymentPass:atURL:forDevice:completion:](self, "_savePaymentPass:atURL:forDevice:completion:", v34, v44, v39, v38);

  }
  else
  {
    pk_Payment_log();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

    if (v36)
    {
      pk_Payment_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v22;
        v48 = 2112;
        v49 = (const char *)v33;
        _os_log_impl(&dword_213518000, v37, OS_LOG_TYPE_ERROR, "Error: Unable to copy file from %@ to %@", buf, 0x16u);
      }

    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_105(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[5];
  id v23;
  id v24;
  char v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE6B3A8];
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  v9 = MEMORY[0x24BDAC760];
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v12 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_2;
  block[3] = &unk_24CFE9020;
  block[4] = v10;
  v23 = v11;
  v24 = *(id *)(a1 + 56);
  v25 = v8;
  v26 = a2;
  dispatch_sync(v12, block);
  if ((_DWORD)a2)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Success, deleting temporary pass file %@", buf, 0xCu);
      }

    }
    NPKDeleteFileAtURL(*(void **)(a1 + 72));
  }
  v17 = *(_QWORD *)(a1 + 80);
  if (v17)
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, a2);
  if (v8)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: For current device; posting notification",
          buf,
          2u);
      }

    }
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_107;
    v21[3] = &unk_24CFE7998;
    v21[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v21);
  }

}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_cachedPassForUniqueID:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v7, "ingestedDate"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "setIngestedDate:", v2);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_addPassToCache:", v4);

    if (*(_BYTE *)(a1 + 57))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "paymentPass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_applyPropertiesToPass:", v6);

    }
  }

}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_107(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged"), *(_QWORD *)(a1 + 32));

}

- (void)removePaymentPassWithUniqueID:(id)a3 forDevice:(id)a4 waitForConfirmation:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, int, void *);
  void *v25;
  NPKCompanionAgentConnection *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Request to remove payment pass with unique ID %@", buf, 0xCu);
    }

  }
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke;
  v25 = &unk_24CFEE230;
  v26 = self;
  v27 = v11;
  v28 = v10;
  v29 = v12;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  v19 = (void *)MEMORY[0x2199B6780](&v22);
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0, v22, v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removePaymentPassWithUniqueID:forPairingID:waitForConfirmation:completion:", v17, v21, v7, v19);

}

void __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD block[4];
  _QWORD v17[2];
  id v18;
  id v19;
  id v20;
  char v21;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_2;
    block[3] = &unk_24CFEE208;
    v8 = (id *)v17;
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 32);
    v17[0] = v9;
    v17[1] = v10;
    v18 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = a2;
    v19 = v5;
    dispatch_async(v7, block);

    v11 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_5;
    v12[3] = &unk_24CFE80E0;
    v8 = &v14;
    v14 = *(id *)(a1 + 56);
    v15 = 0;
    v13 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
    v11 = v13;
    goto LABEL_5;
  }
LABEL_6:

}

void __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  _QWORD block[5];
  id v13;
  id v14;
  char v15;

  v2 = *MEMORY[0x24BE6B3A8];
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_removePassWithUniqueIDFromCache:", *(_QWORD *)(a1 + 48));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_3;
    block[3] = &unk_24CFEDC30;
    block[4] = *(_QWORD *)(a1 + 40);
    v14 = *(id *)(a1 + 64);
    v15 = *(_BYTE *)(a1 + 72);
    v13 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v7 = v14;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 64))
      return;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_4;
    v8[3] = &unk_24CFE80E0;
    v10 = *(id *)(a1 + 64);
    v11 = *(_BYTE *)(a1 + 72);
    v9 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    v7 = v10;
  }

}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged"), *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setDefaultCardUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to set default card with unique ID %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke_2;
  v15[3] = &unk_24CFE7B58;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "setDefaultCard:completion:", v6, v15);

}

uint64_t __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)defaultCardUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching default card unique ID", buf, 0xCu);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke;
  v14[3] = &unk_24CFE7B00;
  v9 = v4;
  v15 = v9;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke_2;
  v12[3] = &unk_24CFEE258;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "defaultCard:", v12);

}

uint64_t __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = self;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Checking if pass will automatically become default %@", buf, 0x16u);
      }

    }
    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke;
    v16[3] = &unk_24CFE7B00;
    v12 = v7;
    v17 = v12;
    -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", 1, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke_2;
    v14[3] = &unk_24CFE7B58;
    v14[4] = self;
    v15 = v12;
    objc_msgSend(v13, "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:completion:", v6, v14);

  }
}

uint64_t __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)defaultPaymentApplicationForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching default payment application for pass with unique ID %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke_2;
  v15[3] = &unk_24CFEE280;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "defaultPaymentApplicationForPassWithUniqueID:completion:", v6, v15);

}

uint64_t __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v23 = self;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Setting default payment application for unique ID %@: %@", buf, 0x20u);
    }

  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke;
  v20[3] = &unk_24CFE7B00;
  v15 = v10;
  v21 = v15;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke_2;
  v18[3] = &unk_24CFED238;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "setDefaultPaymentApplication:forPassWithUniqueID:completion:", v8, v9, v18);

}

uint64_t __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)consistencyCheckWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting consistency check", buf, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__NPKCompanionAgentConnection_consistencyCheckWithCompletion___block_invoke;
  v10[3] = &unk_24CFE9188;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "initiateConsistencyCheckWithCompletion:", v10);

}

uint64_t __62__NPKCompanionAgentConnection_consistencyCheckWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)redownloadAllPaymentPassesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting redownload all payment passes", buf, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__NPKCompanionAgentConnection_redownloadAllPaymentPassesWithCompletion___block_invoke;
  v10[3] = &unk_24CFE9188;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "redownloadAllPaymentPassesWithCompletion:", v10);

}

uint64_t __72__NPKCompanionAgentConnection_redownloadAllPaymentPassesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handlePendingUnpairingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Sending pending unpairing request", buf, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__NPKCompanionAgentConnection_handlePendingUnpairingWithCompletion___block_invoke;
  v10[3] = &unk_24CFE9188;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "handlePendingUnpairingWithCompletion:", v10);

}

uint64_t __68__NPKCompanionAgentConnection_handlePendingUnpairingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handlePendingiCloudSignoutWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Sending pending iCloud signout request", buf, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__NPKCompanionAgentConnection_handlePendingiCloudSignoutWithCompletion___block_invoke;
  v10[3] = &unk_24CFE9188;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "handlePendingiCloudSignoutWithCompletion:", v10);

}

uint64_t __72__NPKCompanionAgentConnection_handlePendingiCloudSignoutWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handlePeerPaymentTermsAndConditionsRequestFromGizmo
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  int v7;
  NPKCompanionAgentConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): handlePeerPaymentTermsAndConditionsRequestFromGizmo", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handlePeerPaymentTermsAndConditionsRequestFromGizmo");

}

void __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)sharedPaymentWebServiceContext
{
  void *v3;
  void *v4;

  NPKPairedOrPairingDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKCompanionAgentConnection sharedPaymentWebServiceContextForDevice:](self, "sharedPaymentWebServiceContextForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  dispatch_semaphore_t v21;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke;
  v20[3] = &unk_24CFE7998;
  v21 = v8;
  v10 = v8;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_2;
  v16[3] = &unk_24CFE86A0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v19 = (id)MEMORY[0x2199B6780](v20);
  v11 = v19;
  v12 = v7;
  v13 = v6;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSharedPaymentWebServiceContext:forPairingID:completion:", v13, v15, v11);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "queueAppropriateFailedActions"))
  {
    +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler](NPKCompanionAgentConnectionDeferredActionHandler, "sharedDeferredActionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeferredSharedPaymentWebServiceContext:forDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_3;
    v7[3] = &unk_24CFEE2D0;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performActionWhenCompanionAgentIsAvailable:forDevice:", v7, *(_QWORD *)(a1 + 48));

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v2, v3, v4);
}

uint64_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSharedPaymentWebServiceContext:forDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setSharedPeerPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  dispatch_semaphore_t v14;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__NPKCompanionAgentConnection_setSharedPeerPaymentWebServiceContext_forDevice___block_invoke;
  v13[3] = &unk_24CFE7998;
  v14 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x2199B6780](v13);
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSharedPeerPaymentWebServiceContext:forPairingID:completion:", v7, v12, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __79__NPKCompanionAgentConnection_setSharedPeerPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)sharedPeerPaymentWebServiceContextForDevice:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__24;
  v22 = __Block_byref_object_dispose__24;
  v23 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke;
  v15[3] = &unk_24CFEE2F8;
  v17 = &v18;
  v7 = v5;
  v16 = v7;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke_2;
  v13[3] = &unk_24CFE7B00;
  v8 = (id)MEMORY[0x2199B6780](v15);
  v14 = v8;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedPeerPaymentWebServiceContextForPairingID:withCompletion:", v10, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPeerPaymentAccount:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  dispatch_semaphore_t v14;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__NPKCompanionAgentConnection_setPeerPaymentAccount_forDevice___block_invoke;
  v13[3] = &unk_24CFE7998;
  v14 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x2199B6780](v13);
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPeerPaymentAccount:forPairingID:completion:", v7, v12, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __63__NPKCompanionAgentConnection_setPeerPaymentAccount_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)peerPaymentAccountForDevice:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__24;
  v22 = __Block_byref_object_dispose__24;
  v23 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke;
  v15[3] = &unk_24CFEE320;
  v17 = &v18;
  v7 = v5;
  v16 = v7;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke_2;
  v13[3] = &unk_24CFE7B00;
  v8 = (id)MEMORY[0x2199B6780](v15);
  v14 = v8;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peerPaymentAccountForPairingID:withCompletion:", v10, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)watchPaymentWebService
{
  return (id)objc_msgSend((id)objc_opt_class(), "watchPaymentWebService");
}

- (void)updateSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSettings:forPassWithUniqueID:", a3, v6);

}

- (void)countOfPassesSynchronous:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke;
  v13[3] = &unk_24CFE7E90;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v4, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke_114;
  v11[3] = &unk_24CFEE348;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "countOfPassesWithCompletion:", v11);

}

uint64_t __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch count of passes.", (uint8_t *)&v7, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke_114(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)passesSynchronous:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke;
  v13[3] = &unk_24CFE7E90;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v4, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke_116;
  v11[3] = &unk_24CFE8158;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "passesWithCompletion:", v11);

}

uint64_t __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch passes.", (uint8_t *)&v7, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deviceIDSIdentifierSynchronous:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke;
  v13[3] = &unk_24CFE7E90;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", v4, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke_118;
  v11[3] = &unk_24CFEE258;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "deviceIDSIdentifierWithCompletion:", v11);

}

uint64_t __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch device IDS identifier.", (uint8_t *)&v7, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke_118(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)initiateLostModeExitAuthWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__NPKCompanionAgentConnection_initiateLostModeExitAuthWithCompletion___block_invoke;
  v7[3] = &unk_24CFEAE00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "initiateLostModeExitAuthWithCompletion:", v7);

}

uint64_t __70__NPKCompanionAgentConnection_initiateLostModeExitAuthWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markAllAppletsForDeletionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke;
  v12[3] = &unk_24CFE7B80;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke_2;
  v10[3] = &unk_24CFE92E0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "markAllAppletsForDeletionWithCompletion:", v10);

}

uint64_t __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  NPKCompanionAgentConnection *v29;
  id v30;
  id v31[5];
  id location;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a10;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  block[3] = &unk_24CFEE370;
  objc_copyWeak(v31, &location);
  v29 = self;
  v30 = v18;
  v31[1] = (id)a4;
  v31[2] = (id)a5;
  v26 = v15;
  v27 = v16;
  v31[3] = (id)a8;
  v31[4] = (id)a9;
  v28 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v18;
  dispatch_async(v19, block);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "remoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v15[3] = &unk_24CFE7B80;
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 104);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v13[3] = &unk_24CFEE178;
  v12 = *(id *)(a1 + 64);
  v13[4] = *(_QWORD *)(a1 + 56);
  v14 = v12;
  objc_msgSend(v4, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v7, v5, v6, v8, v9, v10, v11, v13);

}

uint64_t __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to delete from device with pairing ID: %@ Transaction with Identifier: %@", buf, 0x20u);
    }

  }
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke;
  v22[3] = &unk_24CFEAE00;
  v16 = v9;
  v23 = v8;
  v24 = v16;
  v17 = v8;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke_120;
  v20[3] = &unk_24CFEAE00;
  v20[4] = self;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "deletePaymentTransactionWithIdentifier:fromDeviceWithPairingID:completion:", v17, v10, v20);

}

void __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Error while creating connection to delete transaction with Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke_120(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  v18[3] = &unk_24CFE7B80;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v16[3] = &unk_24CFEE398;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v10, v9, v16);

}

uint64_t __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  v15[3] = &unk_24CFE7B80;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24CFEE178;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "balancesForPaymentPassWithUniqueIdentifier:completion:", v7, v13);

}

uint64_t __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke;
  v19[3] = &unk_24CFEAE00;
  v13 = v9;
  v20 = v8;
  v21 = v13;
  v14 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke_122;
  v17[3] = &unk_24CFEE3C0;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "balanceReminderForBalance:pass:withCompletion:", v10, v14, v17);

}

void __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to get balance reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke;
  v22[3] = &unk_24CFEAE00;
  v16 = v11;
  v23 = v10;
  v24 = v16;
  v17 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke_124;
  v20[3] = &unk_24CFE7B58;
  v20[4] = self;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "setBalanceReminder:forBalance:pass:completion:", v13, v12, v17, v20);

}

void __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to set balance reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke_124(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke;
  v19[3] = &unk_24CFEAE00;
  v13 = v9;
  v20 = v8;
  v21 = v13;
  v14 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke_125;
  v17[3] = &unk_24CFEE3E8;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "commutePlanReminderForCommutePlan:pass:withCompletion:", v10, v14, v17);

}

void __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to get commute plan reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke_125(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke;
  v22[3] = &unk_24CFEAE00;
  v16 = v11;
  v23 = v10;
  v24 = v16;
  v17 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_127;
  v20[3] = &unk_24CFE7B58;
  v20[4] = self;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "setCommutePlanReminder:forCommutePlan:pass:completion:", v13, v12, v17, v20);

}

void __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to set commute plan reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_127(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__NPKCompanionAgentConnection_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke;
  v11[3] = &unk_24CFE79C0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startBackgroundVerificationObserverForPass:verificationMethod:", v9, v7);
}

void __93__NPKCompanionAgentConnection_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to start background verification for pass unique identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__NPKCompanionAgentConnection_noteForegroundVerificationObserverActive___block_invoke;
  v6[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v7 = v3;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "noteForegroundVerificationObserverActive:", v3);
}

void __72__NPKCompanionAgentConnection_noteForegroundVerificationObserverActive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(unsigned __int8 *)(a1 + 32);
      v8[0] = 67109378;
      v8[1] = v7;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to note foreground verification observation active: %d. Error: %@", (uint8_t *)v8, 0x12u);
    }

  }
}

- (void)reloadPaymentPassesWithCompletion:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke;
  v7[3] = &unk_24CFE7E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(cacheQueue, v7);

}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_clearCaches");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_2;
  v3[3] = &unk_24CFE7E90;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_3;
  v2[3] = &unk_24CFE8948;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "paymentPassUniqueIDsSynchronous:reply:", 0, v2);

}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = dispatch_group_create();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        dispatch_group_enter(v4);
        v11 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_4;
        v14[3] = &unk_24CFECF70;
        v15 = v4;
        objc_msgSend(v11, "paymentPassWithUniqueID:synchronous:reply:", v10, 0, v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_5;
  v12[3] = &unk_24CFE7B00;
  v13 = *(id *)(a1 + 40);
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], v12);

}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__NPKCompanionAgentConnection_hasActiveExternallySharedPasses___block_invoke;
  v6[3] = &unk_24CFE7940;
  v7 = v4;
  v5 = v4;
  -[NPKCompanionAgentConnection hasActiveExternallySharedPassesWithCompletion:](self, "hasActiveExternallySharedPassesWithCompletion:", v6);

}

uint64_t __63__NPKCompanionAgentConnection_hasActiveExternallySharedPasses___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hasActiveExternallySharedPassesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke;
  v12[3] = &unk_24CFE7B80;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke_128;
  v10[3] = &unk_24CFE92E0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "hasActiveExternallySharedPassesWithCompletion:", v10);

}

void __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while getting active externally shared passes. Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke_128(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)expressModeEnabledForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke;
  v15[3] = &unk_24CFE7B80;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke_129;
  v13[3] = &unk_24CFE92E0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "expressModeEnabledForPassIdentifier:completion:", v7, v13);

}

void __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while checking express passes. Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke_129(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateCredentials:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NPKCompanionAgentConnection remoteService](self, "remoteService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke;
  v20[3] = &unk_24CFE7B30;
  v21 = v8;
  v22 = v9;
  v13 = v10;
  v23 = v13;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke_130;
  v18[3] = &unk_24CFEAE00;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "updateCredentials:forUniqueID:completion:", v15, v14, v18);

}

void __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[5];
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Error while updating credentials %@ for pass unique ID: %@. Error: %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

uint64_t __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke_130(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)trustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_General_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Requested gizmo trusted device enrollment signature", buf, 2u);
      }

    }
    -[NPKCompanionAgentConnection remoteService](self, "remoteService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke;
    v21[3] = &unk_24CFE7B80;
    v16 = v10;
    v22 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke_135;
    v19[3] = &unk_24CFEE430;
    v19[4] = self;
    v20 = v16;
    objc_msgSend(v17, "trustedDeviceEnrollmentSignatureWithAccountDSID:sessionData:handler:", v8, v9, v19);

    v18 = v22;
  }
  else
  {
    if (!v12)
      goto LABEL_8;
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Warning: TrustedDeviceEnrollmentInfo ignore request. handler not provided", buf, 2u);
    }
  }

LABEL_8:
}

void __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: TrustedDeviceEnrollmentInfo: Error connecting to gizmo target device.", v10, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BE6F558];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = CFSTR("Error connecting to target device.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v5 + 16))(v5, 0, 0, 0, v9);

}

uint64_t __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke_135(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v18)
  {
    pk_General_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      pk_General_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Completion not provided by the caller we will not be able to notify when we are done", buf, 2u);
      }

    }
  }
  v22 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v35[3] = &unk_24CFEE458;
  v36 = v18;
  v23 = v18;
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_139;
  v29[3] = &unk_24CFEE480;
  v30 = v13;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = (id)MEMORY[0x2199B6780](v35);
  v24 = v34;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v13;
  +[NPKIDVRemoteDeviceSession sessionForDeviceID:completion:](NPKIDVRemoteDeviceSession, "sessionForDeviceID:completion:", v14, v29);

}

void __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[NPKCompanionAgentConnection provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentif"
            "ier:attestations:supplementalData:completion:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %s finished with secureElementPass:%@, error:%@", (uint8_t *)&v11, 0x20u);
    }

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

uint64_t __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_139(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:", 1, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8
{
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v13 = a8;
  v14 = (objc_class *)MEMORY[0x24BE6EB58];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  v19 = objc_alloc_init(v14);
  objc_msgSend(v19, "dataRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_policyIdentifier_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke;
  v22[3] = &unk_24CFEE458;
  v23 = v13;
  v21 = v13;
  -[NPKCompanionAgentConnection provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:supplementalData:completion:](self, "provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:supplementalData:completion:", v18, v17, v16, v15, v20, v22);

}

uint64_t __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_policyIdentifier_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:](self, "_remoteObjectProxySynchronize:withFailureHandler:", 0, a3);
}

- (id)_cachedUniqueIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  -[NPKCompanionAgentConnection cachedUniqueIDs](self, "cachedUniqueIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    -[NPKCompanionAgentConnection cachedUniqueIDs](self, "cachedUniqueIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setCachedUniqueIDs:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  id v6;

  cacheQueue = self->_cacheQueue;
  v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NPKCompanionAgentConnection setCachedUniqueIDs:](self, "setCachedUniqueIDs:", v6);
}

- (id)_cachedPassForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPKCompanionAgentConnection cachedPasses](self, "cachedPasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_addPassToCache:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  cacheQueue = self->_cacheQueue;
  v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  -[NPKCompanionAgentConnection cachedUniqueIDs](self, "cachedUniqueIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  -[NPKCompanionAgentConnection cachedPasses](self, "cachedPasses");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v8);

}

- (void)_removePassWithUniqueIDFromCache:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  void *v6;
  id v7;

  cacheQueue = self->_cacheQueue;
  v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  -[NPKCompanionAgentConnection cachedUniqueIDs](self, "cachedUniqueIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  -[NPKCompanionAgentConnection cachedPasses](self, "cachedPasses");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v5);

}

- (void)_invalidateCachedPassWithUniqueID:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  id v6;

  cacheQueue = self->_cacheQueue;
  v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  -[NPKCompanionAgentConnection cachedPasses](self, "cachedPasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

}

- (void)_clearCaches
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  -[NPKCompanionAgentConnection setCachedUniqueIDs:](self, "setCachedUniqueIDs:", 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKCompanionAgentConnection setCachedPasses:](self, "setCachedPasses:", v3);

}

- (void)_applyPropertiesToPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NPKSettingsPreservingFileDataAccessor *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  NPKStorePathForPaymentPassWithUniqueID(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NPKFlushCFBundleCacheAtURL(v8);
  v9 = -[PKFileDataAccessor initWithFileURL:error:]([NPKSettingsPreservingFileDataAccessor alloc], "initWithFileURL:error:", v8, 0);
  -[NPKSettingsPreservingFileDataAccessor setConnection:](v9, "setConnection:", self);
  -[NPKSettingsPreservingFileDataAccessor setObjectUniqueID:](v9, "setObjectUniqueID:", v5);
  objc_msgSend(v4, "setDataAccessor:", v9);
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      PKScreenScale();
      v14 = 138412546;
      v15 = v5;
      v16 = 2048;
      v17 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Setting screen scale for pass with unique ID %@ to %.2f", (uint8_t *)&v14, 0x16u);
    }

  }
  PKScreenScale();
  objc_msgSend(v4, "setPreferredImageScale:");
  objc_msgSend(v4, "setPreferredImageSuffix:", 0);
  objc_msgSend(v4, "setRemotePass:", 1);

}

- (void)_shouldShowApplePaySettingsForTinkerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  NPKCompanionAgentConnection *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;
  _QWORD block[5];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;

  v4 = a3;
  v5 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  dispatch_group_enter(v5);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke;
  block[3] = &unk_24CFE9510;
  v37 = v38;
  block[4] = self;
  v8 = v5;
  v36 = v8;
  dispatch_async(v6, block);

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  dispatch_group_enter(v8);
  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_2;
  v30[3] = &unk_24CFEB198;
  v30[4] = self;
  v32 = v33;
  v9 = v8;
  v31 = v9;
  dispatch_async(v6, v30);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  dispatch_group_enter(v9);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_4;
  v25[3] = &unk_24CFE8318;
  v27 = v28;
  v10 = v9;
  v26 = v10;
  dispatch_async(v6, v25);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 1;
  dispatch_group_enter(v10);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_5;
  v19[3] = &unk_24CFE9510;
  v21 = self;
  v22 = v23;
  v20 = v10;
  v11 = v10;
  dispatch_async(v6, v19);

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_147;
  v13[3] = &unk_24CFEE088;
  v15 = v38;
  v16 = v33;
  v17 = v28;
  v18 = v23;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], v13);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v38, 8);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  NPKPairedOrPairingDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentAccountForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 != 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_3;
  v4[3] = &unk_24CFECF98;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "paymentPassUniqueIDsSynchronous:reply:", 0, v4);

}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NPKDeviceRegion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NPKShouldAllowPeerPaymentRegistrationForWebService(v2, v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_6;
  v11[3] = &unk_24CFEE4A8;
  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B6780](v11);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getBPSTinkerSupportClass_softClass;
  v18 = getBPSTinkerSupportClass_softClass;
  if (!getBPSTinkerSupportClass_softClass)
  {
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __getBPSTinkerSupportClass_block_invoke;
    v14[3] = &unk_24CFE81D0;
    v14[4] = &v15;
    __getBPSTinkerSupportClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedTinkerFamilyMemeber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "cachedTinkerFamilyMemeber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v8);

  }
  else
  {
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_7;
    v9[3] = &unk_24CFEE4D0;
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v3;
    objc_msgSend(v6, "getActiveTinkerFamilyMemberWithCompletion:", v9);

  }
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "memberType") == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 138412546;
        v12 = v10;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Failed to fetch active tinker family member due to: %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_147(_QWORD *a1)
{
  _BOOL8 v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t result;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) || *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v2 = 1;
  }
  else if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v2 = *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) == 0;
  }
  else
  {
    v2 = 0;
  }
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "no";
      if (v2)
        v6 = "yes";
      v7 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24);
      v12 = 136316162;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      v16 = 1024;
      v17 = v8;
      v18 = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = v10;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Should show Apple Pay settings for Tinker: %s (hasPeerPaymentAccount: %d, hasPaymentPasses %d, isPeerPaymentSupportedInRegion: %d, isTinkerMemberAdult: %d)", (uint8_t *)&v12, 0x24u);
    }

  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v2);
  return result;
}

- (void)_savePaymentPass:(id)a3 atURL:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke;
  v30[3] = &unk_24CFE9350;
  v30[4] = self;
  v15 = v10;
  v31 = v15;
  v16 = v11;
  v32 = v16;
  v17 = v12;
  v33 = v17;
  v18 = v13;
  v34 = v18;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "archiveData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v15, "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_4;
    v27[3] = &unk_24CFEAA70;
    v27[4] = self;
    v28 = v15;
    v29 = v18;
    objc_msgSend(v19, "savePaymentPassData:withUniqueID:forPairingID:completion:", v20, v21, v22, v27);

  }
  else if (v18)
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      pk_Payment_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "uniqueID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v26;
        _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_ERROR, "Error: Unable to get archive data for payment pass with unique ID %@", buf, 0xCu);

      }
    }
    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

uint64_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if (objc_msgSend(*(id *)(a1 + 32), "queueAppropriateFailedActions"))
  {
    +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler](NPKCompanionAgentConnectionDeferredActionHandler, "sharedDeferredActionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    NPKPairedOrPairingDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addDeferredPaymentPass:forDevice:", v3, v4);

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_2;
    v8[3] = &unk_24CFEE520;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v2, "performActionWhenCompanionAgentIsAvailable:forDevice:", v8, *(_QWORD *)(a1 + 56));

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  dispatch_semaphore_t v11;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)a1[4];
  v6 = a1[5];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_3;
  v9[3] = &unk_24CFEE4F8;
  v7 = a1[6];
  v9[4] = a1[7];
  v10 = v5;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v3, "_savePaymentPass:atURL:forDevice:completion:", v10, v6, v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyPropertiesToPass:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_applyPropertiesToPass:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("disable");
      *(_DWORD *)buf = 138412802;
      v16 = self;
      v17 = 2112;
      if (v4)
        v10 = CFSTR("enable");
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did %@ transaction service: %@", buf, 0x20u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  block[3] = &unk_24CFE8FA8;
  block[4] = self;
  v13 = v6;
  v14 = v4;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __91__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didEnableTransactionService:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Transaction source identifier did receive transaction: %@ transaction %@", buf, 0x20u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NPKCompanionAgentConnection_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __81__NPKCompanionAgentConnection_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionSourceIdentifier:didReceiveTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Transaction source identifier did remove transaction: %@, transaction %@", buf, 0x20u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__NPKCompanionAgentConnection_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __94__NPKCompanionAgentConnection_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionSourceIdentifier:didRemoveTransactionWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *cacheQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v22 = self;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update transit pass properties: %@, properties %@", buf, 0x20u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_24CFE7E40;
  block[4] = self;
  v13 = v6;
  v20 = v13;
  dispatch_async(cacheQueue, block);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke_2;
  v16[3] = &unk_24CFE8288;
  v16[4] = self;
  v17 = v13;
  v18 = v7;
  v14 = v7;
  v15 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

uint64_t __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedPassWithUniqueID:", *(_QWORD *)(a1 + 40));
}

void __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didUpdateWithTransitPassProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update balances: %@, balances %@", buf, 0x20u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithBalances___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __85__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithBalances___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didUpdateWithBalances:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v22 = self;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update balance reminder: %@, reminder %@, balance %@", buf, 0x2Au);
    }

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __99__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalance___block_invoke;
  v17[3] = &unk_24CFE8D78;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

void __99__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didUpdateBalanceReminder:forBalance:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update credentials: %@, credentials %@", buf, 0x20u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithCredentials___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __88__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithCredentials___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didUpdateWithCredentials:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = self;
      v16 = 2112;
      v17 = v6;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass with uniqueID:%@ did enable message service:%d", buf, 0x1Cu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  block[3] = &unk_24CFE8FA8;
  block[4] = self;
  v12 = v6;
  v13 = v4;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __87__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPassWithUniqueIdentifier:didEnableMessageService:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (BOOL)pairedWatchHasApplicationWithBundleID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a3;
  if (v3)
  {
    NPKPairedOrPairingDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__NPKCompanionAgentConnection_pairedWatchHasApplicationWithBundleID___block_invoke;
    v11[3] = &unk_24CFEE548;
    v12 = v3;
    v14 = &v15;
    v7 = v5;
    v13 = v7;
    objc_msgSend(v6, "applicationIsInstalledOnPairedDevice:withCompanionBundleID:completion:", v4, v12, v11);

    v8 = dispatch_time(0, 900000000000);
    dispatch_group_wait(v7, v8);
    v9 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __69__NPKCompanionAgentConnection_pairedWatchHasApplicationWithBundleID___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      v8 = *(_QWORD *)(a1 + 32);
      if (a2)
        v7 = CFSTR("YES");
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection app %@ is on gizmo %@", (uint8_t *)&v9, 0x16u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)shouldShowWatchExtensionInstallationForPaymentPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  __CFString *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "supportsBarcodePayment"))
  {
    -[NPKCompanionAgentConnection _installedCompanionApplicationBundleIDForPaymentPass:](self, "_installedCompanionApplicationBundleIDForPaymentPass:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NPKCompanionAgentConnection pairedWatchHasApplicationWithBundleID:](self, "pairedWatchHasApplicationWithBundleID:", v5);
    if (v5)
      v7 = !v6;
    else
      v7 = 0;
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v7)
          v11 = CFSTR("should");
        else
          v11 = CFSTR("should NOT");
        objc_msgSend(v4, "uniqueID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413058;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        v21 = 1024;
        v22 = v5 != 0;
        v23 = 1024;
        v24 = v6;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection %@ show watch extension installation prompt for %@ - hasCompanionApplication: %d, hasWatchApplication: %d.", (uint8_t *)&v17, 0x22u);

      }
    }
LABEL_16:

    goto LABEL_17;
  }
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  LOBYTE(v7) = 0;
  if (v14)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection should NOT show watch extension installation prompt for %@ because it doens't support barcodePayment.", (uint8_t *)&v17, 0xCu);

    }
    LOBYTE(v7) = 0;
    goto LABEL_16;
  }
LABEL_17:

  return v7;
}

- (void)beginPairedWatchInstallationOfApplicationForPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NPKCompanionAgentConnection _installedCompanionApplicationBundleIDForPaymentPass:](self, "_installedCompanionApplicationBundleIDForPaymentPass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection beginning fetching watch app bundleID for %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke;
  v17[3] = &unk_24CFEE598;
  v18 = v7;
  v19 = v12;
  v20 = v8;
  v21 = v6;
  v13 = v6;
  v14 = v8;
  v15 = v12;
  v16 = v7;
  objc_msgSend(v15, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v16, v17);

}

void __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection beginning install of %@", buf, 0xCu);
      }

    }
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke_159;
    v16[3] = &unk_24CFEE570;
    v17 = v5;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "installApplication:onPairedDevice:completion:", v17, v12, v16);

  }
  else
  {
    if (v8)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection failed to find watch app bundleID for %@", buf, 0xCu);
      }

    }
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v6);
  }

}

void __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke_159(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = a2;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection ended install of %@ %li %@", (uint8_t *)&v11, 0x20u);
    }

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 == 0, v5);

}

- (id)_installedCompanionApplicationBundleIDForPaymentPass:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "storeIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithStoreItemIdentifier:error:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue"), 0);
        if (v7)
        {
          v8 = v7;
          objc_msgSend(v7, "bundleIdentifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching pending app redirect url for pass %@", buf, 0x16u);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v12 = v7;
  v18 = v12;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke_2;
  v15[3] = &unk_24CFEE5C0;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "fetchPendingTransactionForPassWithUniqueID:completion:", v6, v15);

}

uint64_t __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  NPKCompanionAgentConnection *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Marking pending transaction as processed for pass %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markPendingTransactionAsProcessedForPassWithUniqueID:", v4);

}

- (void)beginPairedWatchInstallationOfWalletWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a3;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Beginning to request the install of NanoPassbook", buf, 2u);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE045F0]), "initWithBundleID:", CFSTR("com.apple.NanoPassbook"));
  v8 = (void *)MEMORY[0x24BE04540];
  NPKPairedOrPairingDevice();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke;
  v11[3] = &unk_24CFEE5E8;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "installApp:onPairedDevice:withCompletionHandler:", v7, v9, v11);

}

void __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke_2;
  v6[3] = &unk_24CFE7E90;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished requesting the install of NanoPassbook. Error?: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE044A8]) & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v8 == 505)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Process not entitled to install apps on paired device"));
    }
    else
    {

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) != 0);
  return result;
}

- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  NPKCompanionAgentConnection *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x2199B6780](v9);
      *(_DWORD *)buf = 138413058;
      v23 = self;
      v24 = 2048;
      v25 = a3;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Present standalone transaction of type %ld for pass %@ with completion %@", buf, 0x2Au);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __95__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_completion___block_invoke;
  v20[3] = &unk_24CFE7B00;
  v15 = v9;
  v21 = v15;
  -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __95__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_completion___block_invoke_2;
  v18[3] = &unk_24CFE7B58;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "presentStandaloneTransaction:forPassUniqueIdentifier:completion:", a3, v8, v18);

}

uint64_t __95__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *cacheQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NPKCompanionAgentConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): XPC connection to daemon was interrupted", buf, 0xCu);
    }

  }
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NPKCompanionAgentConnection_remoteService_didInterruptConnection___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(cacheQueue, block);
}

uint64_t __68__NPKCompanionAgentConnection_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearCaches");
}

- (void)setQueueAppropriateFailedActions:(BOOL)a3
{
  self->_queueAppropriateFailedActions = a3;
}

- (BOOL)hasQueuedPaymentPasses
{
  return self->_hasQueuedPaymentPasses;
}

- (void)setHasQueuedPaymentPasses:(BOOL)a3
{
  self->_hasQueuedPaymentPasses = a3;
}

- (NPKCompanionAgentConnectionDelegate)delegate
{
  return (NPKCompanionAgentConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableSet)cachedUniqueIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedUniqueIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)cachedPasses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedPasses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)connectionAvailableActions
{
  return self->_connectionAvailableActions;
}

- (void)setConnectionAvailableActions:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAvailableActions, a3);
}

- (PKPaymentWebServiceContext)connectionUnavailableWebServiceContext
{
  return self->_connectionUnavailableWebServiceContext;
}

- (void)setConnectionUnavailableWebServiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUnavailableWebServiceContext, a3);
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

@end
