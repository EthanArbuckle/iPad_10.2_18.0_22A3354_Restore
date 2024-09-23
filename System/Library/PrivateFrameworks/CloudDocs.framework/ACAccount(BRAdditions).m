@implementation ACAccount(BRAdditions)

- (void)br_setEnabledForiCloudDesktop:()BRAdditions
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *MEMORY[0x1E0C8F430];
  objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F430]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, BRAccountPropertyiCloudDesktopEnabled);

  objc_msgSend(a1, "setProperties:forDataclass:", v8, v5);
}

- (uint64_t)br_isEnabledForiCloudDesktop
{
  objc_msgSend(a1, "br_isEnabledForCloudDocs");
  return 0;
}

- (uint64_t)br_isEnabledForCloudDocs
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);
  if ((_DWORD)result)
    return objc_msgSend(a1, "br_isCloudDocsMigrated");
  return result;
}

- (uint64_t)br_isEnabledForUbiquity
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);
  if ((_DWORD)result)
    return objc_msgSend(a1, "aa_isUsingCloudDocs") ^ 1;
  return result;
}

- (__CFString)br_personaIdentifier
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EFC8]);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = CFSTR("__defaultPersonaID__");
  v3 = v1;

  return v3;
}

- (BOOL)br_hasPersonaIdentifier
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "br_personaIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") != 0;

  return v2;
}

- (uint64_t)br_isEligibleiCloudAccount
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]))
  {
    if ((objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(a1, "isDataSeparatedAccount");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
