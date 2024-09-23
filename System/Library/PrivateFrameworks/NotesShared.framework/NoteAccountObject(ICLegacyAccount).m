@implementation NoteAccountObject(ICLegacyAccount)

- (id)localizedName
{
  if (objc_msgSend(a1, "accountType"))
    objc_msgSend(a1, "name");
  else
    +[ICAccount localizedLocalAccountName](ICAccount, "localizedLocalAccountName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)enabled
{
  return 1;
}

- (uint64_t)legacyAccountType
{
  uint64_t result;

  result = objc_msgSend(a1, "accountType");
  if (result != 2)
    return result == 1;
  return result;
}

- (id)emailAddress
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NoteAccountObject(ICLegacyAccount) emailAddress].cold.1((uint64_t)a1, v5);

  }
  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsAttachments
{
  return objc_msgSend(a1, "accountType") != 2;
}

- (BOOL)isIMAPAccount
{
  return objc_msgSend(a1, "accountType") == 1;
}

- (BOOL)isExchangeAccount
{
  return objc_msgSend(a1, "accountType") == 2;
}

- (BOOL)isLocalAccount
{
  return objc_msgSend(a1, "accountType") == 0;
}

- (uint64_t)isManaged
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isManagedACAccountWithIdentifier:", v5);

  return v6;
}

- (id)localizedAttachmentsNotSupportedReason
{
  void *v1;

  if (objc_msgSend(a1, "accountType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Exchange accounts don’t support attachments."), CFSTR("Exchange accounts don’t support attachments."), 0, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (uint64_t)hasAnyCustomFolders
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "folders", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "isCustomFolder") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)compare:()ICLegacyAccount
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v4 = a3;
  ICProtocolCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v7);

  }
  else
  {
    ICProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = -1;
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NoteAccountObject(ICLegacyAccount) compare:].cold.1((uint64_t)a1, (uint64_t)v4, v9);

      v8 = 0;
    }
  }

  return v8;
}

- (void)emailAddress
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "No apple account found for note account %@", (uint8_t *)&v2, 0xCu);
}

- (void)compare:()ICLegacyAccount .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v10, 0x20u);

}

@end
