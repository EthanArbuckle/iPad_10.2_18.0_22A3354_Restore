@implementation NSFileProviderManager(BRAdditions)

+ (id)br_getDomainForCurrentPersonaWithError:()BRAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  +[BRFileProviderHelper br_getProviderIDForCurrentPersona](BRFileProviderHelper, "br_getProviderIDForCurrentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona](BRFileProviderHelper, "br_getDomainIdentifierForCurrentPersona");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAAD20], "br_getDomainForProvider:withIdentifier:error:", v4, v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForCurrentPersonaWithError:]", 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[NSFileProviderManager(BRAdditions) br_getDomainForCurrentPersonaWithError:].cold.1((uint64_t)v7, v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRInternalErrorDomain"), 15, CFSTR("unreachable: Could not compute providerID"));
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)br_getDomainForDataSeparated:()BRAdditions withIdentifier:withError:
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  if (v7)
  {
    +[BRFileProviderHelper br_getProviderIDForDataSeparated:](BRFileProviderHelper, "br_getProviderIDForDataSeparated:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CAAD20], "br_getDomainForProvider:withIdentifier:error:", v8, v7, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)br_getDomainForProvider:()BRAdditions withIdentifier:error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v20;
  const char *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD20]), "_initWithProviderIdentifier:", v7);
    v22 = 0;
    objc_msgSend(v10, "br_getFPDomainWithIdentifier:withError:", v9, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]", 59);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]";
        v25 = 2080;
        if (!a5)
          v20 = "(ignored by caller)";
        v26 = v20;
        v27 = 2112;
        v28 = v14;
        v29 = 2112;
        v30 = v15;
        _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("domainID or providerID"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]", 52);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]";
        v25 = 2080;
        if (!a5)
          v21 = "(ignored by caller)";
        v26 = v21;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = v17;
        _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v11 = 0;
      *a5 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)br_sharedProviderManager
{
  void *v0;
  void *v1;

  +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona](BRFileProviderHelper, "br_getDomainIdentifierForCurrentPersona");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAAD20], "br_sharedProviderManagerWithDomainID:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)br_sharedProviderManagerWithDomainID:()BRAdditions
{
  id v4;
  uint64_t IsDataSeparated;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (br_sharedProviderManagerWithDomainID__onceToken != -1)
    dispatch_once(&br_sharedProviderManagerWithDomainID__onceToken, &__block_literal_global);
  IsDataSeparated = BRCurrentPersonaIsDataSeparated();
  if ((BRIsFPFSEnabled(IsDataSeparated, v6) & 1) != 0 || (IsDataSeparated & 1) != 0)
  {
    if (!v4)
    {
      +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona](BRFileProviderHelper, "br_getDomainIdentifierForCurrentPersona");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 92);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:].cold.2();

    v10 = (id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers;
    objc_sync_enter(v10);
    objc_msgSend((id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 108);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

    }
    else
    {
      v26 = 0;
      objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", IsDataSeparated, v4, &v26);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 100);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v7;
        v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_19CBF0000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] Trying to cache file provider manager %@%@", buf, 0x16u);
      }

      if (v26)
      {
        brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 102);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v4;
          v29 = 2112;
          v30 = v21;
          _os_log_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEFAULT, "[NOTICE] Was able to match domain %@, caching shared file provider manager%@", buf, 0x16u);
        }

        objc_msgSend((id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers, "setValue:forKey:", v7, v4);
      }
      else
      {
        brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 105);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v4;
          v29 = 2112;
          v30 = v23;
          _os_log_impl(&dword_19CBF0000, v24, OS_LOG_TYPE_DEFAULT, "[NOTICE] Domain %@ was not found. Not caching file provider manager%@", buf, 0x16u);
        }

      }
    }
    objc_sync_exit(v10);

  }
  else
  {
    v7 = (id)br_sharedProviderManagerWithDomainID__defaultSharedProvider;
  }

  return v7;
}

