@implementation CalReminderMigrationContext

- (BOOL)_tryBeginMigration
{
  BOOL v3;

  v3 = -[CalReminderMigrationContext _setup](self, "_setup");
  if (!v3)
    -[CalReminderMigrationContext finishMigrationWithSave:](self, "finishMigrationWithSave:", 0);
  return v3;
}

- (id)_initWithReminderKitProvider:(id)a3
{
  id v5;
  CalReminderMigrationContext *v6;
  CalReminderMigrationContext *v7;
  uint64_t v8;
  CalReminderKitDatabaseMigrationContext *remDatabaseMigrationContext;
  uint64_t v10;
  NSMutableArray *orderedListChangeItemsStack;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalReminderMigrationContext;
  v6 = -[CalReminderMigrationContext init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reminderKitProvider, a3);
    v8 = objc_msgSend(v5, "newDatabaseMigrationContext");
    remDatabaseMigrationContext = v7->_remDatabaseMigrationContext;
    v7->_remDatabaseMigrationContext = (CalReminderKitDatabaseMigrationContext *)v8;

    v10 = objc_opt_new();
    orderedListChangeItemsStack = v7->_orderedListChangeItemsStack;
    v7->_orderedListChangeItemsStack = (NSMutableArray *)v10;

  }
  return v7;
}

- (void)_willBeginMigration
{
  -[CalReminderKitDatabaseMigrationContext willBeginMigration](self->_remDatabaseMigrationContext, "willBeginMigration");
}

- (BOOL)_setup
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CalReminderMigrationContext shouldPerformMigration](self, "shouldPerformMigration"))
    return 1;
  -[CalReminderMigrationContext _willBeginMigration](self, "_willBeginMigration");
  -[CalReminderMigrationContext reminderStore](self, "reminderStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CalReminderMigrationContext saveRequest](self, "saveRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)ensureAccountsExist:(id)a3
{
  CalReminderKitDatabaseMigrationContext *remDatabaseMigrationContext;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  remDatabaseMigrationContext = self->_remDatabaseMigrationContext;
  v9 = 0;
  v5 = -[CalReminderKitDatabaseMigrationContext ensureAccountsExist:error:](remDatabaseMigrationContext, "ensureAccountsExist:error:", a3, &v9);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CalReminderMigrationContext ensureAccountsExist:].cold.1();

    -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to create accounts"), 2, v6);
  }

  return v5;
}

- (BOOL)shouldPerformMigration
{
  return -[CalReminderKitDatabaseMigrationContext shouldPerformMigration](self->_remDatabaseMigrationContext, "shouldPerformMigration");
}

- (BOOL)shouldDeleteMigratedData
{
  return -[CalReminderKitDatabaseMigrationContext shouldDeleteMigratedData](self->_remDatabaseMigrationContext, "shouldDeleteMigratedData");
}

- (id)reminderStore
{
  REMStore *reminderStore;
  REMStore *v4;
  REMStore *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  reminderStore = self->_reminderStore;
  if (!reminderStore)
  {
    -[CalReminderKitDatabaseMigrationContext reminderStore](self->_remDatabaseMigrationContext, "reminderStore");
    v4 = (REMStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_reminderStore;
    self->_reminderStore = v4;

    reminderStore = self->_reminderStore;
    if (!reminderStore)
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CalReminderMigrationContext reminderStore].cold.1(v6, v7, v8);

      -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to get reminder store"), 1, 0);
      reminderStore = self->_reminderStore;
    }
  }
  return reminderStore;
}

- (REMSaveRequest)saveRequest
{
  REMSaveRequest *saveRequest;
  void *v4;
  void *v5;
  REMSaveRequest *v6;
  REMSaveRequest *v7;
  REMSaveRequest *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  saveRequest = self->_saveRequest;
  if (!saveRequest)
  {
    -[CalReminderMigrationContext reminderKitProvider](self, "reminderKitProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalReminderMigrationContext reminderStore](self, "reminderStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (REMSaveRequest *)objc_msgSend(v4, "newSaveRequestWithStore:", v5);
    v7 = self->_saveRequest;
    self->_saveRequest = v6;

    v8 = self->_saveRequest;
    if (!v8)
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CalReminderMigrationContext saveRequest].cold.1(v9, v10, v11);

      -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to create save request"), 1, 0);
      v8 = self->_saveRequest;
    }
    -[REMSaveRequest setAuthor:](v8, "setAuthor:", *MEMORY[0x24BE14078]);
    -[REMSaveRequest setCloneCompletedRecurrentRemindersAtSave:](self->_saveRequest, "setCloneCompletedRecurrentRemindersAtSave:", 0);
    saveRequest = self->_saveRequest;
  }
  return saveRequest;
}

