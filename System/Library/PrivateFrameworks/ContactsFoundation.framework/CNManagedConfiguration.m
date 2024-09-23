@implementation CNManagedConfiguration

- (BOOL)deviceHasManagementRestrictions
{
  void *v2;
  char v3;

  -[CNManagedConfiguration profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpenInRestrictionInEffect");

  return v3;
}

- (CNManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (id)initForContactProvider
{
  return -[CNManagedConfiguration initWithBundleIdentifier:managedProfileConnection:](self, "initWithBundleIdentifier:managedProfileConnection:", 0, 0);
}

- (CNManagedConfiguration)initWithAuditToken:(id *)a3 managedProfileConnection:(id)a4
{
  __int128 v5;
  id v6;
  void *v7;
  void *v8;
  CNManagedConfiguration *v9;
  __int128 v11;
  __int128 v12;

  v5 = *(_OWORD *)&a3->var0[4];
  v11 = *(_OWORD *)a3->var0;
  v12 = v5;
  v6 = a4;
  +[CNAuditToken auditToken:](CNAuditToken, "auditToken:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAuditTokenUtilities bundleIdentifierForAuditToken:](CNAuditTokenUtilities, "bundleIdentifierForAuditToken:", v7, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNManagedConfiguration initWithBundleIdentifier:managedProfileConnection:](self, "initWithBundleIdentifier:managedProfileConnection:", v8, v6);

  return v9;
}

- (CNManagedConfiguration)initWithBundleIdentifier:(id)a3 managedProfileConnection:(id)a4
{
  id v6;
  id v7;
  CNManagedConfiguration *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  CNManagedConfiguration *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNManagedConfiguration;
  v8 = -[CNManagedConfiguration init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_profileConnection, a4);
    v11 = v8;
  }

  return v8;
}

- (BOOL)hasContactProviderRestrictions
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNManagedConfiguration providerContainerIdentifier](self, "providerContainerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNManagedConfiguration providerContainerIdentifier](self, "providerContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)providerContainerIdentifier
{
  return self->_providerContainerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_3_0 != -1)
    dispatch_once(&os_log_cn_once_token_3_0, &__block_literal_global_13);
  return (id)os_log_cn_once_object_3_0;
}

void __32__CNManagedConfiguration_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.managedConfiguration", "general");
  v1 = (void *)os_log_cn_once_object_3_0;
  os_log_cn_once_object_3_0 = (uint64_t)v0;

}

- (CNManagedConfiguration)init
{
  id v2;

  CNUnimplementedMethodException(-[CNManagedConfiguration initWithBundleIdentifier:managedProfileConnection:](self, "initWithBundleIdentifier:managedProfileConnection:", 0, 0), a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)canReadFromLocalAccount
{
  void *v3;
  void *v4;
  char v5;

  -[CNManagedConfiguration profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNManagedConfiguration bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "mayShowLocalContactsAccountsForTargetBundleID:targetAccountManagement:", v4, 0);

  return v5;
}

- (BOOL)canWriteToLocalAccount
{
  void *v3;
  void *v4;
  char v5;

  -[CNManagedConfiguration profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNManagedConfiguration bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "mayShowLocalContactsAccountsForBundleID:sourceAccountManagement:", v4, 0);

  return v5;
}

- (int)accountManagementForIdentifier:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v4))
  {
    if (-[CNManagedConfiguration accountIsManagedForIdentifier:](self, "accountIsManagedForIdentifier:", v4))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)accountIsManaged:(id)a3
{
  return objc_msgSend(a3, "MCIsManaged");
}

- (BOOL)accountIsManagedForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[CNManagedConfiguration deviceHasManagementRestrictions](self, "deviceHasManagementRestrictions"))
  {
    +[CNManagedAccountsCache sharedCache](CNManagedAccountsCache, "sharedCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[CNManagedConfiguration accountIsManaged:](self, "accountIsManaged:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canReadFromAccountWithIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[CNManagedConfiguration accountForIdentifier:](self, "accountForIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNManagedConfiguration readableAccountsFromAccounts:](self, "readableAccountsFromAccounts:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = !CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v9);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (BOOL)canWriteToAccountWithIdentifier:(id)a3
{
  return -[CNManagedConfiguration canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:](self, "canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:", a3, 0);
}

- (BOOL)canWriteToAccountWithIdentifier:(id)a3 fromSourceAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v6))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    -[CNManagedConfiguration accountForIdentifier:](self, "accountForIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[CNManagedConfiguration accountManagementForIdentifier:](self, "accountManagementForIdentifier:", v7);
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNManagedConfiguration writableAccountsFromAccounts:sourceAccountManagement:](self, "writableAccountsFromAccounts:sourceAccountManagement:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = !CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v12);
    }
    else
    {
      LOBYTE(v8) = 1;
    }

  }
  return v8;
}

- (id)readableAccountIdentifiersFromIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v4))
  {
    v5 = v4;
  }
  else
  {
    +[CNManagedAccountsCache sharedCache](CNManagedAccountsCache, "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsForIdentifiers:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNManagedConfiguration readableAccountsFromAccounts:](self, "readableAccountsFromAccounts:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_72);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __68__CNManagedConfiguration_readableAccountIdentifiersFromIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)writableAccountIdentifiersFromIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v4))
  {
    v5 = v4;
  }
  else
  {
    +[CNManagedAccountsCache sharedCache](CNManagedAccountsCache, "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsForIdentifiers:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNManagedConfiguration writableAccountsFromAccounts:](self, "writableAccountsFromAccounts:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_73);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __68__CNManagedConfiguration_writableAccountIdentifiersFromIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)writableAccountsFromAccounts:(id)a3
{
  return -[CNManagedConfiguration writableAccountsFromAccounts:sourceAccountManagement:](self, "writableAccountsFromAccounts:sourceAccountManagement:", a3, 0);
}

- (id)writableAccountsFromAccounts:(id)a3 sourceAccountManagement:(int)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v6))
  {
    v7 = v6;
  }
  else
  {
    -[CNManagedConfiguration profileConnection](self, "profileConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNManagedConfiguration bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredOpenInAccounts:originatingAppBundleID:sourceAccountManagement:", v6, v9, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)readableAccountsFromAccounts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v4))
  {
    v5 = v4;
  }
  else
  {
    -[CNManagedConfiguration profileConnection](self, "profileConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNManagedConfiguration bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredOpenInOriginatingAccounts:targetAppBundleID:targetAccountManagement:", v4, v7, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accountForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CNManagedAccountsCache sharedCache](CNManagedAccountsCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProviderContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerContainerIdentifier, a3);
}

- (BOOL)canAccessProviderContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNManagedConfiguration providerContainerIdentifier](self, "providerContainerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (NSString)clientBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end
