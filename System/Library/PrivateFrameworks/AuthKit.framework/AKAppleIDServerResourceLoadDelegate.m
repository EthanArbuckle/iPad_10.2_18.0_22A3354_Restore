@implementation AKAppleIDServerResourceLoadDelegate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_24);
  return (id)sharedController_controller;
}

void __55__AKAppleIDServerResourceLoadDelegate_sharedController__block_invoke()
{
  AKAppleIDAuthenticationController *v0;
  void *v1;

  v0 = objc_alloc_init(AKAppleIDAuthenticationController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

}

- (AKAppleIDServerResourceLoadDelegate)initWithCoder:(id)a3
{
  id v4;
  AKAppleIDServerResourceLoadDelegate *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *identityToken;
  uint64_t v10;
  NSString *heartbeatToken;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *continuationToken;
  uint64_t v17;
  NSString *passwordResetToken;
  uint64_t v19;
  NSString *serviceToken;
  uint64_t v21;
  NSString *serviceTokenIdentifier;
  uint64_t v23;
  AKAnisetteData *proxiedDeviceAnisetteData;
  uint64_t v25;
  AKDevice *proxiedDevice;
  uint64_t v27;
  NSString *proxyAppName;
  uint64_t v29;
  NSString *clientAppName;
  uint64_t v31;
  NSString *clientBundleID;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *loggedInServices;
  uint64_t v39;
  NSNumber *hasEmptyPasswordOverride;
  uint64_t v41;
  NSString *securityUpgradeContext;
  uint64_t v43;
  NSString *phoneNumberCertificate;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSArray *phoneInformation;
  uint64_t v52;
  NSString *followupItems;
  uint64_t v54;
  NSString *appProvidedContext;
  uint64_t v56;
  NSString *proxiedAltDSID;
  uint64_t v58;
  NSString *proxiedIdentityToken;
  uint64_t v60;
  NSString *custodianRecoveryToken;
  uint64_t v62;
  NSString *telemetryDeviceSessionID;
  uint64_t v64;
  NSString *telemetryFlowID;
  objc_super v67;

  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)AKAppleIDServerResourceLoadDelegate;
  v5 = -[AKAppleIDServerResourceLoadDelegate init](&v67, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_heartbeatToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    heartbeatToken = v5->_heartbeatToken;
    v5->_heartbeatToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldSendSigningHeaders"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSendSigningHeaders = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldSendEphemeralAuthHeader"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSendEphemeralAuthHeader = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceType = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_continuationToken"));
    v15 = objc_claimAutoreleasedReturnValue();
    continuationToken = v5->_continuationToken;
    v5->_continuationToken = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passwordResetToken"));
    v17 = objc_claimAutoreleasedReturnValue();
    passwordResetToken = v5->_passwordResetToken;
    v5->_passwordResetToken = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceToken"));
    v19 = objc_claimAutoreleasedReturnValue();
    serviceToken = v5->_serviceToken;
    v5->_serviceToken = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceTokenIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    serviceTokenIdentifier = v5->_serviceTokenIdentifier;
    v5->_serviceTokenIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDeviceAnisetteData"));
    v23 = objc_claimAutoreleasedReturnValue();
    proxiedDeviceAnisetteData = v5->_proxiedDeviceAnisetteData;
    v5->_proxiedDeviceAnisetteData = (AKAnisetteData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDevice"));
    v25 = objc_claimAutoreleasedReturnValue();
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxyAppName"));
    v27 = objc_claimAutoreleasedReturnValue();
    proxyAppName = v5->_proxyAppName;
    v5->_proxyAppName = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientAppName"));
    v29 = objc_claimAutoreleasedReturnValue();
    clientAppName = v5->_clientAppName;
    v5->_clientAppName = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleID"));
    v31 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldSendLocalUserHasAppleIDLoginHeader"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSendLocalUserHasAppleIDLoginHeader = objc_msgSend(v33, "BOOLValue");

    v5->_shouldSendICSCIntentHeader = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSendICSCIntentHeader"));
    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_loggedInServices"));
    v37 = objc_claimAutoreleasedReturnValue();
    loggedInServices = v5->_loggedInServices;
    v5->_loggedInServices = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasEmptyPasswordOverride"));
    v39 = objc_claimAutoreleasedReturnValue();
    hasEmptyPasswordOverride = v5->_hasEmptyPasswordOverride;
    v5->_hasEmptyPasswordOverride = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_securityUpgradeContext"));
    v41 = objc_claimAutoreleasedReturnValue();
    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)v41;

    v5->_shouldOfferSecurityUpgrade = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldOfferSecurityUpgrade"));
    v5->_shouldSendPhoneNumber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSendPhoneNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_phoneNumberCertificate"));
    v43 = objc_claimAutoreleasedReturnValue();
    phoneNumberCertificate = v5->_phoneNumberCertificate;
    v5->_phoneNumberCertificate = (NSString *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("_phoneInformation"));
    v50 = objc_claimAutoreleasedReturnValue();
    phoneInformation = v5->_phoneInformation;
    v5->_phoneInformation = (NSArray *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_followupItems"));
    v52 = objc_claimAutoreleasedReturnValue();
    followupItems = v5->_followupItems;
    v5->_followupItems = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appProvidedContext"));
    v54 = objc_claimAutoreleasedReturnValue();
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAltDSID"));
    v56 = objc_claimAutoreleasedReturnValue();
    proxiedAltDSID = v5->_proxiedAltDSID;
    v5->_proxiedAltDSID = (NSString *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedIdentityToken"));
    v58 = objc_claimAutoreleasedReturnValue();
    proxiedIdentityToken = v5->_proxiedIdentityToken;
    v5->_proxiedIdentityToken = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryToken"));
    v60 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryDeviceSessionID"));
    v62 = objc_claimAutoreleasedReturnValue();
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryFlowID"));
    v64 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v64;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  altDSID = self->_altDSID;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_identityToken, CFSTR("_identityToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_heartbeatToken, CFSTR("_heartbeatToken"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSendSigningHeaders);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("_shouldSendSigningHeaders"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSendEphemeralAuthHeader);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("_shouldSendEphemeralAuthHeader"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("_serviceType"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_passwordResetToken, CFSTR("_passwordResetToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_continuationToken, CFSTR("_continuationToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_serviceToken, CFSTR("_serviceToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_serviceTokenIdentifier, CFSTR("_serviceTokenIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_proxiedDevice, CFSTR("_proxiedDevice"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_proxiedDeviceAnisetteData, CFSTR("_proxiedDeviceAnisetteData"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_proxyAppName, CFSTR("_proxyAppName"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_clientAppName, CFSTR("_clientAppName"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_clientBundleID, CFSTR("_clientBundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSendLocalUserHasAppleIDLoginHeader);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_shouldSendLocalUserHasAppleIDLoginHeader"));

  objc_msgSend(v9, "encodeBool:forKey:", self->_shouldSendICSCIntentHeader, CFSTR("_shouldSendICSCIntentHeader"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_loggedInServices, CFSTR("_loggedInServices"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_hasEmptyPasswordOverride, CFSTR("_hasEmptyPasswordOverride"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_securityUpgradeContext, CFSTR("_securityUpgradeContext"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_shouldOfferSecurityUpgrade, CFSTR("_shouldOfferSecurityUpgrade"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_shouldSendPhoneNumber, CFSTR("_shouldSendPhoneNumber"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_phoneNumberCertificate, CFSTR("_phoneNumberCertificate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_phoneInformation, CFSTR("_phoneInformation"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_followupItems, CFSTR("_followupItems"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_appProvidedContext, CFSTR("_appProvidedContext"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_proxiedAltDSID, CFSTR("_proxiedAltDSID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_proxiedIdentityToken, CFSTR("_proxiedIdentityToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_custodianRecoveryToken, CFSTR("_custodianRecoveryToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_telemetryDeviceSessionID, CFSTR("_telemetryDeviceSessionID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_telemetryFlowID, CFSTR("_telemetryFlowID"));

}

- (AKAppleIDServerResourceLoadDelegate)initWithAltDSID:(id)a3 identityToken:(id)a4
{
  id v6;
  id v7;
  AKAppleIDServerResourceLoadDelegate *v8;
  uint64_t v9;
  NSString *altDSID;
  uint64_t v11;
  NSString *identityToken;
  uint64_t v13;
  NSDictionary *continuationHeaders;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDServerResourceLoadDelegate;
  v8 = -[AKAppleIDServerResourceLoadDelegate init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    identityToken = v8->_identityToken;
    v8->_identityToken = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    continuationHeaders = v8->_continuationHeaders;
    v8->_continuationHeaders = (NSDictionary *)v13;

  }
  return v8;
}

- (void)signRequest:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[AKAppleIDServerResourceLoadDelegate signRequest:].cold.1();

  v6 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__AKAppleIDServerResourceLoadDelegate_signRequest___block_invoke;
  v8[3] = &unk_1E2E605A8;
  v9 = v6;
  v7 = v6;
  -[AKAppleIDServerResourceLoadDelegate signRequest:withCompletionHandler:](self, "signRequest:withCompletionHandler:", v4, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__AKAppleIDServerResourceLoadDelegate_signRequest___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)signRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  void (*v14)(_QWORD *, _QWORD *);
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  -[AKAppleIDServerResourceLoadDelegate _signRequest:](self, "_signRequest:", v6);
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke;
  v26[3] = &unk_1E2E605D0;
  v26[4] = self;
  v9 = v6;
  v27 = v9;
  v10 = (_QWORD *)MEMORY[0x194022E4C](v26);
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_91;
  v24[3] = &unk_1E2E605D0;
  v24[4] = self;
  v11 = v9;
  v25 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v24);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_94;
  v22[3] = &unk_1E2E605D0;
  v22[4] = self;
  v23 = v11;
  v13 = v11;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_97;
  v18[3] = &unk_1E2E60698;
  v19 = v12;
  v20 = (id)MEMORY[0x194022E4C](v22);
  v21 = v7;
  v14 = (void (*)(_QWORD *, _QWORD *))v10[2];
  v15 = v7;
  v16 = v20;
  v17 = v12;
  v14(v10, v18);

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 46))
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "signingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_87;
    v8[3] = &unk_1E2E5F0B0;
    v9 = v7;
    v10 = v4;
    objc_msgSend(v6, "signingHeadersForRequest:completion:", v9, v8);

  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E2E5FD18;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_87_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[46]
    && (objc_msgSend(v4, "proxiedDevice"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232), v5, !v6))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to fetch peer anisette", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_proxiedProvisioningController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_92;
    v10[3] = &unk_1E2E605F8;
    v11 = *(id *)(a1 + 40);
    v12 = v3;
    objc_msgSend(v9, "anisetteDataWithCompletion:", v10);

  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Not attmepting to fetch peer anisette", buf, 2u);
    }

    v3[2](v3);
  }

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_92(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Peer anisette fetch complete", v8, 2u);
  }

  if (!v5 || a3)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_92_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "ak_addProxiedAnisetteHeaders:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD);
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 46);
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Not sending signing headers for peer", buf, 2u);
    }

    goto LABEL_20;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Configuring peer signing headers", buf, 2u);
  }

  v7 = *(_QWORD **)(a1 + 32);
  if (v7[30])
  {
LABEL_5:
    objc_msgSend(v7, "proxiedDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240))
      {
        _AKLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Looks like we already have attestation data, thanks!", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "ak_addProxiedAttestationHeaders:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
      }
    }
    else
    {
      _AKLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "No proxied device, no peer headers to attach.", buf, 2u);
      }

    }
LABEL_20:
    v3[2](v3);
    goto LABEL_21;
  }
  objc_msgSend(v7, "proxiedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v7 = *(_QWORD **)(a1 + 32);
    goto LABEL_5;
  }
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "proxiedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "%@: Fetching attestation data for proxied device (%@) with request (%@)", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_proxiedProvisioningController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_95;
  v18[3] = &unk_1E2E60620;
  v19 = v16;
  v20 = v3;
  objc_msgSend(v15, "fetchPeerAttestationDataForRequest:completion:", v19, v18);

LABEL_21:
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "attestationHeaders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Peer attestation completed with results: %@", (uint8_t *)&v11, 0xCu);

  }
  if (v6)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_95_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "ak_addProxiedAttestationHeaders:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2_98;
  v3[3] = &unk_1E2E60670;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2_98(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E2E60648;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_proxiedProvisioningController
{
  AKAnisetteProvisioningController *proxiedProvisioningController;
  AKAnisetteProvisioningController *v4;
  void *v5;
  void *v6;
  AKAnisetteProvisioningController *v7;
  AKAnisetteProvisioningController *v8;

  proxiedProvisioningController = self->_proxiedProvisioningController;
  if (!proxiedProvisioningController)
  {
    v4 = [AKAnisetteProvisioningController alloc];
    -[AKAppleIDServerResourceLoadDelegate proxiedDevice](self, "proxiedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate anisetteDataProvider](self, "anisetteDataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AKAnisetteProvisioningController initForDevice:provider:](v4, "initForDevice:provider:", v5, v6);
    v8 = self->_proxiedProvisioningController;
    self->_proxiedProvisioningController = v7;

    proxiedProvisioningController = self->_proxiedProvisioningController;
  }
  return proxiedProvisioningController;
}

- (id)signingController
{
  return objc_alloc_init(AKAppleIDSigningController);
}

- (id)_fetchApplicationNameForBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;

  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v9);
  v5 = v9;
  if (v5)
  {
    _AKLogHme();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAppleIDServerResourceLoadDelegate _fetchApplicationNameForBundleId:].cold.1();

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_signRequest:(id)a3
{
  id v4;
  NSString *securityUpgradeContext;
  NSString *privateEmailDomain;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AKAppleIDAuthenticationContext *context;
  void *v16;
  void *v17;
  void *BYLicenseAgreementClass;
  void *v19;
  void *v20;
  void *v21;
  NSString *continuationToken;
  NSString *v23;
  NSString *v24;
  NSString *passwordResetToken;
  NSString *v26;
  NSString *v27;
  NSNumber *hasEmptyPasswordOverride;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSString *continuityIDMSData;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  id v43;

  v4 = a3;
  -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:](self, "signRequestWithCommonHeaders:", v4);
  securityUpgradeContext = self->_securityUpgradeContext;
  if (securityUpgradeContext)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", securityUpgradeContext, CFSTR("X-Apple-Security-Upgrade-Context"));
  objc_msgSend(v4, "ak_addAttestationDataHeaders");
  objc_msgSend(v4, "ak_addCountryHeader");
  if (OctagonIsSOSFeatureEnabled())
    objc_msgSend(v4, "ak_addCircleStatusHeader");
  else
    objc_msgSend(v4, "ak_addCircleStatusHeaderForCircleStatus:", -[AKAppleIDServerResourceLoadDelegate _isOTCliqueStatusIn](self, "_isOTCliqueStatusIn"));
  privateEmailDomain = self->_privateEmailDomain;
  if (self->_privateEmailBundleId)
  {
    if (privateEmailDomain)
    {
      objc_msgSend(v4, "ak_addPrivateEmailDomainHeader:");
      objc_msgSend(v4, "ak_addPrivateEmailOriginHeader:", CFSTR("app"));
      objc_msgSend(v4, "ak_addPrivateEmailAppBundleIdHeader:", self->_privateEmailBundleId);
      -[AKAppleIDServerResourceLoadDelegate _fetchApplicationNameForBundleId:](self, "_fetchApplicationNameForBundleId:", self->_privateEmailBundleId);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "ak_addPrivateEmailAppNameHeader:", v7);
        _AKLogHme();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.9();
      }
      else
      {
        _AKLogHme();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.8((uint64_t)&self->_privateEmailBundleId, v8, v9, v10, v11, v12, v13, v14);
      }

    }
  }
  else if (privateEmailDomain)
  {
    objc_msgSend(v4, "ak_addPrivateEmailOriginHeader:", CFSTR("safari"));
    objc_msgSend(v4, "ak_addPrivateEmailDomainHeader:", self->_privateEmailDomain);
  }
  context = self->_context;
  if (context)
  {
    -[AKAppleIDAuthenticationContext _identifier](context, "_identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ak_addRequestUUIDHeader:", v17);

  }
  if (SetupAssistantLibraryCore())
  {
    BYLicenseAgreementClass = (void *)SetupAssistantLibraryCore();
    if (BYLicenseAgreementClass)
      BYLicenseAgreementClass = getBYLicenseAgreementClass();
    objc_msgSend(v4, "ak_addAcceptedSLAHeaderWithVersion:", objc_msgSend(BYLicenseAgreementClass, "versionOfAcceptedAgreement"));
  }
  -[AKAppleIDServerResourceLoadDelegate _signWithProxiedDeviceHeaders:](self, "_signWithProxiedDeviceHeaders:", v4);
  objc_msgSend(v4, "ak_addLoggedInServicesHeaderForServices:", self->_loggedInServices);
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate altDSID](self, "altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "authKitAccountWithAltDSID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  continuationToken = self->_continuationToken;
  if (continuationToken)
  {
    v23 = continuationToken;
  }
  else
  {
    objc_msgSend(v19, "continuationTokenForAccount:", v21);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  passwordResetToken = self->_passwordResetToken;
  if (passwordResetToken)
  {
    v26 = passwordResetToken;
  }
  else
  {
    objc_msgSend(v19, "passwordResetTokenForAccount:", v21);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  if (v24)
    objc_msgSend(v4, "ak_addContinutationKeyHeader:", v24);
  if (v27)
    objc_msgSend(v4, "ak_addPasswordResetKeyHeader:", v27);
  hasEmptyPasswordOverride = self->_hasEmptyPasswordOverride;
  if (hasEmptyPasswordOverride)
  {
    if (-[NSNumber BOOLValue](hasEmptyPasswordOverride, "BOOLValue"))
      goto LABEL_34;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sharedController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v30 = objc_msgSend(v29, "isDevicePasscodeProtected:", &v43);
    v31 = v43;

    if (v31)
    {
      _AKLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.7();

    }
    if (!v30)
    {
LABEL_34:
      if (!self->_shouldSendEphemeralAuthHeader)
        goto LABEL_47;
      goto LABEL_44;
    }
  }
  _AKLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.6();

  objc_msgSend(v4, "ak_addPRKRequestHeader");
  if (self->_shouldSendEphemeralAuthHeader)
  {
LABEL_44:
    _AKLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.5();

    objc_msgSend(v4, "ak_addEphemeralAuthHeader");
    goto LABEL_47;
  }
  if (self->_shouldSendICSCIntentHeader)
  {
    _AKLogSystem();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.4();

    objc_msgSend(v4, "ak_addICSCIntentHeader");
  }
LABEL_47:
  if (self->_shouldSendLocalUserHasAppleIDLoginHeader)
    objc_msgSend(v4, "ak_addLocalUserHasAppleIDLoginHeader");
  if (self->_shouldSendPhoneNumber)
  {
    if (self->_phoneInformation)
    {
      _AKLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.3();

      objc_msgSend(v4, "ak_addPhoneInformationHeaderWithValue:", self->_phoneInformation);
    }
    _AKLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.2();

    objc_msgSend(v4, "ak_addPhoneNumberHeader");
    if (self->_phoneNumberCertificate)
    {
      _AKLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.1();

      objc_msgSend(v4, "ak_addPhoneNumberCertificateHeaderWithValue:", self->_phoneNumberCertificate);
    }
  }
  objc_msgSend(v4, "ak_addCFUHeader:", self->_followupItems);
  -[AKAppleIDServerResourceLoadDelegate _retrieveContinuationHeaders](self, "_retrieveContinuationHeaders");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __52__AKAppleIDServerResourceLoadDelegate__signRequest___block_invoke;
    v41[3] = &unk_1E2E5FD18;
    v42 = v4;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v41);

  }
  continuityIDMSData = self->_continuityIDMSData;
  if (continuityIDMSData)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", continuityIDMSData, CFSTR("X-Apple-I-IdMS-Data"));

}

