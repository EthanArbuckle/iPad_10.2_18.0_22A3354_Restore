@implementation ECSASLAuthenticator

- (ECSASLAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  id v9;
  id v10;
  id v11;
  ECSASLAuthenticator *v12;
  ECSASLAuthenticator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ECSASLAuthenticator;
  v12 = -[ECSASLAuthenticator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authenticationScheme, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_connection, a5);
  }

  return v13;
}

- (id)authScheme
{
  return self->_authenticationScheme;
}

- (ECAuthenticatableAccount)account
{
  return self->_account;
}

- (NSString)saslName
{
  return -[ECAuthenticationScheme name](self->_authenticationScheme, "name");
}

- (BOOL)supportsInitialClientResponse
{
  return 0;
}

- (id)responseForServerData:(id)a3
{
  -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 2);
  return 0;
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (BOOL)justSentPlainTextPassword
{
  return 0;
}

- (ECSASLSecurityLayer)securityLayer
{
  return 0;
}

- (BOOL)isUsingSSL
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ECAuthenticatableConnection securityProtocol](self->_connection, "securityProtocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "caseInsensitiveCompare:", *MEMORY[0x1E0C9B328]) != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)usesBase64EncodeResponseData
{
  return 1;
}

- (BOOL)couldRetry
{
  return 0;
}

- (void)setMissingPasswordError
{
  id v2;

  -[ECSASLAuthenticator account](self, "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMissingPasswordError");

}

- (ECAuthenticationScheme)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
