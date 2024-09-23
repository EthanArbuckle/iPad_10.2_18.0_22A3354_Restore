@implementation CalACMigrationAccount

- (CalACMigrationAccount)initWithACAccount:(id)a3
{
  id v5;
  CalACMigrationAccount *v6;
  CalACMigrationAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalACMigrationAccount;
  v6 = -[CalACMigrationAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentAccountIdentifier
{
  void *v2;
  void *v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)dirty
{
  void *v2;
  char v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDirty");

  return v3;
}

- (NSString)accountDescription
{
  void *v2;
  void *v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAccountDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalACMigrationAccount account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountDescription:", v4);

}

- (BOOL)visible
{
  void *v2;
  char v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CalACMigrationAccount account](self, "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisible:", v3);

}

- (BOOL)enabledForCalendarsDataClass
{
  void *v2;
  char v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE58]);

  return v3;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CalACMigrationAccount account](self, "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:forDataclass:", v3, *MEMORY[0x1E0C8EE58]);

}

- (BOOL)provisionedForCalendarsDataClass
{
  void *v2;
  char v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProvisionedForDataclass:", *MEMORY[0x1E0C8EE58]);

  return v3;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CalACMigrationAccount account](self, "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProvisioned:forDataclass:", v3, *MEMORY[0x1E0C8EE58]);

}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CalACMigrationAccount account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountPropertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CalACMigrationAccount account](self, "account");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountProperty:forKey:", v7, v6);

}

- (void)setAuthenticationTypeParent
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x1E0C8F350];
  -[CalACMigrationAccount account](self, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAuthenticationType:", v2);

}

- (void)setAuthenticationTypeNone
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x1E0C8F348];
  -[CalACMigrationAccount account](self, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAuthenticationType:", v2);

}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CalACMigrationAccount account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthenticated:", v3);

  -[CalACMigrationAccount account](self, "account");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportsAuthentication:", 1);

}

- (BOOL)authenticated
{
  void *v2;
  char v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (NSString)username
{
  void *v2;
  void *v3;

  -[CalACMigrationAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setUsername:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalACMigrationAccount account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v4);

}

- (void)setPassword:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C8F2B0];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithPassword:", v5);

  -[CalACMigrationAccount account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCredential:", v7);

}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
