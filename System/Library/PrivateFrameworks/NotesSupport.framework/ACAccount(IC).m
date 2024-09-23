@implementation ACAccount(IC)

- (uint64_t)ic_hasICloudEmailAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(a1, "displayAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "accountType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (v6)
    {
      v7 = objc_msgSend(v2, "aa_needsEmailConfiguration");
      v8 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[ACAccount(IC) ic_hasICloudEmailAddress].cold.2(v7, (uint64_t)v2, v8);

      v9 = v7 ^ 1u;
    }
    else
    {
      v17 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ACAccount(IC) ic_hasICloudEmailAddress].cold.3((uint64_t)v2, v17, v18, v19, v20, v21, v22, v23);

      v9 = 0;
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACAccount(IC) ic_hasICloudEmailAddress].cold.1((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);

    v9 = 1;
  }

  return v9;
}

- (BOOL)ic_hasPersonaIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = objc_opt_class();
  objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EFC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast(v2, (uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length") != 0;
  return v5;
}

- (uint64_t)ic_isManagedAppleID
{
  uint64_t result;

  result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if ((_DWORD)result)
    return objc_msgSend(a1, "aa_isManagedAppleID");
  return result;
}

- (uint64_t)ic_supportsModernNotes
{
  uint64_t result;

  result = objc_msgSend(a1, "isProvisionedForDataclass:", *MEMORY[0x1E0C8EED8]);
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1, "ic_isICloudNotesAccount");
    if ((_DWORD)result)
      return objc_msgSend(a1, "ic_isBasicAccountClass") ^ 1;
  }
  return result;
}

- (uint64_t)ic_supportsHTMLNotes
{
  uint64_t result;

  result = objc_msgSend(a1, "isProvisionedForDataclass:", *MEMORY[0x1E0C8EED8]);
  if ((_DWORD)result)
  {
    if (objc_msgSend(a1, "ic_isICloudNotesAccount"))
      return objc_msgSend(a1, "ic_hasICloudEmailAddress");
    else
      return 1;
  }
  return result;
}

- (uint64_t)ic_isNotesMigrated
{
  uint64_t result;

  result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if ((_DWORD)result)
    return objc_msgSend(a1, "aa_isNotesMigrated");
  return result;
}

- (uint64_t)ic_isPrimaryAppleAccount
{
  uint64_t result;

  result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if ((_DWORD)result)
    return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
  return result;
}

- (uint64_t)ic_isNotesEnabled
{
  return objc_msgSend(a1, "isEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
}

- (uint64_t)ic_isICloudNotesAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  return v3;
}

- (uint64_t)ic_shouldCreateSeparatePersistentStore
{
  if ((objc_msgSend(a1, "ic_isPrimaryAppleAccount") & 1) != 0
    || !objc_msgSend(a1, "ic_isICloudNotesAccount"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "ic_isFullAccountClass");
  }
}

- (uint64_t)ic_isFullAccountClass
{
  return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE0]);
}

- (uint64_t)ic_isBasicAccountClass
{
  return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAD8]);
}

- (void)ic_hasICloudEmailAddress
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "Returning NO for ic_hasICloudEmailAddress, because this is not an iCloud account: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
