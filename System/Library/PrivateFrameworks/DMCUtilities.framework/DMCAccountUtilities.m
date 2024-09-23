@implementation DMCAccountUtilities

+ (id)appStoreAccountIdentifierForPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[DMCAccountUtilities _appleAccountWithPersonaID:](DMCAccountUtilities, "_appleAccountWithPersonaID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "ams_DSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = v3;
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona FOUND persona:%{public}@ -> accountIdentifier:%{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v3;
        _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona NOT FOUND persona:%{public}@", (uint8_t *)&v10, 0xCu);
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)managedAppleIDNameWithPersonaID:(id)a3
{
  void *v3;
  void *v4;

  +[DMCAccountUtilities _appleAccountWithPersonaID:](DMCAccountUtilities, "_appleAccountWithPersonaID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)accountIdentifierForAppleAccountWithPersonaID:(id)a3
{
  void *v3;
  void *v4;

  +[DMCAccountUtilities _appleAccountWithPersonaID:](DMCAccountUtilities, "_appleAccountWithPersonaID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_appleAccountWithPersonaID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsWithAccountType:", v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v16 = v5;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x1E0C8EFC8];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "isEqualToString:", v3) & 1) != 0)
        {
          v14 = v12;

          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
    v14 = 0;
LABEL_12:
    v5 = v16;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)signInAccountsWithTypes:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 canMakeAccountActive:(BOOL)a6 baseViewController:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  DMCAccountUtilities *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  -[DMCAccountUtilities signInQueue](self, "signInQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __136__DMCAccountUtilities_signInAccountsWithTypes_authenticationResult_personaID_canMakeAccountActive_baseViewController_completionHandler___block_invoke;
  v25[3] = &unk_1E4D36D48;
  v26 = v14;
  v27 = self;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = v18;
  v32 = a6;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v18;
  v24 = v14;
  objc_msgSend(v19, "queueBlock:", v25);

}

void __136__DMCAccountUtilities_signInAccountsWithTypes_authenticationResult_personaID_canMakeAccountActive_baseViewController_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v3)
    {
      v5 = v3;
      v6 = 0;
      v7 = *(_QWORD *)v32;
      v8 = *MEMORY[0x1E0C8F030];
      v9 = *MEMORY[0x1E0C8F170];
      v28 = *MEMORY[0x1E0C8F1D0];
      *(_QWORD *)&v4 = 138412290;
      v27 = v4;
      while (1)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v2);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v8, v27))
          {
            v12 = *(void **)(a1 + 40);
            v13 = *(_QWORD *)(a1 + 48);
            v14 = *(_QWORD *)(a1 + 56);
            v15 = *(_QWORD *)(a1 + 64);
            v30 = 0;
            v6 = objc_msgSend(v12, "_signIniCloudAccountWithAuthenticationResult:personaID:baseViewController:outError:", v13, v14, v15, &v30);
            v16 = v30;
LABEL_11:
            v22 = v16;
            goto LABEL_15;
          }
          if (objc_msgSend(v11, "isEqualToString:", v9))
          {
            v17 = *(void **)(a1 + 40);
            v18 = *(_QWORD *)(a1 + 48);
            v19 = *(unsigned __int8 *)(a1 + 80);
            v20 = *(_QWORD *)(a1 + 56);
            v21 = *(_QWORD *)(a1 + 64);
            v29 = 0;
            v6 = objc_msgSend(v17, "_signIniTunesAccountWithAuthenticationResult:personaID:canMakeAccountActive:baseViewController:outError:", v18, v20, v19, v21, &v29);
            v16 = v29;
            goto LABEL_11;
          }
          v23 = *DMCLogObjects();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v27;
            v36 = v11;
            _os_log_impl(&dword_1A4951000, v23, OS_LOG_TYPE_ERROR, "DMCAccountUtilities: Unsupported account type: %@", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v28, 4, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v24 = v22;
          if (v22 || (v6 & 1) == 0)
            goto LABEL_23;
          v6 = 1;
        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (!v5)
        {
          v24 = 0;
          goto LABEL_23;
        }
      }
    }
    v24 = 0;
    v6 = 0;
LABEL_23:

    v26 = *(_QWORD *)(a1 + 72);
    if (v26)
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, v6 & 1, v24);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 72);
    if (v25)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v25 + 16))(v25, 1, 0);
  }
}

