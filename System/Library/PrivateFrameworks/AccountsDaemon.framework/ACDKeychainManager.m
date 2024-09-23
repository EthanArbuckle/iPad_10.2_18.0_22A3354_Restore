@implementation ACDKeychainManager

+ (id)keychainServiceNameForClientID:(id)a3 accountTypeIdentifier:(id)a4 additionalAccountTypeSegment:(id)a5 key:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "addObject:", v9);
  objc_msgSend(v14, "addObject:", v10);
  if (v11)
    objc_msgSend(v14, "addObject:", v11);
  objc_msgSend(v14, "addObject:", v12);
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id obj;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "credentialLocation");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v3, "qualifiedUsername");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      objc_msgSend(*(id *)(a1 + 32), "qualifiedUsername");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v5;
      v8 = *(void **)(a1 + 80);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v8, "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1 + 64;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v14 + 40);
      objc_msgSend(v8, "_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:", v7, v11, v9, v10, 1, v12, &obj);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v14 + 40), obj);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "keysForCredentialItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 40);

        if (!v19)
        {
LABEL_45:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "oauthTokenNoSync");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v70 = *(void **)(a1 + 80);
          v71 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if (v69)
            objc_msgSend(v70, "_fallbackToUnsyncedOAuthTokens:", v71);
          else
            objc_msgSend(v70, "_createNoSyncOAuthTokens:account:clientID:", v71, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
          goto LABEL_48;
        }
      }
      else
      {

      }
      _ACDKeychainLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_2();

      v25 = *(void **)(a1 + 32);
      if (v2)
        objc_msgSend(v25, "qualifiedUsername");
      else
        objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 && objc_msgSend(v26, "length"))
      {
        v28 = *(void **)(a1 + 80);
        v72 = v7;
        v29 = *(_QWORD *)(a1 + 48);
        v30 = *(_QWORD *)(a1 + 56);
        v31 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v28, "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 32));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v75 = *(id *)(v33 + 40);
        v34 = v29;
        v7 = v72;
        objc_msgSend(v28, "_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:", v27, v31, v34, v30, 0, v32, &v75);
        v35 = objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v33 + 40), v75);
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = v35;

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "keysForCredentialItems");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
      {
        v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 40);

        if (!v39)
        {
          if (v2)
            goto LABEL_44;
          objc_msgSend(*(id *)(a1 + 32), "qualifiedUsername");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
            goto LABEL_44;
          _ACDKeychainLogSystem();
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            goto LABEL_38;
          v42 = *(void **)(a1 + 32);
          v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v78 = v42;
          v79 = 2112;
          v80 = v43;
          v44 = "Found an identifier-based credential for account %@ which isn't set to use them! Migrating to qualifiedU"
                "sreName-based credential. Error: %@";
          goto LABEL_37;
        }
      }
      else
      {

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "keysForCredentialItems");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count") && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 40))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "username");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "length");

        if (v47)
        {
          v73 = v7;
          v48 = v27;
          _ACDKeychainLogSystem();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_1();

          v50 = *(void **)(a1 + 80);
          objc_msgSend(*(id *)(a1 + 32), "username");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = *(_QWORD *)(a1 + 48);
          v53 = *(_QWORD *)(a1 + 56);
          v54 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 80), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 32));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v74 = *(id *)(v56 + 40);
          objc_msgSend(v50, "_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:", v51, v54, v52, v53, 0, v55, &v74);
          v57 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v56 + 40), v74);
          v58 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v59 = *(void **)(v58 + 40);
          *(_QWORD *)(v58 + 40) = v57;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "keysForCredentialItems");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v60, "count"))
          {

            v27 = v48;
            v7 = v73;
            goto LABEL_44;
          }
          v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 40);

          v27 = v48;
          v7 = v73;
          if (v61)
          {
LABEL_44:

            goto LABEL_45;
          }
          _ACDKeychainLogSystem();
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
LABEL_38:

            objc_msgSend(*(id *)(a1 + 80), "_migrateCredential:forAccount:clientID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
            goto LABEL_44;
          }
          v62 = *(void **)(a1 + 32);
          v63 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v78 = v62;
          v79 = 2112;
          v80 = v63;
          v44 = "Found a legacy username-based credential for account %@! Migrating to QualifiedUsername-based credential. Error: %@";
LABEL_37:
          _os_log_impl(&dword_20D8CB000, v41, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
          goto LABEL_38;
        }
      }
      _ACDKeychainLogSystem();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v78 = v65;
        _os_log_impl(&dword_20D8CB000, v64, OS_LOG_TYPE_DEFAULT, "No username for account %@. Can't look up credential", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 11, 0);
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = *(_QWORD *)(*(_QWORD *)v13 + 8);
      v68 = *(void **)(v67 + 40);
      *(_QWORD *)(v67 + 40) = v66;

      goto LABEL_44;
    }
  }
  _ACDKeychainLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v78 = v21;
    _os_log_impl(&dword_20D8CB000, v20, OS_LOG_TYPE_DEFAULT, "Nil qualifiedUsername for account %@. Can't look up credential", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 11, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;
LABEL_48:

}

+ (id)_fetchOptionsForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(a1, "_shouldSyncCredentialForAccount:", v4))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x24BDE9148], *MEMORY[0x24BDE9140]);
  objc_msgSend(v4, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDB3FE8]);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ICLOUD_STORAGE"), &stru_24C7E3E98, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDE9520]);

  }
  if (objc_msgSend(v5, "count"))
    v11 = (void *)objc_msgSend(v5, "copy");
  else
    v11 = 0;

  return v11;
}

