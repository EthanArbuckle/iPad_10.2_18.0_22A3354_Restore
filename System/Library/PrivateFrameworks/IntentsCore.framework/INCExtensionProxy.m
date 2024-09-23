@implementation INCExtensionProxy

- (id)_initWithConnection:(id)a3 extension:(id)a4 vendorRemote:(id)a5 auditTokenValue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  INCExtensionProxy *v15;
  INCExtensionProxy *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)INCExtensionProxy;
  v15 = -[INCExtensionProxy init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_extension, a4);
    objc_storeStrong((id *)&v16->_vendorRemote, a5);
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_auditTokenValue, a6);
    v16->_shouldCache = 1;
  }

  return v16;
}

- (NSExtension)_extension
{
  return self->_extension;
}

- (INCExtensionConnection)_connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_imageProcessingHandler, 0);
  objc_storeStrong(&self->_imageCachingHandler, 0);
  objc_storeStrong((id *)&self->_auditTokenValue, 0);
  objc_storeStrong((id *)&self->_vendorRemote, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)_isExtensionBeingDebugged
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[INCExtensionProxy _extension](self, "_extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "userElection") >> 8) & 1;

  return v4;
}

- (void)setImageProcessingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  INCExtensionTransactionState *v11;
  void *v12;
  void *v13;
  _INExtensionContextVending *vendorRemote;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "currentIntent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v10);
  v11 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 1, v10, 0, 0);
  objc_msgSend(v9, "setState:", v11);

  -[INCExtensionConnection _startRequestTimerWithExtensionProxy:](self->_connection, "_startRequestTimerWithExtensionProxy:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAF8]), "initWithIntent:parameterNames:", v10, v7);

  -[INCExtensionProxy _connection](self, "_connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestTimeoutInterval");
  objc_msgSend(v12, "setRequestTimeout:");

  vendorRemote = self->_vendorRemote;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke;
  v16[3] = &unk_1E6BC47B0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v12, "executeRemotelyWithVendorRemote:completionHandler:", vendorRemote, v16);

}

- (void)_issueSandboxExtensionsForFileURLsIfNeededToIntent:(id)a3
{
  NSValue *auditTokenValue;
  id v4;
  _OWORD v5[2];

  auditTokenValue = self->_auditTokenValue;
  if (auditTokenValue)
  {
    memset(v5, 0, sizeof(v5));
    v4 = a3;
    -[NSValue getValue:size:](auditTokenValue, "getValue:size:", v5, 32);
    INIssueSandboxExtensionsForFileURLEnumerableToProcess();

  }
}

void __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "updatedIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterResolutionResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[INCExtensionProxy resolveIntentSlotKeyPaths:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s Received slot resolution results from vendor remote: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke_26;
  block[3] = &unk_1E6BC4788;
  v19 = v4;
  v12 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v6;
  v18 = v12;
  v13 = v6;
  v14 = v5;
  dispatch_async(v11, block);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke_26(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_connection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIntent:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_cancelRequestTimer"))
  {
    v3 = *(_QWORD *)(a1 + 56);

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {

  }
}

- (BOOL)shouldResetRequestAfterHandle
{
  void *v2;
  void *v3;
  char v4;

  -[INCExtensionProxy _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldResetRequestAfterHandle");

  return v4;
}

- (void)setShouldResetRequestAfterHandle:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldResetRequestAfterHandle:", v3);

}

- (void)getOptionsForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__INCExtensionProxy_getOptionsForParameterNamed_completionHandler___block_invoke;
    v8[3] = &unk_1E6BC46B8;
    v9 = v6;
    -[INCExtensionProxy getOptionsForParameterNamed:searchTerm:completionHandler:](self, "getOptionsForParameterNamed:searchTerm:completionHandler:", a3, 0, v8);

  }
}

- (void)getOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  INCExtensionTransactionState *v16;
  void *v17;
  void *v18;
  _INExtensionContextVending *vendorRemote;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[INCExtensionProxy _connection](self, "_connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_transaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentIntent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_codableDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributeByName:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "objectClass"))
    {
      -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v13);
      v16 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 1, v13, 0, 0);
      objc_msgSend(v12, "setState:", v16);

      -[INCExtensionConnection _startRequestTimerWithExtensionProxy:](self->_connection, "_startRequestTimerWithExtensionProxy:", self);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD8E0]), "initWithIntent:parameterName:searchTerm:", v13, v8, v9);
      -[INCExtensionProxy _connection](self, "_connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requestTimeoutInterval");
      objc_msgSend(v17, "setRequestTimeout:");

      vendorRemote = self->_vendorRemote;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke;
      v21[3] = &unk_1E6BC46E8;
      v21[4] = self;
      v22 = v8;
      v24 = v10;
      v23 = v15;
      objc_msgSend(v17, "executeRemotelyWithVendorRemote:completionHandler:", vendorRemote, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1400, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);

    }
  }

}

- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INCExtensionTransactionState *v13;
  void *v14;
  void *v15;
  _INExtensionContextVending *vendorRemote;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[INCExtensionProxy _connection](self, "_connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "currentIntent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_codableDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeByName:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "objectClass"))
    {
      -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v10);
      v13 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 1, v10, 0, 0);
      objc_msgSend(v9, "setState:", v13);

      -[INCExtensionConnection _startRequestTimerWithExtensionProxy:](self->_connection, "_startRequestTimerWithExtensionProxy:", self);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD8D8]), "initWithIntent:parameterName:", v10, v6);
      -[INCExtensionProxy _connection](self, "_connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestTimeoutInterval");
      objc_msgSend(v14, "setRequestTimeout:");

      vendorRemote = self->_vendorRemote;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke;
      v18[3] = &unk_1E6BC4738;
      v18[4] = self;
      v19 = v6;
      v20 = v12;
      v21 = v7;
      objc_msgSend(v14, "executeRemotelyWithVendorRemote:completionHandler:", vendorRemote, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1400, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

    }
  }

}

- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  INCExtensionTransactionState *v11;
  void *v12;
  void *v13;
  _INExtensionContextVending *vendorRemote;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  INCExtensionProxy *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[INCExtensionProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "currentIntent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v10);
  v11 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 1, v10, 0, 0);
  objc_msgSend(v9, "setState:", v11);

  -[INCExtensionConnection _startRequestTimerWithExtensionProxy:](self->_connection, "_startRequestTimerWithExtensionProxy:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAF8]), "initWithIntent:parameterName:", v10, v6);
  -[INCExtensionProxy _connection](self, "_connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestTimeoutInterval");
  objc_msgSend(v12, "setRequestTimeout:");

  vendorRemote = self->_vendorRemote;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC4760;
  v18 = v6;
  v19 = self;
  v20 = v7;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v12, "executeRemotelyWithVendorRemote:completionHandler:", vendorRemote, v17);

}

- (void)confirmIntentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  INCExtensionTransactionState *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  NSObject *v21;
  id *v22;
  void (**v23)(_QWORD, _QWORD);
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD);
  void (**v28)(_QWORD, _QWORD);
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentIntent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_executionContext") != 9
    || !-[INCExtensionProxy _isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:](self, "_isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:", v4))
  {
    -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v7);
    v8 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 2, v7, 0, 0);
    objc_msgSend(v6, "setState:", v8);

    v9 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke;
    v32[3] = &unk_1E6BC4828;
    v32[4] = self;
    v10 = v7;
    v33 = v10;
    v35 = v4;
    v34 = v6;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCA5FB8](v32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "privatePlayMediaIntentData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shouldSuppressCommonWholeHouseAudioRoutes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (!v14)
      {
        v29[0] = v9;
        v29[1] = 3221225472;
        v29[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_34;
        v29[3] = &unk_1E6BC4878;
        v16 = v11;
        v31 = v16;
        v17 = v10;
        v30 = v17;
        v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCA5FB8](v29);
        objc_msgSend(v17, "airPlayRouteIds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          ((void (**)(_QWORD, void *))v18)[2](v18, v19);
        }
        else
        {
          objc_msgSend(v17, "hashedRouteUIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            v21 = *MEMORY[0x1E0CBD670];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]";
              v38 = 2112;
              v39 = v20;
              _os_log_impl(&dword_1B727D000, v21, OS_LOG_TYPE_INFO, "%s Have encryptedAirPlayRouteIds: %@, will attempt decoding", buf, 0x16u);
            }
            v26[0] = v9;
            v26[1] = 3221225472;
            v26[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_44;
            v26[3] = &unk_1E6BC48A0;
            v22 = (id *)&v27;
            v27 = v18;
            v28 = v16;
            INCDecodeHashedRouteUIDs(v20, v26);
            v23 = v28;
          }
          else
          {
            v24[0] = v9;
            v24[1] = 3221225472;
            v24[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_46;
            v24[3] = &unk_1E6BC48A0;
            v22 = (id *)v25;
            v25[0] = v18;
            v23 = v16;
            v25[1] = v23;
            __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_46((uint64_t)v24, 0, 0);
          }

        }
        goto LABEL_17;
      }
      v15 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]";
        _os_log_debug_impl(&dword_1B727D000, v15, OS_LOG_TYPE_DEBUG, "%s Suppressing route setting due to intent-based flag", buf, 0xCu);
      }
    }
    v11[2](v11, 0);