- (BOOL)_signIniCloudAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 baseViewController:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  char v19;
  uint8_t v21[8];
  _QWORD v22[4];
  id v23;
  id v24;
  DMCAccountUtilities *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke;
  v22[3] = &unk_1E4D36D70;
  v13 = v10;
  v23 = v13;
  v14 = v12;
  v24 = v14;
  v25 = self;
  v26 = &v28;
  v27 = &v32;
  v15 = MEMORY[0x1A85A3C10](v22);
  v16 = (void *)v15;
  if (v11)
  {
    v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_DEBUG, "DMCAccountUtilities: Has enterprise persona, will sign in iCloud under enterprise persona", v21, 2u);
    }
    v18 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v11, v16);
  }
  else
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v33[5]);
  v19 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  dispatch_semaphore_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    +[DMCPersonaHelper currentPersonaID](DMCPersonaHelper, "currentPersonaID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCPersonaHelper currentPersonaTypeString](DMCPersonaHelper, "currentPersonaTypeString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[DMCAccountUtilities _signIniCloudAccountWithAuthenticationResult:personaID:baseViewController"
                         ":outError:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 132;
    *(_WORD *)&buf[18] = 2114;
    *(_QWORD *)&buf[20] = v2;
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v3;
    _os_log_impl(&dword_1A4951000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);

  }
  v4 = objc_alloc_init((Class)DMCAIDAMutableServiceContextClass());
  objc_msgSend(v4, "setAuthenticationResults:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setViewController:", *(_QWORD *)(a1 + 40));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getCDPUIControllerClass_softClass;
  v21 = getCDPUIControllerClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getCDPUIControllerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCDPUIControllerClass_block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E4D36B88;
    *(_QWORD *)&buf[32] = &v18;
    __getCDPUIControllerClass_block_invoke((uint64_t)buf);
    v5 = (void *)v19[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithPresentingViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v8, "setForceInlinePresentation:", 1);
  objc_msgSend(v4, "setCdpUiProvider:", v8);
  objc_msgSend(*(id *)(a1 + 48), "setCdpUIController:", v8);
  v9 = objc_alloc((Class)DMCAIDAServiceOwnersManagerClass());
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAccountStore:", v10);

  v12 = dispatch_semaphore_create(0);
  DMCAIDAServiceTypeCloud();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke_16;
  v15[3] = &unk_1E4D36C58;
  v17 = *(_OWORD *)(a1 + 56);
  v16 = v12;
  v14 = v12;
  objc_msgSend(v11, "signInService:withContext:completion:", v13, v4, v15);

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
}

void __106__DMCAccountUtilities__signIniCloudAccountWithAuthenticationResult_personaID_baseViewController_outError___block_invoke_16(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Signing in iCloud account finished with result: %d, error: %{public}@", (uint8_t *)v10, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_signIniTunesAccountWithAuthenticationResult:(id)a3 personaID:(id)a4 canMakeAccountActive:(BOOL)a5 baseViewController:(id)a6 outError:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v29;
  id v30;
  uint8_t buf[16];
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v11 = a3;
  v12 = a4;
  v30 = a6;
  DMCAKAuthenticationUsernameKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  DMCAKAuthenticationPasswordKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  DMCAKAuthenticationAlternateDSIDKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_activeiTunesAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19
    && (objc_msgSend(v19, "dmc_altDSID", v29, v30),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "isEqualToString:", v17),
        v21,
        v22))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 5, 0);
      v23 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__1;
    v48 = __Block_byref_object_dispose__1;
    v49 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke;
    v32[3] = &unk_1E4D36DC0;
    v39 = a5;
    v33 = v30;
    v34 = v29;
    v35 = v17;
    v36 = v15;
    v37 = &v40;
    v38 = &v44;
    v24 = MEMORY[0x1A85A3C10](v32);
    v25 = (void *)v24;
    if (v12)
    {
      v26 = *DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v26, OS_LOG_TYPE_DEBUG, "DMCAccountUtilities: Has enterprise persona, will sign in iTunes under enterprise persona", buf, 2u);
      }
      v27 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v12, v25, v29);
    }
    else
    {
      (*(void (**)(uint64_t))(v24 + 16))(v24);
    }
    if (a7)
      *a7 = objc_retainAutorelease((id)v45[5]);
    v23 = *((_BYTE *)v41 + 24) != 0;

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

  }
  return v23;
}

