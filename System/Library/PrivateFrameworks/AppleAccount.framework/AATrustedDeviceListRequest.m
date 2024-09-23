@implementation AATrustedDeviceListRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AATrustedDeviceListRequest)initWithURLString:(id)a3 accountStore:(id)a4 grandSlamAccount:(id)a5
{
  id v8;
  id v9;
  AATrustedDeviceListRequest *v10;
  AAGrandSlamSigner *v11;
  AAGrandSlamSigner *grandSlamSigner;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AATrustedDeviceListRequest;
  v10 = -[AARequest initWithURLString:](&v14, sel_initWithURLString_, a3);
  if (v10)
  {
    v11 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]([AAGrandSlamSigner alloc], "initWithAccountStore:grandSlamAccount:appTokenID:", v8, v9, CFSTR("com.apple.gs.appleid.auth"));
    grandSlamSigner = v10->_grandSlamSigner;
    v10->_grandSlamSigner = v11;

  }
  return v10;
}

- (id)urlString
{
  void *grandSlamSigner;
  void *v4;
  void *v5;
  objc_super v7;

  grandSlamSigner = self->_grandSlamSigner;
  if (grandSlamSigner)
  {
    objc_msgSend(grandSlamSigner, "grandSlamAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      && (-[AAGrandSlamSigner accountStore](self->_grandSlamSigner, "accountStore"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      v7.receiver = self;
      v7.super_class = (Class)AATrustedDeviceListRequest;
      -[AARequest urlString](&v7, sel_urlString);
      grandSlamSigner = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      grandSlamSigner = 0;
    }
  }
  return grandSlamSigner;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AATrustedDeviceListRequest;
  -[AARequest urlRequest](&v12, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);

  }
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  -[AAGrandSlamSigner setUseAltDSID:](self->_grandSlamSigner, "setUseAltDSID:", 1);
  if (!-[AAGrandSlamSigner signURLRequest:isUserInitiated:](self->_grandSlamSigner, "signURLRequest:isUserInitiated:", v4, 0))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed!", buf, 2u);
    }

  }
  -[AAGrandSlamSigner grandSlamAccount](self->_grandSlamSigner, "grandSlamAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aida_alternateDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addGrandslamAuthorizationheaderWithAltDSID:heartbeatToken:", v9, self->_heartbeatToken);

  objc_msgSend(v4, "aa_addDeviceIDHeader");
  +[AADeviceInfo serialNumber](AADeviceInfo, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-I-SRL-NO"));

  objc_msgSend(v4, "aa_addContentTypeHeaders:", CFSTR("application/json"));
  return v4;
}

- (NSString)heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)setHeartbeatToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

@end
