@implementation ACDClientAuthorizationManager

- (ACDClientAuthorizationManager)initWithDatabaseConnection:(id)a3
{
  id v4;
  ACDClientAuthorizationManager *v5;
  ACDClientAuthorizationManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACDClientAuthorizationManager;
  v5 = -[ACDClientAuthorizationManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_databaseConnection, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseConnection);
}

void __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;

  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("bundleID == %@ AND accountType.identifier == %@"), v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  objc_msgSend(WeakRetained, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Authorization"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v6, v7);

  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && !*(_BYTE *)(a1 + 64))
    goto LABEL_11;
  v9 = -[ACDClientAuthorization initForClient:]([ACDClientAuthorization alloc], "initForClient:", *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(void **)(a1 + 48);
  objc_msgSend(v8, "grantedPermissions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setFromCSVString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setGrantedPermissions:", v14);

  objc_msgSend(v8, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setOptions:", v15);

  if (!+[ACDTCCUtilities TCCSupportedForAccountTypeID:](ACDTCCUtilities, "TCCSupportedForAccountTypeID:", *(_QWORD *)(a1 + 40)))
  {
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v16 = 1;
    goto LABEL_9;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v18, "deleteObject:", v8);

    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v19, "saveWithError:", 0);

LABEL_11:
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

    goto LABEL_12;
  }
  v16 = *(unsigned __int8 *)(a1 + 65);
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
LABEL_9:
  objc_msgSend(v17, "setIsGranted:", v16);
LABEL_12:

}

- (id)authorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  ACDClientAuthorizationManager *v23;
  _BYTE *v24;
  BOOL v25;
  BOOL v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager authorizationForClient:accountTypeWithIdentifier:].cold.1();

  objc_msgSend(v6, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"%@ has a nil bundle ID. Will not try to find ClientAuthorization.\", buf, 0xCu);
    }

    v15 = 0;
  }
  else
  {
    v11 = +[ACDTCCUtilities TCCStateForClient:accountTypeID:](ACDTCCUtilities, "TCCStateForClient:accountTypeID:", v6, v7);
    v12 = v11;
    if (v11)
    {
      v13 = v11 == 1;
    }
    else
    {
      _ACDLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "\"No TCC state found: %@, %@\", buf, 0x16u);
      }

      v13 = 0;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    v30 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
    objc_msgSend(WeakRetained, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke;
    v20[3] = &unk_24C7E3200;
    v21 = v6;
    v22 = v7;
    v23 = self;
    v25 = v12 != 0;
    v24 = buf;
    v26 = v13;
    objc_msgSend(v18, "performBlockAndWait:", v20);

    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  return v15;
}

- (id)authorizationForClient:(id)a3 accountType:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager authorizationForClient:accountTypeWithIdentifier:](self, "authorizationForClient:accountTypeWithIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)setAuthorization:(id)a3 forClient:(id)a4 onAccountType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  ACDClientAuthorizationManager *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _BYTE *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  const __CFString *v40;
  _BYTE buf[40];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136381699;
    *(_QWORD *)&buf[4] = "-[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:]";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = 102;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v8;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v9;
    *(_WORD *)&buf[38] = 2112;
    v42 = v11;
    _os_log_debug_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@, %@)", buf, 0x30u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__7;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__7;
  v42 = 0;
  objc_msgSend(v9, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    _ACDLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:].cold.1();

    v24 = 0;
  }
  else
  {
    if (+[ACDTCCUtilities TCCSupportedForAccountTypeID:](ACDTCCUtilities, "TCCSupportedForAccountTypeID:", v11)&& !+[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:](ACDTCCUtilities, "setTCCStateForClient:accountTypeID:toGranted:", v9, v11, objc_msgSend(v8, "isGranted")))
    {
      _ACDLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:].cold.3();

      v16 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = CFSTR("Setting TCC failed.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v18;

    }
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__7;
      v37[4] = __Block_byref_object_dispose__7;
      objc_msgSend(v8, "options");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__7;
      v35[4] = __Block_byref_object_dispose__7;
      objc_msgSend(v8, "grantedPermissions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDClientAuthorizationManager _csvStringFromSet:](self, "_csvStringFromSet:", v20);
      v36 = (id)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
      objc_msgSend(WeakRetained, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke;
      v27[3] = &unk_24C7E3228;
      v28 = v9;
      v29 = v11;
      v30 = self;
      v31 = v10;
      v32 = v35;
      v33 = v37;
      v34 = buf;
      objc_msgSend(v22, "performBlockAndWait:", v27);

      _Block_object_dispose(v35, 8);
      _Block_object_dispose(v37, 8);

    }
    _ACDLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ACDClientAuthorizationManager setAuthorization:forClient:onAccountType:].cold.2();

    v24 = *(id *)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);

  return v24;
}