void __52__AKAppleIDServerResourceLoadDelegate__signRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Harvested continuation header added %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v6, v5);
}

- (void)signRequestWithCommonHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSString *initialURLRequestKey;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = a3;
  -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:](self, "signRequestWithBasicHeaders:", v4);
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Signing request with common headers", v15, 2u);
  }

  if (self->_altDSID)
  {
    if (self->_serviceToken)
    {
      _AKLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.5();

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", self->_serviceToken, self->_altDSID);
    }
    else if (self->_identityToken)
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.4();

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", self->_identityToken, self->_altDSID);
    }
    if (self->_heartbeatToken)
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.3();

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithHeartbeatToken:forAltDSID:", self->_heartbeatToken, self->_altDSID);
    }
    if (self->_initialURLRequestKey)
    {
      _AKLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.2();

      objc_msgSend(v4, "ak_addURLSwitchingHeaderWithURLKey:altDSID:", self->_initialURLRequestKey, self->_altDSID);
      initialURLRequestKey = self->_initialURLRequestKey;
      self->_initialURLRequestKey = 0;

    }
    if (self->_custodianRecoveryToken)
    {
      +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _AKLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.1();

      objc_msgSend(v11, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ak_addAuthorizationHeaderWithCustodianRecoveryToken:forAltDSID:", v13, self->_altDSID);

    }
    objc_msgSend(v4, "ak_addOTStatusHeaderForAltDSID:", self->_altDSID);
    -[AKAppleIDServerResourceLoadDelegate _accountDSID](self, "_accountDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ak_addCDPStatusHeaderForDSID:", v14);

  }
  if (self->_appProvidedContext)
    objc_msgSend(v4, "ak_addAppProvidedContext:");
  objc_msgSend(v4, "ak_addOfferSecurityUpgrade:", self->_shouldOfferSecurityUpgrade);
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeaderForAuthContext:", self->_context);
  objc_msgSend(v4, "ak_addWalrusStatusHeader");
  -[AKAppleIDServerResourceLoadDelegate _signWithFeatureOptInHeaders:](self, "_signWithFeatureOptInHeaders:", v4);

}