+ (BOOL)_shouldSyncCredentialForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD v23[26];

  v23[25] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDB4158];
  v23[0] = *MEMORY[0x24BDB4058];
  v23[1] = v4;
  v5 = *MEMORY[0x24BDB4140];
  v23[2] = *MEMORY[0x24BDB4178];
  v23[3] = v5;
  v6 = *MEMORY[0x24BDB4150];
  v23[4] = *MEMORY[0x24BDB4040];
  v23[5] = v6;
  v23[6] = *MEMORY[0x24BDB4120];
  v23[7] = CFSTR("com.apple.linkedin");
  v7 = *MEMORY[0x24BDB4130];
  v23[8] = *MEMORY[0x24BDB4138];
  v23[9] = v7;
  v8 = *MEMORY[0x24BDB4010];
  v23[10] = *MEMORY[0x24BDB4000];
  v23[11] = v8;
  v9 = *MEMORY[0x24BDB4088];
  v23[12] = *MEMORY[0x24BDB3FF8];
  v23[13] = v9;
  v10 = *MEMORY[0x24BDB4118];
  v23[14] = *MEMORY[0x24BDB40F8];
  v23[15] = v10;
  v11 = *MEMORY[0x24BDB4160];
  v23[16] = *MEMORY[0x24BDB40C0];
  v23[17] = v11;
  v12 = *MEMORY[0x24BDB4090];
  v23[18] = *MEMORY[0x24BDB4098];
  v23[19] = v12;
  v13 = *MEMORY[0x24BDB3FB8];
  v23[20] = *MEMORY[0x24BDB3FD0];
  v23[21] = v13;
  v14 = *MEMORY[0x24BDB4108];
  v23[22] = *MEMORY[0x24BDB3FC0];
  v23[23] = v14;
  v23[24] = *MEMORY[0x24BDB40E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "containsObject:", v17))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDB3EE8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      LOBYTE(v19) = 0;
    }
    else
    {
      objc_msgSend(v3, "accountPropertyForKey:", CFSTR("mcPayloadUUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        LOBYTE(v19) = 0;
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDB3FA0]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v21, "BOOLValue") ^ 1;

      }
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

+ (id)credentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accountType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "credentialType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _ACDKeychainLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager credentialForAccount:clientID:error:].cold.3();

  v15 = objc_msgSend(MEMORY[0x24BDB4388], "credentialPolicyIsMixedForAccountTypeIdentifier:", v11);
  objc_msgSend(v8, "accountType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "credentialProtectionPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[ACDKeychain canAccessPasswordsWithPolicy:](ACDKeychain, "canAccessPasswordsWithPolicy:", v17);

  if (((v18 | v15) & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    v45 = 0;
    if (a5)
      *a5 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    v40 = 0;
    v19 = (void *)MEMORY[0x24BDB43F0];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke;
    v27[3] = &unk_24C7E1E60;
    v28 = v8;
    p_buf = &buf;
    v33 = &v35;
    v34 = a1;
    v29 = v11;
    v30 = v13;
    v31 = v9;
    objc_msgSend(v19, "performWithinPersonaForAccount:withBlock:", v28, v27);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      _ACDKeychainLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[ACDKeychainManager credentialForAccount:clientID:error:].cold.2();

      if (a5)
        *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    }
    _ACDKeychainLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[ACDKeychainManager credentialForAccount:clientID:error:].cold.1();

    a5 = (id *)(id)v36[5];
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _ACDKeychainLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_20D8CB000, v22, OS_LOG_TYPE_DEFAULT, "Credential for account %@ is not currently available", (uint8_t *)&buf, 0xCu);

    }
    if (a5)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FC8];
      v47[0] = CFSTR("Credential data is currently unavailable for Account ");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 10, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }

  return a5;
}

+ (id)_credentialForAccountWithID:(id)a3 accountTypeID:(id)a4 credentialType:(id)a5 clientID:(id)a6 allowAdditionalAccountTypeSegment:(BOOL)a7 options:(id)a8 error:(id *)a9
{
  _BOOL4 v10;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v34;
  char v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v10 = a7;
  v46 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v14 = a4;
  v15 = a5;
  v38 = a6;
  v37 = a8;
  _ACDKeychainLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:].cold.3();

  v36 = objc_alloc_init(MEMORY[0x24BDB4388]);
  objc_msgSend(v36, "setCredentialType:", v15);
  objc_msgSend(MEMORY[0x24BDB4388], "supportedKeysForAccountTypeIdentifier:credentialType:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    if (v10)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDB4388], "additionalServiceSegmentForAccountTypeIdentifier:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    _ACDKeychainLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:].cold.2();

    if (v10)
      goto LABEL_5;
  }
  v18 = 0;
LABEL_10:
  v35 = objc_msgSend(MEMORY[0x24BDB4388], "credentialPolicyIsMixedForAccountTypeIdentifier:", v14);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v21)
  {
    v22 = v21;
    v34 = v15;
    v23 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v26 = v14;
        +[ACDKeychainManager keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:](ACDKeychainManager, "keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:", v38, v14, v18, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        +[ACDKeychainManager _itemForServiceName:username:accessGroup:options:error:](ACDKeychainManager, "_itemForServiceName:username:accessGroup:options:error:", v27, v39, 0, v37, &v40);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v40;
        v30 = v29;
        if (v29)
        {
          v31 = objc_msgSend(v29, "code") == 11 ? 1 : v35;
          if ((v31 & 1) == 0)
          {
            if (a9)
              *a9 = objc_retainAutorelease(v30);

            v36 = 0;
            v14 = v26;
            goto LABEL_28;
          }
        }
        if (v28)
          objc_msgSend(v36, "setCredentialItem:forKey:", v28, v25);

        v14 = v26;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v22)
        continue;
      break;
    }
LABEL_28:
    v15 = v34;
  }

  _ACDKeychainLogSystem();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:].cold.1();

  return v36;
}

