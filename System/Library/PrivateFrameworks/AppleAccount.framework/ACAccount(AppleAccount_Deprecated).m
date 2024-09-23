@implementation ACAccount(AppleAccount_Deprecated)

- (uint64_t)aa_isSyncedAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("syncedAccount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)aa_setSyncedAccount:()AppleAccount_Deprecated
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("syncedAccount"));

}

- (BOOL)aa_needsRegistration
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "aa_personID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)aa_serviceUnavailable
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("notAvailable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)aa_serviceUnavailableInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("notAvailable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)aa_protocolVersion
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("protocolVersion"));
}

- (uint64_t)aa_syncStoreIdentifier
{
  return 0;
}

- (id)aa_accountTypeString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accountTypeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)aa_accountFooterText
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("accountFooterText"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)aa_accountFooterButton
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("accountFooterButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)aa_accountFirstDisplayAlert
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Account"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("firstDisplayAlert"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
