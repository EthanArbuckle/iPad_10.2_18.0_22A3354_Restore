@implementation AASetupAssistantService

+ (id)urlConfiguration
{
  AASetupAssistantConfigRequest *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v2 = objc_alloc_init(AASetupAssistantConfigRequest);
  -[AARequest setFlushCache:](v2, "setFlushCache:", __flushURLConfigCache);
  __flushURLConfigCache = 0;
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AASetupAssistantService_urlConfiguration__block_invoke;
  v7[3] = &unk_1E416E478;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[AARequest performRequestWithHandler:](v2, "performRequestWithHandler:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __43__AASetupAssistantService_urlConfiguration__block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)resetURLConfiguration
{
  __flushURLConfigCache = 1;
}

- (AASetupAssistantService)init
{
  AASetupAssistantService *v2;
  NSOperationQueue *v3;
  NSOperationQueue *requesterQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AASetupAssistantService;
  v2 = -[AASetupAssistantService init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;

  }
  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  AASetupAssistantService *v8;
  uint64_t v9;
  NSString *appleID;
  uint64_t v11;
  NSString *password;

  v6 = a3;
  v7 = a4;
  v8 = -[AASetupAssistantService init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    password = v8->_password;
    v8->_password = (NSString *)v11;

  }
  return v8;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5;
  AASetupAssistantService *v6;
  AASetupAssistantService *v7;
  void *v8;
  uint64_t v9;
  NSString *appleID;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *password;

  v5 = a3;
  v6 = -[AASetupAssistantService init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    objc_msgSend(v5, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    appleID = v7->_appleID;
    v7->_appleID = (NSString *)v9;

    -[ACAccount credential](v7->_account, "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    password = v7->_password;
    v7->_password = (NSString *)v13;

  }
  return v7;
}

- (void)dealloc
{
  OpaqueCFHTTPCookieStorage *cookieStorage;
  objc_super v4;

  cookieStorage = self->_cookieStorage;
  if (cookieStorage)
    CFRelease(cookieStorage);
  v4.receiver = self;
  v4.super_class = (Class)AASetupAssistantService;
  -[AASetupAssistantService dealloc](&v4, sel_dealloc);
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  OpaqueCFHTTPCookieStorage *cookieStorage;

  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage)
      CFRelease(cookieStorage);
    self->_cookieStorage = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)downloadURLConfiguration:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_queue_create("urlConfigurationQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AASetupAssistantService_downloadURLConfiguration___block_invoke;
  block[3] = &unk_1E416E4A0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __52__AASetupAssistantService_downloadURLConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)authenticateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_queue_create("authenticationRequestQueue", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke;
  v7[3] = &unk_1E416E4C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  AASetupAssistantAuthenticateRequest *v3;
  _QWORD *v4;
  AASetupAssistantAuthenticateRequest *v5;
  AADeviceProvisioningSession *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = [AASetupAssistantAuthenticateRequest alloc];
  v4 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v5 = -[AAAuthenticateRequest initWithAccount:](v3, "initWithAccount:", v4[5]);
    v6 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v6, "addProvisioningInfoToAARequest:", v5);
  }
  else
  {
    objc_msgSend(v4, "appleID");
    v6 = (AADeviceProvisioningSession *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AAAuthenticateRequest initWithUsername:password:](v3, "initWithUsername:password:", v6, v7);

  }
  -[AARequest setCookieStorage:](v5, "setCookieStorage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke_2;
  v8[3] = &unk_1E416E208;
  v9 = *(id *)(a1 + 40);
  -[AARequest performRequestWithHandler:](v5, "performRequestWithHandler:", v8);

}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__AASetupAssistantService_authenticateWithHandler___block_invoke_3;
  v6[3] = &unk_1E416E4C8;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __51__AASetupAssistantService_authenticateWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "error");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AASetupAssistantService_createAppleIDWithParameters_handler___block_invoke;
  v8[3] = &unk_1E416E4F0;
  v9 = v6;
  v7 = v6;
  -[AASetupAssistantService createAppleIDWithParameters:handlerWithResponse:](self, "createAppleIDWithParameters:handlerWithResponse:", a3, v8);

}