- (void)signRequestWithBasicHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  AKAppleIDAuthenticationContext *context;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Signing request with basic headers", buf, 2u);
  }

  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addDeviceSerialNumberHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  objc_msgSend(v4, "ak_addSeedBuildHeader");
  objc_msgSend(v4, "ak_addFeatureMaskHeader");
  objc_msgSend(v4, "ak_addLocaleHeader");
  objc_msgSend(v4, "ak_addTimeZoneHeaders");
  objc_msgSend(v4, "ak_addDeviceMLBHeader");
  objc_msgSend(v4, "ak_addDeviceROMHeader");
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ak_addAppleIDUserModeHeaderWithValue:", objc_msgSend(v6, "isMultiUserMode"));

  objc_msgSend(v4, "ak_addDeviceModeHeader");
  if (+[AKDevice hasUniqueDeviceIdentifier](AKDevice, "hasUniqueDeviceIdentifier"))
    objc_msgSend(v4, "ak_addProvisioningUDIDHeader");
  if (-[NSString length](self->_proxyAppName, "length"))
    objc_msgSend(v4, "ak_addProxyApp:", self->_proxyAppName);
  if (self->_serviceType)
    objc_msgSend(v4, "ak_addContextHeaderForServiceType:");
  if (-[NSString length](self->_clientAppName, "length"))
    objc_msgSend(v4, "ak_addClientApp:", self->_clientAppName);
  if (-[NSString length](self->_clientBundleID, "length"))
    objc_msgSend(v4, "ak_addClientBundleIDHeader:", self->_clientBundleID);
  -[AKAppleIDAuthenticationContext _proxiedAppBundleID](self->_context, "_proxiedAppBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[AKAppleIDAuthenticationContext _proxiedAppBundleID](self->_context, "_proxiedAppBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ak_addProxiedBundleIDHeader:", v9);

  }
  if (self->_dataCenterIdentifier)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.5();

    objc_msgSend(v4, "ak_addDataCenterHeaderWithIdentifier:", self->_dataCenterIdentifier);
  }
  if (self->_cliMode)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.4();

    objc_msgSend(v4, "ak_addExecutionModeHeader:", 1);
  }
  context = self->_context;
  v20 = 0;
  -[AKAppleIDAuthenticationContext authKitAccount:](context, "authKitAccount:", &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v14)
  {
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.3();

  }
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "accountAccessTelemetryOptInForAccount:", v13);

  if (v17)
  {
    if (self->_telemetryDeviceSessionID)
    {
      _AKLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.2();

      objc_msgSend(v4, "ak_addTelemetryDeviceSessionID:", self->_telemetryDeviceSessionID);
    }
    if (self->_telemetryFlowID)
    {
      _AKLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.1();

      objc_msgSend(v4, "ak_addTelemetryFlowID:", self->_telemetryFlowID);
    }
  }
  if (self->_serviceType)
    objc_msgSend(v4, "ak_addServiceHeaderForServiceType:");
  -[AKAppleIDServerResourceLoadDelegate _signRequestWithBAAHeaders:](self, "_signRequestWithBAAHeaders:", v4);

}

