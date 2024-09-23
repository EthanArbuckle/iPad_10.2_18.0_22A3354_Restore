@implementation CalChangeFilteringMigrationAccount

- (CalChangeFilteringMigrationAccount)initWithBackingAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CalChangeFilteringMigrationAccount *v8;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CalChangeFilteringMigrationAccount initWithAccountIdentifier:accountTypeIdentifier:](self, "initWithAccountIdentifier:accountTypeIdentifier:", v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_backingAccount, a3);

  return v8;
}

- (CalChangeFilteringMigrationAccount)initWithAccountIdentifier:(id)a3 accountTypeIdentifier:(id)a4
{
  id v7;
  id v8;
  CalChangeFilteringMigrationAccount *v9;
  CalChangeFilteringMigrationAccount *v10;
  uint64_t v11;
  NSMutableDictionary *modifiedPropertyValues;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalChangeFilteringMigrationAccount;
  v9 = -[CalChangeFilteringMigrationAccount init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountTypeIdentifier, a4);
    v11 = objc_opt_new();
    modifiedPropertyValues = v10->_modifiedPropertyValues;
    v10->_modifiedPropertyValues = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountPropertyForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)identifier
{
  return self->_accountIdentifier;
}

- (id)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setAuthenticationTypeParent
{
  id v2;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Parent"), CFSTR("_CalChangeFilterMigrationAccount_setAuthenticationType"));

}

- (void)setAuthenticationTypeNone
{
  id v2;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("None"), CFSTR("_CalChangeFilterMigrationAccount_setAuthenticationType"));

}

- (NSString)accountDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_accountDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (void)setAccountDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalChangeFilterMigrationAccount_accountDescription"));

}

- (BOOL)visible
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_visible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "visible");

  }
  return v5;
}

- (void)setVisible:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_visible"));

}

- (BOOL)enabledForCalendarsDataClass
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_enabledForCalendarsDataClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "enabledForCalendarsDataClass");

  }
  return v5;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_enabledForCalendarsDataClass"));

}

- (BOOL)provisionedForCalendarsDataClass
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "provisionedForCalendarsDataClass");

  }
  return v5;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"));

}

- (BOOL)authenticated
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_authenticated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "authenticated");

  }
  return v5;
}

- (void)setAuthenticated:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_authenticated"));

}

- (NSString)username
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_username"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "username");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (void)setUsername:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalChangeFilterMigrationAccount_username"));

}

- (void)setPassword:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalChangeFilterMigrationAccount_password"));

}

- (BOOL)dirty
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CalChangeFilteringMigrationAccount backingAccount](self, "backingAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[CalChangeFilteringMigrationAccount modifiedPropertyValues](self, "modifiedPropertyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (NSMutableDictionary)modifiedPropertyValues
{
  return self->_modifiedPropertyValues;
}

- (CalMigrationAccount)backingAccount
{
  return self->_backingAccount;
}

- (NSString)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (void)setParentAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyValues, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
}

@end
