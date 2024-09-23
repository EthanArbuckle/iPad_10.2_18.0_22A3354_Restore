@implementation ASCAppleIDLoginChoice

- (ASCAppleIDLoginChoice)initWithUser:(id)a3
{
  id v4;
  ASCAppleIDLoginChoice *v5;
  uint64_t v6;
  NSString *user;
  ASCAppleIDLoginChoice *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCAppleIDLoginChoice;
  v5 = -[ASCAppleIDLoginChoice init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    user = v5->_user;
    v5->_user = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASCAppleIDLoginChoice)initWithAppleIDLoginChoice:(id)a3
{
  id v5;
  ASCAppleIDLoginChoice *v6;
  void *v7;
  uint64_t v8;
  NSString *user;
  ASCAppleIDLoginChoice *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCAppleIDLoginChoice;
  v6 = -[ASCAppleIDLoginChoice init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    user = v6->_user;
    v6->_user = (NSString *)v8;

    objc_storeStrong((id *)&v6->_underlyingAppleIDLoginChoice, a3);
    v10 = v6;
  }

  return v6;
}

- (unint64_t)loginChoiceKind
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSString isEqualToString:](self->_user, "isEqualToString:", v4[2]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("appleIDLoginChoiceUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_underlyingAppleIDLoginChoice, CFSTR("underlyingAppleIDLoginChoice"));

}

- (ASCAppleIDLoginChoice)initWithCoder:(id)a3
{
  id v4;
  ASCAppleIDLoginChoice *v5;
  uint64_t v6;
  NSString *user;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  AKAuthorizationLoginChoice *underlyingAppleIDLoginChoice;
  ASCAppleIDLoginChoice *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCAppleIDLoginChoice;
  v5 = -[ASCAppleIDLoginChoice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleIDLoginChoiceUser"));
    v6 = objc_claimAutoreleasedReturnValue();
    user = v5->_user;
    v5->_user = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("underlyingAppleIDLoginChoice"));
    v11 = objc_claimAutoreleasedReturnValue();
    underlyingAppleIDLoginChoice = v5->_underlyingAppleIDLoginChoice;
    v5->_underlyingAppleIDLoginChoice = (AKAuthorizationLoginChoice *)v11;

    v13 = v5;
  }

  return v5;
}

- (AKAuthorizationLoginChoice)underlyingAppleIDLoginChoice
{
  return self->_underlyingAppleIDLoginChoice;
}

- (NSString)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_underlyingAppleIDLoginChoice, 0);
}

@end
