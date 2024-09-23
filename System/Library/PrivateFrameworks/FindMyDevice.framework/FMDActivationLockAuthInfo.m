@implementation FMDActivationLockAuthInfo

- (FMDActivationLockAuthInfo)initWithCoder:(id)a3
{
  id v4;
  FMDActivationLockAuthInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDActivationLockAuthInfo;
  v5 = -[FMDActivationLockAuthInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockAuthInfo setUsername:](v5, "setUsername:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockAuthInfo setPet:](v5, "setPet:", v7);

    -[FMDActivationLockAuthInfo setIsAccountHSA2:](v5, "setIsAccountHSA2:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAccountHSA2")));
    -[FMDActivationLockAuthInfo setIsSignedIntoICloud:](v5, "setIsSignedIntoICloud:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSignedIntoICloud")));
    -[FMDActivationLockAuthInfo setIsFindMyON:](v5, "setIsFindMyON:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFindMyON")));
    -[FMDActivationLockAuthInfo setIsActivationLockEnabled:](v5, "setIsActivationLockEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActivationLockEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockAuthInfo setDsid:](v5, "setDsid:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDsid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockAuthInfo setAltDsid:](v5, "setAltDsid:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[FMDActivationLockAuthInfo username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  -[FMDActivationLockAuthInfo pet](self, "pet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pet"));

  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isAccountHSA2](self, "isAccountHSA2"), CFSTR("isAccountHSA2"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isSignedIntoICloud](self, "isSignedIntoICloud"), CFSTR("isSignedIntoICloud"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isFindMyON](self, "isFindMyON"), CFSTR("isFindMyON"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FMDActivationLockAuthInfo isActivationLockEnabled](self, "isActivationLockEnabled"), CFSTR("isActivationLockEnabled"));
  -[FMDActivationLockAuthInfo dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dsid"));

  -[FMDActivationLockAuthInfo altDsid](self, "altDsid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("altDsid"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMDActivationLockAuthInfo username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDActivationLockAuthInfo pet](self, "pet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FMDActivationLockAuthInfo isFindMyON](self, "isFindMyON");
  v7 = -[FMDActivationLockAuthInfo isSignedIntoICloud](self, "isSignedIntoICloud");
  v8 = -[FMDActivationLockAuthInfo isAccountHSA2](self, "isAccountHSA2");
  v9 = -[FMDActivationLockAuthInfo isActivationLockEnabled](self, "isActivationLockEnabled");
  -[FMDActivationLockAuthInfo dsid](self, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDActivationLockAuthInfo altDsid](self, "altDsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("username = %@, pet = %@, isFindMyON = %d, isSignedIntoICloud %d, isAccountHSA2 = %d isActivationLockEnabled = %d dsid = %@, altDsid = %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)pet
{
  return self->_pet;
}

- (void)setPet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isFindMyON
{
  return self->_isFindMyON;
}

- (void)setIsFindMyON:(BOOL)a3
{
  self->_isFindMyON = a3;
}

- (BOOL)isActivationLockEnabled
{
  return self->_isActivationLockEnabled;
}

- (void)setIsActivationLockEnabled:(BOOL)a3
{
  self->_isActivationLockEnabled = a3;
}

- (BOOL)isSignedIntoICloud
{
  return self->_isSignedIntoICloud;
}

- (void)setIsSignedIntoICloud:(BOOL)a3
{
  self->_isSignedIntoICloud = a3;
}

- (BOOL)isAccountHSA2
{
  return self->_isAccountHSA2;
}

- (void)setIsAccountHSA2:(BOOL)a3
{
  self->_isAccountHSA2 = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)altDsid
{
  return self->_altDsid;
}

- (void)setAltDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDsid, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_pet, 0);
}

@end