void __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  __int128 v16;
  uint8_t buf[4];
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    +[DMCPersonaHelper currentPersonaID](DMCPersonaHelper, "currentPersonaID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCPersonaHelper currentPersonaTypeString](DMCPersonaHelper, "currentPersonaTypeString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v18 = "-[DMCAccountUtilities _signIniTunesAccountWithAuthenticationResult:personaID:canMakeAccountActive:b"
                     "aseViewController:outError:]_block_invoke";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 188;
    v19 = 2114;
    v20 = v2;
    v21 = 2114;
    v22 = v3;
    _os_log_impl(&dword_1A4951000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);

  }
  v4 = objc_alloc_init((Class)DMCAMSAuthenticateOptionsClass());
  objc_msgSend(v4, "setAuthenticationType:", 0);
  objc_msgSend(v4, "setCanMakeAccountActive:", *(unsigned __int8 *)(a1 + 80));
  v5 = (void *)objc_msgSend(objc_alloc((Class)DMCAMSUIAuthenticateTaskClass()), "initWithAccount:presentingViewController:options:", 0, *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(v5, "setUsername:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setAltDSID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setPassword:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "performAuthentication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    +[DMCPersonaHelper currentPersonaID](DMCPersonaHelper, "currentPersonaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCPersonaHelper currentPersonaTypeString](DMCPersonaHelper, "currentPersonaTypeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v18 = "-[DMCAccountUtilities _signIniTunesAccountWithAuthenticationResult:personaID:canMakeAccountActive:b"
                     "aseViewController:outError:]_block_invoke";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = 198;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1A4951000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);

  }
  v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke_18;
  v14[3] = &unk_1E4D36D98;
  v16 = *(_OWORD *)(a1 + 64);
  v10 = v9;
  v15 = v10;
  objc_msgSend(v6, "resultWithCompletion:", v14);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v18 = v12;
    *(_WORD *)&v18[4] = 2114;
    *(_QWORD *)&v18[6] = v13;
    _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Signing in iTunes account finished with result: %d, error: %{public}@", buf, 0x12u);
  }

}

void __127__DMCAccountUtilities__signIniTunesAccountWithAuthenticationResult_personaID_canMakeAccountActive_baseViewController_outError___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;
  v9 = a2;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)signOutAllPrimaryAccounts
{
  void *v3;
  id v4;

  -[DMCAccountUtilities signInQueue](self, "signInQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queueBlock:", &__block_literal_global_0);

  -[DMCAccountUtilities signInQueue](self, "signInQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilAllBlocksAreFinished");

}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int, void *);
  void *v19;
  id v20;
  id v21;
  dispatch_semaphore_t v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc((Class)DMCAIDAServiceOwnersManagerClass());
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithAccountStore:", v2);

  v4 = objc_alloc_init((Class)DMCAIDAMutableServiceContextClass());
  objc_msgSend(v0, "dmc_primaryiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  DMCAIDAServiceTypeMessages();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  DMCAIDAServiceTypeFaceTime();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  DMCAIDAServiceTypeStore();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  DMCAIDAServiceTypeGameCenter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_2;
  v19 = &unk_1E4D36E30;
  v20 = v3;
  v21 = v4;
  v22 = v6;
  v12 = v6;
  v13 = v4;
  v14 = v3;
  objc_msgSend(v14, "signOutOfServices:usingContext:completion:", v11, v13, &v16);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v5, "dmc_altDSID", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dmc_removeAccountsWithAltDSID:asynchronous:", v15, 0);

}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v15 = a2;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: signOutOfServices (except Cloud) finished with success: %d, result: %{public}@", buf, 0x12u);
  }
  v7 = *(void **)(a1 + 32);
  DMCAIDAServiceTypeCloud();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_21;
  v11[3] = &unk_1E4D36E08;
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v7, "signOutOfServices:usingContext:completion:", v9, v10, v11);

}

void __48__DMCAccountUtilities_signOutAllPrimaryAccounts__block_invoke_21(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: signOutOfCloud finished with success: %d, result: %{public}@", (uint8_t *)v7, 0x12u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (DMCHangDetectionQueue)signInQueue
{
  DMCHangDetectionQueue *signInQueue;
  DMCHangDetectionQueue *v4;
  double v5;
  double v6;
  objc_class *v7;
  void *v8;
  DMCHangDetectionQueue *v9;
  DMCHangDetectionQueue *v10;

  signInQueue = self->_signInQueue;
  if (!signInQueue)
  {
    v4 = [DMCHangDetectionQueue alloc];
    +[DMCFeatureOverrides accountSignInTimeoutThresholdWithDefaultValue:](DMCFeatureOverrides, "accountSignInTimeoutThresholdWithDefaultValue:", 20.0);
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DMCHangDetectionQueue initWithQoS:hangThreshold:owner:](v4, "initWithQoS:hangThreshold:owner:", 25, v8, v6);
    v10 = self->_signInQueue;
    self->_signInQueue = v9;

    signInQueue = self->_signInQueue;
  }
  return signInQueue;
}

- (void)setSignInQueue:(id)a3
{
  objc_storeStrong((id *)&self->_signInQueue, a3);
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
  objc_storeStrong((id *)&self->_cdpUIController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpUIController, 0);
  objc_storeStrong((id *)&self->_signInQueue, 0);
}

@end
