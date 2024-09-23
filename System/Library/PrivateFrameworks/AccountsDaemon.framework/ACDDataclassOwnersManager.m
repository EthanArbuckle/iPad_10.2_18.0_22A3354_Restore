@implementation ACDDataclassOwnersManager

- (ACDDataclassOwnersManager)init
{
  ACDDataclassOwnersManager *v2;
  NSLock *v3;
  NSLock *connectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDDataclassOwnersManager;
  v2 = -[ACDDataclassOwnersManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

  }
  return v2;
}

- (void)preloadDataclassOwnersWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke;
  v9[3] = &unk_24C7E35E8;
  v9[4] = &v10;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_1;
  v8[3] = &unk_24C7E35E8;
  v8[4] = &v10;
  objc_msgSend(v6, "preloadDataclassOwnersWithCompletion:", v8);
  if (a3)
  {
    v7 = (void *)v11[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_1(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke_2;
  v8[3] = &unk_24C7E3650;
  v8[4] = &v9;
  objc_msgSend(v6, "isPerformingDataclassActionsForAccount:completion:", v4, v8);
  LOBYTE(v5) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

void __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

}

uint64_t __68__ACDDataclassOwnersManager_isPerformingDataclassActionsForAccount___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke;
  v17[3] = &unk_24C7E35E8;
  v17[4] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke_4;
  v16[3] = &unk_24C7E3678;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForAddingAccount:affectingDataclass:completion:", v8, v9, v16);
  if (a5)
  {
    v13 = (void *)v25[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __82__ACDDataclassOwnersManager_actionsForAddingAccount_affectingDataclass_withError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke;
  v17[3] = &unk_24C7E35E8;
  v17[4] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke_6;
  v16[3] = &unk_24C7E3678;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForDeletingAccount:affectingDataclass:completion:", v8, v9, v16);
  if (a5)
  {
    v13 = (void *)v25[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __84__ACDDataclassOwnersManager_actionsForDeletingAccount_affectingDataclass_withError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke;
  v17[3] = &unk_24C7E35E8;
  v17[4] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke_7;
  v16[3] = &unk_24C7E3678;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForEnablingDataclass:onAccount:completion:", v8, v9, v16);
  if (a5)
  {
    v13 = (void *)v25[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __77__ACDDataclassOwnersManager_actionsForEnablingDataclass_onAccount_withError___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke;
  v17[3] = &unk_24C7E35E8;
  v17[4] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke_8;
  v16[3] = &unk_24C7E3678;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForDisablingDataclass:onAccount:completion:", v8, v9, v16);
  if (a5)
  {
    v13 = (void *)v25[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __78__ACDDataclassOwnersManager_actionsForDisablingDataclass_onAccount_withError___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__10;
    v24 = __Block_byref_object_dispose__10;
    v25 = 0;
    -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection](self, "_dataclassOwnersManagerConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke;
    v19[3] = &unk_24C7E35E8;
    v19[4] = &v20;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke_9;
    v18[3] = &unk_24C7E36A0;
    v18[4] = &v26;
    v18[5] = &v20;
    objc_msgSend(v15, "performDataclassActions:forAccount:withChildren:completion:", v10, v11, v12, v18);
    if (a6)
      *a6 = objc_retainAutorelease((id)v21[5]);
    v16 = *((_BYTE *)v27 + 24) != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

void __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __87__ACDDataclassOwnersManager_performDataclassActions_forAccount_withChildren_withError___block_invoke_9(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)_dataclassOwnersManagerConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;

  -[NSLock lock](self->_connectionLock, "lock");
  if (!self->_connection)
  {
    _ACDLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ACDDataclassOwnersManager _dataclassOwnersManagerConnection].cold.1(v3);

    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.accounts.dom"));
    connection = self->_connection;
    self->_connection = v4;

    +[ACDDataclassOwnersManagerInterface XPCInterface](ACDDataclassOwnersManagerInterface, "XPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_14);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_16);
    -[NSXPCConnection resume](self->_connection, "resume");
  }
  -[NSLock unlock](self->_connectionLock, "unlock");
  return self->_connection;
}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_cold_1(v0);

}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_15()
{
  NSObject *v0;
  uint8_t v1[16];

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_DEFAULT, "\"Connection to remote DOM closed.\", v1, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __61__ACDDataclassOwnersManager_preloadDataclassOwnersWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Remote dataclass owners manager returned an error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_dataclassOwnersManagerConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "\"Client DOM is connecting to remote service.\", v1, 2u);
}

void __62__ACDDataclassOwnersManager__dataclassOwnersManagerConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"Connection to remote DOM interrupted!\", v1, 2u);
}

@end