+ (id)_itemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v15 = (void *)_ac_keychainLock;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke;
  v22[3] = &unk_24C7E1FF0;
  v27 = &v35;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v14;
  v26 = v19;
  v28 = &v29;
  objc_msgSend(v15, "lockPerformForService:username:block:", v16, v17, v22);
  if (a7)
    *a7 = objc_retainAutorelease((id)v30[5]);
  v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 4;
  v2 = a1[4];
  v5 = a1 + 5;
  v4 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v25 = 0;
  +[ACDKeychain passwordForServiceName:username:accessGroup:options:error:](ACDKeychain, "passwordForServiceName:username:accessGroup:options:error:", v2, v4, v6, v7, &v25);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v25;
  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    v12 = v9 == 0;
  else
    v12 = 0;
  if (v12)
  {
    _ACDKeychainLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_1();
  }
  else if (v9)
  {
    v13 = objc_msgSend(v9, "code");
    if (v13 == -25308)
    {
      _ACDKeychainLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_4();
      v15 = 10;
    }
    else if (v13 == -25300)
    {
      _ACDKeychainLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_3();
      v15 = 11;
    }
    else
    {
      _ACDKeychainLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v23 = *v3;
        v24 = *v5;
        *(_DWORD *)buf = 138412802;
        v29 = v9;
        v30 = 2112;
        v31 = v23;
        v32 = 2112;
        v33 = v24;
        _os_log_debug_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEBUG, "Keychain fetch failed with error: %@ for item: %@.%@", buf, 0x20u);
      }
      v15 = 12;
    }

    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDB4200];
    v26[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to fetch credential from keychain (%ld)"), objc_msgSend(v9, "code"));
    v16 = objc_claimAutoreleasedReturnValue();
    v26[1] = *MEMORY[0x24BDD1398];
    v27[0] = v16;
    v27[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v15, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1[9] + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  else
  {
    _ACDKeychainLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_2();
  }

}

+ (void)_createNoSyncOAuthTokens:(id)a3 account:(id)a4 clientID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "credentialType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB41C0]) & 1) != 0)
  {
    objc_msgSend(v8, "oauthToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "oauthToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOauthTokenNoSync:", v13);
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "credentialType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB41B8]))
  {
    objc_msgSend(v8, "oauthToken");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v8, "oauthTokenSecret");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_10;
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "oauthToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BDB4278];
      objc_msgSend(v8, "oauthTokenSecret");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@%@"), v13, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOauthTokenNoSync:", v20);

    }
  }
LABEL_9:

LABEL_10:
  objc_msgSend(v8, "oauthTokenNoSync");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = 0;
    objc_msgSend(a1, "_saveCredential:forAccount:clientID:error:", v8, v9, v10, &v22);
  }

}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = (void *)_ac_keychainLock;
  _ac_keychainLock = v2;

}

+ (ACDServer)server
{
  return (ACDServer *)objc_loadWeakRetained(&sServer);
}

+ (void)setServer:(id)a3
{
  objc_storeWeak(&sServer, a3);
}

+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (objc_class *)MEMORY[0x24BDB4380];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithManagedAccount:", v10);

  objc_msgSend(a1, "credentialForAccount:clientID:error:", v11, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4
{
  return (id)objc_msgSend(a1, "credentialForManagedAccountObject:clientID:error:", a3, a4, 0);
}

+ (id)credentialForManagedAccountObject:(id)a3
{
  return (id)objc_msgSend(a1, "credentialForManagedAccountObject:clientID:", a3, 0);
}

+ (id)credentialForAccount:(id)a3 clientID:(id)a4
{
  return (id)objc_msgSend(a1, "credentialForAccount:clientID:error:", a3, a4, 0);
}

+ (void)setCredentialForAccount:(id)a3
{
  objc_msgSend(a1, "_setCredentialForAccount:clientID:handleCredentialItemRemovals:error:", a3, 0, 1, 0);
}

+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4
{
  objc_msgSend(a1, "_setCredentialForAccount:clientID:handleCredentialItemRemovals:error:", a3, a4, 1, 0);
}

+ (void)setCredentialForAccount:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "_setCredentialForAccount:clientID:handleCredentialItemRemovals:error:", a3, 0, 1, a4);
}

+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "_setCredentialForAccount:clientID:handleCredentialItemRemovals:error:", a3, a4, 1, a5);
}

+ (void)setCredentialForNewAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "_setCredentialForAccount:clientID:handleCredentialItemRemovals:error:", a3, a4, 0, a5);
}

