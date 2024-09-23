@implementation ASDClaimApplicationsRequestOptions

- (ASDClaimApplicationsRequestOptions)initWithClaimStyle:(int64_t)a3
{
  ASDClaimApplicationsRequestOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDClaimApplicationsRequestOptions;
  result = -[ASDClaimApplicationsRequestOptions init](&v5, sel_init);
  if (result)
    result->_claimStyle = a3;
  return result;
}

- (ASDClaimApplicationsRequestOptions)initWithBundleIdentifiers:(id)a3
{
  id v5;
  ASDClaimApplicationsRequestOptions *v6;
  ASDClaimApplicationsRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDClaimApplicationsRequestOptions;
  v6 = -[ASDClaimApplicationsRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifiers, a3);
    v7->_claimStyle = 2;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDClaimApplicationsRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountID;
  uint64_t v8;
  NSArray *bundleIdentifiers;
  uint64_t v10;
  NSData *clientAuditTokenData;
  uint64_t v12;
  NSDictionary *httpHeaders;
  uint64_t v14;
  NSNumber *purchaseID;

  v5 = -[ASDClaimApplicationsRequestOptions init](+[ASDClaimApplicationsRequestOptions allocWithZone:](ASDClaimApplicationsRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountID, "copyWithZone:", a3);
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v6;

  v8 = -[NSArray copyWithZone:](self->_bundleIdentifiers, "copyWithZone:", a3);
  bundleIdentifiers = v5->_bundleIdentifiers;
  v5->_bundleIdentifiers = (NSArray *)v8;

  v5->_claimStyle = self->_claimStyle;
  v10 = -[NSData copyWithZone:](self->_clientAuditTokenData, "copyWithZone:", a3);
  clientAuditTokenData = v5->_clientAuditTokenData;
  v5->_clientAuditTokenData = (NSData *)v10;

  v5->_establishesActiveAccount = self->_establishesActiveAccount;
  v12 = -[NSDictionary copyWithZone:](self->_httpHeaders, "copyWithZone:", a3);
  httpHeaders = v5->_httpHeaders;
  v5->_httpHeaders = (NSDictionary *)v12;

  v5->_ignoresPreviousClaimAttempts = self->_ignoresPreviousClaimAttempts;
  v14 = -[NSNumber copyWithZone:](self->_purchaseID, "copyWithZone:", a3);
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v14;

  v5->_suppressErrorDialogs = self->_suppressErrorDialogs;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClaimApplicationsRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDClaimApplicationsRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountID;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *bundleIdentifiers;
  void *v12;
  uint64_t v13;
  NSData *clientAuditTokenData;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *httpHeaders;
  uint64_t v19;
  NSNumber *purchaseID;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASDClaimApplicationsRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("bundleIdentifiersKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimStyleKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_claimStyle = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAuditTokenDataKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    clientAuditTokenData = v5->_clientAuditTokenData;
    v5->_clientAuditTokenData = (NSData *)v13;

    v5->_establishesActiveAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("establishesActiveAccountKey"));
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("httpHeadersKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v17;

    v5->_ignoresPreviousClaimAttempts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresPreviousClaimAttempsKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseIDKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v19;

    v5->_suppressErrorDialogs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supressErrorDialogsKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ASDClaimApplicationsRequestOptions accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("accountIDKey"));

  -[ASDClaimApplicationsRequestOptions bundleIdentifiers](self, "bundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("bundleIdentifiersKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_claimStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("claimStyleKey"));

  -[ASDClaimApplicationsRequestOptions clientAuditTokenData](self, "clientAuditTokenData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("clientAuditTokenDataKey"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions establishesActiveAccount](self, "establishesActiveAccount"), CFSTR("establishesActiveAccountKey"));
  -[ASDClaimApplicationsRequestOptions httpHeaders](self, "httpHeaders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("httpHeadersKey"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions ignoresPreviousClaimAttempts](self, "ignoresPreviousClaimAttempts"), CFSTR("ignoresPreviousClaimAttempsKey"));
  -[ASDClaimApplicationsRequestOptions purchaseID](self, "purchaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("purchaseIDKey"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions suppressErrorDialogs](self, "suppressErrorDialogs"), CFSTR("supressErrorDialogsKey"));
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (BOOL)establishesActiveAccount
{
  return self->_establishesActiveAccount;
}

- (void)setEstablishesActiveAccount:(BOOL)a3
{
  self->_establishesActiveAccount = a3;
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)ignoresPreviousClaimAttempts
{
  return self->_ignoresPreviousClaimAttempts;
}

- (void)setIgnoresPreviousClaimAttempts:(BOOL)a3
{
  self->_ignoresPreviousClaimAttempts = a3;
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)suppressErrorDialogs
{
  return self->_suppressErrorDialogs;
}

- (void)setSuppressErrorDialogs:(BOOL)a3
{
  self->_suppressErrorDialogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
