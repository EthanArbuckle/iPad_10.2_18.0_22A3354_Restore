@implementation MFAccountStore

- (id)accountsWithTypeIdentifiers:(id)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v7 = (void *)-[ACAccountStore accountsWithAccountTypeIdentifiers:error:](self->_accountStore, "accountsWithAccountTypeIdentifiers:error:", a3, &v21);
  if (v21)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MFAccountStore accountsWithTypeIdentifiers:error:].cold.1(a3, &v21, v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (!v9)
  {
    v11 = 0;
    if (!a4)
      return v11;
    goto LABEL_16;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v7);
      v14 = -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), objc_msgSend((id)objc_opt_class(), "_shouldUpdateAccountsInPlace"));
      if (v14)
      {
        v15 = v14;
        if (!v11)
          v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        objc_msgSend(v11, "addObject:", v15);
      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  }
  while (v10);
  if (a4)
LABEL_16:
    *a4 = v21;
  return v11;
}

- (id)_accountWithPersistentAccount:(id)a3 useExisting:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  NSObject *v8;
  id v9;

  if (!a3)
    return 0;
  v4 = a4;
  v9 = 0;
  v6 = +[MFAccountLoader accountClassForPersistentAccount:error:](MFAccountLoader, "accountClassForPersistentAccount:error:", a3, &v9);
  if (v6)
    return (id)objc_msgSend((id)objc_opt_class(), "_accountWithAccountClass:persistentAccount:useExisting:", v6, a3, v4);
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MFAccountStore _accountWithPersistentAccount:useExisting:].cold.1(a3, &v9);
  return 0;
}

+ (id)_accountWithAccountClass:(Class)a3 persistentAccount:(id)a4 useExisting:(BOOL)a5
{
  uint64_t v7;
  void *v8;

  if (!a5)
    return (id)objc_msgSend([a3 alloc], "initWithPersistentAccount:", a4);
  v7 = -[objc_class existingAccountForUniqueID:](a3, "existingAccountForUniqueID:", objc_msgSend(a4, "identifier"));
  if (!v7)
    return (id)objc_msgSend([a3 alloc], "initWithPersistentAccount:", a4);
  v8 = (void *)v7;
  if ((Class)objc_opt_class() == a3)
    objc_msgSend(v8, "setPersistentAccount:", a4);
  return v8;
}

+ (BOOL)_shouldUpdateAccountsInPlace
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("MFUpdateAccountsInPlaceKey"));
  if (!v2)
    return objc_msgSend((id)MFUserAgent(), "isMobileMail");
  v3 = (void *)v2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

- (id)supportedDataclassesWithAccountTypeIdentifier:(id)a3
{
  if (a3)
    return (id)objc_msgSend((id)-[ACAccountType supportedDataclasses](-[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:"), "supportedDataclasses"), "allObjects");
  else
    return 0;
}

- (id)newPersistentAccountWithAccountTypeIdentifier:(id)a3
{
  ACAccountType *v4;
  NSObject *v6;

  if (a3)
  {
    v4 = -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:");
    if (v4)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v4);
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MFAccountStore newPersistentAccountWithAccountTypeIdentifier:].cold.1((uint64_t)a3, v6);
  }
  return 0;
}

+ (id)sharedAccountStore
{
  if (sharedAccountStore_onceToken != -1)
    dispatch_once(&sharedAccountStore_onceToken, &__block_literal_global_9);
  return (id)sharedAccountStore_sAccountStore;
}

- (MFAccountStore)init
{
  MFAccountStore *v2;
  MFAccountStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFAccountStore;
  v2 = -[MFAccountStore init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accountStoreLock._os_unfair_lock_opaque = 0;
    -[MFAccountStore setPersistentStore:](v2, "setPersistentStore:", objc_alloc_init(MEMORY[0x1E0C8F2B8]));
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MFAccountStore setPersistentStore:](self, "setPersistentStore:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFAccountStore;
  -[MFAccountStore dealloc](&v3, sel_dealloc);
}

MFAccountStore *__36__MFAccountStore_sharedAccountStore__block_invoke()
{
  MFAccountStore *result;

  result = objc_alloc_init(MFAccountStore);
  sharedAccountStore_sAccountStore = (uint64_t)result;
  return result;
}

- (ACAccountStore)persistentStore
{
  os_unfair_lock_s *p_accountStoreLock;
  ACAccountStore *v4;

  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  v4 = self->_accountStore;
  os_unfair_lock_unlock(p_accountStoreLock);
  return v4;
}

- (void)setPersistentStore:(id)a3
{
  os_unfair_lock_s *p_accountStoreLock;
  ACAccountStore *accountStore;
  _QWORD *v7;

  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  accountStore = self->_accountStore;
  if (accountStore != a3)
  {
    v7 = (_QWORD *)MEMORY[0x1E0C8F010];
    if (accountStore)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, *MEMORY[0x1E0C8F010], self->_accountStore);
      accountStore = self->_accountStore;
    }

    self->_accountStore = (ACAccountStore *)a3;
    if (a3)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__accountsStoreChanged_, *v7, a3);
  }
  os_unfair_lock_unlock(p_accountStoreLock);
}

