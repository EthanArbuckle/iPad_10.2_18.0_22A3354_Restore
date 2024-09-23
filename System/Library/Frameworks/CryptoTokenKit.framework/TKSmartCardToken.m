@implementation TKSmartCardToken

- (TKSmartCardToken)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID instanceID:(NSString *)instanceID tokenDriver:(TKSmartCardTokenDriver *)tokenDriver
{
  TKSmartCard *v10;
  NSData *v11;
  TKSmartCardToken *v12;
  void *v13;
  uint64_t v14;
  TKSmartCard *v15;
  TKTokenKeychainContents *v16;
  void *v17;
  TKTokenKeychainContents *v18;
  objc_super v20;

  v10 = smartCard;
  v11 = AID;
  v20.receiver = self;
  v20.super_class = (Class)TKSmartCardToken;
  v12 = -[TKToken initWithTokenDriver:instanceID:](&v20, sel_initWithTokenDriver_instanceID_, tokenDriver, instanceID);
  if (v12)
  {
    -[TKSmartCard slot](v10, "slot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeSmartCard");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v12->_smartCard;
    v12->_smartCard = (TKSmartCard *)v14;

    objc_storeStrong((id *)&v12->_AID, AID);
    v16 = [TKTokenKeychainContents alloc];
    -[TKToken configuration](v12, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TKTokenKeychainContents initWithConfiguration:](v16, "initWithConfiguration:", v17);
    -[TKToken setKeychainContents:](v12, "setKeychainContents:", v18);

  }
  return v12;
}

- (NSData)AID
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (TKSmartCard)smartCard
{
  return self->_smartCard;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
  objc_storeStrong(&self->_keepAlive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_smartCard, 0);
  objc_storeStrong((id *)&self->_AID, 0);
}

@end
