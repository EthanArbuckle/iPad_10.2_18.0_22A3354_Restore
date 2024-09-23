@implementation AAAppleIDSettingsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAAppleIDSettingsRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4
{
  id v7;
  id v8;
  AAAppleIDSettingsRequest *v9;
  AAAppleIDSettingsRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAAppleIDSettingsRequest;
  v9 = -[AAAppleIDSettingsRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_grandSlamAccount, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v10->_forceGSToken = 1;
  }

  return v10;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  ACAccount *grandSlamAccount;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  ACAccountStore *store;
  ACAccount *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  NSObject *v18;
  uint8_t *v19;
  uint8_t v20[16];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)AAAppleIDSettingsRequest;
  -[AARequest urlRequest](&v27, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    if (-[AAAppleIDSettingsRequest forceGSToken](self, "forceGSToken"))
    {
      _AALogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "GrandSlam signing will fail because no GS account was provided.", buf, 2u);
      }
      goto LABEL_12;
    }
    grandSlamAccount = self->_grandSlamAccount;
  }
  -[ACAccount aida_dsid](grandSlamAccount, "aida_dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v7);

  -[ACAccountStore credentialForAccount:serviceID:](self->_store, "credentialForAccount:serviceID:", self->_grandSlamAccount, CFSTR("com.apple.gs.appleid.auth"));
  v6 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  -[NSObject token](v6, "token");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!*((_QWORD *)v22 + 5) && -[AAAppleIDSettingsRequest forceGSToken](self, "forceGSToken"))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Could not get GS auth on first try. Will need to prompt for password", v20, 2u);
    }

    v9 = dispatch_semaphore_create(0);
    store = self->_store;
    v11 = self->_grandSlamAccount;
    v28[0] = CFSTR("com.apple.gs.appleid.auth");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __38__AAAppleIDSettingsRequest_urlRequest__block_invoke;
    v17[3] = &unk_1E416EAA0;
    v17[4] = self;
    v19 = buf;
    v13 = v9;
    v18 = v13;
    -[ACAccountStore renewCredentialsForAccount:services:completion:](store, "renewCredentialsForAccount:services:completion:", v11, v12, v17);

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  -[ACAccount aida_alternateDSID](self->_grandSlamAccount, "aida_alternateDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v14, *((_QWORD *)v22 + 5));

  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v15, CFSTR("X-AppleID-Device-Udid"));

  _Block_object_dispose(buf, 8);
LABEL_12:

  return v4;
}

void __38__AAAppleIDSettingsRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "No way to sign request with GS token because renewal of GS credential failed: %ld, %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "credentialForAccount:serviceID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("com.apple.gs.appleid.auth"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject token](v6, "token");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (BOOL)forceGSToken
{
  return self->_forceGSToken;
}

- (void)setForceGSToken:(BOOL)a3
{
  self->_forceGSToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