- (void)_signWithProxiedDeviceHeaders:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AKDevice serverFriendlyDescription](self->_proxiedDevice, "serverFriendlyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKDevice serverFriendlyDescription](self->_proxiedDevice, "serverFriendlyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ak_addProxiedClientInfoHeader:", v5);

  }
  -[AKDevice uniqueDeviceIdentifier](self->_proxiedDevice, "uniqueDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKDevice uniqueDeviceIdentifier](self->_proxiedDevice, "uniqueDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ak_addProxiedDeviceUDIDHeader:", v7);

  }
  if (self->_proxiedDeviceAnisetteData)
    objc_msgSend(v12, "ak_addProxiedAnisetteHeaders:");
  -[AKDevice locale](self->_proxiedDevice, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v12, "ak_addProxiedDeviceCountryHeader:", v9);
  -[AKDevice serialNumber](self->_proxiedDevice, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AKDevice serialNumber](self->_proxiedDevice, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ak_addProxiedDeviceSerialNumberHeader:", v11);

  }
  if (self->_proxiedDevice)
  {
    objc_msgSend(v12, "ak_addProxiedDevicePRKRequestHeader");
    objc_msgSend(v12, "ak_addProxiedDeviceICSCIntentHeader");
  }
  if (self->_proxiedAltDSID && self->_proxiedIdentityToken)
    objc_msgSend(v12, "ak_addProxiedAuthorizationHeaderWithIdentityToken:forAltDSID:");

}

