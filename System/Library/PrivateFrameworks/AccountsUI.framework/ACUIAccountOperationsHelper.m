@implementation ACUIAccountOperationsHelper

- (ACUIAccountOperationsHelper)initWithAccountStore:(id)a3
{
  ACUIAccountOperationsHelper *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accountOperationsQueue;
  ACUIAccountOperationsHelper *v7;
  NSObject *v8;
  objc_super v9;
  id location[2];
  ACUIAccountOperationsHelper *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ACUIAccountOperationsHelper;
  v11 = -[ACUIAccountOperationsHelper init](&v9, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountStore, location[0]);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.acountsui.operations", v8);
    accountOperationsQueue = v11->_accountOperationsQueue;
    v11->_accountOperationsQueue = (OS_dispatch_queue *)v4;

  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (id)dataclassActionsForAccountSave:(id)a3 forDataclass:(id)a4 error:(id *)a5
{
  ACAccountStore *accountStore;
  id v6;
  id v8;
  ACUIAccountOperationsDelegate *v9;
  id v12;
  ACUIAccountOperationsDelegate *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  id location[2];
  ACUIAccountOperationsHelper *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v18 = 0;
  accountStore = v22->_accountStore;
  v16 = 0;
  v12 = (id)-[ACAccountStore dataclassActionsForAccountSave:error:](accountStore, "dataclassActionsForAccountSave:error:", location[0], &v16);
  objc_storeStrong(&v18, v16);
  v17 = v12;
  v15 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", v20);
  v13 = -[ACUIAccountOperationsHelper delegate](v22, "delegate");
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v9 = -[ACUIAccountOperationsHelper delegate](v22, "delegate");
    -[ACUIAccountOperationsDelegate operationsHelper:didLoadSaveActions:forDataclass:withAccount:error:](v9, "operationsHelper:didLoadSaveActions:forDataclass:withAccount:error:", v22, v15, v20, location[0], v18);

  }
  if (v19)
  {
    v6 = objc_retainAutorelease(v18);
    *v19 = v6;
  }
  v8 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)saveAccount:(id)a3
{
  id location[2];
  ACUIAccountOperationsHelper *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIAccountOperationsHelper saveAccount:requireVerification:](v4, "saveAccount:requireVerification:", location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4
{
  id location[2];
  ACUIAccountOperationsHelper *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:](v6, "saveAccount:requireVerification:completion:", location[0], a4, 0);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4 completion:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  ACUIAccountOperationsHelper *v14;
  id v15;
  BOOL v16;
  id v17;
  BOOL v18;
  id location[2];
  ACUIAccountOperationsHelper *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = v20->_accountOperationsQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke;
  v12 = &unk_1E9A15428;
  v13 = location[0];
  v14 = v20;
  v16 = v18;
  v15 = v17;
  dispatch_async(queue, &v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *queue;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  os_log_type_t v23;
  os_log_t oslog;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, char, id);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  os_log_type_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  os_log_type_t v41;
  id location[3];
  uint8_t v43[32];
  uint8_t v44[48];
  uint8_t v45[40];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = _ACUILogSystem();
  v41 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v45, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke", 64, *(_QWORD *)(a1 + 32));
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)location[0], v41, "%s (%d) \"Starting account save for %@...\", v45, 0x1Cu);
  }
  objc_storeStrong(location, 0);
  objc_msgSend(*(id *)(a1 + 40), "setIsSavingAccount:", 1);
  v40 = 0;
  v1 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_QWORD *)(a1 + 32);
  v38 = 0;
  v14 = (id)objc_msgSend(v1, "dataclassActionsForAccountSave:error:", v2, &v38);
  objc_storeStrong(&v40, v38);
  v39 = v14;
  v37 = 0;
  if (!v40)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v36 = 0;
    v13 = (id)objc_msgSend(v3, "_desiredDataclassActionsFromPossibleActions:forAccount:withError:", v39, v4, &v36);
    objc_storeStrong(&v40, v36);
    v5 = v37;
    v37 = v13;

  }
  v12 = (id)objc_msgSend(*(id *)(a1 + 40), "delegate");
  objc_msgSend(v12, "operationsHelper:willSaveAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  if (v37)
  {
    v35 = _ACUILogSystem();
    v34 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v44, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke", 78, (uint64_t)v37, *(_QWORD *)(a1 + 32));
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v35, v34, "%s (%d) \"Saving dataclass actions %{public}@ for account %@.\", v44, 0x26u);
    }
    objc_storeStrong(&v35, 0);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v37;
    v10 = *(_BYTE *)(a1 + 56);
    v25 = MEMORY[0x1E0C809B0];
    v26 = -1073741824;
    v27 = 0;
    v28 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_3;
    v29 = &unk_1E9A153D8;
    v30 = *(id *)(a1 + 40);
    v31 = *(id *)(a1 + 32);
    v33 = *(id *)(a1 + 48);
    v32 = v40;
    objc_msgSend(v11, "saveAccount:withDataclassActions:doVerify:completion:", v8, v9, v10 & 1, &v25);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setIsSavingAccount:", 0);
    oslog = (os_log_t)_ACUILogSystem();
    v23 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v43, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke_3", 90, *(_QWORD *)(a1 + 32));
      _os_log_debug_impl(&dword_1D573D000, oslog, v23, "%s (%d) \"Account save cancelled for %@\", v43, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "delegate");
    objc_msgSend(v7, "operationsHelper:didSaveAccount:withSuccess:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, v40);

    if (*(_QWORD *)(a1 + 48))
    {
      queue = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C809B0];
      v17 = -1073741824;
      v18 = 0;
      v19 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_7;
      v20 = &unk_1E9A15400;
      v22 = *(id *)(a1 + 48);
      v21 = v40;
      dispatch_async(queue, &v16);

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
}

void __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_3(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  id v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  id location;
  char v16;
  uint64_t v17;

  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14 = a1;
  objc_msgSend(*(id *)(a1 + 32), "setIsSavingAccount:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v4, "operationsHelper:didSaveAccount:withSuccess:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v16 & 1, location);

  if (*(_QWORD *)(a1 + 56))
  {
    queue = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_2;
    v10 = &unk_1E9A153B0;
    v12 = *(id *)(a1 + 56);
    v13 = v16 & 1;
    v11 = *(id *)(a1 + 48);
    dispatch_async(queue, &v6);

    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

uint64_t __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4
{
  id v5;
  id location[2];
  ACUIAccountOperationsHelper *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[ACUIAccountOperationsHelper saveAccount:withDataclassActions:requireVerification:](v7, "saveAccount:withDataclassActions:requireVerification:", location[0], v5, 1);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5
{
  id v7;
  id location[2];
  ACUIAccountOperationsHelper *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  -[ACUIAccountOperationsHelper saveAccount:withDataclassActions:requireVerification:completion:](v9, "saveAccount:withDataclassActions:requireVerification:completion:", location[0], v7, a5, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5 completion:(id)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  ACUIAccountOperationsHelper *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  BOOL v21;
  id v22;
  id location[2];
  ACUIAccountOperationsHelper *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = a5;
  v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = v24->_accountOperationsQueue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke;
  v14 = &unk_1E9A15478;
  v15 = v24;
  v16 = location[0];
  v17 = v22;
  v19 = v21;
  v18 = v20;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, char, id);
  void *v11;
  id v12;
  id v13;
  id v14;
  os_log_type_t v15;
  id location[3];
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  location[2] = (id)a1;
  location[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setIsSavingAccount:", 1);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v6, "operationsHelper:willSaveAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  location[0] = _ACUILogSystem();
  v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v17, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:withDataclassActions:requireVerification:completion:]_block_invoke", 115, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)location[0], v15, "%s (%d) \"Saving dataclass actions %{public}@ for account %@\", v17, 0x26u);
  }
  objc_storeStrong(location, 0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_BYTE *)(a1 + 64);
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_8;
  v11 = &unk_1E9A15450;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v4, "saveAccount:withDataclassActions:doVerify:completion:", v1, v2, v3 & 1, &v7);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
}

void __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_8(uint64_t a1, char a2, id obj)
{
  NSObject *queue;
  id v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  id location;
  char v16;
  uint64_t v17;

  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14 = a1;
  objc_msgSend(*(id *)(a1 + 32), "setIsSavingAccount:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v4, "operationsHelper:didSaveAccount:withSuccess:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v16 & 1, location);

  if (*(_QWORD *)(a1 + 48))
  {
    queue = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_2;
    v10 = &unk_1E9A153B0;
    v12 = *(id *)(a1 + 48);
    v13 = v16 & 1;
    v11 = location;
    dispatch_async(queue, &v6);

    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)removeAccount:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  ACUIAccountOperationsHelper *v9;
  id v10;
  id location[2];
  ACUIAccountOperationsHelper *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_accountOperationsQueue;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke;
  v8 = &unk_1E9A15508;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  id v14;
  BOOL v15;
  char v16;
  id v17;
  char v18;
  NSObject *v19;
  id v21;
  NSObject *v22;
  char IsSyncable;
  os_log_t oslog;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, char, id);
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, char, id);
  void *v36;
  id v37;
  id v38;
  id v39;
  os_log_type_t v40;
  id location;
  uint64_t v42;
  char v43;
  id v44;
  char v45;
  char v46;
  id v47;
  char v48;
  id v49;
  char v50;
  id v51[3];
  uint8_t v52[32];
  uint8_t v53[40];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v51[2] = a1;
  v51[1] = a1;
  objc_msgSend(a1[4], "setIsRemovingAccount:", 1);
  v21 = (id)MEMORY[0x1E0C80D38];
  v19 = MEMORY[0x1E0C80D38];
  dispatch_sync(v19, &__block_literal_global_3);

  v51[0] = (id)objc_msgSend(*((id *)a1[4] + 1), "dataclassActionsForAccountDeletion:", a1[5]);
  v22 = v21;
  dispatch_sync(v22, &__block_literal_global_9);

  v50 = 0;
  v48 = 0;
  IsSyncable = 0;
  if ((ACDAccountSyncEnabled() & 1) != 0)
  {
    v49 = (id)ACDAccountSyncDevices();
    v48 = 1;
    IsSyncable = 0;
    if (objc_msgSend(v49, "count"))
      IsSyncable = ACDAccountSyncAccountIsSyncable();
  }
  if ((v48 & 1) != 0)

  v50 = IsSyncable & 1;
  v47 = 0;
  if ((IsSyncable & 1) != 0)
    v1 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  else
    v1 = (id)objc_msgSend(a1[4], "_desiredDataclassActionsFromPossibleActions:forAccount:withError:", v51[0], a1[5], 0);
  v2 = v47;
  v47 = v1;

  if (v47)
  {
    v46 = 1;
    v45 = 0;
    v17 = (id)objc_msgSend(a1[4], "delegate");
    v43 = 0;
    v18 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = 1;
      if ((v50 & 1) != 0)
      {
        v15 = 1;
        if ((objc_msgSend(a1[5], "isActive") & 1) != 0)
        {
          v44 = (id)objc_msgSend(a1[5], "enabledDataclasses");
          v43 = 1;
          v15 = objc_msgSend(v44, "count") == 0;
        }
        v16 = v15;
      }
      v18 = v16;
    }
    if ((v43 & 1) != 0)

    if ((v18 & 1) != 0)
    {
      v14 = (id)objc_msgSend(a1[4], "delegate");
      v46 = objc_msgSend(v14, "operationsHelper:shouldRemoveAccount:", a1[4], a1[5]) & 1;

      goto LABEL_28;
    }
    v12 = (id)objc_msgSend(a1[4], "delegate");
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v42 = 0;
      v10 = (id)objc_msgSend(a1[4], "delegate");
      v11 = objc_msgSend(v10, "operationsHelper:shouldRemoveOrDisableAccount:", a1[4], a1[5]);

      v42 = v11;
      location = _ACUILogSystem();
      v40 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v53, (uint64_t)"-[ACUIAccountOperationsHelper removeAccount:]_block_invoke", 167, (uint64_t)v9);
        _os_log_debug_impl(&dword_1D573D000, (os_log_t)location, v40, "%s (%d) \"The button index came back with response - %@\", v53, 0x1Cu);

      }
      objc_storeStrong(&location, 0);
      if (v42 == 1)
      {
        v46 = 0;
        v45 = 1;
      }
      else if (v42 == 2)
      {
        v46 = 1;
        goto LABEL_28;
      }
      v46 = 0;
    }