void __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id obj;

  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("bundleID == %@ AND accountType.identifier == %@"), v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  objc_msgSend(WeakRetained, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Authorization"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  objc_msgSend(*(id *)(a1 + 56), "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForObjectURI:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v11, "insertNewObjectForEntityForName:", CFSTR("Authorization"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccountType:", v10);
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBundleID:", v12);

  }
  objc_msgSend(v7, "setGrantedPermissions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    objc_msgSend(v7, "setOptions:");
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v15 = *(_QWORD *)(a1 + 80);
  v14 = a1 + 80;
  v16 = *(_QWORD *)(v15 + 8);
  obj = *(id *)(v16 + 40);
  objc_msgSend(v13, "saveWithError:rollbackOnFailure:", &obj, 1);
  objc_storeStrong((id *)(v16 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v14 + 8) + 40))
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke_cold_1(v14);

  }
}

- (id)removeAuthorizationForClient:(id)a3 accountType:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:](self, "removeAuthorizationForClient:accountTypeWithIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removeAuthorizationForClient:(id)a3 accountTypeWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  ACDClientAuthorizationManager *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:].cold.3();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  if (+[ACDTCCUtilities TCCSupportedForAccountTypeID:](ACDTCCUtilities, "TCCSupportedForAccountTypeID:", v7)&& !+[ACDTCCUtilities clearTCCStateForClient:accountTypeID:](ACDTCCUtilities, "clearTCCStateForClient:accountTypeID:", v6, v7))
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:].cold.2();

    v10 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = CFSTR("Removing TCC state failed. God knows why.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25[5];
    v25[5] = v12;

  }
  if (!v25[5])
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
    objc_msgSend(WeakRetained, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke;
    v19[3] = &unk_24C7E25C0;
    v20 = v6;
    v21 = v7;
    v22 = self;
    v23 = &v24;
    objc_msgSend(v15, "performBlockAndWait:", v19);

  }
  _ACDLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager removeAuthorizationForClient:accountTypeWithIdentifier:].cold.1();

  v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("bundleID == %@ AND accountType.identifier == %@"), v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  objc_msgSend(WeakRetained, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Authorization"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
        objc_msgSend(v13, "deleteObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v16 = *(_QWORD *)(a1 + 56);
  v15 = a1 + 56;
  v17 = *(_QWORD *)(v16 + 8);
  obj = *(id *)(v17 + 40);
  objc_msgSend(v14, "saveWithError:rollbackOnFailure:", &obj, 1);
  objc_storeStrong((id *)(v17 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 40))
  {
    _ACDLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v15);

  }
}

- (id)allAuthorizationsForAccountType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:](self, "allAuthorizationsForAccountTypeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allAuthorizationsForAccountTypeWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  ACDClientAuthorizationManager *v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:].cold.2();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__7;
  v24[4] = __Block_byref_object_dispose__7;
  v25 = 0;
  +[ACDTCCUtilities allTCCStatesForAccountTypeID:](ACDTCCUtilities, "allTCCStatesForAccountTypeID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__ACDClientAuthorizationManager_allAuthorizationsForAccountTypeWithIdentifier___block_invoke;
  v18[3] = &unk_24C7E3250;
  v10 = v4;
  v23 = v24;
  v19 = v10;
  v20 = self;
  v11 = v7;
  v21 = v11;
  v12 = v6;
  v22 = v12;
  objc_msgSend(v9, "performBlockAndWait:", v18);

  _ACDLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:].cold.1(v14, buf, (uint64_t)v10, v13);
  }

  v15 = v22;
  v16 = v12;

  _Block_object_dispose(v24, 8);
  return v16;
}

