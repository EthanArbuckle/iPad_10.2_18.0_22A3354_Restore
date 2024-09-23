@implementation AKAuthorizationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationCredential)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationCredential;
  return -[AKAuthorizationCredential init](&v3, sel_init);
}

- (AKAuthorizationCredential)initWithServerResponse:(id)a3
{
  id v4;
  AKAuthorizationCredential *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *userIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSData *identityToken;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSData *authorizationCode;
  void *v22;
  uint64_t v23;
  NSString *state;
  void *v25;
  uint64_t v26;
  NSArray *authorizedScopes;
  uint64_t v28;
  NSString *transactionID;
  NSObject *v30;
  AKUserInformation *v31;
  AKUserInformation *userInformation;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AKAuthorizationCredential;
  v5 = -[AKAuthorizationCredential init](&v39, sel_init);
  if (v5)
  {
    _AKLogSiwa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "serverProvidedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v7;
      _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Parsing server provided Data %@", buf, 0xCu);

    }
    objc_msgSend(v4, "serverProvidedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uid"));
    v9 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v9;

    objc_msgSend(v4, "serviceTokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IDToken"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v15 = objc_claimAutoreleasedReturnValue();
      identityToken = v5->_identityToken;
      v5->_identityToken = (NSData *)v15;

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("authCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v20 = objc_claimAutoreleasedReturnValue();
      authorizationCode = v5->_authorizationCode;
      v5->_authorizationCode = (NSData *)v20;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("apd"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("state"));
    v23 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v23;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isLikelyRealUser"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_isLikelyRealUser = objc_msgSend(v25, "integerValue") == 1;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scopes"));
    v26 = objc_claimAutoreleasedReturnValue();
    authorizedScopes = v5->_authorizedScopes;
    v5->_authorizedScopes = (NSArray *)v26;

    objc_msgSend(v4, "transactionId");
    v28 = objc_claimAutoreleasedReturnValue();
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v28;

    _AKLogSiwa();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[AKAuthorizationCredential initWithServerResponse:].cold.1(v4, v30);

    v31 = objc_alloc_init(AKUserInformation);
    userInformation = v5->_userInformation;
    v5->_userInformation = v31;

    objc_msgSend(v4, "privateEmail");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUserInformation setSelectedEmail:](v5->_userInformation, "setSelectedEmail:", v33);

    objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("webAccessEnabled"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;

    -[AKUserInformation setWebAccessEnabled:](v5->_userInformation, "setWebAccessEnabled:", v35);
    objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serverExperimentalFeatures"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;

    -[AKUserInformation setServerExperimentalFeatures:](v5->_userInformation, "setServerExperimentalFeatures:", v37);
  }

  return v5;
}

- (AKAuthorizationCredential)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationCredential *v5;
  uint64_t v6;
  NSString *userIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *authorizedScopes;
  uint64_t v13;
  AKUserInformation *userInformation;
  uint64_t v15;
  NSData *authorizationCode;
  uint64_t v17;
  NSData *identityToken;
  uint64_t v19;
  NSString *state;
  uint64_t v21;
  NSString *transactionID;
  AKAuthorizationCredential *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKAuthorizationCredential;
  v5 = -[AKAuthorizationCredential init](&v26, sel_init);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKUserIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  userIdentifier = v5->_userIdentifier;
  v5->_userIdentifier = (NSString *)v6;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("AKAuthorizedScopes"));
  v11 = objc_claimAutoreleasedReturnValue();
  authorizedScopes = v5->_authorizedScopes;
  v5->_authorizedScopes = (NSArray *)v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKUserInformation"));
  v13 = objc_claimAutoreleasedReturnValue();
  userInformation = v5->_userInformation;
  v5->_userInformation = (AKUserInformation *)v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKAuthorizationCode"));
  v15 = objc_claimAutoreleasedReturnValue();
  authorizationCode = v5->_authorizationCode;
  v5->_authorizationCode = (NSData *)v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKIdentityToken"));
  v17 = objc_claimAutoreleasedReturnValue();
  identityToken = v5->_identityToken;
  v5->_identityToken = (NSData *)v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_state"));
  v19 = objc_claimAutoreleasedReturnValue();
  state = v5->_state;
  v5->_state = (NSString *)v19;

  v5->_isLikelyRealUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isLikelyRealUser"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionID"));
  v21 = objc_claimAutoreleasedReturnValue();
  transactionID = v5->_transactionID;
  v5->_transactionID = (NSString *)v21;

  if (!v5->_userIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7044);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v24);

    v23 = 0;
  }
  else
  {
LABEL_3:
    v23 = v5;
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  NSString *userIdentifier;
  NSData *identityToken;
  NSData *authorizationCode;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  userIdentifier = self->_userIdentifier;
  identityToken = self->_identityToken;
  authorizationCode = self->_authorizationCode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLikelyRealUser);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Authorization Credential:\n UID: %@ \n Identity Token: %@ \n AuthorizationCode: %@ \n User Verification Result: %@ \n User Info: %@ /n Transaction ID: %@"), userIdentifier, identityToken, authorizationCode, v7, self->_userInformation, self->_transactionID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userIdentifier;
  id v5;

  userIdentifier = self->_userIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userIdentifier, CFSTR("AKUserIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizedScopes, CFSTR("AKAuthorizedScopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInformation, CFSTR("AKUserInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationCode, CFSTR("AKAuthorizationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityToken, CFSTR("AKIdentityToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLikelyRealUser, CFSTR("_isLikelyRealUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionID, CFSTR("_transactionID"));

}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSArray)authorizedScopes
{
  return self->_authorizedScopes;
}

- (void)setAuthorizedScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)authorizationCode
{
  return self->_authorizationCode;
}

- (void)setAuthorizationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
  objc_storeStrong((id *)&self->_userInformation, a3);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (BOOL)isLikelyRealUser
{
  return self->_isLikelyRealUser;
}

- (void)setIsLikelyRealUser:(BOOL)a3
{
  self->_isLikelyRealUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizedScopes, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)initWithServerResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "transactionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "AKAuthorizationCredential Successfully created with transaction id:%@", (uint8_t *)&v4, 0xCu);

}

@end