LABEL_28:
    if ((v46 & 1) != 0)
    {
      v8 = (id)objc_msgSend(a1[4], "delegate");
      objc_msgSend(v8, "operationsHelper:willRemoveAccount:", a1[4], a1[5]);

      v32 = MEMORY[0x1E0C809B0];
      v33 = -1073741824;
      v34 = 0;
      v35 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_15;
      v36 = &unk_1E9A154E0;
      v37 = a1[4];
      v38 = a1[5];
      v39 = (id)MEMORY[0x1D8277444](&v32);
      objc_msgSend(*((id *)a1[4] + 1), "removeAccount:withDataclassActions:completion:", a1[5], v47, v39);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v37, 0);
    }
    else if ((v45 & 1) != 0)
    {
      objc_msgSend(a1[4], "setIsRemovingAccount:", 0);
      objc_msgSend(a1[4], "setIsSavingAccount:", 1);
      v4 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      objc_msgSend(a1[5], "setEnabledDataclasses:");

      objc_msgSend(a1[5], "setActive:", 0);
      v5 = (id)objc_msgSend(a1[4], "delegate");
      objc_msgSend(v5, "operationsHelper:willSaveAccount:", a1[4], a1[5]);

      v7 = (void *)*((_QWORD *)a1[4] + 1);
      v6 = a1[5];
      v25 = MEMORY[0x1E0C809B0];
      v26 = -1073741824;
      v27 = 0;
      v28 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2_17;
      v29 = &unk_1E9A154E0;
      v30 = a1[4];
      v31 = a1[5];
      objc_msgSend(v7, "saveVerifiedAccount:withCompletionHandler:", v6, &v25);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      oslog = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (id)objc_msgSend(a1[5], "identifier");
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v52, (uint64_t)"-[ACUIAccountOperationsHelper removeAccount:]_block_invoke_3", 202, (uint64_t)v3);
        _os_log_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"ACUIAccountOperationsDelegate canceled the removal of account %@.\", v52, 0x1Cu);

      }
      objc_storeStrong((id *)&oslog, 0);
      objc_msgSend(a1[4], "setIsRemovingAccount:", 0);
    }
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v51, 0);
}