void __79__ACDClientAuthorizationManager_allAuthorizationsForAccountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  ACDClientAuthorization *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier == %@"), *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v24 = (void *)v2;
  objc_msgSend(WeakRetained, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Authorization"), v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [ACDClientAuthorization alloc];
        +[ACDClient clientWithBundleID:](ACDClient, "clientWithBundleID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ACDClientAuthorization initForClient:](v13, "initForClient:", v14);

        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = objc_msgSend(v16, "BOOLValue");
        }
        else
        {
          _ACDLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v12;
            _os_log_debug_impl(&dword_20D8CB000, v19, OS_LOG_TYPE_DEBUG, "\"No match found in TCC for bundleID: %@ - setting isGranted to TRUE\", buf, 0xCu);
          }

          v18 = 1;
        }
        objc_msgSend(v15, "setIsGranted:", v18);
        v20 = *(void **)(a1 + 40);
        objc_msgSend(v11, "grantedPermissions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_setFromCSVString:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setGrantedPermissions:", v22);

        objc_msgSend(v11, "options");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setOptions:", v23);

        objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

}

- (id)removeAllClientAuthorizationsForAccountType:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager removeAllClientAuthorizationsForAccountTypeWithIdentifier:](self, "removeAllClientAuthorizationsForAccountTypeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)removeAllClientAuthorizationsForAccountTypeWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ACDClientAuthorizationManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager removeAllClientAuthorizationsForAccountTypeWithIdentifier:].cold.2();

  +[ACDTCCUtilities clearAllTCCStatesForAccountTypeID:](ACDTCCUtilities, "clearAllTCCStatesForAccountTypeID:", v4);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnection);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__ACDClientAuthorizationManager_removeAllClientAuthorizationsForAccountTypeWithIdentifier___block_invoke;
  v12[3] = &unk_24C7E20E0;
  v8 = v4;
  v13 = v8;
  v14 = self;
  v15 = &v16;
  objc_msgSend(v7, "performBlockAndWait:", v12);

  _ACDLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACDClientAuthorizationManager removeAllClientAuthorizationsForAccountTypeWithIdentifier:].cold.1();

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __91__ACDClientAuthorizationManager_removeAllClientAuthorizationsForAccountTypeWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier == %@"), a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  objc_msgSend(WeakRetained, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Authorization"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = objc_loadWeakRetained((id *)(a1[5] + 8));
        objc_msgSend(v11, "deleteObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = objc_loadWeakRetained((id *)(a1[5] + 8));
  v14 = a1[6];
  v13 = (uint64_t)(a1 + 6);
  v15 = *(_QWORD *)(v14 + 8);
  obj = *(id *)(v15 + 40);
  objc_msgSend(v12, "saveWithError:rollbackOnFailure:", &obj, 1);
  objc_storeStrong((id *)(v15 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 40))
  {
    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(v13);

  }
}

- (id)_csvStringFromSet:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_24C7E3E98;
  }

  return v5;
}

- (id)_setFromCSVString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)authorizationForClient:accountTypeWithIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

void __82__ACDClientAuthorizationManager_authorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "\"Found %@ Authorization entities in DB. Taking the last one.\", v4, 0xCu);

  OUTLINED_FUNCTION_14();
}

- (void)setAuthorization:forClient:onAccountType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"Client (%@) with no bundle ID passed to setAccessGranted! Ignoring...\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)setAuthorization:forClient:onAccountType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Exiting - setAuthorizationForClient: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setAuthorization:forClient:onAccountType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"Failed to set TCC state for: %@\", v2);
  OUTLINED_FUNCTION_2();
}

void __74__ACDClientAuthorizationManager_setAuthorization_forClient_onAccountType___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7_1(a1), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_5(&dword_20D8CB000, v2, v3, "\"Could not save new Authorization entity: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Exiting - removeAuthorizationForClient: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Failed to clear TCC state for %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAuthorizationForClient:accountTypeWithIdentifier:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

void __88__ACDClientAuthorizationManager_removeAuthorizationForClient_accountTypeWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7_1(a1), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_5(&dword_20D8CB000, v2, v3, "\"Could not delete Authorization entities: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)allAuthorizationsForAccountTypeWithIdentifier:(uint64_t)a3 .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "\"Exiting - allAuthorizationsForAccountType: %@ found %@ results.\", buf, 0x16u);

}

- (void)allAuthorizationsForAccountTypeWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)removeAllClientAuthorizationsForAccountTypeWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Exiting - removeAllClientAuthorizationsForAccountType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllClientAuthorizationsForAccountTypeWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

@end