- (REMAccountChangeItem)localAccountChangeItem
{
  REMAccountChangeItem *localAccountChangeItem;
  void *v4;
  REMAccountChangeItem *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  REMAccountChangeItem *v9;

  localAccountChangeItem = self->_localAccountChangeItem;
  if (!localAccountChangeItem)
  {
    -[CalReminderMigrationContext _loadAccountsIfNeeded](self, "_loadAccountsIfNeeded");
    if (self->_localAccount)
    {
      -[CalReminderMigrationContext saveRequest](self, "saveRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateAccount:", self->_localAccount);
      v5 = (REMAccountChangeItem *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CalReminderMigrationContext localAccountChangeItem].cold.1(v6, v7, v8);

      -[CalReminderMigrationContext saveRequest](self, "saveRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_addAccountWithType:name:", 1, CFSTR("Local"));
      v5 = (REMAccountChangeItem *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_localAccountChangeItem;
    self->_localAccountChangeItem = v5;

    localAccountChangeItem = self->_localAccountChangeItem;
  }
  return localAccountChangeItem;
}

- (id)existingAccountChangeItemWithAccountIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *accountChangeItemsForAccountIdentifiers;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  accountChangeItemsForAccountIdentifiers = self->_accountChangeItemsForAccountIdentifiers;
  if (!accountChangeItemsForAccountIdentifiers)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_accountChangeItemsForAccountIdentifiers;
    self->_accountChangeItemsForAccountIdentifiers = v6;

    accountChangeItemsForAccountIdentifiers = self->_accountChangeItemsForAccountIdentifiers;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](accountChangeItemsForAccountIdentifiers, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[CalReminderMigrationContext accountsForAccountIdentifiers](self, "accountsForAccountIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CalReminderMigrationContext saveRequest](self, "saveRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateAccount:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountChangeItemsForAccountIdentifiers, "setObject:forKeyedSubscript:", v8, v4);
      }
      else
      {
        +[CalMigrationLog reminders](CalMigrationLog, "reminders");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CalReminderMigrationContext existingAccountChangeItemWithAccountIdentifier:].cold.2();

      }
      -[CalReminderMigrationContext _verifyAccountHasNoLists:withAccountIdentifier:](self, "_verifyAccountHasNoLists:withAccountIdentifier:", v10, v4);
    }
    else
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CalReminderMigrationContext existingAccountChangeItemWithAccountIdentifier:].cold.1();

      v8 = 0;
    }

  }
  return v8;
}

- (void)_verifyAccountHasNoLists:(id)a3 withAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  objc_msgSend(v6, "fetchListsWithError:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalReminderMigrationContext _verifyAccountHasNoLists:withAccountIdentifier:].cold.2((uint64_t)v7, v6, v10);

  }
  if (objc_msgSend(v8, "count"))
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CalReminderMigrationContext _verifyAccountHasNoLists:withAccountIdentifier:].cold.1();

    -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", CFSTR("Migrating data into account with existing lists"), 2, 0, v7);
  }

}

- (id)accountsForAccountIdentifiers
{
  -[CalReminderMigrationContext _loadAccountsIfNeeded](self, "_loadAccountsIfNeeded");
  return self->_accountsForAccountIdentifiers;
}

- (void)_loadAccountsIfNeeded
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_1(&dword_215A53000, a3, (uint64_t)a3, "Found multiple local accounts. Picking the first one.", a1);
}

