@implementation AAAccount

- (AAAccount)init
{
  AAAccount *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  ACAccount *account;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAAccount;
  v2 = -[AAAccount init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v4);
    account = v2->_account;
    v2->_account = (ACAccount *)v5;

  }
  return v2;
}

- (AAAccount)initWithAccountIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AAAccount *v8;
  AAAccount *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C8F2B8];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)AAAccount;
    v8 = -[AAAccount init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_account, v7);
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (AAAccount)initWithAccount:(id)a3
{
  id v5;
  AAAccount *v6;
  AAAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAccount;
  v6 = -[AAAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (NSString)identifier
{
  return -[ACAccount identifier](self->_account, "identifier");
}

- (void)setUsername:(id)a3
{
  -[ACAccount setUsername:](self->_account, "setUsername:", a3);
}

- (id)account
{
  return self->_account;
}

+ (id)accountTypeString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)displayName
{
  return -[ACAccount accountDescription](self->_account, "accountDescription");
}

- (NSString)username
{
  return -[ACAccount username](self->_account, "username");
}

- (NSString)accountDescription
{
  return -[ACAccount accountDescription](self->_account, "accountDescription");
}

- (void)setAccountDescription:(id)a3
{
  -[ACAccount setAccountDescription:](self->_account, "setAccountDescription:", a3);
}

- (int)accountServiceType
{
  return 2;
}

- (NSString)firstName
{
  return (NSString *)-[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("firstName"));
}

- (NSString)lastName
{
  return (NSString *)-[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("lastName"));
}

- (NSString)personID
{
  return (NSString *)-[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("personID"));
}

- (NSString)primaryEmail
{
  return (NSString *)-[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("primaryEmail"));
}

- (BOOL)primaryAccount
{
  void *v2;
  char v3;

  -[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("primaryAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPrimaryAccount:(BOOL)a3
{
  ACAccount *account;
  id v4;

  account = self->_account;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountProperty:forKey:](account, "setAccountProperty:forKey:", v4, CFSTR("primaryAccount"));

}

- (BOOL)primaryEmailVerified
{
  void *v2;
  char v3;

  -[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("primaryEmailVerified"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDictionary)dataclassProperties
{
  return (NSDictionary *)-[ACAccount dataclassProperties](self->_account, "dataclassProperties");
}

- (NSSet)provisionedDataclasses
{
  return (NSSet *)-[ACAccount provisionedDataclasses](self->_account, "provisionedDataclasses");
}

- (NSSet)enabledDataclasses
{
  return (NSSet *)-[ACAccount enabledDataclasses](self->_account, "enabledDataclasses");
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  -[ACAccount setEnabled:forDataclass:](self->_account, "setEnabled:forDataclass:", a3, a4);
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  return -[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", a3);
}

- (NSString)authToken
{
  void *v2;
  void *v3;

  -[ACAccount credential](self->_account, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAuthToken:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[ACAccount credential](self->_account, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[ACAccount credential](self->_account, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ACAccount credential](self->_account, "credential");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToken:", v9);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
      objc_msgSend(v8, "setToken:", v9);
      -[ACAccount setCredential:](self->_account, "setCredential:", v8);
    }

    -[ACAccount setAuthenticated:](self->_account, "setAuthenticated:", 1);
  }

}

- (NSString)password
{
  void *v2;
  void *v3;

  -[ACAccount credential](self->_account, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPassword:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ACAccount credential](self->_account, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[ACAccount credential](self->_account, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ACAccount credential](self->_account, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPassword:", v9);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v9);
      -[ACAccount setCredential:](self->_account, "setCredential:", v8);
    }

    -[ACAccount setAuthenticated:](self->_account, "setAuthenticated:", 1);
  }

}

- (NSString)accountFooterText
{
  void *v2;
  void *v3;
  void *v4;

  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("accountFooterText"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSDictionary)accountFooterButton
{
  void *v2;
  void *v3;
  void *v4;

  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("accountFooterButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)accountFirstDisplayAlert
{
  void *v2;
  void *v3;
  void *v4;

  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("firstDisplayAlert"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)isProvisionedForDataclass:(id)a3
{
  ACAccount *account;
  id v4;
  void *v5;
  char v6;

  account = self->_account;
  v4 = a3;
  -[ACAccount provisionedDataclasses](account, "provisionedDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)propertiesForDataclass:(id)a3
{
  ACAccount *account;
  id v4;
  void *v5;
  void *v6;

  account = self->_account;
  v4 = a3;
  -[ACAccount dataclassProperties](account, "dataclassProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateAccountWithProvisioningResponse:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AAAccount account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_updateWithProvisioningResponse:", v4);

}

- (id)accountPropertyForKey:(id)a3
{
  return (id)-[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", a3);
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  -[ACAccount setAccountProperty:forKey:](self->_account, "setAccountProperty:forKey:", a3, a4);
}

- (BOOL)serviceUnavailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("notAvailable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)serviceUnavailableInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("notAvailable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)needsRegistration
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AAAccount dataclassProperties](self, "dataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AAAccount personID](self, "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)useCellularForDataclass:(id)a3
{
  ACAccount *account;
  id v4;
  void *v5;
  char v6;

  account = self->_account;
  v4 = a3;
  -[ACAccount accountPropertyForKey:](account, "accountPropertyForKey:", CFSTR("dataclassesDisabledForCellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

- (void)setUseCellular:(BOOL)a3 forDataclass:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  -[ACAccount accountPropertyForKey:](self->_account, "accountPropertyForKey:", CFSTR("dataclassesDisabledForCellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
    objc_msgSend(v7, "removeObject:", v8);
  else
    objc_msgSend(v7, "addObject:", v8);
  -[AAAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, CFSTR("dataclassesDisabledForCellular"));

}

- (id)_mailChildAccount
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[AAAccount isProvisionedForDataclass:](self, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3D0]))
    return 0;
  -[ACAccount childAccounts](self->_account, "childAccounts");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0C8F0D8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "accountType", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isEqualToString:", v7) & 1) != 0)
        {
          v12 = v9;

          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)needsEmailConfiguration
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = *MEMORY[0x1E0C8F3D0];
  if (!-[AAAccount isProvisionedForDataclass:](self, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3D0]))
    return 0;
  -[AAAccount _mailChildAccount](self, "_mailChildAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  -[AAAccount propertiesForDataclass:](self, "propertiesForDataclass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int)mobileMeAccountStatus
{
  return 2;
}

- (NSString)syncStoreIdentifier
{
  return 0;
}

- (id)_childAccounts
{
  return (id)-[ACAccount childAccounts](self->_account, "childAccounts");
}

- (NSArray)supportedDataclasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AAAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)notifyUserOfQuotaDepletion
{
  AAQuotaDepletionAlert *v2;

  v2 = objc_alloc_init(AAQuotaDepletionAlert);
  -[AAQuotaDepletionAlert showWithHandler:](v2, "showWithHandler:", 0);

}

- (void)presentQuotaDepletionAlertForDataclass:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AAQuotaDepletionAlert initForDataclass:]([AAQuotaDepletionAlert alloc], "initForDataclass:", v6);

  objc_msgSend(v7, "showWithHandler:", v5);
}

- (void)presentQuotaDepletionAlertForDataclass:(id)a3
{
  -[AAAccount presentQuotaDepletionAlertForDataclass:withHandler:](self, "presentQuotaDepletionAlertForDataclass:withHandler:", a3, 0);
}

- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AAQuotaDepletionAlert initForDataclass:]([AAQuotaDepletionAlert alloc], "initForDataclass:", v6);

  LOBYTE(v6) = objc_msgSend(v7, "showIfNecessaryWithHandler:", v5);
  return (char)v6;
}

- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3
{
  return -[AAAccount presentQuotaDepletionAlertForDataclassIfNecessary:withHandler:](self, "presentQuotaDepletionAlertForDataclassIfNecessary:withHandler:", a3, 0);
}

- (void)updateAccountPropertiesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AAAccount_updateAccountPropertiesWithHandler___block_invoke;
  v7[3] = &unk_1E416E4C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__AAAccount_updateAccountPropertiesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_updatePropertiesForAppleAccount:completion:", v3, *(_QWORD *)(a1 + 40));

}

- (void)authenticateWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AAAccount account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccount account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__AAAccount_authenticateWithHandler___block_invoke;
  v9[3] = &unk_1E4170C40;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "verifyCredentialsForAccount:saveWhenAuthorized:withHandler:", v7, 0, v9);

}

uint64_t __37__AAAccount_authenticateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)renewCredentialsForAppleIDWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AAAccount account](self, "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccount account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renewCredentialsForAccount:force:reason:completion:", v6, 0, 0, v4);

}

- (BOOL)needsToVerifyTerms
{
  void *v2;
  char v3;

  -[AAAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("needsToVerifyTerms"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNeedsToVerifyTerms:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AAAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("needsToVerifyTerms"));

}

- (NSString)fmipToken
{
  return self->_fmipToken;
}

- (void)setFmipToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_fmipToken, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
