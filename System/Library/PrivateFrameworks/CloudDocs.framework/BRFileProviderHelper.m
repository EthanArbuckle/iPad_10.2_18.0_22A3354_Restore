@implementation BRFileProviderHelper

+ (id)br_getProviderIDForCurrentPersona
{
  return (id)objc_msgSend(a1, "br_getProviderIDForDataSeparated:", BRCurrentPersonaIsDataSeparated());
}

+ (id)br_getProviderIDForDataSeparated:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = BRIsFPFSEnabled(a1, a2);
  v5 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");
  if (v4)
    v5 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  v6 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  if (v4)
    v6 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  if (v3)
    return (id)v5;
  else
    return (id)v6;
}

+ (id)br_getProviderDomainIDForCurrentPersona
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "br_getDomainIdentifierForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "br_getProviderDomainIDForDomainIdentifier:dataSeparated:", v3, BRCurrentPersonaIsDataSeparated());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)br_getProviderDomainIDForDataSeparated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "br_getDomainIdentifierForDataSeparated:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "br_getProviderDomainIDForDomainIdentifier:dataSeparated:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)br_getProviderDomainIDForDomainIdentifier:(id)a3 dataSeparated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "br_getProviderIDForDataSeparated:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)br_getDomainIdentifierForDataSeparated:(BOOL)a3
{
  int v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[BRAccountDescriptor allEligibleAccountDescriptors](BRAccountDescriptor, "allEligibleAccountDescriptors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDataSeparated") == v3)
        {
          brc_bread_crumbs((uint64_t)"+[BRFileProviderHelper br_getDomainIdentifierForDataSeparated:]", 70);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            +[BRFileProviderHelper br_getDomainIdentifierForDataSeparated:].cold.1((uint64_t)v10, (uint64_t)v12, v13);

          objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)br_getDomainIdentifierForCurrentPersona
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRAccountDescriptor accountDescriptorForPersonaID:mustBeLoggedIn:](BRAccountDescriptor, "accountDescriptorForPersonaID:mustBeLoggedIn:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)br_getDomainIdentifierForACAccountID:(id)a3
{
  void *v4;
  void *v5;

  +[BRAccountDescriptor accountDescriptorForAccountID:mustBeLoggedIn:](BRAccountDescriptor, "accountDescriptorForAccountID:mustBeLoggedIn:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_br_getDomainIdentifierForAccountDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_br_getDomainIdentifierForAccountDescriptor:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v5 = v3;
  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"+[BRFileProviderHelper _br_getDomainIdentifierForAccountDescriptor:]", 94);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] Couldn't resolve an account descriptor, returning nil domain identifier%@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_8;
  }
  if ((BRIsFPFSEnabled(v3, v4) & 1) == 0 && !objc_msgSend(v5, "isDataSeparated"))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

+ (void)br_getDomainIdentifierForDataSeparated:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning a domain for account: %@%@", (uint8_t *)&v3, 0x16u);
}

@end
