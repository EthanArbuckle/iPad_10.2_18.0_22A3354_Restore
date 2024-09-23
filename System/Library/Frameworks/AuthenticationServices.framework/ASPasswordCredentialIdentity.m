@implementation ASPasswordCredentialIdentity

+ (ASPasswordCredentialIdentity)identityWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier
{
  NSString *v8;
  NSString *v9;
  ASCredentialServiceIdentifier *v10;
  void *v11;

  v8 = recordIdentifier;
  v9 = user;
  v10 = serviceIdentifier;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceIdentifier:user:recordIdentifier:", v10, v9, v8);

  return (ASPasswordCredentialIdentity *)v11;
}

- (ASPasswordCredentialIdentity)initWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier
{
  ASCredentialServiceIdentifier *v9;
  NSString *v10;
  NSString *v11;
  ASPasswordCredentialIdentity *v12;
  ASPasswordCredentialIdentity *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  ASPasswordCredentialIdentity *v18;
  objc_super v20;

  v9 = serviceIdentifier;
  v10 = user;
  v11 = recordIdentifier;
  v20.receiver = self;
  v20.super_class = (Class)ASPasswordCredentialIdentity;
  v12 = -[ASPasswordCredentialIdentity init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceIdentifier, serviceIdentifier);
    v14 = -[NSString copy](v10, "copy");
    v15 = v13->_user;
    v13->_user = (NSString *)v14;

    v16 = -[NSString copy](v11, "copy");
    v17 = v13->_recordIdentifier;
    v13->_recordIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (ASPasswordCredentialIdentity)initWithFoundationCredentialIdentity:(id)a3
{
  id v4;
  _BOOL8 v5;
  ASCredentialServiceIdentifier *v6;
  void *v7;
  ASCredentialServiceIdentifier *v8;
  void *v9;
  void *v10;
  ASPasswordCredentialIdentity *v11;
  void *v12;
  uint64_t v13;
  SFExternalCredentialIdentityStoreIdentifier *credentialIdentityStoreIdentifier;
  ASPasswordCredentialIdentity *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "serviceIdentifierType") == 1;
  v6 = [ASCredentialServiceIdentifier alloc];
  objc_msgSend(v4, "serviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCredentialServiceIdentifier initWithIdentifier:type:](v6, "initWithIdentifier:type:", v7, v5);

  objc_msgSend(v4, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalRecordIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASPasswordCredentialIdentity initWithServiceIdentifier:user:recordIdentifier:](self, "initWithServiceIdentifier:user:recordIdentifier:", v8, v9, v10);

  if (v11)
  {
    objc_msgSend(v4, "owningExtensionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "credentialIdentityStoreIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    credentialIdentityStoreIdentifier = v11->_credentialIdentityStoreIdentifier;
    v11->_credentialIdentityStoreIdentifier = (SFExternalCredentialIdentityStoreIdentifier *)v13;

    v11->_rank = objc_msgSend(v4, "rank");
    v15 = v11;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithServiceIdentifier:user:recordIdentifier:", self->_serviceIdentifier, self->_user, self->_recordIdentifier);
  objc_msgSend(v4, "setRank:", self->_rank);
  if (v4)
    objc_storeStrong(v4 + 1, self->_credentialIdentityStoreIdentifier);
  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; user=%@; serviceIdentifier=%@>"),
                       objc_opt_class(),
                       self,
                       self->_user,
                       self->_serviceIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasswordCredentialIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ASPasswordCredentialIdentity *v10;
  ASPasswordCredentialIdentity *v11;
  ASPasswordCredentialIdentity *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rank"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentityStoreIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASPasswordCredentialIdentity initWithServiceIdentifier:user:recordIdentifier:](self, "initWithServiceIdentifier:user:recordIdentifier:", v5, v6, v7);
  v11 = v10;
  if (v10)
  {
    v10->_rank = v8;
    objc_storeStrong((id *)&v10->_credentialIdentityStoreIdentifier, v9);
    v12 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  ASCredentialServiceIdentifier *serviceIdentifier;
  id v5;

  serviceIdentifier = self->_serviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_user, CFSTR("user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordIdentifier, CFSTR("recordIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rank, CFSTR("rank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentityStoreIdentifier, CFSTR("credentialIdentityStoreIdentifier"));

}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (NSInteger)rank
{
  return self->_rank;
}

- (void)setRank:(NSInteger)rank
{
  self->_rank = rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
}

@end
