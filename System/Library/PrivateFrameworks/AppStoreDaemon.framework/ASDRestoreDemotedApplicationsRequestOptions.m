@implementation ASDRestoreDemotedApplicationsRequestOptions

- (ASDRestoreDemotedApplicationsRequestOptions)initWithAccountID:(id)a3 appleID:(id)a4
{
  id v6;
  id v7;
  ASDRestoreDemotedApplicationsRequestOptions *v8;
  uint64_t v9;
  NSNumber *accountID;
  uint64_t v11;
  NSString *appleID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v8 = -[ASDRestoreDemotedApplicationsRequestOptions init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountID = v8->_accountID;
    v8->_accountID = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v11;

  }
  return v8;
}

- (ASDRestoreDemotedApplicationsRequestOptions)initWithBundleIDs:(id)a3
{
  id v4;
  ASDRestoreDemotedApplicationsRequestOptions *v5;
  uint64_t v6;
  NSArray *bundleIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v5 = -[ASDRestoreDemotedApplicationsRequestOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDRestoreDemotedApplicationsRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountID;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSArray *bundleIDs;

  v5 = -[ASDRestoreDemotedApplicationsRequestOptions init](+[ASDRestoreDemotedApplicationsRequestOptions allocWithZone:](ASDRestoreDemotedApplicationsRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountID, "copyWithZone:", a3);
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_appleID, "copyWithZone:", a3);
  appleID = v5->_appleID;
  v5->_appleID = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_bundleIDs, "copyWithZone:", a3);
  bundleIDs = v5->_bundleIDs;
  v5->_bundleIDs = (NSArray *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRestoreDemotedApplicationsRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDRestoreDemotedApplicationsRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountID;
  uint64_t v8;
  NSString *appleID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *bundleIDs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("bundleIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *accountID;
  id v5;

  accountID = self->_accountID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountID, CFSTR("accountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIDs, CFSTR("bundleIDs"));

}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
