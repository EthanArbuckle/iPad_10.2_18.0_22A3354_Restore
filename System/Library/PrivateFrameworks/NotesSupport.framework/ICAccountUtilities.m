@implementation ICAccountUtilities

- (id)applicationDocumentsURLForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (applicationDocumentsURLForAccountIdentifier__onceToken != -1)
    dispatch_once(&applicationDocumentsURLForAccountIdentifier__onceToken, &__block_literal_global_0);
  v5 = (id)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  objc_msgSend((id)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_1EA823D70;
    v12 = &v13;
    v11 = v4;
    -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:](self, "performBlockInPersonaContext:forAccountIdentifier:", v10, v11);

  }
  objc_sync_exit(v5);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)performBlockInPersonaContext:(id)a3 forAccountIdentifier:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  -[ICAccountUtilities iCloudACAccountWithIdentifier:](self, "iCloudACAccountWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "accountPropertyForKey:", *MEMORY[0x1E0C8EFC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v12 = (void *)getUMUserManagerClass_softClass;
  v43 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getUMUserManagerClass_block_invoke;
    v38 = &unk_1EA823E40;
    v39 = &v40;
    __getUMUserManagerClass_block_invoke((uint64_t)&v35);
    v12 = (void *)v41[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v13, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentPersona");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length")
    || !v11
    && (objc_msgSend(v14, "currentUser"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "userType"),
        v20,
        v21 != 1))
  {
    v16 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.5();

    v34 = 0;
    v17 = (void *)objc_msgSend(v15, "copyCurrentPersonaContextWithError:", &v34);
    v18 = v34;
    if (!v18)
    {
      v25 = (id)objc_msgSend(v15, "generateAndRestorePersonaContextWithPersonaUniqueString:", v11);
      v6[2](v6);
      v26 = (id)objc_msgSend(v15, "restorePersonaWithSavedPersonaContext:", v17);
      goto LABEL_19;
    }
    v19 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.1();
LABEL_9:

    v6[2](v6);
LABEL_19:

    goto LABEL_20;
  }
  v22 = objc_msgSend(v15, "isProxy");
  v23 = os_log_create("com.apple.notes", "Accounts");
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
  if (v22)
  {
    if (v24)
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.2();

    v33 = 0;
    v17 = (void *)objc_msgSend(v15, "copyCurrentPersonaContextWithError:", &v33);
    v18 = v33;
    if (!v18)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x2050000000;
      v27 = (void *)getUMUserPersonaAttributesClass_softClass;
      v43 = getUMUserPersonaAttributesClass_softClass;
      if (!getUMUserPersonaAttributesClass_softClass)
      {
        v35 = MEMORY[0x1E0C809B0];
        v36 = 3221225472;
        v37 = __getUMUserPersonaAttributesClass_block_invoke;
        v38 = &unk_1EA823E40;
        v39 = &v40;
        __getUMUserPersonaAttributesClass_block_invoke((uint64_t)&v35);
        v27 = (void *)v41[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v40, 8);
      objc_msgSend(v28, "personaAttributesForPersonaType:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userPersonaUniqueString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v15, "generateAndRestorePersonaContextWithPersonaUniqueString:", v30);

      v6[2](v6);
      v32 = (id)objc_msgSend(v15, "restorePersonaWithSavedPersonaContext:", v17);

      goto LABEL_19;
    }
    v19 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.1();
    goto LABEL_9;
  }
  if (v24)
    -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.3();

  v6[2](v6);
LABEL_20:

}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_DEBUG, "Adopting persona {persona: %@, accountID: %@}", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (id)iCloudACAccountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[ICAccountUtilities accountByIdentifier](self, "accountByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ICAccountUtilities accountStore](self, "accountStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountWithIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccountUtilities accountByIdentifier](self, "accountByIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

    }
    -[ICAccountUtilities accountByIdentifier](self, "accountByIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSMutableDictionary)accountByIdentifier
{
  return self->_accountByIdentifier;
}

void __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  ICGroupContainerIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPaths URLForGroupContainerWithIdentifier:](ICPaths, "URLForGroupContainerWithIdentifier:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend((id)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)hasSyncingAccount
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICAccountUtilities accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifiersEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)allICloudACAccounts
{
  void *v2;
  void *v3;

  -[ICAccountUtilities accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_appleAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

+ (id)sharedInstance
{
  void *v2;
  uint64_t block;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;

  block = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __36__ICAccountUtilities_sharedInstance__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &block);
  v2 = (void *)sharedInstance_sharedInstance;
  if (!sharedInstance_sharedInstance)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((sharedInstance) != nil)", "+[ICAccountUtilities sharedInstance]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "sharedInstance", block, v5, v6, v7, v8);
    v2 = (void *)sharedInstance_sharedInstance;
  }
  return v2;
}

void __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier;
  applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)v0;

}

