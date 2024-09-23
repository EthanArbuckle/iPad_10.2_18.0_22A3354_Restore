@implementation ACAccount(AppleAccount)

- (id)aa_fmfAccount
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F090]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)aa_fmipAccount
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F078]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)aa_useCellularForDataclass:()AppleAccount
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("dataclassesDisabledForCellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1u;
}

- (uint64_t)aa_isManagedAppleID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("isManagedAppleID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)aa_personID
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("personID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "stringValue");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (uint64_t)aa_isSuspended
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "aa_suspensionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "aa_needsToVerifyTerms");

  return v3;
}

- (AASuspensionInfo)aa_suspensionInfo
{
  void *v2;
  id v3;
  AASuspensionInfo *v4;
  id v5;
  AASuspensionInfo *v6;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_suspensionInfo");
    v4 = (AASuspensionInfo *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("suspendedInfo"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v5;
    else
      v3 = 0;

    if (!v3)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v4 = -[AASuspensionInfo initWithDictionary:]([AASuspensionInfo alloc], "initWithDictionary:", v3);
  }
  v6 = v4;
LABEL_9:

  return v6;
}

- (uint64_t)aa_needsToVerifyTerms
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "aa_needsToVerifyTerms");
  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("needsToVerifyTerms"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  v5 = v4;

  return v5;
}

- (uint64_t)aa_isAccountClass:()AppleAccount
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "aa_accountClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (__CFString)aa_accountClass
{
  id v2;
  id v3;
  __CFString *v4;
  id v5;
  id v6;
  int v7;
  __CFString *v8;

  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("accountClass"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    v4 = (__CFString *)v3;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("primaryAccount"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = CFSTR("basic");
    if (v7)
      v8 = CFSTR("primary");
    v4 = v8;

  }
  return v4;
}

- (id)aa_cloudKitAccount
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F070]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)aa_altDSID
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("altDSID"));
}

- (id)aa_formattedUsername
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D002B8];
  objc_msgSend(a1, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formattedUsernameFromUsername:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)aa_primaryEmail
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("primaryEmail"));
}

- (uint64_t)aa_appleId
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("appleId"));
}

- (uint64_t)aa_appleIDAliases
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("appleIDAliases"));
}

- (uint64_t)aa_firstName
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("firstName"));
}

- (void)aa_setFirstName:()AppleAccount
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("firstName"));

}

- (uint64_t)aa_middleName
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("middleName"));
}

- (void)aa_setMiddleName:()AppleAccount
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("middleName"));

}

- (uint64_t)aa_lastName
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("lastName"));
}

- (void)aa_setLastName:()AppleAccount
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("lastName"));

}

