@implementation _MFOAuth2TokenAuthenticator

- (id)saslName
{
  return CFSTR("XOAUTH2");
}

- (BOOL)supportsInitialClientResponse
{
  return 1;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

- (id)responseForServerData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  if (-[ECSASLAuthenticator authenticationState](self, "authenticationState") > 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (self->_sentResponse)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = 2;
    else
      v6 = 3;
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", v6);

    goto LABEL_7;
  }
  -[ECSASLAuthenticator account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE7FEB50) & 1) != 0)
  {
    objc_msgSend(v9, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oauth2Token");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("user=%@"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendData:", v14);

      objc_msgSend(v7, "appendBytes:length:", &v17, 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("auth=Bearer %@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dataUsingEncoding:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendData:", v16);

      objc_msgSend(v7, "appendBytes:length:", &v17, 1);
      objc_msgSend(v7, "appendBytes:length:", &v17, 1);
      self->_sentResponse = 1;
    }
    else
    {
      -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
      v7 = 0;
    }

  }
  else
  {
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
    v7 = 0;
  }

LABEL_8:
  return v7;
}

@end
