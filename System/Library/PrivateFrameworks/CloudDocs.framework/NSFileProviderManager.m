@implementation NSFileProviderManager

void __75__NSFileProviderManager_BRAdditions__br_sharedProviderManagerWithDomainID___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers;
  br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers = v0;

  if ((BRIsFPFSEnabled(v2, v3) & 1) == 0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD20]), "_initWithProviderIdentifier:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    v5 = (void *)br_sharedProviderManagerWithDomainID__defaultSharedProvider;
    br_sharedProviderManagerWithDomainID__defaultSharedProvider = v4;

  }
}

uint64_t __77__NSFileProviderManager_BRAdditions__br_getFPDomainWithIdentifier_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __73__NSFileProviderManager_BRAdditions__br_getFPDomainForAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsString:", *(_QWORD *)(a1 + 40));

  }
  return v6;
}

BOOL __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  const char *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC10], "synchronousSharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "providerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2;
  v12[3] = &unk_1E3DA46E8;
  v12[4] = *(_QWORD *)(a1 + 40);
  v12[5] = &v13;
  objc_msgSend(v4, "getDomainsForProviderIdentifier:completionHandler:", v5, v12);

  v6 = (id)v14[5];
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke", 201);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v11 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v20 = "-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke";
      v21 = 2080;
      if (!a2)
        v11 = "(ignored by caller)";
      v22 = v11;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a2)
    *a2 = objc_retainAutorelease(v6);

  v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
  {
    v21 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v22 = a3;
LABEL_10:
    objc_storeStrong(v21, v22);
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "fp_isFileProviderError:", -2001))
  {
    brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke", 194);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_2();

    v21 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v22 = a4;
    goto LABEL_10;
  }
  brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke_2", 191);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = MEMORY[0x1E0C9AA60];

LABEL_11:
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_19CBF0000, a2, a3, "[DEBUG] existing domains failed with provider not found%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] couldn't get existing domains: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