- (id)aa_fullName
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(a1, "aa_firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGivenName:", v3);

  objc_msgSend(a1, "aa_lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFamilyName:", v4);

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v2, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EF80]);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (AARegionInfo)aa_regionInfo
{
  void *v1;
  AARegionInfo *v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("regionInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = -[AARegionInfo initWithDictionary:]([AARegionInfo alloc], "initWithDictionary:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)aa_normalizedPersonID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0CFCF10]);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v3, "stringValue"),
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        (v3 = (void *)v4) == 0))
  {
    objc_msgSend(a1, "accountType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F0E8]);

    if (!v7
      || (objc_msgSend(a1, "accountPropertyForKey:", CFSTR("profile-id")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("D:"), &stru_1E41752F8),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      objc_msgSend(a1, "accountType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C8F030]);

      if (v11)
      {
        objc_msgSend(a1, "accountPropertyForKey:", CFSTR("personID"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (uint64_t)aa_isPrimaryAccount
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;

  objc_msgSend(a1, "aa_accountClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(a1, "aa_isAccountClass:", CFSTR("primary"));
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ACAccount(AppleAccount) aa_isPrimaryAccount].cold.1(v4);

    objc_opt_class();
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("primaryAccount"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    v3 = objc_msgSend(v6, "BOOLValue");
  }

  return v3;
}

- (uint64_t)aa_setPrimaryAccount:()AppleAccount
{
  const __CFString *v4;

  if ((a3 & 1) != 0)
  {
    v4 = CFSTR("primary");
  }
  else if (+[AAPreferences isMultipleFullAccountsEnabled](AAPreferences, "isMultipleFullAccountsEnabled"))
  {
    v4 = CFSTR("full");
  }
  else
  {
    v4 = CFSTR("basic");
  }
  return objc_msgSend(a1, "aa_setAccountClass:", v4);
}

- (void)aa_setAccountClass:()AppleAccount
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(a1, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccount+AppleAccount.m"), 216, CFSTR("Attempt to set accountClass on non-iCloud account"));

  }
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACAccount(AppleAccount) aa_setAccountClass:].cold.1((uint64_t)a1, (uint64_t)v5, v9);

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v5, CFSTR("accountClass"));
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("primary"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v11, CFSTR("primaryAccount"));

}

- (BOOL)aa_updateAccountClassIfNecessary
{
  id v2;
  id v3;
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;

  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("accountClass"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (!v3)
  {
    objc_opt_class();
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("primaryAccount"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

    v6 = objc_msgSend(v5, "BOOLValue");
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACAccount(AppleAccount) aa_updateAccountClassIfNecessary].cold.1((uint64_t)a1, v6, v7);

    if (v6)
      v8 = CFSTR("primary");
    else
      v8 = CFSTR("basic");
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, CFSTR("accountClass"));
  }

  return v3 == 0;
}

- (uint64_t)aa_isPrimaryEmailVerified
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("primaryEmailVerified"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)aa_setPrimaryEmailVerified:()AppleAccount
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("primaryEmailVerified"));

}

- (void)aa_setNeedsToVerifyTerms:()AppleAccount
{
  void *v5;
  id v6;

  objc_msgSend(a1, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "parentAccount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aa_setNeedsToVerifyTerms:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccountProperty:forKey:");
  }

}

- (uint64_t)aa_isUsingCloudDocs
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("usesCloudDocs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)aa_setUsesCloudDocs:()AppleAccount
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("usesCloudDocs"));

}

- (uint64_t)aa_isCloudSubscriber
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("isCloudSubscriber"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)aa_setIsCloudSubscriber:()AppleAccount
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("isCloudSubscriber"));

}

- (uint64_t)aa_isCloudDocsMigrationComplete
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("cloudDocsMigrationComplete"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)aa_setCloudDocsMigrationComplete:()AppleAccount
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("cloudDocsMigrationComplete"));

}

- (BOOL)aa_isUsingiCloud
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "enabledDataclasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (BOOL)aa_isRemotelyManaged
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EFE0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)aa_isNotesMigrated
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("notesMigrated"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)aa_isRemindersMigrated
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("remindersMigrated"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)aa_isRemindersAutoMigratableToCK
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("remindersAutoMigratableToCK"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)aa_isSandboxAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("isSandboxAcct"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (BOOL)aa_isAuthKitAccount
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "compare:options:", *MEMORY[0x1E0C8F0C8], 4) == 0;

  return v3;
}

- (uint64_t)aa_hasOptionalTerms
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("hasOptionalTerms"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)aa_lastKnownQuota
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("lastKnownQuota"));
}

- (uint64_t)aa_setLastKnownQuota:()AppleAccount
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("lastKnownQuota"));
}

- (id)aa_repairState
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_repairState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("repairState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)aa_setRepairState:()AppleAccount
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_setRepairState:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("repairState"));
  }

}

- (uint64_t)aa_needsEmailConfiguration
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(a1, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3D0]);
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "aa_childMailAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return 0;
    else
      return objc_msgSend(a1, "_hasMailDataclassProperties") ^ 1;
  }
  return result;
}

- (uint64_t)aa_serverDisabledDataclass:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(a1, "aa_isManagedAppleID")
    && (objc_msgSend(a1, "dataclassProperties"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(a1, "dataclassProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "_dataclassIsDisabledForProperties:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_dataclassIsDisabledForProperties:()AppleAccount
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("disabled"));

  return v4;
}

- (BOOL)_hasMailDataclassProperties
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)aa_isFamilyEligible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("familyEligible"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)aa_ageCategory
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("ageCategory"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (uint64_t)aa_lastAgreedTermsInfo
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("lastAgreedTerms"));
}

