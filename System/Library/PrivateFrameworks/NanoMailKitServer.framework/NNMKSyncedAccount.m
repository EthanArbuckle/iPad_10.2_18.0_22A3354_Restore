@implementation NNMKSyncedAccount

- (NNMKSyncedAccount)initWithAccount:(id)a3
{
  id v4;
  NNMKSyncedAccount *v5;
  uint64_t v6;
  NSString *accountId;
  uint64_t v8;
  NSString *displayName;
  void *v10;
  uint64_t v11;
  NSArray *emailAddresses;
  uint64_t v13;
  NSString *defaultEmailAddress;
  uint64_t v15;
  NSString *username;
  uint64_t v17;
  NSString *localId;
  uint64_t v19;
  NSString *typeIdentifier;
  uint64_t v21;
  NSString *emailAddressToken;
  uint64_t v23;
  NSString *pccEmailAddress;

  v4 = a3;
  v5 = -[NNMKSyncedAccount init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "accountId");
    v6 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    objc_msgSend(v4, "displayName");
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    v5->_shouldArchive = objc_msgSend(v4, "shouldArchive");
    objc_msgSend(v4, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v11;

    objc_msgSend(v4, "defaultEmailAddress");
    v13 = objc_claimAutoreleasedReturnValue();
    defaultEmailAddress = v5->_defaultEmailAddress;
    v5->_defaultEmailAddress = (NSString *)v13;

    objc_msgSend(v4, "username");
    v15 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v15;

    objc_msgSend(v4, "localId");
    v17 = objc_claimAutoreleasedReturnValue();
    localId = v5->_localId;
    v5->_localId = (NSString *)v17;

    objc_msgSend(v4, "typeIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v19;

    objc_msgSend(v4, "emailAddressToken");
    v21 = objc_claimAutoreleasedReturnValue();
    emailAddressToken = v5->_emailAddressToken;
    v5->_emailAddressToken = (NSString *)v21;

    objc_msgSend(v4, "pccEmailAddress");
    v23 = objc_claimAutoreleasedReturnValue();
    pccEmailAddress = v5->_pccEmailAddress;
    v5->_pccEmailAddress = (NSString *)v23;

  }
  return v5;
}

- (NNMKSyncedAccount)init
{
  NNMKSyncedAccount *v2;
  NNMKSyncedAccount *v3;
  NSString *accountId;
  NSString *displayName;
  NSArray *emailAddresses;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NNMKSyncedAccount;
  v2 = -[NNMKSyncedAccount init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    accountId = v2->_accountId;
    v2->_accountId = 0;

    displayName = v3->_displayName;
    v3->_displayName = 0;

    v3->_shouldArchive = 0;
    emailAddresses = v3->_emailAddresses;
    v3->_emailAddresses = 0;

  }
  return v3;
}

- (id)account
{
  NNMKAccount *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(NNMKAccount);
  -[NNMKSyncedAccount accountId](self, "accountId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setAccountId:](v3, "setAccountId:", v4);

  -[NNMKSyncedAccount localId](self, "localId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setLocalId:](v3, "setLocalId:", v5);

  -[NNMKSyncedAccount displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setDisplayName:](v3, "setDisplayName:", v6);

  -[NNMKAccount setShouldArchive:](v3, "setShouldArchive:", -[NNMKSyncedAccount shouldArchive](self, "shouldArchive"));
  -[NNMKSyncedAccount emailAddresses](self, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setEmailAddresses:](v3, "setEmailAddresses:", v7);

  -[NNMKSyncedAccount defaultEmailAddress](self, "defaultEmailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setDefaultEmailAddress:](v3, "setDefaultEmailAddress:", v8);

  -[NNMKAccount setSourceType:](v3, "setSourceType:", -[NNMKSyncedAccount sourceType](self, "sourceType"));
  -[NNMKSyncedAccount username](self, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setUsername:](v3, "setUsername:", v9);

  -[NNMKSyncedAccount typeIdentifier](self, "typeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setTypeIdentifier:](v3, "setTypeIdentifier:", v10);

  -[NNMKSyncedAccount emailAddressToken](self, "emailAddressToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setEmailAddressToken:](v3, "setEmailAddressToken:", v11);

  -[NNMKSyncedAccount pccEmailAddress](self, "pccEmailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setPccEmailAddress:](v3, "setPccEmailAddress:", v12);

  return v3;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (void)setShouldArchive:(BOOL)a3
{
  self->_shouldArchive = a3;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (NSString)defaultEmailAddress
{
  return self->_defaultEmailAddress;
}

- (void)setDefaultEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_defaultEmailAddress, a3);
}

- (BOOL)resendRequested
{
  return self->_resendRequested;
}

- (void)setResendRequested:(BOOL)a3
{
  self->_resendRequested = a3;
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)localId
{
  return self->_localId;
}

- (void)setLocalId:(id)a3
{
  objc_storeStrong((id *)&self->_localId, a3);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifier, a3);
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressToken, a3);
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_pccEmailAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_defaultEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
