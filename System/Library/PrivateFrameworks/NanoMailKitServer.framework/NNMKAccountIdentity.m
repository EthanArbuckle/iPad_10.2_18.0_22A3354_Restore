@implementation NNMKAccountIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAccountIdentity)initWithCoder:(id)a3
{
  id v4;
  NNMKAccountIdentity *v5;
  uint64_t v6;
  NSString *accountId;
  uint64_t v8;
  NSString *username;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSString *token;
  uint64_t v14;
  NSString *refreshToken;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NNMKAccountIdentity;
  v5 = -[NNMKAccountIdentity init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyUsername"));
    v8 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyDisplayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyRefreshToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identityType = objc_msgSend(v16, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountId;
  id v5;
  id v6;

  accountId = self->_accountId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountId, CFSTR("kNSCodingKeyAccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_username, CFSTR("kNSCodingKeyUsername"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("kNSCodingKeyDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("kNSCodingKeyToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshToken, CFSTR("kNSCodingKeyRefreshToken"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_identityType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyType"));

}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(unint64_t)a3
{
  self->_identityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
