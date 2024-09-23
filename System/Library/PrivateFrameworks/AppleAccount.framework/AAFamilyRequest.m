@implementation AAFamilyRequest

- (AAFamilyRequest)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAFamilyRequest *v12;
  AAFamilyRequest *v13;
  AAGrandSlamSigner *v14;
  AAGrandSlamSigner *grandSlamSigner;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AAFamilyRequest;
  v12 = -[AAFamilyRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appleAccount, a3);
    v14 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]([AAGrandSlamSigner alloc], "initWithAccountStore:grandSlamAccount:appTokenID:", v11, v10, CFSTR("com.apple.gs.icloud.auth"));
    grandSlamSigner = v13->_grandSlamSigner;
    v13->_grandSlamSigner = v14;

  }
  return v13;
}

- (AAFamilyRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4
{
  id v6;
  id v7;
  AAFamilyRequest *v8;
  AAGrandSlamSigner *v9;
  AAGrandSlamSigner *grandSlamSigner;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAFamilyRequest;
  v8 = -[AAFamilyRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]([AAGrandSlamSigner alloc], "initWithAccountStore:grandSlamAccount:appTokenID:", v7, v6, CFSTR("com.apple.gs.icloud.family.auth"));
    grandSlamSigner = v8->_grandSlamSigner;
    v8->_grandSlamSigner = v9;

  }
  return v8;
}

- (AAFamilyRequest)initWithGrandSlamSigner:(id)a3
{
  id v5;
  AAFamilyRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ACAccount *appleAccount;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAFamilyRequest;
  v6 = -[AAFamilyRequest init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "grandSlamAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aida_iCloudAccountMatchingAppleIDAuthAccount:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    appleAccount = v6->_appleAccount;
    v6->_appleAccount = (ACAccount *)v9;

    objc_storeStrong((id *)&v6->_grandSlamSigner, a3);
  }

  return v6;
}

- (id)_familyGrandSlamSigner
{
  AAGrandSlamSigner *familyGrandSlamSigner;
  AAGrandSlamSigner *v4;
  void *v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  familyGrandSlamSigner = self->_familyGrandSlamSigner;
  if (!familyGrandSlamSigner)
  {
    v4 = [AAGrandSlamSigner alloc];
    -[AAGrandSlamSigner accountStore](self->_grandSlamSigner, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAGrandSlamSigner grandSlamAccount](self->_grandSlamSigner, "grandSlamAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:](v4, "initWithAccountStore:grandSlamAccount:appTokenID:", v5, v6, CFSTR("com.apple.gs.icloud.family.auth"));
    v8 = self->_familyGrandSlamSigner;
    self->_familyGrandSlamSigner = v7;

    -[AAGrandSlamSigner setHeaderFieldKey:](self->_familyGrandSlamSigner, "setHeaderFieldKey:", CFSTR("X-Apple-Family-GS-Token"));
    familyGrandSlamSigner = self->_familyGrandSlamSigner;
  }
  return familyGrandSlamSigner;
}

- (BOOL)isUserInitiated
{
  return 0;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AAFamilyRequest;
  -[AARequest urlRequest](&v11, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_appleAccount, 0);
  objc_msgSend(v4, "aa_addDeviceInternalDevHeaderIfEnabled");
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  objc_msgSend(v4, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_appleAccount);
  objc_msgSend(v4, "aa_addLocationSharingAllowedHeader");
  if (!-[AAGrandSlamSigner signURLRequest:isUserInitiated:](self->_grandSlamSigner, "signURLRequest:isUserInitiated:", v4, -[AAFamilyRequest isUserInitiated](self, "isUserInitiated")))
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed!", v10, 2u);
    }

  }
  -[AAFamilyRequest _familyGrandSlamSigner](self, "_familyGrandSlamSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "signURLRequest:isUserInitiated:", v4, -[AAFamilyRequest isUserInitiated](self, "isUserInitiated"));

  if ((v7 & 1) == 0)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed for _familyGrandSlamSigner", v10, 2u);
    }

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
