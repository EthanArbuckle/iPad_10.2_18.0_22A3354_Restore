@implementation AKAuthorizationRevokeUpgradeContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transactionID;
  id v5;

  transactionID = self->_transactionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionID, CFSTR("_transactionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamID, CFSTR("_teamID"));

}

- (AKAuthorizationRevokeUpgradeContext)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationRevokeUpgradeContext *v5;
  uint64_t v6;
  NSString *transactionID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *teamID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKAuthorizationRevokeUpgradeContext;
  v5 = -[AKAuthorizationRevokeUpgradeContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamID"));
    v10 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKAuthorizationRevokeUpgradeContext *v4;
  uint64_t v5;
  NSString *transactionID;
  uint64_t v7;
  NSString *bundleID;
  uint64_t v9;
  NSString *teamID;

  v4 = objc_alloc_init(AKAuthorizationRevokeUpgradeContext);
  v5 = -[NSString copy](self->_transactionID, "copy");
  transactionID = v4->_transactionID;
  v4->_transactionID = (NSString *)v5;

  v7 = -[NSString copy](self->_bundleID, "copy");
  bundleID = v4->_bundleID;
  v4->_bundleID = (NSString *)v7;

  v9 = -[NSString copy](self->_teamID, "copy");
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v9;

  return v4;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

@end