+ (void)_setCredentialForAccount:(id)a3 clientID:(id)a4 handleCredentialItemRemovals:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  _BYTE *v61;
  id v62;
  id obj;
  _QWORD v64[4];
  id v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  uint64_t *v67;
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  id v78;
  _BYTE v79[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  __int128 v81;
  uint64_t v82;
  _QWORD v83[4];

  v7 = a5;
  v83[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  objc_msgSend(v10, "internalCredential");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDKeychainLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v79 = 138413058;
    *(_QWORD *)&v79[4] = v12;
    *(_WORD *)&v79[12] = 2112;
    *(_QWORD *)&v79[14] = v10;
    *(_WORD *)&v79[22] = 2112;
    v80 = v11;
    LOWORD(v81) = 2112;
    *(_QWORD *)((char *)&v81 + 2) = v50;
    _os_log_debug_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEBUG, "Setting credential=%@; for account=%@; client=%@; handle credential removals=%@",
      v79,
      0x2Au);

  }
  objc_msgSend(v10, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "credentialProtectionPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[ACDKeychain canAccessPasswordsWithPolicy:](ACDKeychain, "canAccessPasswordsWithPolicy:", v15);

  if (v16)
  {
    *(_QWORD *)v79 = 0;
    *(_QWORD *)&v79[8] = v79;
    *(_QWORD *)&v79[16] = 0x3032000000;
    v80 = __Block_byref_object_copy_;
    *(_QWORD *)&v81 = __Block_byref_object_dispose_;
    *((_QWORD *)&v81 + 1) = 0;
    if (a6)
      *a6 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy_;
    v73 = __Block_byref_object_dispose_;
    v74 = 0;
    if (v7)
    {
      if (v12 && !objc_msgSend(v12, "requiresTouchID"))
      {
        _ACDKeychainLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D8CB000, v23, OS_LOG_TYPE_DEFAULT, "Fetching exting credential to handle removed credential items", buf, 2u);
        }

        v24 = (void *)MEMORY[0x24BDB43F0];
        v64[0] = MEMORY[0x24BDAC760];
        v64[1] = 3221225472;
        v64[2] = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke;
        v64[3] = &unk_24C7E1E88;
        v67 = &v69;
        v65 = v10;
        v66 = v11;
        objc_msgSend(v24, "performWithinPersonaForAccount:withBlock:", v65, v64);

        v17 = v65;
      }
      else
      {
        v68 = 0;
        +[ACDKeychainManager removeCredentialForAccount:clientID:error:](ACDKeychainManager, "removeCredentialForAccount:clientID:error:", v10, v11, &v68);
        v17 = v68;
        if (v17)
        {
          _ACDKeychainLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v76 = v10;
            v77 = 2112;
            v78 = v17;
            _os_log_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEFAULT, "Unable to remove existing credential for account %@. Error: %@", buf, 0x16u);
          }

        }
      }

    }
    v25 = *(_QWORD *)&v79[8];
    obj = *(id *)(*(_QWORD *)&v79[8] + 40);
    objc_msgSend(a1, "_saveCredential:forAccount:clientID:error:", v12, v10, v11, &obj);
    objc_storeStrong((id *)(v25 + 40), obj);
    v26 = *(void **)(*(_QWORD *)&v79[8] + 40);
    if (v26)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v26);
    }
    else
    {
      v27 = MEMORY[0x24BDAC760];
      if (v12 && v7)
      {
        objc_msgSend((id)v70[5], "keysForCredentialItems");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");

        objc_msgSend(v10, "internalCredential");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "keysForCredentialItems");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removeObjectsInArray:", v31);

        v32 = (void *)MEMORY[0x24BDB43F0];
        v57[0] = v27;
        v57[1] = 3221225472;
        v57[2] = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_2;
        v57[3] = &unk_24C7E1EB0;
        v33 = v29;
        v58 = v33;
        v59 = v10;
        v60 = v11;
        v61 = v79;
        v62 = a1;
        objc_msgSend(v32, "performWithinPersonaForAccount:withBlock:", v59, v57);

      }
      v34 = (void *)MEMORY[0x24BDB43F0];
      v51 = v27;
      v52 = 3221225472;
      v53 = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_21;
      v54 = &unk_24C7E1ED8;
      v56 = a1;
      v35 = v10;
      v55 = v35;
      objc_msgSend(v34, "performWithinPersonaForAccount:withBlock:", v35, &v51);
      v36 = (void *)MEMORY[0x24BDB4388];
      objc_msgSend(v35, "accountType", v51, v52, v53, v54);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "accountType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "credentialType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "nonPersistentKeysForAccountTypeIdentifier:credentialType:", v38, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        objc_msgSend(a1, "_setNonPersistentCredentialTimerForAccount:", v35);
      _ACDKeychainLogSystem();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        +[ACDKeychainManager _setCredentialForAccount:clientID:handleCredentialItemRemovals:error:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);

    }
    _Block_object_dispose(&v69, 8);

    _Block_object_dispose(v79, 8);
  }
  else
  {
    _ACDKeychainLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v79 = 138412290;
      *(_QWORD *)&v79[4] = v20;
      _os_log_impl(&dword_20D8CB000, v19, OS_LOG_TYPE_DEFAULT, "Credential for account %@ is not currently available", v79, 0xCu);

    }
    if (a6)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v82 = *MEMORY[0x24BDD0FC8];
      v83[0] = CFSTR("Credential data is currently unavailable.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 10, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

void __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[ACDKeychainManager credentialForAccount:clientID:error:](ACDKeychainManager, "credentialForAccount:clientID:error:", a1[4], a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_2(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "qualifiedUsername");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accountType");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 64), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v17 = *(id *)(v9 + 40);
        +[ACDKeychainManager _removeCredentialItemWithKey:forAccountWithID:username:accountTypeID:clientID:options:error:](ACDKeychainManager, "_removeCredentialItemWithKey:forAccountWithID:username:accountTypeID:clientID:options:error:", v16, v3, v4, v6, v7, v8, &v17);
        objc_storeStrong((id *)(v9 + 40), v17);

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          _ACDKeychainLogSystem();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(a1 + 40);
            v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v23 = v11;
            v24 = 2112;
            v25 = v12;
            _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "Removal from keychain failed for account %@. Error: %@", buf, 0x16u);
          }

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

void __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_21(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialsDidChangeForAccount:", *(_QWORD *)(a1 + 32));

}