LABEL_17:

  }
}

- (void)handleIntentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  INCExtensionTransactionState *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _INExtensionContextVending *vendorRemote;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentIntent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_executionContext") != 9
    || !-[INCExtensionProxy _isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:](self, "_isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:", v4))
  {
    v8 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend(v7, "backingStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]";
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_1B727D000, v9, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);

    }
    -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v7);
    v11 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 4, v7, 0, 0);
    objc_msgSend(v6, "setState:", v11);

    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke;
    v26[3] = &unk_1E6BC48C8;
    v26[4] = self;
    v13 = v7;
    v27 = v13;
    v28 = v6;
    v14 = v4;
    v29 = v14;
    v15 = (void *)MEMORY[0x1BCCA5FB8](v26);
    -[INCExtensionConnection _startRequestTimerWithExtensionProxy:](self->_connection, "_startRequestTimerWithExtensionProxy:", self);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD920]), "initWithIntent:", v13);
    -[INCExtensionProxy _connection](self, "_connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestTimeoutInterval");
    objc_msgSend(v16, "setRequestTimeout:");

    vendorRemote = self->_vendorRemote;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E6BC4940;
    v21[4] = self;
    v22 = v13;
    v23 = v16;
    v24 = v14;
    v25 = v15;
    v19 = v15;
    v20 = v16;
    objc_msgSend(v20, "executeRemotelyWithVendorRemote:completionHandler:", vendorRemote, v21);

  }
}

- (void)startSendingUpdatesToObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transaction");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "currentIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v6);
  v7 = objc_alloc(MEMORY[0x1E0CBDC18]);
  -[INCExtensionProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIntent:endpointProvider:observer:", v6, v8, v4);

  -[INCExtensionProxy _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestTimeoutInterval");
  objc_msgSend(v9, "setRequestTimeout:");

  objc_msgSend(v9, "executeRemotelyWithVendorRemote:completionHandler:", self->_vendorRemote, &__block_literal_global_719);
}

- (void)stopSendingUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[INCExtensionProxy _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_transaction");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentIntent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionProxy _issueSandboxExtensionsForFileURLsIfNeededToIntent:](self, "_issueSandboxExtensionsForFileURLsIfNeededToIntent:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC30]), "initWithIntent:", v4);
  -[INCExtensionProxy _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestTimeoutInterval");
  objc_msgSend(v5, "setRequestTimeout:");

  objc_msgSend(v5, "executeRemotelyWithVendorRemote:completionHandler:", self->_vendorRemote, &__block_literal_global_56);
}

- (void)prewarmAppWithIntent:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  void (**v21)(id, _QWORD, id);
  id v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(a3, "_intents_launchIdForCurrentPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = 0;
  INExtractAppInfoFromSiriLaunchId();
  v8 = 0;

  v22[0] = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, v22);
  v10 = v22[0];
  if (v10)
  {
    v11 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[INCExtensionProxy prewarmAppWithIntent:completionHandler:]";
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1B727D000, v11, OS_LOG_TYPE_ERROR, "%s Unable to create application record: %@", buf, 0x16u);
    }
    v6[2](v6, 0, v10);
  }
  else
  {
    v12 = *MEMORY[0x1E0DAB8A8];
    v23[0] = *MEMORY[0x1E0D22D00];
    v23[1] = v12;
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "supportsMultiwindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[INCExtensionProxy _connection](self, "_connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke;
    block[3] = &unk_1E6BC4BA8;
    v19 = v14;
    v20 = v8;
    v21 = v6;
    v17 = v14;
    dispatch_async(v16, block);

  }
}