void __36__ICAccountUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  if (!sharedInstance_sharedInstance)
  {
    v1 = objc_alloc_init(*(Class *)(a1 + 32));
    v2 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v1;

  }
}

- (ICAccountUtilities)init
{
  return (ICAccountUtilities *)-[ICAccountUtilities initForObservingAccountStoreChanges:](self, "initForObservingAccountStoreChanges:", 1);
}

- (id)initForObservingAccountStoreChanges:(BOOL)a3
{
  _BOOL4 v3;
  ICAccountUtilities *v4;
  uint64_t v5;
  ACAccountStore *accountStore;
  NSMutableDictionary *v7;
  NSMutableDictionary *accountByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *accountIsManagedByIdentifier;
  void *v11;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAccountUtilities;
  v4 = -[ICAccountUtilities init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = objc_claimAutoreleasedReturnValue();
    accountStore = v4->_accountStore;
    v4->_accountStore = (ACAccountStore *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accountByIdentifier = v4->_accountByIdentifier;
    v4->_accountByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accountIsManagedByIdentifier = v4->_accountIsManagedByIdentifier;
    v4->_accountIsManagedByIdentifier = v9;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel_accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], v4->_accountStore);

    }
  }
  return v4;
}

- (void)updateICloudACAccountFromStore
{
  void *v3;
  ACAccount *v4;
  ACAccount *primaryICloudACAccount;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[ICAccountUtilities accountStore](self, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  primaryICloudACAccount = self->_primaryICloudACAccount;
  self->_primaryICloudACAccount = v4;

  -[ICAccountUtilities setPrimaryICloudACAccountValid:](self, "setPrimaryICloudACAccountValid:", 1);
  v6 = -[ACAccount isEnabledForDataclass:](self->_primaryICloudACAccount, "isEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
  -[ACAccount objectForKeyedSubscript:](self->_primaryICloudACAccount, "objectForKeyedSubscript:", CFSTR("notesIsUsingCloudKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v13[0] = CFSTR("ICAccountUtilitiesPrimaryICloudAccountEnabledKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("ICAccountUtilitiesPrimaryICloudAccountDidChooseToMigrateKey");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountUtilities setCurrentICloudAccountState:](self, "setCurrentICloudAccountState:", v11);

  v12 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICAccountUtilities updateICloudACAccountFromStore].cold.1(self, v12);

}

- (void)setPrimaryICloudACAccountValid:(BOOL)a3
{
  self->_primaryICloudACAccountValid = a3;
}

- (void)setCurrentICloudAccountState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ACAccount)primaryICloudACAccount
{
  ICAccountUtilities *v2;
  NSObject *v3;
  ACAccount *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ICAccountUtilities isPrimaryICloudACAccountValid](v2, "isPrimaryICloudACAccountValid"))
  {
    v3 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICAccountUtilities primaryICloudACAccount].cold.1(v3);

  }
  else
  {
    -[ICAccountUtilities updateICloudACAccountFromStore](v2, "updateICloudACAccountFromStore");
  }
  v4 = v2->_primaryICloudACAccount;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isPrimaryICloudACAccountValid
{
  return self->_primaryICloudACAccountValid;
}

- (BOOL)isManagedACAccountWithIdentifier:(id)a3
{
  id v4;
  ICAccountUtilities *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_opt_class();
  -[ICAccountUtilities accountIsManagedByIdentifier](v5, "accountIsManagedByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast(v6, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    LOBYTE(v10) = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    -[ICAccountUtilities accountStore](v5, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountWithIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "ic_isManagedAppleID") & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v12, "MCIsManaged");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccountUtilities accountIsManagedByIdentifier](v5, "accountIsManagedByIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v4);

  }
  objc_sync_exit(v5);

  return v10;
}

- (NSDictionary)currentICloudAccountState
{
  return self->_currentICloudAccountState;
}

- (NSMutableDictionary)accountIsManagedByIdentifier
{
  return self->_accountIsManagedByIdentifier;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAccountUtilities;
  -[ICAccountUtilities dealloc](&v4, sel_dealloc);
}

- (id)applicationDataContainerURLForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (applicationDataContainerURLForAccountIdentifier__onceToken != -1)
    dispatch_once(&applicationDataContainerURLForAccountIdentifier__onceToken, &__block_literal_global_22);
  v5 = (id)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  objc_msgSend((id)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_1EA823D70;
    v12 = &v13;
    v11 = v4;
    -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:](self, "performBlockInPersonaContext:forAccountIdentifier:", v10, v11);

  }
  objc_sync_exit(v5);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier;
  applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)v0;

}

void __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[ICPaths applicationDataContainerURL](ICPaths, "applicationDataContainerURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend((id)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)temporaryDirectoryURLForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (temporaryDirectoryURLForAccountIdentifier__onceToken != -1)
    dispatch_once(&temporaryDirectoryURLForAccountIdentifier__onceToken, &__block_literal_global_23);
  v5 = (id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  objc_msgSend((id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_1EA823DD8;
    v10[4] = self;
    v11 = v4;
    v12 = &v13;
    -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:](self, "performBlockInPersonaContext:forAccountIdentifier:", v10, v11);

  }
  objc_sync_exit(v5);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier;
  temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)v0;

}