- (id)aa_childMailAccount
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3D0]))
  {
    objc_msgSend(a1, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0D8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)aa_password
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "password");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)aa_setPassword:()AppleAccount
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPassword:", v9);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v9);
      objc_msgSend(a1, "setCredential:", v8);
    }

  }
}

- (id)aa_authToken
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)aa_setAuthToken:()AppleAccount
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "credential");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToken:", v9);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
      objc_msgSend(v8, "setToken:", v9);
      objc_msgSend(a1, "setCredential:", v8);
    }

    objc_msgSend(a1, "setAuthenticated:", 1);
  }

}

- (id)aa_fmipToken
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  objc_msgSend(a1, "aa_fmipAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "credential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "ERROR: Didn't find a child account, returning findMyiPhoneToken", v9, 2u);
    }

    objc_msgSend(a1, "credential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findMyiPhoneToken");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  return v7;
}

- (id)aa_mapsToken
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapsToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)aa_setMapsToken:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(a1, "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapsToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqualToString:", v6);

    v4 = v10;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(a1, "credential");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMapsToken:", v10);
      }
      else
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
        objc_msgSend(v9, "setMapsToken:", v10);
        objc_msgSend(a1, "setCredential:", v9);
      }

      v4 = v10;
    }
  }

}

- (id)aa_mdmServerToken
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mdmServerToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)aa_setMDMServerToken:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(a1, "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mdmServerToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqualToString:", v6);

    v4 = v10;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(a1, "credential");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMdmServerToken:", v10);
      }
      else
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
        objc_msgSend(v9, "setMdmServerToken:", v10);
        objc_msgSend(a1, "setCredential:", v9);
      }

      v4 = v10;
    }
  }

}

