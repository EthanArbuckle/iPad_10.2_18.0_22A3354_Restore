@implementation AAUISignInOperationManager

- (AAUISignInOperationManager)init
{
  AAUISignInOperationManager *v2;
  id v3;
  uint64_t v4;
  ACUIAccountOperationsHelper *accountOperationsHelper;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISignInOperationManager;
  v2 = -[AAUISignInOperationManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF4F08]), "initWithAccountStore:", v3);
    accountOperationsHelper = v2->_accountOperationsHelper;
    v2->_accountOperationsHelper = (ACUIAccountOperationsHelper *)v4;

    -[ACUIAccountOperationsHelper setDelegate:](v2->_accountOperationsHelper, "setDelegate:", v2);
  }
  return v2;
}

- (AAUISignInOperationManager)initWithPresentingViewController:(id)a3
{
  id v4;
  AAUISignInOperationManager *v5;
  AAUISignInOperationManager *v6;

  v4 = a3;
  v5 = -[AAUISignInOperationManager init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "provisionedDataclasses");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[AAUISignInOperationManager enableDataclasses:forAccount:](self, "enableDataclasses:forAccount:", v9, v7);

  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Sign in operation about to call save, but not enabling dataclasses!", buf, 2u);
    }

    -[ACUIAccountOperationsHelper saveAccount:requireVerification:](self->_accountOperationsHelper, "saveAccount:requireVerification:", v7, 1);
  }
}

- (void)enableDataclasses:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to enable dataclasses (%@) for account (%@)", buf, 0x16u);
  }

  -[AAUISignInOperationManager _refreshEnabledDataclassesForAccount:](self, "_refreshEnabledDataclassesForAccount:", v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0CFAC30], "sharedManager", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "canAutoEnableDataclass:forAccount:", v14, v7);

        if (v16)
          objc_msgSend(v7, "setEnabled:forDataclass:", 1, v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[ACUIAccountOperationsHelper saveAccount:requireVerification:](self->_accountOperationsHelper, "saveAccount:requireVerification:", v7, 1);
}

- (void)_refreshEnabledDataclassesForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AAUISignInOperationManager _refreshEnabledDataclassesForAccount:].cold.2((uint64_t)v3, v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v5, "enabledDataclassesForAccount:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    objc_msgSend(v3, "setEnabledDataclasses:", v7);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUISignInOperationManager _refreshEnabledDataclassesForAccount:].cold.1(v8);

  }
}

- (void)_delegate_signInOperationManagerDidSaveAccount:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInOperationManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "signInOperationManager:didSaveAccount:error:", self, v8, v6);

}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ willSaveAccount: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v22 = v10;
    if (v7)
      v14 = CFSTR("YES");
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ didSaveAccount: %@ withSuccess: %@ error: %@", buf, 0x2Au);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__AAUISignInOperationManager_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  v17[3] = &unk_1EA2DC6F8;
  v20 = v7;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v15 = v12;
  v16 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

uint64_t __80__AAUISignInOperationManager_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
    v4 = *(_QWORD *)(a1 + 48);
  }
  return objc_msgSend(v3, "_delegate_signInOperationManagerDidSaveAccount:error:", v5, v4);
}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ willRemoveAccount: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  _AAUILogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    v14 = 138413058;
    v15 = v9;
    v16 = 2112;
    if (v7)
      v13 = CFSTR("YES");
    v17 = v10;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ didRemoveAccount: %@ withSuccess: %@ error: %@", (uint8_t *)&v14, 0x2Au);
  }

}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  dispatch_semaphore_t v17;
  _BYTE *v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "operationsHelper: %@ desiredDataclassActionFromPicker: %@", buf, 0x16u);
  }

  v9 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v10 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke;
  v15[3] = &unk_1EA2DC748;
  v15[4] = self;
  v16 = v7;
  v17 = v10;
  v18 = buf;
  v11 = v10;
  v12 = v7;
  dispatch_async(v9, v15);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v13 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_dataclassMergeActionPickerFromPicker:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke_2;
  v6[3] = &unk_1EA2DC720;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "_mainQueue_dataclassActionsForPicker:completion:", v3, v6);

}

void __80__AAUISignInOperationManager_operationsHelper_desiredDataclassActionFromPicker___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "User selected dataclass action: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_dataclassMergeActionPickerFromPicker:(id)a3
{
  id v3;
  AAUIDataclassMergeActionPicker *v4;
  AAUIDataclassMergeActionPicker *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasActionOfType:", 5)
    && !objc_msgSend(v3, "hasDestructiveActions"))
  {
    v5 = [AAUIDataclassMergeActionPicker alloc];
    objc_msgSend(v3, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "affectedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ACUIDataclassActionPicker initWithActions:affectingAccount:](v5, "initWithActions:affectingAccount:", v6, v7);

    objc_msgSend(v3, "affectedDataclasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACUIDataclassActionPicker setAffectedDataclasses:](v4, "setAffectedDataclasses:", v8);

    -[AAUIDataclassMergeActionPicker setPerformingBatchMerge:](v4, "setPerformingBatchMerge:", 1);
  }
  else
  {
    v4 = (AAUIDataclassMergeActionPicker *)v3;
  }

  return v4;
}

- (void)_mainQueue_dataclassActionsForPicker:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInOperationManager _alertControllerForPicker:completion:](self, "_alertControllerForPicker:completion:", v7, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

}

- (id)_alertControllerForPicker:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  _QWORD v26[6];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (void *)MEMORY[0x1E0DC3450];
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertWithTitle:message:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertWithTitle:message:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v5, "descriptionForDataclassAction:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isDestructive");
        v20 = (void *)MEMORY[0x1E0DC3448];
        if (v19)
          v21 = 2;
        else
          v21 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke;
        v26[3] = &unk_1EA2DC770;
        v26[4] = v17;
        v26[5] = self;
        v27 = v5;
        v28 = v6;
        objc_msgSend(v20, "actionWithTitle:style:handler:", v18, v21, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v22);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  return v12;
}

void __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "type"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "affectedDataclasses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "affectedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke_2;
    v5[3] = &unk_1EA2DB0E8;
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v2, "_disableDataclasses:forAccount:completion:", v3, v4, v5);

  }
}

void __67__AAUISignInOperationManager__alertControllerForPicker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 7);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_disableDataclasses:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "setEnabled:forDataclass:", 0, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }
  v9[2](v9);

}

- (AAUISignInOperationDelegate)delegate
{
  return (AAUISignInOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountOperationsHelper, 0);
}

- (void)_refreshEnabledDataclassesForAccount:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Failed to fetch persisted -enabledDataclasses, reusing cached value.", v1, 2u);
}

- (void)_refreshEnabledDataclassesForAccount:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Refreshing enabled dataclasses for account: %@", (uint8_t *)&v2, 0xCu);
}

@end
