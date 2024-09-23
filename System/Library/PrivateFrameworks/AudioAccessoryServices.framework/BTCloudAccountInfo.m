@implementation BTCloudAccountInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  -[BTCloudAccountInfo accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[BTCloudAccountInfo loginID](self, "loginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[BTCloudAccountInfo isSignedIn](self, "isSignedIn");
  NSStringFromSelector(sel_isSignedIn);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[BTCloudAccountInfo manateeAvailable](self, "manateeAvailable");
  NSStringFromSelector(sel_manateeAvailable);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

}

- (BTCloudAccountInfo)initWithCoder:(id)a3
{
  id v4;
  BTCloudAccountInfo *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BTCloudAccountInfo;
  v5 = -[BTCloudAccountInfo init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_accountIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudAccountInfo setAccountIdentifier:](v5, "setAccountIdentifier:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_loginID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudAccountInfo setLoginID:](v5, "setLoginID:", v11);

    NSStringFromSelector(sel_isSignedIn);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudAccountInfo setIsSignedIn:](v5, "setIsSignedIn:", objc_msgSend(v4, "decodeBoolForKey:", v12));

    NSStringFromSelector(sel_manateeAvailable);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudAccountInfo setManateeAvailable:](v5, "setManateeAvailable:", objc_msgSend(v4, "decodeBoolForKey:", v13));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = IsAppleInternalBuild();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[BTCloudAccountInfo accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BTCloudAccountInfo loginID](self, "loginID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("BTCloudAccountInfo - Account(%@): %@, signedIn: %d, manatee: %d"), v5, v6, -[BTCloudAccountInfo isSignedIn](self, "isSignedIn"), -[BTCloudAccountInfo manateeAvailable](self, "manateeAvailable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("BTCloudAccountInfo - AccountID: %@, signedIn: %d, manatee: %d"), v5, -[BTCloudAccountInfo isSignedIn](self, "isSignedIn"), -[BTCloudAccountInfo manateeAvailable](self, "manateeAvailable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (BOOL)manateeAvailable
{
  return self->_manateeAvailable;
}

- (void)setManateeAvailable:(BOOL)a3
{
  self->_manateeAvailable = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)loginID
{
  return self->_loginID;
}

- (void)setLoginID:(id)a3
{
  objc_storeStrong((id *)&self->_loginID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