+ (void)_saveCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  void *v35;
  id obj;
  uint64_t (*v37)(uint64_t, uint64_t);
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  _BYTE *v45;
  id v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v38 = a4;
  v37 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v35 = v8;
  objc_msgSend(v8, "keysForCredentialItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDKeychainLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2112;
    v54 = v37;
    _os_log_debug_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEBUG, "Asked to save credential: %@ for Account - %@ with the clientID - %@", buf, 0x20u);
  }

  v11 = objc_msgSend(a1, "_shouldSyncCredentialForAccount:", v38);
  v12 = (void *)MEMORY[0x24BDB4388];
  objc_msgSend(v38, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "additionalServiceSegmentForAccountTypeIdentifier:", v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v9;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v49;
    v17 = *MEMORY[0x24BDB4270];
LABEL_5:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v18);
      if (!objc_msgSend(v19, "isEqualToString:", v17) || (v11 & 1) != 0)
      {
        objc_msgSend(v38, "accountType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACDKeychainManager keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:](ACDKeychainManager, "keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:", v37, v21, v33, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x24BDB4388];
        objc_msgSend(v38, "accountType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "credentialPolicyForAccountTypeIdentifier:key:clientID:", v25, v19, v37);
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x24BDB43F0];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __64__ACDKeychainManager__saveCredential_forAccount_clientID_error___block_invoke;
        v39[3] = &unk_24C7E1F00;
        v28 = v38;
        v40 = v28;
        v41 = v35;
        v42 = v19;
        v29 = v22;
        v43 = v29;
        v30 = (id)v26;
        v47 = v11;
        v44 = v30;
        v45 = buf;
        v46 = a1;
        objc_msgSend(v27, "performWithinPersonaForAccount:withBlock:", v28, v39);
        LOBYTE(v26) = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

        if ((v26 & 1) == 0)
          break;
      }
      if (v15 == ++v18)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v15)
          goto LABEL_5;
        break;
      }
    }
  }

  if (a6)
  {
    v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v31)
      *a6 = objc_retainAutorelease(v31);
  }
  _Block_object_dispose(buf, 8);

}

void __64__ACDKeychainManager__saveCredential_forAccount_clientID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "credentialLocation");
  objc_msgSend(*(id *)(a1 + 40), "credentialItemForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v5, "identifier");
  else
    objc_msgSend(v5, "qualifiedUsername");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v8 = (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BDB4270]) & 1) == 0 && *(_BYTE *)(a1 + 88) != 0;
  v9 = objc_msgSend(*(id *)(a1 + 40), "requiresTouchID");
  objc_msgSend(*(id *)(a1 + 80), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v11 + 40);
  LOBYTE(v12) = v9;
  +[ACDKeychainManager _setItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:options:error:](ACDKeychainManager, "_setItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:options:error:", v3, v4, v6, 0, v7, v8, v12, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

}

+ (void)_setNonPersistentCredentialTimerForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB43C8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForManagedDefault:", *MEMORY[0x24BDB4260]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  _ACDKeychainLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "NOT setting timer to erase volatile keychain items because of user preference.", v9, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ACDKeychainManager _setNonPersistentCredentialTimerForAccount:].cold.1();

    +[ACDKeychainCleanupActivity sharedActivity](ACDKeychainCleanupActivity, "sharedActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject queueNonPersistentCredentialRemoval:](v8, "queueNonPersistentCredentialRemoval:", v3);
  }

}

+ (void)removeCredentialForAccount:(id)a3
{
  objc_msgSend(a1, "removeCredentialForAccount:error:", a3, 0);
}

+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4
{
  objc_msgSend(a1, "removeCredentialForAccount:clientID:error:", a3, a4, 0);
}

+ (void)removeCredentialForAccount:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BDB4380];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithManagedAccount:", v7);

  objc_msgSend(a1, "removeCredentialForAccount:clientID:error:", v8, 0, a4);
}

+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager removeCredentialForAccount:clientID:error:].cold.2((uint64_t)v8, (uint64_t)v9, v10);

  objc_msgSend(v8, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "credentialProtectionPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[ACDKeychain canAccessPasswordsWithPolicy:](ACDKeychain, "canAccessPasswordsWithPolicy:", v12);

  if (v13)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v14 = (void *)MEMORY[0x24BDB43F0];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__ACDKeychainManager_removeCredentialForAccount_clientID_error___block_invoke;
    v19[3] = &unk_24C7E1F28;
    v23 = a1;
    v20 = v8;
    v21 = v9;
    v22 = &v24;
    objc_msgSend(v14, "performWithinPersonaForAccount:withBlock:", v20, v19);
    if (a5)
    {
      v15 = (void *)v25[5];
      if (v15)
        *a5 = objc_retainAutorelease(v15);
    }
    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[ACDKeychainManager removeCredentialForAccount:clientID:error:].cold.1();

    _Block_object_dispose(&v24, 8);
  }
  else if (a5)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = CFSTR("Credential data is currently unavailable.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 10, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __64__ACDKeychainManager_removeCredentialForAccount_clientID_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id obj;

  v2 = (void *)a1[7];
  v3 = a1[4];
  v4 = a1[5];
  objc_msgSend(v2, "_fetchOptionsForAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "_removeCredentialsForAccount:clientID:options:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

}

+ (void)_removeCredentialsForAccount:(id)a3 clientID:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id obj;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v34 = a5;
  _ACDKeychainLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager _removeCredentialsForAccount:clientID:options:error:].cold.1();
  v35 = v10;

  v12 = (void *)MEMORY[0x24BDB4388];
  objc_msgSend(v9, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "credentialType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "supportedKeysForAccountTypeIdentifier:credentialType:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    obj = v18;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "qualifiedUsername");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_removeCredentialItemWithKey:forAccountWithID:username:accountTypeID:clientID:options:error:", v23, v24, v25, v27, v35, v34, a6);

        if (a6 && *a6)
        {
          _ACDKeychainLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *a6;
            *(_DWORD *)buf = 138412802;
            v41 = v23;
            v42 = 2112;
            v43 = v29;
            v44 = 2112;
            v45 = v30;
            _os_log_impl(&dword_20D8CB000, v28, OS_LOG_TYPE_DEFAULT, "Unable to remove credential %@ from %@. Error: %@", buf, 0x20u);

          }
        }
      }
      v18 = obj;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v20);
  }

  if (!v35)
  {
    objc_msgSend((id)objc_opt_class(), "server");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "credentialsDidChangeForAccount:", v9);

  }
}

