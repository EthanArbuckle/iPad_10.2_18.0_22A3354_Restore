@implementation AccountUtilities

void __42__AccountUtilities_sharedAccountUtilities__block_invoke()
{
  AccountUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(AccountUtilities);
  v1 = (void *)sharedAccountUtilities___sharedInstance;
  sharedAccountUtilities___sharedInstance = (uint64_t)v0;

}

- (AccountUtilities)init
{
  AccountUtilities *v2;
  dispatch_group_t v3;
  OS_dispatch_group *backgroundDispatchGroup;
  uint64_t v5;
  ACAccountStore *accountStore;
  uint64_t v7;
  NSArray *accountIDsEnabledForNotes;
  NoteContext *noteContext;
  NSLock *v10;
  NSLock *updateAccountInfosLock;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AccountUtilities;
  v2 = -[AccountUtilities init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    backgroundDispatchGroup = v2->_backgroundDispatchGroup;
    v2->_backgroundDispatchGroup = (OS_dispatch_group *)v3;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;

    -[ACAccountStore accountIdentifiersEnabledForDataclass:](v2->_accountStore, "accountIdentifiersEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
    v7 = objc_claimAutoreleasedReturnValue();
    accountIDsEnabledForNotes = v2->_accountIDsEnabledForNotes;
    v2->_accountIDsEnabledForNotes = (NSArray *)v7;

    noteContext = v2->_noteContext;
    v2->_noteContext = 0;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    updateAccountInfosLock = v2->_updateAccountInfosLock;
    v2->_updateAccountInfosLock = v10;

  }
  return v2;
}

- (void)startKeepingAccountInfosUpToDate
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], self->_accountStore);

  -[AccountUtilities updateAccountInfos](self, "updateAccountInfos");
}

- (void)updateAccountInfos
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  -[AccountUtilities backgroundDispatchGroup](self, "backgroundDispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AccountUtilities_updateAccountInfos__block_invoke;
  block[3] = &unk_1E81EAB90;
  block[4] = self;
  dispatch_group_async(v4, v3, block);

}

- (OS_dispatch_group)backgroundDispatchGroup
{
  return self->_backgroundDispatchGroup;
}

void __38__AccountUtilities_updateAccountInfos__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id obj;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateAccountInfosLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tryLock");

  if (!v3)
    return;
  objc_msgSend(*(id *)(a1 + 32), "freshContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allAccounts");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v21 = v4;
  if (!v5)
  {
    v22 = 0;
    goto LABEL_26;
  }
  v22 = 0;
  v24 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v28 != v24)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v7, "accountIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("local://local/account"));
      v10 = *(void **)(a1 + 32);
      if (v9)
      {
        if ((objc_msgSend(v10, "localNotesExist") & 1) == 0)
          goto LABEL_20;
        objc_msgSend(*(id *)(a1 + 32), "localAccountDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "accountStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountWithIdentifier:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "displayAccount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accountDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }

      }
      if (!v11)
      {
        objc_msgSend(v7, "name");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v1)
        {
LABEL_20:
          v11 = 0;
          goto LABEL_22;
        }
      }
      objc_msgSend(v7, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "isEqualToString:", v15);

      if (!v11)
      {

        if ((v16 & 1) != 0)
          goto LABEL_20;
LABEL_21:
        v22 = 1;
        objc_msgSend(v7, "setName:", v11);
        goto LABEL_22;
      }
      if ((v16 & 1) == 0)
        goto LABEL_21;
LABEL_22:

    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v5);
LABEL_26:

  v26 = 0;
  v17 = objc_msgSend(v21, "save:", &v26);
  v18 = v26;
  v19 = v18;
  if ((v17 & 1) == 0)
    NSLog(CFSTR("Failed to save after updating accounts infos: %@"), v18);

  objc_msgSend(*(id *)(a1 + 32), "updateAccountInfosLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

  if ((v22 & 1) != 0)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_23);
}

- (NSLock)updateAccountInfosLock
{
  return (NSLock *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)localNotesExist
{
  return 0;
}

+ (id)sharedAccountUtilities
{
  if (sharedAccountUtilities_onceToken != -1)
    dispatch_once(&sharedAccountUtilities_onceToken, &__block_literal_global_0);
  return (id)sharedAccountUtilities___sharedInstance;
}

- (id)freshContext
{
  return -[NoteContext initWithAccountUtilities:]([NoteContext alloc], "initWithAccountUtilities:", self);
}

- (ACAccountStore)accountStore
{
  AccountUtilities *v2;
  ACAccountStore *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_accountStore;
  objc_sync_exit(v2);

  return v3;
}

- (void)_accountStoreDidChange:(id)a3
{
  AccountUtilities *v4;
  uint64_t v5;
  NSArray *accountIDsEnabledForNotes;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ACAccountStore accountIdentifiersEnabledForDataclass:](v4->_accountStore, "accountIdentifiersEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
  v5 = objc_claimAutoreleasedReturnValue();
  accountIDsEnabledForNotes = v4->_accountIDsEnabledForNotes;
  v4->_accountIDsEnabledForNotes = (NSArray *)v5;

  objc_sync_exit(v4);
  -[AccountUtilities updateAccountInfos](v4, "updateAccountInfos");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AccountUtilities;
  -[AccountUtilities dealloc](&v4, sel_dealloc);
}

- (id)accountsEnabledForNotes
{
  id v3;
  AccountUtilities *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_accountIDsEnabledForNotes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        -[ACAccountStore accountWithIdentifier:](v4->_accountStore, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)accountIDsEnabledForNotes
{
  AccountUtilities *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_accountIDsEnabledForNotes;
  objc_sync_exit(v2);

  return v3;
}

- (id)defaultStoreSyncIdWithDesiredSyncId:(id)a3
{
  id v4;
  BOOL v5;
  AccountUtilities *v6;
  id v7;

  v4 = a3;
  v5 = -[AccountUtilities localNotesExist](self, "localNotesExist");
  v6 = self;
  objc_sync_enter(v6);
  if (!objc_msgSend(v4, "length"))
    goto LABEL_7;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceLocalAccount")))
  {
    if (!v5)
      goto LABEL_7;
  }
  else if (!-[NSArray containsObject:](v6->_accountIDsEnabledForNotes, "containsObject:", v4))
  {
LABEL_7:
    -[NSArray lastObject](v6->_accountIDsEnabledForNotes, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = v4;
  if (!v7)
    goto LABEL_7;
LABEL_8:
  objc_sync_exit(v6);

  return v7;
}

- (id)localAccountDisplayName
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getACUILocalizationClass_softClass;
  v9 = getACUILocalizationClass_softClass;
  if (!getACUILocalizationClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getACUILocalizationClass_block_invoke;
    v5[3] = &unk_1E81EACA0;
    v5[4] = &v6;
    __getACUILocalizationClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "localizedTitleForLocalSourceOfDataclass:usedAtBeginningOfSentence:", *MEMORY[0x1E0C8EED8], 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __38__AccountUtilities_updateAccountInfos__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("NotesAccountUtilitiesDidUpdateAccounts"), 0);

}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)setBackgroundDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDispatchGroup, a3);
}

- (void)setUpdateAccountInfosLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateAccountInfosLock, 0);
  objc_storeStrong((id *)&self->_backgroundDispatchGroup, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_noteContext, 0);
  objc_storeStrong((id *)&self->_accountIDsEnabledForNotes, 0);
}

@end