- (void)_signWithFeatureOptInHeaders:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[16];

  v3 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAllowExperimentalMode");

  if (v5 == 1)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Signing request with Experimental Mode opt-in header", buf, 2u);
    }

    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Experiment-Mode"));
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-HSA1-Conversion"));
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-RecoveryKey-Show"));
  }
  objc_msgSend(v3, "ak_addFeatureMaskHeader");
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldEnableTestAccountMode");

  if (v8 == 1)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Test-Account-Mode"));
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldAddHSA2CreateHeader");

  if (v10 == 1)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("HSA2"), CFSTR("X-Apple-AK-Auth-Type"));
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldAllowPhoneNumberAccounts");

  if (v12 == 1)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("phoneNumber"), CFSTR("X-Apple-I-Account-NameType"));
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requestedCloudPartition");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Apple-Requested-Partition"));

}

- (void)_signRequestWithBAAHeaders:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *bagUrlKey;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSString *v12;
  _QWORD v13[4];
  id v14;
  dispatch_semaphore_t v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_bagUrlKey)
  {
    +[AKURLBag sharedBag](AKURLBag, "sharedBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBaaEnabledForKey:", self->_bagUrlKey);

    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        bagUrlKey = self->_bagUrlKey;
        *(_DWORD *)buf = 138543362;
        v17 = bagUrlKey;
        _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Signing request with BAA headers for key - %{public}@", buf, 0xCu);
      }

      v10 = dispatch_semaphore_create(0);
      -[AKAppleIDServerResourceLoadDelegate signingController](self, "signingController");
      v7 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke;
      v13[3] = &unk_1E2E606C0;
      v14 = v4;
      v15 = v10;
      v11 = v10;
      -[NSObject signWithBAAHeaders:completion:](v7, "signWithBAAHeaders:completion:", v14, v13);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

    }
    else if (v8)
    {
      v12 = self->_bagUrlKey;
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "BAA is not enabled for URL key - %{public}@", buf, 0xCu);
    }
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate _signRequestWithBAAHeaders:].cold.1();
  }

}

