@implementation ASOneTimeCodeCredentialIdentity

- (id)_initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5 rank:(int64_t)a6 credentialIdentityStoreIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASOneTimeCodeCredentialIdentity *v16;
  uint64_t v17;
  ASCredentialServiceIdentifier *serviceIdentifier;
  uint64_t v19;
  NSString *recordIdentifier;
  uint64_t v21;
  NSString *label;
  ASOneTimeCodeCredentialIdentity *v23;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ASOneTimeCodeCredentialIdentity;
  v16 = -[ASOneTimeCodeCredentialIdentity init](&v25, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    serviceIdentifier = v16->_serviceIdentifier;
    v16->_serviceIdentifier = (ASCredentialServiceIdentifier *)v17;

    v19 = objc_msgSend(v14, "copy");
    recordIdentifier = v16->_recordIdentifier;
    v16->_recordIdentifier = (NSString *)v19;

    v16->_rank = a6;
    v21 = objc_msgSend(v13, "copy");
    label = v16->_label;
    v16->_label = (NSString *)v21;

    objc_storeStrong((id *)&v16->_credentialIdentityStoreIdentifier, a7);
    v23 = v16;
  }

  return v16;
}

- (id)_initWithFoundationCredentialIdentity:(id)a3
{
  id v4;
  _BOOL8 v5;
  ASCredentialServiceIdentifier *v6;
  void *v7;
  ASCredentialServiceIdentifier *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

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
  v11 = objc_msgSend(v4, "rank");
  objc_msgSend(v4, "owningExtensionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "credentialIdentityStoreIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ASOneTimeCodeCredentialIdentity _initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:](self, "_initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:", v8, v9, v10, v11, v13);

  return v14;
}

- (ASOneTimeCodeCredentialIdentity)initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5
{
  return (ASOneTimeCodeCredentialIdentity *)-[ASOneTimeCodeCredentialIdentity _initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:](self, "_initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:", a3, a4, a5, 0, 0);
}

- (NSString)user
{
  return self->_label;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:", self->_serviceIdentifier, self->_label, self->_recordIdentifier, self->_rank, self->_credentialIdentityStoreIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASOneTimeCodeCredentialIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ASOneTimeCodeCredentialIdentity *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rank"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentityStoreIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASOneTimeCodeCredentialIdentity _initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:](self, "_initWithServiceIdentifier:label:recordIdentifier:rank:credentialIdentityStoreIdentifier:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  ASCredentialServiceIdentifier *serviceIdentifier;
  id v5;

  serviceIdentifier = self->_serviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordIdentifier, CFSTR("recordIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rank, CFSTR("rank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentityStoreIdentifier, CFSTR("credentialIdentityStoreIdentifier"));

}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
