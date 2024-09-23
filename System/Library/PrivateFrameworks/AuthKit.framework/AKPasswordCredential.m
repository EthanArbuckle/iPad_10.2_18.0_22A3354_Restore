@implementation AKPasswordCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKPasswordCredential)initWithUser:(id)a3 password:(id)a4
{
  id v7;
  id v8;
  AKPasswordCredential *v9;
  AKPasswordCredential *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPasswordCredential;
  v9 = -[AKPasswordCredential init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentifier, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userIdentifier;
  id v5;

  userIdentifier = self->_userIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userIdentifier, CFSTR("_userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("_password"));

}

- (AKPasswordCredential)initWithCoder:(id)a3
{
  id v4;
  AKPasswordCredential *v5;
  uint64_t v6;
  NSString *userIdentifier;
  uint64_t v8;
  NSString *password;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKPasswordCredential;
  v5 = -[AKPasswordCredential init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_userIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_password"));
    v8 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v8;

  }
  return v5;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
