@implementation _MFGmailClientTokenAuthenticator

- (id)saslName
{
  return CFSTR("PLAIN-CLIENTTOKEN");
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
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  if (-[ECSASLAuthenticator authenticationState](self, "authenticationState", a3) == 4)
    goto LABEL_4;
  if (self->_sentResponse)
  {
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
LABEL_4:
    v4 = 0;
    return v4;
  }
  -[ECSASLAuthenticator account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE805B48) & 1) != 0)
  {
    objc_msgSend(v6, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientToken");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 && v8 && v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v4, "appendBytes:length:", &v14, 1);
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v11);

      objc_msgSend(v4, "appendBytes:length:", &v14, 1);
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v12);

      objc_msgSend(v4, "appendBytes:length:", &v14, 1);
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v13);

      self->_sentResponse = 1;
    }
    else
    {
      -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
      -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 2);
      v4 = 0;
    }

  }
  else
  {
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
    v4 = 0;
  }

  return v4;
}

@end