void __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Added additional BAA headers for request - %@", buf, 0xCu);
  }

  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke_108;
    v9[3] = &unk_1E2E5FD18;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    v8 = v10;
  }
  else
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_87_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke_108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)processResponse:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "allHeaderFields");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate _harvestContinuationHeadersFromHeaders:](self, "_harvestContinuationHeadersFromHeaders:", v4);

  }
}

- (BOOL)isResponseFinal:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (-[AKAppleIDServerResourceLoadDelegate _isResponseSuccessful:](self, "_isResponseSuccessful:", v5)
       || objc_msgSend(v5, "statusCode") == 412)
      && objc_msgSend((id)objc_opt_class(), "signalFromServerResponse:", v5) != 6
      && -[AKAppleIDServerResourceLoadDelegate isResponseActionable:](self, "isResponseActionable:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAuthenticationRequired:(id)a3
{
  return objc_msgSend(a3, "statusCode") == 401;
}

- (BOOL)isResponseActionable:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "signalFromServerResponse:", v3);

  return v4 != 0;
}

- (BOOL)isResponseFinalForHSA2ServerFlow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;

  v3 = a3;
  objc_msgSend(v3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-AK-Auth-Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-AK-Request-Auth-Type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("hsa2"));
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("hsa2"));
  v9 = objc_msgSend((id)objc_opt_class(), "signalFromServerResponse:", v3);

  if (v6)
    v10 = 0;
  else
    v10 = v7;
  v11 = v7 ^ 1;
  if (!v6)
    v11 = 1;
  if (v9 != 3)
    v10 = 0;
  v12 = v10 | (v11 | v8) ^ 1;

  return v12;
}

- (BOOL)isResponseCompleteAndConflict:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "statusCode");
  v5 = objc_msgSend((id)objc_opt_class(), "signalFromServerResponse:", v3);

  return v4 == 409 && v5 == 3;
}

+ (unint64_t)signalFromServerResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("X-Apple-AK-Action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("X-Apple-CDP-Action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("continue")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("complete")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("continue")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("start-icsc")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("mk-validation")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("read")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("delete")) & 1) != 0)
  {
    v6 = 7;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("teardown")))
  {
    v6 = 8;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)decorateWithCircleRequestContext:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContext *v5;
  AKAppleIDAuthenticationContext *context;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "authContext");
  v5 = (AKAppleIDAuthenticationContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v5;

  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext setAltDSID:](self->_context, "setAltDSID:", v8);

  self->_serviceType = -[AKAppleIDAuthenticationContext serviceType](self->_context, "serviceType");
}

- (void)decorateWithPrivateEmailContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  _AKLogHme();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerResourceLoadDelegate decorateWithPrivateEmailContext:].cold.1();

  objc_msgSend(v4, "clientAppBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setPrivateEmailBundleId:](self, "setPrivateEmailBundleId:", v6);

  objc_msgSend(v4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setPrivateEmailDomain:](self, "setPrivateEmailDomain:", v7);

}

