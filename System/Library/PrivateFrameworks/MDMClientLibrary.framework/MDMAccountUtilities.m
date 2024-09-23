@implementation MDMAccountUtilities

+ (id)rmAccountWithIdentifier:(id)a3 fromStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "dmc_remoteManagementAccountForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1D4BF7000, v11, OS_LOG_TYPE_ERROR, "No RMAccount with ID: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    if (a5)
    {
      objc_msgSend(a1, "_createMissingRMAccountError");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

+ (void)stashMAIDShortLivedTokenWithAccount:(id)a3 authenticationResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  DMCAKAuthenticationIDMSTokenKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.gs.mdm.auth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(NSObject **)(DMCLogObjects() + 8);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v12 = v10;
      objc_msgSend(v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = CFSTR("com.apple.gs.mdm.auth");
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_DEBUG, "Stashing %{public}@ token on RMAccount with ID: %{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.gs.mdm.auth"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("MAIDShortLivedTokenField"));

  }
  else if (v11)
  {
    v15 = v10;
    objc_msgSend(v5, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = CFSTR("com.apple.gs.mdm.auth");
    v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_DEBUG, "No %{public}@ token to stash on RMAccount with ID: %{public}@", (uint8_t *)&v17, 0x16u);

  }
}

+ (void)removeMAIDShortLivedTokenWithAccount:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = CFSTR("com.apple.gs.mdm.auth");
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_DEBUG, "Removing stashed %{public}@ token from RMAccount with ID: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("MAIDShortLivedTokenField"));

}

+ (id)authenticatorForRMAccountID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __objc2_class *v8;
  NSObject *v9;
  const char *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  objc_msgSend(a1, "rmAccountWithIdentifier:fromStore:error:", v4, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v7 = 0;
    switch(objc_msgSend(v5, "dmc_enrollmentMethod"))
    {
      case 0:
      case 3:
      case 4:
        break;
      case 1:
        v8 = MDMMAIDBearerTokenAuthenticator;
        goto LABEL_12;
      case 2:
        v8 = MDMBearerTokenAuthenticator;
        goto LABEL_12;
      case 5:
        v8 = MDMOAuth2Authenticator;
LABEL_12:
        v7 = (void *)objc_msgSend([v8 alloc], "initWithRMAccountID:", v4);
        break;
      default:
        v9 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        v10 = "Failed to match RM account enrollment method: %{public}@";
        goto LABEL_6;
    }
  }
  else
  {
    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      v10 = "Failed to find RM account: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1D4BF7000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
LABEL_7:
    v7 = 0;
  }

  return v7;
}

+ (id)bearerTokenForRMAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "rmAccountWithIdentifier:fromStore:error:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dmc_bearerToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1D4BF7000, v10, OS_LOG_TYPE_ERROR, "No bearer token in RMAccount with ID: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      if (a4)
      {
        objc_msgSend(a1, "_createMissingBearerTokenError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)maidPropertiesForRMAccountID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C8F2B8];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rmAccountWithIdentifier:fromStore:error:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D1C088]);

    objc_msgSend(v7, "dmc_altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D1C068]);

    objc_msgSend(v7, "dmc_DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1C070]);

    objc_msgSend(a1, "_shortLivedTokenFromRMAccount:inStore:", v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D1C080]);
    }
    else
    {
      v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        objc_msgSend(v7, "dmc_altDSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v15;
        _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_ERROR, "Unable to find short lived token for RM account: %{public}@", (uint8_t *)&v21, 0xCu);

      }
    }
    objc_msgSend(a1, "_longLivedTokenFromRMAccount:inStore:", v7, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D1C078]);
    }
    else
    {
      v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        objc_msgSend(v7, "dmc_altDSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v19;
        _os_log_impl(&dword_1D4BF7000, v18, OS_LOG_TYPE_ERROR, "Unable to find long lived token for RM account: %{public}@", (uint8_t *)&v21, 0xCu);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_shortLivedTokenFromRMAccount:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __CFString *v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MAIDShortLivedTokenField"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "dmc_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aida_accountForAltDSID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "aida_tokenForService:", CFSTR("com.apple.gs.mdm.auth"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
LABEL_12:
        v12 = v15;

        goto LABEL_13;
      }
      v16 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = v16;
        objc_msgSend(v5, "dmc_altDSID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = CFSTR("com.apple.gs.mdm.auth");
        v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_1D4BF7000, v17, OS_LOG_TYPE_DEBUG, "Unable to find %{public}@ token on idms account for RM account: %{public}@", (uint8_t *)&v23, 0x16u);

      }
    }
    else
    {
      v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = v19;
        objc_msgSend(v5, "dmc_altDSID");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v21;
        _os_log_impl(&dword_1D4BF7000, v20, OS_LOG_TYPE_DEBUG, "Unable to find idms account for RM account: %{public}@", (uint8_t *)&v23, 0xCu);

      }
    }
    v15 = 0;
    goto LABEL_12;
  }
  v8 = (void *)v7;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    objc_msgSend(v5, "dmc_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = CFSTR("com.apple.gs.mdm.auth");
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1D4BF7000, v10, OS_LOG_TYPE_DEBUG, "Using stashed %{public}@ token on RM account: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  v12 = v8;
LABEL_13:

  return v12;
}

