@implementation ACAccount

void __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[GKInternalRepresentation internalRepresentation](GKPlayerCredential, "internalRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "integerValue");
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    v10 = v8 == v9;
  else
    v10 = 1;
  if (!v10)
  {
    v19 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v20 = GKOSLoggers();
      v19 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke_cold_1(a1, (uint64_t)v5, v19);
    goto LABEL_31;
  }
  v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_gkPlayerInternal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[GKInternalRepresentation internalRepresentation](GKLocalPlayerInternal, "internalRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlayerID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccountName:", v13);

  }
  objc_msgSend(v7, "setPlayerInternal:", v12);
  objc_msgSend(*(id *)(a1 + 32), "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountName:", v14);

  objc_msgSend(v7, "setEnvironment:", v11);
  v27 = v6;
  objc_msgSend(v7, "setAuthenticationToken:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_gkPropertyForKey:environment:", CFSTR("altDSID"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v7, "setAltDSID:", v15);
  objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:", CFSTR("dsid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v7, "setDSID:", v16);
  objc_msgSend(*(id *)(a1 + 32), "_gkPropertyForKey:environment:", CFSTR("GKCredentialScope"), v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "intValue"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = 0;
      goto LABEL_22;
    }
    v18 = v17;
  }
  v21 = v18;
LABEL_22:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v21, "unsignedIntegerValue");
    objc_msgSend(v7, "setScope:", v22);
    v23 = v22 & 4;
    if ((v22 & 2) != 0)
      v23 = v22 & 4 | 3;
    objc_msgSend(v12, "setLoginStatus:", v23 | v22 & 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "_gkModifiedDateForProperty:environment:", CFSTR("GKCredentialScope"), v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopeModificationDate:", v24);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  v25 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v26 = GKOSLoggers();
    v25 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v7;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v27;
    _os_log_debug_impl(&dword_1BCDE3000, v25, OS_LOG_TYPE_DEBUG, "ACCOUNT:%@: auth token for environment:%@ authToken:%@", buf, 0x20u);
  }

  v6 = v27;
LABEL_31:

}

void __53__ACAccount_GameCenter___gkCredentialForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  v7 = a2;
  v4 = objc_msgSend(v7, "environment");
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 == v5 || v5 == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, a3, (uint64_t)a3, "ACCOUNT:%@: filtering environment:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