uint64_t __63__AASetupAssistantService_createAppleIDWithParameters_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  return result;
}

- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AASetupAssistantService *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("createAppleIDQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke;
  block[3] = &unk_1E416E518;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  AASetupAssistantCreateRequest *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  AASetupAssistantCreateRequest *v10;
  void *v11;
  void *v12;
  AADeviceProvisioningSession *v13;
  _QWORD v14[4];
  id v15;

  v2 = (void *)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(a1[5], "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("apple-id"));

  objc_msgSend(a1[5], "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("password"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("client-id"));

  v6 = [AASetupAssistantCreateRequest alloc];
  v7 = a1[5];
  v8 = v7[5];
  objc_msgSend(v7, "_signingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AASetupAssistantCreateRequest initWithAccount:withAppleIDParameters:signingSession:](v6, "initWithAccount:withAppleIDParameters:signingSession:", v8, v2, v9);

  v11 = (void *)*((_QWORD *)a1[5] + 5);
  if (v11)
  {
    objc_msgSend(v11, "aa_personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *((_QWORD *)a1[5] + 5));
      -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v13, "addProvisioningInfoToAARequest:", v10);

    }
  }
  -[AARequest setCookieStorage:](v10, "setCookieStorage:", *((_QWORD *)a1[5] + 6));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke_2;
  v14[3] = &unk_1E416E208;
  v15 = a1[6];
  -[AARequest performRequestWithHandler:](v10, "performRequestWithHandler:", v14);

}

void __75__AASetupAssistantService_createAppleIDWithParameters_handlerWithResponse___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _DWORD v22[2];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "statusCode") != 401)
  {
    if (!v6)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v8 = v7;
      goto LABEL_13;
    }
    v12 = v6;
    objc_msgSend(v12, "status");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          objc_msgSend(v12, "status"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "intValue"),
          v15,
          v14,
          !v16))
    {
      objc_msgSend(v12, "personID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
    }
    else
    {
      objc_msgSend(v12, "statusMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "statusMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);

        v19 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v12, "status");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), (int)objc_msgSend(v20, "intValue"), v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v10 = 0;
        v11 = 0;
        goto LABEL_12;
      }
      v9 = 0;
      v11 = 0;
    }
    v8 = v7;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), 401, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v7;
LABEL_12:

