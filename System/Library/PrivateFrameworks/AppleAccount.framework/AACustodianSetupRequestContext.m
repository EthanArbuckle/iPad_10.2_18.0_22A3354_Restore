@implementation AACustodianSetupRequestContext

- (AACustodianSetupRequestContext)initWithHandle:(id)a3 authResults:(id)a4
{
  id v7;
  id v8;
  AACustodianSetupRequestContext *v9;
  AACustodianSetupRequestContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AACustodianSetupRequestContext;
  v9 = -[AACustodianSetupRequestContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    -[AACustodianSetupRequestContext _parseAuthResults:](v10, "_parseAuthResults:", v8);
  }

  return v10;
}

- (AACustodianSetupRequestContext)initWithCoder:(id)a3
{
  id v4;
  AACustodianSetupRequestContext *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *custodianSetupToken;
  uint64_t v10;
  NSString *contactID;

  v4 = a3;
  v5 = -[AACustodianSetupRequestContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianSetupToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    custodianSetupToken = v5->_custodianSetupToken;
    v5->_custodianSetupToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactID"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianSetupToken, CFSTR("_custodianSetupToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactID, CFSTR("_contactID"));

}

- (void)_parseAuthResults:(id)a3
{
  NSString *v4;
  NSString *custodianSetupToken;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.gs.idms.custodian.add"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  custodianSetupToken = self->_custodianSetupToken;
  self->_custodianSetupToken = v4;

}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_custodianSetupToken, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