+ (void)removeCredentialForAccount:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _BYTE *v19;
  id v20;
  _QWORD v21[3];
  char v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDKeychainLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "Remove credential key: %@ for account: %@", buf, 0x16u);
  }

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__ACDKeychainManager_removeCredentialForAccount_key_error___block_invoke;
  v15[3] = &unk_24C7E1F50;
  v18 = v21;
  v20 = a1;
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v19 = buf;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v13, v15);
  if (a5)
  {
    v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v21, 8);

}

void __59__ACDKeychainManager_removeCredentialForAccount_key_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = *(void **)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "qualifiedUsername");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "_removeCredentialItemWithKey:forAccountWithID:username:accountTypeID:clientID:options:error:", v3, v4, v5, v7, 0, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend((id)objc_opt_class(), "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "credentialsDidChangeForAccount:", *(_QWORD *)(a1 + 40));

  }
}

+ (BOOL)_removeCredentialItemWithKey:(id)a3 forAccountWithID:(id)a4 username:(id)a5 accountTypeID:(id)a6 clientID:(id)a7 options:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;

  v14 = a4;
  v15 = a8;
  v16 = (void *)MEMORY[0x24BDB4388];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v16, "additionalServiceSegmentForAccountTypeIdentifier:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACDKeychainManager keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:](ACDKeychainManager, "keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:", v17, v18, v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:](ACDKeychainManager, "_removeItemForService:username:accessGroup:options:error:", v22, v19, 0, v15, a9);
  if (v14)
    v24 = 1;
  else
    v24 = v23;
  if (v14 && !v23)
    v24 = +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:](ACDKeychainManager, "_removeItemForService:username:accessGroup:options:error:", v22, v14, 0, v15, a9);

  return v24;
}

+ (void)componentsFromKeychainServiceName:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeLastObject");
  if (objc_msgSend(v9, "length")
    && (objc_msgSend(MEMORY[0x24BDB4388], "allSupportedKeys"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v9),
        v10,
        (v11 & 1) != 0))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__ACDKeychainManager_componentsFromKeychainServiceName_handler___block_invoke;
    v12[3] = &unk_24C7E1F78;
    v14 = v6;
    v13 = v9;
    objc_msgSend(a1, "_accountTypeIdentifierFromComponents:handler:", v8, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

void __64__ACDKeychainManager_componentsFromKeychainServiceName_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  v5 = a3;
  if (!objc_msgSend(v10, "length")
    || (objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v10),
        v6,
        (v7 & 1) == 0))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v9();
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_7:
}

+ (void)_accountTypeIdentifierFromComponents:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  char v21;

  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ACDKeychainManager__accountTypeIdentifierFromComponents_handler___block_invoke;
  v12[3] = &unk_24C7E1FA0;
  v8 = v7;
  v13 = v8;
  v14 = v20;
  v15 = &v16;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v12);
  if (*((_BYTE *)v17 + 24))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (v10 == objc_msgSend(v5, "count"))
    {
      v6[2](v6, v9, 0);
    }
    else
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v6)[2](v6, v9, v11);

    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

void __67__ACDKeychainManager__accountTypeIdentifierFromComponents_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && objc_msgSend(v6, "isEqualToString:", CFSTR("com")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isEqualToString:", CFSTR("apple"));

}

+ (void)_migrateCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  objc_msgSend(a1, "_saveCredential:forAccount:clientID:error:", v8, v9, v10, &v18);
  v11 = v18;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x24BDB43F0];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__ACDKeychainManager__migrateCredential_forAccount_clientID___block_invoke;
    v13[3] = &unk_24C7E1FC8;
    v14 = v8;
    v15 = v10;
    v16 = v9;
    v17 = a1;
    objc_msgSend(v12, "performWithinPersonaForAccount:withBlock:", v16, v13);

  }
}

void __61__ACDKeychainManager__migrateCredential_forAccount_clientID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keysForCredentialItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "accountType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACDKeychainManager keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:](ACDKeychainManager, "keychainServiceNameForClientID:accountTypeIdentifier:additionalAccountTypeSegment:key:", v7, v9, 0, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(*(id *)(a1 + 48), "credentialLocation"))
        {
          objc_msgSend(*(id *)(a1 + 48), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 48));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:](ACDKeychainManager, "_removeItemForService:username:accessGroup:options:error:", v10, v11, 0, v12, 0);

        }
        objc_msgSend(*(id *)(a1 + 48), "username");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(*(id *)(a1 + 48), "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "qualifiedUsername");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "username");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "_fetchOptionsForAccount:", *(_QWORD *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:](ACDKeychainManager, "_removeItemForService:username:accessGroup:options:error:", v10, v18, 0, v19, 0);

          }
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v3);
  }

}

+ (void)_setItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 options:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  id v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v22 = (void *)_ac_keychainLock;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __120__ACDKeychainManager__setItem_forServiceName_username_accessGroup_accessibility_syncable_requiresTouchID_options_error___block_invoke;
  v30[3] = &unk_24C7E2018;
  v23 = v17;
  v31 = v23;
  v24 = v16;
  v32 = v24;
  v25 = v18;
  v33 = v25;
  v26 = v19;
  v34 = v26;
  v27 = v21;
  v35 = v27;
  v37 = &v41;
  v38 = a1;
  v28 = v20;
  v36 = v28;
  v39 = a8;
  v40 = a9;
  objc_msgSend(v22, "lockPerformForService:username:block:", v23, v25, v30);
  if (a11)
    *a11 = objc_retainAutorelease((id)v42[5]);

  _Block_object_dispose(&v41, 8);
}

