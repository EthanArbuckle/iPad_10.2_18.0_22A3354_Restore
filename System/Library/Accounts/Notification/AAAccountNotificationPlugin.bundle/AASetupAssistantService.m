@implementation AASetupAssistantService

+ (id)urlConfiguration
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_230EA5578;
  v20 = sub_230EA5588;
  v21 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BE04A28]);
  objc_msgSend_setFlushCache_(v2, v3, byte_255EAA480, v4, v5);
  byte_255EAA480 = 0;
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_230EA5590;
  v13[3] = &unk_24FF9CFC8;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend_performRequestWithHandler_(v2, v8, (uint64_t)v13, v9, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (void)resetURLConfiguration
{
  byte_255EAA480 = 1;
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
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;

  }
  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AASetupAssistantService *v16;
  uint64_t v17;
  NSString *appleID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *password;

  v6 = a3;
  v7 = a4;
  v16 = (AASetupAssistantService *)objc_msgSend_init(self, v8, v9, v10, v11);
  if (v16)
  {
    v17 = objc_msgSend_copy(v6, v12, v13, v14, v15);
    appleID = v16->_appleID;
    v16->_appleID = (NSString *)v17;

    v23 = objc_msgSend_copy(v7, v19, v20, v21, v22);
    password = v16->_password;
    v16->_password = (NSString *)v23;

  }
  return v16;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AASetupAssistantService *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *appleID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString *password;

  v5 = a3;
  v10 = objc_msgSend_init(self, v6, v7, v8, v9);
  v11 = (AASetupAssistantService *)v10;
  if (v10)
  {
    objc_storeStrong((id *)(v10 + 40), a3);
    objc_msgSend_username(v5, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_copy(v16, v17, v18, v19, v20);
    appleID = v11->_appleID;
    v11->_appleID = (NSString *)v21;

    objc_msgSend_credential(v11->_account, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_copy(v32, v33, v34, v35, v36);
    password = v11->_password;
    v11->_password = (NSString *)v37;

  }
  return v11;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230EA58A0;
  block[3] = &unk_24FF9CFF0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230EA5988;
  v7[3] = &unk_24FF9D018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230EA5C20;
  v10[3] = &unk_24FF9D068;
  v11 = v6;
  v7 = v6;
  objc_msgSend_createAppleIDWithParameters_handlerWithResponse_(self, v8, (uint64_t)a3, (uint64_t)v10, v9);

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
    _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("createAppleIDQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230EA5D3C;
  block[3] = &unk_24FF9D090;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

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
    _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("updateAppleIDQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230EA627C;
  block[3] = &unk_24FF9D090;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

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
    _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("setupDelegateAccountsQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230EA6774;
  block[3] = &unk_24FF9D090;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

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
    _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  v9 = dispatch_queue_create("loginDelegatesQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230EA6C60;
  block[3] = &unk_24FF9D090;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_230EA70AC;
  v8[3] = &unk_24FF9D0B8;
  v9 = v4;
  v5 = v4;
  objc_msgSend_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler_(self, v6, 0, (uint64_t)v8, v7);

}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint8_t v11[8];
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self->_account)
  {
    v8 = dispatch_queue_create("upgradeTermsQueue", 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230EA7208;
    block[3] = &unk_24FF9D090;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_230EA3000, v9, OS_LOG_TYPE_DEFAULT, "Error: No AppleAccount set on AASetupAssistant Service", v11, 2u);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v10, (uint64_t)CFSTR("com.apple.appleaccount"), 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }

}

- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[16];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EA3000, v5, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_appleID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("apple-id"), v13);

  objc_msgSend_password(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, (uint64_t)CFSTR("password"), v20);

  objc_msgSend_appleIDClientIdentifier(MEMORY[0x24BE04958], v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, (uint64_t)CFSTR("client-id"), v27);

  v28 = objc_alloc(MEMORY[0x24BE04A58]);
  v35 = (void *)objc_msgSend_initWithAccount_(v28, v29, (uint64_t)self->_account, v30, v31);
  if (self->_account)
  {
    v36 = objc_alloc(MEMORY[0x24BE04970]);
    v40 = (void *)objc_msgSend_initWithAccount_(v36, v37, (uint64_t)self->_account, v38, v39);
    objc_msgSend_addProvisioningInfoToAARequest_(v40, v41, (uint64_t)v35, v42, v43);

  }
  objc_msgSend_setCookieStorage_(v35, v32, (uint64_t)self->_cookieStorage, v33, v34);
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_230EA7658;
  v48[3] = &unk_24FF9D040;
  v49 = v4;
  v44 = v4;
  objc_msgSend_performRequestWithHandler_(v35, v45, (uint64_t)v48, v46, v47);

}

- (id)_signingSession
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  AASigningSession *signingSession;
  NSDate *v14;
  NSDate *signingSessionCreationDate;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  AASigningSession *v38;
  AASigningSession *v39;
  AASigningSession *v40;
  NSObject *v41;
  NSObject *v42;
  AASigningSession *v43;
  id v45;
  uint8_t buf[4];
  AASigningSession *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!self->_signingSession)
    goto LABEL_7;
  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v6, v7, (uint64_t)self->_signingSessionCreationDate, v8, v9);
  v11 = v10;

  if (v11 > 540.0)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v12, OS_LOG_TYPE_DEFAULT, "shared signing session expired. creating a new signing session.", buf, 2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0;

  }
  if (!self->_signingSession)
  {
LABEL_7:
    objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v14;

    v16 = (void *)MEMORY[0x24BE04A60];
    objc_msgSend_urlConfiguration(AASetupAssistantService, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signingSessionCertURL(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_urlConfiguration(AASetupAssistantService, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signingSessionURL(v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend_establishedSessionWithCertURL_sessionURL_error_(v16, v37, (uint64_t)v26, (uint64_t)v36, (uint64_t)&v45);
    v38 = (AASigningSession *)objc_claimAutoreleasedReturnValue();
    v39 = (AASigningSession *)v45;
    v40 = self->_signingSession;
    self->_signingSession = v38;

    if (v39)
    {
      _AALogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v39;
        _os_log_impl(&dword_230EA3000, v41, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }

    }
  }
  _AALogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    v47 = v43;
    _os_log_impl(&dword_230EA3000, v42, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  return self->_signingSession;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  uint8_t *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  __int16 v34;
  __int16 v35;

  v7 = a3;
  v8 = a4;
  v13 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10, v11, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("AASetupAssistantService.m"), 479, CFSTR("No DSID passed"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10, v11, v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("AASetupAssistantService.m"), 480, CFSTR("No data passed"));

LABEL_3:
  v14 = objc_alloc(MEMORY[0x24BE04970]);
  v18 = (void *)objc_msgSend_initWithDSID_(v14, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_setCookieStorageRef_(v18, v19, (uint64_t)self->_cookieStorage, v20, v21);
  v25 = objc_msgSend_provisionDeviceWithData_(v18, v22, (uint64_t)v13, v23, v24);
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v35 = 0;
      v28 = "Device provisioning failed";
      v29 = (uint8_t *)&v35;
LABEL_8:
      _os_log_impl(&dword_230EA3000, v26, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    }
  }
  else if (v27)
  {
    v34 = 0;
    v28 = "Device provisioning completed sucessfully";
    v29 = (uint8_t *)&v34;
    goto LABEL_8;
  }

}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  uint8_t *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  __int16 v34;
  __int16 v35;

  v7 = a3;
  v8 = a4;
  v13 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10, v11, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("AASetupAssistantService.m"), 496, CFSTR("No DSID passed"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10, v11, v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("AASetupAssistantService.m"), 497, CFSTR("No data passed"));

LABEL_3:
  v14 = objc_alloc(MEMORY[0x24BE04970]);
  v18 = (void *)objc_msgSend_initWithDSID_(v14, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_setCookieStorageRef_(v18, v19, (uint64_t)self->_cookieStorage, v20, v21);
  v25 = objc_msgSend_synchronizeProvisioningWithData_(v18, v22, (uint64_t)v13, v23, v24);
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v35 = 0;
      v28 = "Device provisioning sync failed";
      v29 = (uint8_t *)&v35;
LABEL_8:
      _os_log_impl(&dword_230EA3000, v26, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    }
  }
  else if (v27)
  {
    v34 = 0;
    v28 = "Device provisioning sync completed successfully";
    v29 = (uint8_t *)&v34;
    goto LABEL_8;
  }

}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  _DWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6, v7, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("AASetupAssistantService.m"), 512, CFSTR("No DSID passed"));

  }
  v10 = objc_alloc(MEMORY[0x24BE04970]);
  v14 = (void *)objc_msgSend_initWithDSID_(v10, v11, (uint64_t)v9, v12, v13);
  v19 = objc_msgSend_eraseProvisioning(v14, v15, v16, v17, v18);
  if (v19)
  {
    v20 = v19;
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = 67109120;
      v24[1] = v20;
      _os_log_impl(&dword_230EA3000, v21, OS_LOG_TYPE_DEFAULT, "Something went wrong when trying to erase the device provisioning: %d", (uint8_t *)v24, 8u);
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