+ (id)_longLivedTokenFromRMAccount:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dmc_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      objc_msgSend(v5, "dmc_altDSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D4BF7000, v10, OS_LOG_TYPE_ERROR, "Unable to find iCloud account for RM account: %{public}@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend(v8, "dmc_mdmServerToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)updateOrganizationName:(id)a3 rmAccountIdentifier:(id)a4 personaID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[4];
  id v79;
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v49 = a5;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke;
  v78[3] = &unk_1E9852420;
  v14 = v10;
  v79 = v14;
  v48 = (void *)MEMORY[0x1D826525C](v78);
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 1;
  objc_msgSend(v12, "dmc_remoteManagementAccountForIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "accountDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", v14);

    if (v18)
    {
      v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v81 = v11;
        _os_log_impl(&dword_1D4BF7000, v19, OS_LOG_TYPE_DEFAULT, "RM account organization name does not need to be changed: %{public}@", buf, 0xCu);
      }
      v20 = 1;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0D1C1F0];
      v62[0] = v13;
      v62[1] = 3221225472;
      v62[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_7;
      v62[3] = &unk_1E9852448;
      v66 = &v68;
      v25 = v12;
      v63 = v25;
      v64 = v11;
      v67 = &v72;
      v26 = v48;
      v65 = v26;
      v27 = (id)objc_msgSend(v24, "performBlockUnderPersona:block:", v49, v62);
      if (*((_BYTE *)v69 + 24))
      {
        v28 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D4BF7000, v28, OS_LOG_TYPE_DEFAULT, "RM Account Saved Successfully.", buf, 2u);
        }
        v29 = (void *)MEMORY[0x1E0D1C1F0];
        v56[0] = v13;
        v56[1] = 3221225472;
        v56[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_9;
        v56[3] = &unk_1E9852448;
        v60 = &v68;
        v30 = v25;
        v57 = v30;
        v31 = v16;
        v58 = v31;
        v61 = &v72;
        v32 = v26;
        v59 = v32;
        v33 = (id)objc_msgSend(v29, "performBlockUnderPersona:block:", v49, v56);
        if (*((_BYTE *)v69 + 24))
        {
          v34 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4BF7000, v34, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
          }
          v35 = (void *)MEMORY[0x1E0D1C1F0];
          v50[0] = v13;
          v50[1] = 3221225472;
          v50[2] = __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_10;
          v50[3] = &unk_1E9852448;
          v54 = &v68;
          v51 = v30;
          v52 = v31;
          v55 = &v72;
          v53 = v32;
          v36 = (id)objc_msgSend(v35, "performBlockUnderPersona:block:", v49, v50);
          v20 = *((_BYTE *)v69 + 24) != 0;
          if (*((_BYTE *)v69 + 24))
          {
            v37 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4BF7000, v37, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
            }
          }
          else
          {
            v44 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = (void *)v73[5];
              *(_DWORD *)buf = 138543362;
              v81 = v45;
              _os_log_impl(&dword_1D4BF7000, v44, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
            }
            if (a6)
            {
              v46 = (void *)v73[5];
              if (v46)
                *a6 = objc_retainAutorelease(v46);
            }
          }

        }
        else
        {
          v41 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = (void *)v73[5];
            *(_DWORD *)buf = 138543362;
            v81 = v42;
            _os_log_impl(&dword_1D4BF7000, v41, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
          }
          if (a6 && (v43 = (void *)v73[5]) != 0)
          {
            v20 = 0;
            *a6 = objc_retainAutorelease(v43);
          }
          else
          {
            v20 = 0;
          }
        }

      }
      else
      {
        v38 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)v73[5];
          *(_DWORD *)buf = 138543362;
          v81 = v39;
          _os_log_impl(&dword_1D4BF7000, v38, OS_LOG_TYPE_ERROR, "Error Updating RM Account: %{public}@", buf, 0xCu);
        }
        if (a6 && (v40 = (void *)v73[5]) != 0)
        {
          v20 = 0;
          *a6 = objc_retainAutorelease(v40);
        }
        else
        {
          v20 = 0;
        }
      }

    }
  }
  else
  {
    v21 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v81 = v11;
      _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_ERROR, "Unable to find RM account: %{public}@", buf, 0xCu);
    }
    if (a6)
    {
      objc_msgSend(a1, "_createMissingRMAccountError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        *a6 = objc_retainAutorelease(v22);

    }
    v20 = 0;
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v20;
}

uint64_t __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccountDescription:", *(_QWORD *)(a1 + 32));
}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v3, &obj, v4);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id obj;

  v2 = *MEMORY[0x1E0C8F030];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dmc_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, *(_QWORD *)(a1 + 48));
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;

}

void __82__MDMAccountUtilities_updateOrganizationName_rmAccountIdentifier_personaID_error___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id obj;

  v2 = *MEMORY[0x1E0C8F170];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dmc_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, *(_QWORD *)(a1 + 48));
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;

}

+ (id)_createMissingRMAccountError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15005, v4, 0, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createMissingBearerTokenError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15006, v4, 0, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
