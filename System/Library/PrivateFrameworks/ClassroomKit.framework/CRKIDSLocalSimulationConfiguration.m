@implementation CRKIDSLocalSimulationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CRKIDSLocalSimulationConfiguration shouldForceAccountsInactive](self, "shouldForceAccountsInactive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("shouldForceAccountsInactive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKIDSLocalSimulationConfiguration shouldForceRemoteUsersNotRegistered](self, "shouldForceRemoteUsersNotRegistered"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("shouldForceRemoteUsersNotRegistered"));

}

- (CRKIDSLocalSimulationConfiguration)initWithCoder:(id)a3
{
  id v4;
  CRKIDSLocalSimulationConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIDSLocalSimulationConfiguration;
  v5 = -[CRKIDSLocalSimulationConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shouldForceAccountsInactive"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldForceAccountsInactive = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shouldForceRemoteUsersNotRegistered"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldForceRemoteUsersNotRegistered = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (BOOL)shouldForceAccountsInactive
{
  return self->_shouldForceAccountsInactive;
}

- (void)setShouldForceAccountsInactive:(BOOL)a3
{
  self->_shouldForceAccountsInactive = a3;
}

- (BOOL)shouldForceRemoteUsersNotRegistered
{
  return self->_shouldForceRemoteUsersNotRegistered;
}

- (void)setShouldForceRemoteUsersNotRegistered:(BOOL)a3
{
  self->_shouldForceRemoteUsersNotRegistered = a3;
}

@end
