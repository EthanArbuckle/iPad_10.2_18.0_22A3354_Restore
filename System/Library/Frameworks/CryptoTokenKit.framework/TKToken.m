@implementation TKToken

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKToken tokenID](self, "tokenID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %p>"), v5, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TKToken)initWithTokenDriver:(TKTokenDriver *)tokenDriver instanceID:(TKTokenInstanceID)instanceID
{
  TKTokenDriver *v7;
  NSString *v8;
  TKToken *v9;
  TKToken *v10;
  TKTokenID *v11;
  void *v12;
  uint64_t v13;
  TKTokenID *tokenID;
  objc_super v16;

  v7 = tokenDriver;
  v8 = instanceID;
  v16.receiver = self;
  v16.super_class = (Class)TKToken;
  v9 = -[TKToken init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenDriver, tokenDriver);
    if (-[TKToken conformsToProtocol:](v10, "conformsToProtocol:", &unk_1EF237AB8))
      objc_storeWeak((id *)&v10->_delegate, v10);
    v11 = [TKTokenID alloc];
    -[TKTokenDriver classID](v7, "classID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TKTokenID initWithClassID:instanceID:](v11, "initWithClassID:instanceID:", v12, v8);
    tokenID = v10->_tokenID;
    v10->_tokenID = (TKTokenID *)v13;

  }
  return v10;
}

- (TKTokenConfiguration)configuration
{
  TKToken *v2;
  TKTokenConfiguration *configuration;
  TKTokenConfiguration *v4;
  TKTokenID *tokenID;
  void *v6;
  void *v7;
  uint64_t v8;
  TKTokenConfiguration *v9;
  TKTokenConfiguration *v10;

  v2 = self;
  objc_sync_enter(v2);
  configuration = v2->_configuration;
  if (!configuration)
  {
    v4 = [TKTokenConfiguration alloc];
    tokenID = v2->_tokenID;
    -[TKTokenDriver context](v2->_tokenDriver, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TKTokenConfiguration initWithTokenID:configurationConnection:](v4, "initWithTokenID:configurationConnection:", tokenID, v7);
    v9 = v2->_configuration;
    v2->_configuration = (TKTokenConfiguration *)v8;

    configuration = v2->_configuration;
  }
  v10 = configuration;
  objc_sync_exit(v2);

  return v10;
}

- (void)terminate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[TKToken tokenDriver](self, "tokenDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TKToken tokenDriver](self, "tokenDriver");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKToken tokenDriver](self, "tokenDriver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenDriver:terminateToken:", v7, self);

  }
}

- (TKTokenDriver)tokenDriver
{
  return (TKTokenDriver *)objc_getProperty(self, a2, 16, 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (TKTokenKeychainContents)keychainContents
{
  return (TKTokenKeychainContents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeychainContents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_keychainContents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tokenDriver, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