LABEL_13:
  _AALogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109378;
    v22[1] = v11;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v22, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AASetupAssistantService *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("updateAppleIDQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke;
  block[3] = &unk_1E416E518;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  AASetupAssistantUpdateRequest *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  AASetupAssistantUpdateRequest *v10;
  _QWORD *v11;
  AADeviceProvisioningSession *v12;
  _QWORD v13[4];
  id v14;

  v2 = (void *)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(a1[5], "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("apple-id"));

  objc_msgSend(a1[5], "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("password"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("client-id"));

  v6 = [AASetupAssistantUpdateRequest alloc];
  v7 = a1[5];
  v8 = v7[5];
  objc_msgSend(v7, "_signingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AASetupAssistantCreateRequest initWithAccount:withAppleIDParameters:signingSession:](v6, "initWithAccount:withAppleIDParameters:signingSession:", v8, v2, v9);

  v11 = a1[5];
  if (v11[5])
  {
    v12 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *((_QWORD *)a1[5] + 5));
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v12, "addProvisioningInfoToAARequest:", v10);

    v11 = a1[5];
  }
  -[AARequest setCookieStorage:](v10, "setCookieStorage:", v11[6]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke_2;
  v13[3] = &unk_1E416E208;
  v14 = a1[6];
  -[AARequest performRequestWithHandler:](v10, "performRequestWithHandler:", v13);

}

void __63__AASetupAssistantService_updateAppleIDWithParameters_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _DWORD v25[2];
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v22 = 0;
    v16 = 0;
    v23 = 0;
    v21 = v9;
    goto LABEL_11;
  }
  v11 = v8;
  objc_msgSend(v11, "status");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    if (!v15)
    {
      objc_msgSend(v11, "personID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v11, "statusMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v22 = 0;
    v23 = 0;
LABEL_9:
    v21 = v10;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);

  v19 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v11, "status");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), (int)objc_msgSend(v20, "intValue"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v16 = 0;
  v23 = 0;
LABEL_10:

LABEL_11:
  _AALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 67109378;
    v25[1] = v23;
    v26 = 2112;
    v27 = v21;
    _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v25, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AASetupAssistantService *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("setupDelegateAccountsQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke;
  block[3] = &unk_1E416E518;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AASetupAssistantSetupDelegatesRequest *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  AASetupAssistantSetupDelegatesRequest *v11;
  uint64_t v12;
  AADeviceProvisioningSession *v13;
  _QWORD v14[4];
  id v15;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("delegates"));
  objc_msgSend(*(id *)(a1 + 40), "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("apple-id"));

  objc_msgSend(*(id *)(a1 + 40), "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("password"));

  objc_msgSend(*(id *)(a1 + 40), "emailChoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("email-choice"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("client-id"));

  v7 = [AASetupAssistantSetupDelegatesRequest alloc];
  v8 = *(_QWORD **)(a1 + 40);
  v9 = v8[5];
  objc_msgSend(v8, "_signingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AASetupAssistantSetupDelegatesRequest initWithAccount:withSetupParameters:signingSession:](v7, "initWithAccount:withSetupParameters:signingSession:", v9, v2, v10);

  v12 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v12 + 40))
  {
    v13 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v13, "addProvisioningInfoToAARequest:", v11);

    v12 = *(_QWORD *)(a1 + 40);
  }
  -[AARequest setCookieStorage:](v11, "setCookieStorage:", *(_QWORD *)(v12 + 48));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke_2;
  v14[3] = &unk_1E416E208;
  v15 = *(id *)(a1 + 48);
  -[AARequest performRequestWithHandler:](v11, "performRequestWithHandler:", v14);

}

void __71__AASetupAssistantService_setupDelegateAccountsWithParameters_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v22 = 0;
    v21 = v9;
    goto LABEL_11;
  }
  v11 = v8;
  objc_msgSend(v11, "status");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    if (!v15)
    {
      objc_msgSend(v11, "responseParameters");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend(v11, "statusMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v22 = 0;
LABEL_9:
    v21 = v10;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);

  v19 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v11, "status");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), (int)objc_msgSend(v20, "intValue"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
LABEL_10:

LABEL_11:
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v21;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters calling handler with error %@", (uint8_t *)&v24, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AASetupAssistantService *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("loginDelegatesQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke;
  block[3] = &unk_1E416E518;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AALoginOrCreateDelegatesRequest *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  AALoginOrCreateDelegatesRequest *v11;
  uint64_t v12;
  AADeviceProvisioningSession *v13;
  _QWORD v14[4];
  id v15;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("delegates"));
  objc_msgSend(*(id *)(a1 + 40), "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("apple-id"));

  objc_msgSend(*(id *)(a1 + 40), "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("password"));

  objc_msgSend(*(id *)(a1 + 40), "emailChoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("email-choice"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("client-id"));

  v7 = [AALoginOrCreateDelegatesRequest alloc];
  v8 = *(_QWORD **)(a1 + 40);
  v9 = v8[5];
  objc_msgSend(v8, "_signingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AALoginOrCreateDelegatesRequest initWithAccount:parameters:signingSession:](v7, "initWithAccount:parameters:signingSession:", v9, v2, v10);

  v12 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v12 + 40))
  {
    v13 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v13, "addProvisioningInfoToAARequest:", v11);

    v12 = *(_QWORD *)(a1 + 40);
  }
  -[AARequest setCookieStorage:](v11, "setCookieStorage:", *(_QWORD *)(v12 + 48));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke_2;
  v14[3] = &unk_1E416E208;
  v15 = *(id *)(a1 + 48);
  -[AARequest performRequestWithHandler:](v11, "performRequestWithHandler:", v14);

}