- (BOOL)_shouldForwardToAppWithIntent:(id)a3 intentResponse:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "_shouldForwardIntentToApp")
    && (objc_msgSend(v7, "_type") == 1
     || -[INCExtensionProxy _extensionProcessHasEntitlement:](self, "_extensionProcessHasEntitlement:", *MEMORY[0x1E0CBD4B0])))
  {
    v8 = 1;
  }
  else if (objc_msgSend(v7, "_intentResponseCode") == 4)
  {
    v8 = objc_msgSend(v6, "_shouldForwardToAppOnSucccess");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_extensionProcessHasEntitlement:(id)a3
{
  NSValue *auditTokenValue;
  id v4;
  _OWORD v6[2];

  memset(v6, 0, sizeof(v6));
  auditTokenValue = self->_auditTokenValue;
  v4 = a3;
  -[NSValue getValue:size:](auditTokenValue, "getValue:size:", v6, 32);
  LOBYTE(auditTokenValue) = INProcessHasEntitlement();

  return (char)auditTokenValue;
}

- (id)_processIntent:(id)a3 intentResponse:(id)a4 withCacheItems:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  id v28;
  _QWORD v30[4];
  id v31;
  INCExtensionProxy *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v7, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v40 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]";
    v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_1B727D000, v10, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);

  }
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = dispatch_group_create();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        dispatch_group_enter(v12);
        v19 = (void *)MEMORY[0x1E0CBDBA8];
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke;
        v30[3] = &unk_1E6BC4A18;
        v31 = v28;
        v32 = self;
        v33 = v12;
        objc_msgSend(v19, "deserializeCacheItem:completion:", v18, v30);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

  v20 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v12, v20))
  {
    v21 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]";
      v41 = 2112;
      v42 = v26;
      _os_log_error_impl(&dword_1B727D000, v21, OS_LOG_TYPE_ERROR, "%s Image caching timed out for intent:%@", buf, 0x16u);
    }
  }
  if (-[INCExtensionProxy shouldCache](self, "shouldCache", v7))
  {
    objc_msgSend(MEMORY[0x1E0CBD7A0], "sharedCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_intents_updateContainerWithCache:", v22);

  }
  v23 = (void *)objc_msgSend(v28, "copy");

  return v23;
}

- (BOOL)_isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  _QWORD block[4];
  id v16;

  v4 = a3;
  -[INCExtensionProxy _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentIntent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionProxy _extension](self, "_extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_intentsRestrictedWhileProtectedDataUnavailable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "containsObject:", v10))
  {

    goto LABEL_5;
  }
  v11 = INIsDeviceLocked();

  if (!v11)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  -[INCExtensionConnection _queue](self->_connection, "_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__INCExtensionProxy__isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6BC4A40;
  v16 = v4;
  dispatch_async(v12, block);

  v13 = 1;
LABEL_6:

  return v13;
}

- (_INExtensionContextVending)_vendorRemote
{
  return self->_vendorRemote;
}

- (NSValue)_auditTokenValue
{
  return self->_auditTokenValue;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (id)imageCachingHandler
{
  return self->_imageCachingHandler;
}

- (void)setImageCachingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)imageProcessingHandler
{
  return self->_imageProcessingHandler;
}

void __91__INCExtensionProxy__isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD990]), "_initWithCode:userActivity:", 5, 0);
    objc_msgSend(v2, "_setRequiresProtectedData:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v4 = objc_msgSend(*(id *)(a1 + 40), "shouldCache");
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = objc_msgSend(*(id *)(a1 + 40), "shouldCache");
  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CBD7A0], "sharedCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addCacheableObject:", v3);

    }
    goto LABEL_9;
  }
  if (!v4)
  {
LABEL_9:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    goto LABEL_10;
  }
  v6 = v3;
  objc_msgSend(*(id *)(a1 + 40), "imageProcessingHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageProcessingHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke_2;
    v12[3] = &unk_1E6BC49F0;
    v13 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, id, _QWORD *))v8)[2](v8, v6, v12);

  }
  else
  {
    v10 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]_block_invoke";
      _os_log_error_impl(&dword_1B727D000, v10, OS_LOG_TYPE_ERROR, "%s Image caching handler is not set", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CBD7A0], "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addCacheableObject:", v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

LABEL_10:
}

void __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_1B727D000, v4, OS_LOG_TYPE_ERROR, "%s Error processing image : %@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6BC49C8;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "openApplication:withOptions:completion:", v4, v3, v5);

}

