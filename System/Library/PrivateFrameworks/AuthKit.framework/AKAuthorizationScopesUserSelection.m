@implementation AKAuthorizationScopesUserSelection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationScopesUserSelection)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationScopesUserSelection *v5;
  uint64_t v6;
  AKUserInformation *userInformation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationScopesUserSelection;
  v5 = -[AKAuthorizationScopesUserSelection init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userInformation"));
    v6 = objc_claimAutoreleasedReturnValue();
    userInformation = v5->_userInformation;
    v5->_userInformation = (AKUserInformation *)v6;

    v5->_makePrivateEmail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_makePrivateEmail"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AKUserInformation *userInformation;
  id v5;

  userInformation = self->_userInformation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userInformation, CFSTR("_userInformation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_makePrivateEmail, CFSTR("_makePrivateEmail"));

}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AKAuthorizationScopesUserSelection userInformation](self, "userInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAuthorizationScopesUserSelection makePrivateEmail](self, "makePrivateEmail");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ userInformation: %@, makePrivateEmail: %@}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)makePrivateEmail
{
  return self->_makePrivateEmail;
}

- (void)setMakePrivateEmail:(BOOL)a3
{
  self->_makePrivateEmail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformation, 0);
}

@end