void __67__AASetupAssistantService_loginDelegatesWithParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "status");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13
      || (v14 = (void *)v13,
          objc_msgSend(v10, "status"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "intValue"),
          v15,
          v14,
          v12 = v11,
          v16))
    {
      objc_msgSend(v10, "statusMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v11;
      if (v17)
      {
        v25 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(v10, "statusMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v10, "status");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), (int)objc_msgSend(v21, "intValue"), v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v12;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters calling completion handler with error %@", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithHandler___block_invoke;
  v6[3] = &unk_1E416E540;
  v7 = v4;
  v5 = v4;
  -[AASetupAssistantService upgradeiCloudTermsIfNecessaryWithCustomHeaders:handler:](self, "upgradeiCloudTermsIfNecessaryWithCustomHeaders:handler:", 0, v6);

}

uint64_t __68__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self->_account)
  {
    v8 = dispatch_queue_create("upgradeTermsQueue", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke;
    block[3] = &unk_1E416E518;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Error: No AppleAccount set on AASetupAssistant Service", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }

}

void __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke(uint64_t a1)
{
  AASetupAssistantTermsFetchRequest *v2;
  AADeviceProvisioningSession *v3;
  _QWORD v4[4];
  id v5;

  v2 = -[AASetupAssistantTermsFetchRequest initWithAccount:]([AASetupAssistantTermsFetchRequest alloc], "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v3 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v3, "addProvisioningInfoToAARequest:", v2);

  }
  if (*(_QWORD *)(a1 + 40))
    -[AARequest setCustomHeaders:](v2, "setCustomHeaders:");
  -[AARequest setCookieStorage:](v2, "setCookieStorage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke_2;
  v4[3] = &unk_1E416E208;
  v5 = *(id *)(a1 + 48);
  -[AARequest performRequestWithHandler:](v2, "performRequestWithHandler:", v4);

}

void __82__AASetupAssistantService_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "xmlUIData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "We got the new iCloud Terms from the server", (uint8_t *)&v12, 2u);
      }
    }
    else if (v10)
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AASetupAssistantUpgradeStatusRequest *v10;
  AADeviceProvisioningSession *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AASetupAssistantService appleID](self, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("apple-id"));

  -[AASetupAssistantService password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("password"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("client-id"));

  v10 = -[AASetupAssistantUpgradeStatusRequest initWithAccount:]([AASetupAssistantUpgradeStatusRequest alloc], "initWithAccount:", self->_account);
  if (self->_account)
  {
    v11 = -[AADeviceProvisioningSession initWithAccount:]([AADeviceProvisioningSession alloc], "initWithAccount:", self->_account);
    -[AADeviceProvisioningSession addProvisioningInfoToAARequest:](v11, "addProvisioningInfoToAARequest:", v10);

  }
  -[AARequest setCookieStorage:](v10, "setCookieStorage:", self->_cookieStorage);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__AASetupAssistantService_shouldPresentUpgradeFlowWithCompletion___block_invoke;
  v13[3] = &unk_1E416E208;
  v14 = v4;
  v12 = v4;
  -[AARequest performRequestWithHandler:](v10, "performRequestWithHandler:", v13);

}

void __66__AASetupAssistantService_shouldPresentUpgradeFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v8, "upgradeStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "We got the upgrade status from the server", (uint8_t *)&v14, 2u);
      }

      (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v9, "BOOLValue"), v7);
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v8, "responseDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status failed with error: %@ response: %@", (uint8_t *)&v14, 0x16u);

      }
      (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, v7);
    }

  }
  else
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status got no response and error: %@", (uint8_t *)&v14, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)_signingSession
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  AASigningSession *signingSession;
  NSDate *v8;
  NSDate *signingSessionCreationDate;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AASigningSession *v14;
  AASigningSession *v15;
  AASigningSession *v16;
  NSObject *v17;
  NSObject *v18;
  AASigningSession *v19;
  id v21;
  uint8_t buf[4];
  AASigningSession *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_signingSession)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_signingSessionCreationDate);
  v5 = v4;

  if (v5 > 540.0)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "shared signing session expired. creating a new signing session.", buf, 2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0;

  }
  if (!self->_signingSession)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v8;

    +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingSessionCertURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "signingSessionURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    +[AASigningSession establishedSessionWithCertURL:sessionURL:error:](AASigningSession, "establishedSessionWithCertURL:sessionURL:error:", v11, v13, &v21);
    v14 = (AASigningSession *)objc_claimAutoreleasedReturnValue();
    v15 = (AASigningSession *)v21;
    v16 = self->_signingSession;
    self->_signingSession = v14;

    if (v15)
    {
      _AALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }

    }
  }
  _AALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  return self->_signingSession;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  void *v9;
  AADeviceProvisioningSession *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  void *v17;
  __int16 v18;
  __int16 v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASetupAssistantService.m"), 479, CFSTR("No DSID passed"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASetupAssistantService.m"), 480, CFSTR("No data passed"));