uint64_t __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  INCExtensionTransactionState *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_processIntent:intentResponse:withCacheItems:", *(_QWORD *)(a1 + 40), v10, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 5, *(_QWORD *)(a1 + 40), v10, v5);
  objc_msgSend(v6, "setState:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_cancelRequestTimer"))
  {
    v9 = *(_QWORD *)(a1 + 56);

    if (v9)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {

  }
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "intentResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke_2";
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Received handle response from vendor remote: %@", buf, 0x16u);
  }
  objc_msgSend(a1[4], "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1[4], "responseHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  objc_msgSend(a1[4], "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_49;
  v14[3] = &unk_1E6BC4918;
  v15 = v5;
  v16 = a1[5];
  v21 = a1[7];
  v17 = a1[4];
  v18 = v4;
  v19 = a1[6];
  v22 = a1[8];
  v20 = v3;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  dispatch_async(v10, v14);

}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  INCExtensionError *v5;
  void *v6;
  id v7;
  void *v8;
  INCExtensionError *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "_shouldForwardToAppWithIntent:intentResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)))
    {
      v10 = *(_QWORD *)(a1 + 88);
      v11 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 72), "cacheItems");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);

      return;
    }
    objc_msgSend(*(id *)(a1 + 64), "setAllowsScenelessAppLaunch:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_intents_launchIdForCurrentPlatform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    INExtractAppInfoFromSiriLaunchId();
    v7 = 0;

    if (v7
      && (objc_msgSend(*(id *)(a1 + 48), "_vendorRemote"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      v9 = (INCExtensionError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD740]), "initWithBundleIdentifier:intentForwardingAction:", v7, *(_QWORD *)(a1 + 64));
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_51;
      v17[3] = &unk_1E6BC48F0;
      v18 = *(id *)(a1 + 40);
      v19 = *(id *)(a1 + 32);
      v20 = *(id *)(a1 + 80);
      v21 = *(id *)(a1 + 88);
      -[INCExtensionError deliverIntentForwardingActionWithResponseHandler:](v9, "deliverIntentForwardingActionWithResponseHandler:", v17);

    }
    else
    {
      v12 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
        v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_1B727D000, v12, OS_LOG_TYPE_ERROR, "%s No application id was found to handle intent %@", buf, 0x16u);
      }
      v13 = *(_QWORD *)(a1 + 80);
      if (!v13)
        goto LABEL_16;
      v9 = -[INCExtensionError initWithErrorCode:underlyingError:]([INCExtensionError alloc], "initWithErrorCode:underlyingError:", 1315, 0);
      (*(void (**)(uint64_t, _QWORD, INCExtensionError *))(v13 + 16))(v13, 0, v9);
    }

