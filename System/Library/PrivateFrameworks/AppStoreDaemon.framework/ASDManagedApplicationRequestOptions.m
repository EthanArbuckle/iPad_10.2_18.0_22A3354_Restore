@implementation ASDManagedApplicationRequestOptions

- (ASDManagedApplicationRequestOptions)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ASDManagedApplicationRequestOptions *v17;
  ASDManagedApplicationRequestOptions *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASDManagedApplicationRequestOptions;
  v17 = -[ASDManagedApplicationRequestOptions init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_itemIdentifier, a3);
    objc_storeStrong((id *)&v18->_externalVersionIdentifier, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v18->_bundleVersion, a6);
    v18->_skipDownloads = a7;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDManagedApplicationRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleVersion;
  uint64_t v12;
  NSNumber *externalVersionIdentifier;
  uint64_t v14;
  NSNumber *itemIdentifier;

  v5 = -[ASDManagedApplicationRequestOptions init](+[ASDManagedApplicationRequestOptions allocWithZone:](ASDManagedApplicationRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v10;

  v12 = -[NSNumber copyWithZone:](self->_externalVersionIdentifier, "copyWithZone:", a3);
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v12;

  v14 = -[NSNumber copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
  itemIdentifier = v5->_itemIdentifier;
  v5->_itemIdentifier = (NSNumber *)v14;

  v5->_requestType = self->_requestType;
  v5->_skipDownloads = self->_skipDownloads;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDManagedApplicationRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDManagedApplicationRequestOptions *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleVersion;
  uint64_t v12;
  NSNumber *externalVersionIdentifier;
  uint64_t v14;
  NSNumber *itemIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDManagedApplicationRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalVersionIdentifierKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemIdentifierKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v14;

    v5->_requestType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType"));
    v5->_skipDownloads = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipDownloadsKey"));
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
  id v9;

  v9 = a3;
  -[ASDManagedApplicationRequestOptions accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("accountIdentifierKey"));

  -[ASDManagedApplicationRequestOptions bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("bundleIdentifierKey"));

  -[ASDManagedApplicationRequestOptions bundleVersion](self, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("bundleVersionKey"));

  -[ASDManagedApplicationRequestOptions externalVersionIdentifier](self, "externalVersionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("externalVersionIdentifierKey"));

  -[ASDManagedApplicationRequestOptions itemIdentifier](self, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("itemIdentifierKey"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDManagedApplicationRequestOptions requestType](self, "requestType"), CFSTR("requestType"));
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDManagedApplicationRequestOptions skipDownloads](self, "skipDownloads"), CFSTR("skipDownloadsKey"));

}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)skipDownloads
{
  return self->_skipDownloads;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