- (id)existingAccountWithPersistentAccount:(id)a3
{
  return -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", a3, 1);
}

- (void)savePersistentAccountWithAccount:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  ACAccountStore *accountStore;
  NSObject *v10;
  _QWORD v11[7];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "persistentAccount");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "accountDescription");
    v7 = objc_msgSend(v5, "identifier");
    if (objc_msgSend(v5, "isDirty"))
    {
      v8 = dispatch_semaphore_create(0);
      accountStore = self->_accountStore;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke;
      v11[3] = &unk_1E81CAA50;
      v11[4] = v6;
      v11[5] = v7;
      v11[6] = v8;
      -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](accountStore, "saveVerifiedAccount:withCompletionHandler:", v5, v11);
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v8);
    }
    else
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "Nothing to save for account \"%@\" (%@)", buf, 0x16u);
      }
    }
  }
}

intptr_t __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = MFLogGeneral();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "Saved account \"%@\" (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke_cold_1(a1, a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removePersistentAccountWithAccount:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  ACAccountStore *accountStore;
  _QWORD v10[7];

  v4 = (void *)objc_msgSend(a3, "persistentAccount");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "accountDescription");
    v7 = objc_msgSend(v5, "identifier");
    v8 = dispatch_semaphore_create(0);
    accountStore = self->_accountStore;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke;
    v10[3] = &unk_1E81CAA50;
    v10[4] = v6;
    v10[5] = v7;
    v10[6] = v8;
    -[ACAccountStore removeAccount:withCompletionHandler:](accountStore, "removeAccount:withCompletionHandler:", v5, v10);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
  }
}

intptr_t __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = MFLogGeneral();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "Removed account \"%@\" (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke_cold_1(a1, a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_accountsStoreChanged:(id)a3
{
  NSObject *v4;

  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[MFAccountStore _accountsStoreChanged:].cold.1(a3, v4);
}

- (void)newPersistentAccountWithAccountTypeIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C8839000, a2, OS_LOG_TYPE_ERROR, "Missing account type for identifier %@", (uint8_t *)&v2, 0xCu);
}

- (void)accountsWithTypeIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v6 = objc_msgSend(*a2, "ef_publicDescription");
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1C8839000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for types [%@]: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_accountWithPersistentAccount:(void *)a1 useExisting:(id *)a2 .cold.1(void *a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "identifier");
  objc_msgSend(*a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_1(&dword_1C8839000, v3, v4, "Failed to load account for persistent account \"%@\"%s%{public}@", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C8839000, v2, v3, "Failed to save account \"%@\" (%@) error: %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

void __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C8839000, v2, v3, "Failed to remove account \"%@\" (%@) error: %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)_accountsStoreChanged:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_msgSend(a1, "name");
  _os_log_debug_impl(&dword_1C8839000, a2, OS_LOG_TYPE_DEBUG, "Received %@ notification", (uint8_t *)&v3, 0xCu);
}

@end
