@implementation ASPasskeyCredentialIdentity

- (id)_initWithLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ASPasskeyCredentialIdentity *v14;

  v4 = a3;
  objc_msgSend(v4, "relyingPartyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "credentialID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_base64DecodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_base64DecodedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "externalRecordIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ASPasskeyCredentialIdentity initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:](self, "initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:", v5, v6, v9, v11, v13);

  return v14;
}

- (ASPasskeyCredentialIdentity)initWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier userName:(NSString *)userName credentialID:(NSData *)credentialID userHandle:(NSData *)userHandle recordIdentifier:(NSString *)recordIdentifier
{
  NSString *v12;
  NSString *v13;
  NSData *v14;
  NSData *v15;
  NSString *v16;
  ASPasskeyCredentialIdentity *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSData *v25;
  uint64_t v26;
  NSData *v27;
  ASPasskeyCredentialIdentity *v28;
  objc_super v30;

  v12 = relyingPartyIdentifier;
  v13 = userName;
  v14 = credentialID;
  v15 = userHandle;
  v16 = recordIdentifier;
  v30.receiver = self;
  v30.super_class = (Class)ASPasskeyCredentialIdentity;
  v17 = -[ASPasskeyCredentialIdentity init](&v30, sel_init);
  if (v17)
  {
    v18 = -[NSString copy](v12, "copy");
    v19 = v17->_relyingPartyIdentifier;
    v17->_relyingPartyIdentifier = (NSString *)v18;

    v20 = -[NSString copy](v13, "copy");
    v21 = v17->_userName;
    v17->_userName = (NSString *)v20;

    v22 = -[NSString copy](v16, "copy");
    v23 = v17->_recordIdentifier;
    v17->_recordIdentifier = (NSString *)v22;

    v24 = -[NSData copy](v14, "copy");
    v25 = v17->_credentialID;
    v17->_credentialID = (NSData *)v24;

    v26 = -[NSData copy](v15, "copy");
    v27 = v17->_userHandle;
    v17->_userHandle = (NSData *)v26;

    v28 = v17;
  }

  return v17;
}

+ (ASPasskeyCredentialIdentity)identityWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier userName:(NSString *)userName credentialID:(NSData *)credentialID userHandle:(NSData *)userHandle recordIdentifier:(NSString *)recordIdentifier
{
  NSString *v12;
  NSData *v13;
  NSData *v14;
  NSString *v15;
  NSString *v16;
  void *v17;

  v12 = recordIdentifier;
  v13 = userHandle;
  v14 = credentialID;
  v15 = userName;
  v16 = relyingPartyIdentifier;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:", v16, v15, v14, v13, v12);

  return (ASPasskeyCredentialIdentity *)v17;
}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return -[ASCredentialServiceIdentifier initWithIdentifier:type:]([ASCredentialServiceIdentifier alloc], "initWithIdentifier:type:", self->_relyingPartyIdentifier, 0);
}

- (NSString)user
{
  return self->_userName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:", self->_relyingPartyIdentifier, self->_userName, self->_credentialID, self->_userHandle, self->_recordIdentifier);
  objc_msgSend(v4, "setRank:", self->_rank);
  if (v4)
    objc_storeStrong(v4 + 1, self->_credentialIdentityStoreIdentifier);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyCredentialIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ASPasskeyCredentialIdentity *v11;
  ASPasskeyCredentialIdentity *v12;
  ASPasskeyCredentialIdentity *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rank"));

  v11 = -[ASPasskeyCredentialIdentity initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:](self, "initWithRelyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:", v5, v6, v8, v9, v7);
  v12 = v11;
  if (v11)
  {
    v11->_rank = v10;
    v13 = v11;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userName, CFSTR("userName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordIdentifier, CFSTR("recordIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rank, CFSTR("rank"));

}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)userName
{
  return self->_userName;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)userHandle
{
  return self->_userHandle;
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
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
}

@end