- (void)decorateWithContext:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;

  v38 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  -[AKAppleIDServerResourceLoadDelegate altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v38, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setAltDSID:](self, "setAltDSID:", v6);

  }
  if ((objc_msgSend(v38, "needsNewAppleID") & 1) != 0 || (objc_msgSend(v38, "needsNewChildAccount") & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v38, "proxiedDevice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((objc_msgSend(v38, "needsSecurityUpgradeUI") & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v8 = (void *)v7;
  objc_msgSend(v38, "appProvidedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_9:
    -[AKAppleIDServerResourceLoadDelegate setShouldSendSigningHeaders:](self, "setShouldSendSigningHeaders:", 1);
    goto LABEL_10;
  }
  v37 = objc_msgSend(v38, "needsSecurityUpgradeUI");

  if (v37)
    goto LABEL_9;
LABEL_10:
  if (objc_msgSend(v38, "isEphemeral"))
    -[AKAppleIDServerResourceLoadDelegate setShouldSendEphemeralAuthHeader:](self, "setShouldSendEphemeralAuthHeader:", 1);
  objc_msgSend(v38, "isAppleIDLoginEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v38, "isAppleIDLoginEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
      -[AKAppleIDServerResourceLoadDelegate setShouldSendLocalUserHasAppleIDLoginHeader:](self, "setShouldSendLocalUserHasAppleIDLoginHeader:", 1);
  }
  objc_msgSend(v38, "custodianRecoveryToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v38, "custodianRecoveryToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setCustodianRecoveryToken:](self, "setCustodianRecoveryToken:", v14);

  }
  objc_msgSend(v38, "_remoteUIIdentityToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(v38, "_remoteUIIdentityToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setIdentityToken:](self, "setIdentityToken:", v17);

  }
  -[AKAppleIDServerResourceLoadDelegate setServiceType:](self, "setServiceType:", objc_msgSend(v38, "serviceType"));
  objc_msgSend(v38, "appProvidedContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setAppProvidedContext:](self, "setAppProvidedContext:", v18);

  objc_msgSend(v38, "_proxiedAppName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setProxyAppName:](self, "setProxyAppName:", v19);

  -[AKAppleIDServerResourceLoadDelegate setShouldSendPhoneNumber:](self, "setShouldSendPhoneNumber:", 1);
  objc_msgSend(v38, "hasEmptyPassword");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setHasEmptyPasswordOverride:](self, "setHasEmptyPasswordOverride:", v20);

  objc_msgSend(v38, "securityUpgradeContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setSecurityUpgradeContext:](self, "setSecurityUpgradeContext:", v21);

  -[AKAppleIDServerResourceLoadDelegate setShouldSendICSCIntentHeader:](self, "setShouldSendICSCIntentHeader:", objc_msgSend(v38, "anticipateEscrowAttempt"));
  -[AKAppleIDServerResourceLoadDelegate setShouldOfferSecurityUpgrade:](self, "setShouldOfferSecurityUpgrade:", objc_msgSend(v38, "shouldOfferSecurityUpgrade"));
  +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider](AKFollowUpProviderFactory, "sharedAuthKitFollowupProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(v22, "pendingFollowUpItems:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKFollowUpServerPayloadFormatter pendingAuthKitFollowUpPayload:](AKFollowUpServerPayloadFormatter, "pendingAuthKitFollowUpPayload:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataWithPropertyList:format:options:error:", v25, 100, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setFollowupItems:](self, "setFollowupItems:", v27);

  objc_msgSend(v38, "proxiedDeviceAnisetteData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setProxiedDeviceAnisetteData:](self, "setProxiedDeviceAnisetteData:", v28);

  objc_msgSend(v38, "proxiedDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setProxiedDevice:](self, "setProxiedDevice:", v29);

  objc_msgSend(v38, "authKitAccount:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "accountAccessTelemetryOptInForAccount:", v30);

  if (v32)
  {
    objc_msgSend(v38, "telemetryFlowID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setTelemetryFlowID:](self, "setTelemetryFlowID:", v33);

    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "telemetryDeviceSessionIDForAccount:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 && (objc_msgSend(CFSTR("device_session_id_missing"), "isEqualToString:", v35) & 1) == 0)
      objc_msgSend(v38, "setTelemetryDeviceSessionID:", v35);
    objc_msgSend(v38, "telemetryDeviceSessionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setTelemetryDeviceSessionID:](self, "setTelemetryDeviceSessionID:", v36);

  }
}

- (void)updateWithAuthResults:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *serviceToken;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;

  v4 = a3;
  v5 = v4;
  if (self->_serviceTokenIdentifier)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AKIDMSToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", self->_serviceTokenIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    serviceToken = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.5((uint64_t)&self->_serviceTokenIdentifier, serviceToken, v10, v11, v12, v13, v14, v15);

      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", self->_serviceTokenIdentifier);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      serviceToken = self->_serviceToken;
      self->_serviceToken = v16;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.4((uint64_t)&self->_serviceTokenIdentifier, serviceToken, v17, v18, v19, v20, v21, v22);
    }

  }
  else
  {
    if (!self->_serviceToken)
      goto LABEL_13;
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.3();
  }

LABEL_13:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKIdentityToken"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.2();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKIdentityToken"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerResourceLoadDelegate setIdentityToken:](self, "setIdentityToken:", v25);
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.1();
  }

}

- (void)_harvestContinuationHeadersFromHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *continuationHeaders;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continuationHeaderPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__AKAppleIDServerResourceLoadDelegate__harvestContinuationHeadersFromHeaders___block_invoke;
  v13[3] = &unk_1E2E606E8;
  v8 = v7;
  v14 = v8;
  objc_msgSend(v4, "aaf_filter:", v13);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  continuationHeaders = self->_continuationHeaders;
  self->_continuationHeaders = v9;

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[NSDictionary allKeys](self->_continuationHeaders, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Harvested continuation headers %@", buf, 0xCu);

  }
}

uint64_t __78__AKAppleIDServerResourceLoadDelegate__harvestContinuationHeadersFromHeaders___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_retrieveContinuationHeaders
{
  return (id)-[NSDictionary copy](self->_continuationHeaders, "copy");
}

- (BOOL)_isResponseSuccessful:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "statusCode") - 200) < 0x64;
}

- (BOOL)_isOTCliqueStatusIn
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
  objc_msgSend(v3, "setContext:", *MEMORY[0x1E0CD5C90]);
  -[AKAppleIDServerResourceLoadDelegate altDSID](self, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v3);
  v6 = objc_alloc_init(MEMORY[0x1E0CD5C80]);
  objc_msgSend(v6, "setUseCachedAccountStatus:", 1);
  v9 = 0;
  v7 = objc_msgSend(v5, "fetchCliqueStatus:error:", v6, &v9) == 0;

  return v7;
}

- (id)_accountDSID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", self->_altDSID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DSIDForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v6)
      goto LABEL_9;
  }
  else
  {

  }
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldSendEphemeralAuthHeader
{
  return self->_shouldSendEphemeralAuthHeader;
}

- (void)setShouldSendEphemeralAuthHeader:(BOOL)a3
{
  self->_shouldSendEphemeralAuthHeader = a3;
}

- (BOOL)shouldSendICSCIntentHeader
{
  return self->_shouldSendICSCIntentHeader;
}

- (void)setShouldSendICSCIntentHeader:(BOOL)a3
{
  self->_shouldSendICSCIntentHeader = a3;
}

- (BOOL)shouldSendLocalUserHasAppleIDLoginHeader
{
  return self->_shouldSendLocalUserHasAppleIDLoginHeader;
}

- (void)setShouldSendLocalUserHasAppleIDLoginHeader:(BOOL)a3
{
  self->_shouldSendLocalUserHasAppleIDLoginHeader = a3;
}

- (BOOL)shouldSendPhoneNumber
{
  return self->_shouldSendPhoneNumber;
}

