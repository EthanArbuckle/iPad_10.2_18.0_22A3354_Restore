@implementation AACustodianRecoveryRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianRecoveryRequestContext)initWithCoder:(id)a3
{
  id v4;
  AACustodianRecoveryRequestContext *v5;
  uint64_t v6;
  NSString *ownerAppleID;
  uint64_t v8;
  NSString *recoverySessionID;
  uint64_t v10;
  NSString *recoveryCode;
  uint64_t v12;
  NSUUID *custodianUUID;
  uint64_t v14;
  NSString *custodianRecoveryToken;
  uint64_t v16;
  NSString *recordBuildVersion;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AACustodianRecoveryRequestContext;
  v5 = -[AACustodianRecoveryRequestContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerAppleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recoverySessionID"));
    v8 = objc_claimAutoreleasedReturnValue();
    recoverySessionID = v5->_recoverySessionID;
    v5->_recoverySessionID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_code"));
    v10 = objc_claimAutoreleasedReturnValue();
    recoveryCode = v5->_recoveryCode;
    v5->_recoveryCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v12;

    v5->_CLIMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cliMode"));
    v5->_dataOnlyRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_dataOnlyRecovery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordBuildVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *ownerAppleID;
  id v5;

  ownerAppleID = self->_ownerAppleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ownerAppleID, CFSTR("_ownerAppleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoverySessionID, CFSTR("_recoverySessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryCode, CFSTR("_code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianUUID, CFSTR("_custodianUUID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_CLIMode, CFSTR("_cliMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dataOnlyRecovery, CFSTR("_dataOnlyRecovery"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianRecoveryToken, CFSTR("_custodianRecoveryToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordBuildVersion, CFSTR("_recordBuildVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AACustodianRecoveryRequestContext *v4;
  uint64_t v5;
  NSString *ownerAppleID;
  uint64_t v7;
  NSString *recoverySessionID;
  uint64_t v9;
  NSString *recoveryCode;
  uint64_t v11;
  NSUUID *custodianUUID;
  uint64_t v13;
  NSString *custodianRecoveryToken;
  uint64_t v15;
  NSString *recordBuildVersion;

  v4 = -[AACustodianRecoveryRequestContext init](+[AACustodianRecoveryRequestContext allocWithZone:](AACustodianRecoveryRequestContext, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_ownerAppleID, "copy");
  ownerAppleID = v4->_ownerAppleID;
  v4->_ownerAppleID = (NSString *)v5;

  v7 = -[NSString copy](self->_recoverySessionID, "copy");
  recoverySessionID = v4->_recoverySessionID;
  v4->_recoverySessionID = (NSString *)v7;

  v9 = -[NSString copy](self->_recoveryCode, "copy");
  recoveryCode = v4->_recoveryCode;
  v4->_recoveryCode = (NSString *)v9;

  v11 = -[NSUUID copy](self->_custodianUUID, "copy");
  custodianUUID = v4->_custodianUUID;
  v4->_custodianUUID = (NSUUID *)v11;

  v4->_CLIMode = self->_CLIMode;
  v4->_dataOnlyRecovery = self->_dataOnlyRecovery;
  v13 = -[NSString copy](self->_custodianRecoveryToken, "copy");
  custodianRecoveryToken = v4->_custodianRecoveryToken;
  v4->_custodianRecoveryToken = (NSString *)v13;

  v15 = -[NSString copy](self->_recordBuildVersion, "copy");
  recordBuildVersion = v4->_recordBuildVersion;
  v4->_recordBuildVersion = (NSString *)v15;

  return v4;
}

- (id)description
{
  const __CFString *v2;

  if (self->_dataOnlyRecovery)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CustodianRecoveryRequestContext with ownerAppleID: %@ \nsessionID: %@ \nrecoveryCode: %@ \ncustodianUUID: %@ \nrecoveryToken: %@ \ncliMode: %i \ndataOnly: %@, recordBuildVersion: %@"), self->_ownerAppleID, self->_recoverySessionID, self->_recoveryCode, self->_custodianUUID, self->_custodianRecoveryToken, self->_CLIMode, v2, self->_recordBuildVersion);
}

- (NSString)recoverySessionID
{
  return self->_recoverySessionID;
}

- (void)setRecoverySessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)recoveryCode
{
  return self->_recoveryCode;
}

- (void)setRecoveryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)CLIMode
{
  return self->_CLIMode;
}

- (void)setCLIMode:(BOOL)a3
{
  self->_CLIMode = a3;
}

- (BOOL)isDataOnlyRecovery
{
  return self->_dataOnlyRecovery;
}

- (void)setDataOnlyRecovery:(BOOL)a3
{
  self->_dataOnlyRecovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_recoverySessionID, 0);
}

@end
