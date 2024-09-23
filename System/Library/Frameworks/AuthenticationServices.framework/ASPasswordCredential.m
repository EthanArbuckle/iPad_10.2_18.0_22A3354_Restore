@implementation ASPasswordCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (ASPasswordCredential)credentialWithUser:(NSString *)user password:(NSString *)password
{
  NSString *v6;
  NSString *v7;
  void *v8;

  v6 = password;
  v7 = user;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUser:password:", v7, v6);

  return (ASPasswordCredential *)v8;
}

- (ASPasswordCredential)initWithUser:(NSString *)user password:(NSString *)password
{
  NSString *v6;
  NSString *v7;
  ASPasswordCredential *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  ASPasswordCredential *v13;
  objc_super v15;

  v6 = user;
  v7 = password;
  v15.receiver = self;
  v15.super_class = (Class)ASPasswordCredential;
  v8 = -[ASPasswordCredential init](&v15, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_user;
    v8->_user = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_password;
    v8->_password = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (ASPasswordCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASPasswordCredential *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("User"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASPasswordCredential initWithUser:password:](self, "initWithUser:password:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("User"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("Password"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUser:password:", self->_user, self->_password);
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
