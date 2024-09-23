@implementation ACAccount(ContactsFoundation)

- (uint64_t)_cn_dsid
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("DACardDAVAccountDSID"));
}

- (uint64_t)set_cn_dsid:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("DACardDAVAccountDSID"));
}

- (uint64_t)_cn_altDSID
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("DACardDAVAccountAltDSID"));
}

- (uint64_t)set_cn_altDSID:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("DACardDAVAccountAltDSID"));
}

- (uint64_t)_cn_principalPath
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("DAAccountPrincipalPath"));
}

- (uint64_t)set_cn_principalPath:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("DAAccountPrincipalPath"));
}

- (uint64_t)_cn_appleID
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("DACardDAVAccountAppleID"));
}

- (uint64_t)set_cn_appleID:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("DACardDAVAccountAppleID"));
}

- (uint64_t)_cn_firstName
{
  return objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EF78]);
}

- (uint64_t)set_cn_firstName:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, *MEMORY[0x1E0C8EF78]);
}

- (uint64_t)_cn_lastName
{
  return objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EFB8]);
}

- (uint64_t)set_cn_lastName:()ContactsFoundation
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, *MEMORY[0x1E0C8EFB8]);
}

- (uint64_t)_cn_isPrimaryAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("primaryAccount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)_cn_isLDAP
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F100]);

  return v3;
}

- (uint64_t)_cn_isCardDAV
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F060]);

  return v3;
}

- (uint64_t)_cn_isAppleDisplayAccount
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "displayAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  return v4;
}

- (uint64_t)_cn_isPrimaryiCloudAccount
{
  uint64_t result;

  result = objc_msgSend(a1, "_cn_isPrimaryAccount");
  if ((_DWORD)result)
    return objc_msgSend(a1, "_cn_isAppleDisplayAccount");
  return result;
}

- (uint64_t)_cn_isChildDelegateAccount
{
  int v2;
  void *v3;
  int v4;

  v2 = objc_msgSend(a1, "_cn_isCardDAV");
  objc_msgSend(a1, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_isCardDAV");

  return v2 & objc_msgSend(a1, "_cn_isAppleDisplayAccount") & v4;
}

- (uint64_t)_cn_isManaged
{
  if (LoadManagedConfiguration_loadPredicate != -1)
    dispatch_once(&LoadManagedConfiguration_loadPredicate, &__block_literal_global_3);
  return objc_msgSend(a1, "MCIsManaged");
}

- (uint64_t)_cn_appleAccountAppleID
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("appleId"));
}

- (uint64_t)_cn_appleAccountAppleIDAliases
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("appleIDAliases"));
}

- (void)setPropertiesFromDelegateInfo:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_dsid:", v5);

  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_altDSID:", v6);

  objc_msgSend(v4, "principalPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_principalPath:", v7);

  objc_msgSend(v4, "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_appleID:", v8);

  objc_msgSend(v4, "nameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_firstName:", v10);

  objc_msgSend(v4, "nameComponents");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "set_cn_lastName:", v11);

}

@end