- (id)aa_authTokenWithError:()AppleAccount
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(a1, "credentialWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v5;
  if (a3 && v5)
  {
    v7 = 0;
    *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    objc_msgSend(v4, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (uint64_t)aa_hsaTokenWithError:()AppleAccount
{
  NSObject *v0;

  _AALogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    -[ACAccount(AppleAccount) aa_hsaTokenWithError:].cold.1(v0);

  return 0;
}

- (void)aa_setUseCellular:()AppleAccount forDataclass:
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("dataclassesDisabledForCellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((a3 & 1) != 0)
    objc_msgSend(v7, "removeObject:", v8);
  else
    objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(a1, "setAccountProperty:forKey:", v7, CFSTR("dataclassesDisabledForCellular"));

}

- (void)aa_updateWithProvisioningResponse:()AppleAccount
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccount+AppleAccount.m"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provisioningResponse"));

  }
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v86 = v7;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Updating account %@ with provisioning response.", buf, 0xCu);

  }
  if (objc_msgSend(a1, "aa_needsToVerifyTerms"))
    objc_msgSend(a1, "aa_setNeedsToVerifyTerms:", 0);
  objc_msgSend(a1, "aa_suspensionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(a1, "setAccountProperty:forKey:", 0, CFSTR("suspendedInfo"));
  objc_msgSend(v5, "altDSID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(a1, "setAccountProperty:forKey:", v9, CFSTR("altDSID"));
  v63 = (void *)v9;
  objc_msgSend(v5, "dataclassProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_aa_setDataclassProperties:", v10);

  objc_msgSend(v5, "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v11, CFSTR("personID"));

  objc_msgSend(v5, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v12, CFSTR("firstName"));

  objc_msgSend(v5, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v13, CFSTR("lastName"));

  objc_msgSend(v5, "primaryEmail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v14, CFSTR("primaryEmail"));

  objc_msgSend(v5, "primaryEmailVerified");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v15, CFSTR("primaryEmailVerified"));

  objc_msgSend(v5, "appleIDAliases");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v16, CFSTR("appleIDAliases"));

  objc_msgSend(v5, "protocolVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v17, CFSTR("protocolVersion"));

  objc_msgSend(v5, "appleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v18, CFSTR("appleId"));

  objc_msgSend(v5, "regionInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v19, CFSTR("regionInfo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isManagedAppleID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v20, CFSTR("isManagedAppleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isNotesMigrated"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v21, CFSTR("notesMigrated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isRemindersMigrated"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v22, CFSTR("remindersMigrated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isRemindersAutoMigratableToCK"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v23, CFSTR("remindersAutoMigratableToCK"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isSandboxAccount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v24, CFSTR("isSandboxAcct"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isCloudDocsMigrated"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v25, CFSTR("cloudDocsMigrationComplete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isCloudDocsMigrated"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v26, CFSTR("usesCloudDocs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "hasOptionalTerms"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v27, CFSTR("hasOptionalTerms"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isFamilyEligible"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v28, CFSTR("familyEligible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "ageCategory"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v29, CFSTR("ageCategory"));

  v30 = (void *)MEMORY[0x1E0C99E60];
  v64 = v5;
  objc_msgSend(v5, "provisionedDataclasses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = objc_claimAutoreleasedReturnValue();

  +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v32;
  objc_msgSend(v33, "filteredServerProvidedFeatures:forAccount:", v32, a1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v35 = v34;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v78 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(a1, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    }
    while (v37);
  }

  objc_msgSend(a1, "enabledDataclasses");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v74 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        if ((objc_msgSend(v35, "containsObject:", v45) & 1) == 0)
        {
          _AALogSystem();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v45;
            _os_log_impl(&dword_19EACA000, v46, OS_LOG_TYPE_DEFAULT, "Disabling dataclass %@ because it is not provisioned.", buf, 0xCu);
          }

          objc_msgSend(a1, "setEnabled:forDataclass:", 0, v45);
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v42);
  }

  objc_msgSend(a1, "provisionedDataclasses");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v70 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        if ((objc_msgSend(v35, "containsObject:", v52) & 1) == 0)
        {
          _AALogSystem();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v52;
            _os_log_impl(&dword_19EACA000, v53, OS_LOG_TYPE_DEFAULT, "Removing dataclass provisioning %@ because it is not provisioned.", buf, 0xCu);
          }

          objc_msgSend(a1, "setProvisioned:forDataclass:", 0, v52);
        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    }
    while (v49);
  }
  if (objc_msgSend(a1, "aa_isManagedAppleID"))
  {
    objc_msgSend(a1, "enabledDataclasses");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v40 = v54;
    v55 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v66;
      do
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v66 != v57)
            objc_enumerationMutation(v40);
          v59 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
          if (objc_msgSend(a1, "aa_serverDisabledDataclass:", v59))
          {
            _AALogSystem();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v59;
              _os_log_impl(&dword_19EACA000, v60, OS_LOG_TYPE_DEFAULT, "Disabling dataclass %@ because it has been restricted by the server.", buf, 0xCu);
            }

            objc_msgSend(a1, "setEnabled:forDataclass:", 0, v59);
          }
        }
        v56 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v56);
    }

  }
  objc_msgSend(a1, "aa_updateTokensWithProvisioningResponse:", v64);

}

- (BOOL)aa_updateTokensWithProvisioningResponse:()AppleAccount
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "authToken");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;
  if (v5)
    objc_msgSend(a1, "aa_setAuthToken:", v5);
  v66 = (void *)v5;
  objc_msgSend(v4, "mapsToken");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Saving the Maps token", buf, 2u);
    }

    objc_msgSend(a1, "aa_setMapsToken:", v7);
    v6 = 1;
  }
  objc_msgSend(v4, "mdmServerToken");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Saving the MDM Server token", buf, 2u);
    }

    objc_msgSend(a1, "aa_setMDMServerToken:", v9);
    v6 = 1;
  }
  objc_msgSend(v4, "searchPartyToken");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Setting SearchParty token...", buf, 2u);
    }

    objc_msgSend(a1, "credential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCredentialItem:forKey:", v11, *MEMORY[0x1E0C8F268]);

    v6 = 1;
  }
  v63 = (void *)v11;
  v64 = (void *)v9;
  v65 = (void *)v7;
  objc_msgSend(v4, "keyTransparencyToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Setting KeyTransparency token...", buf, 2u);
    }

    objc_msgSend(a1, "credential");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCredentialItem:forKey:", v14, *MEMORY[0x1E0C8F208]);

    v6 = 1;
  }
  objc_msgSend(v4, "cloudKitToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "Setting CloudKit token...", buf, 2u);
    }

    objc_msgSend(a1, "credential");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCredentialItem:forKey:", v17, *MEMORY[0x1E0C8F188]);

    objc_msgSend(a1, "aa_cloudKitAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "setAuthenticated:", 1);
      objc_msgSend(v21, "credential");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setToken:", v17);

      objc_msgSend(a1, "accountStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      v24 = objc_msgSend(v23, "saveVerifiedAccount:error:", v21, &v67);
      v25 = v67;

      if ((v24 & 1) == 0)
      {
        _AALogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:].cold.3((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);

      }
    }
    else
    {
      _AALogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v33, OS_LOG_TYPE_DEFAULT, "Couldn't find a CloudKit child account - stashing the token away", buf, 2u);
      }

      objc_msgSend(a1, "username");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      +[AAKeychainManager setPassword:forServiceName:username:accessGroup:](AAKeychainManager, "setPassword:forServiceName:username:accessGroup:", v17, CFSTR("com.apple.appleaccount.cloudkit.token"), v25, CFSTR("appleaccount"));
    }

    v6 = 1;
  }
  objc_msgSend(v4, "fmipToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(a1, "credential");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFindMyiPhoneToken:", v34);

    v6 = 1;
  }
  objc_msgSend(v4, "fmipAppToken");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    _AALogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v37, OS_LOG_TYPE_DEFAULT, "Setting FMIP App token...", buf, 2u);
    }

    objc_msgSend(a1, "credential");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setCredentialItem:forKey:", v36, *MEMORY[0x1E0C8F1F0]);

    v6 = 1;
  }
  objc_msgSend(v4, "fmipSiriToken");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    _AALogSystem();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v40, OS_LOG_TYPE_DEFAULT, "Setting FMIP Siri token...", buf, 2u);
    }

    objc_msgSend(a1, "credential");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCredentialItem:forKey:", v39, *MEMORY[0x1E0C8F1F8]);

    v6 = 1;
  }
  objc_msgSend(v4, "fmfToken");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    _AALogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:].cold.2(v43, v44, v45, v46, v47, v48, v49, v50);

    objc_msgSend(a1, "credential");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCredentialItem:forKey:", v42, *MEMORY[0x1E0C8F1E8]);

    v6 = 1;
  }
  objc_msgSend(v4, "fmfAppToken");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    _AALogSystem();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:].cold.1(v53, v54, v55, v56, v57, v58, v59, v60);

    objc_msgSend(a1, "credential");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setCredentialItem:forKey:", v52, *MEMORY[0x1E0C8F1E0]);

    v6 = 1;
  }

  return v6;
}