LABEL_3:
  v10 = -[AADeviceProvisioningSession initWithDSID:]([AADeviceProvisioningSession alloc], "initWithDSID:", v7);
  -[AADeviceProvisioningSession setCookieStorageRef:](v10, "setCookieStorageRef:", self->_cookieStorage);
  v11 = -[AADeviceProvisioningSession provisionDeviceWithData:](v10, "provisionDeviceWithData:", v9);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v19 = 0;
      v14 = "Device provisioning failed";
      v15 = (uint8_t *)&v19;
LABEL_8:
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else if (v13)
  {
    v18 = 0;
    v14 = "Device provisioning completed sucessfully";
    v15 = (uint8_t *)&v18;
    goto LABEL_8;
  }

}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  void *v9;
  AADeviceProvisioningSession *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  void *v17;
  __int16 v18;
  __int16 v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASetupAssistantService.m"), 496, CFSTR("No DSID passed"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASetupAssistantService.m"), 497, CFSTR("No data passed"));

LABEL_3:
  v10 = -[AADeviceProvisioningSession initWithDSID:]([AADeviceProvisioningSession alloc], "initWithDSID:", v7);
  -[AADeviceProvisioningSession setCookieStorageRef:](v10, "setCookieStorageRef:", self->_cookieStorage);
  v11 = -[AADeviceProvisioningSession synchronizeProvisioningWithData:](v10, "synchronizeProvisioningWithData:", v9);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v19 = 0;
      v14 = "Device provisioning sync failed";
      v15 = (uint8_t *)&v19;
LABEL_8:
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else if (v13)
  {
    v18 = 0;
    v14 = "Device provisioning sync completed successfully";
    v15 = (uint8_t *)&v18;
    goto LABEL_8;
  }

}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  id v5;
  AADeviceProvisioningSession *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASetupAssistantService.m"), 512, CFSTR("No DSID passed"));

  }
  v6 = -[AADeviceProvisioningSession initWithDSID:]([AADeviceProvisioningSession alloc], "initWithDSID:", v5);
  v7 = -[AADeviceProvisioningSession eraseProvisioning](v6, "eraseProvisioning");
  if (v7)
  {
    v8 = v7;
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v8;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Something went wrong when trying to erase the device provisioning: %d", (uint8_t *)v11, 8u);
    }

  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)emailChoice
{
  return self->_emailChoice;
}

- (void)setEmailChoice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSessionCreationDate, 0);
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_emailChoice, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_requesterQueue, 0);
}

@end