- (void)setShouldSendPhoneNumber:(BOOL)a3
{
  self->_shouldSendPhoneNumber = a3;
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_shouldOfferSecurityUpgrade = a3;
}

- (NSString)phoneNumberCertificate
{
  return self->_phoneNumberCertificate;
}

- (void)setPhoneNumberCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)phoneInformation
{
  return self->_phoneInformation;
}

- (void)setPhoneInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSArray)loggedInServices
{
  return self->_loggedInServices;
}

- (void)setLoggedInServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)passwordResetToken
{
  return self->_passwordResetToken;
}

- (void)setPasswordResetToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)continuationToken
{
  return self->_continuationToken;
}

- (void)setContinuationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)setHeartbeatToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)initialURLRequestKey
{
  return self->_initialURLRequestKey;
}

- (void)setInitialURLRequestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)proxyAppName
{
  return self->_proxyAppName;
}

- (void)setProxyAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)clientAppName
{
  return self->_clientAppName;
}

- (void)setClientAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)hasEmptyPasswordOverride
{
  return self->_hasEmptyPasswordOverride;
}

- (void)setHasEmptyPasswordOverride:(id)a3
{
  objc_storeStrong((id *)&self->_hasEmptyPasswordOverride, a3);
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)followupItems
{
  return self->_followupItems;
}

- (void)setFollowupItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)dataCenterIdentifier
{
  return self->_dataCenterIdentifier;
}

- (void)setDataCenterIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDevice, a3);
}

- (NSString)proxiedAltDSID
{
  return self->_proxiedAltDSID;
}

- (void)setProxiedAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedAltDSID, a3);
}

- (NSString)proxiedIdentityToken
{
  return self->_proxiedIdentityToken;
}

- (void)setProxiedIdentityToken:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedIdentityToken, a3);
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, a3);
}

- (AKAnisetteData)proxiedDeviceAnisetteData
{
  return self->_proxiedDeviceAnisetteData;
}

- (void)setProxiedDeviceAnisetteData:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, a3);
}

- (AKAttestationData)proxiedDeviceAttestationData
{
  return self->_proxiedDeviceAttestationData;
}

- (void)setProxiedDeviceAttestationData:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedDeviceAttestationData, a3);
}

- (NSString)privateEmailDomain
{
  return self->_privateEmailDomain;
}

- (void)setPrivateEmailDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)privateEmailBundleId
{
  return self->_privateEmailBundleId;
}

- (void)setPrivateEmailBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)continuityIDMSData
{
  return self->_continuityIDMSData;
}

- (void)setContinuityIDMSData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)serviceTokenIdentifier
{
  return self->_serviceTokenIdentifier;
}

- (void)setServiceTokenIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)bagUrlKey
{
  return self->_bagUrlKey;
}

- (void)setBagUrlKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)shouldSendSigningHeaders
{
  return self->_shouldSendSigningHeaders;
}

- (void)setShouldSendSigningHeaders:(BOOL)a3
{
  self->_shouldSendSigningHeaders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagUrlKey, 0);
  objc_storeStrong((id *)&self->_serviceTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_continuityIDMSData, 0);
  objc_storeStrong((id *)&self->_privateEmailBundleId, 0);
  objc_storeStrong((id *)&self->_privateEmailDomain, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAttestationData, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_proxiedIdentityToken, 0);
  objc_storeStrong((id *)&self->_proxiedAltDSID, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_dataCenterIdentifier, 0);
  objc_storeStrong((id *)&self->_followupItems, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);
  objc_storeStrong((id *)&self->_hasEmptyPasswordOverride, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientAppName, 0);
  objc_storeStrong((id *)&self->_proxyAppName, 0);
  objc_storeStrong((id *)&self->_initialURLRequestKey, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_continuationToken, 0);
  objc_storeStrong((id *)&self->_passwordResetToken, 0);
  objc_storeStrong((id *)&self->_loggedInServices, 0);
  objc_storeStrong((id *)&self->_phoneInformation, 0);
  objc_storeStrong((id *)&self->_phoneNumberCertificate, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_continuationHeaders, 0);
  objc_storeStrong((id *)&self->_proxiedProvisioningController, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)signRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Current process is requesting signing synchronously, this is an error, please do not do this!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Grabbing signing headers from current device.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_87_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to get signing headers, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error while fetching proxied anisette %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_95_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch peer attestation data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchApplicationNameForBundleId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_19202F000, v1, OS_LOG_TYPE_ERROR, "Cannot find application name for %@, got %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_signRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attaching PAC header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attaching PTN header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attaching Phone Info header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attaching ICSC header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request as ephemeral", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attaching PRK header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequest:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Could not determine passcode state with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_signRequest:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Could not find application name for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_signRequest:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Attaching app-name %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)signRequestWithCommonHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with CR token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithCommonHeaders:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with URLSwitching UrlKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithCommonHeaders:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with HB token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithCommonHeaders:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with ID token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithCommonHeaders:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with service token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithBasicHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with the flow identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithBasicHeaders:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with the device session identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithBasicHeaders:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Received error while getting current user's account: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)signRequestWithBasicHeaders:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Setting execution mode to CLI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)signRequestWithBasicHeaders:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Signing request with data center identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signRequestWithBAAHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Server delegate missing bagUrlKey, cannot determine if BAA attestation is needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)decorateWithPrivateEmailContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Decorating with: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithAuthResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Updating delegate identity token failed: key not found in results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateWithAuthResults:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Updating delegate identity token succeeded.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateWithAuthResults:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Custom service token value is set. The results of a reauth are likely unused!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateWithAuthResults:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Updating service token for identifier %@ failed: key not found in results", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithAuthResults:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Updating service token for identifier %@ succeeded", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