- (uint64_t)aa_hasDuplicateAccount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *MEMORY[0x1E0C8F030];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:error:", v3, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;

  if (!v4)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACAccount(AppleAccount) aa_hasDuplicateAccount].cold.1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_8;
  }
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke;
  v19[3] = &unk_1E4170250;
  v19[4] = a1;
  objc_msgSend(v4, "aaf_firstObjectPassingTest:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke_2;
  v18[3] = &unk_1E4170250;
  v18[4] = a1;
  objc_msgSend(v4, "aaf_firstObjectPassingTest:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || !v8)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

- (uint64_t)_aa_isExistingAccount:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a1, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  objc_msgSend(a1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "isEqualToString:", v11) & v9;
  return v12;
}

- (uint64_t)aa_isDuplicateAccount:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  NSObject *v31;

  v4 = a3;
  objc_msgSend(a1, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  objc_msgSend(a1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v10, "isEqualToString:", v11);

  v12 = 0;
  if ((v7 & 1) == 0 && v9)
  {
    objc_msgSend(a1, "aa_personID");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_7;
    v14 = (void *)v13;
    objc_msgSend(a1, "aa_personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
    {
      _AALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ACAccount(AppleAccount) aa_isDuplicateAccount:].cold.4(a1, (uint64_t)v4, v18);
    }
    else
    {
LABEL_7:
      objc_msgSend(a1, "username");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_11;
      v20 = (void *)v19;
      objc_msgSend(a1, "username");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "username");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (v23)
      {
        _AALogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[ACAccount(AppleAccount) aa_isDuplicateAccount:].cold.3();
      }
      else
      {
LABEL_11:
        objc_msgSend(a1, "aa_altDSID");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_15;
        v25 = (void *)v24;
        objc_msgSend(a1, "aa_altDSID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "aa_altDSID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToString:", v27);

        if (v28)
        {
          _AALogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[ACAccount(AppleAccount) aa_isDuplicateAccount:].cold.2(a1, (uint64_t)v4, v18);
        }
        else
        {
LABEL_15:
          objc_msgSend(v4, "aa_appleIDAliases");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "username");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
LABEL_21:

            goto LABEL_22;
          }
          objc_msgSend(a1, "username");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[NSObject containsObject:](v18, "containsObject:", v29);

          if (!v30)
          {
            v12 = 0;
            goto LABEL_21;
          }
          _AALogSystem();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[ACAccount(AppleAccount) aa_isDuplicateAccount:].cold.1();

        }
      }
    }
    v12 = 1;
    goto LABEL_21;
  }