LABEL_16:
    return;
  }
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
    v25 = 2112;
    v26 = v14;
    v27 = 2114;
    v28 = v2;
    _os_log_error_impl(&dword_1B727D000, v3, OS_LOG_TYPE_ERROR, "%s Got error when vendor remote is trying to handle intent %@: %{public}@", buf, 0x20u);
  }
  v4 = *(_QWORD *)(a1 + 80);
  if (v4)
  {
    v5 = -[INCExtensionError initWithErrorCode:underlyingError:]([INCExtensionError alloc], "initWithErrorCode:underlyingError:", 1399, *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, _QWORD, INCExtensionError *))(v4 + 16))(v4, 0, v5);

  }
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_51(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  INCExtensionError *v7;
  void *v8;
  INCExtensionError *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      v13 = a1[5];
      v14 = 136315650;
      v15 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
      v16 = 2112;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_1B727D000, v5, OS_LOG_TYPE_ERROR, "%s Got error when application is trying to handle intent %@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    v6 = a1[6];
    if (v6)
    {
      v7 = [INCExtensionError alloc];
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[INCExtensionError initWithErrorCode:underlyingError:](v7, "initWithErrorCode:underlyingError:", 1399, v8);
      (*(void (**)(uint64_t, _QWORD, INCExtensionError *))(v6 + 16))(v6, 0, v9);

    }
  }
  else
  {
    v10 = a1[7];
    objc_msgSend(v3, "intentResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_startRequestTimerWithExtensionProxy:", *(_QWORD *)(a1 + 32));

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD808]), "initWithIntent:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestTimeoutInterval");
  objc_msgSend(v3, "setRequestTimeout:");

  objc_msgSend(*(id *)(a1 + 32), "_vendorRemote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6BC4800;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "executeRemotelyWithVendorRemote:completionHandler:", v5, v7);

}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (INIsHomepod() && (_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      _os_log_debug_impl(&dword_1B727D000, v4, OS_LOG_TYPE_DEBUG, "%s Suppressing route setting, leaving it to extension to handle", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setAirPlayRouteIds:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = (os_log_t *)MEMORY[0x1E0CBD670];
    v6 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      _os_log_debug_impl(&dword_1B727D000, v6, OS_LOG_TYPE_DEBUG, "%s Routing audio to airplay output devices", buf, 0xCu);
    }
    v7 = objc_msgSend(v3, "count");
    v8 = os_signpost_id_generate(*v5);
    v9 = *v5;
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v16) = v7;
      _os_signpost_emit_with_name_impl(&dword_1B727D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "INSignpostSiriAirPlayRouteSetup", " routeIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_37;
    v11[3] = &unk_1E6BC4850;
    v13 = v8;
    v14 = v7;
    v12 = *(id *)(a1 + 40);
    INCRouteAudioToAirplayOutputDevices(v3, v11);

  }
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s Have decryptedRouteUIDs: %@, will attempt to set route", (uint8_t *)&v9, 0x16u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s Have group deviceUIDs: %@, will attempt to set route", (uint8_t *)&v9, 0x16u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_37(_QWORD *a1, int a2, void *a3)
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0CBD670];
  v7 = (id)*MEMORY[0x1E0CBD670];
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = a1[6];
    v14 = 67240192;
    LODWORD(v15) = v10;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "INSignpostSiriAirPlayRouteSetup", " routeIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v14, 8u);
  }

  v11 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = CFSTR("Unsuccessfully");
    if (a2)
      v13 = CFSTR("Successfully");
    v14 = 136315394;
    v15 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
    v16 = 2114;
    v17 = v13;
    _os_log_debug_impl(&dword_1B727D000, v11, OS_LOG_TYPE_DEBUG, "%s %{public}@ routed output to airplay devices, continuing to confirm intent", (uint8_t *)&v14, 0x16u);
  }
  if (a2)
    v12 = 0;
  else
    v12 = v5;
  (*(void (**)(_QWORD, id))(a1[4] + 16))(a1[4], v12);

}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "intentResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke_2";
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Received confirm response from vendor remote: %@", buf, 0x16u);
  }
  objc_msgSend(a1[4], "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1[4], "responseHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  if (objc_msgSend(v4, "_type") == 1 && objc_msgSend(v4, "_intentResponseCode") == 4)
    objc_msgSend(v4, "_setCode:", objc_msgSend((id)objc_opt_class(), "_codeFromIntentResponseCode:", 1));
  if (objc_msgSend(a1[5], "_executionContext") == 8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setNowPlayingInfo:", 0);
  }
  objc_msgSend(a1[4], "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_29;
  block[3] = &unk_1E6BC47D8;
  v16 = v5;
  v17 = a1[5];
  v11 = a1[7];
  v18 = a1[4];
  v19 = v4;
  v22 = v11;
  v20 = v3;
  v21 = a1[6];
  v12 = v3;
  v13 = v4;
  v14 = v5;
  dispatch_async(v10, block);

}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  INCExtensionError *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  INCExtensionTransactionState *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v17 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v14;
      v20 = 2114;
      v21 = v2;
      _os_log_error_impl(&dword_1B727D000, v3, OS_LOG_TYPE_ERROR, "%s Got error when vendor remote is trying to confirm intent %@: %{public}@", buf, 0x20u);
    }
    v4 = *(_QWORD *)(a1 + 80);
    if (v4)
    {
      v5 = -[INCExtensionError initWithErrorCode:underlyingError:]([INCExtensionError alloc], "initWithErrorCode:underlyingError:", 1399, *(_QWORD *)(a1 + 32));
      (*(void (**)(uint64_t, _QWORD, INCExtensionError *))(v4 + 16))(v4, 0, v5);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "cacheItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_processIntent:intentResponse:withCacheItems:", v7, v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 72);
    v11 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:]([INCExtensionTransactionState alloc], "initWithType:intent:intentResponse:userActivities:", 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v15);
    objc_msgSend(v10, "setState:", v11);

    objc_msgSend(*(id *)(a1 + 48), "_connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "_cancelRequestTimer"))
    {
      v13 = *(_QWORD *)(a1 + 80);

      if (v13)
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {

    }
  }
}