void __120__ACDKeychainManager__setItem_forServiceName_username_accessGroup_accessibility_syncable_requiresTouchID_options_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "length")
    && objc_msgSend(*(id *)(a1 + 40), "length")
    && objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v34 = 0;
    +[ACDKeychain passwordForServiceName:username:accessGroup:options:error:](ACDKeychain, "passwordForServiceName:username:accessGroup:options:error:", v2, v3, v4, v5, &v34);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    v8 = v7;
    if (v7 && objc_msgSend(v7, "code") != -25300)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "code"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Unable to fetch existing credential due to error %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDB4200];
      v23 = *MEMORY[0x24BDD1398];
      v35[0] = *MEMORY[0x24BDD0FC8];
      v35[1] = v23;
      v36[0] = v20;
      v36[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 13, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    else
    {
      v9 = *(void **)(a1 + 88);
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 72);
      if (v6)
      {
        v15 = *(_QWORD *)(a1 + 64);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v33 = *(void **)(v16 + 40);
        objc_msgSend(v9, "_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:", v10, v6, v11, v12, v13, v14, v15, &v33);
        v17 = v33;
      }
      else
      {
        v28 = *(unsigned __int8 *)(a1 + 96);
        v29 = *(_BYTE *)(a1 + 97);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v32 = *(void **)(v16 + 40);
        LOBYTE(v31) = v29;
        objc_msgSend(v9, "_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:", v10, v11, v12, v13, v14, v28, v31, &v32);
        v17 = v32;
      }
      v30 = v17;
      v20 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v30;
    }

  }
}

+ (void)_keychainLock_updateItem:(id)a3 existingPassword:(id)a4 forServiceName:(id)a5 username:(id)a6 accessGroup:(id)a7 accessibility:(id)a8 options:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if ((objc_msgSend(a4, "isEqualToString:", v15) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v21, "setObject:forKey:", v22, *MEMORY[0x24BDE9550]);
    if (v19)
    {
      _ACDKeychainLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.4();

      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v19, *MEMORY[0x24BDE8F60]);
    }
    v35 = 0;
    +[ACDKeychain updateItemForServiceName:username:accessGroup:newValues:options:error:](ACDKeychain, "updateItemForServiceName:username:accessGroup:newValues:options:error:", v16, v17, v18, v21, v20, &v35);
    v24 = v35;
    _ACDKeychainLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.3();

      if (!a10)
        goto LABEL_16;
      v27 = (void *)MEMORY[0x24BDD17C8];
      v34 = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v24, "code"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Unable to store credential due to error %@"), v28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDB4200];
      v29 = *MEMORY[0x24BDD1398];
      v36[0] = *MEMORY[0x24BDD0FC8];
      v36[1] = v29;
      v37[0] = v26;
      v37[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v30 = v17;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v32, 13, v31);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v30;
      v22 = v34;
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.2();
    }

LABEL_16:
    goto LABEL_17;
  }
  _ACDKeychainLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.1();
LABEL_17:

}

+ (void)_keychainLock_addItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  _QWORD *v21;
  SecAccessControlRef v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  SecAccessControlRef v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  CFErrorRef error;
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  _QWORD v48[2];

  v10 = a8;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && !a9)
  {
    _ACDKeychainLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.4();

    objc_msgSend(v19, "setObject:forKey:", v18, *MEMORY[0x24BDE8F60]);
  }
  v21 = (_QWORD *)MEMORY[0x24BDBD268];
  if (v10)
    v21 = (_QWORD *)MEMORY[0x24BDBD270];
  objc_msgSend(v19, "setObject:forKey:", *v21, *MEMORY[0x24BDE9140]);
  if (!a9)
  {
LABEL_20:
    objc_msgSend(v42, "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    +[ACDKeychain addItemWithServiceName:username:accessGroup:passwordData:options:error:](ACDKeychain, "addItemWithServiceName:username:accessGroup:passwordData:options:error:", v15, v16, v17, v27, v19, &v43);
    v29 = v43;
    _ACDKeychainLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:].cold.3();

      if (!a10)
        goto LABEL_28;
      v41 = v15;
      v32 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "code"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Unable to store credential due to error %@"), v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDB4200];
      v36 = *MEMORY[0x24BDD1398];
      v45[0] = *MEMORY[0x24BDD0FC8];
      v45[1] = v36;
      v46[0] = v31;
      v46[1] = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v37 = v17;
      v38 = v16;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v34;
      v15 = v41;
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v35, 13, v39);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

      v16 = v38;
      v17 = v37;
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:].cold.2();
    }

LABEL_28:
    goto LABEL_29;
  }
  error = 0;
  v22 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFTypeRef)*MEMORY[0x24BDE8F98], 1uLL, &error);
  if (v22)
    v23 = error == 0;
  else
    v23 = 0;
  if (v23)
  {
    v28 = v22;
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDE8F48]);

    goto LABEL_20;
  }
  _ACDKeychainLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:].cold.1();

  if (error)
    CFRelease(error);
  if (a10)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDB4200];
    v47 = *MEMORY[0x24BDD0FC8];
    v48[0] = CFSTR("Unable to store credential due to error with SecAccessControlRef");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 13, v27);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

  }
}

+ (BOOL)_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v16 = (void *)_ac_keychainLock;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __79__ACDKeychainManager__removeItemForService_username_accessGroup_options_error___block_invoke;
  v31[3] = &unk_24C7E2040;
  v36 = &v45;
  v38 = a1;
  v17 = v12;
  v32 = v17;
  v18 = v13;
  v33 = v18;
  v19 = v14;
  v34 = v19;
  v20 = v15;
  v35 = v20;
  v37 = &v39;
  objc_msgSend(v16, "lockPerformForService:username:block:", v17, v18, v31);
  _ACDKeychainLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

  if (a7)
    *a7 = objc_retainAutorelease((id)v40[5]);
  v29 = *((_BYTE *)v46 + 24);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __79__ACDKeychainManager__removeItemForService_username_accessGroup_options_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = (void *)a1[10];
  v7 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "_keychainLock_removeItemForService:username:accessGroup:options:error:", v2, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v8;
}

