@implementation AACustodianPasswordResetInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianPasswordResetInformation)initWithCoder:(id)a3
{
  id v4;
  AACustodianPasswordResetInformation *v5;
  uint64_t v6;
  NSString *custodianRecoveryToken;
  uint64_t v8;
  NSString *ownerAppleID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AACustodianPasswordResetInformation;
  v5 = -[AACustodianPasswordResetInformation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerAppleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *custodianRecoveryToken;
  id v5;

  custodianRecoveryToken = self->_custodianRecoveryToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", custodianRecoveryToken, CFSTR("_custodianRecoveryToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerAppleID, CFSTR("_ownerAppleID"));

}

- (AACustodianPasswordResetInformation)initWithRecoveryToken:(id)a3 ownerAppleID:(id)a4
{
  id v7;
  id v8;
  AACustodianPasswordResetInformation *v9;
  AACustodianPasswordResetInformation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AACustodianPasswordResetInformation;
  v9 = -[AACustodianPasswordResetInformation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_custodianRecoveryToken, a3);
    objc_storeStrong((id *)&v10->_ownerAppleID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AACustodianPasswordResetInformation *v4;
  uint64_t v5;
  NSString *custodianRecoveryToken;
  uint64_t v7;
  NSString *ownerAppleID;

  v4 = -[AACustodianPasswordResetInformation init](+[AACustodianPasswordResetInformation allocWithZone:](AACustodianPasswordResetInformation, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_custodianRecoveryToken, "copy");
  custodianRecoveryToken = v4->_custodianRecoveryToken;
  v4->_custodianRecoveryToken = (NSString *)v5;

  v7 = -[NSString copy](self->_ownerAppleID, "copy");
  ownerAppleID = v4->_ownerAppleID;
  v4->_ownerAppleID = (NSString *)v7;

  return v4;
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
}

@end
