@implementation ACAccountStore(GameCenter)

- (id)_gkPrimaryCredentialForEnvironment:()GameCenter
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(a1, "_gkAllCredentialsForEnvironment:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayWithOptions:usingComparator:", 0, &__block_literal_global_80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke_2;
  v10[3] = &unk_1E75B5750;
  v10[4] = &v11;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v10);
  if (!v12[5] && objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v12[5];
    v12[5] = v3;

    objc_msgSend((id)v12[5], "setScope:", objc_msgSend((id)v12[5], "scope") | 0xC);
  }
  v5 = (void *)v12[5];
  if (v5)
  {
    +[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signInVisibilityManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reset");

    v5 = (void *)v12[5];
  }
  v8 = v5;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_gkAllCredentialsForEnvironment:()GameCenter
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ACAccountStore_GameCenter___gkAllCredentialsForEnvironment___block_invoke;
  v4[3] = &__block_descriptor_40_e28___NSArray_16__0__ACAccount_8l;
  v4[4] = a3;
  objc_msgSend(a1, "_gkMapAccountsWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_gkMapAccountsWithBlock:()GameCenter
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke;
  v10[3] = &unk_1E75B2000;
  v10[4] = a1;
  v12 = v4;
  v6 = v5;
  v11 = v6;
  v7 = v4;
  +[GKDispatchGroup waitUntilDone:](GKDispatchGroup, "waitUntilDone:", v10);
  if (objc_msgSend(v6, "count"))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (id)_gkCredentialForUsername:()GameCenter environment:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_gkAccountForAppleID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkCredentialForEnvironment:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_gkSetScope:()GameCenter forCredential:completionHandler:
{
  uint64_t v6;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  const char *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  LODWORD(v6) = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "environment");
  objc_msgSend(v9, "accountName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkAccountForAppleID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_GKGeneral;
  if (v13)
  {
    if (!os_log_GKGeneral)
    {
      v15 = GKOSLoggers();
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = v14;
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v6 = v6;
      v25 = v19;
      v26 = 2048;
      v27 = v6;
      v28 = 2112;
      v29 = v9;
      _os_log_debug_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_DEBUG, "%@: set bits:%lX cred:%@ ", buf, 0x20u);

    }
    else
    {
      v6 = v6;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_gkSetProperty:forKey:environment:", v16, CFSTR("GKCredentialScope"), v11);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke;
    v20[3] = &unk_1E75B5688;
    v23 = a2;
    v21 = v9;
    v22 = v10;
    objc_msgSend(a1, "saveVerifiedAccount:withCompletionHandler:", v13, v20);

  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v17 = GKOSLoggers();
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore(GameCenter) _gkSetScope:forCredential:completionHandler:].cold.1(v14, a2);
  }

}

- (uint64_t)_gkAllCredentials
{
  return objc_msgSend(a1, "_gkMapAccountsWithBlock:", &__block_literal_global_35);
}

- (id)_gkAccountForAppleID:()GameCenter
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ACAccountStore_GameCenter___gkAccountForAppleID___block_invoke;
  v12[3] = &unk_1E75B5778;
  v6 = v5;
  v13 = v6;
  objc_msgSend(a1, "_gkMapAccountsWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(GameCenter) _gkAccountForAppleID:].cold.1(v9, a2);
  }
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_getAltDSIDFromIDMSForCredential:()GameCenter completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/ACAccount+GameCenter.m", 684, "-[ACAccountStore(GameCenter) _getAltDSIDFromIDMSForCredential:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke;
  v19[3] = &unk_1E75B1800;
  v19[4] = a1;
  v11 = v9;
  v20 = v11;
  v21 = v6;
  v12 = v6;
  objc_msgSend(v11, "perform:", v19);
  dispatch_get_global_queue(21, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_86;
  v16[3] = &unk_1E75B1BF0;
  v17 = v11;
  v18 = v7;
  v14 = v11;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)_gkSaveCredential:()GameCenter completionHandler:
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  _BYTE v61[18];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = a4;
  v7 = objc_msgSend(v6, "environment");
  objc_msgSend(v6, "accountName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "scope");
  objc_msgSend(a1, "_gkAccountForAppleID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v12 = GKOSLoggers();
    v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v59 = v10;
    v60 = 1024;
    *(_DWORD *)v61 = v7;
    *(_WORD *)&v61[4] = 2048;
    *(_QWORD *)&v61[6] = v9;
    _os_log_debug_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_DEBUG, "STORING ACCOUNT: account:%@ environment:%d scope:%lX", buf, 0x1Cu);
    if (v10)
      goto LABEL_11;
  }
  else if (v10)
  {
    goto LABEL_11;
  }
  if (v8)
  {
    objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F098]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v13);
    objc_msgSend(v10, "setUsername:", v8);
    v14 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v15 = GKOSLoggers();
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:].cold.3();

  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gkSetProperty:forKey:environment:", v16, CFSTR("GKCredentialScope"), v7);

  objc_msgSend(v10, "_aa_rawPassword");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v10, "_aa_setRawPassword:", 0);
  objc_msgSend(v6, "authenticationToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v20 = GKOSLoggers();
    v19 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:].cold.2();
  objc_msgSend(v10, "_gkSetToken:forEnvironment:", v18, v7);
  objc_msgSend(v6, "playerInternal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v23 = GKOSLoggers();
    v22 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v59 = v10;
    v60 = 2112;
    *(_QWORD *)v61 = v21;
    *(_WORD *)&v61[8] = 2112;
    *(_QWORD *)&v61[10] = v18;
    _os_log_debug_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_DEBUG, "STORING ACCOUNT will save: account:%@ player:%@ token:%@", buf, 0x20u);
  }
  objc_msgSend(v10, "_gkSetPlayerInternal:", v21);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountProperty:forKey:", v24, CFSTR("GKEnvironment"));

  objc_msgSend(v10, "accountDescription");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_26;
  v26 = (void *)v25;
  v49 = v18;
  v50 = v7;
  v27 = v8;
  objc_msgSend(v10, "accountDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "length"))
  {

    v8 = v27;
    v18 = v49;
    goto LABEL_26;
  }
  objc_msgSend(v10, "accountDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "username");
  v30 = v6;
  v31 = v21;
  v32 = a1;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v29, "isEqualToString:", v33);

  a1 = v32;
  v21 = v31;
  v6 = v30;

  v8 = v27;
  v18 = v49;
  v7 = v50;
  if (v34)
  {
LABEL_26:
    objc_msgSend(v10, "username");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccountDescription:", v35);

  }
  objc_msgSend(v6, "altDSID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gkSetProperty:forKey:environment:", v36, CFSTR("altDSID"), v7);

  objc_msgSend(v6, "altDSID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountProperty:forKey:", v37, CFSTR("altDSID"));

  objc_msgSend(v6, "DSID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountProperty:forKey:", v38, CFSTR("dsid"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/ACAccount+GameCenter.m", 788, "-[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:]");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v42 = GKOSLoggers();
    v41 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore(GameCenter) _gkSaveCredential:completionHandler:].cold.1();
  v43 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke;
  v55[3] = &unk_1E75B1800;
  v55[4] = a1;
  v56 = v10;
  v44 = v40;
  v57 = v44;
  v45 = v10;
  objc_msgSend(v44, "perform:", v55);
  dispatch_get_global_queue(21, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v43;
  v52[1] = 3221225472;
  v52[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_91;
  v52[3] = &unk_1E75B1BF0;
  v53 = v44;
  v54 = v51;
  v47 = v44;
  v48 = v51;
  objc_msgSend(v47, "notifyOnQueue:block:", v46, v52);

}

- (void)_gkDeleteCredential:()GameCenter completionHandler:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v6 = a4;
  objc_msgSend(a3, "accountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkAccountForAppleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/ACAccount+GameCenter.m", 813, "-[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_GKGeneral;
  v12 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:].cold.2();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke;
    v21[3] = &unk_1E75B2C00;
    v21[4] = a1;
    v22 = v8;
    v23 = v10;
    v24 = v7;
    objc_msgSend(v23, "perform:", v21);

  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v14 = GKOSLoggers();
      v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore(GameCenter) _gkDeleteCredential:completionHandler:].cold.1();
  }
  dispatch_get_global_queue(21, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_92;
  v18[3] = &unk_1E75B1BF0;
  v19 = v10;
  v20 = v6;
  v16 = v10;
  v17 = v6;
  objc_msgSend(v16, "notifyOnQueue:block:", v15, v18);

}

- (void)_gkSetScope:()GameCenter forCredential:completionHandler:.cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v3, v5, "%@: No account for credential %@", v6);

  OUTLINED_FUNCTION_1_2();
}

- (void)_gkAccountForAppleID:()GameCenter .cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v3, v5, "%@: More than one existing account for username %@. Shouldn't be possible.", v6);

  OUTLINED_FUNCTION_1_2();
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "STORING ACCOUNT: SAVING ACCOUNT:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0(&dword_1BCDE3000, v0, v1, "STORING ACCOUNT: SAVING TOKEN (if not nil):%@ environment:%d");
  OUTLINED_FUNCTION_2();
}

- (void)_gkSaveCredential:()GameCenter completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "STORING ACCOUNT: account:%@ does not exist, creating", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_gkDeleteCredential:()GameCenter completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "DELETE ACCOUNT: account %@ doesn't exist, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_gkDeleteCredential:()GameCenter completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "DELETE ACCOUNT: removing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
