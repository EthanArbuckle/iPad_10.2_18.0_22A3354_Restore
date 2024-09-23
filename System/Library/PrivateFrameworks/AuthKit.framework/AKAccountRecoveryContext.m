@implementation AKAccountRecoveryContext

+ (AKAccountRecoveryContext)recoveryContextWithServerInfo:(id)a3
{
  id v4;
  NSObject *v5;
  AKAppleIDAuthenticationContext *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Building recovery context with info: %@", (uint8_t *)&v20, 0xCu);
  }

  v6 = objc_alloc_init(AKAppleIDAuthenticationContext);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Alternate-Id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext setAltDSID:](v6, "setAltDSID:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-DSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext setDSID:](v6, "setDSID:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AKUsername"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext setUsername:](v6, "setUsername:", v9);

  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setAuthContext:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-AK-Action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupportsMasterKeyRecovery:", objc_msgSend(v11, "isEqualToString:", CFSTR("mk-validation")));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Recovery-Identity-Token"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEncodedRecoveryIdentityToken:", v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Recovery-PE-Token"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEncodedRecoveryPET:", v13);

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RKMandate"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  objc_msgSend(v10, "setMandatesRecoveryKey:", objc_msgSend(v15, "isEqualToString:", CFSTR("true")));
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AKRecoveryURLKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecoveryContinuationURL:", v18);

  return (AKAccountRecoveryContext *)v10;
}

+ (AKAccountRecoveryContext)recoveryContextWithAuthContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Building recovery context with authContext: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setAuthContext:", v4);

  return (AKAccountRecoveryContext *)v6;
}

- (AKAccountRecoveryContext)initWithCoder:(id)a3
{
  id v4;
  AKAccountRecoveryContext *v5;
  uint64_t v6;
  NSString *encodedRecoveryIdentityToken;
  uint64_t v8;
  NSString *encodedRecoveryPET;
  uint64_t v10;
  AKAppleIDAuthenticationContext *authContext;
  uint64_t v12;
  NSURL *recoveryContinuationURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAccountRecoveryContext;
  v5 = -[AKAccountRecoveryContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_encodedRecoveryIdentityToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    encodedRecoveryIdentityToken = v5->_encodedRecoveryIdentityToken;
    v5->_encodedRecoveryIdentityToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_encodedRecoveryPET"));
    v8 = objc_claimAutoreleasedReturnValue();
    encodedRecoveryPET = v5->_encodedRecoveryPET;
    v5->_encodedRecoveryPET = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recoveryContinuationURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    recoveryContinuationURL = v5->_recoveryContinuationURL;
    v5->_recoveryContinuationURL = (NSURL *)v12;

    v5->_supportsMasterKeyRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsMasterKeyRecovery"));
    v5->_mandatesRecoveryKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_mandatesRecoveryKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *encodedRecoveryIdentityToken;
  id v5;

  encodedRecoveryIdentityToken = self->_encodedRecoveryIdentityToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encodedRecoveryIdentityToken, CFSTR("_encodedRecoveryIdentityToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encodedRecoveryPET, CFSTR("_encodedRecoveryPET"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authContext, CFSTR("_authContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryContinuationURL, CFSTR("_recoveryContinuationURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsMasterKeyRecovery, CFSTR("_supportsMasterKeyRecovery"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mandatesRecoveryKey, CFSTR("_mandatesRecoveryKey"));

}

- (NSString)decodedRecoveryIdentityTokenString
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAccountRecoveryContext encodedRecoveryIdentityToken](self, "encodedRecoveryIdentityToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)decodedRecoveryPETString
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAccountRecoveryContext encodedRecoveryPET](self, "encodedRecoveryPET");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v17;

  -[AKAccountRecoveryContext decodedRecoveryIdentityTokenString](self, "decodedRecoveryIdentityTokenString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountRecoveryContext decodedRecoveryPETString](self, "decodedRecoveryPETString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountRecoveryContext authContext](self, "authContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountRecoveryContext recoveryContinuationURL](self, "recoveryContinuationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountRecoveryContext authContext](self, "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountRecoveryContext authContext](self, "authContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "DSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v12 = v4 == 0;
  else
    v12 = 1;
  v17 = !v12 && v6 != 0 && v7 != 0 && v9 != 0 && v11 != 0;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsMasterKeyRecovery
{
  return self->_supportsMasterKeyRecovery;
}

- (void)setSupportsMasterKeyRecovery:(BOOL)a3
{
  self->_supportsMasterKeyRecovery = a3;
}

- (BOOL)mandatesRecoveryKey
{
  return self->_mandatesRecoveryKey;
}

- (void)setMandatesRecoveryKey:(BOOL)a3
{
  self->_mandatesRecoveryKey = a3;
}

- (NSString)encodedRecoveryIdentityToken
{
  return self->_encodedRecoveryIdentityToken;
}

- (void)setEncodedRecoveryIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)encodedRecoveryPET
{
  return self->_encodedRecoveryPET;
}

- (void)setEncodedRecoveryPET:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)recoveryContinuationURL
{
  return self->_recoveryContinuationURL;
}

- (void)setRecoveryContinuationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_recoveryContinuationURL, 0);
  objc_storeStrong((id *)&self->_encodedRecoveryPET, 0);
  objc_storeStrong((id *)&self->_encodedRecoveryIdentityToken, 0);
}

@end
