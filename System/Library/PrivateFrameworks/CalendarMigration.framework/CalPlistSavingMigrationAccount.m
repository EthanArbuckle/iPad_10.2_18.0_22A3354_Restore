@implementation CalPlistSavingMigrationAccount

- (CalPlistSavingMigrationAccount)initWithIdentifier:(id)a3 accountTypeIdentifier:(id)a4 backingAccount:(id)a5 initialProperties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CalPlistSavingMigrationAccount *v15;
  CalPlistSavingMigrationAccount *v16;
  uint64_t v17;
  NSMutableDictionary *savedProperties;
  uint64_t v19;
  NSMutableDictionary *modifiedProperties;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CalPlistSavingMigrationAccount;
  v15 = -[CalPlistSavingMigrationAccount init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_accountTypeIdentifier, a4);
    objc_storeStrong((id *)&v16->_backingAccount, a5);
    if (v14)
    {
      v17 = objc_msgSend(v14, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    savedProperties = v16->_savedProperties;
    v16->_savedProperties = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    modifiedProperties = v16->_modifiedProperties;
    v16->_modifiedProperties = (NSMutableDictionary *)v19;

  }
  return v16;
}

- (id)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (BOOL)dirty
{
  void *v2;
  BOOL v3;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountPropertyForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v9 = v6;

  return v9;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)save
{
  void *v3;
  void *v4;
  id v5;

  -[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (NSString)accountDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_accountDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_accountDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v4;
}

- (void)setAccountDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalPlistSavingMigrationAccount_accountDescription"));

}

- (BOOL)visible
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_visible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_visible")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "visible");
  }
  v7 = v6;

  return v7;
}

- (void)setVisible:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalPlistSavingMigrationAccount_visible"));

}

- (BOOL)enabledForCalendarsDataClass
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass")), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "enabledForCalendarsDataClass");
  }
  v7 = v6;

  return v7;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass"));

}

- (BOOL)provisionedForCalendarsDataClass
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass")), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "provisionedForCalendarsDataClass");
  }
  v7 = v6;

  return v7;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"));

}

- (BOOL)authenticated
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_authenticated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_authenticated")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "authenticated");
  }
  v7 = v6;

  return v7;
}

- (void)setAuthenticated:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_CalChangeFilterMigrationAccount_authenticated"));

}

- (NSString)username
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_username"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CalPlistSavingMigrationAccount savedProperties](self, "savedProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CalChangeFilterMigrationAccount_username"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[CalPlistSavingMigrationAccount backingAccount](self, "backingAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v4;
}

- (void)setUsername:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalChangeFilterMigrationAccount_username"));

}

- (void)setPassword:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalPlistSavingMigrationAccount modifiedProperties](self, "modifiedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_CalChangeFilterMigrationAccount_password"));

}

- (CalMigrationReadOnlyAccount)backingAccount
{
  return self->_backingAccount;
}

- (NSMutableDictionary)savedProperties
{
  return self->_savedProperties;
}

- (NSMutableDictionary)modifiedProperties
{
  return self->_modifiedProperties;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedProperties, 0);
  objc_storeStrong((id *)&self->_savedProperties, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
}

@end