- (void)recordAddedListChangeItem:(id)a3 withOriginalIdentifier:(id)a4 order:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  REMObjectID *v14;
  REMObjectID *defaultListMigratedIdentifier;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[CalReminderMigrationContext defaultListOriginalIdentifier](self, "defaultListOriginalIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[CalReminderMigrationContext defaultListOriginalIdentifier](self, "defaultListOriginalIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "isEqualToString:", v12);

      if (v13)
      {
        objc_msgSend(v19, "objectID");
        v14 = (REMObjectID *)objc_claimAutoreleasedReturnValue();
        defaultListMigratedIdentifier = self->_defaultListMigratedIdentifier;
        self->_defaultListMigratedIdentifier = v14;

      }
    }
  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setListChangeItem:", v19);
  if (v9)
    v17 = objc_msgSend(v9, "integerValue");
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v16, "setOrder:", v17);
  -[NSMutableArray lastObject](self->_orderedListChangeItemsStack, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v16);

}

- (void)pushOrderedListItemsContext
{
  NSMutableArray *orderedListChangeItemsStack;
  id v3;

  orderedListChangeItemsStack = self->_orderedListChangeItemsStack;
  v3 = (id)objc_opt_new();
  -[NSMutableArray addObject:](orderedListChangeItemsStack, "addObject:", v3);

}

- (void)popOrderedListItemsContextAndSortListsInAccountChangeItem:(id)a3
{
  -[CalReminderMigrationContext _sortAddedReminderListsInAccountChangeItem:](self, "_sortAddedReminderListsInAccountChangeItem:", a3);
  -[NSMutableArray removeLastObject](self->_orderedListChangeItemsStack, "removeLastObject");
}

- (BOOL)isCurrentOrderedListItemsContextEmpty
{
  void *v2;
  BOOL v3;

  -[NSMutableArray lastObject](self->_orderedListChangeItemsStack, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)_sortAddedReminderListsInAccountChangeItem:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CalReminderMigrationContext _sortedAddedListChangeItems](self, "_sortedAddedListChangeItems");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    v11 = 0x24D3F4000uLL;
    *(_QWORD *)&v6 = 138413314;
    v20 = v6;
    v21 = v4;
    do
    {
      v12 = 0;
      v13 = v9;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_msgSend(v14, "listChangeItem", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "order");
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          ++v8;
        else
          v8 = v15;
        objc_msgSend(*(id *)(v11 + 1080), "reminders");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v20;
          v30 = v24;
          v31 = 2114;
          v32 = v17;
          v33 = 2112;
          v34 = v18;
          v35 = 2114;
          v36 = v19;
          v37 = 2048;
          v38 = v8;
          _os_log_impl(&dword_215A53000, v16, OS_LOG_TYPE_DEFAULT, "Inserting List \"%@\" (%{public}@) after list \"%@\" (%{public}@) and assigning it order %li", buf, 0x34u);

          v7 = v22;
          v11 = 0x24D3F4000;

          v4 = v21;
        }

        objc_msgSend(v9, "setDaDisplayOrder:", v8);
        objc_msgSend(v4, "insertListChangeItem:afterListChangeItem:", v9, v13);

        ++v12;
        v13 = v9;
      }
      while (v7 != v12);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    }
    while (v7);

  }
}

- (id)_sortedAddedListChangeItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("order"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray lastObject](self->_orderedListChangeItemsStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordMigrationFailureWithDescription:(id)a3 inStage:(unint64_t)a4 underlyingError:(id)a5 relatedTo:(id)a6 isFatal:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  CalMigrationFailure *v15;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = -[CalMigrationFailure initWithDescription:stage:underlyingError:relatedPath:isFatal:]([CalMigrationFailure alloc], "initWithDescription:stage:underlyingError:relatedPath:isFatal:", v14, a4, v13, v12, v7);

  -[CalReminderKitDatabaseMigrationContext recordMigrationFailure:](self->_remDatabaseMigrationContext, "recordMigrationFailure:", v15);
  if (v7)
    self->_recordedAnyFatalFailures = 1;

}

- (void)recordMigrationFailureWithDescription:(id)a3 inStage:(unint64_t)a4 underlyingError:(id)a5 relatedTo:(id)a6
{
  -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:isFatal:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:isFatal:", a3, a4, a5, a6, 1);
}

- (void)recordMigrationFailureWithDescription:(id)a3 inStage:(unint64_t)a4 underlyingError:(id)a5
{
  -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", a3, a4, a5, 0);
}

- (void)_didEndMigrationWithSuccess:(BOOL)a3
{
  -[CalReminderKitDatabaseMigrationContext didEndMigrationWithSuccess:](self->_remDatabaseMigrationContext, "didEndMigrationWithSuccess:", a3);
}

