@implementation AKAuthorizationSharedAccountLoginChoice

- (AKAuthorizationSharedAccountLoginChoice)initWithSignInWithAppleAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  AKAuthorizationSharedAccountLoginChoice *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "shareInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participantName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "shareInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "participantHandle");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "clientID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  v12 = -[AKAuthorizationLoginChoice initWithUser:site:](&v14, sel_initWithUser_site_, v9, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_sharedAccount, a3);
    -[AKAuthorizationLoginChoice setAppleIDAuth:](v12, "setAppleIDAuth:", 1);
  }

  return v12;
}

- (AKAuthorizationSharedAccountLoginChoice)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationSharedAccountLoginChoice *v5;
  uint64_t v6;
  AKSignInWithAppleAccount *sharedAccount;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  v5 = -[AKAuthorizationLoginChoice initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedAccount"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharedAccount = v5->_sharedAccount;
    v5->_sharedAccount = (AKSignInWithAppleAccount *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  v4 = a3;
  -[AKAuthorizationLoginChoice encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharedAccount, CFSTR("sharedAccount"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationSharedAccountLoginChoice;
  v4 = -[AKAuthorizationLoginChoice copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[AKSignInWithAppleAccount copy](self->_sharedAccount, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tsharedAccount: %@, \n}>"), v5, self, self->_sharedAccount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AKSignInWithAppleAccount)sharedAccount
{
  return self->_sharedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAccount, 0);
}

@end