uint64_t __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginIgnoringInteractionEvents", a1, a1);
}

uint64_t __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "endIgnoringInteractionEvents", a1, a1);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_15(uint64_t a1, char a2, id obj)
{
  id v4;
  id location;
  char v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  objc_msgSend(*(id *)(a1 + 32), "setIsRemovingAccount:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v4, "operationsHelper:didRemoveAccount:withSuccess:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6 & 1, location);

  if ((v6 & 1) != 0)
    ACDAccountSyncMarkAccountDeleted();
  objc_storeStrong(&location, 0);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2_17(uint64_t a1, char a2, id obj)
{
  id v4;
  id location;
  char v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  objc_msgSend(*(id *)(a1 + 32), "setIsSavingAccount:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v4, "operationsHelper:didSaveAccount:withSuccess:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6 & 1, location);

  objc_storeStrong(&location, 0);
}

- (id)_desiredDataclassActionsFromPossibleActions:(id)a3 forAccount:(id)a4 withError:(id *)a5
{
  ACUIDataclassActionPicker *v5;
  id v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  ACUIAccountOperationsDelegate *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v32;
  uint64_t v33;
  _QWORD v34[8];
  uint64_t v35;
  int v36;
  id v37;
  _QWORD v38[8];
  id v39;
  char v40;
  ACUIDataclassActionPicker *v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(_QWORD *, void *, void *, void *);
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD __b[8];
  uint64_t v53;
  id v54;
  id v55;
  id *v56;
  id v57;
  id location[2];
  ACUIAccountOperationsHelper *v59;
  id v60;
  uint64_t v61;
  const __CFString *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = 0;
  objc_storeStrong(&v57, a4);
  v56 = a5;
  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v32 = (id)objc_msgSend(location[0], "allKeys");
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v65, 16);
  if (v33)
  {
    v27 = *(_QWORD *)__b[2];
    v28 = 0;
    v29 = v33;
    while (1)
    {
      v26 = v28;
      if (*(_QWORD *)__b[2] != v27)
        objc_enumerationMutation(v32);
      v53 = *(_QWORD *)(__b[1] + 8 * v28);
      v51 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", v53);
      if (objc_msgSend(v51, "count") == 1)
      {
        v24 = v55;
        v25 = (id)objc_msgSend(v51, "lastObject");
        objc_msgSend(v24, "setObject:forKey:");

      }
      else
      {
        v50 = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v51);
        v23 = v54;
        v43 = MEMORY[0x1E0C809B0];
        v44 = -1073741824;
        v45 = 0;
        v46 = __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke;
        v47 = &unk_1E9A15530;
        v48 = v50;
        v49 = (id)objc_msgSend(v23, "indexesOfObjectsPassingTest:", &v43);
        if (objc_msgSend(v49, "count"))
        {
          v42 = (id)objc_msgSend(v54, "objectAtIndexedSubscript:", objc_msgSend(v49, "lastIndex"));
          objc_msgSend(v42, "addAffectedDataclass:", v53);
          objc_storeStrong(&v42, 0);
        }
        else
        {
          v5 = [ACUIDataclassActionPicker alloc];
          v41 = -[ACUIDataclassActionPicker initWithActions:affectingAccount:](v5, "initWithActions:affectingAccount:", v51, v57);
          -[ACUIDataclassActionPicker addAffectedDataclass:](v41, "addAffectedDataclass:", v53);
          objc_msgSend(v54, "addObject:", v41);
          objc_storeStrong((id *)&v41, 0);
        }
        objc_storeStrong(&v49, 0);
        objc_storeStrong(&v48, 0);
        objc_storeStrong(&v50, 0);
      }
      objc_storeStrong(&v51, 0);
      ++v28;
      if (v26 + 1 >= v29)
      {
        v28 = 0;
        v29 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v65, 16);
        if (!v29)
          break;
      }
    }
  }

  objc_msgSend(v54, "sortUsingComparator:", &__block_literal_global_25_0);
  v40 = 0;
  memset(v38, 0, sizeof(v38));
  v21 = v54;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v38, v64, 16);
  if (v22)
  {
    v18 = *(_QWORD *)v38[2];
    v19 = 0;
    v20 = v22;
    while (1)
    {
      v17 = v19;
      if (*(_QWORD *)v38[2] != v18)
        objc_enumerationMutation(v21);
      v39 = *(id *)(v38[1] + 8 * v19);
      v16 = -[ACUIAccountOperationsHelper delegate](v59, "delegate");
      v37 = (id)-[ACUIAccountOperationsDelegate operationsHelper:desiredDataclassActionFromPicker:](v16, "operationsHelper:desiredDataclassActionFromPicker:", v59, v39);

      if (objc_msgSend(v37, "type"))
      {
        memset(v34, 0, sizeof(v34));
        v14 = (id)objc_msgSend(v39, "affectedDataclasses");
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v34, v63, 16);
        if (v15)
        {
          v11 = *(_QWORD *)v34[2];
          v12 = 0;
          v13 = v15;
          while (1)
          {
            v10 = v12;
            if (*(_QWORD *)v34[2] != v11)
              objc_enumerationMutation(v14);
            v35 = *(_QWORD *)(v34[1] + 8 * v12);
            objc_msgSend(v55, "setObject:forKey:", v37, v35);
            ++v12;
            if (v10 + 1 >= v13)
            {
              v12 = 0;
              v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v34, v63, 16);
              if (!v13)
                break;
            }
          }
        }

        v36 = 0;
      }
      else
      {
        v40 = 1;
        v36 = 4;
      }
      objc_storeStrong(&v37, 0);
      if (v36)
        break;
      ++v19;
      if (v17 + 1 >= v20)
      {
        v19 = 0;
        v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v38, v64, 16);
        if (!v20)
          goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    v36 = 0;
  }

  if ((v40 & 1) == 1)
  {
    if (v56)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      v62 = CFSTR("User canceled.");
      v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v6 = (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accountsui"), 0);
      *v56 = v6;

    }
    v60 = 0;
    v36 = 1;
  }
  else
  {
    v60 = v55;
    v36 = 1;
  }
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
  return v60;
}

uint64_t __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  char v10;
  id v11[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[3] = a3;
  v11[2] = a4;
  v11[1] = a1;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = (id)objc_msgSend(location[0], "actions");
  v11[0] = (id)objc_msgSend(v7, "setWithArray:");

  v10 = objc_msgSend(v11[0], "isEqualToSet:", a1[4]);
  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

uint64_t __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id location[2];
  uint64_t v9;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6 = objc_msgSend(location[0], "priorityIndex");
  v5 = objc_msgSend(v7, "priorityIndex");
  if (v6 <= v5)
    v9 = v6 < v5;
  else
    v9 = -1;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (ACUIAccountOperationsDelegate)delegate
{
  return (ACUIAccountOperationsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isRemovingAccount
{
  return self->_isRemovingAccount;
}

- (void)setIsRemovingAccount:(BOOL)a3
{
  self->_isRemovingAccount = a3;
}

- (BOOL)isSavingAccount
{
  return self->_isSavingAccount;
}

- (void)setIsSavingAccount:(BOOL)a3
{
  self->_isSavingAccount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountOperationsQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