+ (BOOL)_keychainLock_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    if (a7)
      *a7 = 0;
    v26 = 0;
    +[ACDKeychain removeItemForServiceName:username:accessGroup:options:error:](ACDKeychain, "removeItemForServiceName:username:accessGroup:options:error:", v11, v12, v13, v14, &v26);
    v15 = v26;
    v16 = v15 == 0;
    _ACDKeychainLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v18)
        +[ACDKeychainManager _keychainLock_removeItemForService:username:accessGroup:options:error:].cold.1();

      if (!a7)
        goto LABEL_14;
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "code"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Unable to remove credential due to error %@"), v20);
      v17 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDB4200];
      v22 = *MEMORY[0x24BDD1398];
      v27[0] = *MEMORY[0x24BDD0FC8];
      v27[1] = v22;
      v28[0] = v17;
      v28[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v21, 14, v23);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (v18)
    {
      *(_DWORD *)buf = 138412802;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      v33 = 2112;
      v34 = v13;
      _os_log_debug_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_DEBUG, "Keychain item removal succeeded for item service:%@ username:%@ group:%@", buf, 0x20u);
    }

LABEL_14:
    goto LABEL_15;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

+ (void)_fallbackToUnsyncedOAuthTokens:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "oauthTokenNoSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v15, "credentialType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB41C0]) & 1) != 0)
    {
      objc_msgSend(v15, "oauthToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v15, "setOauthToken:", v5);
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v15, "credentialType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB41B8]) & 1) != 0)
    {
      objc_msgSend(v15, "oauthToken");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v15, "oauthTokenSecret");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_15;
      }
      else
      {

      }
      objc_msgSend(v5, "componentsSeparatedByString:", *MEMORY[0x24BDB4278]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") != 2)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychainManager.m"), 939, CFSTR("*** _fallbackToUnsyncedOAuthTokens: bad format"));

      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOauthToken:", v12);

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOauthTokenSecret:", v13);

    }
  }
LABEL_15:

}

+ (BOOL)createAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6
{
  return 0;
}

+ (BOOL)createAccountSyncMigratedItemWithError:(id *)a3
{
  return 0;
}

+ (BOOL)removeAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6
{
  return 0;
}

+ (id)removeTombstonesForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (BOOL)accountSyncMigrated
{
  return 1;
}

+ (id)accountSynciOSVersion
{
  return 0;
}

+ (id)keychainAccounts
{
  return 0;
}

+ (id)keychainHostnameAccounts
{
  return 0;
}

+ (id)keychainDeletedContactAccounts
{
  return 0;
}

+ (id)keychainDeletedAccounts
{
  return 0;
}

+ (id)keychainDeletedHostnameAccounts
{
  return 0;
}

+ (void)notifiyCredentialChangedForAccount:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialsDidChangeForAccount:", v3);

}

+ (void)credentialForAccount:clientID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "credentialForAccount is returning %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)credentialForAccount:clientID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "credentialForAccount encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)credentialForAccount:clientID:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Client %@ is asking for the credential for account %@");
  OUTLINED_FUNCTION_2();
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Credential fetch failed for UUID. Will try again with username instead of qualifiedUserName or UUID. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Credential fetch failed with primary id. Will try again with secondary id. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "ACDKeychainManager credentialForAccountWithID is returning %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20D8CB000, v0, v1, "No supported credential item keys for accountType: %@ credentialType: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "ACDKeychainManager is fetching credential for account %@ and client ID %@.");
  OUTLINED_FUNCTION_2();
}

+ (void)_setCredentialForAccount:(uint64_t)a3 clientID:(uint64_t)a4 handleCredentialItemRemovals:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "Finished setting account credential", a5, a6, a7, a8, 0);
}

+ (void)_setNonPersistentCredentialTimerForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Queuing non-persistent credential removal, account: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)removeCredentialForAccount:clientID:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v2 = 1026;
  v3 = 453;
  _os_log_debug_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d is returning", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

+ (void)removeCredentialForAccount:(uint64_t)a1 clientID:(uint64_t)a2 error:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136381443;
  v4 = "+[ACDKeychainManager removeCredentialForAccount:clientID:error:]";
  v5 = 1026;
  v6 = 432;
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)&v3, 0x26u);
}

+ (void)_removeCredentialsForAccount:clientID:options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Removing account credential for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Keychain fetch succeeded for item: %@.%@");
  OUTLINED_FUNCTION_2();
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Keychain fetch succeeded with empty results for item: %@.%@");
  OUTLINED_FUNCTION_2();
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Keychain fetch found no match for item: %@.%@");
  OUTLINED_FUNCTION_2();
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Keychain fetch denied for item: %@.%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Password/Token hasn't changed. Not updating keychain for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Keychain update succeeded for item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20D8CB000, v0, v1, "Keychain update failed with error: %@ for item: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Setting item accessibility to: %@ for serviceName: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "Unable to create SecAccessControlRef on item that requires Touch ID. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Keychain add succeeded for item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20D8CB000, v0, v1, "Keychain add failed with error: %@ for item: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_removeItemForService:(uint64_t)a3 username:(uint64_t)a4 accessGroup:(uint64_t)a5 options:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "_removeItemForService - Exit.", a5, a6, a7, a8, 0);
}

+ (void)_keychainLock_removeItemForService:username:accessGroup:options:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "Keychain item removal failed for item %@: %@");
  OUTLINED_FUNCTION_2();
}

@end
