@implementation _MFNewcastleAuthenticator

- (_MFNewcastleAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MFNewcastleAuthenticator *v11;
  CastleIMAPAccount *v12;
  CastleIMAPAccount *castleAccount;
  CastleIMAPAccount *v14;
  _MFNewcastleAuthenticator *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MFNewcastleAuthenticator;
  v11 = -[ECSASLAuthenticator initWithAuthenticationScheme:account:connection:](&v18, sel_initWithAuthenticationScheme_account_connection_, v8, v9, v10);
  if (!v11)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v9, "mailAccountIfAvailable");
    v14 = (CastleIMAPAccount *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      castleAccount = v11->_castleAccount;
      v11->_castleAccount = v14;
      goto LABEL_4;
    }
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#Warning couldn't find our CastleAccount for our sending account: %@", buf, 0xCu);
    }

LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v12 = (CastleIMAPAccount *)v9;
  castleAccount = v11->_castleAccount;
  v11->_castleAccount = v12;
LABEL_4:

LABEL_8:
  v15 = v11;
LABEL_13:

  return v15;
}

- (id)saslName
{
  if (-[_MFNewcastleAuthenticator useATOKEN2Authentication](self, "useATOKEN2Authentication"))
    return CFSTR("ATOKEN2");
  else
    return CFSTR("ATOKEN");
}

- (BOOL)supportsInitialClientResponse
{
  return 1;
}

- (id)responseForServerData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[_MFNewcastleAuthenticator useATOKEN2Authentication](self, "useATOKEN2Authentication"))
    -[_MFNewcastleAuthenticator responseForServerDataATOKEN2:](self, "responseForServerDataATOKEN2:", v4);
  else
    -[_MFNewcastleAuthenticator responseForServerDataATOKEN:](self, "responseForServerDataATOKEN:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)responseForServerDataATOKEN:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint8_t buf[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "-[NewcastleAuthentication responseForServerDataATOKEN]", buf, 2u);
  }

  if (-[ECSASLAuthenticator authenticationState](self, "authenticationState") == 4)
    goto LABEL_6;
  if (self->_sentResponse)
  {
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
LABEL_6:
    v5 = 0;
    return v5;
  }
  -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v21)
  {
    -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anisetteDataWithError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "machineID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "oneTimePassword");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    if (objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
    {
      -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v21, "length")+ objc_msgSend(v11, "length")+ objc_msgSend(v15, "length")+ objc_msgSend(v17, "length")+ objc_msgSend(v20, "length")+ 5);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v5, "appendBytes:length:", &v22, 1);
        objc_msgSend(v5, "appendData:", v21);
        objc_msgSend(v5, "appendBytes:length:", &v22, 1);
        objc_msgSend(v5, "appendData:", v11);
        objc_msgSend(v5, "appendBytes:length:", &v22, 1);
        objc_msgSend(v5, "appendData:", v15);
        objc_msgSend(v5, "appendBytes:length:", &v22, 1);
        objc_msgSend(v5, "appendData:", v17);
        objc_msgSend(v5, "appendBytes:length:", &v22, 1);
        objc_msgSend(v5, "appendData:", v20);
        self->_sentResponse = 1;
      }
      else
      {
        -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
        v5 = 0;
      }

    }
    else
    {
      -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
      v5 = 0;
    }

  }
  else
  {
    -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
    v5 = 0;
  }

  return v5;
}

- (id)responseForServerDataATOKEN2:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v15[16];
  uint8_t buf[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "-[NewcastleAuthentication responseForServerDataATOKEN2]", buf, 2u);
  }

  if (-[ECSASLAuthenticator authenticationState](self, "authenticationState") == 4)
    goto LABEL_6;
  if (self->_sentResponse)
  {
    -[ECSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
LABEL_6:
    v5 = 0;
    return v5;
  }
  -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v8 = objc_claimAutoreleasedReturnValue();
    -[_MFNewcastleAuthenticator castleAccount](self, "castleAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject completionHandlerAdapter](v8, "completionHandlerAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appleID2AuthWithCompletion:", v10);

    -[NSObject future](v8, "future");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v11, "result:", &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v5)
    {
      self->_sentResponse = 1;
    }
    else
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_MFNewcastleAuthenticator responseForServerDataATOKEN2:].cold.1((uint64_t)v12, v13);

    }
  }
  else
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Account type not CastleIMAPAccount", v15, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

- (BOOL)useATOKEN2Authentication
{
  char v2;
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInternal"))
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "isVirtualMachine");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (CastleIMAPAccount)castleAccount
{
  return self->_castleAccount;
}

- (void)setCastleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_castleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_castleAccount, 0);
}

- (void)responseForServerDataATOKEN2:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Error getting auth details - %@", (uint8_t *)&v2, 0xCu);
}

@end
