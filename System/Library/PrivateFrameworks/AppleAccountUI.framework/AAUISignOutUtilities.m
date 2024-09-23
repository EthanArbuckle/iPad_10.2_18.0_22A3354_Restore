@implementation AAUISignOutUtilities

- (void)signOutServiceAccountsWithServiceOwnersManager:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 context:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *group;
  id v42;
  id v43;
  id obj;
  _QWORD block[4];
  id v46;
  id v47;
  _QWORD v48[5];
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  NSObject *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v43 = a5;
  v42 = a6;
  v40 = a7;
  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v12;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Signing out service accounts with altDSID: %@", buf, 0xCu);
  }

  group = dispatch_group_create();
  objc_msgSend((id)objc_opt_class(), "supportedServices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CFCF18], *MEMORY[0x1E0CFCF38], 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:");
  _AAUILogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AAUISignOutUtilities signOutServiceAccountsWithServiceOwnersManager:forAltDSID:DSID:context:completion:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = v15;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  v25 = v43;
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v51;
    obj = v23;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v11, "accountForService:", v29);
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v11, "altDSIDForAccount:service:", v30, v29);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v12 && -[NSObject isEqualToString:](v31, "isEqualToString:", v12))
          {
            _AAUILogSystem();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v29;
              _os_log_impl(&dword_1DB4ED000, v33, OS_LOG_TYPE_DEFAULT, "Service account for %@ has matching altDSID...", buf, 0xCu);
            }
LABEL_22:

            _AAUILogSystem();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v55 = v29;
              v56 = 2112;
              v57 = v30;
              _os_log_impl(&dword_1DB4ED000, v37, OS_LOG_TYPE_DEFAULT, "Signing out service %@ with account %@...", buf, 0x16u);
            }

            dispatch_group_enter(group);
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke;
            v48[3] = &unk_1EA2DC798;
            v48[4] = v29;
            v49 = group;
            objc_msgSend(v11, "signOutService:withContext:completion:", v29, v42, v48);

            goto LABEL_30;
          }
          _AAUILogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v29;
            v56 = 2112;
            v57 = v32;
            _os_log_impl(&dword_1DB4ED000, v34, OS_LOG_TYPE_DEFAULT, "Service account for %@ has altDSID (%@) that does not match, checking DSID...", buf, 0x16u);
          }

          objc_msgSend(v11, "DSIDForAccount:service:", v30, v29);
          v35 = objc_claimAutoreleasedReturnValue();
          v33 = v35;
          if (v25 && -[NSObject isEqualToString:](v35, "isEqualToString:", v25))
          {
            _AAUILogSystem();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v29;
              _os_log_impl(&dword_1DB4ED000, v36, OS_LOG_TYPE_DEFAULT, "Service account for %@ has matching DSID...", buf, 0xCu);
            }

            v25 = v43;
            goto LABEL_22;
          }
          _AAUILogSystem();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v29;
            v56 = 2112;
            v57 = v33;
            _os_log_impl(&dword_1DB4ED000, v38, OS_LOG_TYPE_DEFAULT, "Service account for %@ has DSID (%@) that does not match, bailing!", buf, 0x16u);
          }

          v25 = v43;
        }
        else
        {
          _AAUILogSystem();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v29;
            _os_log_impl(&dword_1DB4ED000, v32, OS_LOG_TYPE_DEFAULT, "No service account found for %@, no sign out necessary.", buf, 0xCu);
          }
        }
LABEL_30:

      }
      v23 = obj;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v26);
  }

  if (v40)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22;
    block[3] = &unk_1EA2DB138;
    v46 = v23;
    v47 = v40;
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  }
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138412802;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Signed out service %@ with success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Primary AuthKit account is already removed. All retained services were likely removed.", v18, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v2, "servicesUsingAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");

  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject intersectSet:](v5, "intersectSet:", v13);

  v14 = -[NSObject count](v5, "count");
  _AAUILogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "Removed set services as expected.", buf, 2u);
    }

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22_cold_1(v16);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUISignOutErrorDomain"), -11002, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)signOutServiceAccountsWithServiceOwnersManager:(uint64_t)a3 forAltDSID:(uint64_t)a4 DSID:(uint64_t)a5 context:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Attempting to remove services %@", a5, a6, a7, a8, 2u);
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Account still contains services that were attempted to be removed", v1, 2u);
}

void __106__AAUISignOutUtilities_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion___block_invoke_22_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Remaining services %@", a5, a6, a7, a8, 2u);
}

@end