void __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "parameterResolutionResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[INCExtensionProxy resolveIntentSlotKeyPath:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Received slot resolution result from vendor remote", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  objc_msgSend(*(id *)(a1 + 40), "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke_22;
  block[3] = &unk_1E6BC4BA8;
  v11 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v14 = v5;
  v15 = v11;
  v12 = v5;
  dispatch_async(v10, block);

}

void __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  __CFString *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_cancelRequestTimer"))
  {
    v2 = *(_QWORD *)(a1 + 48);

    if (v2)
    {
      v3 = (id)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(a1 + 40);
        if (v4)
          v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDD38]), "initWithData:", *(_QWORD *)(a1 + 40));
        else
          v5 = CFSTR("no data");
        *(_DWORD *)buf = 136315394;
        v8 = "-[INCExtensionProxy resolveIntentSlotKeyPath:completionHandler:]_block_invoke";
        v9 = 2112;
        v10 = v5;
        _os_log_impl(&dword_1B727D000, v3, OS_LOG_TYPE_INFO, "%s resolutionResultData = %@", buf, 0x16u);
        if (v4)

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {

  }
}

void __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "archivedDefaultValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6BC4710;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v4;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v9 = v4;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cancelRequestTimer");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v36 = "-[INCExtensionProxy getDefaultValueForParameterNamed:completionHandler:]_block_invoke_2";
        v37 = 2112;
        v38 = v27;
        v39 = 2112;
        v40 = v4;
        _os_log_error_impl(&dword_1B727D000, v5, OS_LOG_TYPE_ERROR, "%s Error getting default value for parameter name: %@ - %@", buf, 0x20u);
      }
    }
    if (!*(_QWORD *)(a1 + 56))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      return;
    }
    v6 = objc_alloc_init(MEMORY[0x1E0CBD9B8]);
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    v33 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v14, v15, &v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v33;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(v6, "decodeWithCodableAttribute:from:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "if_addObjectIfNonNil:", v24);

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v21);
      }

      v25 = (void *)objc_msgSend(v18, "copy");
      if (!v17)
        goto LABEL_20;
    }
    else
    {
      objc_msgSend(v6, "decodeWithCodableAttribute:from:", *(_QWORD *)(a1 + 64), v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_20:
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

        return;
      }
    }
    v26 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v28 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v36 = "-[INCExtensionProxy getDefaultValueForParameterNamed:completionHandler:]_block_invoke";
      v37 = 2112;
      v38 = v17;
      v39 = 2112;
      v40 = v28;
      _os_log_error_impl(&dword_1B727D000, v26, OS_LOG_TYPE_ERROR, "%s Error unarchiving default value: %@. Parameter name: %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
}

void __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "archivedObjectCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6BC4710;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v16 = *(id *)(a1 + 56);
  v14 = v4;
  v15 = *(id *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cancelRequestTimer");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v15 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v20 = "-[INCExtensionProxy getOptionsForParameterNamed:searchTerm:completionHandler:]_block_invoke_2";
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v4;
        _os_log_error_impl(&dword_1B727D000, v5, OS_LOG_TYPE_ERROR, "%s Error getting options for parameter: %@ - %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else if (*(_QWORD *)(a1 + 56))
    {
      v6 = (void *)MEMORY[0x1E0CB3710];
      v7 = objc_opt_class();
      v8 = *(_QWORD *)(a1 + 56);
      v18 = 0;
      objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      if (v10)
      {
        v11 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315650;
          v20 = "-[INCExtensionProxy getOptionsForParameterNamed:searchTerm:completionHandler:]_block_invoke";
          v21 = 2112;
          v22 = v10;
          v23 = 2112;
          v24 = v16;
          _os_log_error_impl(&dword_1B727D000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchiving options: %@. Parameter name: %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }
      else
      {
        objc_msgSend(v9, "_typedObjectCollectionWithCodableAttribute:", *(_QWORD *)(a1 + 64));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

      }
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 72);
      v13 = objc_alloc(MEMORY[0x1E0CBDA10]);
      v17 = (id)objc_msgSend(v13, "initWithItems:", MEMORY[0x1E0C9AA60]);
      (*(void (**)(uint64_t))(v12 + 16))(v12);

    }
  }
}

void __67__INCExtensionProxy_getOptionsForParameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "allItems");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