+ (id)br_getProviderManagerForDataSeparated:()BRAdditions
{
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "br_getEnterpriseProviderManager");
  else
    objc_msgSend(a1, "br_getPrimaryProviderManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)br_getEnterpriseProviderManager
{
  return objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", 1, 0, 0);
}

+ (uint64_t)br_getPrimaryProviderManager
{
  return objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", 0, 0, 0);
}

+ (id)br_getLegacyEnterpriseProviderManager
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD20]), "_initWithProviderIdentifier:domain:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"), 0);
}

+ (id)_br_createNSFileProviderManagerForDataSeparated:()BRAdditions withDomainID:didMatchedDomain:
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;

  v16 = 0;
  objc_msgSend(a1, "br_getDomainForDataSeparated:withIdentifier:withError:", a3, a4, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  v10 = v8;
  if (v8)
  {
    brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) _br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:]", 140);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      +[NSFileProviderManager(BRAdditions) _br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:].cold.1();

  }
  if (a5)
    *a5 = v7 != 0;
  if (BRIsFPFSEnabled(v8, v9))
    objc_msgSend(v7, "setReplicated:", 1);
  +[BRFileProviderHelper br_getProviderIDForDataSeparated:](BRFileProviderHelper, "br_getProviderIDForDataSeparated:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD20]), "_initWithProviderIdentifier:domain:", v13, v7);

  return v14;
}

- (id)br_getFPDomainWithIdentifier:()BRAdditions withError:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  objc_msgSend(a1, "br_getFPDomainsWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__NSFileProviderManager_BRAdditions__br_getFPDomainWithIdentifier_withError___block_invoke;
  v11[3] = &unk_1E3DA4698;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "br_firstItemOf:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)br_getFPDomainForAccount:()BRAdditions withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  objc_msgSend(v6, "br_dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRAccountDescriptor accountDescriptorForAccountID:mustBeLoggedIn:](BRAccountDescriptor, "accountDescriptorForAccountID:mustBeLoggedIn:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v13 = v12;

  objc_msgSend(a1, "br_getFPDomainsWithError:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__NSFileProviderManager_BRAdditions__br_getFPDomainForAccount_withError___block_invoke;
  v19[3] = &unk_1E3DA46C0;
  v20 = v7;
  v21 = v13;
  v15 = v13;
  v16 = v7;
  objc_msgSend(v14, "br_firstItemOf:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)br_getFPDomainsWithError:()BRAdditions
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v13;
  char *v14;
  const char *v15;
  _QWORD v16[6];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v17 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke;
  v16[3] = &unk_1E3DA4710;
  v16[4] = a1;
  v16[5] = &v18;
  +[BRXPCClientUtils executeXPCWithMaxRetries:error:block:](BRXPCClientUtils, "executeXPCWithMaxRetries:error:block:", 2, &v17, v16);
  v5 = v17;
  brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]", 205);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = (const char *)v19[5];
    objc_msgSend(a1, "providerIdentifier");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Found the following domains: %@ from provider: %@%@", buf, 0x20u);

  }
  v8 = v5;
  if (v8)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]", 207);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v15 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]";
      v26 = 2080;
      if (!a3)
        v15 = "(ignored by caller)";
      v27 = v15;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v9;
      _os_log_error_impl(&dword_19CBF0000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

+ (void)br_getDomainForCurrentPersonaWithError:()BRAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Could not compute providerID%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)br_sharedProviderManagerWithDomainID:()BRAdditions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_19CBF0000, a2, a3, "[DEBUG] Returned cached shared provider manager%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)br_sharedProviderManagerWithDomainID:()BRAdditions .cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Getting shared provider manager for domain ID: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)_br_createNSFileProviderManagerForDataSeparated:()BRAdditions withDomainID:didMatchedDomain:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] Got an error when tried to retrieve domain: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