- (BOOL)finishMigrationWithSave:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  _BOOL4 recordedAnyFatalFailures;
  void *v9;
  REMObjectID *defaultListMigratedIdentifier;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CalReminderMigrationContext saveRequest](self, "saveRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v5 = objc_msgSend(v4, "saveSynchronouslyWithError:", &v17);
    v6 = v17;

    if ((v5 & 1) == 0)
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CalReminderMigrationContext finishMigrationWithSave:].cold.2();

      -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to save reminder store"), 5, v6);
    }
  }
  else
  {
    v6 = 0;
  }
  recordedAnyFatalFailures = self->_recordedAnyFatalFailures;
  if (!self->_recordedAnyFatalFailures)
  {
    -[CalReminderMigrationContext defaultListOriginalIdentifier](self, "defaultListOriginalIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      defaultListMigratedIdentifier = self->_defaultListMigratedIdentifier;
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (defaultListMigratedIdentifier)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[CalReminderMigrationContext defaultListOriginalIdentifier](self, "defaultListOriginalIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalReminderMigrationContext defaultListMigratedIdentifier](self, "defaultListMigratedIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v19 = v13;
          v20 = 2114;
          v21 = v14;
          _os_log_impl(&dword_215A53000, v12, OS_LOG_TYPE_DEFAULT, "Migrating default reminder list with original identifier %{public}@ and migrated identifier %{public}@", buf, 0x16u);

        }
        -[CalReminderMigrationContext reminderKitProvider](self, "reminderKitProvider");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject setDefaultReminderListIdentifier:](v15, "setDefaultReminderListIdentifier:", self->_defaultListMigratedIdentifier);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CalReminderMigrationContext finishMigrationWithSave:].cold.1(self, v12);

        -[CalReminderMigrationContext defaultListOriginalIdentifier](self, "defaultListOriginalIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        -[CalReminderMigrationContext recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:isFatal:](self, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:isFatal:", CFSTR("Failed to find migrated default reminder list"), 5, 0, v15, 0);
      }
    }
    else
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A53000, v15, OS_LOG_TYPE_DEFAULT, "No default reminder list was set.", buf, 2u);
      }
    }

  }
  -[CalReminderMigrationContext _didEndMigrationWithSuccess:](self, "_didEndMigrationWithSuccess:", !recordedAnyFatalFailures);

  return !recordedAnyFatalFailures;
}

- (CalReminderKitProvider)reminderKitProvider
{
  return self->_reminderKitProvider;
}

- (NSString)defaultListOriginalIdentifier
{
  return self->_defaultListOriginalIdentifier;
}

- (void)setDefaultListOriginalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultListOriginalIdentifier, a3);
}

- (REMObjectID)defaultListMigratedIdentifier
{
  return self->_defaultListMigratedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultListOriginalIdentifier, 0);
  objc_storeStrong((id *)&self->_reminderKitProvider, 0);
  objc_storeStrong((id *)&self->_accountChangeItemsForAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_accountsForAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedListChangeItemsStack, 0);
  objc_storeStrong((id *)&self->_defaultListMigratedIdentifier, 0);
  objc_storeStrong((id *)&self->_localAccountChangeItem, 0);
  objc_storeStrong((id *)&self->_saveRequest, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_remDatabaseMigrationContext, 0);
}

- (void)ensureAccountsExist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to create accounts. error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)reminderStore
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_1(&dword_215A53000, a1, a3, "Failed to get reminder store", v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)saveRequest
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_1(&dword_215A53000, a1, a3, "Failed to create save request.", v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)localAccountChangeItem
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_1(&dword_215A53000, a1, a3, "Failed to find an existing local account. Creating one.", v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)existingAccountChangeItemWithAccountIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to get existing account with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)existingAccountChangeItemWithAccountIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to create change item for account with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_verifyAccountHasNoLists:withAccountIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Migrating data into account with existing lists. accountIdentifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_verifyAccountHasNoLists:(NSObject *)a3 withAccountIdentifier:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_215A53000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch lists for account with identifier = %{public}@, objectID = %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)finishMigrationWithSave:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "defaultListOriginalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_215A53000, a2, OS_LOG_TYPE_ERROR, "Failed to find migrated default reminder list with original identifier %{public}@", v4, 0xCu);

}

- (void)finishMigrationWithSave:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to save reminder store: error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
