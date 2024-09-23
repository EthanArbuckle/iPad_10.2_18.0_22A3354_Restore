@implementation AASignInOperationHelper

- (AASignInOperationHelper)init
{
  AASignInOperationHelper *v2;
  uint64_t v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AASignInOperationHelper;
  v2 = -[AASignInOperationHelper init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

  }
  return v2;
}

- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v9;

  if (a4)
  {
    v6 = a5;
    v7 = a3;
    +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:", v7, v6);

  }
  else
  {
    v7 = a5;
    v9 = a3;
    -[AASignInOperationHelper _saveAccount:completion:](self, "_saveAccount:completion:");
  }

}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  -[ACAccountStore saveAccount:withCompletionHandler:](self->_accountStore, "saveAccount:withCompletionHandler:", a3, a4);
}

- (void)_refreshEnabledDataclassesForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AASignInOperationHelper _refreshEnabledDataclassesForAccount:].cold.1((uint64_t)v3, v4);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledDataclassesForAccount:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__AASignInOperationHelper__refreshEnabledDataclassesForAccount___block_invoke;
  v8[3] = &unk_1E41713C8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __64__AASignInOperationHelper__refreshEnabledDataclassesForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:forDataclass:", 1, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)_refreshEnabledDataclassesForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "Refreshing enabled dataclasses for account: %@", (uint8_t *)&v2, 0xCu);
}

@end