LABEL_22:

  return v12;
}

- (void)_aa_setAppleID:()AppleAccount
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("appleId"));

}

- (void)_aa_setAltDSID:()AppleAccount
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("altDSID"));

}

- (void)_aa_setPrimaryEmail:()AppleAccount
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("primaryEmail"));

}

- (id)_aa_rawPassword
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "credentialItemForKey:", *MEMORY[0x1E0C8F258]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_aa_setRawPassword:()AppleAccount
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(a1, "_aa_rawPassword");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "isEqualToString:", v5);

    v4 = v10;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(a1, "credential");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "setCredentialItem:forKey:", v10, *MEMORY[0x1E0C8F258]);
      }
      else
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
        objc_msgSend(v9, "setCredentialItem:forKey:", v10, *MEMORY[0x1E0C8F258]);
        objc_msgSend(a1, "setCredential:", v9);

      }
      v4 = v10;
    }
  }

}

- (void)_aa_clearRawPassword
{
  void *v1;
  id v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "setCredentialItem:forKey:", 0, *MEMORY[0x1E0C8F258]);
    v1 = v2;
  }

}

- (void)aa_isPrimaryAccount
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "Account Class is still not updated. Returning value from primaryAccount key.", v1, 2u);
}

- (void)aa_setAccountClass:()AppleAccount .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[ACAccount(AppleAccount) aa_setAccountClass:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_0_8(&dword_19EACA000, a3, (uint64_t)a3, "[%s] called on %@, setting to: %@", (uint8_t *)&v3);
}

- (void)aa_updateAccountClassIfNecessary
{
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  v5 = "-[ACAccount(AppleAccount) aa_updateAccountClassIfNecessary]";
  v4 = 136315650;
  v6 = 2112;
  v7 = a1;
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v8 = 2112;
  v9 = v3;
  OUTLINED_FUNCTION_0_8(&dword_19EACA000, a3, (uint64_t)a3, "[%s] called on %@, should be primary: %@", (uint8_t *)&v4);
}

- (void)aa_hsaTokenWithError:()AppleAccount .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19EACA000, log, OS_LOG_TYPE_FAULT, "Method unsupported, does nothing, stop calling this", v1, 2u);
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a1, a3, "Updating FMF app (%@) tokens: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a1, a3, "Updating FMF (%@) tokens: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Saving CloudKit child account failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_hasDuplicateAccount
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Failed to fetch existing AppleAccounts, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Found duplicate ACAccount - AppleAccount alias matches: %@, %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_8(&dword_19EACA000, a3, v5, "Found duplicate ACAccount - AppleAccount altDSID (%@) matches: %@, %@", v6);

  OUTLINED_FUNCTION_5_1();
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Found duplicate ACAccount - AppleAccount Username matches: %@, %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_8(&dword_19EACA000, a3, v5, "Found duplicate ACAccount - AppleAccount DSID (%@) matches: %@, %@", v6);

  OUTLINED_FUNCTION_5_1();
}

@end
