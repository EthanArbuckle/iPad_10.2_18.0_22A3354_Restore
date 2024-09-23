@implementation MBAccountChange

- (MBAccountChange)initWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4 isPrimaryAccount:(BOOL)a5 changeType:(int64_t)a6
{
  id v11;
  id v12;
  MBAccountChange *v13;
  MBAccountChange *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MBAccountChange;
  v13 = -[MBAccountChange init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountIdentifier, a3);
    objc_storeStrong((id *)&v14->_personaIdentifier, a4);
    v14->_isPrimaryAccount = a5;
    v14->_changeType = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personaIdentifier, CFSTR("personaIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrimaryAccount, CFSTR("isPrimaryAccount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("changeType"));

}

- (MBAccountChange)initWithCoder:(id)a3
{
  id v4;
  MBAccountChange *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *personaIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBAccountChange;
  v5 = -[MBAccountChange init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("personaIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v8;

    v5->_isPrimaryAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimaryAccount"));
    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeType"));
  }

  return v5;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; accountIdentifier=%@, personaIdentifier=%@, isPrimaryAccount=%d, changeType=%ld>"),
    v5,
    self,
    self->_accountIdentifier,
    self->_personaIdentifier,
    self->_isPrimaryAccount,
    self->_changeType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isPrimaryAccount
{
  return self->_isPrimaryAccount;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