void __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "applicationDocumentsURLForAccountIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v2, 1, &v13);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (v5)
  {
    v8 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporaryDirectory");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend((id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (BOOL)primaryICloudAccountEnabled
{
  void *v2;
  char v3;

  -[ICAccountUtilities primaryICloudACAccount](self, "primaryICloudACAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);

  return v3;
}

- (BOOL)didChooseToMigratePrimaryICloudAccount
{
  void *v2;
  void *v3;
  char v4;

  -[ICAccountUtilities primaryICloudACAccount](self, "primaryICloudACAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notesIsUsingCloudKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)internalInvalidatePrimaryICloudACAccount
{
  ACAccount *primaryICloudACAccount;

  -[ICAccountUtilities setPrimaryICloudACAccountValid:](self, "setPrimaryICloudACAccountValid:", 0);
  primaryICloudACAccount = self->_primaryICloudACAccount;
  self->_primaryICloudACAccount = 0;

  -[ICAccountUtilities setCurrentICloudAccountState:](self, "setCurrentICloudAccountState:", 0);
}

- (void)invalidateCache
{
  void *v2;
  void *v3;
  ICAccountUtilities *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICAccountUtilities internalInvalidatePrimaryICloudACAccount](obj, "internalInvalidatePrimaryICloudACAccount");
  -[ICAccountUtilities accountByIdentifier](obj, "accountByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  -[ICAccountUtilities accountIsManagedByIdentifier](obj, "accountIsManagedByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(obj);
}

- (void)accountStoreDidChange:(id)a3
{
  ICAccountUtilities *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICAccountUtilities currentICloudAccountState](v4, "currentICloudAccountState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[ICAccountUtilities invalidateCache](v4, "invalidateCache");
  objc_sync_exit(v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICAccountUtilitiesStoreDidChangeNotification"), v4, v6);

}

- (void)createDirectoryIfNecessaryUsingURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  char v12;

  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v12);

  if (v6)
    v7 = v12 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 0, 0, &v11);
    v9 = v11;

    if (v9)
    {
      v10 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICAccountUtilities createDirectoryIfNecessaryUsingURL:].cold.1();

    }
  }

}

+ (void)registerStateHandler
{
  +[ICStateHandler addStateHandlerWithName:sysdiagnoseOnly:stateBlock:](ICStateHandler, "addStateHandlerWithName:sysdiagnoseOnly:stateBlock:", "ACAccountStore", 1, &__block_literal_global_29);
}

id __42__ICAccountUtilities_registerStateHandler__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0C8EED8];
  objc_msgSend(v0, "accountIdentifiersEnabledForDataclass:");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v28 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v0, "accountWithIdentifier:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "accountType");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          if (v9)
            v11 = (const __CFString *)v9;
          else
            v11 = &stru_1EA825738;
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("accountType"));

          objc_msgSend(v6, "username");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
            v14 = (const __CFString *)v12;
          else
            v14 = &stru_1EA825738;
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("username"));

          objc_msgSend(v6, "aa_personID");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = (const __CFString *)v15;
          else
            v17 = &stru_1EA825738;
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("dsid"));

          if (objc_msgSend(v6, "aa_isManagedAppleID"))
            v18 = CFSTR("YES");
          else
            v18 = CFSTR("NO");
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("isManaged"));
          objc_msgSend(v6, "parentAccountIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v6, "parentAccountIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("parentAccountIdentifier"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "ic_isNotesMigrated"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("notesMigrated"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isEnabledForDataclass:", v25));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("notesEnabled"));

          objc_msgSend(v26, "setObject:forKeyedSubscript:", v7, v5);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v2);
  }

  return v26;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)setAccountByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountByIdentifier, a3);
}

- (void)setAccountIsManagedByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIsManagedByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIsManagedByIdentifier, 0);
  objc_storeStrong((id *)&self->_accountByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentICloudAccountState, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_primaryICloudACAccount, 0);
}

- (void)primaryICloudACAccount
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DDAA5000, log, OS_LOG_TYPE_DEBUG, "Primary iCloud Apple Account is valid — not updating", v1, 2u);
}

void __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error creating temporary directory — falling back to system's temporary directory {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Failed to save persona context — using current persona {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, v0, v1, "Adopting personal persona {accountID: %@}", v2);
  OUTLINED_FUNCTION_1();
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, v0, v1, "Using default persona {accountID: %@}", v2);
  OUTLINED_FUNCTION_1();
}

- (void)createDirectoryIfNecessaryUsingURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_ERROR, "Could not create temporary directory {url: %@, error: %@}", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
